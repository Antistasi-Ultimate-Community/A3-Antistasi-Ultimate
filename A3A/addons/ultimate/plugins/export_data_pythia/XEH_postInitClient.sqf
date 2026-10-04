#include "script_component.hpp"

INFO("Hooking pythia handler into CBA game saved event");

[CBA_EVENT_SERVER_GAME_SAVED, { call FUNC(onEventServerGameSaved) }] call FUNCMAIN(addEventHandler);

nil;
