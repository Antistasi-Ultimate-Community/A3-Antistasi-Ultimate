/*
    Function: A3U_fnc_popup

    Description:
        Makes a popup for the player with given text, with a confirm button

    Parameter:
        _message <STRING>
        _header  <STRING> <DEFAULT: "Information">

    Returns:
        N/A

    Author:
        Silence
*/

params ["_message", ["_header", "Information"]];

[_message, _header, true, false] spawn BIS_fnc_guiMessage;
