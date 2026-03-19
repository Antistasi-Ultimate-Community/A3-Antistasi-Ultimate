#define MAINPREFIX x
#ifndef PREFIX
    #define PREFIX A3A
#endif

#include "script_version.hpp"
#if PATCHLVL > 0
    #define VERSION MAJOR.MINOR.PATCHLVL
    #define VERSION_AR MAJOR,MINOR,PATCHLVL
#else
    #define VERSION MAJOR.MINOR
    #define VERSION_AR MAJOR,MINOR
#endif

#define VERSION_FULL MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR_FULL MAJOR,MINOR,PATCHLVL,BUILD

// probably should move to script_version.hpp?
#define MINIMUM_MISSION_VERSION_AR 10,0,0

#define REQUIRED_VERSION 2.20

#ifdef COMPONENT_BEAUTIFIED
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT_BEAUTIFIED)
#else
    #define COMPONENT_NAME QUOTE(PREFIX - COMPONENT)
#endif

#ifndef AUTHOR
    #define AUTHOR "Antistasi Dev Team"
#endif
#ifndef AUTHORS
// sepperate authors with a comma
    #define AUTHORS "Antistasi Dev Team, Barbolani"
#endif

#if __A3_DEBUG__
    #define DEBUG_MODE_FULL
    #define DISABLE_COMPILE_CACHE
    #define RECOMPILE // [Disable for release]
#else // __A3_DEBUG__
    // Remove CfgFunction adding headers and disable SCRIPT macro (comment out to enable for debugging)
    #define SKIP_FUNCTION_HEADER // [Enable for release]
    #define SKIP_SCRIPT_NAME // [Enable for release]
#endif // __A3_DEBUG__

#include "script_macros.hpp"
#include "common.inc"
