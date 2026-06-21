switch (selectRandom ["loy", "gp", "ins"]) do {
	case ("loy"): {
		#include "ACM_PD_Riv_FIA_Loy.sqf"
	};
	case ("gp"): {
		#include "ACM_PD_Riv_FIA_GP.sqf"
	};
	case ("ins"): {
		#include "ACM_PD_Riv_FIA_Ins.sqf"
	};
};