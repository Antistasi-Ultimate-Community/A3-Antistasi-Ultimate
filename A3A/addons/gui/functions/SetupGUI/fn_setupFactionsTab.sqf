/*
Function: A3A_fnc_setupFactionsTab
    Handles the initialization and tab switching on the setup dialog.
    This function should only be called from setupDialog onLoad and control activation EHs.
Author: John Jordan (jaj22) (Updated: SvenBrandt99)

Coalition integration:  Occupant, Invader and Rival listboxes support multiple selections while coalition mode is enabled. The first selected faction remains the primary AU faction; all additional selections are stored as coalition templates.

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
if (_mode == "onLoad") then {
    diag_log "[A3A Coalition UI] setupFactionsTab AU-based override active";
};

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

if (isNil {_display getVariable "isContentInitialized"}) then {
    // Fill the addon vics
    private _addonTable = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX;
    private _checkCtrls = [];
    {
        private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _addonTable];
        _textCtrl ctrlSetPosition [GRID_W*4, count _checkCtrls*GRID_H*4, GRID_W*40, GRID_H*4];
        _textCtrl ctrlCommit 0;
        if !(_x call _fnc_factionLoaded) then { _textCtrl ctrlSetTextColor A3A_COLOR_TEXT_DARKER_SQF };
        _textCtrl ctrlSetText getText (_x/"displayName");
        _textCtrl ctrlSetTooltip getText (_x/"description");

        private _checkCtrl = _display ctrlCreate ["A3A_Checkbox", -1, _addonTable];
        _checkCtrl ctrlSetPosition [0, count _checkCtrls*GRID_H*4, GRID_W*4, GRID_H*4];
        _checkCtrl ctrlCommit 0;
        _checkCtrl ctrlEnable (_x call _fnc_factionLoaded);				// disable if requirement failed
        _checkCtrl setVariable ["name", configName _x];
        _checkCtrls pushBack _checkCtrl;

    } forEach ("true" configClasses (A3A_SETUP_CONFIGFILE/"A3A"/"AddonVics"));
    _addonTable setVariable ["checkCtrls", _checkCtrls];

    // Fill the DLC
    // Fetch these automatically but remove DLC without equipment and vehicles
    //private _loadedDLC = getLoadedModsInfo select {_x#3 and !(_x#1 in ["A3","curator","argo","tacops"])};
    private _dlcTable = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX;
    _checkCtrls = [];
    {
        private _textCtrl = _display ctrlCreate ["A3A_Text_Small", -1, _dlcTable];
        _textCtrl ctrlSetPosition [GRID_W*4, count _checkCtrls*GRID_H*4, GRID_W*40, GRID_H*4];
        _textCtrl ctrlCommit 0;
        _textCtrl ctrlSetText _x#0;

        private _checkCtrl = _display ctrlCreate ["A3A_Checkbox", -1, _dlcTable];
        _checkCtrl ctrlSetPosition [0, count _checkCtrls*GRID_H*4, GRID_W*4, GRID_H*4];
        _checkCtrl ctrlCommit 0;
        _checkCtrl setVariable ["name", _x#1];
        _checkCtrls pushBack _checkCtrl;

    } forEach A3A_setup_loadedDLC;
    _dlcTable setVariable ["checkCtrls", _checkCtrls];

    _display setVariable ["isContentInitialized", true];
};

switch (_mode) do
{
    case ("update"): {
        _params params ["_listboxes"];

        // ! look away now lest you have an aneurysm looking at all the duplicated code
        // ! not much to be done when the same items need to be accessed both from here and from inside the event handlers :(

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

        private _modCGCtrl = _display displayCtrl A3A_IDC_SETUP_OVERRIDES;
        private _dlcCGCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT;
        private _addCGCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT;
        
        private _dlcCGHandler = _dlcCGCtrl getVariable "LBHandler";
        if (!isNil "_dlcCGHandler") then { _dlcCGCtrl ctrlRemoveEventHandler ["MouseMoving", _dlcCGHandler] };
        _dlcCGHandler = _dlcCGCtrl ctrlAddEventHandler ["MouseMoving", {
            params ["_dlcCGCtrl", "_xPos", "_yPos", "_mouseOver"];

            private _display = findDisplay A3A_IDD_SETUPDIALOG;
            private _dlcBGCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BG;
            //private _dlcBoxCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX;
            private _dlcBoxCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX;
            private _addCGCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT;
            private _addLabelCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_LABEL;
            private _addBGCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BG;
            //private _addBoxCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX;
            private _addBoxCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX;

            private _dlcCGx = 124 * GRID_W;
            private _dlcCGy = 26 * GRID_H;
            private _dlcCGw = 32 * GRID_W;
            private _dlcCGh = 22 * GRID_H;

            private _addCGx = 124 * GRID_W;
            private _addCGy = 50 * GRID_H;
            private _addCGw = 32 * GRID_W;
            private _addCGh = 46 * GRID_H;
            
            if (_mouseOver) then {
                if (_dlcCGCtrl getVariable "Expanded") exitWith {};
                _dlcCGCtrl setVariable ["Expanded", true];
                
                _dlcCGCtrl ctrlSetPosition [_dlcCGx, _dlcCGy, _dlcCGw, _dlcCGh + (20 * GRID_H)];
                { _x ctrlSetPosition [0, 4 * GRID_H, _dlcCGw, _dlcCGh + (16 * GRID_H)] } forEach [_dlcBGCtrl, _dlcBoxCtrl];

                _addCGCtrl ctrlSetPosition [_addCGx, _addCGy + (20 * GRID_H), _addCGw, _addCGh - (20 * GRID_H)];
                _addLabelCtrl ctrlSetPosition [0, 0, _addCGw, 4 * GRID_H];
                {_x ctrlSetPosition [0, 4 * GRID_H, _addCGw, _addCGh - (24 * GRID_H)] } forEach [_addBGCtrl, _addBoxCtrl];

                { _x ctrlCommit 0.4 } forEach [_dlcCGCtrl, _dlcBGCtrl, _dlcBoxCtrl, _addCGCtrl, _addLabelCtrl, _addBGCtrl, _addBoxCtrl];
            } else {
                _dlcCGCtrl ctrlSetPosition [_dlcCGx, _dlcCGy, _dlcCGw, _dlcCGh];
                {_x ctrlSetPosition [0, 4 * GRID_H, _dlcCGw, _dlcCGh - (4 * GRID_H)] } forEach [_dlcBGCtrl, _dlcBoxCtrl];

                _addCGCtrl ctrlSetPosition [_addCGx, _addCGy, _addCGw, _addCGh];
                _addLabelCtrl ctrlSetPosition [0, 0, _addCGw, 4 * GRID_H];
                {_x ctrlSetPosition [0, 4 * GRID_H, _addCGw, _addCGh - (4 * GRID_H)] } forEach [_addBGCtrl, _addBoxCtrl];

                { _x ctrlCommit 0.4 } forEach [_dlcCGCtrl, _dlcBGCtrl, _dlcBoxCtrl, _addCGCtrl, _addLabelCtrl, _addBGCtrl, _addBoxCtrl];
                _dlcCGCtrl setVariable ["Expanded", false];
            };
        }];
        _dlcCGCtrl setVariable ["LBHandler", _dlcCGHandler];

        private _addCGHandler = _addCGCtrl getVariable "LBHandler";
        if (!isNil "_addCGHandler") then { _addCGCtrl ctrlRemoveEventHandler ["MouseMoving", _addCGHandler] };
        _addCGHandler = _addCGCtrl ctrlAddEventHandler ["MouseMoving", {
            params ["_addCGCtrl", "_xPos", "_yPos", "_mouseOver"];

            private _display = findDisplay A3A_IDD_SETUPDIALOG;
            private _dlcCGCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT;
            private _dlcBGCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BG;
            //private _dlcBoxCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX;
            private _dlcBoxCtrl = _display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX;
            private _addLabelCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_LABEL;
            private _addBGCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BG;
            //private _addBoxCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX;
            private _addBoxCtrl = _display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX;

            private _dlcCGx = 124 * GRID_W;
            private _dlcCGy = 26 * GRID_H;
            private _dlcCGw = 32 * GRID_W;
            private _dlcCGh = 22 * GRID_H;

            private _addCGx = 124 * GRID_W;
            private _addCGy = 50 * GRID_H;
            private _addCGw = 32 * GRID_W;
            private _addCGh = 46 * GRID_H;
            
            if (_mouseOver) then {
                if (_addCGCtrl getVariable "Expanded") exitWith {};
                _addCGCtrl setVariable ["Expanded", true];
                
                _dlcCGCtrl ctrlSetPosition [_dlcCGx, _dlcCGy, _dlcCGw, _dlcCGh - (18 * GRID_H)];
                { _x ctrlSetPosition [0, 4 * GRID_H, _dlcCGw, _dlcCGh - (14 * GRID_H)] } forEach [_dlcBGCtrl, _dlcBoxCtrl];

                _addCGCtrl ctrlSetPosition [_addCGx, _addCGy - (18 * GRID_H), _addCGw, _addCGh + (18 * GRID_H)];
                _addLabelCtrl ctrlSetPosition [0, 0, _addCGw, 4 * GRID_H];
                {_x ctrlSetPosition [0, 4 * GRID_H, _addCGw, _addCGh + (14 * GRID_H)] } forEach [_addBGCtrl, _addBoxCtrl];

                { _x ctrlCommit 0.4 } forEach [_dlcCGCtrl, _dlcBGCtrl, _dlcBoxCtrl, _addCGCtrl, _addLabelCtrl, _addBGCtrl, _addBoxCtrl];
            } else {
                _dlcCGCtrl ctrlSetPosition [_dlcCGx, _dlcCGy, _dlcCGw, _dlcCGh];
                {_x ctrlSetPosition [0, 4 * GRID_H, _dlcCGw, _dlcCGh - (4 * GRID_H)] } forEach [_dlcBGCtrl, _dlcBoxCtrl];

                _addCGCtrl ctrlSetPosition [_addCGx, _addCGy, _addCGw, _addCGh];
                _addLabelCtrl ctrlSetPosition [0, 0, _addCGw, 4 * GRID_H];
                {_x ctrlSetPosition [0, 4 * GRID_H, _addCGw, _addCGh - (4 * GRID_H)] } forEach [_addBGCtrl, _addBoxCtrl];

                { _x ctrlCommit 0.4 } forEach [_dlcCGCtrl, _dlcBGCtrl, _dlcBoxCtrl, _addCGCtrl, _addLabelCtrl, _addBGCtrl, _addBoxCtrl];
                _addCGCtrl setVariable ["Expanded", false];
            };
        }];
        _addCGCtrl setVariable ["LBHandler", _addCGHandler];
    };

    case ("coalitionToggle"):
    {
        _params params ["_ctrl", "_checked"];

        // Checkbox only controls whether OCC/INV/RIV are interpreted as
        // multi-selection lists. The controls themselves are always LB_MULTI.
        // Turning coalition mode off collapses each enemy list to one row.
        if (_checked == 0) then {
            {
                private _list = _display displayCtrl _x;
                private _sel = lbSelection _list;
                private _keep = if (_sel isNotEqualTo []) then {
                    _sel # 0
                } else {
                    (lbCurSel _list) max 0
                };

                {
                    _list lbSetSelected [_x, false];
                } forEach _sel;

                _list lbSetSelected [_keep, true];
                _list lbSetCurSel _keep;

            } forEach [
                A3A_IDC_SETUP_OCCUPANTSLISTBOX,
                A3A_IDC_SETUP_INVADERSLISTBOX,
                A3A_IDC_SETUP_RIVALSLISTBOX
            ];

            missionNamespace setVariable [
                "A3A_coalitionConfigNet",
                [[], [], []],
                true
            ];
        };
    };

    case ("factionSelected"):
    {
        _params params ["_listbox", "_rowIndex"];
        if (_rowIndex == -1) exitWith {};

        private _idc = ctrlIDC _listbox;
        private _coalitionEnabled =
            cbChecked (_display displayCtrl A3A_IDC_SETUP_COALITIONCHECK);

        private _isCoalitionList = _idc in [
            A3A_IDC_SETUP_OCCUPANTSLISTBOX,
            A3A_IDC_SETUP_INVADERSLISTBOX,
            A3A_IDC_SETUP_RIVALSLISTBOX
        ];

        // Preserve AU's normal single-select behavior outside coalition mode.
        if (!_coalitionEnabled || {!_isCoalitionList}) exitWith {
            if (_listbox lbData _rowIndex != "") then {
                _listbox setVariable ["lastSel", _rowIndex];
            } else {
                _listbox lbSetCurSel (_listbox getVariable ["lastSel", 0]);
            };
        };

        // LB_MULTI itself owns the selection state. We only remember the
        // primary faction as the first valid selected config name.
        private _selectedNames = (lbSelection _listbox) apply {
            _listbox lbData _x
        };
        _selectedNames = _selectedNames select { _x != "" };

        if (_selectedNames isEqualTo []) exitWith {};

        private _primary = _listbox getVariable [
            "A3A_primaryFaction",
            ""
        ];

        if !(_primary in _selectedNames) then {
            _listbox setVariable [
                "A3A_primaryFaction",
                _selectedNames # 0
            ];
        };
    };

    case ("fillFactions"):
    {
        private _expandLBs = [];

        private _coalitionEnabled =
            cbChecked (_display displayCtrl A3A_IDC_SETUP_COALITIONCHECK);

        private _savedCoalition = missionNamespace getVariable [
            "A3A_coalitionConfigNet",
            [[], [], []]
        ];

        if ((count _savedCoalition) < 3) then {
            _savedCoalition pushBack [];
        };

        private _fnc_fillListBox = {
            params [
                "_listboxIDC",
                "_factions",
                "_selected",
                ["_coalitionSelected", []]
            ];

            Debug_1("fillListBox called with %1 selected", _selected);

            private _listbox = _display displayCtrl _listboxIDC;
            private _isCoalitionList = _listboxIDC in [
                A3A_IDC_SETUP_OCCUPANTSLISTBOX,
                A3A_IDC_SETUP_INVADERSLISTBOX,
                A3A_IDC_SETUP_RIVALSLISTBOX
            ];

            if (_selected == "") then {
                _selected = _listbox lbData lbCurSel _listbox;
            };

            _listbox lbSetCurSel -1;
            lbClear _listbox;

            {
                private _index = _listbox lbAdd getText(_x/"name");

                if (_x call _fnc_factionLoaded) then {
                    _listbox lbSetPicture [_index, getText(_x/"flagTexture")];
                    _listbox lbSetPictureRight [_index, getText(_x/"logo")];
                    _listbox lbSetData [_index, configName _x];
                    _listbox lbSetTooltip [_index, getText(_x/"description")];

                    if (
                        _coalitionEnabled
                        && {_isCoalitionList}
                    ) then {
                        if ((configName _x) in _coalitionSelected) then {
                            _listbox lbSetSelected [_index, true];
                        };
                    } else {
                        if (_selected == configName _x) then {
                            _listbox lbSetCurSel _index;
                        };
                    };
                } else {
                    _listbox lbSetPicture [_index, "a3\data_f\flags\flag_white_dmg_co.paa"];
                    _listbox lbSetPictureColor [_index, [1,1,1,0.3]];
                    _listbox lbSetTooltip [_index, format [
                        localize "STR_A3AP_setupFactionsTab_noLoaded",
                        (getArray(_x/"requiredAddons")) joinString ", "
                    ]];
                    _listbox lbSetColor [_index, A3A_COLOR_TEXT_DARKER_SQF];
                    _listbox lbSetSelectColor [_index, A3A_COLOR_TEXT_DARKER_SQF];
                };
            } forEach _factions;

            if (
                !_coalitionEnabled
                || {!_isCoalitionList}
            ) then {
                if (lbCurSel _listbox == -1) then {
                    _listbox lbSetCurSel 0;
                };
            };

            if (count _factions > 12) then {
                _expandLBs pushBack _listbox;
            };
        };


        // AU ORIGINAL FILTERING
        private _factions = +(_display getVariable "validFactions");

        if (!cbChecked (_display displayCtrl A3A_IDC_SETUP_IGNORECAMOCHECK)) then {
            _factions = _factions apply {
                _x select {
                    getArray (_x/"climate") isEqualTo []
                    or A3A_climate in getArray (_x/"climate")
                }
            };
        };

        private _missingFactions = _factions apply {
            _x select { !(_x call _fnc_factionLoaded) }
        };

        _factions = _factions apply {
            _x select { _x call _fnc_factionLoaded }
        };

        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_SWITCHENEMYCHECK)) then {
            _factions = [
                _factions#1,
                _factions#0,
                _factions#2,
                _factions#3,
                _factions#4
            ];
        };

        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_ANYENEMYCHECK)) then {
            _factions = [
                _factions#0 + _factions#1,
                _factions#1 + _factions#0,
                _factions#2,
                _factions#3,
                _factions#4
            ];
        };


        // AU ORIGINAL saved primary factions
        (_display getVariable "savedFactions") params [
            "_savedFactions",
            "_savedAddons",
            "_savedDLC"
        ];

        Debug_3(
            "Saved factions: %1 Addons: %2 DLC: %3",
            _savedFactions,
            _savedAddons,
            _savedDLC
        );

        private _failedFactions = [];

        {
            private _sfact =
                A3A_SETUP_CONFIGFILE
                / "A3A"
                / "Templates"
                / _x;

            if !(isClass _sfact) then {
                Info_1("Bad saved faction name %1", _x);
                _failedFactions pushBack _x;
                continue;
            };

            if !(_sfact call _fnc_factionLoaded) then {
                Info_1("Saved faction %1 not loadable", _x);
                _failedFactions pushBack _x;
                continue;
            };

            _factions#_forEachIndex pushBackUnique _sfact;

        } forEach _savedFactions;


        // addition: do the same thing for saved coalition extras.
        {
            private _bucket = _forEachIndex;

            {
                if (_x isEqualType [] && {count _x > 0}) then {
                    private _configName = _x # 0;

                    private _cfg =
                        A3A_SETUP_CONFIGFILE
                        / "A3A"
                        / "Templates"
                        / _configName;

                    if (
                        isClass _cfg
                        && {_cfg call _fnc_factionLoaded}
                    ) then {
                        _factions#_bucket pushBackUnique _cfg;
                    };
                };
            } forEach _x;

        } forEach [
            _savedCoalition param [0, []],
            _savedCoalition param [1, []],
            _savedCoalition param [2, []]
        ];


        if (_failedFactions isNotEqualTo []) then {
            private _msg = "Couldn't load factions from save:";
            {
                _msg = _msg + endl + _x
            } forEach _failedFactions;

            ["Setup", _msg] spawn A3A_fnc_customHint;
        };

        if (cbChecked (_display displayCtrl A3A_IDC_SETUP_SHOWMISSINGCHECK)) then {
            {
                _x append _missingFactions#_forEachIndex
            } forEach _factions;
        };

        if (_savedFactions isEqualTo []) then {
            _savedFactions = ["", "", "", "", ""]
        };


        private _occSelected = [_savedFactions#0];
        private _invSelected = [_savedFactions#1];
        private _rivSelected = [_savedFactions#4];

        {
            if (_x isEqualType [] && {count _x > 0}) then {
                _occSelected pushBackUnique (_x # 0);
            };
        } forEach (_savedCoalition param [0, []]);

        {
            if (_x isEqualType [] && {count _x > 0}) then {
                _invSelected pushBackUnique (_x # 0);
            };
        } forEach (_savedCoalition param [1, []]);

        {
            if (_x isEqualType [] && {count _x > 0}) then {
                _rivSelected pushBackUnique (_x # 0);
            };
        } forEach (_savedCoalition param [2, []]);


        [
            A3A_IDC_SETUP_OCCUPANTSLISTBOX,
            _factions#0,
            _savedFactions#0,
            _occSelected
        ] call _fnc_fillListBox;

        [
            A3A_IDC_SETUP_INVADERSLISTBOX,
            _factions#1,
            _savedFactions#1,
            _invSelected
        ] call _fnc_fillListBox;

        [
            A3A_IDC_SETUP_REBELSLISTBOX,
            _factions#2,
            _savedFactions#2
        ] call _fnc_fillListBox;

        [
            A3A_IDC_SETUP_CIVILIANSLISTBOX,
            _factions#3,
            _savedFactions#3
        ] call _fnc_fillListBox;

        [
            A3A_IDC_SETUP_RIVALSLISTBOX,
            _factions#4,
            _savedFactions#4,
            _rivSelected
        ] call _fnc_fillListBox;


        // Store explicit primary values for coalition getFactions.
        (_display displayCtrl A3A_IDC_SETUP_OCCUPANTSLISTBOX)
            setVariable ["A3A_primaryFaction", _savedFactions#0];

        (_display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX)
            setVariable ["A3A_primaryFaction", _savedFactions#1];

        (_display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX)
            setVariable ["A3A_primaryFaction", _savedFactions#4];


        ["update", [_expandLBs]] call A3A_fnc_setupFactionsTab;
    };


    case ("getFactions"):
    {
        private _coalitionEnabled =
            cbChecked (_display displayCtrl A3A_IDC_SETUP_COALITIONCHECK);

        private _enemyIDCs = [
            A3A_IDC_SETUP_OCCUPANTSLISTBOX,
            A3A_IDC_SETUP_INVADERSLISTBOX,
            A3A_IDC_SETUP_RIVALSLISTBOX
        ];

        private _allSelections = [];

        {
            private _ctrl = _display displayCtrl _x;

            private _names = if (_coalitionEnabled) then {
                (lbSelection _ctrl) apply {
                    _ctrl lbData _x
                }
            } else {
                [_ctrl lbData lbCurSel _ctrl]
            };

            _names = _names select { _x != "" };

            if (_names isEqualTo []) then {
                _names = [_ctrl lbData 0];
            };

            _allSelections pushBack _names;
        } forEach _enemyIDCs;


        diag_log format [
            "[A3A Coalition UI] selection counts OCC=%1 INV=%2 RIV=%3 raw=%4",
            count (_allSelections # 0),
            count (_allSelections # 1),
            count (_allSelections # 2),
            _allSelections
        ];

        private _fnc_primary = {
            params [
                "_ctrl",
                "_selected"
            ];

            private _primary = _ctrl getVariable [
                "A3A_primaryFaction",
                ""
            ];

            if !(_primary in _selected) then {
                _primary = _selected # 0;
                _ctrl setVariable [
                    "A3A_primaryFaction",
                    _primary
                ];
            };

            _primary
        };


        private _occCtrl =
            _display displayCtrl A3A_IDC_SETUP_OCCUPANTSLISTBOX;
        private _invCtrl =
            _display displayCtrl A3A_IDC_SETUP_INVADERSLISTBOX;
        private _rivCtrl =
            _display displayCtrl A3A_IDC_SETUP_RIVALSLISTBOX;

        private _mainOcc = [
            _occCtrl,
            _allSelections#0
        ] call _fnc_primary;

        private _mainInv = [
            _invCtrl,
            _allSelections#1
        ] call _fnc_primary;

        private _mainRiv = [
            _rivCtrl,
            _allSelections#2
        ] call _fnc_primary;


        // AU still receives exactly five primary faction config names.
        private _factions = [
            _mainOcc,
            _mainInv,

            (_display displayCtrl A3A_IDC_SETUP_REBELSLISTBOX)
                lbData
                lbCurSel (_display displayCtrl A3A_IDC_SETUP_REBELSLISTBOX),

            (_display displayCtrl A3A_IDC_SETUP_CIVILIANSLISTBOX)
                lbData
                lbCurSel (_display displayCtrl A3A_IDC_SETUP_CIVILIANSLISTBOX),

            _mainRiv
        ];


        private _fnc_buildExtras = {
            params [
                "_selected",
                "_main"
            ];

            if (!_coalitionEnabled) exitWith {
                []
            };

            private _extras = _selected - [_main];
            private _result = [];

            {
                private _cfg =
                    A3A_SETUP_CONFIGFILE
                    / "A3A"
                    / "Templates"
                    / _x;

                if !(isClass _cfg) then {
                    continue;
                };

                private _basePath = getText (_cfg / "basepath");
                private _file = getText (_cfg / "file");

                if (_basePath == "" || {_file == ""}) then {
                    continue;
                };

                private _path = if (
                    (toLower _file) select [
                        ((count _file) - 4) max 0
                    ] == ".sqf"
                ) then {
                    format ["%1\%2", _basePath, _file]
                } else {
                    format ["%1\%2.sqf", _basePath, _file]
                };

                _result pushBack [
                    _x,
                    _path
                ];

            } forEach _extras;

            _result
        };


        private _coalitionConfig = [
            [
                _allSelections#0,
                _mainOcc
            ] call _fnc_buildExtras,

            [
                _allSelections#1,
                _mainInv
            ] call _fnc_buildExtras,

            [
                _allSelections#2,
                _mainRiv
            ] call _fnc_buildExtras
        ];

        missionNamespace setVariable [
            "A3A_coalitionConfigNet",
            _coalitionConfig,
            true
        ];

        missionNamespace setVariable [
            "A3A_coalitionEnabledNet",
            _coalitionEnabled,
            true
        ];

        diag_log format [
            "[A3A Coalition UI] getFactions enabled=%1 primary=%2 selections=%3 config=%4",
            _coalitionEnabled,
            [_mainOcc, _mainInv, _mainRiv],
            _allSelections,
            _coalitionConfig
        ];

        _factions;
    };


    case ("getContent"):
    {
        private _addons = [];
        {
            if (cbChecked _x) then { _addons pushBack (_x getVariable "name") };
        } forEach ((_display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX) getVariable "checkCtrls");

        private _dlc = [];
        {
            if (cbChecked _x) then { _dlc pushBack (_x getVariable "name") };
        } forEach ((_display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX) getVariable "checkCtrls");


        [_addons, _dlc];
    };

    case ("fillContent"):
    {
        // Add saved factions if valid
        // configNames of the occ/inv/reb/civ factions, written by setupLoadgameTab
        (_display getVariable "savedFactions") params ["_savedFactions", "_savedAddons", "_savedDLC"];
        Debug_3("Saved factions: %1 Addons: %2 DLC: %3", _savedFactions, _savedAddons, _savedDLC);

        // Should now set the addonvics & DLC tickboxes according to the save data
        private _addonCtrls = (_display displayCtrl A3A_IDC_SETUP_ADDONCONTENT_BOX) getVariable "checkCtrls";
        private _dlcCtrls = (_display displayCtrl A3A_IDC_SETUP_DLCCONTENT_BOX) getVariable "checkCtrls";
        { _x cbSetChecked false } forEach _addonCtrls + _dlcCtrls;

        {
            private _addon = _x;
            private _index = _addonCtrls findIf { _x getVariable "name" == _addon };
            if (_index == -1) then { Error_1("Addon vics template %1 not found", _x); continue };
            if !(ctrlEnabled (_addonCtrls#_index)) then { Error_1("Addon vics template %1 not loaded", _x); continue };
            (_addonCtrls#_index) cbSetChecked true;
        } forEach _savedAddons;

        {
            private _dlc = _x;
            private _index = _dlcCtrls findIf { _x getVariable "name" == _dlc };
            if (_index == -1) then { Error_1("DLC %1 not loaded", _x); continue };
            (_dlcCtrls#_index) cbSetChecked true;
        } forEach _savedDLC;
    };

    default {
        Error_1("Called with unknown mode %1", _mode);
    };
};
