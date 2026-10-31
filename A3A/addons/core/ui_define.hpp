#ifndef __HAS_A3ACORE_UI_DEFINE_HPP__
#define __HAS_A3ACORE_UI_DEFINE_HPP__

#ifndef __A3ACORE_IS_3DEN__
    #define FORWARD(x) class x
#else
    #define FORWARD(x) import x
#endif // __A3ACORE_IS_3DEN__


#define UI_FONT_DEFAULT font = "PuristaMedium"
#include "ui_const.hpp"

#endif // __HAS_A3ACORE_UI_DEFINE_HPP__
