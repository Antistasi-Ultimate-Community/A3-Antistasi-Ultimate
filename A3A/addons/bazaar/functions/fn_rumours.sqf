// Client: Shift+K / RUMOURS button - ask the server where the traders are.
// My Wanted List goes along, so the answer can say who has my pins.
if (!hasInterface) exitWith {};
["ABZ_rumours", [player, call ABZ_fnc_wantedList]] call CBA_fnc_serverEvent;
