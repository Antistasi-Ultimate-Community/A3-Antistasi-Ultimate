#include "script_component.hpp"

TRACE_1(QFUNC(postInitClient),_this);

GVAR(lastTracks) = [];
GVAR(tracks) = nil;
GVAR(waitScript) = nil;

// TODO: set up CBA settings
GVAR(pause) = 90;
GVAR(showNowPlaying) = true;
GVAR(volume) = 0.5;
// </TODO>

[] call FUNC(initEvents);

nil;
