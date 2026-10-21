// Client: a stock snapshot arrived from the server (ABZ_shopData). Refills
// the open dialog, or opens it - but only if this player actually asked
// (ABZ_shopPending), so a refresh after a trade never re-opens a menu the
// player already closed.
#include "..\dialogues\ids.inc"
params [["_id", -1, [0]], ["_vname", "", [""]], ["_town", "", [""]], ["_stock", [], [[]]], ["_secs", 0, [0]], ["_bulk", 25, [0]], ["_job", [], [[]]], ["_run", [[], []], [[]]]];
if (!hasInterface) exitWith {};

private _d = findDisplay 78800;
if (isNull _d && {(missionNamespace getVariable ["ABZ_shopPending", -1]) > 0}) then {
	ABZ_shopPending = -1;	// this answer ends the request, whatever happens next
	if (alive player) then {
		createDialog "ABZ_Shop";
		_d = findDisplay 78800;
		[_d] call ABZ_fnc_uiScale;	// v1.1.2: labels and buttons that would be cut get a smaller font
		if (isNull _d) then {
			[localize "STR_A3U_Bazaar_Notify_CouldNotOpenMenu"] call ABZ_fnc_notify;
		};
	};
};
if (isNull _d) exitWith {};

// my smuggling run's clock: seconds left -> my own clock
_run params [["_offer", [], [[]]], ["_myRun", [], [[]]]];
if (count _myRun >= 7) then { _myRun = +_myRun; _myRun set [4, time + (_myRun select 4)] } else { _myRun = [] };
uiNamespace setVariable ["ABZ_shop", [_id, _vname, _town, _stock, time + _secs, _bulk, _job, [_offer, _myRun]]];
(_d displayCtrl ABZ_IDC_TITLEBAR) ctrlSetText format ["ANTISTASI BAZAAR - %1 (%2)", toUpper _vname, toUpper _town];
[_d displayCtrl ABZ_IDC_TITLEBAR] call ABZ_fnc_uiScale;

// the help box doubles as the JOB board
private _help = localize "STR_A3U_Bazaar_Shop_Help";
if (_job isNotEqualTo []) then {
	_job params ["_jc", "_jw", "_jd", "_jr"];
	_help = if (_jd >= _jw) then {
		format [localize "STR_A3U_Bazaar_Shop_JobDone", _vname, _jw, [_jc] call ABZ_fnc_displayNameOf]
	} else {
		format [localize "STR_A3U_Bazaar_Shop_JobWanted", _vname, _jw, [_jc] call ABZ_fnc_displayNameOf, _jr, _jd]
	};
};
[_help, _d displayCtrl ABZ_IDC_HELPTEXT] call ABZ_fnc_uiText;

private _combo = _d displayCtrl ABZ_IDC_CATEGORYCOMBO;
private _keep = lbCurSel _combo;
lbClear _combo;
{ _combo lbAdd _x } forEach ABZ_shopCats;
_combo lbSetCurSel (_keep max 0);	// triggers shopFillList

// delivery destination for single items (remembered across refills)
private _dest = _d displayCtrl ABZ_IDC_DESTCOMBO;
if (lbSize _dest == 0) then {
	private _room = ["room", _dest] call ABZ_fnc_uiFit;
	{ ["lbAdd", _dest, _x, _room] call ABZ_fnc_uiFit } forEach [localize "STR_A3U_Bazaar_Shop_DestinationKit", localize "STR_A3U_Bazaar_Shop_DestinationVehicle", localize "STR_A3U_Bazaar_Shop_DestinationCrate"];
	_dest lbSetCurSel (uiNamespace getVariable ["ABZ_shopDest", 0]);
};

if (isNil "ABZ_shopTicker" || {scriptDone ABZ_shopTicker}) then {
	ABZ_shopTicker = [] spawn ABZ_fnc_shopTick;
};
