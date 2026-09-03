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

// When everything fails, this is the default price for selling a vehicle
GVAR(vehicleSellingDefaultPrice) = 500;
// Factor to multiply the base vehicle price with when selling
GVAR(vehicleSellingPriceFactor) = 0.5;
// Base reduction per resource
GVAR(vehicleSellingReductionFactorResource) = 0.02;
// Base reduction per seaport
GVAR(vehicleSellingReductionFactorSeaport) = 0.1;

// When getting marker sizes for zero-size markers (emplacements), pretend
// they're really this big.
GVAR(zeroSizeMarkerBlowup) = 50;
