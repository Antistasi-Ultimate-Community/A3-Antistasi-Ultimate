params ["_unit","_side"];

if (_side == Invaders) then {
	_unit forceAddUniform (selectRandom (A3A_faction_inv get "uniforms"));
} else {
	_unit forceAddUniform (selectRandom (A3A_faction_occ get "uniforms"));
};

_unit addItemToUniform "FirstAidKit";