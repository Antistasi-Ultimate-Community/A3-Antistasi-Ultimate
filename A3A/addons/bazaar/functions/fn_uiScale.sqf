// CLIENT, unscheduled-safe (v1.1.2): makes fixed one-line texts fit their boxes.
//   [display]  every label and button of the dialog (fn_shopFill, right after
//              createDialog)
//   [control]  one label or button, after its text was changed at run time
//              -> the factor its font got (1 = the text fits at its own font)
// The player's "UI scale" (ABZ_uiScale) is in the dialog config's fonts
// (config.cpp ABZ_F / ABZ_FC / ABZ_FL), together with the screen size, so every
// factor is applied exactly once and list rows grow with their font. What is
// left for this function: where a label would be cut at the box edge (a narrow
// screen, a big UI scale), its font is made smaller until the whole text fits -
// only ever smaller than the control's own font (at least half of it), never
// bigger. The own font is remembered on the control (ABZ_font0), so a text that
// gets shorter later is shown at full size again. Labels (type 0) and buttons
// (type 1) only: lists, combos, edit boxes and text panels keep their font.
params [["_what", displayNull, [displayNull, controlNull]]];
private _fnc_fit = {
	params ["_c"];
	private _f0 = _c getVariable "ABZ_font0";
	if (isNil "_f0") then { _f0 = ctrlFontHeight _c; _c setVariable ["ABZ_font0", _f0] };
	if ((ctrlFontHeight _c) != _f0) then { _c ctrlSetFontHeight _f0 };
	private _k = 1;
	if (ctrlText _c != "") then {
		private _tw = ctrlTextWidth _c;
		private _avail = ((ctrlPosition _c) select 2) * 0.94;
		if (_tw > 0 && {_avail > 0} && {_tw > _avail}) then {
			_k = (_avail / _tw) max 0.5;
			_c ctrlSetFontHeight (_f0 * _k);
		};
	};
	_k
};
if (_what isEqualType controlNull) exitWith {
	if (isNull _what || {!((ctrlType _what) in [0, 1])}) then { 1 } else { [_what] call _fnc_fit }
};
if (isNull _what) exitWith {};
{
	if ((ctrlType _x) in [0, 1]) then { [_x] call _fnc_fit };
} forEach allControls _what;
