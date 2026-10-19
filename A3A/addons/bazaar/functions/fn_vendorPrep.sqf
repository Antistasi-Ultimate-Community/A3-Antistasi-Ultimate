// Where the trader unit is LOCAL: (re)apply everything that keeps him a
// harmless stall-keeper. disableAI and setCaptive only stick on the owning
// machine, and disableAI is lost if the unit ever changes owner - so this
// runs at spawn and again whenever the server gets him back (see the
// "Local" handler in fn_vendorSpawn).
params [["_u", objNull, [objNull]]];
if (isNull _u || {!local _u} || {!alive _u}) exitWith {};
_u setCaptive true;
{ _u disableAI _x } forEach ["MOVE", "AUTOTARGET", "TARGET", "AUTOCOMBAT", "FSM"];
_u setBehaviour "CARELESS";
_u allowFleeing 0;
_u setUnitPos "UP";
