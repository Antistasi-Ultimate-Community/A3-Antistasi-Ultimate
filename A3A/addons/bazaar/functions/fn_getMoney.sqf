// Returns the unit's Antistasi personal money, or -1 if no Antistasi
// money system is present (the Bazaar then trades for free).
params [["_unit", player, [objNull]]];

if (isNull _unit) exitWith { -1 };
if (isNil { _unit getVariable "moneyX" }) exitWith { -1 };
_unit getVariable ["moneyX", 0]
