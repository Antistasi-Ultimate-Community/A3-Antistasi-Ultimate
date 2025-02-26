#include "..\BuildObjectsList.hpp"
class cam_lao_nam {
	population[] = {
		{"haiphong",500},{"hanoi",1000},{"hue",2000},{"saigon",700},{"sihanoukville",200},{"nodallho",100},{"bru",100},{"attapeu",100},{"dakrong",100},{"lumphat",100},{"cuchi",100},{"baria",100},{"danang",600},{"kenglat",100},{"laichau",100},{"paknoi",100},{"phuan",100},{"xomram",120},{"xomgia",100},{"tongmoo",100},{"donlac",100},{"cangon",100},{"nalai",100},{"baichai",100},{"bachdang",100},{"ketthuc",100},{"vongxo",100},{"banbon",100},{"nongkhiaw",100},{"horhog",100},{"langmau",100},{"baria2",100},{"anhoa",100},{"binhminh",100},{"buoisang",100},{"hoalien",100},{"lacmy",100},{"cacan",100},{"tanhop",100},{"hanoi2",300},{"gansong",100},{"zokcarbora",100},{"banhtrung",100},{"yentinh",100},{"thunglungcao",100},{"baibiendep",100},{"phoduc",100},{"baove",100},{"ngatu",100},{"binhyen",100},{"bosong",100},{"marble",180},{"niemtin",100},{"krosang",100},{"banlen",100},{"comngon",100},{"saigonport",100},{"cauhai",100},{"longhai", 50},{"nhenden", 50},{"daotrai", 100}
	};
	disabledTowns[] = {
		"fob4","daumau","fob1","quanloi","stagingarea","fob2","pleimei","fob6","berchtesgaden","fob3","khegio","fob5","thudridge","halongnavybase","plainofjars","pleikuboatbase","banhoang","vinhau","kechau","quanbo","huecitadel","bimat","danthemthem","daophai","phuquoc","dharmadocks","dharma","patmep","phokham","rungcung","tiengtai","vacang","hanoi3","saigonport","ansungsong","vanchu","sangha","hoxanx","congtroi","boave","honba","kiemtra","baibiendiep","nuocbun","cantho","soctrang","mekongdelta","tampep","segbegat","che","tandi","lahot","alieng","thiengling","phaonoi","timho","quyen","caloi","thuphac","diemdang","bandao","mantau","dongxa","tauphabang","horgoat","samsong","muylai","caymo","docon","paradiseisland","mien","giuaho"
	};
	antennas[] = {
		{2247.39,3986.44,0.00225067}, {6918.17,5419.54,0}, {2947.57,8719.32,0.00744534}, {3971.88,10207.1,0}, {11382.5,5747.82,8.39233e-005},{8700.25,10425.1,-0.00531006}, {4898.78,13640.6,-0.120941}, {3272.04,15538.2,0}, {13743.9,8425.6,-0.171967},{14864.6,6866.28,-0.00304413}, {16101.4,3639.34,-0.115108}, {16074.1,7125.38,0.000450134}, {5279.59,16872.8,0.446297}, {16120.6,7510.5,0.00740814},{16798.7,6349.54,-0.134335}, {16567.1,7649.92,-6.48499e-005}, {16915.2,7431.9,-9.53674e-006}, {11481,14497.6,0.093338},{9002.38,16557.6,0.00338745}, {16704,9187.21,-6.29425e-005}, {14135,12825.5,0.106886}, {16193.1,10991.2,-0.0359497}, {16956.7,10360.2,-6.67572e-005},{18696.2,8463.42,-0.26639}, {20109.3,6538.61,9.53674e-007}, {20062.7,7258.82,0.0105629}, {14532.3,16441.8,-0.00198364}, {14754.2,18335.2,0.000380516}
	};
	antennasBlacklistIndex[] = {11,15,17,21,24,27};
	banks[] = {};
	garrison[] = {
		{},{"control_55", "control_125", "control_54", "control_53", "factory_2", "outpost_31", "factory_1", "resource_3", "resource_2", "outpost_15", "milbase_4", "airport_2", "resource_8", "outpost_12", "outpost_37", "resource_16", "outpost_13", "milbase_6", "control_118", "control_63", "control_120", "control_48", "control_62", "control_49", "control_61", "control_60", "outpost_19", "control_67", "outpost_14", "control_119", "control_121", "resource_7", "control_114", "control_115", "control_116", "control_110", "control_111", "outpost_29", "resource_18", "control_64", "control_113", "control_47", "control_117", "resource_1", "control_46", "control_44", "control_45", "control_122", "control_81", "control_112", "control_80", "control_79", "control_78","outpost_42", "outpost_26", "outpost_40", "resource_13", "outpost_28"},{},{"control_55", "control_125", "control_54", "control_53","control_118", "control_63", "control_120", "control_48", "control_62", "control_49", "control_61", "control_60", "control_67", "control_119", "control_121", "control_114", "control_115", "control_116", "control_110", "control_111", "control_64", "control_113", "control_47", "control_117", "control_46", "control_44", "control_45", "control_122", "control_81", "control_112", "control_80", "control_79", "control_78"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_vn_b_prop_fueldrum_01","Land_vn_usaf_fueltank_75_01","Land_vn_fuelstation_feed_f","Land_vn_fuelstation_01_pump_f","Land_vn_fuelstation_02_pump_f"
	};
	milAdministrations[] = {
		{16488.2,3704.06,0},{17653.2,9194.32,4.76837e-007}
	};
	climate = "tropical";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_TROPIC,
		BUILDABLES_SOGPF,
		BUILDABLES_UNIVERSAL
	};
};
