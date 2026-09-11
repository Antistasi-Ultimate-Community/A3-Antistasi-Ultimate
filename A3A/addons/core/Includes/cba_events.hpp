#ifndef __HAVE_CBA_EVENTS_HPP__
#define __HAVE_CBA_EVENTS_HPP__

// Client-only event; after builder mode finished/aborted; params=[]
#define CBA_EVENT_CLIENT_BUILDER_ABORT QUOTE(TRIPLES(PREFIX_CONST,event,clientBuilderAbort))
// Client-only event; after builder mode started; params=[PositionATL builderPos, Number builderRadius]
#define CBA_EVENT_CLIENT_BUILDER_START QUOTE(TRIPLES(PREFIX_CONST,event,clientBuilderStart))
// Client-only event; after client initialization; params=[]
#define CBA_EVENT_CLIENT_INIT_DONE QUOTE(TRIPLES(PREFIX_CONST,event,clientInitDone))
// Client-only event; on personal save loaded; params=[Hashmap saveData]
#define CBA_EVENT_CLIENT_PLAYER_LOAD QUOTE(TRIPLES(PREFIX_CONST,event,clientPlayerLoad))
// Client-only event; on personal save; params=[Hashmap saveData]
#define CBA_EVENT_CLIENT_PLAYER_SAVE QUOTE(TRIPLES(PREFIX_CONST,event,clientPlayerSave))
// Client-only event; on teardown mode changed; params=[Object player, Boolean isInTeardownMode]
#define CBA_EVENT_CLIENT_TEARDOWN_MODE_CHANGED QUOTE(TRIPLES(PREFIX_CONST,event,clientTeardownModeChanged))

// Server-only event; on entity death; params=[Object entity[, Object killer]]
#define CBA_EVENT_SERVER_ENTITY_POSTMORTEM QUOTE(TRIPLES(PREFIX,event,serverEntityPostMortem))
// Server-only event; after server initialization; params=[]
#define CBA_EVENT_SERVER_INIT_DONE QUOTE(TRIPLES(PREFIX_CONST,event,serverInitDone))
// Server-only event; on game save; params=[]
#define CBA_EVENT_SERVER_GAME_SAVED QUOTE(TRIPLES(PREFIX_CONST,event,serverGameSaved))

#endif // __HAVE_CBA_EVENTS_HPP__
