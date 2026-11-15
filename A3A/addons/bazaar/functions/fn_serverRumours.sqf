// SERVER: "Bazaar rumours" - where every trader is, how far, and when they
// restock; their jobs and smuggling contracts; the asking player's own run
// and Wanted List; and the latest smuggling news. Sent back as a hint.
if (!isServer) exitWith {};
params [["_player", objNull, [objNull]], ["_pins", [], [[]]]];
if (isNull _player) exitWith {};

private _lines = ["<t size='1.1' color='#f1c27d'>BAZAAR RUMOURS</t>"];
if (ABZ_vendors isEqualTo []) then {
	_lines pushBack ([localize "STR_A3U_Bazaar_Rumours_NoTraders", localize "STR_A3U_Bazaar_Rumours_NoStock"] select (ABZ_pool isEqualTo []));
};

// my smuggling run first - it has a clock on it
private _ri = [getPlayerUID _player] call ABZ_fnc_runFind;
if (_ri > -1) then {
	(ABZ_runs select _ri) params ["", "", "", "", "_destId", "_pay", "_deadline", "_crate"];
	private _d = [_destId] call ABZ_fnc_vendorEntry;
	private _left = ceil (((_deadline - time) max 0) / 60);
	private _crateTxt = if (isNull _crate) then { "" } else {
		private _cp = getPosATL ([_crate, attachedTo _crate] select (!isNull attachedTo _crate));	// its vehicle's spot when loaded
		format [localize "STR_A3U_Bazaar_Rumours_CrateDistance", (round ((_player distance2D _cp) / 100)) / 10]
	};
	_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_YourRun",
		_d param [5, "?"], _d param [1, "?"], (round ((_player distance2D (_d param [2, [0, 0, 0]])) / 100)) / 10, _left, _pay, _crateTxt];
};

{
	_x params ["_id", "_town", "_pos", "", "", "_vname", "_stock", "_restockAt", "", "_state"];
	private _km = (round ((_player distance2D _pos) / 100)) / 10;
	if (_state != "ok") then {
		_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_StallGone", _town];
	} else {
		private _left = ceil (((_restockAt - time) max 0) / 60);
		private _bulk = { _x select 4 } count _stock;
		private _veh = { (_x select 5) isEqualTo "vehicle" } count _stock;
		private _sold = { (_x select 3) <= 0 } count _stock;
		_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_StallInfo",
			_vname, _town, _km, _left, (count _stock) - _veh, _bulk, ["s", ""] select (_bulk == 1),
			["", format [", %1 vehicle%2", _veh, ["s", ""] select (_veh == 1)]] select (_veh > 0),
			["", format [", %1 sold out", _sold]] select (_sold > 0)];
		private _job = _x param [12, []];
		if (_job isNotEqualTo [] && {(_job select 2) < (_job select 1)}) then {
			_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_Job", _job select 1, [_job select 0] call ABZ_fnc_displayNameOf, _job select 2, _job select 3];
		};
		private _o = _x param [13, []];
		if (_o isNotEqualTo [] && {missionNamespace getVariable ["ABZ_runsEnabled", true]}) then {
			private _dd = [_o select 0] call ABZ_fnc_vendorEntry;
			if (_dd isNotEqualTo [] && {(_dd select 9) == "ok"}) then {
				_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_Contract", _dd select 1, _o select 3, _o select 1];
			};
		};
	};
} forEach ABZ_vendors;

// my Wanted List: who has my pins right now
if (_pins isNotEqualTo []) then {
	private _keys = createHashMap;
	{
		if (_x isEqualType "" && {_x != ""}) then {
			_keys set [toLower _x, _x];
			if ((getNumber (configFile >> "CfgWeapons" >> _x >> "type")) in [1, 2, 4]) then {
				private _b = [_x] call BIS_fnc_baseWeapon;
				if (_b isEqualType "" && {_b != ""}) then { _keys set [toLower _b, _x] };
			};
		};
	} forEach (_pins select [0, 10]);
	private _hits = [];
	{
		if ((_x select 9) == "ok") then {
			private _e = _x;
			{
				if ((_x select 3) > 0 && {(toLower (_x select 0)) in _keys || {(toLower ([_x select 0] call ABZ_fnc_wantedBase)) in _keys}}) then {
					_hits pushBack format [localize "STR_A3U_Bazaar_Rumours_Wanted", [_x select 0] call ABZ_fnc_displayNameOf, _e select 5, _e select 1, ["", localize "STR_A3U_Bazaar_Rumours_Wanted_Sealed"] select (_x select 4)];
				};
			} forEach (_e select 6);
			private _job = _e param [12, []];
			if (_job isNotEqualTo [] && {(_job select 2) < (_job select 1)} && {(toLower (_job select 0)) in _keys || {(toLower ([_job select 0] call ABZ_fnc_wantedBase)) in _keys}}) then {
				_hits pushBack format [localize "STR_A3U_Bazaar_Rumours_Wanted_Job", [_job select 0] call ABZ_fnc_displayNameOf, _e select 5, _e select 1];
			};
		};
	} forEach ABZ_vendors;
	_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_Wanted_List", count _pins, [localize "STR_A3U_Bazaar_Rumours_Wanted_NoPins", _hits joinString "; "] select (_hits isNotEqualTo [])];
};

// the street talks: recent smuggling runs
private _news = ABZ_runNews select { time - (_x select 0) < 3600 };
if (_news isNotEqualTo []) then {
	_lines pushBack localize "STR_A3U_Bazaar_Rumours_StreetTalk";
	{ _lines pushBack format ["      %1 min ago: %2", ceil ((time - (_x select 0)) / 60), _x select 1] } forEach _news;
};

private _gate = call ABZ_fnc_progressGate;
private _gateTxt = if (_gate isEqualTo [3, 3]) then { "" } else {
	format [localize "STR_A3U_Bazaar_Rumours_ProgressGate", ([_gate select 0] call ABZ_fnc_rarityInfo) select 0, ([_gate select 1] call ABZ_fnc_rarityInfo) select 0]
};
_lines pushBack format [localize "STR_A3U_Bazaar_Rumours_SealedCrates", _gateTxt];

["ABZ_rumourData", [_lines joinString "<br/>"], _player] call CBA_fnc_targetEvent;
