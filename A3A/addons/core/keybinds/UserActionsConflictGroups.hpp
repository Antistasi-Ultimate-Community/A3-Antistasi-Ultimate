class UserActionsConflictsGroups {
    class ActionGroups {
        PREFIX[] = {
            QGVAR(battleMenu),
            QGVAR(artyMenu),
            QGVAR(infoBar),
            QGVAR(earPlugs),
            QGVAR(customHintDismiss),
            QGVAR(commanderRebelMenu),
            GVAR(buildingPlacerAbort),
            GVAR(buildingPlacerDelete),
            GVAR(buildingPlacerPlace),
            GVAR(buildingPlacerRotateCCW),
            GVAR(buildingPlacerRotateCW),
            GVAR(buildingPlacerSnapToSurface),
            GVAR(buildingPlacerUnsafeMode)
        };
    };

    class CollisionGroups {
        ADDON[] = {QUOTE(PREFIX)};
    };
};
