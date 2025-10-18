params ["_squadLeader", "_caller", "_searchAction"];

/*  Searches a squadleader for small intel
*   Params:
*       _squadLeader : OBJECT : The unit (or body) which holds the intel
*       _caller : OBJECT : The unit which is searching
*       _searchAction : NUMBER : The ID of the action which started this script
*
*   Returns:
*       Nothing
*/

private _timeForSearch = 10 + random 15;
private _side = _squadLeader getVariable "side";

_caller setVariable ["intelSearchTime",time + _timeForSearch];
_caller setVariable ["intelAnimsDone",false];
_caller setVariable ["intelFound",false];
_caller setVariable ["cancelIntelSearch",false];
_caller setVariable ["A3A_searchedSquadLeader", _squadLeader];

_squadLeader setVariable ["intelSearchDone", true, true];

_caller playMoveNow selectRandom medicAnims;
private _cancelAction = _caller addAction [(localize "STR_cancel_search_action"), {(_this select 1) setVariable ["cancelIntelSearch",true]},nil,6,true,true,"","(isPlayer _this)"];

_caller addEventHandler
[
    "AnimDone",
    {
        private _caller = _this select 0;
        if (
            ([_caller] call A3A_fnc_canFight) &&                        //Caller is still able to fight
            {(time <= (_caller getVariable ["intelSearchTime",time])) &&     //Time is not yet finished
            {!(_caller getVariable ["cancelIntelSearch",false]) &&           //Search hasn't been cancelled
            {(isNull objectParent _caller)}}}                           //Caller has not entered a vehicle
        ) then {
            _caller playMoveNow selectRandom medicAnims;

            private _squadLeader = _caller getVariable ["A3A_searchedSquadLeader", objNull];

            if (!isNull _squadLeader) then {
                private _belongings = _squadLeader getVariable ["A3A_belongings", []];
                private _belongingsCount = round random [1,2,4];

                if ((count _belongings) < _belongingsCount) then {
                    private _position = [(getPos _squadLeader), 0.7, (random 360)] call SCRT_fnc_misc_extendPosition;
                    if (_squadLeader call SCRT_fnc_misc_isInHouse) then {
                        private _height = (getPosATL _squadLeader) select 2;
                        _position = [_position select 0, _position select 1, _height];
                    };

                    private _belonging = [
                        (selectRandom belongings),
                        _position,
                        (random 360)
                    ] call SCRT_fnc_misc_createBelonging;

                    _belongings pushBack _belonging; 
                    _squadLeader setVariable ["A3A_belongings", _belongings];
                };
            };
        }
        else {
            _caller removeEventHandler ["AnimDone", _thisEventHandler];
            _caller setVariable ["intelAnimsDone",true];
            if (
                ([_caller] call A3A_fnc_canFight) &&                //Can fight
                {!(_caller getVariable ["cancelIntelSearch",false]) &&   //Not cancelled
                {(isNull objectParent _caller)}}                     //Not in vehicle
            ) then {
                _caller setVariable ["intelFound",true];
            };
        };
    }
];

waitUntil {sleep 0.5; _caller getVariable ["intelAnimsDone", false]};

_caller setVariable ["intelSearchTime",nil];
_caller setVariable ["intelAnimsDone",nil];
_caller setVariable ["A3A_searchedSquadLeader", nil];
_caller removeAction _cancelAction;

private _wasCancelled = _caller getVariable ["cancelIntelSearch", false];
_caller setVariable ["cancelIntelSearch", nil];

if(_wasCancelled) exitWith
{
    [(localize "STR_intel_search_intel_header"), (localize "STR_cancel_search_tooltip")] call A3A_fnc_customHint;
    _caller setVariable ["intelFound", nil];
    _squadLeader setVariable ["intelSearchDone", nil, true];
};

if(_caller getVariable ["intelFound", false]) then {
    private _hasIntel = _squadLeader getVariable ["hasIntel", false];
    if(_hasIntel) then
    {
        [(localize "STR_intel_search_intel_header"), (localize "STR_intel_search_success_description")] call A3A_fnc_customHint;
        ["Small", _side] remoteExec ["A3A_fnc_selectIntel", 2];
        [5, _caller] call A3A_fnc_addScorePlayer;
        [50,_caller] call A3A_fnc_addMoneyPlayer;
    }
    else
    {
        [] call A3A_fnc_showNoIntelMessage;
    };
}
else
{
    _squadLeader setVariable ["intelSearchDone", nil, true];
};
_caller setVariable ["intelFound", nil];

private _bTimeOut = time + 60;
waitUntil {sleep 0.5; time > _bTimeOut};


private _belongings = _squadLeader getVariable ["A3A_belongings", []];
if (_belongings isNotEqualTo []) then {
    _nil = [_belongings] spawn {
        params ["_props"];
        sleep random [30,45,60];
        {deleteVehicle _x} forEach _props;
        terminate _thisScript;
    };
};
_squadLeader setVariable ["A3A_belongings", nil];