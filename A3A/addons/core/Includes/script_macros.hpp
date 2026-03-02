#include "\x\cba\addons\main\script_macros_common.hpp"
//#include "script_macros_undef.hpp"
#include "cba_events.hpp"

// Define CfgPatches class name for, well, patches.
#define PATCHNAME(x) TRIPLES(PREFIX,COMPONENT,x)

#ifndef FUNCTION_NAME_INSERT
    // CBA uses "fnc", we use "fn" to look for function source files ...
    #define FUNCTION_NAME_INSERT fn
#endif // FUNCTION_NAME_INSERT

/* -------------------------------------------
Sub-component support

    If SUBCOMPONENT is defined in "script_component.hpp", adjust various macros
    to account for the subcomponent structure.

    Subcomponents live inside a component folder, e.g.
        addons\<component>\<subcomponent>\
    but otherwise replicate main component structure.

    Still, file locator macros (e.g. PATHTOF) will need to be adjusted for the
    additional folder layer.

Author:
    UnseenKill/gor3Splatter
------------------------------------------- */
#ifndef SUBCOMPONENT
    #define COMPONENT_PATH_FRAGMENT COMPONENT
    #define COMPONENT_PATH_FRAGMENT_F COMPONENT_F
#else // SUBCOMPONENT
    #define COMPONENT_PATH_FRAGMENT COMPONENT\SUBCOMPONENT
    #define COMPONENT_PATH_FRAGMENT_F COMPONENT_F\SUBCOMPONENT

    #undef COMPILE_FILE
    #define COMPILE_FILE(var1) COMPILE_FILE_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,var1)

    #undef COMPILE_FILE_CFG
    #define COMPILE_FILE_CFG(var1) COMPILE_FILE_CFG_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,var1)

    #undef COMPILE_SCRIPT
    #define COMPILE_SCRIPT(var1) compileScript ['PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,var1)']

    #undef FUNC
    #define FUNC(var1) TRIPLES(SUBADDON,fnc,var1)

    #undef GVAR
    #define GVAR(var1) DOUBLES(SUBADDON,var1)

    #undef LOG_SYS_FORMAT
    #define LOG_SYS_FORMAT(LEVEL,MESSAGE) format ['[%1] (%2) %3: %4', toUpper 'PREFIX', 'SUBADDON', LEVEL, MESSAGE]

    #undef PATHTOF
    #define PATHTOF(var1) PATHTOF_SYS(PREFIX,COMPONENT_PATH_FRAGMENT,var1)

    // Localization strings macros
    #undef CSTRING
    #define CSTRING(var1) QUOTE(TRIPLES($STR,SUBADDON,var1))
    #undef LSTRING
    #define LSTRING(var1) QUOTE(TRIPLES(STR,SUBADDON,var1))
    #undef LLSTRING
    #define LLSTRING(var1) (localize LSTRING(var1))
#endif // SUBCOMPONENT

#undef PATHTO_FNC
#define PATHTO_FNC(func) class func { \
    file = QUOTE(PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\DOUBLES(FUNCTION_NAME_INSERT,func))); \
    CFGFUNCTION_HEADER; \
    RECOMPILE; \
}
// No #undef here, as SPATHTO_FNC is new. Adapt to folder layouts where
// functions live in categorized subfolders.
#define SPATHTO_FNC(folder,func) class func { \
    file = QUOTE(PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\folder\DOUBLES(FUNCTION_NAME_INSERT,func))); \
    CFGFUNCTION_HEADER; \
    RECOMPILE; \
}

// Function definition macros with compile cache support.
// Need to be overwritten from CBA because of our different function source file
// naming convention (CBA functions\fnc_foo.sqf vs our functions\fn_foo.sqf). 
#undef PREP
#undef PREPMAIN
#ifdef DISABLE_COMPILE_CACHE
    #define PREP(var1) FUNC(var1) = compile preprocessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\DOUBLES(FUNCTION_NAME_INSERT,var1))'
    #define PREPMAIN(var1) FUNCMAIN(var1) = compile preprocessFileLineNumbers 'PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\DOUBLES(FUNCTION_NAME_INSERT,var1))'
#else
    #define PREP(var1) ['PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\DOUBLES(FUNCTION_NAME_INSERT,var1))', 'FUNC(var1)'] call SLX_XEH_COMPILE_NEW
    #define PREPMAIN(var1) ['PATHTO_SYS(PREFIX,COMPONENT_PATH_FRAGMENT_F,functions\DOUBLES(FUNCTION_NAME_INSERT,var1))', 'FUNCMAIN(var1)'] call SLX_XEH_COMPILE_NEW
#endif

// Quote quote
#ifndef QQUOTE
    #define QQUOTE(var1) QUOTE(QUOTE(var1))
#endif // QQUOTE

// VARDEF used everywhere is CBA's RETDEF.
#undef VARDEF
#define VARDEF(a,b) RETDEF(a,b)

// More or less alias macros for PATHTOF, but used everywhere in Antistasi to
// especially locate UI resources etc. Keep it as an alias to avoid changing
// hundreds of files.
#define PATHTOFOLDER(var1) PATHTOF_SYS(PREFIX,COMPONENT,var1)
#define QPATHTOFOLDER(var1) QUOTE(PATHTOFOLDER(var1))

#define EPATHTOFOLDER(var1,var2) PATHTOF_SYS(PREFIX,var1,var2)
#define QEPATHTOFOLDER(var1,var2) QUOTE(EPATHTOFOLDER(var1,var2))

// Should akshually be called QEPATHTOFOLDER ...
// Keep the typo as an alias so ~1000 files don't show up in PR
#define EQPATHTOFOLDER(var1,var2) QEPATHTOFOLDER(var1,var2)

/* -------------------------------------------
Macro: XOR
    Evaluates to true if exactly one of both values is true

Parameters:
    VAR1 - the first variable to evaluate
    VAR2 - the second variable to evaluate

Example:
    (begin example)
        // return "true" if exactly one of a and b is true
        XOR(a, b);
    (end)

Author:
    Bohemia Interactive (https://community.bistudio.com/wiki/Operators)
------------------------------------------- */
#define XOR(VAR1,VAR2) (((VAR1) || (VAR2)) && !((VAR1) && (VAR2)))
