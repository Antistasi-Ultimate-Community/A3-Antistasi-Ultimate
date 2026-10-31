params [["_isHex", false]];

private _accentColorRgba = [
	(profileNamespace getVariable ['GUI_BCG_RGB_R',0.376]),
	(profileNamespace getVariable ['GUI_BCG_RGB_G',0.125]),
	(profileNamespace getVariable ['GUI_BCG_RGB_B',0.043]),
	1
];

if (_isHex) then {
    _accentColorRgba = _accentColorRgba call BIS_fnc_colorRGBAtoHTML;
};

_accentColorRgba
