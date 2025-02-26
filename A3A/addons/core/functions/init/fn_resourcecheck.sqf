#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()
if (!isServer) exitWith {
    Error("Server-only function miscalled");
};

//declaring variables outside of the loop increases performance
private _resAdd = nil;
private _hrAdd = nil;
private _popReb = nil;
private _popGov = nil;
private _popKilled = nil;
private _popTotal = nil;
private _suppBoost = nil;
private _resBoost = nil;

private _rivalsTaskChance = 5;
private _traderTaskChance = 5;

private _cfg = (configFile >> "A3U" >> "traderAddons" >> "traderVehicles");

private _condition_AA = getText (_cfg >> "condition_AA");
private _condition_APC = getText (_cfg >> "condition_APC");
private _condition_ARMEDCAR = getText (_cfg >> "condition_ARMEDCAR");
private _condition_ARTILLERY = getText (_cfg >> "condition_ARTILLERY");
private _condition_BOAT = getText (_cfg >> "condition_BOAT");
private _condition_HELI = getText (_cfg >> "condition_HELI");
private _condition_PLANE = getText (_cfg >> "condition_PLANE");
private _condition_STATICAA = getText (_cfg >> "condition_STATICAA");
private _condition_STATICAT = getText (_cfg >> "condition_STATICAT");
private _condition_STATICMG = getText (_cfg >> "condition_STATICMG");
private _condition_STATICMORTAR = getText (_cfg >> "condition_STATICMORTAR");
private _condition_TANK = getText (_cfg >> "condition_TANK");
private _condition_UAV = getText (_cfg >> "condition_UAV");
private _condition_UNARMEDCAR = getText (_cfg >> "condition_UNARMEDCAR");

private _conditions = [
	[_condition_AA, "AA"], 
	[_condition_APC, "APCs"], 
	[_condition_ARMEDCAR, "Armed Cars"], 
	[_condition_ARTILLERY, "Artillery"], 
	[_condition_BOAT, "Boats"], 
	[_condition_HELI, "Helicopters"], 
	[_condition_PLANE, "Planes"], 
	[_condition_STATICAA, "Statics: AA"], 
	[_condition_STATICAT, "Statics: AT"], 
	[_condition_STATICMG, "Statics: MG"], 
	[_condition_STATICMORTAR, "Statics: Mortar"],
	[_condition_TANK, "Tanks"],
	[_condition_UAV, "UAVs"],
	[_condition_UNARMEDCAR, "Unarmed Cars"]
];

while {true} do {
	nextTick = time + 600;
	waitUntil {sleep 15; time >= nextTick};
    waitUntil {sleep 10; A3A_activePlayerCount > 0};

	_resAdd = 25;
	_hrAdd = 0;
	_popReb = 0;
	_popGov = 0;
	_popKilled = 0;
	_popTotal = 0;

	_suppBoost = 0.5 * (1+ ({sidesX getVariable [_x,sideUnknown] == teamPlayer} count seaports));
	_resBoost = 1 + (0.25*({(sidesX getVariable [_x,sideUnknown] == teamPlayer) and !(_x in destroyedSites)} count factories));

	{
		private _city = _x;
		private _resAddCity = 0;
		private _hrAddCity = 0;
		private _cityData = server getVariable _city;
		_cityData params ["_numCiv", "_numVeh", "_supportGov", "_supportReb"];

		_popTotal = _popTotal + _numCiv;
		if (_city in destroyedSites) then { _popKilled = _popKilled + _numCiv; continue };

		_popReb = _popReb + (_numCiv * (_supportReb / 100));
		_popGov = _popGov + (_numCiv * (_supportGov / 100));

		private _radioTowerSide = [_city] call A3A_fnc_getSideRadioTowerInfluence;
		switch (_radioTowerSide) do
		{
			case teamPlayer: {[-1,_suppBoost,_city,false,true] spawn A3A_fnc_citySupportChange};
			case Occupants: {[1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
			case Invaders: {[-1,-1,_city,false,true] spawn A3A_fnc_citySupportChange};
		};

		_resAddCity = _numCiv * (_supportReb / 100) / 3;
		_hrAddCity = _numCiv * (_supportReb / 10000);

		if (sidesX getVariable [_city,sideUnknown] == Occupants) then
		{
			_resAddCity = _resAddCity / 2;
			_hrAddCity = _hrAddCity / 2;
		};
		if (_radioTowerSide != teamPlayer) then { _resAddCity = _resAddCity / 2 };

		_resAdd = _resAdd + _resAddCity;
		_hrAdd = _hrAdd + _hrAddCity;

		if (_supportGov < _supportReb && {sidesX getVariable [_city,sideUnknown] == Occupants}) then {
			["TaskSucceeded", ["", format [localize "STR_notifiers_city_joined",_city,FactionGet(reb,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,teamPlayer,true];
			[Occupants, 10, 60] remoteExec ["A3A_fnc_addAggression",2];
			garrison setVariable [_city,[],true];
			[_city] call A3A_fnc_mrkUpdate;

			private _closestAdminMarker = [milAdministrationsX, _city] call BIS_fnc_nearestPosition;
			if ((getMarkerPos _closestAdminMarker) distance2D (getMarkerPos _city) < 800) then {
				private _milAdministration = [A3A_milAdministrations, _closestAdminMarker] call BIS_fnc_nearestPosition;
				[_milAdministration, "SILENT"] call SCRT_fnc_location_removeMilAdmin;
			};

			sleep 5;
			{_nul = [_city,_x] spawn A3A_fnc_deleteControls} forEach controlsX;
			[] call A3A_fnc_tierCheck;
		};
		if (_supportGov > _supportReb && {sidesX getVariable [_city,sideUnknown] == teamPlayer}) then {
			["TaskFailed", ["", format [localize "STR_notifiers_city_joined",_city,FactionGet(occ,"name")]]] remoteExec ["BIS_fnc_showNotification",teamPlayer];
			sidesX setVariable [_city,Occupants,true];
			[Occupants, -10, 45] remoteExec ["A3A_fnc_addAggression",2];
			garrison setVariable [_city,[],true];
			[_city] call A3A_fnc_mrkUpdate;
			sleep 5;
			[] call A3A_fnc_tierCheck;
		};
	} forEach citiesX;

	call A3A_fnc_checkWinCondition;

	if (lossCondition isNotEqualTo 1) then {
		call A3A_fnc_checkLossCondition;
	};

	{
		if (sidesX getVariable [_x,sideUnknown] == teamPlayer and {!(_x in destroyedSites)}) then
		{
			_resAdd = _resAdd + (300 * _resBoost);
		};
	} forEach resourcesX;

	_resAdd = [_resAdd] call SCRT_fnc_common_rebelSalary;

	_hrAdd = ceil _hrAdd;
	_resAdd = ceil _resAdd;
	server setVariable ["hr", _hrAdd + (server getVariable "hr"), true];
	server setVariable ["resourcesFIA", _resAdd + (server getVariable "resourcesFIA"), true];

	private _rebAirportsQuantity = {sidesX getVariable [_x,sideUnknown] == teamPlayer} count airportsX;
	bombRuns = bombRuns + 0.25 * _rebAirportsQuantity;
	publicVariable "bombRuns";

	if (bombRuns > (_rebAirportsQuantity * 2)) then {
		bombRuns = _rebAirportsQuantity * 2;
	};

	if(tierWar > 2) then {
        supportPoints = supportPoints + 1;
    };

    if(supportPoints > maxSupportPoints) then {
        supportPoints = maxSupportPoints;
    };

	publicVariable "supportPoints";

	// Regular income of finite starting weapons
	private _equipMul = A3A_balancePlayerScale / 30;		// difficulty scaled. Hmm.
	{
		if (_x isEqualType "") then { continue };
		_x params ["_class", "_initCount"];
		private _count = _initCount * _equipMul;
		_count = if (_count % 1 > random 1) then { ceil _count } else { floor _count };
		private _arsenalTab = _class call jn_fnc_arsenal_itemType;
		[_arsenalTab, _class, _count] call jn_fnc_arsenal_addItem;
	} forEach (A3A_faction_reb get "initialRebelEquipment");

	private _textX = format [localize "STR_comms_mp_taxes_income", _hrAdd, _resAdd, A3A_faction_civ get "currencySymbol"];
	private _textArsenal = [] call A3A_fnc_arsenalManage;
	if (_textArsenal != "") then {_textX = format [localize "STR_comms_mp_arsenal_updated", _textX, _textArsenal]};
	[petros, "taxRep", _textX] remoteExec ["A3A_fnc_commsMP", [teamPlayer, civilian]];

	[] call A3A_fnc_generateRebelGear;

	[] call A3A_fnc_FIAradio;
    [] call A3A_fnc_cleanConvoyMarker;

    // Random-walk the defence multipliers for markers to add some persistent variation
    // Maybe add some logic to this later
/*    {
        private _r = _x#4 - 0.1 + random 0.2;
        _x set [4, 0.5 max _r min 1.0];
    } forEach A3A_supportMarkerTypes;
*/
	[] spawn A3A_fnc_promotePlayer;
	[] call A3A_fnc_assignBossIfNone;

	// Clear out plank objects that haven't been constructed and have exceeded the timeout
	call A3A_fnc_processBuildingTimeouts;

	// Decrease HQ knowledge values, old ones faster than current
	if (A3A_curHQInfoOcc < 1) then { A3A_curHQInfoOcc = 0 max (A3A_curHQInfoOcc - 0.01) };
	if (A3A_curHQInfoInv < 1) then { A3A_curHQInfoInv = 0 max (A3A_curHQInfoInv - 0.01) };
 	A3A_oldHQInfoOcc = A3A_oldHQInfoOcc select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };			// arrays of [xpos, ypos, knowledge]
	A3A_oldHQInfoInv = A3A_oldHQInfoInv select { _x set [2, _x#2 - 0.1]; _x#2 > 0 };

	private _missionChance = 5 * A3A_activePlayerCount;
	if ((!bigAttackInProgress) and (random 100 < _missionChance)) then {[] spawn A3A_fnc_missionRequest};
	//Removed from scheduler for now, as it errors on Headless Clients.
	//[[],"A3A_fnc_reinforcementsAI"] call A3A_fnc_scheduler;
	[] spawn A3A_fnc_reinforcementsAI;
	{
		_veh = _x;
		if ((_veh isKindOf "StaticWeapon") and {{isPlayer _x} count crew _veh == 0 and {alive _veh}}) then {
			_veh setDamage 0;
			[_veh,1] remoteExec ["setVehicleAmmo",_veh];
		};
	} forEach vehicles;
	sleep 3;
    _numWreckedAntennas = count antennasDead;
	//Probability of spawning a mission in.
    _shouldSpawnRepairThisTick = round(random 100) < 15;
    if (_numWreckedAntennas > 0 && {_shouldSpawnRepairThisTick && {!("REP" in A3A_activeTasks)}}) then {
		_potentials = [];
		{
			if (!isNil "_x" && {!isNull _x}) then {
				_markerX = [markersX, _x] call BIS_fnc_nearestPosition;
				if (sidesX getVariable [_markerX,sideUnknown] == Occupants and {spawner getVariable _markerX == 2}) exitWith {
					_potentials pushBack [_markerX,_x];
				};
			};
		} forEach antennasDead;
		if (count _potentials > 0) then {
			_potential = selectRandom _potentials;
			[[_potential select 0,_potential select 1],"A3A_fnc_REP_Antenna"] call A3A_fnc_scheduler;
		};
	} else {
		_changingX = false;
		{
			_chance = 5;
			if (_x in resourcesX and {sidesX getVariable [_x,sideUnknown] == Invaders}) then {
				_chance = 20
			};
			if (random 100 < _chance) then {
				_changingX = true;
				destroyedSites = destroyedSites - [_x];
				_nameX = [_x] call A3A_fnc_localizar;
				["TaskSucceeded", ["", format [localize "STR_notifiers_city_rebuilt",_nameX]]] remoteExec ["BIS_fnc_showNotification",[teamPlayer,civilian]];
				sleep 2;
			};
		} forEach ((destroyedSites - citiesX) select {sidesX getVariable [_x,sideUnknown] != teamPlayer});
		if (_changingX) then {publicVariable "destroyedSites"};
	};
	sleep 4;

	if (areRivalsEnabled && tierWar > 3 && !areRivalsDiscovered && !isRivalsDiscoveryQuestAssigned) then {
		Info_1("Rivals roll: %1", _rivalsTaskChance);
		if (random 100 < _rivalsTaskChance) then {
			Info("Assigning Rivals Discovery Task...");
			[] call SCRT_fnc_rivals_prepareQuest;
		} else {
			_rivalsTaskChance = [
				_rivalsTaskChance + 5,
				_rivalsTaskChance + 10
			] select (sunOrMoon < 1);
		};
	};

	if (tierWar > 2 && !isTraderQuestCompleted && !isTraderQuestAssigned) then {
		Info_1("Arms Dealer roll: %1", _traderTaskChance);
		if (random 100 < _traderTaskChance) then {
			Info("Assigning Arms Dealer Task...");
			[] remoteExec ["SCRT_fnc_trader_prepareTraderQuest", 2];
		} else {
			_traderTaskChance = _traderTaskChance + 2;
		};
	};

	if (areRivalsDiscovered && {!areRivalsDefeated}) then{
		[random [5,7,10]] call SCRT_fnc_rivals_addProgressToRivalsLocationReveal;
	};

	if (isTraderQuestCompleted) then {
		private _vehicleTypesUnlocked = unlockedVehicleTypes;
		private _vehicleTypesUnlockedNotify = [];

		if (isNil "_vehicleTypesUnlocked") then {
			_vehicleTypesUnlocked = [];
		};

		{
			private _condition = compile (_x#0);

			private _alreadyUnlocked = ((_x#1) in _vehicleTypesUnlocked);
			if (_alreadyUnlocked) then {continue};

			if (call _condition) then {
				private _text = format["%1 is now unlocked in the Arms Dealer.", (_x#1)];

				_vehicleTypesUnlocked pushBack (_x#1);
				_vehicleTypesUnlockedNotify pushBack (_x#1);
				
				[_text, _fnc_scriptName] call A3U_fnc_log;
			};
		} forEach _conditions;

		if (_vehicleTypesUnlockedNotify isEqualTo []) exitWith {false};

		private _unlockedMessages = "The following vehicles have been unlocked at the Arms Dealer.<br/>"; // To-Do: Localize

		{
			private _vehicleType = _x;
			_unlockedMessages = _unlockedMessages + "<br/>" + _vehicleType; // <br/> vehicleType <br/>
		} forEach _vehicleTypesUnlocked;

		[localize "STR_marker_arms_dealer", _unlockedMessages] remoteExec ["A3A_fnc_customHint", 0, false];

		unlockedVehicleTypes = _vehicleTypesUnlocked;
		
		publicVariable "unlockedVehicleTypes";
	};
};
