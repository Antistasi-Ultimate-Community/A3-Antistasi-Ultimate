_dlcUniforms append [
    "U_C_FirefighterFatigues_RF",
    "U_C_FirefighterFatigues_RolledUp_RF",
    "U_C_HeliPilotCoveralls_Yellow_RF",
    "U_C_HeliPilotCoveralls_Green_RF",
    "U_C_HeliPilotCoveralls_Rescue_RF",
    "U_C_HeliPilotCoveralls_Blue_RF",
    "U_C_HeliPilotCoveralls_Black_RF"
];
private _RFleatherJackets = [
    "U_C_PilotJacket_black_RF",
    "U_C_PilotJacket_brown_RF",
    "U_C_PilotJacket_lbrown_RF",
    "U_C_PilotJacket_open_black_RF",
    "U_C_PilotJacket_open_brown_RF",
    "U_C_PilotJacket_open_lbrown_RF"
];
_dlcUniforms append _RFleatherJackets;
if (A3A_climate in ["temperate","arctic"]) then {
    _civUniforms append _RFleatherJackets;
};

_dlchats append [
    "H_Cap_marshal_blue_RF"
  ];
  _workerHelmets append [
    "H_Cap_marshal_blue_RF",
    "H_Helmet_HardHat_White_RF",
    "H_Helmet_HardHat_Yellow_RF",
    "H_Helmet_HardHat_Green_RF",
    "H_Helmet_HardHat_Red_RF",
    "H_Helmet_HardHat_Orange_RF",
    "H_Helmet_HardHat_Blue_RF",
    "H_Helmet_HardHat_Black_RF"
];