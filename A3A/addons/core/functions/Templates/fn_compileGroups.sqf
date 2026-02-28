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

private _aaGroupChance = if { aaChance <= 0.5 } then {0} else {aaChance};
private _atGroupChance = if { atChance <= 0.5 } then {0} else {atChance};
private _latGroupChance = if { latChance <= 0.5 } then {0} else {latChance};

if (_prefix in ["occ", "inv"]) exitWith {
    //singular tiered units
    _faction set ["unitTierStaticCrew", [
        unit(militia, "Rifleman"),
        unit(military, "Rifleman"),
        unit(elite, "Rifleman")
    ]];

    _faction set ["unitRifle", [unit(militia, "Rifleman"),unit(military, "Rifleman"),unit(elite, "Rifleman")]];

    _faction set ["unitTierGuard", [
        [unit(militia, "Rifleman"), unit(military, "Rifleman"), unit(elite, "Rifleman")],
        [unit(militia, "Grenadier"), unit(military, "Grenadier"), unit(elite, "Grenadier")],
        [
            selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 2 - latChance],
            selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 1 - latChance],
            selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance]
        ],
        [unit(militia, "MachineGunner"), unit(military, "MachineGunner"), unit(elite, "MachineGunner")]
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
        [
            selectRandomWeighted [unit(militia, "LAT"), _latGroupChance, unit(militia, "Rifleman"), 1 - _latGroupChance],
            unit(militia, "Rifleman")
        ],
        [
            selectRandomWeighted [unit(military, "LAT"), _latGroupChance, unit(military, "Rifleman"), 1 - _latGroupChance],
            unit(military, "Rifleman")
        ],
        [
            selectRandomWeighted [unit(elite, "LAT"), _latGroupChance, unit(elite, "Rifleman"), 1 - _latGroupChance],
            unit(elite, "Rifleman")
        ]
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
        [
            unit(militia, "SquadLeader"),
            selectRandomWeighted [unit(militia, "AA"), _aaGroupChance, unit(militia, "Rifleman"), 3 - _aaGroupChance],
            selectRandomWeighted [unit(militia, "AA"), _aaGroupChance, unit(militia, "Rifleman"), 3 - _aaGroupChance],
            unit(militia, "Rifleman")
        ],
        [
            unit(military, "SquadLeader"),
            selectRandomWeighted [unit(military, "AA"), _aaGroupChance, unit(military, "Rifleman"), 2 - _aaGroupChance],
            selectRandomWeighted [unit(military, "AA"), _aaGroupChance, unit(military, "Rifleman"), 2 - _aaGroupChance],
            unit(military, "Rifleman")
        ],
        [
            unit(elite, "SquadLeader"),
            selectRandomWeighted [unit(elite, "AA"), _aaGroupChance, unit(elite, "Rifleman"), 1 - _aaGroupChance],
            selectRandomWeighted [unit(elite, "AA"), _aaGroupChance, unit(elite, "Rifleman"), 1 - _aaGroupChance],
            unit(elite, "Rifleman")
        ]
    ]];

    _faction set ["groupTierAT", [
        [
            unit(militia, "SquadLeader"),
            selectRandomWeighted [unit(militia, "AT"), _atGroupChance, unit(militia, "Rifleman"), 3 - _atGroupChance],
            selectRandomWeighted [unit(militia, "AT"), _atGroupChance, unit(militia, "Rifleman"), 3 - _atGroupChance],
            unit(militia, "Rifleman")
        ],
        [
            unit(military, "SquadLeader"),
            selectRandomWeighted [unit(military, "AT"), _atGroupChance, unit(military, "Rifleman"), 2 - _atGroupChance],
            selectRandomWeighted [unit(military, "AT"), _atGroupChance, unit(military, "Rifleman"), 2 - _atGroupChance],
            unit(military, "Rifleman")
        ],
        [
            unit(elite, "SquadLeader"),
            selectRandomWeighted [unit(elite, "AT"), _atGroupChance, unit(elite, "Rifleman"), 2 - _atGroupChance],
            selectRandomWeighted [unit(elite, "AT"), _atGroupChance, unit(elite, "Rifleman"), 1 - _atGroupChance],
            selectRandomWeighted [unit(elite, "LAT"), _latGroupChance, unit(elite, "Rifleman"), 1 - _latGroupChance]
        ]
    ]];

    _faction set ["groupTierFireteam", [
        [unit(militia, "SquadLeader"), unit(militia, "MachineGunner"), unit(militia, "Medic"), unit(militia, "Rifleman"), unit(militia, "Rifleman"), unit(militia, "Rifleman")],
        [
            unit(military, "SquadLeader"),
            unit(military, "MachineGunner"),
            unit(military, "Marksman"),
            unit(military, "Medic"),
            unit(military, "Rifleman"),
            selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 2 - latChance]
        ],
        [
            unit(elite, "SquadLeader"),
            unit(elite, "MachineGunner"),
            unit(elite, "Sniper"),
            unit(elite, "Medic"),
            unit(elite, "Rifleman"),
            selectRandomWeighted [unit(elite, "AT"), atChance, unit(elite, "Rifleman"), 1 - atChance]
        ]
    ]];

    private _fireteams = [
        [
            unit(militia, "SquadLeader"),
            unit(militia, "MachineGunner"),
            unit(militia, "Radioman"),
            selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 3 - latChance],
            unit(militia, "Rifleman")
        ],
        [
            unit(military, "SquadLeader"),
            unit(military, "MachineGunner"),
            unit(military, "Radioman"),
            selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 2 - latChance],
            unit(military, "Grenadier")
        ],
        [
            unit(elite, "SquadLeader"),
            unit(elite, "MachineGunner"),
            unit(elite, "Radioman"),
            selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance],
            unit(elite, "Grenadier")
        ]
    ];

    private _sniperTeams = [
        [unit(militia, "SquadLeader"), unit(militia, "Marksman"), unit(militia, "Rifleman"), unit(militia, "Rifleman"), unit(militia, "Sniper")],
        [unit(military, "SquadLeader"), unit(military, "Marksman"), unit(military, "Radioman"), unit(military, "Rifleman"), unit(military, "Sniper")],
        [
            unit(elite, "SquadLeader"),
            unit(elite, "Marksman"),
            unit(elite, "Radioman"),
            selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance],
            unit(elite, "Sniper")
        ]
    ];

    _faction set ["groupsTierMedium", [
        _fireteams,
        _sniperTeams,
        _faction get "groupTierAA", 
        _faction get "groupTierAT"
    ]];

    _faction set ["groupsTierAirborne", [
        _fireteams,
        [
            [
                unit(militia, "SquadLeader"),
                unit(militia, "Rifleman"),
                unit(militia, "MachineGunner"),
                selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 3 - latChance],
                selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 3 - latChance]
            ],
            [
                unit(military, "SquadLeader"),
                unit(military, "Rifleman"),
                unit(military, "MachineGunner"),
                selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 2 - latChance],
                selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 2 - latChance]
            ],
            [
                unit(elite, "SquadLeader"),
                unit(elite, "Rifleman"),
                unit(elite, "MachineGunner"),
                selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance],
                selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance]
            ]
        ],
        [
            [
                unit(militia, "SquadLeader"),
                unit(militia, "Marksman"),
                unit(militia, "Rifleman"),
                unit(militia, "Grenadier"),
                selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 2 - latChance]
            ],
            [
                unit(military, "SquadLeader"),
                unit(military, "Marksman"),
                unit(military, "Rifleman"),
                unit(military, "Grenadier"),
                selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 1 - latChance]
            ],
            [
                unit(elite, "SquadLeader"),
                unit(elite, "Marksman"),
                unit(elite, "Rifleman"),
                unit(elite, "Grenadier"),
                selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "Rifleman"), 1 - latChance]
            ]
        ]
    ]];

    //old randomised behaviour maintained because... reasons
    private _squads = [];
    for "_i" from 1 to 5 do {
        _squads pushBack [
            [
                unit(militia, "SquadLeader"),
                selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "MachineGunner"), 1 - latChance],
                selectRandomWeighted [unit(militia, "Rifleman"), 1.25, unit(militia, "Grenadier"), 1],
                selectRandomWeighted [unit(militia, "MachineGunner"), 2, unit(militia, "Marksman"), 1],
                selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "AT"), atChance, unit(militia, "Rifleman"), max(0, 1 - latChance - atChance)],
                selectRandomWeighted [unit(militia, "AA"), aaChance, unit(militia, "Rifleman"), 3 - aaChance],
                selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Radioman"), 1],
                unit(militia, "Medic")
            ],
            [
                unit(military, "SquadLeader"),
                selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "MachineGunner"), 1 - latChance],
                selectRandomWeighted [unit(military, "Rifleman"), 1, unit(military, "Grenadier"), 1],
                selectRandomWeighted [unit(military, "MachineGunner"), 2, unit(military, "Marksman"), 1],
                selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "AT"), atChance, unit(military, "Rifleman"), max(0, 1 - latChance - atChance)],
                selectRandomWeighted [unit(military, "AA"), aaChance, unit(military, "Rifleman"), 2 - aaChance],
                selectRandomWeighted [unit(military, "Rifleman"), 1.5, unit(military, "Radioman"), 1],
                unit(military, "Medic")
            ],
            [
                unit(elite, "SquadLeader"),
                selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "MachineGunner"), 1 - latChance],
                selectRandomWeighted [unit(elite, "Rifleman"), 1.25, unit(elite, "Grenadier"), 1],
                selectRandomWeighted [unit(elite, "MachineGunner"), 2, unit(elite, "Marksman"), 1],
                selectRandomWeighted [unit(elite, "LAT"), latChance, unit(elite, "AT"), atChance, unit(elite, "Rifleman"), max(0, 1 - latChance - atChance)],
                selectRandomWeighted [unit(elite, "AA"), aaChance, unit(elite, "Rifleman"), 1 - aaChance],
                selectRandomWeighted [unit(elite, "Rifleman"), 1, unit(elite, "Radioman"), 1],
                unit(elite, "Medic")
            ]
        ];
    };
    _faction set ["groupsTierSquads", _squads];

    //compatibility with loadStat as it can't use tier flattener
    _faction set ["groupLoadStatReplacement", [
        unit(military, "SquadLeader"),
        selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "Rifleman"), 1 - latChance],
        unit(military, "MachineGunner"),
        unit(military, "Rifleman"),
        unit(military, "Grenadier"),
        selectRandomWeighted [unit(military, "LAT"), latChance, unit(military, "MachineGunner"), 1 - latChance],
        selectRandomWeighted [unit(military, "AT"), atChance, unit(military, "Rifleman"), 1 - atChance],
        selectRandomWeighted [unit(military, "AA"), aaChance, unit(military, "Rifleman"), 1 - aaChance],
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
            selectRandomWeighted [unit(SF, "LAT"), latChance, unit(SF, "AT"), atChance, unit(SF, "Rifleman"), max(0, 1 - latChance - atChance)],
            unit(SF, "Medic"),
            selectRandomWeighted [unit(SF, "Marksman"), 2, unit(SF, "Sniper"), 1],
            selectRandomWeighted [
                unit(SF, "ExplosivesExpert"), 3,
                unit(SF, "AA"), aaChance,
                unit(SF, "Grenadier"), 3,
                unit(SF, "Sniper"), 3,
                unit(SF, "Engineer"), 3,
                unit(SF, "MachineGunner"), 3
            ]
        ];
    };

    _faction set ["groupSpecOpsRandom", _specOpsRandom];
    //_faction set ["groupSpecOpsSniper", [unit(SF, "Sniper"), unit(SF, "Rifleman")]];

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
            selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 1 - latChance]
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
            selectRandomWeighted [unit(militia, "AT"), atChance, unit(militia, "Rifleman"), 1 - atChance],
            selectRandomWeighted [unit(militia, "Rifleman"), 2, unit(militia, "Marksman"), 1],
            selectRandom [unit(militia, "Rifleman"), unit(militia, "ExplosivesExpert")],
            selectRandomWeighted [unit(militia, "LAT"), latChance, unit(militia, "Rifleman"), 1 - latChance],
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
    _faction set ["groupPoliceOfficers", [
        _faction get "unitPoliceOfficer", 
        _faction get "unitPoliceOfficer", 
        _faction get "unitPoliceOfficer",
        _faction get "unitPoliceOfficer",
        _faction get "unitPoliceOfficer",
        _faction get "unitPoliceOfficer"
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
        [
            unit(militia, "CellLeader"),
            unit(militia, "Partisan"),
            selectRandomWeighted [unit(militia, "SpecialistAA"), _aaGroupChance, unit(militia, "Partisan"), 3 - _aaGroupChance],
            selectRandomWeighted [unit(militia, "SpecialistAA"), _aaGroupChance, unit(militia, "Partisan"), 3 - _aaGroupChance]
        ],
        [
            unit(militia, "CellLeader"),
            unit(militia, "Mercenary"),
            unit(militia, "Oppressor"),
            selectRandomWeighted [unit(militia, "SpecialistAA"), _aaGroupChance, unit(militia, "Mercenary"), 2 - _aaGroupChance]
        ],
        [
            unit(militia, "CellLeader"),
            unit(militia, "Enforcer"),
            unit(militia, "Oppressor"),
            selectRandomWeighted [unit(militia, "SpecialistAA"), _aaGroupChance, unit(militia, "Enforcer"), 1 - _aaGroupChance]
        ]
    ]];

    _faction set ["groupsAT", [
        [
            unit(militia, "CellLeader"),
            unit(militia, "Partisan"),
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Partisan"), 3 - _latGroupChance],
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Partisan"), 3 - _latGroupChance]
        ],
        [
            unit(militia, "CellLeader"),
            unit(militia, "Mercenary"),
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Mercenary"), 2 - _latGroupChance],
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Mercenary"), 2 - _latGroupChance]
        ],
        [
            unit(militia, "CellLeader"),
            unit(militia, "Enforcer"),
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Enforcer"), 1 - _latGroupChance],
            selectRandomWeighted [unit(militia, "SpecialistAT"), _latGroupChance, unit(militia, "Enforcer"), 1 - _latGroupChance]
        ]
    ]];

    private _fireteams = [];
    for "_i" from 1 to 6 do {
        _fireteams pushBack [
            unit(militia, "CellLeader"),
            selectRandomWeighted [unit(militia, "Partisan"), 2, unit(militia, "Mercenary"), 1],
            selectRandomWeighted [unit(militia, "Enforcer"), 2, unit(militia, "Saboteur"), 1.5],
            selectRandomWeighted [unit(militia, "SpecialistAT"), latChance, unit(militia, "Oppressor"), 1.25 - latChance],
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
            selectRandomWeighted [unit(militia, "SpecialistAT"), latChance, unit(militia, "Oppressor"), 1.25 - latChance],
            selectRandomWeighted [unit(militia, "SpecialistAA"), aaChance, unit(militia, "Enforcer"), 1.25 - aaChance],
            selectRandomWeighted [unit(militia, "Oppressor"), 2, unit(militia, "Sharpshooter"), 1.25],
            selectRandomWeighted [unit(militia, "SpecialistAT"), latChance, unit(militia, "Oppressor"), 1.25 - latChance],
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
