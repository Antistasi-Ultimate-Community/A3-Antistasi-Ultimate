class CfgFunctions {
	class JN {
		class Common {
			file = QPATHTOFOLDER(Common);
			class common_addActionSelect {};
			class common_addActionCancel {};
			class common_updateActionCancel {};
			class common_removeActionCancel {};
			class common_getActionCanceled {};
		};

		class Common_Vehicle {
			file = QPATHTOFOLDER(Common\vehicle);
			class common_vehicle_getSeatNames {};
			class common_vehicle_getVehicleType {};
		};

		class Common_Array {
			file = QPATHTOFOLDER(Common\array);
			class common_array_add {};
			class common_array_remove {};
		};
		class JND {
			file = QPATHTOFOLDER(JND);
			class debugv2 {postinit = 1;};
		};

		class JNA {
			file = QPATHTOFOLDER(JNA);
			class arsenal {};
			class arsenal_addItem {};
			class arsenal_addToArray {};
			class arsenal_cargoToArray {};
			class arsenal_cargoToArsenal {};
			class arsenal_handleAction {};
			class arsenal_init {};
			class arsenal_inList {};
			class arsenal_itemCount {};
			class arsenal_itemType {};
			class arsenal_loadInventory {};
			class arsenal_removeFromArray {};
			class arsenal_removeItem {};
			class arsenal_requestOpen {};
			class arsenal_requestClose {};
			class vehicleArsenal {};

		};
	};
};
