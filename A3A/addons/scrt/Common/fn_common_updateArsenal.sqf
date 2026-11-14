private _arsenalUpdateText = [] call A3A_fnc_arsenalManage;
if (_arsenalUpdateText isNotEqualTo "") then {
    _arsenalUpdateText = format [localize "STR_hints_arsenal_transfer_updated", _arsenalUpdateText];
    [petros,"income",_arsenalUpdateText] remoteExec ["A3A_fnc_commsMP",[teamPlayer,civilian]];
};
