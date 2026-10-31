// Is this position (or object) "at base" for unpacking a crate?
// Antistasi: within 60m of the HQ marker or 30m of the arsenal box.
// Outside Antistasi there is no base, so anywhere counts.
params [["_pos", [0,0,0], [[], objNull]]];

[_pos, "Synd_HQ"] call A3A_fnc_isWithinMarkerArea;
