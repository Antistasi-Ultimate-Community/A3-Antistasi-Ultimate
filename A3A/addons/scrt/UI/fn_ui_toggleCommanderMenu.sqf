if (isMenuOpen) then {
    closeDialog 0;
    closeDialog 0;
    isMenuOpen = false;
} else {
    if(player isEqualTo theBoss) then {
        closeDialog 0;
        closeDialog 0;
        createDialog "commanderMenu";
        [] call SCRT_fnc_ui_populateCommanderMenu;
        isMenuOpen = true;
        if (isNull objectParent player) then {
            [] spawn SCRT_fnc_misc_orbitingCamera;
        } else {
            [] spawn SCRT_fnc_misc_followCamera;
        };
    } else {
        closeDialog 0;
        closeDialog 0;
        createDialog "rebelMenu";
        [] call SCRT_fnc_ui_populateRebelMenu;
        isMenuOpen = true;
        if (isNull objectParent player) then {
            [] spawn SCRT_fnc_misc_orbitingCamera;
        } else {
            [] spawn SCRT_fnc_misc_followCamera;
        };
    }
};
