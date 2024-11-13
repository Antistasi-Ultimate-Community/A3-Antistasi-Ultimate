private _className = param [0];
private _classes = "getText(_x >> 'source') == 'user' && isText(_x >> 'displayName')" configClasses (configFile >> "cfgVehicles" >> _className >> "AnimationSources");

_classes apply { [configName(_x), if (isText(_x >> "displayName")) then { getText(_x >> "displayName") } else { configName(_x) }] };
