// SERVER: how long a smuggling run gets for a straight-line distance:
// 15 minutes to get going plus 5 per km (roads wind, patrols get avoided).
// [metres] -> seconds
params [["_m", 0, [0]]];
round (60 * (15 + 5 * ((_m max 0) / 1000)))
