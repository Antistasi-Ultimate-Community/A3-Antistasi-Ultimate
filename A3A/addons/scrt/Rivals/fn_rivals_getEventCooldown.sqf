/*
Maintainer: Socrates
    Returns rivals event cooldown depending on current balance scale/players.

Return Value:
    <NUMBER> radius

Scope: Server
Environment: Any
Public: Yes
Dependencies:
    <NUMBER> A3A_balancePlayerScale
    <NUMBER> inactivityLevelRivals

Example:
[] call SCRT_fnc_rivals_getEventCooldown;
*/

1600 - (200 * ((5-inactivityLevelRivals) ^ (0.6 + (rivalsDifficulty/10))) + 1 / 4)
