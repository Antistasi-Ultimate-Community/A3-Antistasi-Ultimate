_cslaMilitaryMGOptics = ["US85_sc4x20M249", 1, "US85_sc2000M249", 2, "", 2];
_cslaMilitaryM16Attachments = ["US85_M16fl", 1, "", 2];
_cslaMilitaryM16Optics = ["US85_sc2000_M16", 1, "", 2];
_cslaMilitaryM16SlOptics = ["US85_sc2000_M16", 1, "US85_sc4x20_M16", 2, "", 1];
_cslaMilitaryFALOptics = ["US85_scFAL", 1, "", 4];
_cslaFALBipods = ["US85_FALbpd", 1, "", 8];

(_militaryLoadoutData get "machineGuns") append [
    ["US85_M60","","","",["US85_100Rnd_762x51","US85_100Rnd_762x51","US85_100Rnd_762x51"],[],""], 2,
    ["US85_M249","","",_cslaMilitaryMGOptics,["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"],[],""], 4
];
(_militaryLoadoutData get "slRifles") append [
    ["US85_M16A2","",_cslaMilitaryM16Attachments,_cslaMilitaryM16SlOptics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 3,
    ["US85_M16A1","",_cslaMilitaryM16Attachments,_cslaMilitaryM16SlOptics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 1,
    ["US85_FALf","","",_cslaMilitaryFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 3,
    ["US85_FAL","","","US85_scFAL",["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 2
];
(_militaryLoadoutData get "rifles") append [
    ["US85_M16A2","",_cslaMilitaryM16Attachments,"US85_sc2000_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 3,
    ["US85_M16A1","",_cslaMilitaryM16Attachments,"US85_sc2000_M16",["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 0.75,
    ["US85_FALf","","",_cslaMilitaryFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 1,
    ["US85_FAL","","",_cslaMilitaryFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 1.5
];
(_militaryLoadoutData get "grenadeLaunchers") append [
    ["US85_M16A2GL","","",_cslaMilitaryM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],["US85_M406","US85_M406","US85_M406","US85_M583A1"],""], 2,
    ["US85_M16A2CARGL","","",_cslaMilitaryM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],["US85_M406","US85_M406","US85_M406","US85_M583A1"],""], 1
];
(_militaryLoadoutData get "carbines") append [
    ["US85_M16A2CAR","",_cslaMilitaryM16Attachments,_cslaMilitaryM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 3
];
//////////////////////////////////////////////////////
_cslaMilitiaMGOptics = ["US85_sc4x20M249", 1, "US85_sc2000M249", 2, "", 8];
(_militiaLoadoutData get "machineGuns") append [
    ["US85_M60","","","",["US85_100Rnd_762x51","US85_100Rnd_762x51","US85_100Rnd_762x51"],[],""], 6,
    ["US85_M249","","",_cslaMilitiaMGOptics,["US85_200Rnd_556x45","US85_200Rnd_556x45","US85_200Rnd_556x45"],[],""], 12
];

_cslaMilitiaM16Attachments = ["US85_M16fl", 1, "", 4];
_cslaMilitiaM16Optics = ["US85_sc2000_M16", 1, "", 5];
_cslaMilitaM16SlOptics = ["US85_sc2000_M16", 1, "US85_sc4x20_M16", 2, "", 3];
_cslaMilitiaFALOptics = ["US85_scFAL", 1, "", 7];


(_militiaLoadoutData get "slRifles") append [
    ["US85_M16A2","",_cslaMilitiaM16Attachments,_cslaMilitaM16SlOptics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 6,
    ["US85_M16A1","",_cslaMilitiaM16Attachments,_cslaMilitaM16SlOptics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 3,
    ["US85_FALf","","",_cslaMilitiaFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 6,
    ["US85_FAL","","",_cslaMilitiaFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],_cslaFALBipods], 3
];
(_militiaLoadoutData get "rifles") append [
    ["US85_M16A2","",_cslaMilitiaM16Attachments,_cslaMilitiaM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 8,
    ["US85_M16A1","",_cslaMilitiaM16Attachments,_cslaMilitiaM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 4,
    ["US85_FALf","","",_cslaMilitiaFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],"US85_FALbpd"], 2,
    ["US85_FAL","","",_cslaMilitiaFALOptics,["US85_20Rnd_762M61","US85_20Rnd_762M61","US85_20Rnd_762x51"],[],"US85_FALbpd"], 4
];
(_militiaLoadoutData get "grenadeLaunchers") append [
    ["US85_M16A2GL","","",_cslaMilitiaM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],["US85_M406","US85_M406","US85_M406","US85_M583A1"],""], 8,
    ["US85_M16A2CARGL","","",_cslaMilitiaM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],["US85_M406","US85_M406","US85_M406","US85_M583A1"],""], 4
];
(_militiaLoadoutData get "carbines") append [
    ["US85_M16A2CAR","",_cslaMilitiaM16Attachments,_cslaMilitiaM16Optics,["US85_30Rnd_556x45","US85_30Rnd_556x45","US85_30Rnd_556x45"],[],""], 10
];
(_militiaLoadoutData get "marksmanRifles") append [
    ["US85_M14","","","US85_scM21",["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762M61"],[],"US85_M14bpd"], 12,
    ["US85_M21","","","US85_scM21",["US85_20Rnd_762x51","US85_20Rnd_762x51","US85_20Rnd_762M61"],[],"US85_M14bpd"], 8
];
(_militiaLoadoutData get "sniperRifles") append [
    ["CSLA_HuntingRifle","","","",["CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt","CSLA_10Rnd_762hunt"],[],""], 4
];



















