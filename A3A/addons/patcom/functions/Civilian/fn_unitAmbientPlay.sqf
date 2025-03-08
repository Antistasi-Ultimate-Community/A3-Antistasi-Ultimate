params ["_unit", "_sound", "_animation", "_delay"];

[_unit, _sound] remoteExec ["say3D", 0]; 
[_unit, _animation] remoteExec ["playMoveNow", 0]; 

sleep _delay; 

[_unit, ""] remoteExec ["switchMove", 0];