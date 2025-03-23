/*
Function: A3A_fnc_setupFactionsTab
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.
Author: John Jordan (jaj22)

Environment: Scheduled for onLoad, sendData and serverClose modes. Unscheduled for everything else.

Arguments:
    <STRING> Mode, e.g. "onLoad", "switchTab"
    <ARRAY<ANY>> Array of params for the mode when applicable. Params for specific modes are documented in the modes.


Modes:
    - update does nothing
    - factionSelected called no new item selectionNames
    - fillFactions fills faction tab with the factions
    - getFactions getter for selected items in tab

Return Value:
    on mode getFactions - returns array of selected items in dialog in form [_factions, _addons, _dlc]

*/

#include "..\..\dialogues\ids.inc"
#include "..\..\dialogues\defines.hpp"
#include "..\..\dialogues\textures.inc"
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_mode", "_params"];

Debug_1("setupFactionsTab called with mode %1", _mode);

private _display = findDisplay A3A_IDD_SETUPDIALOG;
private _worldName = toLower worldName;

if (isNil "A3A_setup_loadedPatches") exitWith { Error("No patch data. Load order fuckup?") };

// Input: faction config, output: true/false
private _fnc_factionLoaded = {
    getArray (_this/"requiredAddons") findIf { !(_x in A3A_setup_loadedPatches) } == -1
};
// local version: getArray (_x/"requiredAddons") findIf { !(isClass (configFile/"CfgPatches"/_x)) } != -1;

// Split factions by side and priority-sort
if (isNil {_display getVariable "validFactions"}) then
{
    private _fnc_prioritySort = {
        params ["_factions"];
        private _factionSort = [];
        {
            private _priority = getNumber (_x/"priority") + 0.01*_forEachIndex;
            private _maps = getArray (_x/"maps");
            if (count _maps > 0) then { _priority = _priority + ([-2, 2] select (_worldName in _maps)) };
            if !(_x call _fnc_factionLoaded) then { _priority = _priority - 100 };
            _factionSort pushBack [_priority, _x];
        } forEach _factions;

        _factionSort sort false;
        _factionSort apply { _x#1 };
    };

    // prep the valid factions for current modset
    private _factions = [[], [], [], [], []];
    private _factTypeHM = createHashMapFromArray [["Occ", 0], ["Inv", 1], ["Reb", 2], ["Civ", 3], ["Riv", 4]];
    {
        if (getText (_x/"side") == "") then { continue };
        private _factIndex = _factTypeHM get getText (_x/"side");
        (_factions select _factIndex) pushBack _x;
    } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"Templates"));

    _factions = _factions apply { [_x] call _fnc_prioritySort };
    _display setVariable ["validFactions", _factions];
};

switch (_mode) do
{
    case ("update"): {
        _params params ["_listboxes"];

        private _rebLBCtrl = _display displayCtrl A3A_IDC_SETUP_REBELSLISTBOX;
        private _civLBCtrl = _display displayCtrl A3A_IDC_SETUP_CIVILIANSLISTBOX;
        private _invLBCtrl = _display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX;
        private _rivLBCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX;

        
        private _rebLBHandler =_rebLBCtrl getVariable "LBHandler";
        if (!isNil "_rebLBHandler") then { _rebLBCtrl ctrlRemoveEventHandler ["MouseMoving", _rebLBHandler] };
        if (_rebLBCtrl in _listboxes) then {
            _rebLBHandler = _rebLBCtrl ctrlAddEventHandler ["MouseMoving", {
                params ["_rebLBCtrl", "_xPos", "_yPos", "_mouseOver"];

                private _display = findDisplay A3A_IDD_SETUPDIALOG;
                private _civLabelCtrl = _display displayCtrl A3A_IDC_SETUP_CIVILIANSLABEL;
                private _civLBCtrl = _display displayCtrl A3A_IDC_SETUP_CIVILIANSLISTBOX;

                if (_mouseOver) then {
                    if (_rebLBCtrl getVariable "Expanded") exitWith {};
                    _rebLBCtrl setVariable ["Expanded", true];
                    
                    private _rebLBSize = lbSize _rebLBCtrl;
                    private _LBx = 4 * GRID_W;
                    private _rebLBy = 8 * GRID_H;
                    private _LBw = 38 * GRID_W;
                    private _Lh = 4 * GRID_H;
                    private _rebLBh = ((_rebLBSize * 3.25) min 66) * GRID_H;
                    private _civLy = (_rebLBy + _rebLBh + 2 * GRID_H);
                    private _civLBy = (_civLy + 4 * GRID_H);
                    private _civLBh = (92 * GRID_H - _civLy);
                    _rebLBCtrl ctrlSetPosition [_LBx, _rebLBy, _LBw, _rebLBh];
                    _civLabelCtrl ctrlSetPosition [_LBx, _civLy, _LBw, _Lh];
                    _civLBCtrl ctrlSetPosition [_LBx, _civLBy, _LBw, _civLBh];
                    { _x ctrlCommit 0.4 } forEach [_rebLBCtrl, _civLabelCtrl, _civLBCtrl];
                } else {
                    _rebLBCtrl ctrlSetPosition [4 * GRID_W, 8 * GRID_H, 38 * GRID_W, 40 * GRID_H];
                    _civLabelCtrl ctrlSetPosition [4 * GRID_W, 50 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _civLBCtrl ctrlSetPosition [4 * GRID_W, 54 * GRID_H, 38 * GRID_W, 42 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_rebLBCtrl, _civLabelCtrl, _civLBCtrl];
                    _rebLBCtrl setVariable ["Expanded", false];
                };
            }];
            _rebLBCtrl setVariable ["LBHandler", _rebLBHandler];
        };

        private _civLBHandler = _civLBCtrl getVariable "LBHandler";
        if (!isNil "_civLBHandler") then { _civLBCtrl ctrlRemoveEventHandler ["MouseMoving", _civLBHandler] };
        if (_civLBCtrl in _listboxes) then {
            _civLBHandler = _civLBCtrl ctrlAddEventHandler ["MouseMoving", {
                params ["_civLBCtrl", "_xPos", "_yPos", "_mouseOver"];

                private _display = findDisplay A3A_IDD_SETUPDIALOG;
                private _civLabelCtrl = _display displayCtrl A3A_IDC_SETUP_CIVILIANSLABEL;
                private _rebLBCtrl = _display displayCtrl A3A_IDC_SETUP_REBELSLISTBOX;

                if (_mouseOver) then {
                    if (_civLBCtrl getVariable "Expanded") exitWith {};
                    _civLBCtrl setVariable ["Expanded", true];
                    
                    _rebLBCtrl ctrlSetPosition [4 * GRID_W, 8 * GRID_H, 38 * GRID_W, 16 * GRID_H];
                    _civLabelCtrl ctrlSetPosition [4 * GRID_W, 26 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _civLBCtrl ctrlSetPosition [4 * GRID_W, 30 * GRID_H, 38 * GRID_W, 66 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_rebLBCtrl, _civLabelCtrl, _civLBCtrl];
                } else {
                    _rebLBCtrl ctrlSetPosition [4 * GRID_W, 8 * GRID_H, 38 * GRID_W, 40 * GRID_H];
                    _civLabelCtrl ctrlSetPosition [4 * GRID_W, 50 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _civLBCtrl ctrlSetPosition [4 * GRID_W, 54 * GRID_H, 38 * GRID_W, 42 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_rebLBCtrl, _civLabelCtrl, _civLBCtrl];
                    _civLBCtrl setVariable ["Expanded", false];
                };
            }];
            _civLBCtrl setVariable ["LBHandler", _civLBHandler];
        };

        private _invLBHandler = _invLBCtrl getVariable "LBHandler";
        if (!isNil "_invLBHandler") then { _invLBCtrl ctrlRemoveEventHandler ["MouseMoving", _invLBHandler] };
        if (_invLBCtrl in _listboxes) then {
            _invLBHandler = _invLBCtrl ctrlAddEventHandler ["MouseMoving", {
                params ["_invLBCtrl", "_xPos", "_yPos", "_mouseOver"];

                private _display = findDisplay A3A_IDD_SETUPDIALOG;
                private _rivLabelCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLABEL;
                private _rivLBCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX;

                if (_mouseOver) then {
                    if (_invLBCtrl getVariable "Expanded") exitWith {};
                    _invLBCtrl setVariable ["Expanded", true];
                    
                    private _invLBSize = lbSize _invLBCtrl;
                    private _LBx = 84 * GRID_W;
                    private _invLBy = 8 * GRID_H;
                    private _LBw = 38 * GRID_W;
                    private _Lh = 4 * GRID_H;
                    private _invLBh = ((_invLBSize * 3.25) min 66) * GRID_H;
                    private _rivLy = (_invLBy + _invLBh + 2 * GRID_H);
                    private _rivLBy = (_rivLy + 4 * GRID_H);
                    private _rivLBh = (92 * GRID_H - _rivLy);
                    _invLBCtrl ctrlSetPosition [_LBx, _invLBy, _LBw, _invLBh];
                    _rivLabelCtrl ctrlSetPosition [_LBx, _rivLy, _LBw, _Lh];
                    _rivLBCtrl ctrlSetPosition [_LBx, _rivLBy, _LBw, _rivLBh];
                    { _x ctrlCommit 0.4 } forEach [_invLBCtrl, _rivLabelCtrl, _rivLBCtrl];
                } else {
                    _invLBCtrl ctrlSetPosition [84 * GRID_W, 8 * GRID_H, 38 * GRID_W, 40 * GRID_H];
                    _rivLabelCtrl ctrlSetPosition [84 * GRID_W, 50 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _rivLBCtrl ctrlSetPosition [84 * GRID_W, 54 * GRID_H, 38 * GRID_W, 42 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_invLBCtrl, _rivLabelCtrl, _rivLBCtrl];
                    _invLBCtrl setVariable ["Expanded", false];
                };
            }];
            _invLBCtrl setVariable ["LBHandler", _invLBHandler];
        };

        private _rivLBHandler = _rivLBCtrl getVariable "LBHandler";
        if (!isNil "_rivLBHandler") then { _rivLBCtrl ctrlRemoveEventHandler ["MouseMoving", _rivLBHandler] };
        if (_rivLBCtrl in _listboxes) then {
            _rivLBHandler = _rivLBCtrl ctrlAddEventHandler ["MouseMoving", {
                params ["_rivLBCtrl", "_xPos", "_yPos", "_mouseOver"];

                private _display = findDisplay A3A_IDD_SETUPDIALOG;
                private _rivLabelCtrl = _display displayCtrl A3A_IDC_SETUP_RIVALSLABEL;
                private _invLBCtrl = _display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX;

                if (_mouseOver) then {
                    if (_rivLBCtrl getVariable "Expanded") exitWith {};
                    _rivLBCtrl setVariable ["Expanded", true];
                    
                    _invLBCtrl ctrlSetPosition [84 * GRID_W, 8 * GRID_H, 38 * GRID_W, 16 * GRID_H];
                    _rivLabelCtrl ctrlSetPosition [84 * GRID_W, 26 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _rivLBCtrl ctrlSetPosition [84 * GRID_W, 30 * GRID_H, 38 * GRID_W, 66 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_invLBCtrl, _rivLabelCtrl, _rivLBCtrl];
                } else {
                    _invLBCtrl ctrlSetPosition [84 * GRID_W, 8 * GRID_H, 38 * GRID_W, 40 * GRID_H];
                    _rivLabelCtrl ctrlSetPosition [84 * GRID_W, 50 * GRID_H, 38 * GRID_W, 4 * GRID_H];
                    _rivLBCtrl ctrlSetPosition [84 * GRID_W, 54 * GRID_H, 38 * GRID_W, 42 * GRID_H];
                    { _x ctrlCommit 0.4 } forEach [_invLBCtrl, _rivLabelCtrl, _rivLBCtrl];
                    _rivLBCtrl setVariable ["Expanded", false];
                };
            }];
            _rivLBCtrl setVariable ["LBHandler", _rivLBHandler];
        };
    };

    case ("factionSelected"):
    {
        _params params ["_listbox", "_rowIndex"];
        if (_rowIndex == -1) exitWith {};
        if (_listbox lbData _rowIndex != "") then {
            _listBox setVariable ["lastSel", _rowIndex];
        } else {
            _listbox lbSetCurSel (_listbox getVariable ["lastSel", 0]);
        };
    };

    case ("fillFactions"):
    {
        private _expandLBs = [];
        
        private _fnc_fillListBox = {
            params ["_listboxIDC", "_factions", "_selected"];
            Debug_1("fillListBox called with %1 selected", _selected);
            private _listbox = _display displayCtrl _listboxIDC;
            if (_selected == "") then { _selected = _listBox lbData lbCurSel _listBox };		// remember previous faction selected
            _listBox lbSetCurSel -1;
            lbClear _listBox;
            {
                private _index = _listBox lbAdd getText(_x/"name");
                if (_x call _fnc_factionLoaded) then {
                    _listBox lbSetPicture [_index, getText(_x/"flagTexture")];
                    _listBox lbSetPictureRight [_index, getText(_x/"logo")]; // Perhaps remove this because it looks like a cluster fuck with mods loaded
                    _listBox lbSetData [_index, configName _x];
                    _listBox lbSetTooltip [_index, getText(_x/"description")];
                    if (_selected == configName _x) then { _listBox lbSetCurSel (lbSize _listBox - 1) };
                } else {
                    _listBox lbSetPicture [_index, "a3\data_f\flags\flag_white_dmg_co.paa"];
                    _listBox lbSetPictureColor [_index, [1,1,1,0.3]];
                    _listBox lbSetTooltip [_index, format[localize "STR_A3AP_setupFactionsTab_noLoaded", (getArray(_x/"requiredAddons")) joinString ", "]];
                    _listBox lbSetColor [_index, A3A_COLOR_TEXT_DARKER_SQF];
                    _listBox lbSetSelectColor [_index, A3A_COLOR_TEXT_DARKER_SQF];
                };
            } forEach _factions;
            if (lbCurSel _listBox == -1) then { _listBox lbSetCurSel 0 };				// Should always exist

            if (count _factions > 12) then { _expandLBs pushBack _listbox };
        };

        // Fetch valid factions and filter based on checkboxes
        private _factions = +(_display getVariable "validFactions");
        if (!cbChecked (_display displayCtrl A3A_IDC_SETUP_IGNORECAMOCHECK)) then {
            _factions = _factions apply { _x select { getArray (_x/"climate") isEqualTo [] or A3A_climate in getArray (_x/"climate") } };
        };
        private _missingFactions = _factions apply { _x select { !(_x call _fnc_factionLoaded) } };
        _factions = _factions apply { _x select { _x call _fnc_factionLoaded } };

        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_SWITCHENEMYCHECK)) then {
            _factions = [_factions#1, _factions#0, _factions#2, _factions#3, _factions#4];
        };
        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_ANYENEMYCHECK)) then {
            _factions = [_factions#0 + _factions#1, _factions#1 + _factions#0, _factions#2, _factions#3, _factions#4];
        };

        // Add saved factions if valid
        // configNames of the occ/inv/reb/civ factions, written by setupLoadgameTab
        (_display getVariable "savedFactions") params ["_savedFactions", "_savedAddons", "_savedDLC"];
        Debug_3("Saved factions: %1 Addons: %2 DLC: %3", _savedFactions, _savedAddons, _savedDLC);

        private _failedFactions = [];
        {
            _sfact = A3A_SETUP_CONFIGFILE/"A3A"/"Templates"/_x;
            if !(isClass _sfact) then { Info_1("Bad saved faction name %1", _x); _failedFactions pushBack _x };
            if !(_sfact call _fnc_factionLoaded) then { Info_1("Saved faction %1 not loadable", _x); _failedFactions pushBack _x };
            _factions#_forEachIndex pushBackUnique _sfact;				// does nothing if already in list
        } forEach _savedFactions;

        if (_failedFactions isNotEqualTo []) then {
            private _msg = "Couldn't load factions from save:";
            { _msg = _msg + endl + _x } forEach _failedFactions;
            ["Setup", _msg] spawn A3A_fnc_customHint;
        };

        // Add the non-loadable factions back in
        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_SHOWMISSINGCHECK)) then {
            { _x append _missingFactions#_forEachIndex } forEach _factions;
        };

        if (_savedFactions isEqualTo []) then { _savedFactions = ["", "", "", "", ""] };
        [A3A_IDC_SETUP_OCCUPANTSLISTBOX, _factions#0, _savedFactions#0] call _fnc_fillListBox;
        [A3A_IDC_SETUP_INVADERSLISTBOX, _factions#1, _savedFactions#1] call _fnc_fillListBox;
        [A3A_IDC_SETUP_REBELSLISTBOX, _factions#2, _savedFactions#2] call _fnc_fillListBox;
        [A3A_IDC_SETUP_CIVILIANSLISTBOX, _factions#3, _savedFactions#3] call _fnc_fillListBox;
        [A3A_IDC_SETUP_RIVALSLISTBOX, _factions#4, _savedFactions#4] call _fnc_fillListBox;

        ["update", [_expandLBs]] call A3A_fnc_setupFactionsTab;
    };


    case ("getFactions"):
    {
        private _factions = [A3A_IDC_SETUP_OCCUPANTSLISTBOX, A3A_IDC_SETUP_INVADERSLISTBOX, A3A_IDC_SETUP_REBELSLISTBOX, A3A_IDC_SETUP_CIVILIANSLISTBOX, A3A_IDC_SETUP_RIVALSLISTBOX] apply {
            private _factCtrl = _display displayCtrl _x;
            _factCtrl lbData lbCurSel _factCtrl;
        };

        _factions;
    };

    default {
        Error_1("Called with unknown mode %1", _mode);
    };
};
