#include "..\script_component.hpp"

createDialog "rebelLoadoutMenu";

private _config = configFile >> "rebelLoadoutMenu";
private _idd = getNumber(_config >> "idd");
private _display = findDisplay _idd;

if (isNull _display) exitWith {};

_display setVariable[QGVAR(loadoutCopy), nil];
uiNamespace setVariable[QGVAR(rebelLoadoutMenuDisplay), _display];

QUOTE(isText(_x >> QQUOTE(loadoutMoniker))) configClasses(_config >> "Controls") apply {
    private _loadoutMoniker = getText(_x >> "loadoutMoniker");
    private _textControl = _display displayCtrl getNumber(_x >> "idc");
    private _arsenalButtonControl = _display displayCtrl getNumber(_x >> "loadoutArsenalButtonIDC");
    private _resetButtonControl = _display displayCtrl getNumber(_x >> "loadoutResetButtonIDC");

    // add mark if loadout has been set before
    if (A3A_faction_reb get _loadoutMoniker in rebelLoadouts) then {
        _textControl ctrlSetText format["%1 [x]", ctrlText _textControl];
        _textControl setVariable[QGVAR(hasLoadout), true];
    };

    // arsenal button action
    _arsenalButtonControl setVariable["loadoutMoniker", _loadoutMoniker];
    _arsenalButtonControl ctrlAddEventHandler["ButtonClick", {
        if !assert(params[["_control", nil, [controlNull]]]) exitWith {};
        private _moniker = _control getVariable "loadoutMoniker";

        currentRebelLoadout = A3A_faction_reb get _moniker;
        [] call JN_fnc_arsenal_handleAction;
    }];

    // copy, paste, reset button action
    _resetButtonControl setVariable["textControl", _textControl];
    _resetButtonControl setVariable["loadoutMoniker", _loadoutMoniker];
    _resetButtonControl ctrlAddEventHandler["MouseButtonClick", {
        if !assert(params[
            ["_control", nil, [controlNull]],
            ["_button", nil, [0]],
            "", // _xPos
            "", // _yPos
            ["_shift", nil, [false]],
            ["_ctrl", nil, [false]],
            ["_alt", nil, [false]]
        ]) exitWith {};

        private _display = uiNamespace getVariable QGVAR(rebelLoadoutMenuDisplay);
        private _moniker = _control getVariable "loadoutMoniker";

        switch true do {
            case (_button isNotEqualTo 0);
            case (_alt);
            case (_ctrl && _shift): {
                // do nothing for non-left clicks, alt presses or combined ctrl+shift presses
            };
            case (_ctrl): { // paste loadout
                if (isNil {_display getVariable QGVAR(loadoutCopy)}) exitWith {
                    playSound "A3AP_UiFailure";
                    systemChat localize "STR_antistasi_dialogs_hq_button_rebel_copy_paste_reset_combo_button_no_loadout_stored";
                };

                rebelLoadouts set[A3A_faction_reb get _moniker, _display getVariable QGVAR(loadoutCopy)];

                private _textControl = _control getVariable "textControl";

                if !(_textControl getVariable[QGVAR(hasLoadout), false]) then {
                    _textControl setVariable[QGVAR(hasLoadout), true];
                    _textControl ctrlSetText format["%1 [x]", ctrlText _textControl];
                };

        		playSound "A3AP_UiSuccess";
                systemChat format[localize "STR_antistasi_dialogs_hq_button_rebel_copy_paste_reset_combo_button_pasted", A3A_faction_reb get _moniker];
            };
            case (_shift): { // copy loadout
                if !(A3A_faction_reb get _moniker in rebelLoadouts) exitWith {
                    playSound "A3AP_UiFailure";
                    systemChat localize "STR_antistasi_dialogs_hq_button_rebel_copy_paste_reset_combo_button_no_loadout_configured";
                };

                _display setVariable[QGVAR(loadoutCopy), +(rebelLoadouts get(A3A_faction_reb get _moniker))];

                playSound "A3AP_UiSuccess";
                systemChat format[localize "STR_antistasi_dialogs_hq_button_rebel_copy_paste_reset_combo_button_copied", A3A_faction_reb get _moniker];
            };
            default {
                (A3A_faction_reb get _moniker) call SCRT_fnc_arsenal_clearLoadout;
            };
        };
    }];
};

nil;
