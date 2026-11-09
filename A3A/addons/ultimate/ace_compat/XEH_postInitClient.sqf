#include "script_component.hpp"

INFO("Hooking into CBA player load/save events");

[CBA_EVENT_CLIENT_PLAYER_LOAD, { call FUNC(onEventClientPlayerLoad) }] call FUNCMAIN(addEventHandler);
[CBA_EVENT_CLIENT_PLAYER_SAVE, { call FUNC(onEventClientPlayerSave) }] call FUNCMAIN(addEventHandler);

nil;
