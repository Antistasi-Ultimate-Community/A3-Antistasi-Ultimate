params ["_unit"];

private _rankX = _unit getVariable ["rankX","PRIVATE"];
private _idRank = nil;
private _newRank = nil;

switch (_rankX) do {
	case "PRIVATE": {_idRank= 1; _newRank = "CORPORAL"};
	case "CORPORAL": {_idRank = 2; _newRank = "SERGEANT"};
	case "SERGEANT": {_idRank = 3; _newRank = "LIEUTENANT"};
	case "LIEUTENANT": {_idRank = 4; _newRank = "CAPTAIN"};
	case "CAPTAIN": {_idRank = 5; _newRank = "MAJOR"};
	case "MAJOR": {_idRank = 6; _newRank = "COLONEL"};
	case "COLONEL": {_idRank = 7; _newRank = "COLONEL"};
};


[_idRank,_newRank];
