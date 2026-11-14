/*
	Function: HALs_store_fnc_eachFrame
	Author: HallyG
	Periodically checks if the player's money or items have changed.

	Argument(s):
	0: None

	Return Value:
	None

	Example:
	[] call HALs_store_fnc_eachFrame;
__________________________________________________________________*/
if (!hasInterface) exitWith {};
if (!isNil {missionNamespace getVariable "#HALs_store_money"}) exitWith {};

missionNamespace setVariable ["HALs_store_updated", false];
missionNamespace setVariable ["#HALs_store_money", [player] call HALs_money_fnc_getFunds];
missionNamespace setVariable ["#HALs_store_containers", [uniform player, vest player, backpack player]];
missionNamespace setVariable ["#HALs_store_nextUpdateTick", diag_tickTime];

addMissionEventHandler ["EachFrame", {
	if (isNull (uiNamespace getVariable ["HALs_store_display", displayNull])) exitWith {
		{missionNamespace setVariable [_x, nil]} forEach ["#HALs_store_nextUpdateTick", "HALs_store_updated", "#HALs_store_containers", "#HALs_store_money"];
		
		removeMissionEventHandler ["EachFrame", _thisEventHandler];
	};

	if (HALs_store_updated) then {
		["update"] call  HALs_store_fnc_main;
		
		missionNamespace setVariable ["#HALs_store_money", [player] call HALs_money_fnc_getFunds];
		missionNamespace setVariable ["#HALs_store_containers", [uniform player, vest player, backpack player]];
		HALs_store_updated = false;
	};

	if (diag_tickTime > missionNamespace getVariable ["#HALs_store_nextUpdateTick", diag_tickTime]) then {
		_containers = [uniform player, vest player, backpack player];
		_oldContainers = missionNamespace getVariable ["#HALs_store_containers", []];
		
		_money = [player] call HALs_money_fnc_getFunds;
		_oldMoney = missionNamespace getVariable ["#HALs_store_money", [player] call HALs_money_fnc_getFunds];

		if (_money != _oldMoney) then {
			missionNamespace setVariable ["#HALs_store_money", _money];
			HALs_store_updated = true;
		};

		if (_containers isNotEqualTo _oldContainers) then {
			missionNamespace setVariable ["#HALs_store_containers", _containers];
			HALs_store_updated = true;
		};

		missionNamespace setVariable ["#HALs_store_nextUpdateTick", diag_tickTime + 0.25];
	};
}];
