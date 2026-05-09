/* ----------------------------------------------------------------------------
File: A3A/addons/core/functions/init/varsHardcoded.hpp

Description:
    Hopefully temporary resting place for hardcoded variables until they become
    parameters.

Environment:
    Client/Server

Author:
    UnseenKill/gor3Splatter
---------------------------------------------------------------------------- */

// Whether statics crewed in outposts should scan their horizon
GVAR(rebelStaticsScanHorizon) = true;

// Used as height in calls to SCRT_fnc_common_scanHorizon for A/A units
GVAR(scanHorizonHeight) = 300;

// When getting marker sizes for zero-size markers (emplacements), pretend
// they're really this big.
GVAR(zeroSizeMarkerBlowup) = 50;

// Checks for auto-land
GVAR(actionSpeedLimit) = 350; // Max speed for action (km/h)
GVAR(actionHeightLimit) = 150; // Max height for action (meters)

// Detection parameters for auto-land
GVAR(detectionRange) = 500;