#include "\x\cba\addons\main\script_macros_common.hpp"

#define CBA_EVENT_CLIENT_INIT_DONE QUOTE(TRIPLES(PREFIX,event,clientInitDone))
#define CBA_EVENT_SERVER_INIT_DONE QUOTE(TRIPLES(PREFIX,event,serverInitDone))

#define PATCHNAME(x) TRIPLES(PREFIX,COMPONENT,x)

#undef PREP
#undef PREPSUB
#define PREP(fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(functions\DOUBLES(fn,fncName).sqf)
#define PREPSUB(folder,fncName) FUNC(fncName) = compile preprocessFileLineNumbers QPATHTOF(folder\DOUBLES(fn,fncName).sqf)

#undef VARDEF
#define VARDEF RETDEF

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
