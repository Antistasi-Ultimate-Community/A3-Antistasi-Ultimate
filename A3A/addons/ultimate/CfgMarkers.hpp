
class n_unknown;
class flag_NATO;

class A3AU_Factory_mrk : n_unknown
{
	scope = 1;
	name = "Antistasi Factory";
	icon = QPATHTOFOLDER(data\A3AU_factory_mrk);
	texture = QPATHTOFOLDER(data\A3AU_factory_mrk);
	color[] = { 0, 0, 0, 1 };
	shadow = 0;
	markerClass = "A3AU_Factory";
	size = 24;
	showEditorMarkerColor = 1;
};

class A3AU_Resource_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Resource";
	icon = QPATHTOFOLDER(data\A3AU_resource_mrk);
	texture = QPATHTOFOLDER(data\A3AU_resource_mrk);
	markerClass = "A3AU_Resource";
};

class A3AU_outpost_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Outpost";
	icon = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	texture = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	markerClass = "A3AU_Outpost";
};

class A3AU_milbase_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Military Base";
	icon = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	texture = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	markerClass = "A3AU_Milbase";
};

class A3AU_seaport_mrk_B : A3AU_Factory_mrk
{
	name = "Antistasi Seaport Blufor";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk_B);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk_B);
	markerClass = "A3AU_seaport_B";
};

class A3AU_seaport_mrk_O : A3AU_seaport_mrk_B
{
	name = "Antistasi Seaport Opfor";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk_O);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk_O);
	markerClass = "A3AU_seaport_O";
};

class A3AU_seaport_mrk_I : A3AU_seaport_mrk_B
{
	name = "Antistasi Seaport Independent";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk_I);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk_I);
	markerClass = "A3AU_seaport_I";
};

class A3AU_RebalHQ_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Rebal HQ";
	icon = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	texture = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	markerClass = "A3AU_RebalHQ_mrk";
	size = 36;
};

class A3AU_dealer_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Arms Dealer";
	icon = QPATHTOFOLDER(data\A3AU_dealer_mrk);
	texture = QPATHTOFOLDER(data\A3AU_dealer_mrk);
	markerClass = "A3AU_dealer_mrk";
};

class A3AU_radiotower_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Radio Tower";
	icon = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	texture = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	markerClass = "A3AU_radiotower";
};

class A3AU_miladmin_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Military Admin";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_mrk);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_mrk);
	markerClass = "A3AU_miladmin";
	size = 30;
};

class A3AU_miladmin_dead_mrk : A3AU_miladmin_mrk
{
	name = "Antistasi Military Admin (Dead)";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk);
	markerClass = "A3AU_miladmin_dead";
};

class A3AU_watchpost_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Watchpost";
	icon = QPATHTOFOLDER(data\A3AU_watchpost_mrk);
	texture = QPATHTOFOLDER(data\A3AU_watchpost_mrk);
	markerClass = "A3AU_watchpost";
};

class A3AU_roadblock_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Roadblock";
	icon = QPATHTOFOLDER(data\A3AU_roadblock_mrk);
	texture = QPATHTOFOLDER(data\A3AU_roadblock_mrk);
	markerClass = "A3AU_roadblock";
};

class A3AU_antiair_mrk : A3AU_Factory_mrk
{
	name = "Antistasi AA Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antiair_mrk);
	texture = QPATHTOFOLDER(data\A3AU_antiair_mrk);
	markerClass = "A3AU_antiair";
};

class A3AU_antitank_mrk : A3AU_Factory_mrk
{
	name = "Antistasi AT Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antitank_mrk);
	texture = QPATHTOFOLDER(data\A3AU_antitank_mrk);
	markerClass = "A3AU_antitank";
};

class A3AU_hmg_mrk : A3AU_Factory_mrk
{
	name = "Antistasi HMG Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_hmg_mrk);
	texture = QPATHTOFOLDER(data\A3AU_hmg_mrk);
	markerClass = "A3AU_hmg";
};

class A3AU_fasttravel_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Fast Travel";
	icon = QPATHTOFOLDER(data\A3AU_fasttravel_mrk);
	texture = QPATHTOFOLDER(data\A3AU_fasttravel_mrk);
	markerClass = "A3AU_fast_travel";
	size = 32;
};

class A3AU_dealer_flag: flag_NATO 
{
	scope = 1;
	name = "Arms Dealer Flag";
	icon = QPATHTOFOLDER(data\A3AU_dealer_flag);
	texture = QPATHTOFOLDER(data\A3AU_dealer_flag);
};
