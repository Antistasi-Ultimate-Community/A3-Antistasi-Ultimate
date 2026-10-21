// Antistasi Bazaar - preInit
// Runs on every machine before mission init.

ABZ_vendors = [];		// server: vendor entries (plain arrays - see fn_vendorCreate for the layout)
ABZ_vendorObjs = createHashMap;	// server: vendor id -> [unit, [props]]
ABZ_crates = [];		// server: live sealed bulk crates in the world
ABZ_pool = [];			// server: sellable catalog [class, basePrice, tier, kind, subtype]
ABZ_poolSource = "";		// server: "factions" or "configs"
ABZ_saveDirty = false;
ABZ_loaded = false;
ABZ_nextId = 0;
ABZ_crateClass = "Land_PlasticCase_01_large_F";	// sealed bulk crate - Antistasi's logistics knows how to load this one
ABZ_nameCache = createHashMap;
ABZ_boatRange = 450;		// boats only at stalls this close to deep water, moored within it (inside Antistasi's 500m cleanup radius)
ABZ_vehPool = [];		// server: military vehicles [class, category, source side var] (fn_buildVehPool)
ABZ_nearTraders = [];		// client: trader units within 50m, refreshed by the keeper loop
ABZ_shopPending = -1;		// client: > 0 while a Browse request waits for its answer (fn_openShop)
if (isNil "ABZ_stalls") then { ABZ_stalls = [] };	// server-published [[id, posATL], ...] (fn_publishStalls)

// v1.1.0
ABZ_runs = [];			// server: active smuggling runs (see fn_serverRunAccept for the layout)
ABZ_nextRunId = 0;		// server
ABZ_runNews = [];		// server: [[time, text], ...] newest last - shown in the rumours
ABZ_receipts = createHashMap;	// server: player UID -> buy-back receipts (fn_serverBuy / fn_serverSell)
if (isNil "ABZ_runsPub") then { ABZ_runsPub = [] };	// server-published [[uid, runId, destId], ...] (fn_runPublish)
ABZ_myReceipts = [];		// client: [[traderId, class, qtyLeft, unitPrice, expiresAt (client time)], ...]
ABZ_myRunDest = -1;		// client: destination trader id of my active run (keeper loop)
ABZ_unpackHere = 0;		// client: sealed crates within 20m while at HQ (keeper loop)
ABZ_wantedMax = 10;		// client: Wanted List pins

// Antistasi Ultimate's Arms Dealer price list (HALs store): lowercase class
// -> [cheapest listed price, dearest listed price]. Read from config, so it
// is identical on every machine. See fn_dealerPrice.
ABZ_dealerList = createHashMap;
private _halsCats = configFile >> "cfgHALsAddons" >> "cfgHALsStore" >> "categories";
if (isClass _halsCats) then {
	{
		{
			private _pr = getNumber (_x >> "price");
			if (_pr > 0) then {
				private _k = toLower (configName _x);
				private _old = ABZ_dealerList getOrDefault [_k, [_pr, _pr]];
				ABZ_dealerList set [_k, [(_old select 0) min _pr, (_old select 1) max _pr]];
			};
		} forEach ("true" configClasses _x);
	} forEach ("true" configClasses _halsCats);
};

// shop categories - fn_shopFillList relies on this order (SELL must stay last)
ABZ_shopCats = ["Everything", "Weapons", "Ammo & Explosives", "Gear", "Clothing", "Bulk Crates", "Vehicles", "Smuggling Run", "Wanted List", "SELL from vehicle / crate", "SELL your gear"];
ABZ_catRun = 7;
ABZ_catWanted = 8;
ABZ_catSellCargo = 9;	// v1.1.1

// military vehicle categories: [name shown, rarity tier, roll weight, heavy (gets likelier with the war)]
ABZ_vehCats = createHashMapFromArray [
	["UNARMEDCAR", ["Unarmed military vehicle", 0, 30, false]],
	["ARMEDCAR", ["Armed light vehicle", 1, 25, false]],
	["BOAT", ["Boat", 1, 12, false]],
	["APC", ["APC / IFV", 2, 15, true]],
	["HELI", ["Helicopter", 2, 10, true]],
	["AA", ["Anti-air vehicle", 3, 4, true]],
	["TANK", ["Tank", 3, 6, true]]
];

// --- CBA event network layer ---
// (CBA events instead of remoteExec: Antistasi missions restrict remoteExec
//  via CfgRemoteExec, which would silently block custom function calls.)
if (isServer) then {
	// every handler runs in one uninterrupted step (isNil): a remote client's
	// event already does, but on a player-hosted server the host's own events
	// run in the caller's context - and scroll actions are scheduled
	["ABZ_shopReq", { isNil { _this call ABZ_fnc_serverShopReq } }] call CBA_fnc_addEventHandler;
	["ABZ_buy", { isNil { _this call ABZ_fnc_serverBuy } }] call CBA_fnc_addEventHandler;
	["ABZ_sell", { isNil { _this call ABZ_fnc_serverSell } }] call CBA_fnc_addEventHandler;
	["ABZ_unpack", { isNil { _this call ABZ_fnc_serverUnpack } }] call CBA_fnc_addEventHandler;
	["ABZ_rumours", { isNil { _this call ABZ_fnc_serverRumours } }] call CBA_fnc_addEventHandler;
	["ABZ_reset", { isNil { _this call ABZ_fnc_serverReset } }] call CBA_fnc_addEventHandler;
	["ABZ_crateLoad", { isNil { _this call ABZ_fnc_serverCrateLoad } }] call CBA_fnc_addEventHandler;
	["ABZ_crateUnload", { isNil { _this call ABZ_fnc_serverCrateUnload } }] call CBA_fnc_addEventHandler;
	["ABZ_runAccept", { isNil { _this call ABZ_fnc_serverRunAccept } }] call CBA_fnc_addEventHandler;
	["ABZ_runDeliver", { isNil { _this call ABZ_fnc_serverRunDeliver } }] call CBA_fnc_addEventHandler;
	["ABZ_unpackAll", { isNil { _this call ABZ_fnc_serverUnpackAll } }] call CBA_fnc_addEventHandler;
	["ABZ_sellCargo", { isNil { _this call ABZ_fnc_serverSellCargo } }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	["ABZ_notify", { params ["_msg"]; [_msg] call ABZ_fnc_notify }] call CBA_fnc_addEventHandler;
	// the server's answer "no" to a Browse request: ends the pending request
	// (only the request it belongs to - a late "no" never cancels a newer Browse)
	["ABZ_shopRefused", {
		params [["_msg", "", [""]], ["_tok", -1, [0]]];
		if (_tok isEqualTo (missionNamespace getVariable ["ABZ_shopReqTok", -2])) then { ABZ_shopPending = -1 };
		[_msg] call ABZ_fnc_notify;
	}] call CBA_fnc_addEventHandler;
	["ABZ_chat", { params ["_msg"]; systemChat _msg }] call CBA_fnc_addEventHandler;
	["ABZ_shopData", { _this call ABZ_fnc_shopFill }] call CBA_fnc_addEventHandler;
	["ABZ_give", { _this call ABZ_fnc_receiveItems }] call CBA_fnc_addEventHandler;
	["ABZ_rumourData", {
		params [["_text", "", [""]]];
		// through Antistasi's own notification queue when it's there - a plain
		// hint gets painted over by Antistasi's hint renderer
		if (!isNil "A3A_fnc_customHint") then {
			if (!isNil "A3A_customHint_MSGs" && {A3A_customHint_MSGs isEqualType []}) then {
				private _old = A3A_customHint_MSGs findIf { (_x param [0, ""]) isEqualTo "Bazaar rumours" };
				if (_old > -1) then { A3A_customHint_MSGs deleteAt _old };
			};
			["Bazaar rumours", _text, true] call A3A_fnc_customHint;
		} else {
			hint parseText _text;
		};
	}] call CBA_fnc_addEventHandler;
	// a trader rolled stock / a job, or something landed on a table: check it
	// against my Wanted List
	["ABZ_rolled", { _this call ABZ_fnc_wantedCheck }] call CBA_fnc_addEventHandler;
	// my buy-back receipts (server time converted to my clock)
	["ABZ_receipts", {
		params [["_list", [], [[]]]];
		ABZ_myReceipts = (_list select { _x isEqualType [] && {count _x >= 5} }) apply {
			_x params ["_tid", "_cls", "_q", "_pr", "_secs"];
			[_tid, _cls, _q, _pr, time + _secs]
		};
		if (!isNull (findDisplay 78800)) then { call ABZ_fnc_shopFillList };
	}] call CBA_fnc_addEventHandler;
	// a smuggling run's destination on my map (until it ends)
	["ABZ_runMark", {
		params [["_pos", [], [[]]], ["_text", "", [""]]];
		deleteMarkerLocal "ABZ_myrun";
		// the run ended (delivered, failed, called off): an open menu forgets it
		if (count _pos < 2) then {
			private _s = uiNamespace getVariable ["ABZ_shop", []];
			if (count _s > 7 && {(_s select 7) isEqualType []} && {count (_s select 7) > 1}) then {
				(_s select 7) set [1, []];
				if (!isNull (findDisplay 78800)) then { call ABZ_fnc_shopFillList };
			};
		};
		if (count _pos >= 2) then {
			createMarkerLocal ["ABZ_myrun", _pos];
			"ABZ_myrun" setMarkerTypeLocal "mil_end";
			"ABZ_myrun" setMarkerColorLocal "ColorOrange";
			"ABZ_myrun" setMarkerTextLocal _text;
		};
	}] call CBA_fnc_addEventHandler;
	// a bought vehicle: mark it on the buyer's map for 15 minutes
	["ABZ_vehMark", {
		params [["_pos", [0, 0, 0], [[]]], ["_name", "", [""]]];
		private _m = format ["ABZ_myveh_%1_%2", round time, floor random 10000];
		createMarkerLocal [_m, _pos];
		_m setMarkerTypeLocal "mil_pickup";
		_m setMarkerColorLocal "ColorOrange";
		_m setMarkerTextLocal format ["Bazaar: %1", _name];
		[_m] spawn { params ["_m"]; sleep 900; deleteMarkerLocal _m };
	}] call CBA_fnc_addEventHandler;
};

// --- CBA settings (server-synced) ---
// Subcategories use CBA's documented "Category|Subcategory" pipe syntax.

// GENERAL
// a price setting changed mid-mission: rows already on the tables are
// brought up to the new rules (never down) on the server - fn_repriceRows
private _abzReprice = {
	if (isServer && {isNil "ABZ_repricePending"}) then {
		ABZ_repricePending = true;	// several settings changed at once: one pass
		[{
			ABZ_repricePending = nil;
			if ((call ABZ_fnc_repriceRows) > 0) then { call ABZ_fnc_queueSave };
		}] call CBA_fnc_execNextFrame;
	};
};

// v1.1.2 - per client (isGlobal 0): the dialog's fonts read it (config.cpp ABZ_S)
[
	"ABZ_uiScale", "SLIDER",
	["$STR_A3U_Bazaar_Settings_UIScale", "$STR_A3U_Bazaar_Settings_UIScale_Tooltip"],
	"Antistasi Bazaar|General",
	[0.7, 1.8, 1, 2],
	0, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vendorCount", "SLIDER",
	["$STR_A3U_Bazaar_Settings_VendorCount", "$STR_A3U_Bazaar_Settings_VendorCount_Tooltip"],
	"Antistasi Bazaar|General",
	[1, 8, 3, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_rotationMinutes", "SLIDER",
	["$STR_A3U_Bazaar_Settings_RotationMinutes", "$STR_A3U_Bazaar_Settings_RotationMinutes_Tooltip"],
	"Antistasi Bazaar|General",
	[5, 360, 90, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_relocateEvery", "SLIDER",
	["$STR_A3U_Bazaar_Settings_RelocateEvery", "$STR_A3U_Bazaar_Settings_RelocateEvery_Tooltip"],
	"Antistasi Bazaar|General",
	[0, 20, 3, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_markerMode", "LIST",
	["$STR_A3U_Bazaar_Settings_MarkerMode", "$STR_A3U_Bazaar_Settings_MarkerMode_Tooltip"],
	"Antistasi Bazaar|General",
	[[0, 1, 2], ["$STR_A3U_Bazaar_Settings_MarkerMode_None", "$STR_A3U_Bazaar_Settings_MarkerMode_Town", "$STR_A3U_Bazaar_Settings_MarkerMode_Exact"], 1],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_announce", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_Announce", "$STR_A3U_Bazaar_Settings_Announce_Tooltip"],
	"Antistasi Bazaar|General",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_persistence", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_Persistence", "$STR_A3U_Bazaar_Settings_Persistence_Tooltip"],
	"Antistasi Bazaar|General",
	true,
	1, {}
] call CBA_fnc_addSetting;

// STOCK
[
	"ABZ_stockSource", "LIST",
	["$STR_A3U_Bazaar_Settings_StockSource", "$STR_A3U_Bazaar_Settings_StockSource_Tooltip"],
	"Antistasi Bazaar|Stock",
	[[0, 1], ["$STR_A3U_Bazaar_Settings_StockSource_Factions", "$STR_A3U_Bazaar_Settings_StockSource_Everything"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_slotCount", "SLIDER",
	["$STR_A3U_Bazaar_Settings_SlotCount", "$STR_A3U_Bazaar_Settings_SlotCount_Tooltip"],
	"Antistasi Bazaar|Stock",
	[4, 24, 12, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkSlots", "SLIDER",
	["$STR_A3U_Bazaar_Settings_BulkSlots", "$STR_A3U_Bazaar_Settings_BulkSlots_Tooltip"],
	"Antistasi Bazaar|Stock",
	[0, 4, 2, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkSize", "SLIDER",
	["$STR_A3U_Bazaar_Settings_BulkSize", "$STR_A3U_Bazaar_Settings_BulkSize_Tooltip"],
	"Antistasi Bazaar|Stock",
	[0, 100, 0, 0],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_tierScaling", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_TierScaling", "$STR_A3U_Bazaar_Settings_TierScaling_Tooltip"],
	"Antistasi Bazaar|Stock",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkUnlockAnyway", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_BulkUnlockAnyway", "$STR_A3U_Bazaar_Settings_BulkUnlockAnyway_Tooltip"],
	"Antistasi Bazaar|Stock",
	false,
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_bulkUnlockedToo", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_BulkUnlockedToo", "$STR_A3U_Bazaar_Settings_BulkUnlockedToo_Tooltip"],
	"Antistasi Bazaar|Stock",
	false,
	1, {}
] call CBA_fnc_addSetting;

// JOBS
[
	"ABZ_jobs", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_Jobs", "$STR_A3U_Bazaar_Settings_Jobs_Tooltip"],
	"Antistasi Bazaar|Jobs",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_jobReward", "SLIDER",
	["$STR_A3U_Bazaar_Settings_JobReward", "$STR_A3U_Bazaar_Settings_JobReward_Tooltip"],
	"Antistasi Bazaar|Jobs",
	[0.5, 3, 1.5, 2],
	1, {}
] call CBA_fnc_addSetting;

// VEHICLES
[
	"ABZ_vehSlots", "SLIDER",
	["$STR_A3U_Bazaar_Settings_VehSlots", "$STR_A3U_Bazaar_Settings_VehSlots_Tooltip"],
	"Antistasi Bazaar|Vehicles",
	[0, 4, 2, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehRequirements", "LIST",
	["$STR_A3U_Bazaar_Settings_VehRequirements", "$STR_A3U_Bazaar_Settings_VehRequirements_Tooltip"],
	"Antistasi Bazaar|Vehicles",
	[[0, 1], ["$STR_A3U_Bazaar_Settings_VehRequirements_Same", "$STR_A3U_Bazaar_Settings_VehRequirements_None"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehDelivery", "LIST",
	["$STR_A3U_Bazaar_Settings_VehDelivery", "$STR_A3U_Bazaar_Settings_VehDelivery_Tooltip"],
	"Antistasi Bazaar|Vehicles",
	[[0, 1], ["$STR_A3U_Bazaar_Settings_VehDelivery_Parked", "$STR_A3U_Bazaar_Settings_VehDelivery_HQ"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehMarkup", "SLIDER",
	["$STR_A3U_Bazaar_Settings_VehMarkup", "$STR_A3U_Bazaar_Settings_VehMarkup_Tooltip"],
	"Antistasi Bazaar|Vehicles",
	[0.25, 3, 1, 2],
	1, {}
] call CBA_fnc_addSetting;

// MONEY
[
	"ABZ_priceMultiplier", "SLIDER",
	["$STR_A3U_Bazaar_Settings_PriceMultiplier", "$STR_A3U_Bazaar_Settings_PriceMultiplier_Tooltip"],
	"Antistasi Bazaar|Money",
	[0, 10, 1, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_sellFraction", "SLIDER",
	["$STR_A3U_Bazaar_Settings_SellFraction", "$STR_A3U_Bazaar_Settings_SellFraction_Tooltip"],
	"Antistasi Bazaar|Money",
	[0, 1, 0.3, 2],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkMultiplier", "SLIDER",
	["$STR_A3U_Bazaar_Settings_BulkMultiplier", "$STR_A3U_Bazaar_Settings_BulkMultiplier_Tooltip"],
	"Antistasi Bazaar|Money",
	[0.5, 5, 1.5, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_bulkDiscount", "SLIDER",
	["$STR_A3U_Bazaar_Settings_BulkDiscount", "$STR_A3U_Bazaar_Settings_BulkDiscount_Tooltip"],
	"Antistasi Bazaar|Money",
	[0.2, 2, 0.6, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_funds", "LIST",
	["$STR_A3U_Bazaar_Settings_Funds", "$STR_A3U_Bazaar_Settings_Funds_Tooltip"],
	"Antistasi Bazaar|Money",
	[[0, 1], ["$STR_A3U_Bazaar_Settings_Funds_Personal", "$STR_A3U_Bazaar_Settings_Funds_Faction"], 0],
	1, {}
] call CBA_fnc_addSetting;

// RISK
[
	"ABZ_undercoverMode", "LIST",
	["$STR_A3U_Bazaar_Settings_UndercoverMode", "$STR_A3U_Bazaar_Settings_UndercoverMode_Tooltip"],
	"Antistasi Bazaar|Risk",
	[[0, 1, 2], ["$STR_A3U_Bazaar_Settings_UndercoverMode_Never", "$STR_A3U_Bazaar_Settings_UndercoverMode_Always", "$STR_A3U_Bazaar_Settings_UndercoverMode_NotInRebelTowns"], 1],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_enemyRadius", "SLIDER",
	["$STR_A3U_Bazaar_Settings_EnemyRadius", "$STR_A3U_Bazaar_Settings_EnemyRadius_Tooltip"],
	"Antistasi Bazaar|Risk",
	[0, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_seizure", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_Seizure", "$STR_A3U_Bazaar_Settings_Seizure_Tooltip"],
	"Antistasi Bazaar|Risk",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_seizureSeconds", "SLIDER",
	["$STR_A3U_Bazaar_Settings_SeizureSeconds", "$STR_A3U_Bazaar_Settings_SeizureSeconds_Tooltip"],
	"Antistasi Bazaar|Risk",
	[15, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

// MONEY (v1.1.0)
[
	"ABZ_buyBackSeconds", "SLIDER",
	["$STR_A3U_Bazaar_Settings_BuyBackSeconds", "$STR_A3U_Bazaar_Settings_BuyBackSeconds_Tooltip"],
	"Antistasi Bazaar|Money",
	[0, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

// SMUGGLING RUNS (v1.1.0)
[
	"ABZ_runsEnabled", "CHECKBOX",
	["$STR_A3U_Bazaar_Settings_RunsEnabled", "$STR_A3U_Bazaar_Settings_RunsEnabled_Tooltip"],
	"Antistasi Bazaar|Smuggling Runs",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_runPayout", "SLIDER",
	["$STR_A3U_Bazaar_Settings_RunPayout", "$STR_A3U_Bazaar_Settings_RunPayout_Tooltip"],
	"Antistasi Bazaar|Smuggling Runs",
	[0.25, 3, 1, 2],
	1, {}
] call CBA_fnc_addSetting;

// PROGRESSION (v1.1.0)
[
	"ABZ_progression", "LIST",
	["$STR_A3U_Bazaar_Settings_Progression", "$STR_A3U_Bazaar_Settings_Progression_Tooltip"],
	"Antistasi Bazaar|Progression",
	[[0, 1, 2], ["$STR_A3U_Bazaar_Settings_Progression_Off", "$STR_A3U_Bazaar_Settings_Progression_Gentle", "$STR_A3U_Bazaar_Settings_Progression_Strict"], 0],
	1, {}
] call CBA_fnc_addSetting;
