#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
/*
Author: [Killerswin2]
    creates the buildable object list on clients.
Arguments:
    None
Return Value:
NONE
Scope: Client
Environment: Unscheduled
Public: 
no
Example:
call A3A_fnc_initBuildableObjects;
*/

private _mapInfo = missionConfigFile/"A3A"/"mapInfo"/toLower worldName;
private _filterBuildableObjects = {
    params["_buildObjects"];

    Verbose_1("Filtering %1 entries ----------------------------------------------------",count _buildObjects);

    (_buildObjects apply {
        _x params["_classNameOrTitle","_priceOrPreview","_subMenu"];

        if (isNil "_subMenu") then {
            Verbose_2("%1=%2",_classNameOrTitle,isClass(configFile >> "CfgVehicles" >> _classNameOrTitle));
            [[], _x] select isClass(configFile >> "CfgVehicles" >> _classNameOrTitle);
        } else {
            private _filtered = [_subMenu] call _filterBuildableObjects;

            if (_filtered isEqualTo []) then {
                Verbose_1("==> Completely discarding %1",_classNameOrTitle);
                [];
            } else {
                Verbose_2("==> %1: keeping %2 entries",_classNameOrTitle,count _filtered);
                [_classNameOrTitle, _priceOrPreview, _filtered];
            };
        };
    }) - [[]];
};

if (!isClass _mapInfo) then {_mapInfo = configFile/"A3A"/"mapInfo"/toLower worldName};
A3A_buildableObjects = [getArray(_mapInfo/"buildObjects")] call _filterBuildableObjects;
