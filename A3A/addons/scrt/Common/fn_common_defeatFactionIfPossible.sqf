params ["_sideX"];

if (areInvadersDefeated && {_sideX == Invaders}) exitWith {};
if (areOccupantsDefeated && {_sideX == Occupants}) exitWith {};

private _remainingBases = { sidesX getVariable [_x, sideUnknown] == _sideX } count airportsX + milbases + outposts + seaports + factories + resourcesX;

if (_remainingBases < 1) then {
    if (_sideX == Invaders) then {
        areInvadersDefeated = true; 
        publicVariable "areInvadersDefeated";

        "CSAT_carrier" setMarkerAlpha 0;
        private _text = format [
            localize "STR_comms_mp_faction_defeat",
            "#800000", 
            A3A_faction_inv get "name",
            ([] call SCRT_fnc_misc_getWorldName)
        ];
        [petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];
    };

    if (_sideX == Occupants) then {
        areOccupantsDefeated = true; 
        publicVariable "areOccupantsDefeated";

        "NATO_carrier" setMarkerAlpha 0;
        private _text = format [
            localize "STR_comms_mp_faction_defeat",
            "#004d99", 
            A3A_faction_occ get "name",
            ([] call SCRT_fnc_misc_getWorldName)
        ];
        [petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];

        {     
            private _milAdministration = [A3A_milAdministrations, _x] call BIS_fnc_nearestPosition;
            [_milAdministration, "SILENT"] call SCRT_fnc_location_removeMilAdmin;
        } forEach (milAdministrationsX select {sidesX getVariable [_x, sideUnknown] == Occupants});
    };

    [] remoteExec ["A3A_fnc_statistics", [teamPlayer, civilian]];
};
