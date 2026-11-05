class CfgFunctions
{
	class ABZ
	{
		class main
		{
			file = QPATHTOFOLDER(functions);

			// --- shared helpers ---
			class isAntistasi {};
			class saveKey {};
			class getMoney {};
			class addMoney {};
			class getFactionMoney {};
			class getFunds {};
			class itemKind {};
			class itemPrice {};
			class tierOf {};
			class rarityInfo {};
			class classValid {};
			class displayNameOf {};
			class pictureOf {};
			class bulkSize {};
			class unlocksEnabled {};
			class atHQ {};
			class enemySides {};
			class enemiesNear {};
			class townName {};
			class notify {};

			// --- stock pool (server) ---
			class buildPool {};
			class poolFromFactions {};
			class poolFromConfigs {};
			class isUnlocked {};
			class rollStock {};
			class buildVehPool {};
			class vehReq {};
			class vehPrice {};
			class vehResale {};
			class vehSpot {};
			class waterNear {};
			class rollJob {};
			class tierFactor {};

			// --- vendors (server) ---
			class civClass {};
			class vendorNames {};
			class vendorEntry {};
			class vendorUnit {};
			class vendorPick {};
			class vendorPos {};
			class vendorCreate {};
			class vendorSpawn {};
			class vendorPrep {};
			class publishStalls {};
			class vendorDespawn {};
			class vendorKilled {};
			class vendorRestock {};
			class vendorRelocate {};
			class vendorMarker {};
			class vendorLoop {};
			class vendorTick {};

			// --- trade (server) ---
			class serverCanTrade {};
			class undercoverOk {};
			class serverDeliverVeh {};
			class serverShopReq {};
			class serverBuy {};
			class serverCharge {};
			class serverDeliverCrate {};
			class serverSell {};
			class serverPay {};
			class serverOpenCrate {};
			class addCargo {};
			class serverUnpack {};
			class serverRumours {};
			class serverReset {};
			class serverCrateLoad {};
			class serverCrateUnload {};
			class seizureLoop {};

			// --- persistence (server) ---
			class save {};
			class load {};
			class queueSave {};
			class saveStamp {};
			class syncCommit {};

			// --- v1.1.0 ---
			class entryPad {};
			class shopPayload {};
			class runFind {};
			class crateRelease {};
			class crateRemove {};
			class makeCrate {};
			class dropSpot {};
			class runSpawnCrate {};
			class runEnemyShare {};
			class runAllowance {};
			class runOffer {};
			class runPublish {};
			class runNews {};
			class serverRunAccept {};
			class serverRunDeliver {};
			class runFail {};
			class runCheck {};
			class progressGate {};
			class announceRoll {};
			class wantedList {};
			class wantedValid {};
			class wantedToggle {};
			class wantedCheck {};
			class wantedFind {};
			class factionPays {};
			class receiptAdd {};
			class receiptSync {};
			class unpackCrate {};
			class serverUnpackAll {};
			class shopPin {};
			class shopRun {};
			class runWatch {};
			class runPay {};
			class wantedBase {};

			// --- v1.1.1 ---
			class handsCheck {};
			class weaponParts {};
			class weaponSplit {};
			class weaponStored {};
			class cargoTakeWeapon {};
			class sellBoxOk {};
			class sellSource {};
			class cargoInventory {};
			class cargoGive {};
			class serverSellCargo {};
			class shopSellCargo {};

			// --- client ---
			class applyPlayerActions {};
			class openShop {};
			class shopFill {};
			class shopFillList {};
			class shopUpdateInfo {};
			class shopBuy {};
			class shopSell {};
			class sellCheck {};
			class sellClass {};
			class isWeaponType {};
			class dealerPrice {};
			class unitPrice {};
			class isUnlockedAny {};
			class switchFamily {};
			class turnsInto {};
			class yields {};
			class dealerReach {};
			class cratePrice {};
			class dealerMap {};
			class repriceRows {};
			class myInventory {};
			class removeMine {};
			class sellPrice {};
			class jobPrice {};
			class nearVendor {};
			class shopTick {};
			// --- v1.1.2 (the menu fills the screen) ---
			class uiFit {};
			class uiScale {};
			class uiText {};
			class receiveItems {};
			class crateInfo {};
			class loadTarget {};
			class cargoTarget {};
			class rumours {};

			// --- Event Handlers ---
			class onEventServerGameSave {};
			class onEventServerInitDone {};
		};
	};
};
