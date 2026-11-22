// Returns the persistence key suffix.
// When Antistasi Ultimate is running, A3A_saveTarget carries the unique
// campaignID of the loaded save slot - keying on it gives true per-save
// persistence (several campaigns on one map stay separate).
// Fallback: map name only (also used outside Antistasi).
private _suffix = worldName;

if (!isNil "A3A_saveTarget") then {
	(missionNamespace getVariable ["A3A_saveTarget", []]) params ["", ["_campaignID", ""]];
	if (_campaignID isEqualType "" && {_campaignID != ""}) then {
		_suffix = format ["%1_%2", worldName, _campaignID];
	};
};

_suffix
