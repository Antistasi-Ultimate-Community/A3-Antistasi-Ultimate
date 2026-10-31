private _outputData = [];

"(getText (_x >> ""type"") in [""NameCityCapital"", ""NameCity"", ""NameVillage"", ""CityCenter""]) && !(getText (_x >> ""Name"") isEqualTo """")"
configClasses (configFile >> "CfgWorlds" >> worldName >> "Names") apply
{
   _nameX = configName _x;
   _sizeX = getNumber (_x >> "radiusA");
   _sizeY = getNumber (_x >> "radiusB");
   _size = [_sizeY, _sizeX] select (_sizeX > _sizeY);
   _pos = getArray (_x >> "position");
   _size = [_size, 400] select (_size < 400);
   _type = getText (_x >> "type");

   _numCiv = if (!isNil "server") then {server getVariable [_namex,0]} else {0};
   if (_numCiv isEqualTo 0 || {!(_numCiv isEqualType 0)}) then
   {
        _numCiv = (count (nearestObjects [_pos, ["house"], _size]));
   };

   _outputData pushBack [_namex, _numCiv, _type, _pos, _sizeX, _sizeY];
};

_outputData
