isRallyPointPlaced = false;
publicVariable "isRallyPointPlaced";

{deleteVehicle _x} forEach rallyProps;
rallyProps = nil;
publicVariable "rallyProps";

deleteVehicle rallyPointRoot;
rallyPointRoot = nil;
publicVariable "rallyPointRoot";

deleteMarker rallyPointMarker;
deleteMarker "RallyPointMarker";
publicVariable "rallyPointMarker";

[petros, "support", localize "STR_comms_mp_RP_ran_out"] remoteExec ["A3A_fnc_commsMP", 0];
