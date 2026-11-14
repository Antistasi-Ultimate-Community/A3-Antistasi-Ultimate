private _sourceString = _this;

// if (count _sourceString < 24) exitWith {_sourceString};

private _stringParts = _sourceString splitString "_";

if (_stringParts isEqualTo []) exitWith {_sourceString};

private _result = _stringParts select 3; //loadouts_reb_militia_LOADOUT
_result = toUpperANSI _result;

_result
