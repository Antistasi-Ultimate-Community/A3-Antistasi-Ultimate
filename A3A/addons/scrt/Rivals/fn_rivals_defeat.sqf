/*
Maintainer: Socrates
    Defeats rivals and turn offs their activites.


Return Value:
    <NIL>

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <ARRAY> inactivityStackRivals
    <BOOL> areRivalsDefeated
	<BOOL> areRivalsDiscovered

Example:
[] remoteExecCall ["SCRT_fnc_rivals_defeat", 2];
*/

//clearing activity stack and filling it with last update that should zeroify their activity, it will never decay as activity loop stops working
inactivityStackRivals = [];
[100, (100/baseRivalsDecay), true] call SCRT_fnc_rivals_reduceActivity;

//separate variable so event and task loops can be escaped
areRivalsDefeated = true;
publicVariable "areRivalsDefeated";

//just in case
areRivalsDiscovered = false;
publicVariable "areRivalsDiscovered";

[] spawn A3A_fnc_statistics;

private _text = format [
    localize "STR_rivals_destroyed_finale", 
    A3A_faction_riv get "name",
    ([] call SCRT_fnc_misc_getWorldName),
    A3A_faction_reb get "name"
];
[petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];
