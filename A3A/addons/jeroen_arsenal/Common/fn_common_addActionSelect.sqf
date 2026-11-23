#include "defineCommon.inc"

#define UPDATEINTERVAL 0.1
#define REMOVEAFTER 10
#define TEXTGOOD "'#FFA500'"
#define TEXTBAD "'#808080'"


params ["_script","_conditionActive","_conditionColor","_object",["_showCursorObject",true],["_timer",REMOVEAFTER],["_removeScript",{}]];

//remove previous action if existing
private _id = player getVariable "jn_selectAction_id";
if(!isNil "_id")then{
	player removeAction _id;
	player setVariable ["jn_selectAction_id",nil];
};

//removes previous remove after .. timer
private _handle = player getVariable "jn_selectAction_handle";
if(!isNil "_handle")then{
	terminate _handle;
};

player setVariable ["jn_selectAction_object", _object];

//add select action
_id = player addAction [
	"aaa",
	{
		(_this select 3) params ["_object","_script","_removeScript"];

		private _id = _this select 2;
		player removeAction _id;
		player setVariable ["jn_selectAction_id",nil];
		terminate (player getVariable "jn_selectAction_handle");//remove timer
		
		_object call _removeScript;
		
		if(isNil "_object")exitWith{hint localize "STR_JNC_ACT_SELECT_NO_OBJECT"};
		hint ""; //remove select hint if it was still there
		
		_object call _script;
		
	},
	[_object,_script,_removeScript],
	7, 
	true,
	false,
	"",
	format ["if([player getVariable 'jn_selectAction_object'] call %1)then{
		private _color = [player getVariable 'jn_selectAction_object'] call %2;
		private _colorCode = [%4,%3] select _color;
		private _text = '<t color=' + _colorCode + '>' + %5;
		if(%6 && _color)then{_text = _text + ' (' + getText(configOf cursorObject >>'displayName') + ')'};
		player setUserActionText [(player getVariable ['jn_selectAction_id',-1]), _text];
		true
	}",_conditionActive,_conditionColor,str TEXTGOOD,str TEXTBAD,str localize 'STR_JNC_ACT_SELECT',_showCursorObject]

];

player setVariable ["jn_selectAction_id",_id];


//remove timer
_handle = [_id,_timer,_removeScript,_object] spawn {
	params["_id","_timer","_removeScript","_object"];
	sleep _timer;
	player removeAction _id;
	player setVariable ["jn_selectAction_id",nil];
	_object call _removeScript;
	hint "";
};

player setVariable ["jn_selectAction_handle",_handle];

hint localize "STR_JNC_ACT_SELECT_HINT";
