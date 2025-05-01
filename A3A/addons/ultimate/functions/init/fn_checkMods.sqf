/*
    Function: A3U_fnc_checkMods

    Description:
        Checks to see if any mods loaded are "incompatible", returns array of mod names. To be used to inform the player things may not work correctly.

    Parameter:
        N/A

    Returns:
        _addons

    Author:
        Silence
*/

private _addons = [];

// No point "optimising", script runs once at startup.

if (["CUP_AirVehicles_Core"] call A3U_fnc_hasAddon && {["RHS_US_A2Port_Armor"] call A3U_fnc_hasAddon}) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_CUP_RHS";
};

if (["AR_AdvancedRappelling"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_Advanced_Rappeling";
};

if (["AUR_AdvancedUrbanRappelling"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_Advanced_Urban_Rappeling";
};

if (["lambs_danger"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_LAMBS_AI";
};

if (["VCOM_AI"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_VCOM_AI";
};

if (["HIG_wall"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_AI_CSTG";
};

if (["asr_ai3_main"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_ASR_AI3";
};

if (["ALiVE_main"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_ALiVE";
};

if (["mcc_sandbox"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_MCC_Sandbox_4";
};

if (["zhc_main"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_ZHC";
};

if (["PiR"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_PiR";
};

if (["Werthles_WHK"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_WHK";
};

if (["jac_zeus_wargame"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_Wargame";
};

if (["diw_armor_plates_main"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_APS";
};

if (["BloodSplatter"] call A3U_fnc_hasAddon) then { // Some weird dismemberment mod that breaks everything
    _addons pushBack localize "STR_A3AU_init_mods_warning_dis";
};

if (["gore_units"] call A3U_fnc_hasAddon) then { // Some weird dismemberment mod that breaks everything
    _addons pushBack localize "STR_A3AU_init_mods_warning_dis";
};

if (["DISMEMBERMENT"] call A3U_fnc_hasAddon) then { // Some weird dismemberment mod that breaks everything
    _addons pushBack localize "STR_A3AU_init_mods_warning_dis";
};

if (["Lifeline_revive"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_Lifeline";
};

if (["exile_client"] call A3U_fnc_hasAddon) then {
    _addons pushBack localize "STR_A3AU_init_mods_warning_Exile";
};

if (_addons isNotEqualTo []) exitWith {
    private _addonText = _addons joinString ", ";

    private _text = formatText 
    [
        localize "STR_A3AU_init_mods_warning_text", lineBreak, _addonText
    ];

    [_text, localize "STR_A3AU_init_mods_warning_header"] call A3U_fnc_popup;

    _addons
};