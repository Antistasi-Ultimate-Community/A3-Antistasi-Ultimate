#define GRID_TYPE pixelGridNoUIScale
#define GRID_SCALE 2
#define SCALE_FACTOR getNumber (configFile >> 'uiScaleFactor')

#define GRID_XX(gridType, gridScale, n) (pixelW * gridType * (((n) * (gridScale)) / SCALE_FACTOR))
#define GRID_YY(gridType, gridScale, n) (pixelH * gridType * (((n) * (gridScale)) / SCALE_FACTOR))

#define GRID_X(n) (pixelW * GRID_TYPE * (((n) * (GRID_SCALE)) / SCALE_FACTOR))
#define GRID_Y(n) (pixelH * GRID_TYPE * (((n) * (GRID_SCALE)) / SCALE_FACTOR))


#define FONT(n) (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * n) //(1.5 * pixelH * GRID_TYPE * n) 
#define SIZE(n) (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * n) //(1.5 * pixelH * GRID_TYPE * n) 
#define CENTER(PARENT, CHILD) ((PARENT / 2) - (CHILD / 2))
#define CENTER_GRID_X(PARENT, CHILD) ((PARENT / 2) - GRID_X(CHILD / 2))
#define CENTER_GRID_Y(PARENT, CHILD) ((PARENT / 2) - GRID_Y(CHILD / 2))


// General size MACROS
#define STORE_W (160)
#define DIALOG_W (183)
#define DIALOG_H (100)
#define DIALOG_X (safeZoneX + CENTER_GRID_X(safeZoneW, STORE_W)) //(safeZoneW / 2) - GRID_X(STORE_W/2))
#define DIALOG_Y (safeZoneY + CENTER_GRID_Y(safeZoneH, DIALOG_H)) //(safeZoneH / 2) - GRID_Y(DIALOG_H/2))

#define STORE_H (DIALOG_H)
#define BUFFER_W 2
#define BUFFER_H 2

#define SPACE_W2 0.5
#define SPACE_H2 0.5
#define SPACE_W 1
#define SPACE_H 1

// Title Bar
#define FUNDS_W (20)
#define FUNDS_H (BAR_H)
#define FUNDS_X (STORE_W - BAR_W - FUNDS_W)

// Item Selection
#define BAR_W 3
#define BAR_H 3
#define COMBO_W 88
#define CARGO_W 44
#define LIST_W (COMBO_W + SPACE_W*4 + BAR_W*4)
#define LIST_H (STORE_H - (BAR_H*2 + SPACE_H2*3 + SPACE_H)) 
#define LIST_Y (BAR_H + SPACE_H2)

// Selected Item 
#define ITEM_W 54
#define ITEM_X (SPACE_W2 + LIST_W + SPACE_W)
#define ITEM_Y (BAR_H*2 + SPACE_H2*4)
#define PIC_H 21

// Trader/Purchase information
#define TRADER_W (DIALOG_W - STORE_W)
#define TRADER_H (DIALOG_H)
#define TRADER_Y (DIALOG_Y + GRID_Y(BAR_H + SPACE_H/*BAR_H*2 + SPACE_H*3*/))
#define TRADER_X (DIALOG_X + GRID_X(STORE_W + SPACE_W))
#define TRADER_PIC_H 21
