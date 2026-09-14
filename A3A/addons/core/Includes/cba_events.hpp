#ifndef __HAVE_CBA_EVENTS_HPP__
#define __HAVE_CBA_EVENTS_HPP__

/**
 * CBA event name macros defined here
 *
 * Note the locality of events and their targets. Non-broadcast events sent by
 * a client to a client are usually limited to a player's machine whereas
 * broadcast events reach multiple machines. While server-to-client events might
 * always be regarded as broadcast events, in specific cases (e.g.
 * `CBA_EVENT_CLIENT_PLAYER_LOAD` or `CBA_EVENT_CLIENT_PLAYER_SAVE`), they are
 * targeted events from the server to a specific client.
 *
 * Relevant methods
 *   - A3A_fnc_addEventHandler - Subscribe to an event.
 *   - A3A_fnc_removeEventHandler - Unsubscribe from an event.
 *   - A3A_fnc_triggerGlobalEvent - Raises event on all machines including the
 *      local one.
 *   - A3A_fnc_triggerLocalEvent - Raises event on the local machine only.
 *   - A3A_fnc_triggerOwnerEvent - Raises a CBA event on the target client ID’s
 *      machine.
 *   - A3A_fnc_triggerRemoteEvent - Raises a CBA event on all machines, except
 *      the local one.
 *   - A3A_fnc_triggerResultEvent - Raises a local CBA event until the first
 *      subscriber function returns a non-nil value.
 *   - A3A_fnc_triggerServerEvent - Raises a CBA event on the server machine.
 *   - A3A_fnc_triggerTargetEvent - Raises a CBA event on all machines where an
 *      object is local.
 */

////////////////////////////////////////////////////////////////////////////////
///  CLIENT CBA EVENTS /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_BUILDER_ABORT
        Triggered when player aborts builder mode.

    Parameters:

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_BUILDER_ABORT QUOTE(TRIPLES(PREFIX_CONST,event,clientBuilderAbort))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_BUILDER_START
        Triggered when player starts builder mode.

    Parameters:
        0: builderPos - Center position (ATL) of builder sphere <ARRAY>
        1: builderRadius - Radius of builder sphere <NUMBER>

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_BUILDER_START QUOTE(TRIPLES(PREFIX_CONST,event,clientBuilderStart))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_HQ_PLACED
        Triggered when moving HQ is complete.

    Parameters:
        0: position - the new HQ position <ARRAY>
        1: player - the player who placed the HQ <OBJECT>

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        All machines including sender
    
    Replaces:
        "HQPlaced" event
------------------------------------------- */
#define CBA_EVENT_CLIENT_HQ_PLACED QUOTE(TRIPLES(PREFIX_CONST,event,clientHqPlaced))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_INIT_DONE
        Triggered after `A3A_fnc_clientInit` finished and client is fully set up.

    Parameters:
        None

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_INIT_DONE QUOTE(TRIPLES(PREFIX_CONST,event,clientInitDone))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_PLAYER_LOAD
        Triggered when the server loads players' personal save data.

        Subscribers should hook into this event to extract previously saved
        custom save data (via `CBA_EVENT_CLIENT_PLAYER_SAVE`) onto the player
        object.

    Parameters:
        0: saveData - player's custom save data <HASHMAP>

    See:
        CBA_EVENT_CLIENT_PLAYER_SAVE

    Example:
        (begin example)
        [CBA_EVENT_CLIENT_PLAYER_LOAD, {
            if !assert(params[
                ["_saveData", nil, [createHashMap]]
            ]) exitWith {};

            player setVariable["MyCustomVar1", _saveData get "MyCustomVar1"];
            player setVariable["MyCustomVar2", _saveData get "MyCustomVar2"];
        }] call A3A_fnc_addEventHandler;
        (end example)

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_PLAYER_LOAD QUOTE(TRIPLES(PREFIX_CONST,event,clientPlayerLoad))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_PLAYER_SAVE
        Triggered when the server saves players' personal save data.

        This event is broadcast to players when the server collects data to
        write into the save. Subscribers can augment the save data with their
        own custom data at that stage.

    Parameters:
        0: saveData - player's custom save data <HASHMAP>

    See:
        CBA_EVENT_CLIENT_PLAYER_LOAD
    
    Example:
        (begin example)
        [CBA_EVENT_CLIENT_PLAYER_SAVE, {
            if !assert(params[
                ["_saveData", nil, [createHashMap]]
            ]) exitWith {};

            _saveData set["MyCustomVar1", player getVariable "MyCustomVar1"];
            _saveData set["MyCustomVar2", player getVariable "MyCustomVar2"];
        }] call A3A_fnc_addEventHandler;
        (end example)

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_PLAYER_SAVE QUOTE(TRIPLES(PREFIX_CONST,event,clientPlayerSave))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED
        Triggered when the client changes teardown mode.

    Parameters:
        0: player - the player object <OBJECT>
        1: isInTeardownMode - whether the player is in teardown mode <BOOL>

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client
------------------------------------------- */
#define CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED QUOTE(TRIPLES(PREFIX_CONST,event,clientTeardownModeChanged))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_UNDERCOVER_CHANGED
        Triggered when the player changes undercover status.

    Parameters:
        0: undercoverStatus - the player's undercover status <BOOL>
        1: undercoverBrokenReason - the reason why the player's undercover
            status was broken <STRING> (optional)

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client

    Replaces:
        "Undercover" event
------------------------------------------- */
#define CBA_EVENT_CLIENT_UNDERCOVER_CHANGED QUOTE(TRIPLES(PREFIX_CONST,event,clientUndercoverChanged))

/* -------------------------------------------
    Event: CBA_EVENT_CLIENT_VEHICLE_BOX_RESTORE
        Triggered when a client triggers "restore nearby vehicles" at the
        vehicle box.

    Parameters:
        0: position - the position of the vehicle box <ARRAY>

    Broadcast:
        No

    Sent by:
        Client
    
    Recipients:
        Client
    
    Replaces:
        "vehicleBoxRestore" event
------------------------------------------- */
#define CBA_EVENT_CLIENT_VEHICLE_BOX_RESTORE QUOTE(TRIPLES(PREFIX_CONST,event,clientVehicleBoxRestore))

////////////////////////////////////////////////////////////////////////////////
///  SERVER CBA EVENTS /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_CREATE_REBEL_CONTROL
        Triggered when a rebel control (watchpost, emplacements, etc.) is
        established (i.e.: HC moved to task point and control is built).

    Parameters:
        0: marker - the marker of the rebel control <STRING>
        1: controlType - the type of control <STRING>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "RebelControlCreated" event
------------------------------------------- */
#define CBA_EVENT_SERVER_CREATE_REBEL_CONTROL QUOTE(TRIPLES(PREFIX_CONST,event,serverCreateRebelControl))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_ENTITY_POSTMORTEM
        Triggered when an entity dies.

    Parameters:
        0: entity - the entity that died <OBJECT>
    
    Optional:
        1: killer - the entity that killed the entity (if any) <OBJECT>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
------------------------------------------- */
#define CBA_EVENT_SERVER_ENTITY_POSTMORTEM QUOTE(TRIPLES(PREFIX_CONST,event,serverEntityPostMortem))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_INIT_AI_UNIT
        Triggered when an AI unit is initialized on the server.

    Parameters:
        0: unit - the AI unit object <OBJECT>
        1: side - the side the unit belongs to <SIDE>
        2: marker - the marker associated with the AI unit <STRING>
        3: isSpawner - if the unit is a spawner <BOOL>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "AIInit" event
------------------------------------------- */
#define CBA_EVENT_SERVER_INIT_AI_UNIT QUOTE(TRIPLES(PREFIX_CONST,event,serverInitAiUnit))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_INIT_AI_VEHICLE
        Triggered when an AI vehicle is initialized on the server.

    Parameters:
        0: vehicle - the AI vehicle object <OBJECT>
        1: side - the side the vehicle belongs to <SIDE>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "AIVehInit" event
------------------------------------------- */
#define CBA_EVENT_SERVER_INIT_AI_VEHICLE QUOTE(TRIPLES(PREFIX_CONST,event,serverInitAiVehicle))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_INIT_CIVILIAN_UNIT
        Triggered when a civilian unit is initialized on the server.

    Parameters:
        0: unit - the civilian unit object <OBJECT>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "civInit" event
------------------------------------------- */
#define CBA_EVENT_SERVER_INIT_CIVILIAN_UNIT QUOTE(TRIPLES(PREFIX_CONST,event,serverInitCivilianUnit))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_INIT_CIVILIAN_VEHICLE
        Triggered when a civilian vehicle is initialized on the server.

    Parameters:
        0: vehicle - the civilian vehicle object <OBJECT>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "civVehInit" event
------------------------------------------- */
#define CBA_EVENT_SERVER_INIT_CIVILIAN_VEHICLE QUOTE(TRIPLES(PREFIX_CONST,event,serverInitCivilianVehicle))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_INIT_DONE
        Triggered early after server has completed its preliminary
        initialization.

        Subscribers are executed in _scheduled environment_ after
        `serverInitDone` is set to true and broadcast and the startup state is
        set to "completed", but before loops and compatibility stuff happens.

    Parameters:
        None

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
------------------------------------------- */
#define CBA_EVENT_SERVER_INIT_DONE QUOTE(TRIPLES(PREFIX_CONST,event,serverInitDone))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_MARKER_CHANGE
        Triggered when marker ownership changes on the server.

    Parameters:
        0: marker - the marker that changed <STRING>
        1: winner - side of new owner <SIDE>
        2: loser - side of previous owner <SIDE>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "markerChange" event
------------------------------------------- */
#define CBA_EVENT_SERVER_MARKER_CHANGE QUOTE(TRIPLES(PREFIX_CONST,event,serverMarkerChange))

// UNUSED
#define CBA_EVENT_SERVER_GAME_SAVED QUOTE(TRIPLES(PREFIX_CONST,event,serverGameSaved))

/* -------------------------------------------
    Event: CBA_EVENT_SERVER_SPAWN_LOCATION
        Triggered when a location is spawned on the server.

    Parameters:
        0: location - the spawn location marker <STRING>
        1: locationType - the type of location being spawned <STRING>
        2: isSpawning - whether the location is currently being spawned (true)
            or despawned (false) <BOOL>

    Broadcast:
        No

    Sent by:
        Server
    
    Recipients:
        Server
    
    Replaces:
        "locationSpawned" event
------------------------------------------- */
#define CBA_EVENT_SERVER_SPAWN_LOCATION QUOTE(TRIPLES(PREFIX_CONST,event,serverSpawnLocation))

#endif // __HAVE_CBA_EVENTS_HPP__
