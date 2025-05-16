#include "\a3\ui_f\hpp\definedikcodes.inc"
class CfgDefaultKeysPresets {
    class Arma2 {
        class Mappings {
            GVAR(battleMenu)[] = {DIK_Y};
            GVAR(artyMenu)[] = {0x2A130016}; //combo Left shift + U (no double tap)
            GVAR(infoBar)[] = {0x381300C7}; //combo Left alt + Home (no double tap)
            GVAR(earPlugs)[] = {DIK_END};
            GVAR(customHintDismiss)[] = {DIK_PGDN};
            GVAR(commanderRebelMenu)[] = {DIK_TAB};

            GVAR(buildingPlacerAbort)[] = {DIK_ESCAPE, DIK_Y};
            GVAR(buildingPlacerDelete)[] = {DIK_C};
            GVAR(buildingPlacerPlace)[] = {DIK_SPACE};
            GVAR(buildingPlacerRepair)[] = {DIK_T};
            GVAR(buildingPlacerRotateCCW)[] = {DIK_E};
            GVAR(buildingPlacerRotateCW)[] = {DIK_R};
            GVAR(buildingPlacerSnapToSurface)[] = {DIK_LALT};
            GVAR(buildingPlacerUnsafeMode)[] = {DIK_LSHIFT};
        };
    };
};