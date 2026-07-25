private _className = param [0];
private _classes = "true" configClasses (configFile >> "cfgVehicles" >> _className >> "TextureSources");

_classes apply { [configName(_x), getText(_x >> "displayName")] };
