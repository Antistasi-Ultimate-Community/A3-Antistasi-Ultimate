#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

/*  Shows the intercepted radio setup message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info to revealed
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type of the support
        _position: ARRAY : Target position of support
        _setupTime : NUMBER : Approximate setup time in seconds

    Returns:
        Nothing
*/

// TODO: add source/setup position?

params ["_reveal", "_side", "_supportType", "_position", "_setupTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _sideName = Faction(_side) get "name";
if (_reveal <= 0.5) then
{
    //Side and setup is revealed
    _text = format [localize "STR_notifiers_SUP_setup_unknown2", _sideName];
}
else
{
    switch (toUpperANSI _supportType) do
    {
        case ("MAJORATTACK"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_wavedAttack", _sideName];
        };
        case ("COUNTERATTACK"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_counterAttack", _sideName];
        };
        case ("QRFAIR"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_QRFAir", _sideName];
        };
        case ("QRFLAND"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_QRFLand", _sideName];
        };
        case ("QRFVEHAIRDROP"): 
        {
            _text = format [localize "STR_notifiers_SUP_execute_QRFAirdrop", _sideName];
        };
        case ("QRFORBITAL"): 
        {
            _text = format [localize "STR_notifiers_SUP_execute_QRFOrbital", _sideName];
        };
        case ("TANK"):
        {
            _text = format [localize "STR_A3A_fn_support_showIntStpCll_TANK", _sideName];
        };
        case ("AIRSTRIKE"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_airstrike", _sideName];
        };
        case ("MORTAR"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_mortar", _sideName];
        };
        case ("HOWITZER"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_howitzer", _sideName];
        };
        case ("ARTILLERY"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_artillery", _sideName];
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_orbitalStrike", _sideName];
        };
        case ("CRUISEMISSILE"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_cruise_missile", _sideName];
        };
        case ("SAM"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_SAM", _sideName];
        };
        case ("CARPETBOMBS"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_carpeting", _sideName];
        };
        case ("ASF"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_ASF", _sideName];
        };
        case ("CAS"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_CAS", _sideName];
        };
        case ("CASDIVE"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_CAS", _sideName];
        };
        case ("GUNSHIP"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_gunship", _sideName];
        };
        case ("UAV"):
        {
            _text = format [localize "STR_notifiers_SUP_setup_UAV", _sideName];
        };
        default
        {
            _text = format [localize "STR_notifiers_SUP_setup_unknown", _sideName, _supportType];
        };
    };
};

// Randomise setup time less with higher reveal value
_setupTime = _setupTime * (_reveal + random (2 - 2*_reveal));
private _timeStr = if(_setupTime < 60) then { "&lt;1" } else { str round (_setupTime / 60) };

if(_reveal >= 0.8) then
{
    if(toupper _supportType in ["QRFLAND", "QRFAIR", "COUNTERATTACK", "MAJORATTACK", "QRFVEHAIRDROP", "TANK"]) then
    {
        _text = format [localize "STR_notifiers_SUP_QRF_setup_arrival", _text, _timeStr];
    }
    else
    {
        _text = format [localize "STR_notifiers_SUP_setup_generic_arrival", _text, _timeStr];
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
