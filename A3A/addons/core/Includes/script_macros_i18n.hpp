/* -------------------------------------------
Macro: __
    Localizes a string

    Making use of GNU gettext's macro forms, the __ and __0 through __8 macros are
    used to localize strings with 0 through 8 parameters.

Parameters:
    P0 - the string to localize
    P1..x - the parameters to format into the string

Example:
    (begin example)
        private _str = __(STR_antistasi_dialogs_hq_button_close_text); // --> "Close"
        private _str = __1(STR_antistasi_dialogs_player_money_donate_player,"$"); // --> "Donate 100 $ to player"
    (end)

Author:
    UnseenKill/gor3Splatter
------------------------------------------- */
#define __(P0) (localize QUOTE(P0))
#define __0(P0) (localize QUOTE(P0))
#define __1(P0,P1) (format[__(P0), P1])
#define __2(P0,P1,P2) (format[__(P0), P1, P2])
#define __3(P0,P1,P2,P3) (format[__(P0), P1, P2, P3])
#define __4(P0,P1,P2,P3,P4) (format[__(P0), P1, P2, P3, P4])
#define __5(P0,P1,P2,P3,P4,P5) (format[__(P0), P1, P2, P3, P4, P5])
#define __6(P0,P1,P2,P3,P4,P5,P6) (format[__(P0), P1, P2, P3, P4, P5, P6])
#define __7(P0,P1,P2,P3,P4,P5,P6,P7) (format[__(P0), P1, P2, P3, P4, P5, P6, P7])
#define __8(P0,P1,P2,P3,P4,P5,P6,P7,P8) (format[__(P0), P1, P2, P3, P4, P5, P6, P7, P8])

/* -------------------------------------------
Macro: __P
    Prepare i18n payload for network transmission

Parameters:
    P0 - the string to localize on the receiving end
    P1..x - the parameters to include in the payload

Example:
    (begin example)
    // Server side:
        [__P1(STR_antistasi_dialogs_player_money_donate_player,"$")] remoteExec["A3A_fnc_someFunc", player];
    (end)

Author:
    UnseenKill/gor3Splatter
------------------------------------------- */
#define __P(P0) [QUOTE(P0)]
#define __P0(P0) [QUOTE(P0)]
#define __P1(P0,P1) [QUOTE(P0), P1]
#define __P2(P0,P1,P2) [QUOTE(P0), P1, P2]
#define __P3(P0,P1,P2,P3) [QUOTE(P0), P1, P2, P3]
#define __P4(P0,P1,P2,P3,P4) [QUOTE(P0), P1, P2, P3, P4]
#define __P5(P0,P1,P2,P3,P4,P5) [QUOTE(P0), P1, P2, P3, P4, P5]
#define __P6(P0,P1,P2,P3,P4,P5,P6) [QUOTE(P0), P1, P2, P3, P4, P5, P6]
#define __P7(P0,P1,P2,P3,P4,P5,P6,P7) [QUOTE(P0), P1, P2, P3, P4, P5, P6, P7]
#define __P8(P0,P1,P2,P3,P4,P5,P6,P7,P8) [QUOTE(P0), P1, P2, P3, P4, P5, P6, P7, P8]

/* -------------------------------------------
Macro: __V
    Localizes an array

    The V is synonymous for variadic, as the macro takes an array of parameters
    to localize and format into a string. It should be used for locale string &
    parameter payloads sent over the network.

Parameters:
    P0 - an array where the first element is the string to localize and the rest of the
         elements are the parameters to format into the string.

Example:
    (begin example)
    // Server side:
        [__P1(STR_antistasi_dialogs_player_money_donate_player,"$")] remoteExec["A3A_fnc_someFunc", player];
    
    // Client side (function A3A_fnc_someFunc):
        params[["_i18nPayload", nil, [[]]]];
        private _str = __V(_i18nPayload); // --> "Donate 100 $ to player"
    (end)

Author:
    UnseenKill/gor3Splatter
------------------------------------------- */
#define __V(P0) (format([localize((P0) select 0)] + ((P0) select [1])))
