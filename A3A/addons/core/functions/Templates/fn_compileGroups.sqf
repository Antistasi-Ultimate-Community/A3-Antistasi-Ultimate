/*
Author: Håkon
Description:
    Adds the unit and group definitions to the faction hashmap

    note this is only the name of the data for unit creation, not the actuall unit data.
    as all factions group data is generated with this file some groups do not have coresponding loadout data.

Arguments:
0. <Hashmap> Faction data hashmap
1. <String>  Faction prefix

Return Value: nil

Scope: Server,Server/HC,Clients,Any
Environment: Scheduled/unscheduled/Any
Public: Yes/No
Dependencies:

Example:

License: MIT License
*/
params ["_faction", "_prefix"];

//Defines
#define unit(SECTION, TYPE) ("loadouts_"+_prefix+"_"+ #SECTION +"_"+ TYPE)
#define double(X) [X, X]

//---------------|
// AI Group data |
//---------------|
if (_prefix in ["occ", "inv"]) exitWith {
    //singular tiered units
    _faction set ["unitTierStaticCrew", [
        unit(militia, "Rifleman"),
        unit(military, "Rifleman"),
        unit(elite, "Rifleman")
    ]];

    _faction set ["unitRifle", [unit(militia, "Rifleman"),unit(military, "Rifleman"),unit(elite, "Rifleman")]];

    _faction set ["unitTierGuard", [
        [unit(militia, "Rifleman"),unit(military, "Rifleman"),unit(elite, "Rifleman")],
        [unit(militia, "Grenadier"), unit(military, "Grenadier"),unit(elite, "Grenadier")],
        [unit(militia, "LAT"), unit(military, "LAT"),unit(elite, "LAT")],
        [unit(militia, "MachineGunner"), unit(military, "MachineGunner"),unit(elite, "MachineGunner")]
    ]];

    _faction set ["unitTierTower", [
        [unit(militia, "Rifleman"),unit(military, "Rifleman"),unit(elite, "Rifleman")],
        [unit(militia, "Marksman"),unit(military, "Marksman"),unit(elite, "Marksman")],
        [unit(militia, "Sniper"), unit(military, "Sniper"),unit(elite, "Sniper")]
    ]];

    //singular units
    _faction set ["unitOfficial", unit(other, "Official")];
    _faction set ["unitTraitor", unit(other, "Traitor")];
    _faction set ["unitCrew", unit(other, "Crew")];
    _faction set ["unitUnarmed", unit(other, "Unarmed")];
    _faction set ["unitPilot", unit(other, "Pilot")];

    _faction set ["unitMilitiaGrunt", unit(militia, "Rifleman")];
    _faction set ["unitMilitiaMarksman", unit(militia, "Marksman")];
    _faction set ["unitMilitiaGrenadier", unit(militia, "Grenadier")];
    _faction set ["unitMilitiaSniper", unit(militia, "Sniper")];
    _faction set ["unitMilitiaMedic", unit(militia, "Medic")];

    _faction set ["unitPoliceOfficer", unit(police, "SquadLeader")];
    _faction set ["unitPoliceGrunt", unit(police, "Standard")];

    //tiered patrols
    private _smallGroupSentry = [
        [unit(militia, "Grenadier"), unit(militia, "Rifleman")],
        [unit(military, "Grenadier"), unit(military, "Rifleman")],
        [unit(elite, "Grenadier"), unit(elite, "Rifleman")]
    ];

    private _smallGroupLAT = [
        [unit(militia, "LAT"), unit(militia, "Rifleman")],
        [unit(military, "LAT"), unit(military, "Rifleman")],
        [unit(elite, "LAT"), unit(elite, "Rifleman")]
    ];

    private _smallGroupMarksman = [
        [unit(militia, "Marksman"), unit(militia, "Rifleman")],
        [unit(military, "Marksman"), unit(military, "Rifleman")],
        [unit(elite, "Marksman"), unit(elite, "Rifleman")]
    ];

    private _smallGroupMG = [
        [unit(militia, "MachineGunner"), unit(militia, "Rifleman")],
        [unit(military, "MachineGunner"), unit(military, "Rifleman")],
        [unit(elite, "MachineGunner"), unit(elite, "Rifleman")]
    ];

    _faction set ["groupTierSniper", [
        [unit(militia, "Sniper"), unit(militia, "Rifleman")],
        [unit(military, "Sniper"), unit(military, "Rifleman")],
        [unit(elite, "Sniper"), unit(elite, "Rifleman")]
    ]];

    _faction set ["groupTierPatrolSniper", [
        [unit(militia, "PatrolSniper"), unit(militia, "PatrolSpotter")],
        [unit(military, "PatrolSniper"), unit(military, "PatrolSpotter")],
        [unit(elite, "PatrolSniper"), unit(elite, "PatrolSpotter")]
    ]];

    _faction set ["groupsTierSmall", [
        _faction get "groupTierSniper",
        _smallGroupSentry,
        _smallGroupSentry,
        _smallGroupSentry,
        _smallGroupSentry,
        _smallGroupMG,
        _smallGroupLAT, 
        _smallGroupMarksman
    ]];

    //tiered 4-man groups
    _faction set ["groupTierAA", [
        [unit(militia, "SquadLeader"), unit(militia, "AA"), unit(militia, "AA"), unit(militia, "Rifleman")],
        [unit(military, "SquadLeader"), unit(military, "AA"), unit(military, "AA"), unit(military, "Rifleman")],
        [unit(elite, "SquadLeader"), unit(elite, "AA"), unit(elite, "AA"), unit(elite, "Rifleman")]
    ]];

    _faction set ["groupTierAT", [
        [unit(militia, "SquadLeader"), unit(militia, "AT"), unit(militia, "AT"), unit(militia, "Rifleman")],
        [unit(military, "SquadLeader"), unit(military, "AT"), unit(military, "AT"), unit(military, "Rifleman")],
        [unit(elite, "SquadLeader"), unit(elite, "AT"), unit(elite, "AT"), unit(elite, "LAT")]
    ]];

    private _fireteams = [
        [unit(militia, "SquadLeader"), unit(militia, "MachineGunner"), unit(militia, "Radioman"), unit(militia, "LAT"), unit(militia, "Rifleman")],
        [unit(military, "SquadLeader"), unit(military, "MachineGunner"), unit(military, "Radioman"), unit(military, "LAT"), unit(military, "Grenadier")],
        [unit(elite, "SquadLeader"), unit(elite, "MachineGunner"), unit(elite, "Radioman"), unit(elite, "LAT"), unit(elite, "Grenadier")]
    ];

    private _sniperTeams = [
        [unit(militia, "SquadLeader"), unit(militia, "Marksman"), unit(militia, "Rifleman"), unit(militia, "Rifleman"), unit(militia, "Sniper")],
        [unit(military, "SquadLeader"), unit(military, "Marksman"), unit(military, "Radioman"), unit(military, "Rifleman"), unit(military, "Sniper")],
        [unit(elite, "SquadLeader"), unit(elite, "Marksman"), unit(elite, "Radioman"), unit(elite, "LAT"), unit(elite, "Sniper")]
    ];

    _faction set ["groupsTierMedium", [
        _fireteams,
        _sniperTeams,
        _faction get "groupTierAA", 
        _faction get "groupTierAT"
    ]];

    _faction set ["groupsTierMediumNoAA", [
        _fireteams,
        _sniperTeams,
        _faction get "groupTierAT", 
        _faction get "groupTierAT"
    ]];

    _faction set ["groupsTierAirborne", [
        _fireteams,
        [
            [unit(militia, "SquadLeader"), unit(militia, "Rifleman"), unit(militia, "MachineGunner"), unit(militia, "LAT"), unit(militia, "LAT")],
            [unit(military, "SquadLeader"), unit(military, "Rifleman"), unit(military, "MachineGunner"), unit(military, "LAT"), unit(military, "LAT")],
            [unit(elite, "SquadLeader"), unit(elite, "Rifleman"), unit(elite, "MachineGunner"), unit(elite, "LAT"), unit(elite, "LAT")]
        ],
        [
            [unit(militia, "SquadLeader"), unit(militia, "Marksman"), unit(militia, "Rifleman"), unit(militia, "Grenadier"), unit(militia, "LAT")],
            [unit(military, "SquadLeader"), unit(military, "Marksman"), unit(military, "Rifleman"), unit(military, "Grenadier"), unit(military, "LAT")],
            [unit(elite, "SquadLeader"), unit(elite, "Marksman"), unit(elite, "Rifleman"), unit(elite, "Grenadier"), unit(elite, "LAT")]
        ]
    ]];

    //old randomised behaviour maintained because... reasons
    private _squads = [];
    for "_i" from 1 to 5 do {
        _squads pushBack [
            [
                unit(militia, "SquadLeader"),
                selectRandomWeighted [unit(militia, "LAT"), 2, unit(militia, "MachineGunner"), 1],
                selectRandomWeighted [unit(militia, "Rifleman"), 1.25, unit(militia, "Grenadier"), 1],
                selectRandomWeighted [unit(militia, "MachineGunner"), 2, unit(militia, "Marksman"), 1],
                selectRandomWeighted [unit(militia, "LAT"), 2, unit(militia, "AT"), 1],
                selectRandomWeighted [unit(militia, "AA"), 1, unit(militia, "Rifleman"), 3],
                selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Radioman"), 1],
                unit(militia, "Medic")
            ],
            [
                unit(military, "SquadLeader"),
                selectRandomWeighted [unit(military, "LAT"), 2, unit(military, "MachineGunner"), 1],
                selectRandomWeighted [unit(military, "Rifleman"), 1, unit(military, "Grenadier"), 1],
                selectRandomWeighted [unit(military, "MachineGunner"), 2, unit(military, "Marksman"), 1],
                selectRandomWeighted [unit(military, "LAT"), 1.5, unit(military, "AT"), 1.25],
                selectRandomWeighted [unit(military, "AA"), 1, unit(military, "Rifleman"), 3],
                selectRandomWeighted [unit(military, "Rifleman"), 1.5, unit(military, "Radioman"), 1],
                unit(military, "Medic")
            ],
            [
                unit(elite, "SquadLeader"),
                selectRandomWeighted [unit(elite, "LAT"), 2, unit(elite, "MachineGunner"), 1],
                selectRandomWeighted [unit(elite, "Rifleman"), 1.25, unit(elite, "Grenadier"), 1],
                selectRandomWeighted [unit(elite, "MachineGunner"), 2, unit(elite, "Marksman"), 1],
                selectRandomWeighted [unit(elite, "LAT"), 1, unit(elite, "AT"), 1.5],
                selectRandomWeighted [unit(elite, "AA"), 1, unit(elite, "Rifleman"), 2],
                selectRandomWeighted [unit(elite, "Rifleman"), 1, unit(elite, "Radioman"), 1],
                unit(elite, "Medic")
            ]
        ];
    };
    _faction set ["groupsTierSquads", _squads];

    private _squadsNoAA = [];
    for "_i" from 1 to 5 do {
       _squadsNoAA pushBack [
            [
                unit(militia, "SquadLeader"),
                selectRandomWeighted [unit(militia, "LAT"), 2, unit(militia, "MachineGunner"), 1],
                selectRandomWeighted [unit(militia, "Rifleman"), 1.25, unit(militia, "Grenadier"), 1],
                selectRandomWeighted [unit(militia, "MachineGunner"), 2, unit(militia, "Marksman"), 1],
                selectRandomWeighted [unit(militia, "LAT"), 2, unit(militia, "AT"), 1],
                selectRandomWeighted [unit(militia, "LAT"), 1, unit(militia, "Rifleman"), 3],
                selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Radioman"), 1],
                unit(militia, "Medic")
            ],
            [
                unit(military, "SquadLeader"),
                selectRandomWeighted [unit(military, "LAT"), 2, unit(military, "MachineGunner"), 1],
                selectRandomWeighted [unit(military, "Rifleman"), 1, unit(military, "Grenadier"), 1],
                selectRandomWeighted [unit(military, "MachineGunner"), 2, unit(military, "Marksman"), 1],
                selectRandomWeighted [unit(military, "LAT"), 1.5, unit(military, "AT"), 1.25],
                selectRandomWeighted [unit(military, "LAT"), 1, unit(military, "Rifleman"), 3],
                selectRandomWeighted [unit(military, "Rifleman"), 1.5, unit(military, "Radioman"), 1],
                unit(military, "Medic")
            ],
            [
                unit(elite, "SquadLeader"),
                selectRandomWeighted [unit(elite, "LAT"), 2, unit(elite, "MachineGunner"), 1],
                selectRandomWeighted [unit(elite, "Rifleman"), 1.25, unit(elite, "Grenadier"), 1],
                selectRandomWeighted [unit(elite, "MachineGunner"), 2, unit(elite, "Marksman"), 1],
                selectRandomWeighted [unit(elite, "LAT"), 1, unit(elite, "AT"), 1.5],
                selectRandomWeighted [unit(elite, "LAT"), 1, unit(elite, "Rifleman"), 2],
                selectRandomWeighted [unit(elite, "Rifleman"), 1, unit(elite, "Radioman"), 1],
                unit(elite, "Medic")
            ]
        ];
    };
    _faction set ["groupsTierSquadsNoAA", _squadsNoAA];//

    //compatibility with loadStat as it can't use tier flattener
    _faction set ["groupLoadStatReplacement", [
        unit(military, "SquadLeader"),
        unit(military, "LAT"),
        unit(military, "MachineGunner"),
        unit(military, "Rifleman"),
        unit(military, "Grenadier"),
        unit(military, "LAT"),
        unit(military, "AT"),
        unit(military, "AA"),
        unit(military, "Radioman"),
        unit(military, "Medic")
    ]];

    _faction set ["groupLoadStatReplacementNoAA", [
        unit(military, "SquadLeader"),
        unit(military, "LAT"),
        unit(military, "MachineGunner"),
        unit(military, "Rifleman"),
        unit(military, "Grenadier"),
        unit(military, "LAT"),
        unit(military, "AT"),
        unit(military, "LAT"),
        unit(military, "Radioman"),
        unit(military, "Medic")
    ]];

    private _specOpsRandom = [];
    for "_i" from 1 to 6 do {
        _specOpsRandom pushBack [
            unit(SF, "SquadLeader"),
            unit(SF, "Rifleman"),
            unit(SF, "Radioman"),
            selectRandom [unit(SF, "Grenadier"), unit(SF, "MachineGunner")],
            selectRandomWeighted [unit(SF, "LAT"), 2, unit(SF, "AT"), 1],
            unit(SF, "Medic"),
            selectRandomWeighted [unit(SF, "Marksman"), 2, unit(SF, "Sniper"), 1],
            selectRandom [
                unit(SF, "ExplosivesExpert")
                , unit(SF, "AA")
                , unit(SF, "Grenadier")
                , unit(SF, "Sniper")
                , unit(SF, "Engineer")
                , unit(SF, "MachineGunner")
            ]
        ];
    };

    _faction set ["groupSpecOpsRandom", _specOpsRandom];
    //_faction set ["groupSpecOpsSniper", [unit(SF, "Sniper"), unit(SF, "Rifleman")]];

    private _specOpsRandomNoAA = [];
    for "_i" from 1 to 6 do {
        _specOpsRandomNoAA pushBack [
            unit(SF, "SquadLeader"),
            unit(SF, "Rifleman"),
            unit(SF, "Radioman"),
            selectRandom [unit(SF, "Grenadier"), unit(SF, "MachineGunner")],
            selectRandomWeighted [unit(SF, "LAT"), 2, unit(SF, "AT"), 1],
            unit(SF, "Medic"),
            selectRandomWeighted [unit(SF, "Marksman"), 2, unit(SF, "Sniper"), 1],
            selectRandom [
                unit(SF, "ExplosivesExpert")
                , unit(SF, "LAT")
                , unit(SF, "Grenadier")
                , unit(SF, "Sniper")
                , unit(SF, "Engineer")
                , unit(SF, "MachineGunner")
            ]
        ];
    };

    _faction set ["groupSpecOpsRandomNoAA", _specOpsRandomNoAA];

    //militia
    _faction set ["groupsMilitiaSmall", [
        [unit(militia, "Grenadier"), unit(militia, "Rifleman")]
        , [unit(militia, "Marksman"), unit(militia, "Rifleman")]
        , [unit(militia, "Marksman"), unit(militia, "Grenadier")]
    ]];

    private _militiaMid = [];
    for "_i" from 1 to 6 do {
        _militiaMid pushBack [
            unit(militia, "SquadLeader"),
            unit(militia, "Grenadier"),
            selectRandom [
                unit(militia, "MachineGunner"),
                unit(militia, "Marksman"),
                unit(militia, "Medic"),
                unit(militia, "Engineer")
            ],
            selectRandom [unit(militia, "LAT"),unit(militia, "Rifleman")]
        ];
    };
    _faction set ["groupsMilitiaMedium", _militiaMid];

    private _militiaSquads = [];
    for "_i" from 1 to 5 do {
        _militiaSquads pushBack [
            unit(militia, "SquadLeader"),
            unit(militia, "MachineGunner"),
            unit(militia, "Grenadier"),
            unit(militia, "Rifleman"),
            selectRandom [unit(militia, "Rifleman"), unit(militia, "AT")],
            selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Marksman"), 1],
            selectRandom [unit(militia, "Rifleman"), unit(militia, "ExplosivesExpert")],
            unit(militia, "LAT"),
            unit(militia, "Medic")
        ];
    };
    _faction set ["groupsMilitiaSquads", _militiaSquads];

    //police
    _faction set ["groupPolice", [_faction get "unitPoliceOfficer", _faction get "unitPoliceGrunt"]];
    _faction set ["groupPoliceTeam", [
        _faction get "unitPoliceOfficer", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt"
    ]];
    _faction set ["groupPoliceSquad", [
        _faction get "unitPoliceOfficer", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt"
        , _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt", _faction get "unitPoliceGrunt"
    ]];

};

//-------------------|
// Rivals Group data |
//-------------------|

if (_prefix isEqualTo "riv") exitWith {
    _faction set ["unitCL", unit(militia, "CellLeader")];

    _faction set ["unitRifle", unit(militia, "Minuteman")];
    _faction set ["unitPartisan", unit(militia, "Partisan")];
    _faction set ["unitEnforcer", unit(militia, "Enforcer")];
    _faction set ["unitMercenary", unit(militia, "Mercenary")];
    _faction set ["unitSaboteur", unit(militia, "Oppressor")];
    _faction set ["unitOppressor", unit(militia, "Saboteur")];

    _faction set ["unitCommander", unit(militia, "Commander")];
    _faction set ["unitCrew", unit(militia, "Crew")];
    _faction set ["unitPilot", unit(militia, "Pilot")];

    _faction set ["groupsSentry", 
        [
            [unit(militia, "Partisan"), unit(militia, "Enforcer")],
            [unit(militia, "Mercenary"), unit(militia, "Oppressor")],
            [unit(militia, "Mercenary"), unit(militia, "Partisan")],
            [unit(militia, "Partisan"), unit(militia, "Saboteur")],
            [unit(militia, "Enforcer"), unit(militia, "Sharpshooter")]
        ]
    ];

    _faction set ["groupsAA", [
        [unit(militia, "CellLeader"), unit(militia, "Partisan"), unit(militia, "SpecialistAA"), unit(militia, "SpecialistAA")],
        [unit(militia, "CellLeader"), unit(militia, "Mercenary"), unit(militia, "Oppressor"), unit(militia, "SpecialistAA")],
        [unit(militia, "CellLeader"), unit(militia, "Enforcer"), unit(militia, "Oppressor"), unit(militia, "SpecialistAA")]
    ]];

    _faction set ["groupsAT", [
        [unit(militia, "CellLeader"), unit(militia, "Partisan"), unit(militia, "SpecialistAT"), unit(militia, "SpecialistAT")],
        [unit(militia, "CellLeader"), unit(militia, "Mercenary"), unit(militia, "SpecialistAT"), unit(militia, "SpecialistAT")],
        [unit(militia, "CellLeader"), unit(militia, "Enforcer"), unit(militia, "SpecialistAT"), unit(militia, "SpecialistAT")]
    ]];

    private _fireteams = [];
    for "_i" from 1 to 6 do {
        _fireteams pushBack [
            unit(militia, "CellLeader"),
            selectRandomWeighted [unit(militia, "Partisan"), 2, unit(militia, "Mercenary"), 1],
            selectRandomWeighted [unit(militia, "Enforcer"), 2, unit(militia, "Saboteur"), 1.5],
            selectRandomWeighted [unit(militia, "SpecialistAT"), 2, unit(militia, "Oppressor"), 1.25],
            selectRandomWeighted [unit(militia, "Medic"), 2, unit(militia, "ExplosivesExpert"), 1.25]
        ];
    };
    _faction set ["groupsFireteam", _fireteams];

    private _squads = [];
    for "_i" from 1 to 6 do {
        _squads pushBack [
            unit(militia, "CellLeader"),
            selectRandomWeighted [unit(militia, "Partisan"), 1.75, unit(militia, "Mercenary"), 1],
            selectRandomWeighted [unit(militia, "Saboteur"), 2, unit(militia, "Enforcer"), 1.5],
            selectRandomWeighted [unit(militia, "SpecialistAT"), 2, unit(militia, "Oppressor"), 1.25],
            selectRandomWeighted [unit(militia, "SpecialistAA"), 2, unit(militia, "Enforcer"), 1.25],
            selectRandomWeighted [unit(militia, "Oppressor"), 2, unit(militia, "Sharpshooter"), 1.25],
            unit(militia, "SpecialistAT"),
            unit(militia, "Medic")
        ];
    };
    _faction set ["groupsSquad", _squads];
};

//------------------|
// Rebel Group data |
//------------------|

if (_prefix isEqualTo "reb") exitWith {
    //singular units
    _faction set ["unitPetros", unit(militia, "Petros")];
    _faction set ["unitCrew", unit(militia, "staticCrew")];
    _faction set ["unitUnarmed", unit(militia, "Unarmed")];
    _faction set ["unitSniper", unit(militia, "Sniper")];
    _faction set ["unitLAT", unit(militia, "LAT")];
    _faction set ["unitMedic", unit(militia, "Medic")];
    _faction set ["unitMG", unit(militia, "MachineGunner")];
    _faction set ["unitExp", unit(militia, "ExplosivesExpert")];
    _faction set ["unitGL", unit(militia, "Grenadier")];
    _faction set ["unitRifle", unit(militia, "Rifleman")];
    _faction set ["unitSL", unit(militia, "SquadLeader")];
    _faction set ["unitEng", unit(militia, "Engineer")];
    _faction set ["unitAA", unit(militia, "AA")];
    _faction set ["unitAT", unit(militia, "AT")];

    //groups
    _faction set ["groupMedium", [_faction get "unitSL", _faction get "unitGL", _faction get "unitMG", _faction get "unitRifle"]];
    _faction set ["groupAT", [_faction get "unitSL", _faction get "unitMG", _faction get "unitAT", _faction get "unitLAT", _faction get "unitRifle"]];
    _faction set ["groupSquad", [
        _faction get "unitSL"
        , _faction get "unitGL"
        , _faction get "unitRifle"
        , _faction get "unitMG"
        , _faction get "unitSniper"
        , _faction get "unitLAT"
        , _faction get "unitAT"
        , _faction get "unitMedic"
    ]];
    _faction set ["groupSquadEng", [
        _faction get "unitSL"
        , _faction get "unitGL"
        , _faction get "unitRifle"
        , _faction get "unitMG"
        , _faction get "unitExp"
        , _faction get "unitLAT"
        , _faction get "unitEng"
        , _faction get "unitMedic"
    ]];
    _faction set ["groupSquadSupp", [
        _faction get "unitSL"
        , _faction get "unitAA"
        , _faction get "unitRifle"
        , _faction get "unitMG"
        , _faction get "unitLAT"
        , _faction get "unitMedic"
        , _faction get "unitCrew"
        , _faction get "unitCrew"
    ]];
    _faction set ["groupSniper", double( _faction get "unitSniper" )];
    _faction set ["groupSentry", [_faction get "unitGL", _faction get "unitRifle"]];

    _faction set ["unitsSoldiers", (_faction get "groupSquadEng") + [_faction get "unitSniper", _faction get "unitCrew", _faction get "unitAA", _faction get "unitAT"]];

    _faction set ["groupAaEmpl", [
        _faction get "unitSL"
        , _faction get "unitMG"
        , _faction get "unitRifle"
        , _faction get "unitRifle"
        , _faction get "unitAA"
        , _faction get "unitMedic"
    ]];
    _faction set ["groupAtEmpl", [
        _faction get "unitSL"
        , _faction get "unitRifle"
        , _faction get "unitAT"
        , _faction get "unitLAT"
        , _faction get "unitRifle"
        , _faction get "unitMedic"
    ]];
    _faction set ["groupHmgEmpl", [
        _faction get "unitSL"
        , _faction get "unitMG"
        , _faction get "unitRifle"
        , _faction get "unitRifle"
        , _faction get "unitLAT"
        , _faction get "unitMedic"
    ]];

    _faction set ["groupCrew", [
        _faction get "unitCrew"
        , _faction get "unitCrew"
        , _faction get "unitEng"
    ]];
};

//------------------|
// Civ Group data |
//------------------|

//singular units
_faction set ["unitMan", unit(militia, "Man")];
_faction set ["unitPress", unit(militia, "Press")];
_faction set ["unitWorker", unit(militia, "Worker")];
_faction set ["unitSpecial", unit(militia, "Special")];
