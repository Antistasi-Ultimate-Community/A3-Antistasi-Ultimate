private _aiUnits = (units (group player)) select {!isPlayer _x && {alive _x} && {_x != petros}};

if (theBoss isEqualTo objNull) exitWith {
    [localize "STR_hints_hc_transfer_header", localize "STR_hints_hc_transfer_no_comm"] call SCRT_fnc_misc_deniedHint;
};

if (!([theBoss] call A3A_fnc_hasRadio)) exitWith {
    [localize "STR_hints_hc_transfer_header", localize "STR_hints_hc_transfer_no_radio_comm"] call SCRT_fnc_misc_deniedHint;
};

if (!([player] call A3A_fnc_hasRadio)) exitWith {
    [localize "STR_hints_hc_transfer_header", localize "STR_hints_hc_transfer_no_radio"] call SCRT_fnc_misc_deniedHint;
};


if !([player] call A3A_fnc_canFight) exitWith {
    [localize "STR_hints_hc_transfer_header", localize "STR_hints_hc_transfer_combat_ready"] call SCRT_fnc_misc_deniedHint;
};

if (count _aiUnits < 1) exitWith {
    [localize "STR_hints_hc_transfer_header", localize "STR_hints_hc_transfer_no_ai"] call SCRT_fnc_misc_deniedHint;
};


private _transferGroup = createGroup teamPlayer;
_transferGroup setGroupIdGlobal [format ["SqMilitia-%1",{side (leader _x) == teamPlayer} count allGroups]];

_aiUnits joinSilent _transferGroup;

theBoss hcSetGroup [_transferGroup];

private _text = format [localize "STR_hints_hc_transfer_success", groupId _transferGroup];
[petros, "hint", _text] remoteExec ["A3A_fnc_commsMP",theBoss];
petros directSay "SentGenReinforcementsArrived";
