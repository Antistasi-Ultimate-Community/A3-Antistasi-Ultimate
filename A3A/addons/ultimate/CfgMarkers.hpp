
class n_unknown;
class flag_NATO;

class A3AU_Factory_mrk : n_unknown
{
	scope = 1;
	name = "Factory";
	icon = QPATHTOFOLDER(data\A3AU_factory_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_factory_mrk.paa);
	color[] = { 0, 0, 0, 1 };
	shadow = 0;
	markerClass = "A3AU_MRK";
	size = 24;
	showEditorMarkerColor = 0;
};

class A3AU_airport_mrk : A3AU_Factory_mrk
{
    name = "Airport";
    icon = QPATHTOFOLDER(data\A3AU_airport_mrk.paa);
    texture = QPATHTOFOLDER(data\A3AU_airport_mrk.paa);
    markerClass = "A3AU_MRK";
};

class A3AU_city_mrk : A3AU_Factory_mrk
{
	name = "City";
	icon = QPATHTOFOLDER(data\A3AU_city_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_city_mrk.paa);
	markerClass = "A3AU_MRK";
	size = 20;
};

class A3AU_Resource_mrk : A3AU_Factory_mrk
{
	name = "Resource";
	icon = QPATHTOFOLDER(data\A3AU_resource_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_resource_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_outpost_mrk : A3AU_Factory_mrk
{
	name = "Outpost";
	icon = QPATHTOFOLDER(data\A3AU_outpost_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_outpost_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_milbase_mrk : A3AU_Factory_mrk
{
	name = "Military Base";
	icon = QPATHTOFOLDER(data\A3AU_milbase_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_milbase_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_seaport_mrk : A3AU_Factory_mrk
{
	name = "Seaport";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_RebelHQ_mrk : A3AU_Factory_mrk
{
	name = "Rebal HQ";
	icon = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk.paa);
	markerClass = "A3AU_MRK";
	size = 36;
};

class A3AU_dealer_mrk : A3AU_Factory_mrk
{
	name = "Arms Dealer";
	icon = QPATHTOFOLDER(data\A3AU_dealer_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_dealer_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_radiotower_mrk : A3AU_Factory_mrk
{
	name = "Radio Tower";
	icon = QPATHTOFOLDER(data\A3AU_radiotower_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_radiotower_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_radiotower_dead_mrk : A3AU_Factory_mrk
{
	name = "Radio Tower (Dead)";
	icon = QPATHTOFOLDER(data\A3AU_radiotower_dead_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_radiotower_dead_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_miladmin_mrk : A3AU_Factory_mrk
{
	name = "Military Admin";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_mrk.paa);
	markerClass = "A3AU_MRK";
	size = 30;
};

class A3AU_miladmin_dead_mrk : A3AU_miladmin_mrk
{
	name = "Military Admin (Dead)";
	icon = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_miladmin_dead_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_watchpost_mrk : A3AU_Factory_mrk
{
	name = "Watchpost";
	icon = QPATHTOFOLDER(data\A3AU_watchpost_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_watchpost_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_roadblock_mrk : A3AU_Factory_mrk
{
	name = "Roadblock";
	icon = QPATHTOFOLDER(data\A3AU_roadblock_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_roadblock_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_antiair_mrk : A3AU_Factory_mrk
{
	name = "AA Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antiair_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_antiair_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_antitank_mrk : A3AU_Factory_mrk
{
	name = "AT Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_antitank_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_antitank_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_hmg_mrk : A3AU_Factory_mrk
{
	name = "HMG Emplacement";
	icon = QPATHTOFOLDER(data\A3AU_hmg_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_hmg_mrk.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_fasttravel_mrk : A3AU_Factory_mrk
{
	name = "Fast Travel";
	icon = QPATHTOFOLDER(data\A3AU_fasttravel_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_fasttravel_mrk.paa);
	markerClass = "A3AU_MRK";
	size = 32;
};

class A3AU_dealer_flag: flag_NATO 
{
	scope = 1;
	name = "Arms Dealer Flag";
	icon = QPATHTOFOLDER(data\A3AU_dealer_flag.paa);
	texture = QPATHTOFOLDER(data\A3AU_dealer_flag.paa);
	markerClass = "A3AU_MRK";
};

class A3AU_destroyed_mrk : A3AU_Factory_mrk
{
	name = "Destroyed Marker";
	icon = QPATHTOFOLDER(data\A3AU_destroyed_mrk.paa);
	texture = QPATHTOFOLDER(data\A3AU_destroyed_mrk.paa);
	markerClass = "A3AU_MRK";
};
