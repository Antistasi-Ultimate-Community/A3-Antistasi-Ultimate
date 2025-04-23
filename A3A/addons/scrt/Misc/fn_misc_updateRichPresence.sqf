// ["task",value]
//
// ["UpdateDetails","New Details"],
// ["UpdateState","New State"],
// ["UpdateLargeImageKey","New Art Asset"],
// ["UpdateSmallImageKey","New Art Asset"],
// ["UpdatePartySize",count playableUnits],
// ["UpdatePartyMax",getNumber(missionConfigFile >> "Header" >> "maxPlayers")],
// ["UpdateStartTimestamp",[-1,-30]], // 1 Hour 30 Mins since mission start
// ["UpdateEndTimestamp",[1,30]] // 1 Hour 30 Mins until mission end

#include "..\script_component.hpp"
FIX_LINE_NUMBERS()

params [
    ["_updateArray", ["UpdateState", format ["In Mission"]]]
];

if (!isDiscordRichPresenceActive) exitWith {};

Debug_1("Updating rich presence with these parameters: %1", str _updateArray);
[_updateArray] call (missionNameSpace getVariable ["DiscordRichPresence_fnc_update",{}]);

