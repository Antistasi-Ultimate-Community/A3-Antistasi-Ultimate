
class n_unknown;

class A3AU_Factory_mrk : n_unknown
{
	scope = 1;
	name = "Antistasi Factory";
	icon = QPATHTOFOLDER(data\A3AU_factory_mrk);
	texture = QPATHTOFOLDER(data\A3AU_factory_mrk);
	color[] = { 0, 0, 0, 1 };
	shadow = 0;
	markerClass = "A3AU_Factory";
	size = 20;
	showEditorMarkerColor = 1;
};

class A3AU_Resource_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Resource";
	icon = QPATHTOFOLDER(data\A3AU_resource_mrk);
	texture = QPATHTOFOLDER(data\A3AU_resource_mrk);
	markerClass = "A3AU_Resource";
	size = 24;
};

class A3AU_outpost_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Outpost";
	icon = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	texture = QPATHTOFOLDER(data\A3AU_outpost_mrk);
	markerClass = "A3AU_Outpost";
	size = 24;
};

class A3AU_milbase_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Military Base";
	icon = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	texture = QPATHTOFOLDER(data\A3AU_milbase_mrk);
	markerClass = "A3AU_Milbase";
	size = 24;
};

class A3AU_seaport_mrk_B : A3AU_Factory_mrk
{
	name = "Antistasi Seaport Blufor";
	icon = QPATHTOFOLDER(data\A3AU_seaport_mrk_B);
	texture = QPATHTOFOLDER(data\A3AU_seaport_mrk_B);
	markerClass = "A3AU_seaport_B";
	size = 24;
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

class A3AU_airfield_mrk_B : A3AU_Factory_mrk
{
	name = "Antistasi Airbase Blufor";
	icon = QPATHTOFOLDER(data\A3AU_airfield_mrk_B);
	texture = QPATHTOFOLDER(data\A3AU_airfield_mrk_B);
	markerClass = "A3AU_airfield_B";
	size = 24;
};

class A3AU_airfield_mrk_O : A3AU_airfield_mrk_B
{
	name = "Antistasi Airbase Opfor";
	icon = QPATHTOFOLDER(data\A3AU_airfield_mrk_O);
	texture = QPATHTOFOLDER(data\A3AU_airfield_mrk_O);
	markerClass = "A3AU_airfield_O";
};

class A3AU_airfield_mrk_I : A3AU_airfield_mrk_B
{
	name = "Antistasi Airbase Independent";
	icon = QPATHTOFOLDER(data\A3AU_airfield_mrk_I);
	texture = QPATHTOFOLDER(data\A3AU_airfield_mrk_I);
	markerClass = "A3AU_airfield_I";
};

class A3AU_RebalHQ_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Rebal HQ";
	icon = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	texture = QPATHTOFOLDER(data\A3AU_RebalHQ_mrk);
	markerClass = "A3AU_RebalHQ_mrk";
	size = 36;
};

class A3AU_radiotower_mrk : A3AU_Factory_mrk
{
	name = "Antistasi Radio Tower";
	icon = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	texture = QPATHTOFOLDER(data\A3AU_radiotower_mrk);
	markerClass = "A3AU_radiotower";
	size = 24;
};
