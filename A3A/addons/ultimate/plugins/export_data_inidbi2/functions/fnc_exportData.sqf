#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_export_data_inidbi2_fnc_exportData

Description:
    A generic handler to export the passed data to an inidbi database (.ini file) on disk using the inidbi2 extension.

Parameters:
    0: _dbName - the name of the database to store the data in <STRING>
    1: _dbData - the content to be saved in the database <HASHMAP>

Optional:
    None

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    jwoodruff40/Creep'nCrunch
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(exportData),_this);

if !assert(params[
    ["_dbName", nil, [""]],
    ["_dbData", nil, [createHashMap]]
]) exitWith {};

private _inidbi = ["new", _dbName] call OO_INIDBI;
if (!("exists" call _inidbi)) exitWith {
    Info_1("Failed to create or access inidbi database: %1",_dbName);
    false;
};

// TODO: save data to the database

true;
