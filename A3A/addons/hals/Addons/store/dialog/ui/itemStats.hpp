/*
 * idc = IDC_GROUP_SELECTED;
 * x = DIALOG_X + GRID_X(ITEM_X);
 * y = DIALOG_Y + GRID_Y(ITEM_Y);
 * w = GRID_X(STORE_W);
 * h = GRID_Y(STORE_H);
*/

class ItemPictureBackground: RscItemText {
	x = 0.014;
	y = 0;
	w = QUOTE(GRID_X(ITEM_W));
	h = QUOTE(GRID_Y(PIC_H));

	colorBackground[] = {1, 1, 1, 0.2};
};

class ItemPicture: RscItemCtrlStaticPictureKeepAspect {
	idc = IDC_ITEM_PICTURE;
		
	x = 0.014;
	y = 0;
	w = QUOTE(GRID_X(ITEM_W));
	h = QUOTE(GRID_Y(PIC_H));
};

class ItemDescriptionBackground: RscItemText {
	x = 0.014;
	y = QUOTE(GRID_Y(PIC_H + SPACE_H));
	w = QUOTE(GRID_X(54));
	h = QUOTE(GRID_Y(STORE_H - (ITEM_Y + PIC_H + SPACE_H + SPACE_H2)));

	colorBackground[] = {0.05, 0.05, 0.05, 0.3};
};

class ItemDescriptionGroup: RscItemCtrlGroup {
	idc = -1;
	x = 0.014;
	y = QUOTE(GRID_Y(PIC_H + SPACE_H));
	w = QUOTE(GRID_X(ITEM_W));
	h = QUOTE(GRID_Y(STORE_H - (ITEM_Y + PIC_H + SPACE_H + SPACE_H2)));
	
	class controls {
		class ItemText: RscItemStructuredText {
			idc = IDC_ITEM_TEXT;
			x = 0;
			y = 0;
			w = QUOTE(GRID_X(ITEM_W));
			h = QUOTE(GRID_Y(PIC_H));
			shadow = 0;
		};

		class ItemDescripton: RscItemStructuredText {
			idc = IDC_ITEM_TEXT_DES;
			x = 0;
			y = 0;
			w = QUOTE(GRID_X(ITEM_W - SPACE_W));
			h = QUOTE(GRID_Y(PIC_H));
			size = QUOTE(FONT(0.9));

			class Attributes {
				align = "left";
				color = "#ffffff";
				shadow = 1;
				font = "PuristaMedium";
			};
		};

		class ProgressBar1: RscItemStatProgress {
			idc = IDC_STATS_PROGRESS_1;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(SPACE_H));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
		};
		class ProgressBarText1: RscItemStatText {
			idc = IDC_STATS_PROGRESS_TEXT_1;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(SPACE_H));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
							
			sizeEx = QUOTE(FONT(0.8));
		};
		class ProgressBar2: RscItemStatProgress {
			idc = IDC_STATS_PROGRESS_2;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(4));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
		};
		class ProgressBarText2: RscItemStatText {
			idc = IDC_STATS_PROGRESS_TEXT_2;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(4));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
							
			sizeEx = QUOTE(FONT(0.8));
		};
		class ProgressBar3: RscItemStatProgress {
			idc = IDC_STATS_PROGRESS_3;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(7));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
		};
		class ProgressBarText3: RscItemStatText {
			idc = IDC_STATS_PROGRESS_TEXT_3;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(7));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
							
			sizeEx = QUOTE(FONT(0.8));
		};
		class ProgressBar4: RscItemStatProgress {
			idc = IDC_STATS_PROGRESS_4;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(10));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
		};
		class ProgressBarText4: RscItemStatText {
			idc = IDC_STATS_PROGRESS_TEXT_4;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(10));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
							
			sizeEx = QUOTE(FONT(0.8));
		};
		class ProgressBar5: RscItemStatProgress {
			idc = IDC_STATS_PROGRESS_5;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(13));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
		};
		class ProgressBarText5: RscItemStatText {
			idc = IDC_STATS_PROGRESS_TEXT_5;
							
			x = QUOTE(GRID_X(SPACE_W));
			y = QUOTE(GRID_Y(13));
			w = QUOTE(GRID_X(ITEM_W - 2));
			h = QUOTE(GRID_Y(BAR_H));
							
			sizeEx = QUOTE(FONT(0.8));
		};
	};
};
