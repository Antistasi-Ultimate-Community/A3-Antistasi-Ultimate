#include "..\BuildObjectsList.hpp"
class vn_khe_sanh {
	population[] = {
		{"Khesanhvil",800},{"Tanloan",100},{"Axau",50},{"Xiso",40},{"XiMi",38},{"Xino",60},{"PalienKhun",74},
		{"Koso",60},{"KoWe",38},{"BanNeme",50},{"Avau",35},{"ToRout",80},{"RoRo",100},{"ABung",45},
		{"Tavouac",15},{"Palo",125},{"Thanh",80},{"AHo",20},{"XingEa",75},{"Xingwe",175},{"ACoi",25},{"Dan",100},
		{"Bahy",100},{"HaiPhuc",50},{"HaiTan",30},{"Donque",125},{"Hamy",78},{"BichNam",40},{"Raoha",70},
		{"NhiHa",17},{"GioHai",86},{"AnMy",100},{"Kok",60},{"HopTac",50},{"CoSo",12},{"Cola",90},{"Seina",130},
		{"Viski",21},{"LiemCong",79},{"NamHung",130},{"ThaiLai",222},{"Lako",90},{"pagnouy",76},{"Sadoun",64},
		{"Salen",71},{"Lousalia",19},{"Paxiou",12},{"Khoyamep",50},{"Gnavay",60},{"Gnavet",114},{"Napang",100},
		{"Xok",8},{"Soy",100},{"AnDinh",30},{"Nabo",150},{"Tuan",40},{"Naxok",52},{"Koanphan",113},
		{"Phonsang",32},{"Louang",100},{"Phonsi",101},{"Pomkhoun",100},{"Doy",15},{"Nase",30},{"Nadou",100},
		{"Cukty",30},{"HoaThanh",100},{"CuYang",100},{"Ploy",100},{"Thongxa",60},{"Kang",43},{"Lapoung",100},{"Lukdong",70},
		{"Pakpong",20},{"Donxat",35},{"Vangkoy",100},{"Xeku",20},{"Nalao",14},{"Kengkep",100},
		{"Nasano",43},{"Naxuak",47},{"Dantete",60},{"Donvay",56},{"Nonghano",10},{"Nongno",40},{"Tansoum",65},{"Hindam",50},
		{"Phailom",30},{"Saoven",100},{"Prao",140},{"Talu",60},{"Paca",35}
	};
	disabledTowns[] = {"KoNo", "MuTa", "Kouthi", "Kate", "Hinlap", "Avian", "That", "XomBau","Paxia", "Chanulangchanh", "Xomcon", "Xombatu", "Xombolou", "Bolieu", "VinhTu", "SonGiang", "SonXuan"};
	antennas[] = {
		{2603.31,10086,-0.0195313},{13435.9,11139.5,0},{5107.86,11336.4,0},{11235.7,14857.9,0},{13216.8,13966.6,0.118774},{11127.5,9870.3,0.118835},{5026.98,5361.25,0.719513},{9634.73,351.082,0},{9051.56,6547.55,0}
	};
	antennasBlacklistIndex[] = {};
	banks[] = {
		{5893.41,10253.1,-0.687263},{9507.5,13572.9,0.133848}
	};
	garrison[] = {
		{},{"outpost_14","airport_1","control_45","outpost_10","outpost_9","outpost_3", "control_7", "outpost_1", "outpost_4", "seaport_2", "factory_1","milbase_4", "outpost_7", "control_2", "control_14", "control_30", "outpost_8"},{},{"control_45","control_7", "control_2", "control_14", "control_30"}
	};
	fuelStationTypes[] = {
		"Land_FuelStation_Feed_F","Land_fs_feed_F","Land_FuelStation_01_pump_malevil_F","Land_FuelStation_01_pump_F","Land_FuelStation_02_pump_F","Land_FuelStation_03_pump_F","Land_vn_b_prop_fueldrum_01","Land_vn_usaf_fueltank_75_01","Land_vn_fuelstation_feed_f","Land_vn_fuelstation_01_pump_f","Land_vn_fuelstation_02_pump_f"
	};
	milAdministrations[] = {
		{10884.1,3920.57,2.28882e-005}
	};
	climate = "tropical";
	buildObjects[] = {
		BUILDABLES_HISTORIC,
		BUILDABLES_TROPIC,
		BUILDABLES_SOGPF,
		BUILDABLES_UNIVERSAL
	};
};
