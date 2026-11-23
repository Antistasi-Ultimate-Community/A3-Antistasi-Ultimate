params ["_mode"];

switch (_mode) do {
    case ("on"): {
        if (isNil "dialog_blur_gui_blur") then {
			dialog_blur = ppEffectCreate ["DynamicBlur", 999];
			dialog_blur ppEffectEnable true;
		};

        dialog_blur ppEffectAdjust [8];
		dialog_blur ppEffectCommit 0.2;
    };
    case ("off"): {
        dialog_blur ppEffectAdjust [0];
		dialog_blur ppEffectCommit 0.3;
    };
};
