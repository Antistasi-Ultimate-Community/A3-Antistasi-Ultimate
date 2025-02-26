// In map template description.ext use:
// #include "MissionDescription\master.hpp"
// Whether order should be maintained is unknown.

#include "..\script_component.hpp"

author = $STR_antistasi_credits_generic_author_text;
Keys[] = {"A3-Antistasi-is-not-available-in-single-player"};
KeysLimit = 2;  // Even if player tampers with his unlocked keys, this will never become true.
missionGroup = "AntistasiUltimate";

#ifndef CUSTOM_A3A_CLASS
	class A3A {
		//used mainly to detect that the mission is a A3A mission, can also contain other data in the future
		version[] = {VERSION_AR};
	};
#endif

// #define RANDOM_NUMBER __RAND_UINT8__

// #if RANDOM_NUMBER > 0
// 	#define LOAD_SCREEN_IMAGE "\x\A3A\addons\maps\images_co.jpg"
// 	#define OVERVIEW_IMAGE "\x\A3A\addons\maps\images_co.jpg"
// #endif

// #if RANDOM_NUMBER > 127
// 	#define LOAD_SCREEN_IMAGE "\x\A3A\addons\maps\images_alt_co.jpg"
// 	#define OVERVIEW_IMAGE "\x\A3A\addons\maps\images_alt_co.jpg"
// #endif

#ifndef LOAD_SCREEN_IMAGE
	#define LOAD_SCREEN_IMAGE "\x\A3A\addons\maps\images_alt_co.jpg"
	#define OVERVIEW_IMAGE "\x\A3A\addons\maps\images_co.jpg"
#endif

#include "debug.hpp"
#include "gameSettings.hpp"
#include "params.hpp"
#include "CfgRemoteExec.hpp"
