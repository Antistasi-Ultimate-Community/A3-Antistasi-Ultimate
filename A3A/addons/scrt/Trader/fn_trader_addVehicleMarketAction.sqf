params ["_traderX"];

_traderX addAction [
	format ["<img image='\a3\ui_f\data\igui\cfg\actions\getindriver_ca.paa' size='1.6' shadow=2 /> <t>%1</t>", localize "STR_antistasi_actions_common_access_vehicle_marker_text"],
	{createDialog "A3A_BlackMarketDialog"},
	nil,
	5,
	false,
	true,
	"",
	"(isPlayer _this) and (isNull objectParent _this) and (_this == _this getVariable ['owner',objNull])",
	3
];
