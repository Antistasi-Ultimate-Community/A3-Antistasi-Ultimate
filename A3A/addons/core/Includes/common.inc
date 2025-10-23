//includes commonly included files to clean up includes in other files
//Line number fix
#define FIX_LINE_NUMBERS2(sharp) sharp##line __LINE__ __FILE__
#define FIX_LINE_NUMBERS() FIX_LINE_NUMBERS2(#)

#include "LogMacros.inc"

#define TIERED_ARRAY [[], [], []]

//Template macros
#define Faction(SIDE) (switch SIDE do {case west:{A3A_faction_occ}; case east:{A3A_faction_inv}; case resistance:{A3A_faction_reb}; case civilian:{A3A_faction_civ}; case opfor:{A3A_faction_riv}; default {Error_1("Bad side passed passed to Faction(side), Side: %1", SIDE); createHashMap};})
#define FactionGet(FAC, VAR) (A3A_faction_##FAC get VAR)
#define FactionGetOrDefault(FAC, VAR, DEF) (A3A_faction_##FAC getOrDefault [VAR, DEF])

//Tiered vehicle macros
#define FactionGetTiered(FACVAR, VEHVAR) ((FACVAR get VEHVAR) select (switch true do {case (tierWar < 5):{0}; case (tierWar < 8 && {tierWar > 4}):{1}; case (tierWar > 7):{2};}))
#define FactionGetTieredFT(FACVAR, VEHVAR, TIER) ((FACVAR get VEHVAR) select TIER)
#define FactionGoDTiered(FACVAR, VEHVAR) ((FACVAR getOrDefault [VEHVAR, TIERED_ARRAY]) select (switch true do {case (tierWar < 5):{0}; case (tierWar < 8 && {tierWar > 4}):{1}; case (tierWar > 7):{2};}))
#define FactionGoDTieredFT(FACVAR, VEHVAR, TIER) ((FACVAR getOrDefault [VEHVAR, TIERED_ARRAY]) select TIER)

//Tiered vehicle convenience (readability) macros
#define FactionGetMilitia(FACVAR, VEHVAR) FactionGetTieredFT(FACVAR, VEHVAR, 0)
#define FactionGetCivil(FACVAR, VEHVAR) FactionGetTieredFT(FACVAR, VEHVAR, 0)
#define FactionGetRival(FACVAR, VEHVAR) FactionGetTieredFT(FACVAR, VEHVAR, 0)
#define FactionGetRebel(FACVAR, VEHCAR) FactionGetTieredFT(FACVAR, VEHVAR, 0)
#define FactionGoDMilitia(FACVAR, VEHVAR) FactionGoDTieredFT(FACVAR, VEHVAR, 0)
#define FactionGoDCivil(FACVAR, VEHVAR) FactionGoDTieredFT(FACVAR, VEHVAR, 0)
#define FactionGoDRival(FACVAR, VEHVAR) FactionGoDTieredFT(FACVAR, VEHVAR, 0)
#define FactionGoDRebel(FACVAR, VEHCAR) FactionGoDTieredFT(FACVAR, VEHVAR, 0)


#define GetTiered(FACVAR, UNITVAR) ((FACVAR get UNITVAR) select (switch true do {case (tierWar < 5):{0}; case (tierWar < 8 && {tierWar > 4}):{1}; case (tierWar > 7):{2};}))

/// Feature Toggles ///
// Force new experimental UI.
// #define UseDoomGUI
// Enable completed sections of experimental UI.
#define UseDoomGUIPreview
