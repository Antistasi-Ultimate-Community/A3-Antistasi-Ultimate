// Is an Antistasi flavour running with its world data ready?
// (towns list + faction templates + rebel side). This picks the
// integration path everywhere; outside Antistasi the Bazaar runs
// sandbox-style (any town, no undercover rule, no arsenal).
!isNil "citiesX" && {!isNil "A3A_faction_reb"} && {!isNil "teamPlayer"}
