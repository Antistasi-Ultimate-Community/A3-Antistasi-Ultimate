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

// Client-only event; on personal save loaded; params=[Hashmap saveData]
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
        }] call FUNCMAIN(addEventHandler);
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
        }] call FUNCMAIN(addEventHandler);
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

////////////////////////////////////////////////////////////////////////////////
///  SERVER CBA EVENTS /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

// Server-only event; on entity death; params=[Object entity[, Object killer]]
#define CBA_EVENT_SERVER_ENTITY_POSTMORTEM QUOTE(TRIPLES(PREFIX,event,serverEntityPostMortem))

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

// UNUSED
#define CBA_EVENT_SERVER_GAME_SAVED QUOTE(TRIPLES(PREFIX_CONST,event,serverGameSaved))

#endif // __HAVE_CBA_EVENTS_HPP__
