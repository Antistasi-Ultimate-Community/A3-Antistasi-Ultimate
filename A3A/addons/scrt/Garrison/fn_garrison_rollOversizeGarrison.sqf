#include "..\defines.inc"
FIX_LINE_NUMBERS()

params ["_side", "_marker"];

private _additionalGroups = [];


private _faction = Faction(_side);
private _aggression = if (_side == Occupants) then {aggressionOccupants} else {aggressionInvaders};
private _oversizeChance =  _aggression / 2;
if (_oversizeChance > 15) then {
	_oversizeChance = 15;
};

if ((random 100) < _oversizeChance) then {
    private _squadCount = nil;
    switch (true) do {
        case (_aggression < 50): {
            _squadCount = round (random [1,2,3]);
        };
        case (_aggression > 50): {
            _squadCount = round (random [2,3,4]);
        };
        default {
            _squadCount = round (random [1,2,3]);
        };
    };

    private _pool = [_faction, "groupsTierMedium"] call SCRT_fnc_unit_flattenTier;
    for "_i" from 1 to _squadCount do {
        _additionalGroups pushBack (selectRandom _pool);
    };

    Info_2("Oversized %1 garrison, number of additional squads: %2", str _marker, str _squadCount);
};

_additionalGroups