[] call SCRT_fnc_ui_clearRivals;

visibleRivalsMarkers = [];

private _knownLocations = ["KNOWN"] call SCRT_fnc_rivals_getLocations;
private _radiusOfOperations = call SCRT_fnc_rivals_getOperationRadius;

{
	private _localMarkerArea = createMarkerLocal [format ["%1rivalsradius%2", random 10000, random 10000], getMarkerPos _x]; 
	_localMarkerArea setMarkerShapeLocal "ELLIPSE"; 
	_localMarkerArea setMarkerSizeLocal [_radiusOfOperations,_radiusOfOperations]; 
	_localMarkerArea setMarkerTypeLocal "hd_warning"; 
	_localMarkerArea setMarkerColorLocal colorRivals; 
	_localMarkerArea setMarkerBrushLocal "BDiagonal"; 
	visibleRivalsMarkers pushBack _localMarkerArea; 

	private _localMarker = createMarkerLocal [format ["%1rivalsmarker%2", random 10000, random 10000], getMarkerPos _x];
	_localMarker setMarkerSizeLocal [1,1];
	_localMarker setMarkerAlpha 1; 
	_localMarker setMarkerTypeLocal "hd_flag";
	_localMarker setMarkerColorLocal "ColorRed";
	visibleRivalsMarkers pushBack _localMarker;
} forEach _knownLocations;

private _questionableLocations = (citiesX + (controlsX select {!(isOnRoad getMarkerPos _x)})) select {!(_x in _knownLocations) && {!(_x in rivalsExcludedLocations)}};

{
	private _localMarkerArea = createMarkerLocal [format ["%1rivalsunknownradius%2", random 10000, random 10000], getMarkerPos _x]; 
	_localMarkerArea setMarkerShapeLocal "ELLIPSE"; 
	_localMarkerArea setMarkerSizeLocal [_radiusOfOperations,_radiusOfOperations]; 
	_localMarkerArea setMarkerTypeLocal "hd_warning"; 
	_localMarkerArea setMarkerColorLocal colorRivals; 
	_localMarkerArea setMarkerBrushLocal "BDiagonal"; 
	visibleRivalsMarkers pushBack _localMarkerArea; 

	private _localMarker = createMarkerLocal [format ["%1rivalsunknownmarker%2", random 10000, random 10000], getMarkerPos _x];
	_localMarker setMarkerSizeLocal [1,1];
	_localMarker setMarkerAlpha 1; 
	_localMarker setMarkerTypeLocal "hd_unknown";
	_localMarker setMarkerColorLocal colorRivals;
	visibleRivalsMarkers pushBack _localMarker;
} forEach _questionableLocations;

[
	localize "STR_notifiers_info_type",
	format [(localize "STR_antistasi_rivals_show_activity_title"), A3A_faction_riv get "name"],
	parseText (localize "STR_antistasi_rivals_show_activity_hint"), 
	10
] spawn SCRT_fnc_ui_showMessage;
