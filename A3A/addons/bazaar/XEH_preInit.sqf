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
	["UI scale (this client)", "Text size in the Bazaar menu. The menu fills the screen at any Interface Size; a bigger text shows fewer list rows, and long descriptions scroll. Takes effect the next time the menu is opened."],
	"Antistasi Bazaar|General",
	[0.7, 1.8, 1, 2],
	0, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vendorCount", "SLIDER",
	["Number of traders", "How many Bazaar traders are set up on the map at once. Each one gets a town of their own."],
	"Antistasi Bazaar|General",
	[1, 8, 3, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_rotationMinutes", "SLIDER",
	["Restock timer (minutes)", "How often every trader shuffles their stock. What you see in the menu is what they have until the timer runs out - buy it or wait for the next roll."],
	"Antistasi Bazaar|General",
	[5, 360, 90, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_relocateEvery", "SLIDER",
	["Traders move every N restocks", "After this many restocks a trader packs up and reappears in a different town (0 = they never move). A killed trader is always replaced elsewhere."],
	"Antistasi Bazaar|General",
	[0, 20, 3, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_markerMode", "LIST",
	["Map markers", "How much the map gives away. 'Town only' drops a marker on the town; 'Exact position' marks the stall itself; 'None' means you rely on Bazaar Rumours (Shift+K) and your own eyes."],
	"Antistasi Bazaar|General",
	[[0, 1, 2], ["None - rumours only", "Town only", "Exact position"], 1],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_announce", "CHECKBOX",
	["Announce restocks and moves in chat", "When ON, everyone gets a system chat line when a trader restocks, moves town, or is killed."],
	"Antistasi Bazaar|General",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_persistence", "CHECKBOX",
	["Persistent traders & crates", "Restore trader locations, their stock, timers and jobs, and any sealed crates still in the world, when the campaign is loaded (server/host profile, per campaign). On Antistasi the Bazaar is saved together with Antistasi's own save (autosave or manual save), so loading a save brings the Bazaar back exactly as it was then. Off = every load starts fresh traders (the state is still saved, so switching this back on restores your latest save)."],
	"Antistasi Bazaar|General",
	true,
	1, {}
] call CBA_fnc_addSetting;

// STOCK
[
	"ABZ_stockSource", "LIST",
	["Stock source", "'Factions in play' builds the catalog from the gear of every faction in the campaign (occupiers, invaders, rebels, rivals) - so a Faction Forger faction, RHS, 3CB, whatever is fighting, is what the traders fence. 'Everything loaded' scans every mod on the server instead (falls back to this outside Antistasi)."],
	"Antistasi Bazaar|Stock",
	[[0, 1], ["Factions in play (Antistasi)", "Everything loaded"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_slotCount", "SLIDER",
	["Single-item slots per trader", "How many different single items a trader offers per restock. Each slot has a limited quantity."],
	"Antistasi Bazaar|Stock",
	[4, 24, 12, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkSlots", "SLIDER",
	["Bulk crate slots per trader", "How many sealed bulk crates a trader offers per restock. Bulk crates hold one unlock's worth of an item and must be hauled home."],
	"Antistasi Bazaar|Stock",
	[0, 4, 2, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkSize", "SLIDER",
	["Bulk crate size", "How many of an item a bulk crate holds. 0 = match Antistasi's own unlock count (minWeaps, 25 by default) so one crate = one arsenal unlock."],
	"Antistasi Bazaar|Stock",
	[0, 100, 0, 0],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_tierScaling", "CHECKBOX",
	["Stock grows with war tier", "Antistasi only. When ON, the slot counts above are the WAR TIER 5 baseline: a tier-1 trader carries about three quarters of that and one bulk crate, a tier-10 trader roughly double the single items, two to three times the bulk crates, and deeper quantities. OFF = the sliders are used as-is at every tier."],
	"Antistasi Bazaar|Stock",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkUnlockAnyway", "CHECKBOX",
	["Bulk crates unlock anyway (unlocks-disabled servers)", "Only matters on Antistasi servers that run with arsenal unlocks DISABLED (minWeaps = -1). OFF (default): a crate is just its contents - the items go into the arsenal as a finite stock, and the crate is priced as a volume discount, not an unlock. ON: unpacking a full crate unlocks the item for the arsenal anyway, Antistasi's own forbidden-item and guided-launcher rules still applying - the Bazaar becomes the one way to unlock gear on a limited-arsenal server."],
	"Antistasi Bazaar|Stock",
	false,
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_bulkUnlockedToo", "CHECKBOX",
	["Offer bulk crates of already-unlocked gear", "OFF (default): bulk crates are only rolled for gear the arsenal has NOT unlocked yet, so every crate is progress. ON: anything can show up in bulk."],
	"Antistasi Bazaar|Stock",
	false,
	1, {}
] call CBA_fnc_addSetting;

// JOBS
[
	"ABZ_jobs", "CHECKBOX",
	["Trader jobs", "Every restock, each trader asks for a few of some item - one the arsenal has NOT unlocked, so you can't just pull it from the box - and pays a bounty per piece on delivery, plus a bonus when the job is done. Hand the goods over in the 'SELL your gear' category. The job lasts until the next restock."],
	"Antistasi Bazaar|Jobs",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_jobReward", "SLIDER",
	["Job payout (x buy price)", "What a job pays per delivered item, as a multiple of what the trader would SELL that item for (default 1.5x). Completing the job pays an extra half of the total on top. Much better than the normal sell payout - that's the point of doing the legwork."],
	"Antistasi Bazaar|Jobs",
	[0.5, 3, 1.5, 2],
	1, {}
] call CBA_fnc_addSetting;

// VEHICLES
[
	"ABZ_vehSlots", "SLIDER",
	["Military vehicle slots per trader", "How many 'stolen' enemy military vehicles a trader offers per restock, taken from the vehicle lists of the factions you are fighting. Scales with war tier when 'Stock grows with war tier' is on (half at tier 1, one and a half times at tier 10). 0 = no vehicles. Antistasi only."],
	"Antistasi Bazaar|Vehicles",
	[0, 4, 2, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehRequirements", "LIST",
	["Vehicle facility requirements", "'Same as Antistasi's black market': buying needs the rebels to hold the same facilities Antistasi Ultimate's own black market asks for - boats a seaport, light vehicles factories and a resource site, helicopters an airport or military base, tanks a military base and three factories, and so on (capped at what the map has). Vehicles you can't take yet still show up, marked LOCKED - something to fight for. 'None': anything on the table can be bought."],
	"Antistasi Bazaar|Vehicles",
	[[0, 1], ["Same as Antistasi's black market", "None"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehDelivery", "LIST",
	["Vehicle delivery", "'Parked near the stall': the vehicle is waiting near the trader (boats at the nearest deep water) and you drive it home - it's military, so getting in breaks undercover. 'Into the HQ garage': it goes straight into Antistasi's garage (respects the garage cap; falls back to parking when there is no garage)."],
	"Antistasi Bazaar|Vehicles",
	[[0, 1], ["Parked near the stall - drive it home", "Into the HQ garage"], 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_vehMarkup", "SLIDER",
	["Vehicle price (x black-market price)", "Multiplier on Antistasi Ultimate's own black-market price for each vehicle (classes it doesn't list are priced from Antistasi's resource cost for them). The global price multiplier applies on top. A vehicle is never sold for less than 1.5x what Antistasi pays back for it at HQ."],
	"Antistasi Bazaar|Vehicles",
	[0.25, 3, 1, 2],
	1, {}
] call CBA_fnc_addSetting;

// MONEY
[
	"ABZ_priceMultiplier", "SLIDER",
	["Price multiplier", "Multiplies every Bazaar price. 0 = everything is free - except anything Antistasi's Arms Dealer buys back, which never goes below his price (no free money; until he has been found, the highest price any of his possible stores lists)."],
	"Antistasi Bazaar|Money",
	[0, 10, 1, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_sellFraction", "SLIDER",
	["Sell payout (fraction of buy price)", "Traders buy your gear too - the 'Sell your gear' category in the menu. This is what they pay as a fraction of what they would sell the same item for (default 0.3 = 30 cents on the dollar; a fence is not a charity). What you sell shows up on their table for others to buy. 0 = they don't buy."],
	"Antistasi Bazaar|Money",
	[0, 1, 0.3, 2],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_bulkMultiplier", "SLIDER",
	["Bulk crate markup (when a crate is an unlock)", "Multiplier on bulk crates on top of (unit price x crate size) when unpacking the crate UNLOCKS the item - Antistasi with unlocks on, or 'Bulk crates unlock anyway'. Bulk is supposed to be expensive then: it is a whole arsenal unlock in one box."],
	"Antistasi Bazaar|Money",
	[0.5, 5, 1.5, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_bulkDiscount", "SLIDER",
	["Bulk crate price (when a crate is NOT an unlock)", "Multiplier on (unit price x crate size) when a crate can't unlock anything - Antistasi with arsenal unlocks disabled, or outside Antistasi. Then a crate is just 25 rifles and ammo in a box, so it gets a volume DISCOUNT (default 0.6 = 40% off buying them one at a time) instead of the unlock markup."],
	"Antistasi Bazaar|Money",
	[0.2, 2, 0.6, 2],
	1, _abzReprice
] call CBA_fnc_addSetting;

[
	"ABZ_funds", "LIST",
	["Purchases paid from", "'Personal money' charges the buyer. 'Faction money' spends the shared Antistasi war chest instead (falls back to personal money outside Antistasi)."],
	"Antistasi Bazaar|Money",
	[[0, 1], ["Personal money", "Faction money"], 0],
	1, {}
] call CBA_fnc_addSetting;

// RISK
[
	"ABZ_undercoverMode", "LIST",
	["Undercover rule", "Antistasi only. 'Always required': a trader refuses anyone who is not undercover - civilian clothes, rifle left in the car. 'Not in rebel-held towns': the same, except in towns your side already controls, where you can walk up armed. 'Never required': anyone can trade."],
	"Antistasi Bazaar|Risk",
	[[0, 1, 2], ["Never required", "Always required", "Not in rebel-held towns"], 1],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_enemyRadius", "SLIDER",
	["Trader refuses when enemies within (m)", "No business while enemy units are this close to the stall. 0 disables the check."],
	"Antistasi Bazaar|Risk",
	[0, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_seizure", "CHECKBOX",
	["Contraband seizure", "When ON, a sealed crate that enemy units have spotted (you or your vehicle, while the crate is away from HQ) for long enough is confiscated - gone. Crates also go up with the vehicle carrying them."],
	"Antistasi Bazaar|Risk",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_seizureSeconds", "SLIDER",
	["Seizure: seconds spotted before a crate is lost", "How long enemy units must keep eyes on you (or your ride) with a sealed crate before it is seized. Breaking contact resets the clock."],
	"Antistasi Bazaar|Risk",
	[15, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

// MONEY (v1.1.0)
[
	"ABZ_buyBackSeconds", "SLIDER",
	["Buy-back window (seconds)", "Bought the wrong thing? For this long after a single-item purchase, the same trader takes it back at the FULL price you paid (sell it back under 'SELL your gear'). After that it is a sale like any other. Bulk crates and vehicles have no buy-back. 0 = off."],
	"Antistasi Bazaar|Money",
	[0, 300, 60, 0],
	1, {}
] call CBA_fnc_addSetting;

// SMUGGLING RUNS (v1.1.0)
[
	"ABZ_runsEnabled", "CHECKBOX",
	["Smuggling runs", "Traders offer contracts: carry a sealed crate to another trader on the far side of the map before the deadline. Pays by distance, by how much enemy ground the straight line crosses, and by war tier. Spotted long enough with it, or the vehicle carrying it destroyed, and the run fails - and everyone hears about it. One active run per player."],
	"Antistasi Bazaar|Smuggling Runs",
	true,
	1, {}
] call CBA_fnc_addSetting;

[
	"ABZ_runPayout", "SLIDER",
	["Run payout (x)", "Multiplier on what a smuggling run pays (default 1x: roughly $300 + $300 per km, up to double over enemy ground, more as the war goes on)."],
	"Antistasi Bazaar|Smuggling Runs",
	[0.25, 3, 1, 2],
	1, {}
] call CBA_fnc_addSetting;

// PROGRESSION (v1.1.0)
[
	"ABZ_progression", "LIST",
	["Rarity gate by war tier", "Antistasi only. Holds the strongest stock back until the war has moved on, so the Bazaar can stand in for a disabled Arms Dealer without handing out endgame gear on day one. Applies to rolled stock, bulk crates (arsenal unlocks) and vehicles. 'Gentle': Rare items from war tier 3 and Exotic from 5; Rare crates from 4 and Exotic crates from 6. 'Strict': Rare items from 4 and Exotic from 7; Rare crates from 6 and Exotic crates from 8."],
	"Antistasi Bazaar|Progression",
	[[0, 1, 2], ["Off - every rarity from day one", "Gentle", "Strict"], 0],
	1, {}
] call CBA_fnc_addSetting;
