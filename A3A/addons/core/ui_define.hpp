#ifndef __HAS_A3ACORE_UI_DEFINE_HPP__
#define __HAS_A3ACORE_UI_DEFINE_HPP__

#ifndef __A3ACORE_IS_3DEN__
    #define FORWARD(x) class x
#else
    #define FORWARD(x) import x
#endif // __A3ACORE_IS_3DEN__

FORWARD(RscText);
FORWARD(RscStructuredText);
FORWARD(RscPicture);
FORWARD(RscEdit);
FORWARD(RscCombo);
FORWARD(RscListbox);
FORWARD(RscButton);
FORWARD(RscShortcutButton);
FORWARD(RscShortcutButtonMain);
FORWARD(RscFrame);
FORWARD(RscSlider);
FORWARD(IGUIBack);
FORWARD(RscCheckbox);
FORWARD(RscTextCheckBox);
FORWARD(RscButtonMenu);
FORWARD(RscButtonMenuOK);
FORWARD(RscButtonMenuCancel);
FORWARD(RscControlsGroup);

#include "ui_const.hpp"

#endif // __HAS_A3ACORE_UI_DEFINE_HPP__
