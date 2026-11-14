#include "defineCommon.inc"


params ["_object",["_script",{}]];

private _actionId = _object addAction [
	"place holder",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];
		private _script = _arguments;
		
		_target removeAction _actionId;
		_target setVariable ["jn_cancelAction_id",nil];
		
		call _script;
	},
	_script,
	7, 
	true,
	false,
	"",
	"alive _target"

];

_object setVariable ["jn_cancelAction_id",_actionId];

[player,""] call JN_fnc_common_updateActionCancel;
