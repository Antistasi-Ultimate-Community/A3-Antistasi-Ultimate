params ["_traderX"];

_traderX addAction [
	format ["<img image='\a3\ui_f\data\igui\cfg\actions\loadvehicle_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_common_request_mission_text"],
	{[traderMarker] call A3U_fnc_LOG_delivery_requestMission},
	nil,
	5,
	false,
	true,
	"",
	"(isPlayer _this) and (vehicle _this == _this) and (_this == _this getVariable ['owner',objNull])",
	3
];