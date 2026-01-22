#ifndef __HAS_A3ACORE_UI_DEFINE_HPP__
#define __HAS_A3ACORE_UI_DEFINE_HPP__

#ifndef __A3ACORE_IS_3DEN__
    #define FORWARD(x) class x
#else
    #define FORWARD(x) import x
#endif // __A3ACORE_IS_3DEN__

FORWARD(IGUIBack);
FORWARD(RscButton);
FORWARD(RscButtonMenu);
FORWARD(RscButtonMenuCancel);
FORWARD(RscButtonMenuOK);
FORWARD(RscCheckbox);
FORWARD(RscCombo);
FORWARD(RscControlsGroup);
FORWARD(RscEdit);
FORWARD(RscFrame);
FORWARD(RscListbox);
FORWARD(RscPicture);
FORWARD(RscPictureKeepAspect);
FORWARD(RscShortcutButton);
FORWARD(RscShortcutButtonMain);
FORWARD(RscSlider);
FORWARD(RscStructuredText);
FORWARD(RscText);
FORWARD(RscTextCheckBox);

#define UI_FONT_DEFAULT font = "PuristaMedium"
#include "ui_const.hpp"

#endif // __HAS_A3ACORE_UI_DEFINE_HPP__
