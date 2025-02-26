/*  Shows the intercepted radio message to the players

    Execution on: Server

    Scope: Internal

    Parameters:
        _reveal: NUMBER : 0-1, determines how much info will be revealed
        _position: POSITION : The position where the support is called to
        _side: SIDE : The side which called in the support
        _supportType: STRING : The type string of the support (not the support name)
        _markerType: NUMBER or OBJECT : Either the radius (for area attacks) or target object for the marker
        _markerLifeTime: NUMBER : Time in seconds for the marker to survive

    Returns:
        Nothing
*/
#include "..\..\script_component.hpp"
FIX_LINE_NUMBERS()

params ["_reveal", "_position", "_side", "_supportType", "_markerType", "_markerLifeTime"];

//Nothing will be revealed
if(_reveal <= 0.2) exitWith {};

private _text = "";
private _markerText = "";
private _sideName = if(_side == Occupants) then {FactionGet(occ,"name")} else {FactionGet(inv,"name")};
if (_reveal <= 0.5) then
{
    //Side and call is reveal
    _text = format [localize "STR_notifiers_SUP_execute_unknown", _sideName];
}
else
{
    switch (toUpperANSI _supportType) do
    {
        case ("QRFLAND"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_QRF", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_QRF_marker";
        };
        case ("QRFAIR"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_QRFAir", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_QRFAir_marker";
        };
        case ("QRFVEHAIRDROP"): 
        {
            _text = format [localize "STR_notifiers_SUP_setup_QRFVehAirdrop", _sideName];
        };
        case ("QRFORBITAL"): 
        {
            _text = format [localize "STR_notifiers_SUP_setup_QRFOrbital", _sideName];
        };
        case ("AIRSTRIKE"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_airstrike", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_airstrike_marker";
        };
        case ("ARTILLERY"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_artillery", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_artillery_marker";
        };
        case ("MORTAR"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_mortar", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_mortar_marker";
        };
        case ("HOWITZER"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_howitzer", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_howitzer_marker";
        };
        case ("ORBITALSTRIKE"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_orbitalStrike", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_orbitalStrike_marker";
        };
        case ("CRUISEMISSILE"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_cruise_missile", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_cruise_missile_marker";
        };
        case ("SAM"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_SAM", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_SAM_marker";
        };
        case ("CARPETBOMBS"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_carpet_bombing", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_carpet_bombing_marker";
        };
        case ("ASF"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_ASF", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_ASF_target";
        };
        case ("CAS"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_CAS", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_CAS_marker";
        };
        case ("CASDIVE"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_CAS", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_CAS_marker";
        };
        case ("GUNSHIP"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_gunship", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_gunship_marker";
        };
        case ("UAV"):
        {
            _text = format [localize "STR_notifiers_SUP_execute_UAV", _sideName];
            _markerText = localize "STR_notifiers_SUP_execute_UAV_marker";
        };
        default
        {
            _text = format [localize "STR_notifiers_SUP_execute_generic", _sideName, _supportType];
            _markerText = format [localize "STR_notifiers_SUP_execute_generic_marker", _supportType];
        };
    };

    if(_reveal < 0.8) exitWith {};

    _text = format ["%1. Target marked on map!", _text];
    private _targetMarker = format ["%1_target_%2", _supportType, A3A_supportMarkerCount];
    private _textMarker = format ["%1_text_%2", _supportType, A3A_supportMarkerCount];
    A3A_supportMarkerCount = A3A_supportMarkerCount + 1;

    if (_markerType isEqualType 0) then
    {
        createMarkerLocal [_targetMarker, _position];
        _targetMarker setMarkerShapeLocal "ELLIPSE";
        _targetMarker setMarkerBrushLocal "Grid";
        _targetMarker setMarkerSizeLocal [_markerType, _markerType];        // actually a radius
        _targetMarker setMarkerColorLocal (if(_side == Occupants) then { colorOccupants } else { colorInvaders });
        _targetMarker setMarkerAlpha 1;

        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_dot";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlpha 0.75;

        [_textMarker, _targetMarker, _markerLifeTime] spawn {
            params ["_textMarker", "_targetMarker", "_lifeTime"];
            sleep _lifeTime;
            deleteMarker _textMarker;
            deleteMarker _targetMarker;
        };
    }
    else
    {
        createMarkerLocal [_textMarker, _position];
        _textMarker setMarkerShapeLocal "ICON";
        _textMarker setMarkerTypeLocal "mil_objective";
        _textMarker setMarkerTextLocal _markerText;
        _textMarker setMarkerAlphaLocal 0.75;

        [_textMarker, _markerType, time + _markerlifeTime] spawn {
            params ["_marker", "_target", "_timeout"];
            while { time < _timeout and alive _target } do {
                _marker setMarkerPos getPos _target;
                sleep 5;
            };
            deleteMarker _marker;
        };
    };
};

//Broadcast message to nearby players
private _nearbyPlayers = allPlayers select {(_x distance2D _position) <= 2000};
if(count _nearbyPlayers > 0) then
{
    ["RadioIntercepted", [_text]] remoteExec ["BIS_fnc_showNotification",_nearbyPlayers];
};
