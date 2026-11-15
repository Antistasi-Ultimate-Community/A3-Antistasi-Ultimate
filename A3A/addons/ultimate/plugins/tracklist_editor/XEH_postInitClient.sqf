#include "script_component.hpp"

TRACE_1(QFUNC(postInitClient),_this);

GVAR(lastTracks) = [];
GVAR(tracks) = nil;
GVAR(waitScript) = nil;

[] call FUNC(initEvents);
[] call FUNC(loadTracks);

nil;
