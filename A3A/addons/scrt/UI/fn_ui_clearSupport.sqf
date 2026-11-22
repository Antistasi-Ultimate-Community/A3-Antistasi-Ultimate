if(!isNil "supportCooldown" && {supportCooldown}) then {
    waitUntil {supportCooldown isEqualTo false};
};

if (!isNil "supportMarkerOrigin") then {
    deleteMarkerLocal supportMarkerOrigin;
    supportMarkerOrigin = nil;
};

if (!isNil "supportMarkerDestination") then {
    deleteMarkerLocal supportMarkerDestination;
    supportMarkerDestination = nil;
};

//for some reason code above sometimes is not enough
deleteMarkerLocal "BRStart";
deleteMarkerLocal "BRFin";

if (!isNil "forbiddenParadropZones") then {
    {deleteMarkerLocal _x} forEach forbiddenParadropZones;
};

if (getMarkerColor "LootHeliAreaMarker" != "") then {
    deleteMarkerLocal "LootHeliAreaMarker";
};
