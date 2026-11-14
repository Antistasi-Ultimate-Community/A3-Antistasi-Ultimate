#define CURRENT_Y GRID_Y(0)

class ListCategories: RscItemListBoxCategories {
	idc = IDC_COMBO_CATEGORY;
	x = QUOTE(GRID_X(0));
	y = QUOTE(GRID_Y(LIST_Y));
	w = QUOTE(GRID_X(38)); 
	h = QUOTE(GRID_Y(LIST_H));
	/* x = GRID_X(SPACE_W2);
	y = CURRENT_Y;
	w = GRID_X(COMBO_W);
	h = GRID_Y(BAR_H); */
	sizeEx = QUOTE(FONT(0.9));
	colorBackground[] = {0.1, 0.1, 0.1, 1};
};

class ItemCheckboxSort: RscItemCheckboxGreen {
	idc = IDC_LISTBOX_SORT;
	x = QUOTE(GRID_X(SPACE_W2 + COMBO_W + SPACE_W));
	y = QUOTE(CURRENT_Y);
	w = QUOTE(GRID_X(BAR_W));
	h = QUOTE(GRID_Y(BAR_H));
	onCheckedChanged = "['listbox', ['sort', _this]] call HALs_store_fnc_main;";
	sizeEx = QUOTE(FONT(1));
	color[] = {1, 1, 1, 0.7};
	colorActive[] = {1, 1, 1, 1};
	colorFocused[] = {1, 1, 1, 1};
	colorPressed[] = {1, 1, 1, 1};
	style = 48;
	colorHover[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1};
	colorDisabled[] = {1, 1, 1, 0.25};
	shadow = 2;
	tooltip = "Sorted ascending.";
	textureUnchecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	textureChecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
	textureFocusedUnchecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	textureFocusedChecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
	textureHoverUnchecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	textureHoverChecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
	texturePressedUnchecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	texturePressedChecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";
	textureDisabledUnchecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_up_ca.paa";
	textureDisabledChecked = "\a3\ui_f\data\gui\rsc\rscdisplaymultiplayer\arrow_down_ca.paa";	
};

class ItemCheckboxAvailable: RscItemCheckboxGreen {
	idc = IDC_CHECKBOX + 1;
	x = QUOTE(GRID_X(SPACE_W2 + COMBO_W + SPACE_W*2 + BAR_W));
	y = QUOTE(CURRENT_Y);
	w = QUOTE(GRID_X(BAR_W));
	h = QUOTE(GRID_Y(BAR_H));
	onCheckedChanged = "['listbox', ['update', []]] call HALs_store_fnc_main;";
	tooltip = "$STR_HALS_STORE_CHECKBOX_AVALIABLE";
};

class ItemCheckboxCompatible: RscItemCheckboxGreen {
	idc = IDC_CHECKBOX + 2;
	x = QUOTE(GRID_X(SPACE_W2 + COMBO_W + SPACE_W*3 + BAR_W*2));
	y = QUOTE(CURRENT_Y);
	w = QUOTE(GRID_X(BAR_W));
	h = QUOTE(GRID_Y(BAR_H));
	onCheckedChanged = "['listbox', ['update', []]] call HALs_store_fnc_main;";
	tooltip = "$STR_HALS_STORE_CHECKBOX_COMPATIBLE";
};

class ItemCheckboxSell: RscItemCheckboxGreen {
	idc = IDC_CHECKBOX + 3;
	x = QUOTE(GRID_X(SPACE_W2 + COMBO_W + SPACE_W*4 + BAR_W*3));
	y = QUOTE(CURRENT_Y);
	w = QUOTE(GRID_X(BAR_W));
	h = QUOTE(GRID_Y(BAR_H));
	onCheckedChanged = "['button', ['change', _this]] call HALs_store_fnc_main; ['listbox', ['update', []]] call HALs_store_fnc_main;";
	tooltip = "$STR_HALS_STORE_CHECKBOX_SELLFILTER";
};

class ItemListbox: RscItemListBox {
	idc = IDC_LISTBOX;
	x = QUOTE(GRID_X(STORE_W/4.16));
	y = QUOTE(GRID_Y(LIST_Y));
	w = QUOTE(GRID_X(67.6));
	h = QUOTE(GRID_Y(LIST_H));
	sizeEx = QUOTE(FONT(0.8));
	font = "PuristaMedium";
	colorTextRight[] = {0.666667, 1, 0.666667, 1};
	colorSelectRight[] = {0.666667, 1, 0.666667, 1};
	colorSelect[] = {1, 0.7, 0.09, 1};
	colorSelectBackground[] = {1, 1, 1, 0.2};
	colorSelectBackground2[] = {1, 1, 1, 0.2};
};
