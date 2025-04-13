class UserActionsConflictsGroups {
    class ActionGroups {
        PREFIX[] = {
            QGVAR(battleMenu),
            QGVAR(artyMenu),
            QGVAR(infoBar),
            QGVAR(earPlugs),
            QGVAR(customHintDismiss),
            QGVAR(commanderRebelMenu),
            GVAR(buildingPlacerRotateCCW),
            GVAR(buildingPlacerRotateCW)
        };
    };

    class CollisionGroups {
        ADDON[] = {QUOTE(PREFIX)};
    };
};
