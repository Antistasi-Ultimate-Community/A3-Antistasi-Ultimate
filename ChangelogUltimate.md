# 11

## 11.9.8

### New Factions:
N/A

### Faction Updates:
N/A

### Localization:
N/A

### New Maps:
N/A

### Map Updates:
N/A

### New Features:
N/A

### Fixed:
- Prevent RPT whitespace mayhem (#864)

- Fix carry detach (#866)
> Fixes releasing carried uncon body

- Fix UAV side check on DS (#867)
> This fixes the ability to garage manned UAVs when on a dedicated server

- Fix bad copy-paste / var name in fn_initObject (#868)
- Fix saving of utility items [fuel depot / drum, repair station, etc] (#869)
- Fix all "slUniform" to "slUniforms" (#871)

### Arms Dealer:
N/A

### Changes:
N/A

### Parameters:
N/A

## 11.9.7

### New Factions:
> - 3CBF Vanilla Civilian Template (#691)
>    - This adds a template for vanilla civilians with 3CBF vehicles.
> - Aegis Chernarus Defense Force 2035 (#769)
>    - https://steamcommunity.com/sharedfiles/filedetails/?id=2737653177

### Faction Updates:
> - Added more cargo nodes for CUP and fixed some missing vehicles. Added SFP cargo nodes. (#694)
>    - Added cargo nodes for many APCs, MRAPs, Armored vehicles and helicopters for CUP. Added SFP (Swedish Forces Pack) vehicles cargo nodes.
> - German names and currency (#756)
>    - Added list of German names and surnames, and this list is given to factions with German origin (all GM, CUP BW, BWA3). Also custom currency for Weferlingen maps set to Deutsche Mark.
> - AMF Update and Rework (#760)
>    - Updates AMF French Army factions for compatibility with latest AMF mod update. General rework of the factions to use new and / or renamed assets and swapped R3F dependency with NIArms.
>    - R3F is no longer a dependency. NIArms is added as a dependency.
> - Project RACS Template Updates (#765)
>    - General rework of PRACS RACS and SLA templates to fix missing classes, add new weapons and vehicles, and fix the flag textured.
> - WS update (#775)
>    - Many factions will now use additional vehicles from Western Sahara when loaded
> - NorAF Temperate Update (#785)
>    - Minor updates to Flex7103 Norwegian Armed Forces faction due to recent update
> - Logistics: BWMod (#787)
>    - Adds logistics cargo nodes for BWMod vehicles
> - Logistics: RHUSF MH-9M and its submodels (#789)
>    - Adds logistics cargo node for RHS MH-6M
> - Missing logistics for RF vehicles (#772)
>    - Adds cargo loading nodes for the missing Reaction Forces vehicles
> - Logistics: UK3CB SUV 4x4 (#786)
>    - Fixes for cargo nodes for all variants of 4x4 SUV in 3CBF
> - Give SMGs to every tier of Aegis NATO troops (#802)
>   - Adds SMGs to Aegis factions, should prevent issues with some units spawning without primary weapon
> - Logistics: RHSUSF Stryker vehicle (#805)
>   - Cargo nodes added to RHS Strykers to allow cargo loading
> - Misc OPTRE template updates and fixes (#815, #831, #846)
> - Misc bugfixes for lombakkan crisis (#847)
> - Add static AA weapon to CUP ACW Raven PMC rebel faction (#841)

### Localization:
> - Localization added for #729 (Parameters to disable virtual and physical artillery)
> - Localization for addActions for buyable items (#776)
>    - localization for carry, rotate, pack, unpack object and building placer and open doors actions.
> - Turkish translations (#807)
>   - Turkish translation added and/or updated for most of the mod
> - Russian localization fixes (#771)

### New Maps:
> - Drakovac Map (#746)
> - Green Sea 2023 Map (#818)

### Map Updates:
> - Add support for flag and ammo crate manual placement markers (#735)
>   - Mainly for map creators / porters to manually control flag and ammo / loot crate placement
>   - Fixes flag placement on Lingor (changes flag position for Airports 1, 2, 5, and 6) so they're not in the middle of the runway or otherwise inopportune locations

### New Features:
> - No flag yoinking (#649)
>    - Introduces a new (experimental) way to include more attackers/defenders into above outnumbering calculation by using a configurable radius around the flag to search for instead of or in addition to using the marker size.
> - Lockpicking for small groups (#737)
>    - Added lockpick items (single- or multi-use) usable by non-engineer players. Lockpick kits can be bought from arms dealer or spawned in Zeus.
> - Antistasi Zeus Units (#681)
>   - Adds Antistasi units, vehicles, groups, and support modules to Zeus
>   - Shows up in Zeus as `[A3U] Occupants`, `[A3U] Invaders`, `[A3U] Rebels`, `[A3U] Rivals`, `[A3U] Civilians`
> - Builder improvements continued (#767)
>    - Objects can be placed on top of another
>    - Adds decorations (misc small decor items) and chemlights boxes as builder boxes
>    - Prevents buildable objects from having weird collision interactions with other objects while placing them in build mode
>    - Reworks menus to organize buildable items in sub-menus
> - Teardown mode (#768)
>    - This PR introduces "teardown mode" which needs to be activated when on base to suppress the hold-action prompts you get all around the base when glancing at a built object. The "Destroy" hold-action will only show if teardown mode is on.
>    - Teardown mode is only available to engineers and can only be toggled if within HQ marker area.
> - Logistics: Cargo can block turrets (turn out seats) (#804)
>   - Added functionality for cargo loaded in vehicles to block vehicle turrets in addition to cargo seats. Only implemented (in this PR) for turn-out seats in some CUP APCs.
> - CBA settings to skip intro stuff (#808)
>   - Adds CBA settings to enable (or not) client init messages (e.g. "You have selected the commander role..." or "ACE items added to arsenal...") and to enable (or not) the intro orbiting UAV animation thing.
>   - Settings are stored in profileNamespace instead of missionNamespace so players can individually make their own decisions. Default settings (both enabled) do not change anything from how it currently is.
> - Added HUMONGOUS builder box (#809)
>   - Adds new large builder box with a $15k budget that can only be transportable via logistics system (cannot be carried / dragged by players)
> - Receive help from any nearby friendly units (#561)
>   - Downed AI (rebel and enemy) can now request help from any friendly AI near them, even if not in their own squad. Max distance configurable in parameters.
> - HQ vehicle spawn helper (#828)
>   - Adds entity to build box to control where vehicles spawn within a rebel garrison, similar to the AI assembly area sign. Vehicles spawned when creating high command or emplacement squads will now spawn near this entity if it exists, or fallback to legacy spawning logic.

### Fixed:
> - Better NVG dud(!?) detection (#575)
>    - Should improve the detection of cosmetic-only items in the NVG slot
> - UK3CB requirement in RHS US Army Arid (#762)
>    - Removed weapons in RHS US Army Arid template that required 3CBF
> - Underwater action for boxes in Airdrop mission (#774)
>    - Boxes dropped from planes (e.g. catch airdrop mission) should now get the action to salvage them if dropped in water
> - don't break resourceCheck with no miladmins (#777)
>    - resource check loop should no longer break when a map has no good military administration buildings. Should prevent issues where players do not gain rank, money, HR, campaign does not update, and everything else that happens every 10min doesn't happen.
> - "Buildings" inherited from ThingX loaded, but never saved again (#780)
>    - Should fix issue where some types of items built with the base builder didn't persist after multiple saves / loads (e.g. terrain manipulator objects)
> - Small config fix for plane loadouts (#783)
>    - fixes minor issues in code formatting for plane loadouts
> - Better radio detection (#793)
>   - Changed detection code to determine whether units have a radio to work in more cases.
> - GM config fixes size reduction (#795)
>   - Internal config rework to minimize file size, misc config fixes for GM vehicles, and allows AAF faction to use GM vehicles without needing to load GME mod
> - fnc_addVehicle double check (#796)
>   - should make garaging vehicles even more reliable
> - Fix rectangular marker corner detection (#797)
>   - Should fix issues with spawning logic for objects in corners of rectangular-shaped zones
> - Fix tower's turret and civ traffic placements (#798)
>   - Should fix issues with turrets too close to edge of towers and civ vehicles occasionally blowing up due to collisions on spawn
> - Fix antenna's posture (#799)
>   - Ensure radio towers are oriented vertically instead of angled on sloped terrain
> - Removed weird gray border in "unloadvehicle.paa" image (open arsenal for vehicle) (#801)
> - More resilient rival building finding (#803)
>   - Reworked building selection logic for rival cell leader placement. Should allow rival missions in more towns including completely ruined towns, and prevent mission from not fully executing / spawning when suitable building can't be found.
> - Prevent addVehicle from adding garage box itself (#810)
>   - The garage box can no longer be garaged
> - Fixes issue reported in [Bug]: Garbage Clean deletes the vehicles added to friendly sites (#825)
> - Look in staticsToSave, too, before cleaning vehicles (#827)
> - Avoid game startup RPT spam about undefined variable _revealedZones_ (#814)
> - Always store param presets in profileNamespace (#840)
>   - Fixes parameter presets not saving / loading correctly on DS
> - Unused variable cleanup and fallbacks in fn_resourcecheck (#819)
>   - Internal mod cleanup and variable initialization / checking to prevent weird situations from breaking resource check loop
> - Terrain smoother adjustments (#813)
>   - Should prevent weird terrain artifacts (holes / trenches) from being created when using terrain smoother items from builder box
> - Fix stringtables again (#844)
>   - Remove <English> tags in stringtables to prevent RPT spam and fix tooltip for self-revive methods parameter
> - Check for player having any toolkit for lockpick speed increase (#842)
>   - lockpicking speed increase will now apply when player has any of the toolkits defined in templates / supported by AU, not just the Vanilla toolkit
> - Incorrect instantiation of _travTime in CASApproach (#848)
> - Fix wrong classname used for some rebel template flags (#854)
>   - Fixes issues with rebel flags not being created at captured zones due to bug in faction templates
> - Various fixes after #549 and #751 (#849)
>   - Fixes misc lingering bugs in enemy air QRF routines

### Arms Dealer:
> - Update weapons dealer RHS config (#758)
>   - Some additional items added to RHS trader config (AK74m variants, 545x39 7N6M magazines, 9K38 and FIM92 magazines)
> - General Arms Dealer update (#761)
>    - Updated configs to balance some pricing errors and removed some missing NIArms classes.
> - FWA trader additions + price balance (#764)
>    - Balances FWA weapons against SOGPF & CUP and adds new weapons
>    - Adds handgun, launcher, and rifle grenade categories for FWA
> - WS update (#775)
>    - Additional vehicles from Western Sahara added to dealer

### Changes:
- Don't punish throwing grenades at HQ if under attack (#730)
> Players will not be punished for throwing grenades within 75m of rebel HQ, nor will the grenades be auto-deleted, if the HQ is under attack by an enemy faction.
- Radio keys save and load (#732)
> This adds enemy Radio Keys to the save and load routines (gained keys are saved between game sessions).
- Fix carrying/attached objects logic (Community #3210, Ultimate #733)
>  - Changed how the gamemode handles "is carrying" logic, to account for mods like HATG that have objects attached.
>  - Should fix various issues that all give the message "you have other things attached" when attempting to carry /  move Antistasi items (loot crate, etc).
- Don't force-add mags, med items, or misc essentials to AI loadouts unless they don't have *any* of the item type (#753)
>  - Previously they were auto-added in all cases, regardless of whether the loadout already included them (except for the toolkits and mine detectors). Now, these are only added if a loadout doesn't have any.
>  - E.g. if a medic loadout has 2 medkits saved, this will be respected and no more will be added; however, if a medic loadout has no medkits/ifaks/etc saved (or the various ACE gubbins when playing with ACE), they will be auto-added as before. Similar for the other item types.
> - Granular unit, vehicle (roadblock) creation (#763)
>    - Added granular unit tier spawning to many functions to allow some overlap between the succession of police/militia/military/elite units and vehicles.
>    - Changed the roadblock spawning logic. It now uses aggression to calculate the vehicle used, and war level to determine the garrison. The idea with "frontlines" is that they should have actual bunker checkpoints, and anything "inland" should be a mobile vehicular one.
> - Emplacements in roadblocks (#779)
>    - Statics and vehicles will now also save when left near any rebel emplacement, *except* for watchposts. The statics and vehicles can have AI allowed or disallowed to use them, just like in any other zone.
> - Introduce "canCouple" node flag to allow for multiple cargo planes (#790)
>    - adds additional functionality for developers to more precisely control logistics cargo nodes for vehicles
> - Code changes for feature donations/extenders (#770)
>   - Internal code rework to standardize macros and make porting CBA-standardized code easier, changes to some logging calls, and new events system for extenders to hook into.
> - Additional Parameters Functionality and Misc SetupGUI Updates (#666, #861)
>   - Adds parameter preset functionality, allowing players to save and load custom presets for all game setup parameters, or select a combination of player group size and desired difficulty for recommended parameter settings
>   - Adds parameter search bar
>   - Fixes misc bugs with setup UI
>   - Moves additional content checkboxes to factions tab and moves start game button to top tab bar
> - Allow hangar population if inside the outpost (#800)
>   - Added functionality to populate hangars with planes if they are inside the outposts marker.
> - Moved teardown mode toggle from scroll-menu to rebel+commander menu #829
> - Paradrop adjustments (#751)
>   - Changed drop sequence, water checks, physics
> - Make builder boxes make sense (#812)
>   - Cosmetic changes to build proxy boxes; relation between build price and proxy size fixed
> - Combat landing script adjustments (#549)
>   - fine tuning to air vehicle approaches and reduced amount of fastroping
> - Hakon's Garage parity update AU 11.9 / Community 3.11 (#852)
>   - Ports the following changes from Official Antistasi Community version of Garage for APL-ND compliance
>   - #3815: Fix garage static mounting not working on DS
>   - #3800: Ammo Rework (only the garage parts)
>   - #3818: Make HR Garage work in SP (only the garage parts)
>   - #3824: Reduce vehicle state and make it work for any parked rebel vehicle (only the garage parts)
>   - #3823: Make UAVs garageable (replaces previous AU hack)
>   - #3838: Various pylon fixes involving use of getAllPylonsInfo (only the garage parts)
>   - #3873: 3.11.0 Testing Fixes 3 (only the garage parts)
>   - **Note:** In Antistasi Ultimate, *all* UAV type vehicles will be automatically crewed by AI when placing from the garage or arms dealer. If they are a type of land vehicle / static weapon, they will get the option to allow or prevent AI manning them. If a radar, when manned by AI they will automatically scan the horizon looking for threats.
> - Updated images (#845)
>   - Updated AU loading screen images

### Parameters:
- No flag yoinking (#649)
>  - Name: Location defense/capture area | Location: Experimental Parameters | Description: When capturing/defending locations, use an additional circular area diameter around the flag AND the full zone size to consider unit presences.
>  - Should allow rebel units dispersed around a location to count as defenders so flags surrounded by defensive units can't be captured as easily; HOWEVER, also applies to enemy-held locations, forcing players to clear them out more thoroughly.
- Parameters to disable virtual and physical artillery (#729)
>  - Name: Disable PATCOM/Virtual Artillery | Location: Experimental Parameters | Description: Disables virtual and PATCOM artillery. Virtual artillery is artillery that technically exists in the world, but can't reasonably be countered. PATCOM artillery is the AI handler for physical artillery, resulting in unfair accuracy and reaction.
>  - Name: Disable Physical Artillery | Location: Experimental Parameters | Description: Disables physical artillery from being utilised by enemies. Does not disable artillery missions.
>  - Added params to disable physical and virtual artillery, for those who don't like being bombed ruthlessly by an omnipotent force without a counter in sight.
- Lockpicking param for civilian vehicles (#731)
>  - Name: Enable Civilian Vehicle Locks | Location: Loot Parameters | Description: Should unoccupied civilian vehicles be locked automatically, requiring lockpicking by an engineer rebel?
>  - Adds a new parameter to control whether civilian vehicles should be locked and require lockpicking to steal, similar to the same functionality for enemy vehicles.
- Lockpicking for small groups (#737)
>  - Name: Allow Lockpick Kits | Location: Experimental Parameters | Description: Allow non-engineer players to use lockpick kits to unlock vehicles
>  - Name: Lockpick Kit Break Chance | Location: Experimental Parameters | Description: Chance that a lockpick kit will break upon use
> - Receive help from any nearby friendly units (#561)
>   - Name: Allow AI to revive friendly unconscious units outside their squad within a set distance | Location: Experimental Parameters | Description: When enabled, if downed AI cannot be revived by any unit within their own squad, other friendly units within this many meters will attempt to revive them. AI will not revive units of another side.

## 11.8.8

### New Factions:
N/A

### Faction Updates:
N/A

### Localization:
N/A

### New Maps:
N/A

### Map Updates:
N/A

### New Features:
N/A

### Fixed:
> - Should *actually* fix `fn_missionRequest` breaking when selecting conquest mission, causing Petros to stop giving missions automatically or when prompted.
> - A few misc fixes for AI grenadier loadouts causing some players to be unable to create or edit loadouts for grenadiers, and potentially causing some grenadiers to not get a loaded magazine for their primary weapon.

### Arms Dealer:
N/A

### Changes:
> - Remove "Randomize Uniforms" button from commander menu since it doesn't actually do anything anymore

### Parameters:
N/A

## 11.8.7

### New Factions:
N/A

### Faction Updates:
N/A

### Localization:
- misc 11.8.7 fixes (#734 / #747)
> Add localization for all stringtable entries that used to be just "Placeholder"


### New Maps:
N/A

### Map Updates:
N/A

### New Features:
N/A

### Fixed:
- cba_optics_fnc_restartCamera undefined in bare minimum runs (#739)
> Fixes non-critical errors after closing commander / rebel menu when running without CBA optics
- misc 11.8.7 fixes (#734)
>  - Fixes rebel marker despawn when entering a vehicle that AI are manning
>  - Fixes CUP TKM and RHS NAPA flag textures
- Fix mission request break when no near markers for conquest (#741)
> Ability to request mission from Petros should not break after requesting a conquest mission when not in range of a suitable enemy location to conquer.
- Don't open commander or battle menu while in zeus or arsenal (#742)
> Pressing the keys to open commander/rebel menu or battle menu (y-menu) should no longer open these menus when player is in the arsenal or using Zeus
- Fix preventing AI from manning weapons at emplacements (#743)
> AI at HMG/AA/AT emplacements should now man their weapons again (Whoops!)
- Save vehicle customization for "parked" vehicles and statics (#738)
> Persistence for changes to a vehicle's paint scheme and customization made in the garage
- Prevent automatic rearm after surrender (#745)
> When playing with ACE medical, enemy units that dropped their weapon before being downed or surrendering should not pick their weapon back up after being revived
- More vehicle to emplacement changes and fixes (#744)
>  - Fixes persistence for rebel vehicles regardless of whether AI are allowed to man them.
>  - Fixes persistence for rebel vehicles at *all* rebel-held markers, not just HQ
>  - Adds persistence for manual changes to manning state. E.g. with AI allowed to man vehicles by default, a change to not allow a specific vehicle to be manned will persist on marker load/unload and server reload.
>  - Adds AI ability to man static mortars (in addition to all the other static weapon types)
- Fix min items calculation in AI arsenal (#752)
> Check for unlocked magazines when selecting primary and secondary muzzle loaded magazine in the AI arsenal should no longer error out.

### Arms Dealer:
N/A

### Changes:
N/A

### Parameters:
N/A

## 11.8.6

### New Factions:
- N/A

### Faction Updates:
- N/A

### Localization:
- N/A

### New Maps:
- N/A

### Map Updates:
- N/A

### New Features:
- N/A

### Fixed:
- 11.8.6 Hotfix (#723)
> - ability to pull air vehicles from garage on dedicated server or when not the host
> - bad vest classnames in 3CBF ION Arid template
> - when using rebuild assets function, show "Nothing to rebuild" message when appropriate and don't charge faction money
> - revert erroneous change to Chernarus Autumn mission.sqm breaking the mission on that terrain
> - allow AI units to equip any primary weapon from initialRebelEquipment if they have no class-specific primaries available. [e.g. let medics have a bolt action rifle (usually categorized as a sniper rifle) if they have no SMGs / carbines available)]. Should fix issues with new games with very limited starting equipment. Only applies to primary weapons.
> - move extender params back to their own section in the params dropdown so they go in the right place instead of being appended under the development params
> - re-enable flag actions for static weapons (enable/disable AI, move static). The option to move statics was accidentally dropped in 376/718, this re-adds it by using the "static" case in fn_flagaction again.


### Arms Dealer:
- N/A

### Changes:
- AI Custom Loadouts Overhaul Changes:
> - change default for limiting weapons by AI class to off / no
> - Add new param to default custom loadouts to legacy behavior; that is, all tabs / items start as overridden / saved, and you can choose to not save (randomize) specific tabs / items. Default for the param is yes / on: legacy behavior

### Parameters:
- Extender params moved to their own section in the parameters dropdown (see above)
- New param for custom AI loadouts to save everything by default (see ab)

## 11.8.5

### New Factions:
- Flex7103 CUP Expansion Pack #589
> PLA, Finland, Spain and Poland
- Add Lombakkan Crisis #586
> North Lombakkan Armed Forces, South Lombakkan Defence Forces, Lombakkan Union Front, Bocano Armed Forces
- SPEX Update #624
> Commonwealth
- Multi Era Templates (#560)
> This adds 5 factions, combing WW2, Cold War and Modern equipment and vehicles to provide a unique experience. Varying dependencies depending on the template.
- [CUP] Altian Civil War (#587)
> CUP + https://steamcommunity.com/sharedfiles/filedetails/?id=3390585168 and dependencies

### Faction Updates:
- Estraria Update #625
> Updated Estraria Faction to work with the updated Estraria mod
- SPEX Update #624
> Updated SPEX Factions with Flying Legends/Secret Weapons Reloaded and Spearhead Expansion Vehicles optionals
- SMGs added to many templates (#419, #695)
- Global Mobilization 1.6 update new additions (#606)
- Legion Update 2.0 new classnames fixed (#615)
- FCE PLA more accurate equipment (#652)
- Swap static AA/AT classes (#715)
> fixes swapped class names for CUP Flex7103 Norwegian AF static AT and static AA launchers

### Localization:
- Translation for "#569" (#612)
- RU localization for #645 (#721)

### New Maps:
- Korsac Map Port #619
> Korsac & Korsac Winter
- Kingdom of Regero (Community #2195 > #2519 > #2788 > #2792 > #3489 > #3549 > Ultimate #616)
> Kingdom of Regero

### Map Updates:
- Update Yulakia (#692)
> Removed outpost 27, replaced by milbase 5 nearby. Add new resources, factories and outposts

### New Features:
- Vehicle to emplacement (#376, #718)
> Persist vehicles left near rebel held markers.
> Enable rebel AI to man vehicles (commander / gunner seat) left near friendly markers by default. Note that players can still enable or disable AI use of specific vehicles by interacting with the vehicle.
- Even more random events (#551)
> Adds new and / or slightly changes behavior of skirmish, ambush, post-battle, repair, medevac, and airdrop events
- Base builder / object placer rotation & alignment keybinds (#626)
> Adds keybinds to align object with another object and to snap rotate objects between configurable angles
- Base builder terrain object hiders (#627)
> Introduces rectangular and circular map object hiders for the base builder.
Once placed and built, they remove any terrain objects in their area.
- Add factory and resource rebuilding functionality to Rebuild Assets button (#654)
> Added rebel factory and resource rebuilding functionality to the Commander Menu > Rebuild Assets button to allow rebels to regain income from destroyed economy markers without having to first give those markers to the enemy for repairs.
- Show load information in AI loadout arsenal (#643)
> This PR shows load information in the arsenal to help avoid over-encumbering AI with custom loadouts.
- More artillery commands / messaging (#656)
> Adds more sidechat messages for artillery (shot over / out. splash over / out, rounds complete). Changes the responding unit to the actual HC firing unit instead of Petros.

### Fixed:
- Missing garage CBA settings strings #621
- Added missing staticMortars template value for Vanilla SDK rebels #648
- Fix AI Equipment Duplication Exploit #591
- Bank mission: vehicle not spawning with some templates (#622)
- Armored convoys: armored vehicle not spawning, completing the mission instantly (#653)
- Ensure garbage collections runs when called from commander menu (#646)
- Less RPT spam (#650)
- Don't allow rally point establishment while moving in a vehicle (#678)
- Don't cull buildingsToSave in garbage cleaner, unless limit lowered (#680)
> constructions from building box, zeus, or ace / grad trenches should no longer be deleted by the garbage cleaner, unless you set the max constructions parameter lower than previous value. Set the param to 0 to delete all constructions.
- Remove erroneous member param dropdown (#684)
- Fix params edit box check when client hosting (#671 / #686)
> Button to edit parameters while in game should now be available only to host on local client servers, or any admin on dedicated servers
- Fix bug with returning weapon(s) to crate when selling loaded mags (#673)
> Selling magazines to arms dealer should no longer eat your weapons
- Add player items to arsenal when quick-equipping (#6744)
> Non-unlocked items in player inventory should be automatically moved to the rebel arsenal when using 'quick equip loadout' feature
- Ensure AI loadouts (or quick-equip loadouts) get map/compass/watch (#699)
- Fix launcher magazine detection in arsenal / rebelGear generation (#703)
> Should fix issues with unlocked launchers with ammo in arsenal not being equipped by AI
- Don't show lockpick prompt when in a vehicle (#713)
- Restart CBA optics camera after using commander menu (#709)
> should fix 3D optics being broken after using commander menu
- [BUG] Fix nil template values (#706)
- Don't show builder prompts when in a vehicle (#701)
- Weird doubled ";;" (#690)
- Ensure hummingbird helis get backseats to avoid issues with not enough seats for AI groups (#719)


### Arms Dealer:
- Movable gear/weapon store dialog #604
- DLC/MOD icons to the vehicle store #605
- GM gear store update #610
- Added support for Modern Pistol Pack (#628)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3157163173
- Added support for Scifi Vehicles Pack (#642)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3539476763

### Changes:
- AI Custom Loadouts Overhaul (#590)
> Various changes around limiting equipping AI custom loadouts with non-unlocked items, limiting which classes can be equipped with weapon types. Allows AI custom loadouts to support 'partial' custom loadouts with some equipment manually set and others still randomized.
- Show arsenal update message until acknowledged (#714)
> Shows message to players informing them of changes to AI custom loadout arsenal functionality
- Increase distance threshold when validating fast-travel map-clicks (#651)
> Should make the fast-travel location selection less finicky / easier to click without having to zoom in the map as much.
- There is _always_ intel to be found (#645)
> Adds numerous detailed strings for items found when nothing of significance is found searching civilians for intel. Stops civilians from giving trader intel when trader is disabled.
- Use cursorTarget instead of cursorObject for garaging vehicles (#667)
> Should make garaging vehicles / statics more reliable
- Edited GitHub mod README and changelogs, internal addon re-organization, internal logging cleanup and additional logging for chooseAttack function (#683)
> Hopefully will provide some insight into invader "steam-rolling" occupants in mid-game
- Speculative invader spam fix (#585)
> ICW #683, also re-enables occupant and invader factions sending convoys to cities when a more suitable target marker is not found or punishments are not yet allowed. Hoping it will alleviate invader spam / "steam-rolling" issues
- Garage parity update (#707, Official Antistasi Community #3626, #3663, #3688, #3704, #3721)
> Brings Hakon's garage in Antistasi Ultimate to parity with the version in Antistasi Community (APL-ND compliance)
> Track ammo cargo for garage vehicles and for sold ammo crates
> Helipad compatibility with community garage changes
> Fixed some bugs: Utility items in ACE cargo would be lost (well, underground) on garaging. Garaging a vehicle with a quadbike on it could ignore garage caps and lose the quadbike's items. It was possible to garage an object while loaded into a vehicle, causing desync of cargo slots.
> Compatibility with community flag access after capture changes
> [ENHANCEMENT] The placement radius when pulling stuff out of the garage varies depending on the type. The normal range is increased to 50 meters and the range for planes, helis, and boats is increased to 200
- Cleanup logging (#712)
> Misc changes to how and when logging messages are added to the RPT file depending on log level
- Air QRF (combat landing, fastrope) bug fixes (#704)
> Minor cleanup and refactor of QRFBehavior. Don't fastrope dead units. Refactor and reorder of combatLanding. Should (hopefully) prevent the most egregious bugs, e.g. failing to unload units altogether, taking off before finishing unload, and / or getting SAD waypoint before unloading units. More robust safe position finding and landing position blacklisting. All heli QRFs will attempt combat landing; if landing unsafe, fallback to fastrope. This does not prevent all heli crashes in heavily built-up or vegetated / forested areas, but it's generally a lot better imo.
- Lower amount of weapons from civ intel (#700)
> Getting weapons from talking to civilians is now much less likely, and if you *do* get them, the amount will generally be lower

### Parameters:
- Add Extender Params Section #598
- Added option for no death penalty (0% money loss) #629
- Garrison group size parameter #555
- Unlocked ENVGs option (#599)
> Allows / disallows unlocking of enhanced / thermal NVG items in the arsenal
- Add ability to view / change / save (some) params while in game (#597
> Button added to commander menu to load the params tab while in game. Not all params are able to be changed in game.
- Re-organize params menus (#655)
> Params are now organized into more appropriate categories
- Param to limit how often incap / uncon is triggered (#663)
> Two params added to modify the chance for rebel and enemy ai to become unconscious / incapacitated instead of killed when taking sufficient damage.

## 11.7.0

### New Factions:
- CUP CAF 2035 (#546)
> CUP + WS + https://steamcommunity.com/sharedfiles/filedetails/?id=3161388542 and dependencies

### Faction Updates:
- Aegis, SOGPF, Unsung (#533)
> Added correct/accurate unit names

- SOGPF (#533)
> Added the VN HM rival faction, based on the ARVN loadout.

- CWR Tonali face and voice changes (#532)

- SMGs added to Vanilla and Aegis unit templates (#540)

### Localization:
- Korean updates (#539, #593)

- English cleanup (#545)

### New Maps:
- Kunduz River (#529)
> Antistasi_kunduz_valley.kunduz_valley

### Map Updates:
- Chernarus 2020 (#573)
> fixed multiple vehicle markers

- Šumava (#521)
> General rework

### New Features:
- Functioning buildable helipads (#527)
> Allows you to build a helipad at HQ and use it for garaged aircraft

- Add ability to instantly garage vehicles at arms dealer (#525)
> "Takeaway"

- Add ability to sell vehicles on airfields (#522)

- Additional garage categories, general garage update (#315, Community #3378, #3219, #3524, #3561, #3575, #3587, #3526, #3598)

### Fixed:
- Prevent deletion of stolen mission vehicles in LOG_Crashsite (#536)

- heliSlingLoad, chemlight for cargo in LOG_Crashsite (#544)

- distanceMission * 2 problem (#552)

- Maxload calculation in arsenal, substitute buggy canAddItemTo* calls (#556)

- Base builder fixes, lockpicking on dead vehicles, staticsX restore order (#559)

- Add missing parameter to A3A_fnc_SUP_mortarRoutine call (#580)

- Side relations when using a different mode (#582)

### Arms Dealer:
- JCA Latest Update (#583)

- Remove missing Pedagne dealer items (#572)

### Changes:
- Use vehicle size for fast travel position search (#538)

- Normalize item weights in A3A_rebelGear (#566)

- Replace hard-coded keys with custom keybinds for building placer (#558)

- Cargo nodes, mouse cursor center, enhance danger close detection (#570)

- Crashsite data location indication, object placement improvements (#542)

- Mod warnings for exile, lifeline revive (#564)

- Leftover blackmarket vehicle update (#535)

- More vehicle variety in convoy mission (#524)

- More CUP and PRACS logistics nodes (#568)

- Weighted vehicle spawn pool for airbases (#456)
+- Attack UAVs to CAS functions (#459)
> Introduces a new parameter, "UAV spawn chance" which affects general air UAV spawnrates

- Unlock limited weapons from civ interaction; unlock magazines with them (#581)

- Allow rivals when invaders are disabled, misc setupGUI updates (#565)

- Allow to unflip air/sea vehicles (#543)
> Flip twice to acknowledge the confirmation and go ahead with it

- Prevent garrison units from mounting ACE loaded static emplacements (#571)
> Attempt no.2

### Parameters:
- Pistol start param (#520)

- Experimental parameter for ignoring AFK while Zeusing (#562)
> Prevents AFK timer from affecting players actively using Zeus

- Guided launchers & explosives respect unlock params (#569)

## 11.6.0

### New Factions:
- SPE + SPEX Templates (#466)

- RHS Green Sea Battalion (#440)
> https://steamcommunity.com/workshop/filedetails/?id=2899715306, with optional https://steamcommunity.com/sharedfiles/filedetails/?id=2872102180

### Faction Updates:
- 3CB Factions (#503)
> Added accurate names

- 3AS Factions (#507)

- OPTRE (#514)
> Removed the escape pod from possible drop pod mission vehicles

### Localization:
- Various English updates (#464)
- Various Simplified Chinese updates (#482)
- Various Korean updates (#526)

### New Maps:
- Isla Duala (Community #2866 > #3076 > #3424 > #3448 > #3463, Ultimate #511)
> Antistasi_isladuala3.isladuala3

### Map Updates:
N/A

### New Features:
- "Quick Equip Loadout" for arsenal (#477)
> Quickly gives you a loadout based on your role

- Simple civilian dialogue (#446)

- Enemy vehicle locks (#496)
> The enemies have now figured out how to lock parked vehicles, you may lockpick them as an engineer (param is also available to turn off).

### Fixed:
- Prevent garrison units from mounting ACE loaded statics (#478)

- Supply convoy spamming every ~minute (#485)

- AI loadouts can no longer use a non-unlocked magazine (#500)

- Relevant texts should now use the correct currency symbol (#501)

- Fast travelling to the trader before found (#508)

- Inability to undercover within friendly airport (#515)
> Needs feedback. Inability to go undercover can technically still occur if an airport is right next to another zone.

- Server autoload init hang (#519)
> Should now allow the init to continue as normal if a member isn't present during init after autoload 

- Donating money to faction/player (#523)
> If you are donating to player and blocked by something it should no longer send money to faction as a fallback, instead giving a hint

### Arms Dealer:
- Changed HQ/BM price calculation (#510)
> If a vehicle is in both the HQ store and BM store, it should choose the lowest price between both

- Prevent vehicles blowing up (#495)
> The dropdown menu should not have any options until the entire store has loaded, preventing duplicate boxes

- The trader locate mission should now be a vague area (#509)

### Changes:
- SetupGUI Overhaul (#483)
> Needs feedback on a linux DS. If the server is linux based, the "New Save Method" option should be locked.

- Miscellanous flag/icon changes in the Setup GUI (#481)

- AI Rearm functionality (#463)
> Should now be weighted in the same way as weapon selection

- Lootcrate improvements when using ignore unlocked items (#494)
> Weapons with attachments should now be picked up, even if the base weapon is unlocked

- Rebel AI weapon improvements, pistol support (#418)
> Rebel AI can now use attachments and pistols in their auto-generated loadouts.

- Improved FT restrictions for HC groups (#460)
> Enemy check will only check for enemies for HC squad, not commander
> Allow FT for HC squad even if commander is not driver of their vehicle

- Improved the "Time to rest" and fog/overcast sliders of the commander UI (#502)

- When purchasing a drone friendly AI should automatically be added (#506)
> Also should remove any AI when trying to garage a drone

- The main menu should now be able to be disabled via another addon (#437)
> Add a file in your addon with the prefixed path: \x\A3A\addons\menu\.disable

- "Mines" should now be auto-detected from config rather than hardcoded in templates (#469)

### Parameters:
- Loadouts to generate parameter (#462)
> If increased, will slightly increase load times but will make Occ/Inv/Civ AI more varied

- Arms Dealer parameters (#465)
> Black Market Discount (Vehicle)
> Black Market Discount (Weapon)

- UAV AFK parameter (#461)
> Toggles if AFK checks will be evaluated when using a UAV

## 11.5.4

- Fixed an issue preventing players from releasing surrendered AI

## 11.5.3

### Fixed:
- Potential fix for MilAdmins being destroyed/captured immediately (#484)
- Fixed an issue with itemArrayWeight (#480)

### Changes:
- Changed the AU Anomaly settings (#475)
> Minimum value is now 100
> A cap setting now exists

- Setup GUI Parameters (#467)
> Moved categories to a dropdown list

- Reworked "Recruit AI to squad" (#472)
> Param is now off by default and a seperate action is created on AI when recruit to squad is enabled
> Despawning AI should no longer happen

## 11.5.2

### New Factions:
- CUP Estraria (#422)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3092603536
> (Optional) https://steamcommunity.com/sharedfiles/filedetails/?id=3166101633

### Faction Updates:
- Vanilla/CDLC inclusion weights (#374)
> Included/enabled DLC content is now weighted. This should show a more "even" or "uneven" distribution of weapons and gear.

- SOGPF ARVN, MACV, PAVN (#443)
> Fixed an issue where police forces wouldn't use their correct weapons

- Warmantle Empire (#451)
> Changed militia to imperial army troopers

### Localization:
N/A

### New Maps:
- Stubbhult (#404)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3353189981

- Fapovo (#399)
> https://steamcommunity.com/sharedfiles/filedetails/?id=1910457930

### Map Updates:
- All maps (#453)
> Updated to 32 player slot layout; 1 DC, 4 TL, 10 R, 4 AR, 4 GREN, 5 CLS, 4 ENG

### New Features:
- Air Patrols (Community #3208, Ultimate #312)
> Currently only added to: CUP, RHS, Vanilla, WS

- Mod/DLC icons for Arsenal (#396)

- Recruit surrendered AI to squad parameter (#435)
> Requirements: Enable parameter, successfully recruit a surrendered AI, have less than 10 AI in your squad.

- Add ability to edit a weapons loaded magazine in the Limited Arsenal (#433)
> Adds ability to edit weapon magazines (main magazine and underbarrel) within the arsenal, similar to ACE3 arsenal

- Turret Magazine Repacking (#410)
> If enabled in parameters, improves turret reloads by repacking all mags.

### Fixed:
- Artillery range issue (#429)
> Prevented all forms of artillery from firing properly

- Rivals transfer mission (#414)

- Helicopters sometimes not having a pilot (#417)

- DLC Addon vehicle packs (#424)

- Fixed a rival progression softlock (#458)

- Fixed Petros not being Petros (#468)

- Fixed an issue with attacks when futuristic supports are enabled (#470)

### Arms Dealer:
- HAFM Arms Dealer Fixed (#425)

- JCA Arms Dealer (#432)
> Added UMP and new accessories

### Changes:
- Improved rebel weapon selection (#427)
> Rebel AI should start to use "better" weapons as you unlock them, based on many factors. Might not work perfectly for every faction/weapon.

- Vehicle variety in destroy artillery mission (#420)
> Possible vehicles for the mission is now: Howitzers, Mortars, Artillery Vehicles

- Updated 3CB and RHS logistics nodes (#442)

- Build Box Improvements (#455)
> Changed how construction saving works, now buildings should be saved anywhere (except on roads, unless the param is turned on)
> Changed how TTB (time to build) is calculated, now using a parameter
> Added a "Build limit" parameter

- Civ related events should no longer occur in non-civilian templates (#458)

- Removed UAV's from the spawnpool of airbase vehicles (#458)

### Parameters:
- Disable "Smoke Cover" parameter (#413)
> Helps with performance during events like QRFs when they like to use smokes

- Loot Crate Distance Increase (#439)
> 10, 25, 50, 75, 100, 200, 300, 400

- Added a "Experimental" parameter category (#455)

## 11.4.2

- Changed UAV weights to stop UAV support spam, moved the UAV support to unfair (#416)

## 11.4.1

- Fixed some crashing/faction issues (#409)
> Vanilla_Riv_Remnants
> Vanilla_AI_CSAT_Temperate
> WS_NATO&UNA
> WS_AI_CSAT&SFIA
> WS_AI_NATO&UNA

## 11.3|4.0

### New Factions:
- Norwegian Armed Forces Support (#335)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3333292879 (Requires CUP Weapons, Vehicles and Units)
> Optional: https://steamcommunity.com/workshop/filedetails/?id=826911897

- HAFM Support (#340)
> https://steamcommunity.com/workshop/filedetails/?id=862564410 (Requires CUP Weapons, Vehicles and Units)

- SFP Finnish Forces Support (#341)
> https://steamcommunity.com/sharedfiles/filedetails/?id=917042703 (Requires CUP Weapons, Vehicles and Units)

- CUP NATO (#349)
> Combines existing BAF, BW, USA and CZ factions in the CUP modset

- Expeditionary Forces MJTF (Community #3441, #3442, Ultimate #403)
> https://store.steampowered.com/app/2647830/Arma_3_Creator_DLC_Expeditionary_Forces/

### Faction Updates:
- EAW Japan
> Updated their available planes

### New Maps:
- Chernarus Redux (#368)
> https://steamcommunity.com/sharedfiles/filedetails/?id=1128256978
> Antistasi_chernarusredux.chernarusredux

### Fixed:
- Weapon sway default fix (#339)
- HR Low warning not showing to all clients (#339)
- Tags error fix (#370)
- Wind param fix (#370)
- No driver in convoy fix (#370)
> If a vehicle doubled in a main faction and in a rival faction then it couldn't decide which driver to spawn

- Fixed an issue where armoured helmets were unlocked by default (#379)
- Add missing variable to airspaceControl (#380)
- Fixed rival invincibility in "Transfer" mission (#395)

### Arms Dealer:
- JCA Arms Dealer Support (#337)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3333302397

- Project Infinite Arms Dealer Support (#338)
> https://steamcommunity.com/workshop/filedetails/?id=807038742

- YLArms Arms Dealer Support (#348)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3052209341

- Expeditionary Forces Support (#397)
> https://store.steampowered.com/app/2647830/Arma_3_Creator_DLC_Expeditionary_Forces/

### Changes:
- Changed how economic victory works (#339)
> Instead of needing 2 million in all maps now there is a calculation that sets the needed amount 
> Number of resource zones * 100,000

- HQ vehicle store UI category changes (#248)
- Air vehicle access on milbases (#282)

- Transition to diwako anomalies rework (#377)
> The normal diwako anomalies mod will have to be replaced with the rework mod to continue working in AU:
> https://steamcommunity.com/sharedfiles/filedetails/?id=3351980695

- Main Menu Update (#342)
> Removed random background selection
> Added cba setting to select desired background image (or lack of)
> Removed unwanted main menu flashbang "feature"

- Fix arsenal not clearing client IDs on disconnect (Community #3397, Ultimate #311)
- Fix precedence error in mortar/arty support routine (Community #3418, Ultimate #311)
- Implement mortar/artillery support ranging shot and walking barrage (Community #3388, Ultimate #311)
- Improve getArtilleryRanges, fix IFA mortar case (Community #3266, Ultimate #311)
- Make dive bomb runs less accurate against infantry targets (Community #3372, Ultimate #311)
- Replace all uses of inconsistent GETOUT waypoints (Community #3375, Ultimate #311)
- Seaport Ammobox Protection (Community #3369, Ultimate #311)
- Workaround Arma bug with CDLC detection (Community #3364, Ultimate #311)
- Create new classes for Antistasi AI units (Community #3349, Ultimate #311)
- Make artillery rotate to target before firing (Community #3231, Ultimate #311)
- Changed BIS_fnc_compatibleItems to script command (Community #3207, Ultimate #311)
- Fix case where seats may not be unlocked when dead crew are deleted (Community #3205, Ultimate #311)
- Prevent concurrent attacks and add a planning cost (Community #3273, Ultimate #311)

- Add names for templates (#346)
> Most templates will now use "correct" names for units, such as proper english names for NATO
> Extender developers can now use `"Name" call _fnc_saveNames;` in templates where "Name" is an entry from CfgWorlds >> GenericNames

### Parameters:
- Fast travel enabled only between major locations (#332)
> New fast travel option which only allows teleportation between airports/military bases/HQ/trader and to rally point.

### Note:
- The following extensions by Hophri are now obsolete as they have kindly been merged into Ultimate:
> A3UE - (CUP) HAFM - https://steamcommunity.com/sharedfiles/filedetails/?id=3336955114
> A3UE - Project Infinite - https://steamcommunity.com/sharedfiles/filedetails/?id=3337103070
> A3UE - JCA Infantry Arsenal - https://steamcommunity.com/sharedfiles/filedetails/?id=3334014032

# New Factions:
- Norwegian Armed Forces Support (#335)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3333292879 (Requires CUP Weapons, Vehicles and Units)
> Optional: https://steamcommunity.com/workshop/filedetails/?id=826911897

- HAFM Support (#340)
> https://steamcommunity.com/workshop/filedetails/?id=862564410 (Requires CUP Weapons, Vehicles and Units)

- SFP Finnish Forces Support (#341)
> https://steamcommunity.com/sharedfiles/filedetails/?id=917042703 (Requires CUP Weapons, Vehicles and Units)

- CUP NATO (#349)
> Combines existing BAF, BW, USA and CZ factions in the CUP modset

- Expeditionary Forces MJTF (Community #3441, #3442, Ultimate #403)
> https://store.steampowered.com/app/2647830/Arma_3_Creator_DLC_Expeditionary_Forces/

## Faction Updates:
- EAW Japan
> Updated their available planes

# New Maps:
- Chernarus Redux (#368)
> https://steamcommunity.com/sharedfiles/filedetails/?id=1128256978
> Antistasi_chernarusredux.chernarusredux

# Fixed:
- Weapon sway default fix (#339)
- HR Low warning not showing to all clients (#339)
- Tags error fix (#370)
- Wind param fix (#370)
- No driver in convoy fix (#370)
> If a vehicle doubled in a main faction and in a rival faction then it couldn't decide which driver to spawn

- Fixed an issue where armoured helmets were unlocked by default (#379)
- Add missing variable to airspaceControl (#380)
- Fixed rival invincibility in "Transfer" mission (#395)

# Arms Dealer:
- JCA Arms Dealer Support (#337)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3333302397

- Project Infinite Arms Dealer Support (#338)
> https://steamcommunity.com/workshop/filedetails/?id=807038742

- YLArms Arms Dealer Support (#348)
> https://steamcommunity.com/sharedfiles/filedetails/?id=3052209341

- Expeditionary Forces Support (#397)
> https://store.steampowered.com/app/2647830/Arma_3_Creator_DLC_Expeditionary_Forces/

# Changes:
- Changed how economic victory works (#339)
> Instead of needing 2 million in all maps now there is a calculation that sets the needed amount 
> Number of resource zones * 100,000

- HQ vehicle store UI category changes (#248)
- Air vehicle access on milbases (#282)

- Transition to diwako anomalies rework (#377)
> The normal diwako anomalies mod will have to be replaced with the rework mod to continue working in AU:
> https://steamcommunity.com/sharedfiles/filedetails/?id=3351980695

- Main Menu Update (#342)
> Removed random background selection
> Added cba setting to select desired background image (or lack of)
> Removed unwanted main menu flashbang "feature"

- Fix arsenal not clearing client IDs on disconnect (Community #3397, Ultimate #311)
- Fix precedence error in mortar/arty support routine (Community #3418, Ultimate #311)
- Implement mortar/artillery support ranging shot and walking barrage (Community #3388, Ultimate #311)
- Improve getArtilleryRanges, fix IFA mortar case (Community #3266, Ultimate #311)
- Make dive bomb runs less accurate against infantry targets (Community #3372, Ultimate #311)
- Replace all uses of inconsistent GETOUT waypoints (Community #3375, Ultimate #311)
- Seaport Ammobox Protection (Community #3369, Ultimate #311)
- Workaround Arma bug with CDLC detection (Community #3364, Ultimate #311)
- Create new classes for Antistasi AI units (Community #3349, Ultimate #311)
- Make artillery rotate to target before firing (Community #3231, Ultimate #311)
- Changed BIS_fnc_compatibleItems to script command (Community #3207, Ultimate #311)
- Fix case where seats may not be unlocked when dead crew are deleted (Community #3205, Ultimate #311)
- Prevent concurrent attacks and add a planning cost (Community #3273, Ultimate #311)

- Add names for templates (#346)
> Most templates will now use "correct" names for units, such as proper english names for NATO
> Extender developers can now use `"Name" call _fnc_saveNames;` in templates where "Name" is an entry from CfgWorlds >> GenericNames

# Parameters:
- Fast travel enabled only between major locations (#332)
> New fast travel option which only allows teleportation between airports/military bases/HQ/trader and to rally point.

# Note:
- The following extensions by Hophri are now obsolete as they have kindly been merged into Ultimate:
> A3UE - (CUP) HAFM - https://steamcommunity.com/sharedfiles/filedetails/?id=3336955114
> A3UE - Project Infinite - https://steamcommunity.com/sharedfiles/filedetails/?id=3337103070
> A3UE - JCA Infantry Arsenal - https://steamcommunity.com/sharedfiles/filedetails/?id=3334014032

## 11.2.1

Fixed CBA launcher variable issue (Community #3409)
Fixed Chinese text colour for aggression (#347)

## 11.2

### New Factions
- Vanilla "Merged" Factions (#307)
> CSAT&AAF
> NATO&AAF
> NATO&LDF
> NATO&UNA
> CSAT&SFIA

- CUP LDF (#331)
> Requires [(CUP) Livonian Defense Force](https://steamcommunity.com/sharedfiles/filedetails/?id=3294585159)

### Faction Updates:
- West/East Loyalist Faction Fixes (#324)
> Removed vehicles from East that didn't fit their categories; Set prices for the lightArmed vehicles in West

- LRI Faction
> Fixed an issue causing flags to not spawn on captured zones

### Map Updates:
- Green Sea (#329)
> Added more zones to the top right island of green sea

- Madrigal (#325)
> Add more zones, additional outposts, resource, factory and milbase
> Moved reinforcement corridor flags to make room for the new areas
> Adjusted west island seaport so flag doesnt spawn underground

### New Features:
- Disable Arms Dealer Parameter (#303)
> Added a new parameter that should prevent the arms dealer from spawning, currently in the simplest state so you may still see messages about the dealer.

- Victory/Loss Conditions, Weapon Sway bug fix (#299)
> For more info, read [the pull](https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/pull/299)

> Victory:
>> Normal Victory (Default): more the 50% support and capture all airports and military bases
>> Total Victory: more the 50% support and capture all Airports, military bases, outposts, factories and resources
>> Economic Win : get 2 million of the currency used
>> Logistical Win: get control of all airports seaports and military bases
>> Political Win: get more the 75% of the population to support you

> Loss:
>> Population Death: if more then 33% of the population dies
>> HR loss: if you run out of HR after war level 1
>> Economic loss: when you run out of money at any point
>> HARDCORE: all loss conditions combined

- More Parameters/Options (#330)
> Disable rally points parameter
> Disable player recruiting units parameter
> Disable invader punishments parameter
> more options for time multiplier 1:2 1:3

- Enemy QRF Orbital Unfair Futuristic Support (#144)

### Fixed:
- Fix issue where running destroyCity with CUP interiors could crash (Community #3359, Ultimate #291)
- Fix support crew being provided for free and then refunded (Community #3367, Ultimate #291)
- Fix airpoints not being added (#323)
- Fix issue where weapon sway calculation did work correctly (#299)
- Fix (maybe) init hang when "theBoss" is nil (#290)

### Changes:
- Reduce artillery/mortar ratio at high war tiers (Community #3327, Ultimate #291)
- Disallow sling-loading HQ objects (Community #3362, Ultimate #291)
- Add tank platoon enemy support as alternative to CAS (Community #3274, Ultimate #291)
- Improve CUP and IFA plane turn rates when flown by AI (Community #3335, Ultimate #307)

- Add attributeMoreTrucks and IFV-only option to ground transport selection (Community #3370, Ultimate #291)
> STALKER templates might have less air in general now

- Air response changes (Community #3250, Ultimate #305)
> Read [the community pull](https://github.com/official-antistasi-community/A3-Antistasi/pull/3250) for more info

- Money Donation (#314)
> Added more donation amount options 25% 50% 75% 100%

- Changed logic that handled friendly AI picking helmets (#307)

- 3CB AC47 Gunship (#287)
> Added AC47 from 3CB as possible gunship support

- Helmet loss parameter not doing anything (#310)
> Helmet loss chance wasn't configured properly.

## 11.1

### New Factions:
- Spearhead 1944 (somewhat) Standalone Factions (#272)
> Requires [Arma 3 Creator DLC: Spearhead 1944](https://store.steampowered.com/app/1175380/Arma_3_Creator_DLC_Spearhead_1944) and [C-47 Skytrain Mega Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=2894199585)

- CSLA Factions (AFMC, CSLA, US, Civ, FIA) (#263)
> Requires [Arma 3 Creator DLC: CSLA Iron Curtain](https://store.steampowered.com/app/1294440/Arma_3_Creator_DLC_CSLA_Iron_Curtain)

- CUP LRI Rebel (#276)
> Local Resistance Initiative. A resistance led by local civilians, using military surplus and basic gear from Gbay.

### Faction Updates:
- CSA, FoW, IFA Factions (#271)
> Added support for [WW2 Armored Cars [IFA3]](https://steamcommunity.com/sharedfiles/filedetails/?id=2811202098) and [WW2 Tanks [IFA3]](https://steamcommunity.com/sharedfiles/filedetails/?id=2842504702)

- Spearhead 1944 + IFA Factions (#272)
> Added new content from the recent update

- GM Templates (#274)
> Replaced 2035 uniforms, backpacks and facewear with GM options

### New Maps:
- Spearhead 1944 Mortain (#272)
> Requires [Arma 3 Creator DLC: Spearhead 1944](https://store.steampowered.com/app/1175380/Arma_3_Creator_DLC_Spearhead_1944)

- [Northern Fronts Svartmarka](https://steamcommunity.com/sharedfiles/filedetails/?id=1630816076) (#277)

- [Pulau](https://steamcommunity.com/sharedfiles/filedetails/?id=1423583812) (Community #3214, Adapted in #284)

- [Mehland](https://steamcommunity.com/sharedfiles/filedetails/?id=3317364155) (#304)

### Map Updates:
- Madrigal (#294)
> Updated the main city with more zones for increased urban combat

### New Features:
- [Builder Box Expansion](https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/pull/289) (#289)

### Fixed:
- Spectrum Device JIP/Locality issues (#278)
- Cruise Missile not classed as unfair (#278)

### Arms Dealer:
- Spearhead 1944 Vehicles/Weapons (#272)
> Added new things from the recent update

- Flying Legends Support (#292)
> Added Flying Legends vehicles to the arms dealer & optional to WW2 Templates
> Added Secret Weapons Reloaded vehicles to the arms dealer & optional to WW2 Templates
> Added Naval Legends vehicles to the arms dealer

### Changes:
- Discord Rich Presence Images/Text (#275)
> This will only be changed for people who use the [Discord Rich Presence](https://steamcommunity.com/sharedfiles/filedetails/?id=1493485159) mod.

- Vehicle spawn pools for different zones (#281)
- Return SL to AI after being unconscious (#298)

### Parameters:
- Changed weapon sway to have more options (0%/25%/50%/75%/100%) (#283)
- Added a "helmet ping" sound parameter for when an enemy helmet is popped (#283)

## 11.0.0

<div align="center">
  <img alt="Antistasi Ultimate" src="https://github.com/user-attachments/assets/c7c36f05-a870-4143-bfc5-0afa2394dc4b">
  <h1>"The Yulakia Soviet Expansion"</h1>
</div>

Check #270 to see what's different.

### MAJOR:
- Renamed the save file from AntistasiPlus to AntistasiUltimate
> This change essentially wipes your saves. There is an old version of the mod [here](https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/releases/tag/v11.0.0savecompat) if you want to continue your old saves. You should swap back when finished.
> Save cleansing is normal for each 1.0 release, so expect that to happen each 1.0 increment (11.0, 12.0, etc)

### New Factions:
- Cold War Rearmed III Factions (#214) - https://steamcommunity.com/sharedfiles/filedetails/?id=3269370567

- CUP (#253)

-- Eastern Loyalists
-- Western Loyalists
> Non descript rebel factions using old Soviet or NATO weaponry respectively

- OPTRE (#260)

-- Skeleton Support - https://steamcommunity.com/sharedfiles/filedetails/?id=3299203337 < This extender adds Spartan and Elite rebel units to certain maps.

-- DME (Rebel)
> The DME (Dark Moon Enterprises) is a private security company. The planet you were providing security for eventually made contact with the Covenant, leading to today. The DME hierarchy has collapsed, and you are now alone.

-- UNSC (Rebel)
> Sent behind enemy lines to gather intelligence on the Insurrection, you were shocked when the Covenant invaded. The UNSC fleet has been decimated, there will be no reinforcements...

-- ODST (Rebel)
> Dropped feet first into hostile territory, you are tasked with covertly liberating the local population.

-- Insurrection (OPFOR)
> Literally just an alternative faction so you don't have to use Covenant.

> The rebel factions are meant to be used with the Covenant, and as such may be seen as overpowered in normal gameplay.

### Faction Updates:
- OPTRE UNSC templates
> Gave spartans their own radio backpack so the skeletons match

- CW templates
> Updated to have some new things from the recent 3AS updates

- Vanilla Reb LL
> Fixed missing mortar definition

- Western Sahara templates
> Updated to have some new things from the recent WS updates

- WW2 templates
> Finally changed the supply truck

### New Maps:
- Yulakia (#215) - https://steamcommunity.com/sharedfiles/filedetails/?id=2950257727
- Phuoc tuy (Unsung) (#216) - https://steamcommunity.com/sharedfiles/filedetails/?id=943001311
- Gulfcoast Islands (#220) - https://steamcommunity.com/sharedfiles/filedetails/?id=1617004814

### Map Updates:
- Stazsow (#217)
- Tobruk (#217)
> Removed modern buildings and replaced with proper buildings

### New Features:
- Spectrum Device Drone Jamming (#201)
> Allows you to jam unmanned vehicles to disable or hack them, provided you have contact and the new param is enabled

- "Notify Players When Downed" parameter (#231)
> Only works without ace. If enabled, when you are downed it will send a message in the chat.

- Zombie Missions (#255, #265)
> "Kill the Mutant"

> "Stop City Infestation"

> "Take ZONE"

- GUNSHIP/UAV/CRUISEMISSILE enemy supports (#202)

### Fixed:
- Fix reordering and unlockedXXX arrays in initial unlocks (Community #3226)
- Prevent Arma from deleting player corpses for 15 mins (Community #3215)
- Fix arsenal backpack weapon attachments code adding the wrong element (Community #3197)
- Fix fast travel parameter inversion and allowDamage exploit (Community #3196)
- Prevent O(N^2) startup hang with excessive hats/glasses (Community #3195)
- Avoid spamming unlockedXXX publicVariables (Community #3136)
- Fix remote-controlling players despawning rebel garrisons & civs (Community #3114)
- Misc fixes batch 2 (Community #3110)
- Ability to donate less than 250 (with more than 250) (#261)
- Add default sell price for rival vehicles (#262)
- GM and SOG cargo nodes (#252, #256)

### Arms Dealer:
- Black Market Vehicle Rework (#212)
> Black market vehicles are now done similar to the weapons, in which vehicles will be added from all available supported modsets.
> The unlock conditions for black market vehicles have been standardized. Unlock conditions are now tied to the vehicle type.
> Read the github wiki page - https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/wiki/Arms-Dealer for further info.
> For extension developers - https://github.com/Westalgie/A3UExtender/blob/Docs-update/A3UE/addons/README.md

- Forbidden items (#226)
> You should now be able to (maybe) sell some forbidden items if they can not be unlimited in the arsenal. Some things like armor still won't work

- Arms Dealer Unlock Notifications (#232)
> In theory when you meet the requirements to unlock a vehicle type, you should get a hint saying you unlocked it on the next tick

### Changes:
- IFA, Spearhead and Unsung maps now have static spawning based on the building type (#217)
> You should see outposts and other zones have more static defenses now

- AI "Get In" Command's Fixed when unconscious (#207)

- Injured self-revive cooldown notification (#246)

### Parameters:
- Params for no fast travel and no box restore (Community #3152)

- Hide Enemy Zones (#234)
> Revealed zones should now be saved (excluding milbases, technical limitation)

# 10

## 10.8.5

<div align="center">
  <img alt="Antistasi Ultimate" src="https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/assets/78276788/3f8e4ae3-6f9f-4e2f-a363-0c513ab04232">
  <h1>"The Crashsite"</h1>
</div>

### New Factions:
- [Android Factions](https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/wiki/Mods#android-ascension)

- AAF Remnants (PR #196)
> A rival faction backed by CSAT, trying to take back control over the islands.

- 3CBF
> CSAT - Invaders (Arid, Arctic, Temperate, Tropical)
> ION - Invaders (Arctic, Temperate, Arid)
> MDF - Occupiers
> KRG - Occupiers
> ION - Rebel

- WS
> ION Rivals (PR #173)

### Faction Updates:
- Vanilla_AI_LDF
- Vanilla_AI_NATO_Arid
> Fixed some issues causing the factions to break (PR #170)

- Vanilla_Reb_FIA
- Vanilla_Reb_LL
- Vanilla_Reb_SDK
> Fixed an issue causing airstrike supports to not work correctly

- 3CBF_AI_ARD
- 3CBF_AI_HIDF
> Added some new vehicles

- VN_AI_ARVN
- VN_AI_MACV
> Added SOG Nickel Steel support

- Aegis and Vanilla Occ/Inv
> Added VTOLs and UAVs as possible support types

- Warmantle Empire
> Added arctic faction

- 3AS
> Updated vehicle classnames

- PRACS
> Added some new vehicles to the SLA and removed some odd equipment choices

### Localization:
- French (PR #154)
- Korean Update (PR #199)

### New Maps:
- Gabreta
> Requires the CSLA dlc

### Map Updates:
- Lythium
> Removed some towns with 0 population

### New Features:
- Total Victory Parameter
> If enabled, you need to own every zone (outposts, seaports, etc) minus things like military administrations and cities. 50% of pop is still a part of the victory conditions.

- Ability to disable advanced towing (in CBA settings)

- Weather save/load changes (Courtesy of Br-ian, PR #174)
> Saves more weather changes, typically set by a zeus. Older saves still work fine

- New random encounters (PR #180)
> Civilians fleeing from cities near the "frontline"
> Heli logistics runs, carrying crates... What goes up must come down!
> Skirmish between Occupiers and Invaders near the "frontline"
> Skirmish between Occupiers and Rivals

- Crashsite Mission (PR #126)
> You are given intel of a factions crashsite that contains valuable reconnaissance data in the black box.

- Alternate Save Reimplementation
> Basically how it works in community, allows you to untick "Use New Save file" for people who have issues saving with Linux

### Fixed:
- Reverted ACE AI healing changes
> They break more than they fix, especially when using ace no medical

- Re-added translations to undercover related scripts
- Exegermenos not wearing uniforms
- Syndikat not wearing uniforms
- Mortars missing in FIA template
- Undercover localization/translations

### Arms Dealer:
- UI (PR #163)
> Has been changed to display things better

### Changes:
- A popup should now occur when purchasing rebel training showing the price and allowing you to cancel.
- Added more cargo nodes for VN (SOGPF) vehicles

- Added more mods to the mod warning system
> Basically all of the "Dismember" or "Gore" mods break Antistasi

- Airdrop logistics mission
> Will now auto-transfer loot upon return to HQ from recovered crates (if applicable) before deleting them.

- Removed the main menu/loading screen changelog

## 10.7.0

### New Factions:
- East Asia War Factions - https://steamcommunity.com/sharedfiles/filedetails/?id=3222254003
- Faces of War Factions - https://steamcommunity.com/sharedfiles/filedetails/?id=3222258367
- Warmantle Imperial Factions - https://steamcommunity.com/sharedfiles/filedetails/?id=3222259903

- Milicia Nacional Gran Colombia
> A fictional rebel faction for the BRAF modset - https://github.com/SilenceIsFatto/A3-Antistasi-Ultimate/wiki/Mods#braf

- Western Sahara Civs

- Addon Vehicle Packs
> SOG
> Apex
> Contact
> CSLA
> GM
> Karts
> RF
> WS

### Faction Updates:
- CUP_AI_HIL
> Fixed a missing comma causing faction issues.

- IFA_AI_WEH_Arctic
- IFA_AI_WEH_Arid
- IFA_AI_WEH_Temperate
- CSA_AI_WEH_Arctic
- CSA_AI_WEH_Arid
- CSA_AI_WEH_Temperate
- SPE_IFA_AI_WEH
> Added a german C47 plane instead of US equivalent (PR #136)

- TFC_AI_CA_Army_Arid
- TFC_AI_CA_Army_Temperate
> Fixed M249 blank ammo

- Vanilla_AI_AAF
- Vanilla_AI_CSAT_Arid
- Vanilla_AI_CSAT_Temperate
- Vanilla_AI_LDF
- Vanilla_AI_NATO_Arid
- Vanilla_AI_NATO_Temperate
- Vanilla_AI_NATO_Tropical
- Vanilla_Civ
- Vanilla_Reb_FIA
- Vanilla_Reb_LL
- Vanilla_Reb_SDK
- Vanilla_Riv_Exegermenos
- Vanilla_Riv_LE
- WS_Reb_Tura
- WS_Riv_Exegermenos
> Added Reaction Forces CDLC content where appropriate if RF is activated in Additional Content (PR #149, Port of Community PR #3185)
> Added GM content to some vanilla templates if activated in Additional Content (The AAF faction requires GM Extra - Altis Armed Forces too - https://steamcommunity.com/sharedfiles/filedetails/?id=1816026173)
> Added CSLA content to some vanilla templates if activated in Additional Content

### Localization:
- Korean Updates (Courtesy of Psycool3695, PR #143)

### Map Updates:
- Antistasi_spex_utah_beach
> Changed OPFOR to hostile.

- Antistasi_WW2_Omaha_Beach.WW2_Omaha_Beach and utah_beach
> Removed Spearhead 1944 (the actual CDLC) requirement, compat data is still needed if CDLC is not owned.

- Antistasi_green_sea.green_sea
> Fixed rebel emplacement zones, statics should spawn as usual now

### New Features:
- Civ plane event.
- New main menu and loading screens.
- Enemy CASDIVE support.
- 1000 and 5000 builder boxes.
- Move Out Crew commander button.

- Hide Enemy Zones parameter.
> Hides basically all of the enemy zone markers except cities, airbases and miladmins. You can reveal them by capturing them or via finding intel (through interrogation or other means). The recon plane support also reveals zones in its search area.

### Fixed:
- AI moveout during cargo loading.
> AI should no longer be removed when cargo is being loaded, unless they take up that spot.

- DLC in templates.
> DLC things would incorrectly be used even without the relevant DLC activated

- Plane loadouts.
> Most planes didn't have the correct data set for their loadouts, causing support runs and such to not activate

- Loot crate helicopter.
> If a helicopter was not available in current template, it would steal your money and nothing would happen. You should be refunded with a message now!

- Resources display.
> Resources would display as "Airbase" when checking population and such

- fn_credits throwing an error.

### Arms Dealer:
- Aegis Dealer
> Fixed a missing definition, causing the Aegis stuff to not show.

- Reaction Forces CDLC Content.

### Changes:
- AI possession changes.
> You should no longer be kicked out of AI if you get damaged whilst down

- Helicopter landing/take off.
> Helicopters will now flare more when landing/taking off. There's also a prevention to stop them from blowing up when landing.

- More vehicles have cargo nodes/offsets.
> Affects Vanilla, Aegis, Western Sahara.

- Updated the KAT medical list to match community.
- Civs will now wear uniforms (and use vehicles) from DLCs if activated.
- SF units will now sometimes wear CBRN suits if you enable the Contact DLC.

- New black market vehicle options.
> Only applies to vanilla templates

- Generally small additions to templates.
- Moved Socrates' credits to "Antistasi Plus Authors" instead of "Antistasi Ultimate Authors".
- Updated main menu images and loading screens.
- Changed loading screen image.
- Invaders shouldn't be able to start punishments if war level is below X (set in addon options > Antistasi Ultimate)

### Parameters:
- Loot Crate Ignore Unlocked Items
> Fixed an issue causing gear to be "duplicated" in a sense

- Support Caller
> Values were inverted, so radioman would allow SL's to call for support, vice-versa

## 10.5.0

### New Factions:
RHS Serbian Armed Forces

### Faction Updates:
TMT
> Now using correct loadouts

Northern Fronts (Soviets)
> Using Northern Fronts equipment instead of IFA

## Localization:
Korean translations (Courtesy of Psycool3695, PR #102)

## New Maps:
Green Sea
Columbia
Kujari
Namalsk
Omaha Beach
GOS Al Rayak
Utah Beach

### Map Updates:
Lythium
> Moved some zones around, changed the navgrid and such. Apologies if an outpost is now right next to you!

### New Features:
Withstand Mechanic (Ported)
> If enabled, self revive kits will still work but you won't be prompted to use them.

### Fixed:
SAM's should now fire correctly

Controlled AI should have stamina disabled if parameter is set

AI loadouts will now set facewear correctly

Vehicle prices are now capped to 100 at the lowest
> Fixes an issue that caused you to be paid for buying a vehicle

Missing icons in store

### Changes:
Self revive kits are now enabled by default
> You could still buy them regardless, so it only makes sense

### Parameters:
Support Caller
> Allows you to change who calls in for support, Radioman or SL
> Since the radioman was the only one who could call for support, squads would rarely call for QRF support if a radioman wasn't present

Allow Unlocked Explosives
> Reimplemented this parameter, minefields will now work with it enabled.

## 10.4.0

### New Factions:
Turkish Land Forces (TMT)

### Faction Updates:
Clone Wars
> Uses new vehicles from the required mods

VN/SOGPF:
> Voices have been changed, aswell as faces (Courtesy of AndroKiller, PR #85)

### New Maps:
Lythium

### Map Updates:
Staszow
Tobruk
> Fixed a revive issue due to it being enabled in the mission.sqm

### New Features:
Roadblock vehicles will scale according to war level
> Vehicles at roadblocks may now be lightly armed or heavily armed/armored according to war level

Magazines will no longer spawn in crates if added to the forbiddenItems list

### Fixed:
Velka GL (Western Sahara)
> Incorrect baseWeapon value, wouldn't show up in the arsenal

RHS STALKER Mutant template
> Incorrectly used a unit that would break commander status

### Changes:
Added Zeus Wargame + Armor Plates System to warning system

### Parameters:
Loot Crate Ignore Unlocked Items
> May not catch all unlocked items, but should catch the majority

Loot Crate Price
> 100, 200, 300, 400, 500

Enable Fatigue/Sway/Stamina
> Only affects vanilla stamina due to ace having its own settings for it

## 10.3.1

New Factions:
Northern Fronts (Soviet, Finland, Norway)
Livonian Defense Force (LDF)

New Maps:
Ruha
Šumava

New Features:
Port of Antistasi Community builder system.
> Some maps don't have specific lists and as such may use a default CUP/Vanilla set for now.

Fixed:
Undercover GetInMan event handler.
> Had a typo preventing undercover from activating when you get in a civ vehicle. (Likely a remnant from the plus code)

PRACS Templates.
> Missing mags, incorrect trucks.

WW2 Era Templates.
> Planes used were not in the list to fix paradropping, causing no paratroopers.
> SCR-536 radio was dependent on TFAR.

Trader Issues.
> The hasAddon code would falsely produce a true even if one of the addons were missing.
> The stringtable had an illegal character in it, causing multiple mods to not show categories correctly.

Changes:
Arsenal Unlock Similar Weapons
> This was bugged in all other modsets but RHS (Even then, I don't think it worked 100%)

Parameters:
Loot Crate Radius
> Added a 10m radius option

## 10.3.0

New Factions:
Canadian Army (Desert/Woodland)
French Army (Desert/Normal)
RHS STALKER Factions (Courtesy of Sven Martin + his discord)
Precursors (OPTRE Flood)

New Features:
Improved Russian localization (Courtesy of Westalgie/Zets).
> The arms dealer categories have also been localized, aswell as the warning text if loading potentially breaking mods

Improvements to the blacklist (Courtesy of Westalgie/Zets).
> Now has the ability to blacklist by loaded addons, e.g only blacklist X if Y is loaded.

Improved Melee System Stealth Kill Implementation.
> If there are no enemies within about ~20m of the person you're stealth killing, you'll keep undercover. Civilians have a chance to panic and reveal you.

SCR-536 Handie Talkie For WW2 Era Templates (Model by Zelo).
> Has full TFAR compatibility

Fixed:
Re-added ATTE In SW Templates

Various Bugs

Lada Logistics
> Was capable of carrying a whole Anti-Air cannon. Thank you for that image Zets...

Arms Dealer
> Removed some duplicate and/or missing categories

Changes:

Unit Tiers
> Setting these too low could cause units and POI's to not spawn, minimum is now 2

Parameters:
Include Vanilla Weapons In Arms Dealer

Use Old Plus Garrison Spawning
> Now affects unit tiers, so the unit tier CBA settings will not take effect with this enabled. This should fix any issues with units/POI's not spawning however

## 10.2.1

New Factions:
IFA Zombies (Civ, Soldier)
Scion Conflict + Android Templates (Scion Empire, Amalgamate Republic, Replikas, Androids)

New Trader Mods:
Weapon Research & Security

New features:
Ability to tweak when enemy tiers kick in via cba setting.
> Make elite appear in earlier war levels, make militia kick out at lower war levels, etc

Ability to add plane loadouts via extender mod, planes will use a default loadout if one isn't found.
> see the ultimate folder if you are interested

Outposts will now spawn the correct tiers, militia should be a rarity to see in outposts now.

Added chance for police patrol to not spawn in city with zombie related templates.

Added zombies uncapped parameter, bypasses the spawn limiter.
> CAUTION: Only use on a beefy server

Added check to see if certain mods are loaded, if so warn the user they may break stuff.
> Doesn't end the mission, it's merely a popup listing the addons.

Added emission settings for the TTS Emission mod.
> Player effect, AI effect, Vehicle effect, etc

Fixed:
Lowered priority for the experimental civ templates.
Requirements for the Mutants civ faction.
IFA map respawns.

Changes:
Added extra zombies to the zombie/mutant templates.

Added support for [Necroplague Mutants](steam://openurl/https://steamcommunity.com/sharedfiles/filedetails/?id=2616555444&searchtext=mutants) if loaded with the Mutants (STALKER) faction.

Revamped some STALKER factions. (thx sven)

Re-done OPTRE templates, ODST are now elite and the templates have support for [Misriah Armory](steam://openurl/https://steamcommunity.com/sharedfiles/filedetails/?id=2901732103).

STALKER anomalies should now spawn in higher amounts, so you may need to tweak your settings.

The exportToCrate function should now export all the data correctly.

Changed the unit spawning, should hopefully fix outposts not spawning for some people.
> If it still doesn't work, I added a parameter "Use Old Plus Garrison Spawning". It reverts all the changes made to the unit spawning.

Changed the optre fuel drum back to vanilla, should actually have fuel now.

Changed some RACS weapons that weren't working in the arsenal, and blacklisted them from spawning in crates.

Removed the corrupted from zombie/mutant templates, replaced with other mutants.
> Mutants template now has a small chance for a smasher to spawn.

## 10.1.0

New Factions:
GM (Cold War: Bundeswehr, National People's Army, VSBD);
CSA38 (WW2: Germany, UK, Czech Resistance);
BRAF (Brazil);
STALKER (Clear Sky, Freedom, Military, Monolith, Ecologists, Loners, Bandits, Duty);
AEGIS (AAF, AFRF, AUKUS, CSAT, NATO, CHDKZ, ION);
Zombie Civ Faction

Anomalies Support
Emissions Support

New Trader Mods:
NIArms, FW, Tier One, SMA

New Maps:
Staszow, Tobruk

Undercover Changes

Integrate some of Plus' Updates

Many Bug Fixes (notably, the crate blacklist should now work correctly)

We may have missed things. For a full list:

# 10.0.1

- Skeleton fix implementation, https://steamcommunity.com/sharedfiles/filedetails/?id=3013835060 is now obsolete

- Trader fix (should be able to sell and buy stuff now)

- SPE MG change

- Lingor hangar fix

- Update ingame icons