["attributesVehicles", [
    ["Vehicle", ["cost", 0], ["threat", 0]]
]] call _fnc_saveToTemplate;

/*
    Cost: How many resources it costs the AI to use the vehicle. Not the rebels...
    Threat: How important it is for the vehicle to be targeted IF it is captured.
    rebCost: How much the vehicle will cost in the rebel shop (applies to rebel templates only).
*/