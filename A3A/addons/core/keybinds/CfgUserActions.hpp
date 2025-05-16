#include "..\functions\Builder\placerDefines.hpp"
#define ACTIONINTERNAL(type) "["##type##", _this] call A3A_fnc_keyActions"
#define ACTION(type) ACTIONINTERNAL(QGVAR(type))
class CfgUserActions {
    class GVAR(battleMenu) {
        displayName = $STR_A3A_keyActions_battleMenu_title;
        tooltip = $STR_A3A_keyActions_battleMenu_desc;
        onActivate = ACTION(battleMenu);
    };

    class GVAR(artyMenu) {
        displayName = $STR_A3A_keyActions_artyMenu_title;
        tooltip = $STR_A3A_keyActions_artyMenu_desc;
        onActivate = ACTION(artyMenu);
    };

    class GVAR(infoBar) {
        displayName = $STR_A3A_keyActions_infoBar_title;
        tooltip = $STR_A3A_keyActions_infoBar_desc;
        onActivate = ACTION(infoBar);
    };

    class GVAR(earPlugs) {
        displayName = $STR_A3A_keyActions_earPlugs_title;
        tooltip = $STR_A3A_keyActions_earPlugs_desc;
        onActivate = ACTION(earPlugs);
    };

    class GVAR(customHintDismiss) {
        displayName = $STR_A3A_keyActions_customHintDismiss_title;
        tooltip = $STR_A3A_keyActions_customHintDismiss_desc;
        onActivate = ACTION(customHintDismiss);
    };

    class GVAR(commanderRebelMenu) {
        displayName = $STR_A3A_keyActions_commMenu_title;
        tooltip = $STR_A3A_keyActions_commMenu_desc;
        onActivate = ACTION(commanderRebelMenu);
    };

    class GVAR(buildingPlacerAbort) {
        displayName = $STR_A3A_keyActions_buildingPlacerAbort_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerAbort_desc;
    };

    class GVAR(buildingPlacerDelete) {
        displayName = $STR_A3A_keyActions_buildingPlacerDelete_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerDelete_desc;
    };

    class GVAR(buildingPlacerPlace) {
        displayName = $STR_A3A_keyActions_buildingPlacerPlace_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerPlace_desc;
    };

    class GVAR(buildingPlacerRepair) {
        displayName = $STR_A3A_keyActions_buildingPlacerRepair_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerRepair_desc;
    };

    class GVAR(buildingPlacerRotateCCW) {
        displayName = $STR_A3A_keyActions_buildingPlacerRotateCCW_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerRotateCCW_desc;
    };

    class GVAR(buildingPlacerRotateCW) {
        displayName = $STR_A3A_keyActions_buildingPlacerRotateCW_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerRotateCW_desc;
    };

    class GVAR(buildingPlacerSnapToSurface) {
        displayName = $STR_A3A_keyActions_buildingPlacerSnapToSurface_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerSnapToSurface_desc;
    };

    class GVAR(buildingPlacerUnsafeMode) {
        displayName = $STR_A3A_keyActions_buildingPlacerUnsafeMode_title;
        tooltip = $STR_A3A_keyActions_buildingPlacerUnsafeMode_desc;
    };
};
#undef ACTION
