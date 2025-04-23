
if (isNil "storedWorldName") then {
	switch (toLowerANSI worldName) do {
		case "cup_chernarus_a3":
		{
			storedWorldName = "Chernarus";
		};
		case "blud_vidda": 
		{
			storedWorldName = "Vidda";
		};
		case "cam_lao_nam": 
		{
			storedWorldName = "Cam Lao Nam";
		};
		case "vn_khe_sanh": 
		{
			storedWorldName = "Khe Sanh";
		};
		case "sefrouramal":
		{
			storedWorldName = "Sefrou Ramal";
		};
		case "esseker":
		{
			storedWorldName = "Esseker";
		};
		case "cam_lao_nam": 
		{
			storedWorldName = "Cam Lao Nam";
		};
		case "vn_khe_sanh": 
		{
			storedWorldName = "Khe Sanh";
		};
		case "gm_weferlingen_summer": 
		{
			storedWorldName = "Weferlingen";
		};
		case "brf_sumava": 
		{
			storedWorldName = "Šumava";
		};
		default
		{
			storedWorldName = toUpperANSI([worldName, 0, 0] call BIS_fnc_trimString) + ([worldName, 1, count worldName] call BIS_fnc_trimString);
		};
	};
};
storedWorldName

