private _sidesToPlayer = {sidesX getVariable [_x,sideUnknown] isEqualTo teamPlayer};

_sidesToPlayer;

// getText seems to strip out vital parts of the code such as the , between _x and sideUnknown
// We're going to do that part away from getText which fucks it all up