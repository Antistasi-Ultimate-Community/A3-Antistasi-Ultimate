private _loadoutKey = _this;

if (isNil "_loadoutKey" || {_loadoutKey == ""}) exitWith {};

private _loadout = rebelLoadouts get _loadoutKey;

private _title = localize "STR_antistasi_dialogs_hq_button_rebel_loadouts_menu_title_text";

if (isNil "_loadout") exitWith {
    [_title, localize "STR_antistasi_dialogs_hq_button_no_custom_loadouts", localize "STR_notifiers_warning_type"] call SCRT_fnc_ui_showDynamicTextMessage;
};

rebelLoadouts deleteAt _loadoutKey;
publicVariable "rebelLoadouts";

private _display = findDisplay 120000;

if (str (_display) != "no display") then {
    if !((A3A_faction_reb get 'unitRifle') in rebelLoadouts) then {
        (_display displayCtrl 120001) ctrlSetText localize "STR_antistasi_dialogs_rifleman_title";
    };

    if !((A3A_faction_reb get 'unitMG') in rebelLoadouts) then {
        (_display displayCtrl 120002) ctrlSetText localize "STR_antistasi_dialogs_autorifleman_title";
    };

    if !((A3A_faction_reb get 'unitMedic') in rebelLoadouts) then {
        (_display displayCtrl 120003) ctrlSetText localize "STR_antistasi_dialogs_medic_title";
    };

    if !((A3A_faction_reb get 'unitEng') in rebelLoadouts) then {
        (_display displayCtrl 120004) ctrlSetText localize "STR_antistasi_dialogs_engineer_title";
    };

    if !((A3A_faction_reb get 'unitGL') in rebelLoadouts) then {
        (_display displayCtrl 120005) ctrlSetText localize "STR_antistasi_dialogs_grenadier_title";
    };

    if !((A3A_faction_reb get 'unitSniper') in rebelLoadouts) then {
        (_display displayCtrl 120006) ctrlSetText localize "STR_antistasi_dialogs_marksman_title";
    };

    if !((A3A_faction_reb get 'unitLAT') in rebelLoadouts) then {
        (_display displayCtrl 120007) ctrlSetText localize "STR_antistasi_dialogs_lat_title";
    };

    if !((A3A_faction_reb get 'unitCrew') in rebelLoadouts) then {
        (_display displayCtrl 120008) ctrlSetText localize "STR_antistasi_dialogs_crewman_title";
    };

    if !((A3A_faction_reb get 'unitSL') in rebelLoadouts) then {
        (_display displayCtrl 120009) ctrlSetText localize "STR_antistasi_dialogs_squad_leader_title";
    };

    if !((A3A_faction_reb get 'unitExp') in rebelLoadouts) then {
        (_display displayCtrl 120010) ctrlSetText localize "STR_antistasi_dialogs_sapper_title";
    };

    if !((A3A_faction_reb get 'unitAT') in rebelLoadouts) then {
        (_display displayCtrl 120011) ctrlSetText localize "STR_antistasi_dialogs_at_title";
    };

    if !((A3A_faction_reb get 'unitAA') in rebelLoadouts) then {
        (_display displayCtrl 120012) ctrlSetText localize "STR_antistasi_dialogs_aa_title";
    };
};

[_title, localize  "STR_antistasi_dialogs_hq_button_custom_loadout_clear", localize "STR_notifiers_success_type"] call SCRT_fnc_ui_showDynamicTextMessage;
