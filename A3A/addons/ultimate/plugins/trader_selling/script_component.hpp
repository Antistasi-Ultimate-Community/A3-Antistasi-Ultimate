#define SUBCOMPONENT trader_selling
#include "..\plugin.hpp"

#define ADVANCED_SELLING_RANGE 50
#define DATA_IDX_SELLABLE 1

#define CBA_EVENT_CLIENT_TRADER_SELLING_GETITEMPRICE QUOTE(TRIPLES(SUBADDON,Events,clientTraderSellingGetItemPrice))
#define CBA_EVENT_SERVER_TRADER_RETURN_ARSENAL QUOTE(TRIPLES(SUBADDON,Events,serverTraderReturnArsenal))

// Reason codes for why items are considered unsellable

// REASON_INVALID: incorrect parameters to function call
#define REASON_INVALID -1
// REASON_FORBIDDEN: item is in the forbidden list and cannot be sold
#define REASON_FORBIDDEN -2
// REASON_UNLOCKED: item unlocked in arsenal
#define REASON_UNLOCKED -3
// REASON_UNCONFIGURED: item has no configured sell price
#define REASON_UNCONFIGURED -4
