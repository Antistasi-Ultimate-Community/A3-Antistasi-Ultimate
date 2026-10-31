params [
    ["_placesToKeep", ["NameCityCapital","NameCity","NameVillage", "NameLocal"]]
];

private _placesConfigs = configFile >> "CfgWorlds" >> worldName >> "Names";
private _places = [];  

for "_i" from 0 to (count _placesConfigs) - 1 do { 
    private _place = _placesConfigs select _i; 
    private _name = configName _place; 
    private _position = getArray (_place >> "position"); 
    private _type = getText(_place >> "type"); 
    if(_type in _placesToKeep) then { 
        _places set [_i, [_name, _position, _type]]; 
    }; 
};

_places select {!isNil "_x"}
