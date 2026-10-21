// CLIENT, unscheduled-safe (v1.1.2): structured text for the dialog's text panels.
//   [string] -> TEXT
//   [string, control] -> TEXT, and also puts it on the control; when the
//       control sits in a scrolling panel (a controls group - config.cpp
//       ABZ_RscControlsGroup: the info panel ABZ_IDC_INFOTEXT and the help panel ABZ_IDC_HELPTEXT)
//       it is made as tall as its text (never shorter than the panel), so the
//       panel scrolls instead of cutting the last lines at a big UI scale.
// No <t size> wrapper: the player's "UI scale" is in the panels' config size
// (config.cpp ABZ_F) - a <t size> is relative to that, so adding the scale here
// as well would apply it twice.
#include "..\dialogues\ids.inc"
params [["_txt", "", [""]], ["_c", controlNull, [controlNull]]];
private _t = parseText _txt;
if (isNull _c) exitWith { _t };
_c ctrlSetStructuredText _t;
private _g = ctrlParentControlsGroup _c;
if (!isNull _g) then {
	private _p = ctrlPosition _c;
	_c ctrlSetPosition [_p select 0, _p select 1, _p select 2, (ctrlTextHeight _c) max ((ctrlPosition _g) select 3)];
	_c ctrlCommit 0;
};
_t
