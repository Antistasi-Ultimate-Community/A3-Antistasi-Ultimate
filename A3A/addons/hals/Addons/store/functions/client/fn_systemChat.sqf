/*
	Function: HALs_store_fnc_systemChat
	Author: HallyG
	Displays systemChat message on client.

	Argument(s):
	0: Message to display <STRING>
	1: Sound to play <STRING>, optional

	Return Value:
	None

	Example:
	["HI", "FD_CP_NOT_CLEAR_F"] call HALs_store_fnc_systemChat;
__________________________________________________________________*/
params [
	["_message", "", [[], ""]],
	["_sound", "", [""]]
];

if (count _sound > 0 && {isClass (configFile >> "CfgSounds" >> _sound)}) then {
	playSound _sound;
};

if (_message isEqualType []) then {
	_message = format _message;
};

systemChat _message;
