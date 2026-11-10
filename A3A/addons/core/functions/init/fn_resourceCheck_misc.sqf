#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

// Regular income of finite starting weapons
private _equipMul = A3A_balancePlayerScale / 30;		// difficulty scaled. Hmm.
{
	if (_x isEqualType "") then { continue };
	_x params ["_class", "_initCount"];
	private _count = _initCount * _equipMul;
	_count = if (_count % 1 > random 1) then { ceil _count } else { floor _count };
	private _arsenalTab = _class call jn_fnc_arsenal_itemType;
	[_arsenalTab, _class, _count] call jn_fnc_arsenal_addItem;
} forEach (A3A_faction_reb get "initialRebelEquipment");

[] call A3A_fnc_generateRebelGear;
[] call A3A_fnc_FIAradio;
[] call A3A_fnc_cleanConvoyMarker;

// Random-walk the defence multipliers for markers to add some persistent variation
// Maybe add some logic to this later
/*    {
    private _r = _x#4 - 0.1 + random 0.2;
    _x set [4, 0.5 max _r min 1.0];
} forEach A3A_supportMarkerTypes;
*/
[] spawn A3A_fnc_promotePlayer;
[] call A3A_fnc_assignBossIfNone;

// Clear out plank objects that haven't been constructed and have exceeded the timeout
call A3A_fnc_processBuildingTimeouts;

// Decrease HQ knowledge values, old ones faster than current
if (A3A_curHQInfoOcc < 1) then { A3A_curHQInfoOcc = 0 max (A3A_curHQInfoOcc - 0.01) };
if (A3A_curHQInfoInv < 1) then { A3A_curHQInfoInv = 0 max (A3A_curHQInfoInv - 0.01) };
A3A_oldHQInfoOcc = A3A_oldHQInfoOcc select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };			// arrays of [xpos, ypos, knowledge]
A3A_oldHQInfoInv = A3A_oldHQInfoInv select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };

[] spawn A3A_fnc_reinforcementsAI;
{
    private _veh = _x;
    if ((_veh isKindOf "StaticWeapon") and {{isPlayer _x} count crew _veh == 0 and {alive _veh}}) then {
        _veh setDamage 0;
        [_veh,1] remoteExec ["setVehicleAmmo",_veh];
    };
} forEach vehicles;