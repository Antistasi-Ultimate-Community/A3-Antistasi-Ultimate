#include "..\script_component.hpp"
/* ----------------------------------------------------------------------------
Function: A3A_ultimate_export_data_pythia_fnc_exportData

Description:
    A generic handler to export the passed data to a file on disk using the Pythia extension.

Parameters:
    0: _fileName - name of the file without extension <STRING>
    1: _fileContent - the content to be written to the file <STRING>
    2: _fileType - the type/extension of the file <STRING>

Optional:

Returns:
    Nothing

Environment:
    Server, Unscheduled

Author:
    jwoodruff40/Creep'nCrunch
---------------------------------------------------------------------------- */
TRACE_1(QFUNC(exportData),_this);

if !assert(params[
    ["_fileName", nil, [""]],
    ["_fileContent", nil, [""]],
    ["_fileType", nil, [""]]
]) exitWith {};

["py3u.filesys.write_data", [_fileName, _fileContent, _fileType]] call py3_fnc_callExtension;
