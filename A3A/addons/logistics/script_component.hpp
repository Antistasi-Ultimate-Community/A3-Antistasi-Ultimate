#define COMPONENT logistics
#include "\x\A3A\addons\core\Includes\script_mod.hpp"

//get and format model path to class friendly name for lookup
#define MODEL_OF_OBJ(OBJECT) ((getText (configOf OBJECT >> "model") splitString "\.") joinString "_")
#define MODEL_OF_CLASS(CLASS) ((getText (configFile >> "CfgVehicles" >> CLASS >> "model") splitString "\.") joinString "_")
