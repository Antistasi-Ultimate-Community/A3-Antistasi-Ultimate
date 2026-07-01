/*
Author: dambaev

Description:
  Walks deeply through task's title and description in order to localize and format nested 
  arrays like [ "STR_A3A_Missions_AS_Convoy_task_dest_supplies",[ "STR_localizar_riverport",_city],_displayTime,_nameDest,FactionGet(reb,"name")]

Arguments:
  _taskId - task id used for BIS_fnc_taskCreate
  _description - array of task's description used for BIS_fnc_taskCreate
Return Value: <nil>
Scope: Client
Environment: Scheduled
Public: No
Dependencies:
  BIS_fnc_taskSetDescription

Example:
  private _nameDest = [_mrkDest] call A3A_fnc_localizar;
  private _nameOrigin = [_mrkOrigin] call A3A_fnc_localizar;
  private _startDate = numberToDate [date select 0, _startDateNum];
  private _displayTime = [_startDate] call A3A_fnc_dateToTimeString;
  _textX = [ "STR_A3A_Missions_AS_Convoy_task_dest_supplies",_nameOrigin,_displayTime,_nameDest,FactionGet(reb,"name")];
  _taskTitle = [ "STR_A3A_Missions_AS_Convoy_task_header_supplies"];
  private _taskId = "CONVOY" + str A3A_taskCount;
  [_taskId, "CONVOY", "CREATED"] remoteExecCall ["A3A_fnc_taskUpdate", 2];

  [ _taskId,
    [_textX,_taskTitle,_mrkDest]] remoteExec [ "A3A_fnc_localize_format_taskSetDescription", 0];

*/


if( isServer || !hasInterface) exitWith {};

params ["_taskId", "_description"];

_description params [ "_textRaw", "_taskTitleRaw", "_mrkDest"];

_recursive_localize_format = {
  params [ "_arr"];
  private _ret = [];
  {
    _localized = _x;
    switch (true) do
    {
      case (_localized isEqualType []):
      {
        _localized = [_x] call _recursive_localize_format;
      };
      case (_localized isEqualType "string"):
      {
        switch(true) do
        {
          case( (_x select [0,9]) == "STR_CITY_"):
          {
            _x_sz = count _x;
            _marker = _x select [ 9, _x_sz - 9];
            _localized = text (nearestLocation [getMarkerPos _marker, [
                "Name",
                "NameCity",
                "NameCityCapital",
                "NameMarine",
                "NameVillage"
              ]]);
          };
          case( (_x select [0,4]) == "STR_"):
          {
            _localized = localize _x;
          };
        };
      };
    };
    _ret pushBack _localized;
  } forEach( _arr);
  format _ret;
};

_textX = _textRaw;
if( _textRaw isEqualType []) then {
  _textX = [_textRaw] call _recursive_localize_format;
};

_taskTitle = _taskTitleRaw;
if( _taskTitleRaw isEqualType []) then {
  _taskTitle = [_taskTitleRaw] call _recursive_localize_format;
};


[ _taskId,
  [_textX,_taskTitle,_mrkDest]
  ] call BIS_fnc_taskSetDescription;

