private _templateMan = {
    ["headgear"] call _fnc_setHelmet;
    ["vests"] call _fnc_setVest;
    ["uniforms"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templateWorker = {
    ["headgearWorker"] call _fnc_setHelmet;
    ["vestsWorker"] call _fnc_setVest;
    ["uniformsWorker"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templatePress = {
    ["headgearPress"] call _fnc_setHelmet;
    ["vestsPress"] call _fnc_setVest;
    ["uniformsPress"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;
};

private _templateVIP = {
    ["uniformsVIP"] call _fnc_setUniform;

    ["items_medical_standard"] call _fnc_addItemSet;

    ["maps"] call _fnc_addMap;
    ["watches"] call _fnc_addWatch;
    ["compasses"] call _fnc_addCompass;

    ["sidearms"] call _fnc_setHandgun;
    ["handgun", 2] call _fnc_addMagazines;
};

private _prefix = "militia";
private _unitTypes = [
    ["VIP", _templateVIP],
    ["Press", _templatePress],
    ["Worker", _templateWorker],
    ["Man", _templateMan]
];

[_prefix, _unitTypes, _loadoutData] call _fnc_generateAndSaveUnitsToTemplate;
