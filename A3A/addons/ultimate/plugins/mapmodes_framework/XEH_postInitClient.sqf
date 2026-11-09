#include "script_component.hpp"

if (!hasInterface) exitWith {};
// TO BE REMOVED | DEV TEST PROVIDER MAPMODE: expose the fallback test provider.
[] call FUNC(refreshModes);
addMissionEventHandler ["Map", {
    params ["_opened"];
    if (_opened) then { [] spawn FUNC(createSelector); };
}];
if (!isNull findDisplay 12) then { [] spawn FUNC(createSelector); };