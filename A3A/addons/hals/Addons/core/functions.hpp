#include "..\..\script_component.hpp"

class HALs {
	class Common {
		file = QPATHTOFOLDER(Addons\core\functions);
		class log {headerType = -1;};
	};

	class Numbers {
		file = QPATHTOFOLDER(Addons\core\functions\numbers);
		class numberToString {};
	};

	class Arrays {
		file = QPATHTOFOLDER(Addons\core\functions\arrays);
		class sortArray {};
	};

	class Config {
		file = QPATHTOFOLDER(Addons\core\functions\config);
		class getConfigClass {headerType=-1;};
		class getConfigValue {headerType=-1;};
		class getModuleSettings {};
	};
};
