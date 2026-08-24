/*
    Function: A3U_fnc_emission

    Description:
        Starts random emissions, grabs values from cba settings

    Parameter:
        N/A

    Returns:
        N/A

    Author:
        Silence
*/
#include "..\..\script_component.hpp"

private _emissionMin = missionNamespace getVariable ["A3U_setting_emissionMinimum",45];
private _emissionMax = missionNamespace getVariable ["A3U_setting_emissionMaximum",60];

private _emissionSpeedMin = missionNamespace getVariable ["A3U_setting_emissionSpeedMinimum",125];
private _emissionSpeedMax = missionNamespace getVariable ["A3U_setting_emissionSpeedMaximum",125];

[_emissionMin, _emissionMax, _emissionSpeedMin, _emissionSpeedMax, true] spawn tts_emission_fnc_startRandomEmissions;

//["Emission Notification", "An emission storm has been detected.<br/><br/>Seek shelter immediately.<br/><br/>Vehicles protect you just as well as buildings.", true] remoteExec ["A3A_fnc_customHint", 0, false];
// ^ We can't hook onto the emission function, so that won't work

Info_4("Started Emissions with params: [%1, %2, %3, %4]", _emissionMin, _emissionMax, _emissionSpeedMin, _emissionSpeedMax);