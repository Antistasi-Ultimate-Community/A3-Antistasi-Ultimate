/*
    Function: A3U_fnc_fillMapAnomalies

    Description:
        Fills the map with anomalies, based off of map size and cba setting

    Parameter:
        N/A

    Returns:
        N/A

    Author:
        Silence
*/

private _size = worldSize;

private _anomalyAmount = (_size / (missionNamespace getVariable ["A3U_setting_anomalyAmount", 200])) * 2; // generally better to have more because we don't know where they will be placed

[_anomalyAmount] call A3U_fnc_createAnomalyField;