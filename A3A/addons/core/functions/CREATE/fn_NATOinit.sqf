/*  Inits the given unit with all needed data, flags and weapons
*   Params:
*       _unit : OBJECT : The unit that needs to be initialized
*       _marker : STRING : The name of the marker (default "")
*       _isSpawner : BOOL : (Optional) Whether the unit should be made a spawner, otherwise automatic
*       _resPool : STRING : (Optional) Resource pool name of unit (attack, defence, garrison, legacy?)
*   Returns:
*       Nothing
*/

params ["_unit", ["_marker", ""], "_isSpawner", "_resPool"];
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

//TODO we may want to rename that file to AIinit or something
if ((isNil "_unit") || (isNull _unit)) exitWith
{
    Error_1("Bad init parameter: %1", _this);
};

private _type = _unit getVariable "unitType";
private _side = side (group _unit);
private _isRival = _unit getVariable ["isRival", false];
private _unitPrefix = _unit getVariable ["unitPrefix", ""];
private _faction = Faction(_side);
_unit setVariable ["originalSide", _side];          // used for delete handler, which is local

if (isNil "_type") then {
    Warning_2("Unit does not have a type assigned: %1, vehicle: %2", typeOf _unit, typeOf vehicle _unit);
    _type = typeOf _unit;
};

if (_type == "Fin_random_F") exitWith {};


// Set source resource pool for unit
if (isNil "_resPool") then {
    // Avoiding editing every garrison/mission file for now
    _resPool = ["legacy", "garrison"] select (_marker != "");
};
_unit setVariable ["A3A_resPool", _resPool, true];

if !(isNil "_isSpawner") then
{
    if (_isSpawner) then { _unit setVariable ["spawner",true,true] };
    if (_marker != "") then { _unit setVariable ["markerX",_marker,true] };
}
else
{
    private _veh = objectParent _unit;
    if (_marker != "") exitWith
    {
        // Persistent garrison units are never spawners.
	    _unit setVariable ["markerX",_marker,true];
	    if ((spawner getVariable _marker != 0) && (isNull _veh)) then
	    {
            // Garrison drifted out of spawn range, disable simulation on foot units
            // this is re-enabled in distance.sqf when spawn range is re-entered
            [_unit,false] remoteExec ["enableSimulationGlobal",2];
        };
    };

    if (_unit in (assignedCargo _veh)) exitWith
    {
        // Cargo units aren't spawners until they leave the vehicle.
        // Assumes that they'll get out if the crew are murdered.
        _unit setVariable ["spawner", false];            // local-only, use to distinguish when spawner status is removed
        _unit addEventHandler ["GetOutMan", {
            _unit = _this select 0;
            if (!isNil {_unit getVariable "spawner"}) then {
                _unit setVariable ["spawner",true,true];
            };
            _unit removeEventHandler [_thisEvent, _thisEventHandler];
        }];
    };

	// Fixed-wing aircraft spawn far too much with little effect.
	// Don't even spawn if ejected, because they often end up miles away from the real action
	if (_veh isKindOf "Plane") exitWith {};

    // Rivals are insurgency units that have no intention to capture points
    if (_isRival) exitWith {};

    // Everyone else is a spawner
	_unit setVariable ["spawner",true,true]
};

// Install event handlers for the unit
_unit addEventHandler ["HandleDamage", A3A_fnc_handleDamageAAF];
_unit addEventHandler ["Killed", A3A_fnc_enemyUnitKilledEH];
_unit addEventHandler ["Deleted", A3A_fnc_enemyUnitDeletedEH];


//Calculates the skill of the given unit
//private _skill = (0.15 * skillMult) + (0.04 * difficultyCoef) + (0.02 * tierWar);
private _skill = (0.1 * A3A_enemySkillMul) + (0.07 * (1 max A3A_activePlayerCount^0.5)) + (0.01 * tierWar);
private _regularFaces = nil;
private _regularVoices = nil;
private _regularInsignia = nil;
private _face = nil;
private _voice = nil;
private _insignia = nil;

if (_isRival) then {
    _regularFaces = A3A_faction_riv get "faces";
    _regularVoices = A3A_faction_riv get "voices";
    _regularInsignia = A3A_faction_riv get "insignia";
} else {
    _regularFaces = _faction get "faces";
    _regularVoices = _faction get "voices";
    _regularInsignia = _faction get "insignia";
};

switch (true) do {
    case (_isRival): {
        _skill = _skill * 0.9;
        _face = selectRandom (A3A_faction_riv get "faces");
        _voice = selectRandom (A3A_faction_riv get "voices");
    };
    case (_unitPrefix isEqualTo "militia"): {
        _skill = _skill * 0.7;
        _face = selectRandom (_faction getOrDefault ["milFaces", _regularFaces]);
        _voice = selectRandom (_faction getOrDefault ["milVoices", _regularVoices]);
        _insignia = selectRandom (_faction getOrDefault ["milInsignia", _regularInsignia]);
    };
    case (_unitPrefix isEqualTo "police"): {
        _skill = _skill * 0.5;
        _face = selectRandom (_faction getOrDefault ["polFaces", _regularFaces]);
        _voice = selectRandom (_faction getOrDefault ["polVoices", _regularVoices]);
        _insignia = selectRandom (_faction getOrDefault ["polInsignia", _regularInsignia]);
    };
    case (_unitPrefix isEqualTo "elite"): {
        _skill = _skill * 1.1;
        _face = selectRandom (_faction getOrDefault ["eliteFaces", _regularFaces]);
        _voice = selectRandom (_faction getOrDefault ["eliteVoices", _regularVoices]);
        _insignia = selectRandom (_faction getOrDefault ["eliteInsignia", _regularInsignia]);
    };
    case (_unitPrefix isEqualTo "SF"): {
        _skill = _skill * 1.2;
        _face = selectRandom (_faction getOrDefault ["sfFaces", _regularFaces]);
        _voice = selectRandom (_faction getOrDefault ["sfVoices", _regularVoices]);
        _insignia = selectRandom (_faction getOrDefault ["sfInsignia", _regularInsignia]);
    };
    case ("Traitor" in _type): {
        _face = selectRandom (A3A_faction_reb get "faces");
        _voice = "NoVoice";
    };
    default {
        _face = selectRandom _regularFaces;
        _voice = selectRandom _regularVoices;
        _insignia = selectRandom _regularInsignia;
    };
};
[_unit, createHashMapFromArray [["face", _face], ["speaker", _voice], ["pitch", (random [0.9, 1, 1.1])]]] call A3A_fnc_setIdentity;
_unit setSkill _skill;
if (!isNil "_insignia" && {_insignia isNotEqualTo ""}) then {
   [_unit, _insignia] call BIS_fnc_setUnitInsignia;
};

//Adjusts squadleaders with improved skill
if (_type in FactionGet(all,"SquadLeaders")) then {
    _unit setskill ["courage",_skill + 0.2];
    _unit setskill ["commanding",_skill + 0.2];

    [_unit, 10] call SCRT_fnc_common_addRandomMoneyMagazine;
    [_unit, _type, _isRival] call SCRT_fnc_common_selectAndApplyLeaderIntel;
};

private _decimalAccurancyCap = aiAccuracyCeiling / 100;
if((_unit skill "aimingAccuracy") > _decimalAccurancyCap) then {
    _unit setSkill ["aimingAccuracy", _decimalAccurancyCap];
    _unit setSkill ["aimingShake", _decimalAccurancyCap];
    _unit setSkill ["aimingSpeed", _decimalAccurancyCap];
};

//Sets NVGs, lights, lasers, radios and spotting skills for the night
private _hmd = hmd _unit;
if (sunOrMoon < 1) then {
    if (_unitPrefix isNotEqualTo "SF" && {_unit != leader (group _unit)}) then {
        if (tierWar < 4) then {
            if (_hmd != "") then {
                _unit unassignItem _hmd;
                _unit removeItem _hmd;
                _hmd = "";
            };
        } else {
            if (_hmd != "" && {((10 - tierWar) > random 10)}) then {
                _unit unassignItem _hmd;
                _unit removeItem _hmd;
                _hmd = "";
            };
        }
    } else {
        private _arr = (allNVGs arrayIntersect (items _unit));
        if (_arr isNotEqualTo [] || {_hmd != ""}) then {
            if ((10 - tierWar) > random 10 && {_unit != leader (group _unit)}) then {
                if (_hmd == "") then {
                    _hmd = _arr select 0;
                    _unit removeItem _hmd;
                } else {
                    _unit unassignItem _hmd;
                    _unit removeItem _hmd;
                };
                _hmd = "";
            } else {
                if(tierWar < 3) then {
                    switch (true) do {
                        case (_arr isNotEqualTo []): {
                            _hmd = _arr select 0;
                            _unit removeItem _hmd;
                        };
                        case (_hmd != ""): {
                            _unit unassignItem _hmd;
                            _unit removeItem _hmd;
                        };
                    };
                    _hmd = "";
                } else {
                    _unit assignItem _hmd;
                };
            };
        };
    };
    private _weaponItems = primaryWeaponItems _unit;
    if (_hmd != "") then {
        if (_weaponItems findIf {_x in allLaserAttachments} != -1) then {
            _unit action ["IRLaserOn", _unit];
            _unit enableIRLasers true;
        };
    } else {
        private _pointers = _weaponItems arrayIntersect allLaserAttachments;
        if (_pointers isNotEqualTo []) then {
            _unit removePrimaryWeaponItem (_pointers select 0);
        };
        private _lamp = "";
        private _lamps = _weaponItems arrayIntersect allLightAttachments;
        if (_lamps isEqualTo []) then {
            private _compatibleLamps = (compatibleItems (primaryWeapon _unit)) arrayIntersect allLightAttachments;
            if !(_compatibleLamps isEqualTo []) then
            {
                _lamp = selectRandom _compatibleLamps;
                _unit addPrimaryWeaponItem _lamp;
                _unit assignItem _lamp;
            };
        } else {
            _lamp = _lamps select 0;
        };
        if (_lamp != "") then {
            _unit enableGunLights "AUTO";
        };
        //Reduce their magical night-time spotting powers.
        _unit setskill ["spotDistance", _skill * 0.7];
        _unit setskill ["spotTime", _skill * 0.5];
    };
} else {
    if (_unitPrefix isNotEqualTo "SF") then {
        if (_hmd != "") then {
            _unit unassignItem _hmd;
            _unit removeItem _hmd;
        };
    } else {
        private _arr = (allNVGs arrayIntersect (items _unit));
        if (count _arr > 0) then {
            _hmd = _arr select 0;
            _unit removeItem _hmd;
        };
    };
};

//Reveals all air vehicles to the unit, if it is either gunner of a vehicle or equipped with a launcher
if (_unit == gunner objectParent _unit or {(secondaryWeapon _unit) in allAA}) then
{
    {
        if (!isNull driver _x) then { _unit reveal [_x, 1.5] };
    } forEach (_unit nearEntities ["Air", distanceSPWN*1]);
};
["AIInit", [_unit, _side, _marker, _unit getVariable "spawner"]] call EFUNC(Events,triggerEvent);
