["attributesVehicles", [
    // Transport helis
    ["OPTRE_UNSC_falcon", ["cost", 200]],
    ["OPTRE_UNSC_falcon_S", ["cost", 300]],
    //["OPTRE_Pelican_unarmed", ["cost", 300]], it's an unarmed varint, why would you even adjust the cost?
    ///should probably add other vehicles before merge
    // Attack helis
    ["OPTRE_UNSC_hornet", ["cost", 400]],
    ["OPTRE_AV22C_Sparrowhawk", ["cost", 500]]
]] call _fnc_saveToTemplate;