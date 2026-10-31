params ["_mortar", "_crewGroup", "_supportName", "_sleepTime"];

/*  The routine which controls the mortar support in all aspects

    Execution on: Server

    Scope: Internal

    Params:
        _mortar: OBJECT : The actual mortar object
        _crewGroup: GROUP : The crewgroup of the mortar
        _supportName: STRING : The callsign of the support

    Returns:
        Nothing
*/

#include "..\defines.inc"
FIX_LINE_NUMBERS()

Info_1("Sleep time: %1",str _sleepTime);

//Sleep to simulate the time it would need to set the support up
sleep _sleepTime;

private _numberOfRounds = 4;
private _timeAlive = 900;

switch (inactivityLevelRivals) do {
	case 5: {
		_numberOfRounds = 2;
		_timeAlive = 1400;
	};
	case 4: {
		_numberOfRounds = round (random [2,2,4]);
		_timeAlive = 1200;
	};
	case 3: {
		_numberOfRounds = round (random [2,3,4]);
		_timeAlive = 1000;
	};
	case 2: {
		_numberOfRounds = round (random [3,4,6]);
		_timeAlive = 800;
	};
	case 1: {
		_numberOfRounds = round (random [4,5,7]);
		_timeAlive = 600;
	};
};
_mortar setVariable ["Callsign", _supportName, true];

Info_1("Number of rounds: %1",str _numberOfRounds);

//A function to repeatedly fire onto a target without loops by using an EH
_fn_executeMortarFire =
{
    params ["_mortar"];

    private _targets = _mortar getVariable ["FireOrder", []];
    private _target = _targets deleteAt 0;
    _mortar setVariable ["FireOrder", _targets, true];

    _mortar addEventHandler
    [
        "Fired",
        {
            params ["_mortar"];

            private _targets = _mortar getVariable ["FireOrder", []];

            if(count _targets == 0) exitWith
            {
                _mortar removeEventHandler ["Fired", _thisEventHandler];
                _mortar setVariable ["CurrentlyFiring", false, true];
                _mortar setVariable ["FireOrder", nil, true];

                private _supportName = _mortar getVariable "Callsign";
                [_supportName] spawn
                {
                    private _name = _this select 0;
                    sleep 60;
                    deleteMarker (format ["%1_targetMarker", _name]);
                    deleteMarker (format ["%1_text", _name]);
                };
            };

            private _target = _targets deleteAt 0;
            _mortar setVariable ["FireOrder", _targets, true];

            [_target, _mortar] spawn
            {
                params ["_target", "_mortar"];
                sleep 0.5;
                _mortar doArtilleryFire [_target, _mortar getVariable "shellType", 1];
            }
        }
    ];
    _mortar doArtilleryFire [_target, _mortar getVariable "shellType", 1];
};

private _targetList = server getVariable [format ["%1_targets", _supportName], []];
if (count _targetList > 0) then {
	private _target = _targetList select 0;
	private _targetParams = _target select 0;
	private _targetPos = _targetParams select 0;
	{ 
		[
			"RivalsActivityDetected", 
			[
				format [localize "STR_rivals_activity_header",  A3A_faction_riv get "name"], 
				format [localize "STR_rivals_activity_roving_mortar_description", A3A_faction_riv get "name"]
			]
		] remoteExec ["BIS_fnc_showNotification", _x];
	} forEach ((call BIS_fnc_listPlayers) select {side _x in [teamPlayer, civilian] && {(position _x) distance _targetPos < 100}});
};

_mortar setVariable ["CurrentlyFiring", false, true];
while {_timeAlive > 0} do
{
    if !(_mortar getVariable "CurrentlyFiring") then
    {
        //Mortar is currently not attacking a target, search for new order
        private _targetList = server getVariable [format ["%1_targets", _supportName], []];
        if (count _targetList > 0) then
        {
            //New target active, read in
            private _target = _targetList deleteAt 0;
            server setVariable [format ["%1_targets", _supportName], _targetList, true];

            Info_1("Next target is %1",_target);

            //Parse targets
            private _targetParams = _target select 0;
            private _reveal = _target select 1;

            private _subTargets = [];
            private _targetPos = _targetParams select 0;
            private _precision = _targetParams select 1;
            private _distance = random (125 - ((_precision/4) * (_precision/4) * 100));

            for "_i" from 1 to _numberOfRounds do {
                _subTargets pushBack (_targetPos getPos [random _distance, random 360]);
            };

            //Show target to players if change is high enough
            private _targetMarker = createMarker [format ["%1_targetMarker", _supportName], _targetPos];
            _targetMarker setMarkerShapeLocal "ELLIPSE";
            _targetMarker setMarkerBrushLocal "Grid";
            _targetMarker setMarkerSizeLocal [_distance + 25, _distance + 25];

            private _textMarker = createMarker [format ["%1_text", _supportName], _targetPos];
            _textMarker setMarkerShapeLocal "ICON";
            _textMarker setMarkerTypeLocal "mil_dot";
            _textMarker setMarkerTextLocal (localize "STR_marker_roving_mortar_target");

            //Makes sure that all units escape before attacking
            [Rivals, _targetMarker] spawn A3A_fnc_clearTargetArea;

			_targetMarker setMarkerColorLocal colorRivals;
            _textMarker setMarkerColorLocal colorRivals;
            _targetMarker setMarkerAlpha 1;
            _textMarker setMarkerAlpha 1;

            _mortar setVariable ["CurrentlyFiring", true, true];
            _mortar setVariable ["FireOrder", _subTargets, true];

            [_mortar] call _fn_executeMortarFire;
			_numberOfRounds = 0;
        };
    };

    //Mortar somehow destroyed
    if
    (
        !(alive _mortar) ||
        {({alive _x} count (units _crewGroup)) == 0 ||
        {_mortar getVariable ["Stolen", false]}}
    ) exitWith
    {
        ["TaskSucceeded", ["", format [localize "STR_notifiers_roving_mortar_crew_killed", A3A_faction_riv get "name"]]] remoteExec ["BIS_fnc_showNotification", teamPlayer];
        [10, 60] remoteExec ["SCRT_fnc_rivals_reduceActivity",2];
    };

    if (!(_mortar getVariable "CurrentlyFiring") && (_numberOfRounds <= 0)) exitWith
    {
        sleep _sleepTime;
        Info_1("%1 has no more rounds left to fire, aborting routine",_supportName);
    };

    sleep 5;
    _timeAlive = _timeAlive - 5;
};

//Mortar already destroyed
_mortar removeAllEventHandlers "Fired";

//Do not allow further shots and get the unit out
_crewGroup setCombatMode "GREEN";
doGetOut (units _crewGroup);
_crewGroup setBehaviour "SAFE";

_mortar setVariable ['isFireMissionEnded', true];

if({alive _x} count (units _crewGroup) != 0) then
{
    //Crew left, activating despawner
    [_crewGroup] spawn A3A_fnc_groupDespawner;
};

if(alive _mortar && {!(_mortar getVariable ["Stolen", false])}) then
{
    //Mortar left, activating despawner
    [_mortar] spawn A3A_fnc_VEHdespawner;
};

server setVariable [format ["%1_targets", _supportName], nil, true];
deleteMarker (format ["%1_targetMarker", _supportName]);
deleteMarker (format ["%1_text", _supportName]);

Info_1("Ended roving mortar and deleted data for %1",_supportName);
