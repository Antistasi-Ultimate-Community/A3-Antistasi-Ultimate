// SERVER: takes a Bazaar crate out of whatever vehicle it is loaded in, the
// way that vehicle's own cargo system would, and leaves it on the ground:
//   - Antistasi logistics: its own instant unload (frees the mount point,
//     the locked seats and the added mass). It unloads the top of its
//     stack, so our crate is moved to the top first.
//   - ACE cargo: ace_cargo_fnc_unloadItem (frees the cargo space); if ACE
//     finds no room to set it down, its bookkeeping is done by hand
//   - the Bazaar's own straps (no logistics mod): detach + forget
//   - anything else attached: detach
// Never while Antistasi logistics is sliding cargo on or off that vehicle
// (its own unload would jam the vehicle for good) - returns false then.
// Never on a destroyed vehicle (the crate is going with it anyway).
// [crate] -> true when the crate now stands free
params [["_c", objNull, [objNull]]];
if (isNull _c) exitWith { false };
private _v = attachedTo _c;
if (isNull _v) exitWith { true };
private _inAce = _c in (_v getVariable ["ace_cargo_loaded", []]);
if (alive _v && {!_inAce} && {!isNil "A3A_Logistics_fnc_unload"} && {_v getVariable ["LoadingCargo", false]}) exitWith { false };

private _done = false;
if (alive _v) then {
	// ACE cargo: loaded objects hang hidden 100m under the vehicle
	if (_inAce && {!isNil "ace_cargo_fnc_unloadItem"}) then {
		_done = [_c, _v, objNull, [], false] call ace_cargo_fnc_unloadItem;
		if (!_done) then {
			// no room to set it down: take it off ACE's books ourselves
			private _l = _v getVariable ["ace_cargo_loaded", []];
			private _i = _l find _c;
			if (_i > -1) then {
				_l deleteAt _i;
				_v setVariable ["ace_cargo_loaded", _l, true];
				if (!isNil "ace_cargo_fnc_getCargoSpaceLeft" && {!isNil "ace_cargo_fnc_getSizeItem"}) then {
					_v setVariable ["ace_cargo_space", (_v call ace_cargo_fnc_getCargoSpaceLeft) + ((_c call ace_cargo_fnc_getSizeItem) max 0), true];
				};
				if (!isNil "ace_common_fnc_statusEffect_set") then { [_c, "blockDamage", "ace_cargo", false] call ace_common_fnc_statusEffect_set };
			};
		};
	};
	// Antistasi logistics
	if (!_done && {!_inAce} && {!isNil "A3A_Logistics_fnc_unload"}) then {
		private _cargo = _v getVariable ["Cargo", []];
		private _i = _cargo findIf { _x isEqualType [] && {(_x param [0, objNull]) isEqualTo _c} };
		if (_i > -1) then {
			if (_i > 0) then {
				private _en = _cargo deleteAt _i;
				_cargo = [_en] + _cargo;
				_v setVariable ["Cargo", _cargo, true];
			};
			// several crates off one vehicle in one go: Antistasi works out the
			// vehicle's new mass from getMass, which can't change within the
			// frame (the vehicle is usually a client's) - so track what it
			// should be and send the right value after it
			// (trusted only while the server's getMass hasn't moved since our last
			// release - any change since, ours arriving or Antistasi's own, wins)
			private _seen = getMass _v;
			private _exp = _v getVariable ["ABZ_massExp", [-1, 0, -1]];
			private _stale = time < (_exp select 0) && {_seen == (_exp param [2, -1])};
			private _before = [_seen, _exp select 1] select _stale;
			private _cm = getMass _c;
			[_v, true] call A3A_Logistics_fnc_unload;	// instant: no sleeps, finishes here
			_done = isNull attachedTo _c;
			if (_done) then {
				private _after = (_before - _cm) max (_v getVariable ["default_mass", 0]);
				if (_stale) then { [_v, _after] remoteExec ["setMass", _v] };	// lands after Antistasi's own (same target, in order)
				_v setVariable ["ABZ_massExp", [time + 3, _after, _seen]];
			};
		};
	};
};
// the Bazaar's own straps
private _l = _v getVariable ["ABZ_loaded", []];
if (_l isEqualType [] && {_c in _l}) then { _v setVariable ["ABZ_loaded", _l - [_c], true] };
if (!isNull attachedTo _c) then {
	detach _c;
	// behind the vehicle, one strap slot apart, on a free spot (several come off at once)
	private _p = _v getPos [(abs (((boundingBoxReal _v) select 0) select 1)) + 2 + 1.2 * (_c getVariable ["ABZ_slot", 0]), (getDir _v) + 180];
	private _free = _p findEmptyPosition [0, 8, typeOf _c];
	if (_free isNotEqualTo []) then { _p = _free };
	_c setPosATL [_p select 0, _p select 1, 0];
	_c setVelocity [0, 0, 0];
	_c setVariable ["ABZ_slot", nil];
};
if (isObjectHidden _c) then { _c hideObjectGlobal false };
isNull attachedTo _c
