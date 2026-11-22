/*
 * idc = IDC_GROUP_TRADER;
 * x = TRADER_X;
 * y = TRADER_Y;
 * w = GRID_X(TRADER_W);
 * h = GRID_Y(TRADER_H);
*/

class ContainerCombo: RscItemComboBox {
    idc = IDC_BUY_ITEM_COMBO;
	
    x = 0;
    y = 0;
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(BAR_H));
    sizeEx = QUOTE(FONT(1));
	
    colorBackground[] = {0.1, 0.1, 0.1, 1};
};

class ContainerPictureBackground: RscItemText {
    idc = -1;
	
    x = 0;
    y = QUOTE(GRID_Y(BAR_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(TRADER_PIC_H - BAR_H));
	
    colorBackground[] = {0, 0, 0, 0.4};
};

class ContainerPicture: RscItemCtrlStaticPictureKeepAspect {
    idc = IDC_BUY_PICTURE;
	
    x = 0;
    y = QUOTE(GRID_Y(BAR_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(TRADER_PIC_H - BAR_H));
	
    colorBackground[] = {0, 0, 0, 0.7};
};

class ContainerLoadBackground: RscItemText {
    idc = -1;
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H - SPACE_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(SPACE_H));
	
    colorBackground[] = {0.05, 0.05, 0.05, 0.7};
};

class ContainerLoadNew: RscItemProgress {
    idc = IDC_PROGRESS_NEWLOAD;
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H - SPACE_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(SPACE_H));
	
    colorBar[] = {0.9, 0, 0, 0.6};
    colorExtBar[] = {1, 1, 1, 0};
    colorFrame[] = {0, 0, 0, 0};
};

class ContainerLoadPrev: RscItemProgress {
    idc = IDC_PROGRESS_LOAD;
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H - SPACE_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(SPACE_H));
	
    colorBar[] = {0.9, 0.9, 0.9, 0.9};
    colorExtBar[] = {1, 1, 1, 0};
    colorFrame[] = {0, 0, 0, 0};
};

class PurchaseSummary: RscItemStructuredText {
    idc = IDC_ITEM;
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H + SPACE_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(BAR_H));

    colorBackground[] = {0, 0, 0, 0.7};
	size = QUOTE(FONT(0.9));

	class Attributes {
		align = "right";
		color = "#ffffff";
		shadow = 1;
		font = "PuristaMedium";
    };

};

class PurchaseCheckbox: RscItemCheckboxGreen {
    idc = IDC_CHECKBOX_BUY;
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H + SPACE_H + BAR_H));
    w = QUOTE(GRID_X(BAR_W));
    h = QUOTE(GRID_Y(BAR_H));
	
    tooltip = "$STR_HALS_STORE_CHECKBOX_EQUIP";
	onCheckedChanged = "['button', ['enabled', []]] call HALs_store_fnc_main;";
    colorBackground[] = {0, 0, 0, 0.7};
    colorBackgroundHover[] = {0, 0, 0, 0.7};
    colorBackgroundFocused[] = {0, 0, 0, 0.7};
    colorBackgroundPressed[] = {0, 0, 0, 0.7};
};

class PurchaseAmountEdit: RscItemEdit {
    idc = IDC_EDIT;
	style = "16 + 512 + 0x01";
	
    x = 0;
    y = QUOTE(GRID_Y(TRADER_PIC_H + SPACE_H + BAR_H));
    w = QUOTE(GRID_X(TRADER_W));
    h = QUOTE(GRID_Y(BAR_H));
	
	tooltip = "Number of Items.";
    sizeEx = QUOTE(FONT(0.9));
	shadow = 2;
	
    maxChars = 4;
    colorBackground[] = {0, 0, 0, 0.7};
    colorText[] = {1, 1, 1, 1};
};

class PurchaseButton: RscItemButtonAction {
    idc = IDC_BUTTON_BUY;
	
    x = QUOTE(GRID_X(BAR_W + SPACE_W));
    y = QUOTE(GRID_Y(TRADER_PIC_H + SPACE_H + BAR_H));
    w = QUOTE(GRID_X(TRADER_W - BAR_W - SPACE_W));
    h = QUOTE(GRID_Y(BAR_H));
	
    text = "$STR_HALS_STORE_BUTTON_PURCHASE";
    action = " ['button', ['pressed', []]] call HALs_store_fnc_main;";
	sizeEx = QUOTE(FONT(1));
};
