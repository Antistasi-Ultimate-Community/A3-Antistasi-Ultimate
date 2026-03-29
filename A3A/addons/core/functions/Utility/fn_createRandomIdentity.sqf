/*
Creates random identity for the unit including face, voice and name. 
This identity may be passed to A3A_fnc_createUnit.

Arguments:
    <HASHMAP> _faction - unit faction.
    <STRING> _unitType - unit type.

Return value:
    <HASHMAP> random identity, containing the following keys with string values:
        - "face"
        - "speaker"
        - "firstName"
        - "lastName"

Scope: Any
Environment: Any
Public: Yes

Example:
    private _identity = [A3A_faction_reb, "Rifleman"] call A3A_fnc_createRandomIdentity;
*/

params ["_faction", "_unitType"];

private _typePrefix = switch (true) do {
    case ("riv_" in _unitType): { "riv" };
    case ("police" in _unitType): { "pol" };
    case ("militia_" in _unitType): { "mil" };
    case ("military_" in _unitType): { "military" };
    case ("elite_" in _unitType): { "elite" };
    case ("SF" in _unitType): { "sf" };
    default { "" }; // should perhaps add other_ to set identity of traitors and unarmed to rebel by default
};

private _faceKey = _typePrefix + (if (_typePrefix == "") then { "faces" } else { "Faces" });
private _faces = _faction getOrDefault [_faceKey, _faction getOrDefault ["faces", []]];

private _identity = createHashMap;
_identity set ["face", selectRandom _faces];

private _voiceKey = _typePrefix + (if (_typePrefix == "") then { "voices" } else { "Voices" });
private _voices = _faction getOrDefault [_voiceKey, _faction getOrDefault ["voices", []]];
_identity set ["speaker", selectRandom _voices];

_identity set ["firstName", selectRandom (_faction getOrDefault ["firstNames", []])];
_identity set ["lastName", selectRandom (_faction getOrDefault ["lastNames", []])];
//diag_log "called createRandomIdentity";
//diag_log _identity;
_identity;