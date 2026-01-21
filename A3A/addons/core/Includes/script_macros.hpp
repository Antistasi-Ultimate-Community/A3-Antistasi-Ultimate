#include "\x\cba\addons\main\script_macros_common.hpp"
#include "script_macros_undef.hpp"

// Client-only event; after client initialization; params=[]
#define CBA_EVENT_CLIENT_INIT_DONE QUOTE(TRIPLES(PREFIX,event,clientInitDone))
// Client-only event; on personal save loaded; params=[Hashmap saveData]
#define CBA_EVENT_CLIENT_PLAYER_LOAD QUOTE(TRIPLES(PREFIX,event,clientPlayerLoad))
// Client-only event; on personal save; params=[Hashmap saveData]
#define CBA_EVENT_CLIENT_PLAYER_SAVE QUOTE(TRIPLES(PREFIX,event,clientPlayerSave))
// Server-only event; after server initialization; params=[]
#define CBA_EVENT_SERVER_INIT_DONE QUOTE(TRIPLES(PREFIX,event,serverInitDone))
// Server-only event; on game save; params=[]
#define CBA_EVENT_SERVER_GAME_SAVED QUOTE(TRIPLES(PREFIX,event,serverGameSaved))

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
