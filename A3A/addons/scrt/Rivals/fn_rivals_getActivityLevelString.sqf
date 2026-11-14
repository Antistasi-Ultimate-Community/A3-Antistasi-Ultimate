#include "..\defines.inc"
FIX_LINE_NUMBERS()

#include "Constants.inc"

params ["_level"];

//intentionally inverted
private _activityLevel = switch (_level) do {
	case OMNIPRESENT_ACTIVITY: {
		localize "STR_info_bar_rivals_activity_1";
    };
	case INTRUSIVE_ACTIVITY: {
		localize "STR_info_bar_rivals_activity_2";
	};
    case CONSPICIOUS_ACTIVITY: {
		localize "STR_info_bar_rivals_activity_3";
    };
	case MODERATE_ACTIVITY: {
		localize "STR_info_bar_rivals_activity_4";
    };
	case INSIGNIFICANT_ACTIVITY: {
		localize "STR_info_bar_rivals_activity_5";
    };
	default {
		Error_1("Bad level recieved, cannot generate string, was %1",_level);
		""
	};
};

_activityLevel
