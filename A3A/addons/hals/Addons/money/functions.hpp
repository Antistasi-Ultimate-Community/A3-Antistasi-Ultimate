#include "..\..\script_component.hpp"

class HALs_money {
	class Init {
		file = QPATHTOFOLDER(Addons\money\functions);
		class initModule {postInit = 1;};
	};
	
	class Client {
		file = QPATHTOFOLDER(Addons\money\functions\client);
		class initClient {};
	};
	
	class Server {
		file = QPATHTOFOLDER(Addons\money\functions\server);
		class addFunds {};
		class getFunds {};
		class initServer {};
	};
};
