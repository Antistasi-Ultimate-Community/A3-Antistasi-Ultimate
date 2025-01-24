_unarmedVehicles append ["B_T_Pickup_rf","B_T_Pickup_Comms_rf"];
_armedVehicles pushBack "B_T_Pickup_mmg_rf";
_militiaLightArmed pushBack "B_T_Pickup_hmg_rf";
_militiaCars append ["B_T_Pickup_rf","B_T_Pickup_Comms_rf"];
_aa pushBack "B_T_Pickup_aat_rf";
_uavsPortable pushBack "B_UAV_RC40_SENSOR_RF";
_howitzers pushBack "B_T_TwinMortar_RF";

if !(isNil "_policeVehs") then {
    _policeVehs append ["a3a_police_Pickup_rf", "B_GEN_Pickup_covered_rf", "a3a_police_Pickup_comms_rf"];
};

_helisLight pushBack "B_Heli_light_03_unarmed_RF";
_transportHelicopters append ["I_Heli_EC_01A_military_RF","B_Heli_EC_04_military_RF"];
_helisLightAttack append ["a3a_Heli_light_03_dynamicLoadout_RF","a3a_black_Heli_light_03_dynamicLoadout_RF","B_Heli_EC_03_RF"];
_helisAttack pushBack "a3a_black_Heli_EC_02_RF";

_airPatrol append ["B_Heli_light_03_unarmed_RF","a3a_Heli_light_03_dynamicLoadout_RF","a3a_black_Heli_light_03_dynamicLoadout_RF","B_Heli_EC_03_RF"];