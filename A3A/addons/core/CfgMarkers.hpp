class CfgMarkers 
{
	class flag_NATO;
	class n_inf;

	class A3AU_Total_Victory : n_inf
	{
		name = "Total Victory Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\TotalVictory.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\TotalVictory.paa);
	};

	class A3AU_Normal_Victory : n_inf
	{
		name = "Normal Victory Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\NormalVictory.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\NormalVictory.paa);
	};

	class A3AU_Economic_Victory : n_inf
	{
		name = "Economic Victory Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\EconomicVictory.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\EconomicVictory.paa);
	};

	class A3AU_Logistical_Victory : n_inf
	{
		name = "Logistical Victory Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\LogisticalVictory.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\LogisticalVictory.paa);
	};

	class A3AU_Political_Victory : n_inf
	{
		name = "Political Victory Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\PoliticalVictory.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\PoliticalVictory.paa);
	};

	class A3AU_Population_Death : n_inf
	{
		name = "Population Death Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\popDeath.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\popDeath.paa);
	};

	class A3AU_Human_Resource_Loss : n_inf
	{
		name = "Human Resource Loss Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\HRLoss.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\HRLoss.paa);
	};

	class A3AU_Financial_Loss : n_inf
	{
		name = "Financial Loss Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\financialLoss.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\financialLoss.paa);
	};

	class A3AU_Hardcore_Loss : n_inf
	{
		name = "Hardcore Loss Marker";
		icon = QPATHTOFOLDER(Pictures\Markers\hardcoreLoss.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\hardcoreLoss.paa);
	};

	class a3a_flag_aaf_torn_co: flag_NATO 
	{
		name = "AAF Remnants";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_aaf_torn_co.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_aaf_torn_co.paa);
	};
  
	class a3a_flag_natoandaaf_co: flag_NATO 
	{
		name = "NATO&AAF";
		icon = QPATHTOFOLDER(Pictures\Markers\NATO_AAF_Marker.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\NATO_AAF_Marker.paa);
	};

	class a3a_flag_natoandldf_co: flag_NATO 
	{
		name = "NATO&LDF";
		icon = QPATHTOFOLDER(Pictures\Markers\NATO_LDF_Marker.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\NATO_LDF_Marker.paa);
	};
	
	class a3a_flag_csatandaaf_co: flag_NATO 
	{
		name = "CSAT&AAF";
		icon = QPATHTOFOLDER(Pictures\Markers\CSAT_AAF_Marker.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\CSAT_AAF_Marker.paa);
	};

	class a3a_flag_natoanduna_co: flag_NATO 
	{
		name = "NATO&UNA";
		icon = QPATHTOFOLDER(Pictures\Markers\NATO_UNA_Marker.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\NATO_UNA_Marker.paa);
	};

	class a3a_flag_csatandsfia_co: flag_NATO 
	{
		name = "CSAT&SFIA";
		icon = QPATHTOFOLDER(Pictures\Markers\CSAT_SFIA_Marker.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\CSAT_SFIA_Marker.paa);
	};

	class a3a_flag_LRI: flag_NATO 
	{
		name = "LRI";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_lri_co.paa); 
		texture = QPATHTOFOLDER(Pictures\Markers\marker_lri_co.paa);

	};

	class a3a_flag_cdf: flag_NATO 
	{
		name = "CDF";
		icon = QPATHTOFOLDER(Pictures\Markers\cdf_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\cdf_ca.paa);
	};

	class a3a_flag_napa: flag_NATO 
	{
		name = "NAPA";
		icon = QPATHTOFOLDER(Pictures\Markers\napa_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\napa_ca.paa);
	};
	
	class a3a_flag_serbia: flag_NATO 
	{
		name = "Serbia";
		icon = QPATHTOFOLDER(Pictures\Markers\serbia_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\serbia_ca.paa);
	};

	class a3a_flag_chdkz: flag_NATO 
	{
		name = "ChDKZ";
		icon = QPATHTOFOLDER(Pictures\Markers\chdkz_co.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\chdkz_co.paa);
	};

	class a3u_flag_ija: flag_NATO 
	{
		name = "IJA Flag";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_ija_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_ija_ca.paa);
	};

	class a3u_flag_roc: flag_NATO 
	{
		name = "ROC Flag";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_roc_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_roc_ca.paa);
	};

    class loc_MilAdministration {
        color[] = {1,1,1,1};
        icon = QPATHTOFOLDER(Pictures\Markers\milAdministration_CA.paa);
        markerClass = "Locations";
        name = "Military Administration";
        scope = 1;
        shadow = 0;
        showEditorMarkerColor = 0;
        size = 24;
    };

	class a3u_flag_optre_unsc: flag_NATO 
	{
		name = "UNSC";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_unsc_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_unsc_ca.paa);
	};
	class a3u_flag_ascension_android : a3u_flag_optre_unsc
	{
		name = "Android";
		icon = QPATHTOFOLDER(Pictures\Markers\android_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\android_ca.paa);
	};
	class a3u_flag_ascension_vanguard : a3u_flag_ascension_android
	{
		name = "Vanguard";
		icon = QPATHTOFOLDER(Pictures\Markers\vanguard_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\vanguard_ca.paa);
	};
	class a3u_flag_optre_covenant: a3u_flag_optre_unsc 
	{
		name = "Covenant";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_covenant_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_covenant_ca.paa);
	};
	class a3u_flag_optre_insurrection: a3u_flag_optre_unsc 
	{
		name = "Insurrection";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_insurrection_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_insurrection_ca.paa);
	};
	class a3u_flag_nato_wa: a3u_flag_optre_unsc 
	{
		name = "Western Allies";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_old_nato_co.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_old_nato_co.paa);
	};
	class a3u_flag_soviet_ea: a3u_flag_optre_unsc 
	{
		name = "Eastern Allies";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_old_soviet_co.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_old_soviet_co.paa);
	};

	// This ukraine flag is for the STALKER modset, not current day ukraine
	// Please don't use it for current day, it desensitises people to the reality that ukraine is in a war
	class a3u_flag_stalker_ukraine: a3u_flag_optre_unsc 
	{
		name = "Ukrainian Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_ukraine_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_ukraine_ca.paa);
	};
	class a3u_flag_stalker_military: a3u_flag_stalker_ukraine
	{
		name = "Military Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_military_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_military_ca.paa);
	};
	class a3u_flag_stalker_monolith: a3u_flag_stalker_ukraine 
	{
		name = "Monolith Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_monolith_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_monolith_ca.paa);
	};
	class a3u_flag_stalker_loners: a3u_flag_stalker_ukraine 
	{
		name = "Loner Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_loners_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_loners_ca.paa);
	};
	class a3u_flag_stalker_duty: a3u_flag_stalker_ukraine 
	{
		name = "Duty Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_duty_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_duty_ca.paa);
	};
	class a3u_flag_stalker_bandits: a3u_flag_stalker_ukraine 
	{
		name = "Bandit Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_bandits_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_bandits_ca.paa);
	};
	class a3u_flag_stalker_ecologists: a3u_flag_stalker_ukraine 
	{
		name = "Ecologist Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_ecologists_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_ecologists_ca.paa);
	};
	class a3u_flag_stalker_clearsky: a3u_flag_stalker_ukraine 
	{
		name = "Clear Sky Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_clearsky_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_clearsky_ca.paa);
	};
	class a3u_flag_stalker_freedom: a3u_flag_stalker_ukraine 
	{
		name = "Freedom Flag (STALKER)";
		icon = QPATHTOFOLDER(Pictures\Markers\marker_freedom_ca.paa);
		texture = QPATHTOFOLDER(Pictures\Markers\marker_freedom_ca.paa);
	};
};