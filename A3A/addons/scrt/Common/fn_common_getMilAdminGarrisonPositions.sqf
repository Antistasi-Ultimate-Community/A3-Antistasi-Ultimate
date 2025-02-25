params [
	["_building", objNull, [objNull]]
];

if (isNull _building) exitWith {
	[[],[], [], []]
};

private _powPositions = nil;
private _itemPositions = nil;
private _soldierPositions = nil;
private _collaborantPositions = nil;

private _buildingPositions = [_building] call BIS_fnc_buildingPositions;
private _buildingType = typeOf _building;

switch(_buildingType) do {
    case "Land_zachytka": {
        _powPositions = [43, 44, 53, 54, 55, 59, 61];
        _itemPositions = [64];
        _soldierPositions = [0,12,13,14,16,17,18,19,20,21,22,23,25,29,34,38,47,49,56,67,68,69,70,71,72,73,74,75,76,77,78,79];
        _collaborantPositions = [24, 28, 50, 51, 63];
    };
    case "land_policestation_01_f": {
        _powPositions = [0, 4];
        _itemPositions = [6];
        _soldierPositions = [1,2,5,7,8,9,10,11,12];
        _collaborantPositions = [3,6,7];
    };
    case "Land_PoliceStation_01_F": {
        _powPositions = [0, 4];
        _itemPositions = [6];
        _soldierPositions = [1,2,5,7,8,9,10,11,12];
        _collaborantPositions = [3,6,7];
    };
    case "Land_i_Barracks_V1_F";
	case "Land_Barracks_01_dilapidated_F"; 
	case "Land_Barracks_01_grey_F"; 
	case "Land_Barracks_01_camo_F"; 
	case "Land_i_Barracks_V2_F";
	case "Land_u_Barracks_V2_F";
	case "Land_vn_i_barracks_v1_f";
	case "Land_vn_barracks_01_dilapidated_f";
	case "Land_vn_barracks_01_grey_f";
	case "Land_vn_barracks_01_camo_f";
	case "Land_vn_i_barracks_v2_f";
    case "Land_i_Barracks_V2_F": {
        _powPositions = [15,16,48,49];
        _itemPositions = [11,12,21,22,23,29];
        _soldierPositions = [0,1,2,3,4,5,6,14,17,18,19,24,32,33,34,35,36,37];
        _collaborantPositions = [10,13,20,27,28,30];
    };
    case "land_gm_euro_office_02": {
        _powPositions = [1,2,3,4];
        _itemPositions = [12,49,50];
        _soldierPositions = [13,9,19,20,21,22,23,6,10,33,26,36,37,38,57,34,35,36,37,38,39,40,41,42,43,44,45,52,53,47];
        _collaborantPositions = [58,62,48,54];
    };
    default {
        //better fill arrays with at least something than throwing script error
        for "_i" from 0 to (count _buildingPositions) do {
		    _soldierPositions pushBack _i;
	    };
        _powPositions = _soldierPositions;
        _itemPositions = _soldierPositions;
        _collaborantPositions = _soldierPositions;
    };
};

[
    _buildingPositions,
    _soldierPositions,
    _itemPositions,
	_collaborantPositions,
    _powPositions
];
