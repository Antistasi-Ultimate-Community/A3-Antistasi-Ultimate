params ["_header", "_text", ["_severity", (localize "STR_notifiers_info_type")], ["_duration", 5]];

private _finalText = nil;

switch (_severity) do {
    case (localize "STR_notifiers_info_type"): {
        _finalText = format ["<t size='0.6' color='#f0d498'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case (localize "STR_notifiers_warning_type"): {
        playSound "A3AP_UiFailure";
        _finalText = format ["<t size='0.6' color='#f0d498'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case (localize "STR_notifiers_fail_type"): {
        playSound "A3AP_UiFailure";
        _finalText = format ["<t size='0.6' color='#e60000'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };

    case (localize "STR_notifiers_success_type"): {
        playSound "A3AP_UiSuccess";
        _finalText = format ["<t size='0.6' color='#00cc00'>%1</t><br/><t size='0.5'>%2</t>", _header, _text];
    };
};

if (isNil "dynamicTextMessageLayer") then {
    dynamicTextMessageLayer = ["dynamicTextMessage"] call BIS_fnc_rscLayer;
    [_finalText, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], -0.15, _duration, 0, 0, dynamicTextMessageLayer] spawn bis_fnc_dynamicText;
} else {
    [_finalText, [safeZoneX + (0.8 * safeZoneW), (0.2 * safeZoneW)], -0.15, _duration, 0, 0, dynamicTextMessageLayer] spawn bis_fnc_dynamicText;
};
