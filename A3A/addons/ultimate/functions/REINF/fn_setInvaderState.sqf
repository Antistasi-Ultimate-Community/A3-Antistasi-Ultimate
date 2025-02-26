params [
    ["_state", ""]
];

if !(isServer) exitWith {false};

private _text = "";

switch (_state) do
{
    case "defeated": 
    {
        "CSAT_carrier" setMarkerAlpha 0;
        areInvadersDefeated = true;
    };
    case "emergence": 
    {
        "CSAT_carrier" setMarkerAlpha 1;
        areInvadersDefeated = false;

        _text = format [
            localize "STR_comms_mp_faction_return",
            "#800000", 
            A3A_faction_inv get "name",
            ([] call SCRT_fnc_misc_getWorldName)
        ];

        A3A_resourcesAttackInv = 500;
        A3A_resourcesDefenceInv = 500;
    };
};

publicVariable "areInvadersDefeated";

[petros, "announce", _text] remoteExec ["A3A_fnc_commsMP", 0];