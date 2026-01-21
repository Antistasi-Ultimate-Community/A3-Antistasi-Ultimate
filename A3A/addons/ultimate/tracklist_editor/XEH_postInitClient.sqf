#include "script_component.hpp"

TRACE_1(QFUNC(postInitClient),_this);

GVAR(lastTracks) = [];
GVAR(tracks) = nil;
GVAR(waitScript) = nil;

// TODO: set up CBA settings
GVAR(showNowPlaying) = true;
// </TODO>

[] call FUNC(initEvents);

nil;
