(_loadoutData get "antiInfantryGrenades") append [
    "CSLA_F1","CSLA_RG4o","CSLA_RG4u","CSLA_URG86u","CSLA_URG86o"
];
(_loadoutData get "lightExplosives") append [
    "CSLA_TNT0100g"
];
(_loadoutData get "APMines") append [
    "CSLA_F1m_mag","US85_M67m_mag","CSLA_NO2","CSLA_RG4m_mag","CSLA_URG86m_mag","CSLA_PPMiNa_mag"
];
(_loadoutData get "ATMines") append [
    "CSLA_PtMiBa3_mag"
];

_rpgs append [
    ["US85_M136", "", "", "", ["US85_M136_Mag"], [], ""],
    ["US85_M47", "", "", "", ["US85_M47_Mag"], [], ""],
    ["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""],
	["CSLA_RPG75", "", "", "", ["CSLA_RPG75_Mag", "CSLA_RPG75_Mag"], [], ""],
	["CSLA_RPG7", "", "", "CSLA_PGO7", ["CSLA_PG7M110V", "CSLA_PG7M110V"], [], ""]
];
(_loadoutData get "lightHELaunchers") append [
    ["US85_LAW72", "", "", "", ["US85_LAW72_Mag", "US85_LAW72_Mag"], [], ""],
    ["US85_MAAWS", "", "", "", ["US85_MAAWS_HEDP","US85_MAAWS_HEDP","US85_MAAWS_HEAT"], [], ""],
	["US85_SMAW", "", "", "", ["US85_SMAW_HEAA","US85_SMAW_HEAA","US85_SMAW_HEDP"], [], ""]
];
(_loadoutData get "AALaunchers") append [
    ["CSLA_9K32", "", "", "", ["CSLA_9M32M","CSLA_9M32M"], [], ""],
	["US85_FIM92", "", "", "", ["US85_FIM92_Mag","US85_FIM92_Mag"], [], ""]
];
_gls append [
	["US85_M16A2CARGL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
	["US85_M16A2GL", "", "", "US85_sc2000_M16", ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], ["US85_M406","US85_M406","US85_M406"], ""],
	["CSLA_VG70", "", "", "", ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], ["CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5vz70","CSLA_26_5sigZl1a"], "CSLA_Sa58bnt"]
];
_rifles append [
	["US85_FAL", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
	["US85_FALf", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
	["US85_M14", "", "", "",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], ""],
	["US85_M16A1", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["US85_M16A2", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["CSLA_Sa58P", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], ""],
	["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
_carbines append [
    ["US85_M16A2CAR", "", "", "",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
    ["US85_MPVN", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
	["US85_MPVSD", "", "", "", ["US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger","US85_MPV_30Rnd_9Luger"], [], ""],
    ["CSLA_rSa61", "", "", "", ["CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27"], [], ""],
	["CSLA_Sa24", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""],
	["CSLA_Sa26", "", "", "",  ["CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52", "CSLA_Sa24_32rnd_7_62Pi52"], [], ""]
];
_tunedRifles append [
    ["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
    ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
	["US85_M16A2CAR", "US85_M16tlm","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
    ["US85_M16A1", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["US85_M16A2", "US85_M16tlm", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
_marksmanRifles append [
    ["CSLA_HuntingRifle","","","",["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt", "CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"], [], "gm_msg90_bipod_blk"],
    ["US85_M14","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
	["US85_M21","","","US85_scM21",["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_M14bpd"],
	["CSLA_OP63","","","CSLA_PSO1_OP63",["CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59","CSLA_OP63_10rnd_7_62Odst59","CSLA_OP63_10rnd_7_62PZ59"], [], ""]
];
_enforcerRifles append [
    ["US85_FAL", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
    ["US85_FALf", "", "", "US85_scFAL",  ["US85_20Rnd_762x51", "US85_20Rnd_762M61", "US85_20Rnd_762M61"], [], "US85_FALbpd"],
	["US85_M16A2CAR", "","US85_M16fl","US85_sc4x20_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
    ["US85_M16A1", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["US85_M16A2", "", "", "US85_sc4x20_M16",  ["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_20Rnd_556x45","US85_20Rnd_556x45"], [], ""],
	["CSLA_Sa58P", "","","CSLA_ZD4x8",["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"],
	["CSLA_Sa58V", "", "", "",  ["CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62vz43","CSLA_Sa58_30rnd_7_62Sv43","CSLA_Sa58_30rnd_7_62Sv43"], [], "CSLA_Sa58bpd"]
];
_mgs append [
    ["US85_M249", "", "", "US85_sc4x20M249", ["US85_200Rnd_556x45","US85_200Rnd_556x45"], [], ""],
	["US85_M60", "", "", "", ["US85_100Rnd_762x51","US85_100Rnd_762x51"], [], ""],
    ["CSLA_UK59L", "", "", "CSLA_UK59_ZD4x8", ["CSLA_UK59_50rnd_7_62vz59","CSLA_UK59_50rnd_7_62Sv59","CSLA_UK59_50rnd_7_62PZ59","CSLA_UK59_50rnd_7_62Tz59","CSLA_UK59_50rnd_7_62TzSv59"], [], ""]
];
_pistols append [
    ["US85_1911", "", "", "", ["US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP","US85_1911_7Rnd_045ACP"], [], ""],
    ["US85_M9", "", "", "", ["US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger","US85_M9_15Rnd_9Luger"], [], ""],
    ["CSLA_Pi52", "", "", "", ["CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52","CSLA_Pi52_8rnd_7_62Pi52"], [], ""],
    ["CSLA_Pi75lr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
    ["CSLA_Pi75sr", "", "", "", ["CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger","CSLA_Pi75_15Rnd_9Luger"], [], ""],
    ["CSLA_Pi82", "", "", "", ["CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82","CSLA_Pi82_12rnd_9Pi82"], [], ""],
    ["CSLA_Sa61", "", "", "", ["CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_10rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27","CSLA_Sa61_20rnd_7_65Pi27"], [], ""]
];