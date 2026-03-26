/*
 * File: fn_RivalscreateUnit.sqf
 * Description:
 *    To be used instead of 'createUnit' scripting command.
 *    Adds additional behaviour, including passing a loadout instead of a classname.
 *    21/07/2023: Added ability to use a different unit class (for custom skeletons)
 *    28/07/2023: Be very careful if you're going to add 2 different base classes.
 *    28/07/2023: For example, adding a webknights elite to a squad of OPTRE elites will cause the OPTRE elites to not fire at all. Some mods don't do this, some do!
 *    28/07/2023: Make sure you test it if you do. Helps avoid issues like "Why does half of the squad suddenly become pacifists?"
 *    This version overwrites the Anti Plus version of the createUnit command! hooray!
 * Params:
 *    _group - Group to add the AI: Group
 *    _type - A classname in CfgVehicles, or a unit loadout array: String or Array
 *    _position - Position to create at: Position, Position2D, Object, Group
 *    _markers - Markers the AI can be placed on: Array
 *    _placement - Placement radius: Number
 *    _special - Unit special placement: String
 * Returns:
 *    Object - created unit
 * Example Usage:
 *    [group, _type, position, markers, placement, special] call A3A_fnc_RivalsCreateUnit
*/

#include "..\..\script_component.hpp"

params ["_group", "_type", "_position", ["_markers", []], ["_placement", 0], ["_special", "NONE"]];

private _unitDefinition = A3A_customUnitTypes getVariable [_type, []];

if !(_unitDefinition isEqualTo []) exitWith {
    _unitDefinition params ["_loadouts", "_traits", "_unitProperties", "_unitClass"];
    private _canSkip = false;
	private _skipIdentity = false;

    {
        if (_x select 0 isEqualTo "baseClass") then {
            private _classData = _x select 1;
            
            // Processing class arrays with weights
            if (_classData isEqualType []) then {
                if ((count _classData) == 2 && {(_classData#0) isEqualType []} && {(_classData#1) isEqualType []}) then {
                    // Format: [[classes], [weights]]
                    private _classes = _classData#0;
                    private _weights = _classData#1;
                    _unitClass = _classes selectRandomWeighted _weights;
                } else {
                    // Simple array of classes
                    _unitClass = selectRandom _classData;
                };
            } else {
                // Single class
                _unitClass = _classData;
            };
			if (count _x > 3 && {_x select 3 isEqualTo true}) then {
        	    _skipIdentity = true;
        	};
        };
        if (_x select 2 isEqualTo true) then {
            _canSkip = true;
        };
    } forEach _traits; // grab all data from base class trait

	private _unit = _group createUnit [_unitClass, _position, _markers, _placement, _special];
    [_unit] joinSilent _group; // normally, this command is literally pointless. But when we're mixing base classes (e.g opfor) but spawning them as blufor (swap enemy sides selection), it'll make them fight each other unless we do this

    if (_skipIdentity) then {
        _unit setVariable ["skipIdentity", _skipIdentity, true];
    };

    if (!_canSkip) then {
        _unit setUnitLoadout selectRandom _loadouts;
    };
	_unit setVariable ["unitType", _type, true];

	//it's very fragile and non-extensible (adding second bool or string value into template will break this)
    {
        switch (true) do {
            case (_x isEqualType true): { _unit setVariable ["isRival", _x, true] }; //since it's a functions specifically for Rivals, there is probably no need for this anyway
            case (_x isEqualType ""): { _unit setVariable ["unitPrefix", _x, true] };
        };
    } forEach _unitProperties;

    {
        if (_x select 0 != "baseClass") then { _unit setUnitTrait _x };
    } forEach _traits;
    _unit
};

private _unit = _group createUnit [_type, _position, _markers, _placement, _special];
_unit setVariable ["unitType", _type, true];
_unit