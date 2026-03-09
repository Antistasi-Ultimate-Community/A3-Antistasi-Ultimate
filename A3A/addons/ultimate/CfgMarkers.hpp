
class n_unknown;
class flag_NATO;

class A3AU_Factory_mrk : n_unknown
{
	scope = 2;
	name = "Antistasi Factory";
	icon = QPATHTOFOLDER(data\A3AU_factory_mrk);
	texture = QPATHTOFOLDER(data\A3AU_factory_mrk);
	color[] = { 0, 0, 0, 1 };
	shadow = 0;
	markerClass = "A3AU_MRK";
	size = 24;
	showEditorMarkerColor = 0;
};

class A3AU_city_mrk : A3AU_Factory_mrk
{
	name = "Antistasi City";
	icon = QPATHTOFOLDER(data\A3AU_city_mrk);
	texture = QPATHTOFOLDER(data\A3AU_city_mrk);
	markerClass = "A3AU_MRK";
	size = 20;
};

class A3AU_Resource_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Resource";
	icon = QPATHTOFOLDER(data\A3AU_resource_mrk);
	texture = QPATHTOFOLDER(data\A3AU_resource_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_outpost_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Outpost";
	icon = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	texture = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_milbase_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Military Base";
	icon = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	texture = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_seaport_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Seaport";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_RebalHQ_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Rebal HQ";
	icon = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	texture = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	markerClass = "A3AU_MRK";
	size = 36;
};

class A3AU_dealer_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Arms Dealer";
	icon = QPATHTOFOLDER(data\A3AU_dealer_mrk);
	texture = QPATHTOFOLDER(data\A3AU_dealer_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_radiotower_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Radio Tower";
	icon = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	texture = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_miladmin_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Military Admin";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_mrk);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_mrk);
	markerClass = "A3AU_MRK";
	size = 30;
};

class A3AU_miladmin_dead_mrk : A3AU_miladmin_mrk
{
	name = "Antistasi Military Admin (Dead)";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_watchpost_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Watchpost";
	icon = QPATHTOFOLDER(data\A3AU_watchpost_mrk);
	texture = QPATHTOFOLDER(data\A3AU_watchpost_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_roadblock_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Roadblock";
	icon = QPATHTOFOLDER(data\A3AU_roadblock_mrk);
	texture = QPATHTOFOLDER(data\A3AU_roadblock_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_antiair_mrk : A3AU_Factory_mrk
{
	name = "Antistasi AA Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antiair_mrk);
	texture = QPATHTOFOLDER(data\A3AU_antiair_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_antitank_mrk : A3AU_Factory_mrk
{
	name = "Antistasi AT Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antitank_mrk);
	texture = QPATHTOFOLDER(data\A3AU_antitank_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_hmg_mrk : A3AU_Factory_mrk
{
	name = "Antistasi HMG Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_hmg_mrk);
	texture = QPATHTOFOLDER(data\A3AU_hmg_mrk);
	markerClass = "A3AU_MRK";
};

class A3AU_fasttravel_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Fast Travel";
	icon = QPATHTOFOLDER(data\A3AU_fasttravel_mrk);
	texture = QPATHTOFOLDER(data\A3AU_fasttravel_mrk);
	markerClass = "A3AU_MRK";
	size = 32;
};

class A3AU_dealer_flag: flag_NATO 
{
	scope = 1;
	name = "Arms Dealer Flag";
	icon = QPATHTOFOLDER(data\A3AU_dealer_flag);
	texture = QPATHTOFOLDER(data\A3AU_dealer_flag);
	markerClass = "A3AU_MRK";
};
