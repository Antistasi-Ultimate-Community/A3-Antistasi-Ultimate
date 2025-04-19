#include "..\defines.inc"
FIX_LINE_NUMBERS()

if (!isServer) exitWith {};

params ["_vehicle", "_position", "_vehicledirection", "_curentlySelectedVehicleCustomization","_moneyCost", "_hrCost", "_garageCategoryToremoveVehicleFrom", "_curentlySelectedVehicleUID", "_commanderNetworkId"];

//myGlobalResult = nil;

/* [] spawn
{
	private _result = [(format["Do you want to use vehicle from the garage?"]), "Confirm", true, true] call BIS_fnc_guiMessage;
	// Use _result here
    if (_result) then {
        createDialog "A3A_BuyVehicleRoadblockDialog";
    } else {
        createDialog "roadblockFromGarage";
    };
};

waitUntil { !isNil myGlobalResult }; */

[-_hrCost,-_moneyCost] remoteExec ["A3A_fnc_resourcesFIA",2];

estabNetworkId = clientOwner;
_commanderNetworkId publicVariableClient "estabNetworkId";

private _textX = format [localize "STR_marker_roadblock", FactionGet(reb,"name")];

private _marker = createMarker [format ["FIARoadblock%1", random 1000], _position];
_marker setMarkerShape "ICON";

(45 call SCRT_fnc_misc_getTimeLimit) params ["_dateLimitNum", "_displayTime"];

private _taskId = "outpostTask" + str A3A_taskCount;
[[teamPlayer,civilian],_taskId,[format [localize "STR_roadblock_deploy_desc", _displayTime],localize "STR_roadblock_deploy_header",_marker],_position,false,0,true,"Move",true] call BIS_fnc_taskCreate;
[_taskId, "outpostTask", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

private _riflemanType = A3A_faction_reb get "unitRifle";
private _squadType = A3A_faction_reb get "groupSquad";
private _truckType = selectRandom (A3A_faction_reb get "vehiclesTruck");

_formatX = [_riflemanType] + _squadType;

_groupX = [getMarkerPos respawnTeamPlayer, teamPlayer, _formatX] call A3A_fnc_spawnGroup;
_groupX setGroupId ["Road"];
_road = [getMarkerPos respawnTeamPlayer] call A3A_fnc_findNearestGoodRoad;
_pos = position _road findEmptyPosition [1,30, _truckType];
_truckX = _truckType createVehicle _pos;
_groupX addVehicle _truckX;
{
    [_x] call A3A_fnc_FIAinit
} forEach units _groupX;
leader _groupX setBehaviour "SAFE";
(units _groupX) orderGetIn true;
theBoss hcSetGroup [_groupX];

private _units = units _groupX;

waitUntil {
	sleep 1;
	(!isNil "cancelEstabTask" && {cancelEstabTask}) || 
	{_units findIf {[_x] call A3A_fnc_canFight} == -1 || 
	{{alive _x && {_x distance _position < 35}} count units _groupX > 0 ||
	{(dateToNumber date > _dateLimitNum)}}}
};

switch (true) do {
	case (!isNil "cancelEstabTask" && {cancelEstabTask}): {
		[_hrCost,_moneyCost] remoteExec ["A3A_fnc_resourcesFIA",2];
		[_taskId, "outpostTask", "CANCELED"] call A3A_fnc_taskSetState;
		sleep 3;
		deleteMarker _marker;
	};
	case (_units findIf {[_x] call A3A_fnc_canFight && {_x distance _position < 35}} != -1): {  ///step 4
		if (isPlayer leader _groupX) then {
			_owner = (leader _groupX) getVariable ["owner",leader _groupX];
			(leader _groupX) remoteExec ["removeAllActions",leader _groupX];
			_owner remoteExec ["selectPlayer",leader _groupX];
			// (leader _groupX) setVariable ["owner",_owner,true];
			// {[_x] joinsilent group _owner} forEach units group _owner;
			// [group _owner, _owner] remoteExec ["selectLeader", _owner];
			"" remoteExec ["hint",_owner];
			waitUntil {!(isPlayer leader _groupX)};
			sleep 5;
		};
		roadblocksFIA pushBack _marker; 
		publicVariable "roadblocksFIA";
		sidesX setVariable [_marker,teamPlayer,true];
		markersX pushBack _marker;
		publicVariable "markersX";
		spawner setVariable [_marker,2,true]; ///we need to sent selected vehicle with marker to save it and when marker/roadblock spawns it will spawn with selected vehicle(always)
		spawner setVariable [format[_marker + "_vehicle"], _vehicle];
		spawner setVariable [format[_marker + "_vehiclecustomazation"], _curentlySelectedVehicleCustomization];
		spawner setVariable [format[_marker + "_vehicledirection"], _vehicledirection];
		_nul = [-5,5,_position] remoteExec ["A3A_fnc_citySupportChange",2];
		_marker setMarkerType "n_support";
		_marker setMarkerColor colorTeamPlayer;
		_marker setMarkerText _textX;
		_garrison = [_riflemanType] + _squadType;
		garrison setVariable [_marker,_garrison,true];
		[_taskId, "outpostTask", "SUCCEEDED"] call A3A_fnc_taskSetState;
		["RebelControlCreated", [_marker, "roadblock"]] call EFUNC(Events,triggerEvent);

		//find vehicles to remove
		curentlySelectedVehicleUID = _curentlySelectedVehicleUID;
		garageCategoryToremoveVehicleFrom = _garageCategoryToremoveVehicleFrom;
		// На сервере (функция HR_GRG_fnc_removeVehicleServer):
		HR_GRG_fnc_removeVehicleServer = {
		    params ["_vehicleUID","_CategoryToremoveVehicleFrom"];

		    // Поиск техники для удаления
		    private _toRemove = [];

			// Итерируем по всем элементам категории
			{
			    // Извлечение UID
			    private _vehicleUID2 = _x;
			    diag_log format["Обработка UID: %1 (Ожидается: %2)", _vehicleUID, curentlySelectedVehicleUID];

			    // Сравнение UID
			    if (_vehicleUID2 isEqualTo _vehicleUID) then {
			        diag_log "Совпадение найдено!";
			        _toRemove pushBack [_CategoryToremoveVehicleFrom, _x];
			    };
			} forEach HR_GRG_Vehicles#_CategoryToremoveVehicleFrom;

			// Удаляем элементы (с конца для сохранения индексов)
			if (count _toRemove > 0) then {
			    reverse _toRemove; // Для сохранения индексов
			    {
			        _x params ["_catIndex", "_vehIndex"];
			        private _category = HR_GRG_Vehicles select _catIndex;
			        _category deleteAt _vehIndex;
			        diag_log format["Удален элемент с индексом %1", _vehIndex];
					//remove from source registre
    				{
    				    private _index = _x find _vehIndex;
    				    if (_index != -1) exitWith {
    				        (HR_GRG_Sources#_forEachIndex) deleteAt _index;
    				        [_forEachIndex] call HR_GRG_fnc_declairSources;
    				    };
    				}forEach HR_GRG_Sources;
			    } forEach _toRemove;

			    // Синхронизация данных
			    //HR_GRG_Vehicles set [_categoryIndex, HR_GRG_Vehicles#0];
			    publicVariable "HR_GRG_Vehicles";
			    systemChat "Техника успешно удалена";
			} else {
			    systemChat "Техника с UID не найдена";
			    diag_log "Совпадений не обнаружено";
			};

		    // Обновление интерфейса у всех игроков
		    remoteExecCall ["HR_GRG_fnc_updateVehicleCount", -2];
		};
		// На клиенте (игрок инициирует удаление):
		if !(_garageCategoryToremoveVehicleFrom isEqualTo objNull) then {
    		[curentlySelectedVehicleUID,garageCategoryToremoveVehicleFrom] remoteExecCall ["HR_GRG_fnc_removeVehicleServer", 2];
		};
		
		///reset stuff used for remove
		vehicleToOutpost = "";
		curentlySelectedVehicleUID = 0;
		garageCategoryToremoveVehicleFrom = [];
		curentlySelectedVehicleState = [];
		curentlySelectedVehicleCustomization = [];

	};
	default {
		[_taskId, "outpostTask", "FAILED"] call A3A_fnc_taskSetState;
		sleep 3;
		deleteMarker _marker;
	};
};

[_taskId, "outpostTask", 0] spawn A3A_fnc_taskDelete;
cancelEstabTask = nil;
estabNetworkId = nil;
_commanderNetworkId publicVariableClient "estabNetworkId";

theBoss hcRemoveGroup _groupX;
{
    deleteVehicle _x
} forEach units _groupX;
deleteVehicle _truckX;
deleteGroup _groupX;
