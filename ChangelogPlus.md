# Changelog

## 2.3.2
### Changes
- Fixed broken rally point and construction cancellation 

## 2.3.1
### Additions
- New civilian plane flyby random event
- (Vanilla, Aegis) Weasel AA, AT, Autocannon, Radar variants will be present in Vehicle Black Market

## 2.3
### Additions
- Aegis support
- Šumava terrain support
- New enemy group type - reconnaissance patrol, usually it has snipper and spotter in ghillie suits if possible, they may spawn in forests and other wilderness areas. If faction has no ghillie or other suit types, ordinary snipers and spotters will be used
- New Rivals random event - Helicopter Raid, they will try to drop some munition on your heads and then they will loiter in the area to finish survivors if there are any (some rivals faction have only drop part because of lacking required assets in their specific modsets) 
- (Aegis) AUKUS, NATO, CSAT, AAF, AFRF factions
- (Aegis) CHDKZ and Ion PMC Rival factions
- (Aegis) FIA, Syndikat and Livonian Militia rebel factions

### Changes
- AI will use militia APCs in support actions and attacks too, not only roadblocks
- Minor Rivals roving mortar spawn fixes
- Separate airborne groups for QRF vehicle airdrop
- SAM sites could be persistently destroyed so they will no longer spawn for some time until replenish occurs
- SAM support type will be not used on site if SAM site was previously destroyed and isn't replenished yet
- Slightly reduced probability of QRF vehicle airdrops and infantry paradrops on air QRFs
- Fixed Invaders/Occupants non-usage of light helicopters
- Fixed broken Vehicle Airdrop QRFs on vanilla NATO factions
- Fixed non-working radars on SAM sites, radar will be actually enabled and data link will be used to share targets with near air defense assets
- Fixed wrong Rivals cell leader classname on initialization
- Fixed unintended appearance of flagpole on captured military administrations causing them to be destroyed
- Enemy will use divebomb CAS support against rebels along with traditional CAS attacks
- Minor loot crate timing changes
- (Vanilla) Enemy artillery support will utilize more shell types
- (Vanilla) Additional civilian helicopters
- (Vanilla, Aegis) AAF will use Wiesel AA and Scout vehicles as their replamcents for SAM and Radar vehicle types
- (Western Sahara) Vanilla and Aegis Rebel templates will use armored pickup vehicles  //need to check this
- (SOGPF) Changed identites of rebel Vietnam Militia and Viet Cong factions to Vietnamese //and this

## 2.2.4
### Changes
- 3.3.3 Community Version integration

## 2.2.2
### Changes
- Fixed rebel mortars missing prices

## 2.2.1
### Changes
- Fixed surrender crates not clearing default loot before being populated with surrendered soldier's loot
- Fixed no initialization of vehicles bought from vehicle box or Vehicle Black Market
- Fixed automatic task failure when unit arrives at custom outpost
- Fixed no price increase appliance on rebel units soldiers after skill training
- Disabled weapon quantity check per class on recruit
- Revive time default value changed from 12 to 16 seconds, medics revive twice faster

## 2.2

### Additions 
- SOGPF 1.3 update support

### Changes
- 3.3 Community Version integration - PATCOM AI integration, AA/AT missile specialists, many improvements and fixes of various gameplay systems
- Undercover balance pass - removed concept of civilian backpacks as there was no clear indication about backpack type and undercover system interaction, removed backpack undercover checks, wearning military clothes while in being in vehicle allows you to go undercover but the enemy can still detect player if he's close enough (100 meters for day and 50 meters for night) to him
- Moved rebel Apex 4WD vehicles from Vehicle Black Market to general vehicle pool, they're accessible when Apex DLC is enabled
- Ability to override AA/AT specialist loadouts via Rebel Loadouts feature
- Added new AA/AT specialist units to various rebel teams and squads 
- Fixed broken mortar spawn on some vanilla Rivals factions
- Fixed 'Undefined variable in expression: a3a_faction_civ' error when player opens aresenal in non-AntistasiPlus mission environment
- Fixed wrong usage of Aegis classnames in Vanilla CSAT Temperate faction which led to no static weapons on CSAT outposts
- Increased save vehicle area around HQ from 50 to 100 meters
- Increased custom outpost (AA/HMG/AT emplacements, roadblocks and watchposts) task completion radius from 10 to 35 meters

### Removals
- Replaced rebel payload planes with just rebel planes, removed rebel faction vehicle category in templates 
- Removed ability to buy rebel repair vehicles after owning 4+ factories to make it more in line with fuel and ammo resources economy
- Removed auto heal toggle menu
- Removed Civilian Presence Module, replaced with PATCOM civilian system

## 2.1.11
### Changes
- Fixed radio tower city influence presentation

## 2.1.10
### Changes
- Fixed paradrop black screen issue
- Fixed civilian heli sell price exploit

## 2.1.9
### Changes
- Cold War Mode Soviet police crash fix
- Simplified Chinese localization fixes

## 2.1.8
### Changes
- Korean localization fixes

## 2.1.7
### Changes
- Vehicles can be put into garage near Arms Dealer location
- Removed money reward from Find the Arms Dealer task to prevent money farm exploit

## 2.1.6
### Additions
- Korean localization (credits to Psycool3695)

## 2.1.5
### Changes
- Inability to call supports afrer unsuccessful loot heli run fix

## 2.1.4
### Changes
- Commander slot perks fix

## 2.1.3
### Additions
- Weferlingen support
- (3CB Factions) Cold War Mode - Red Army and US Army Cold War factions, enables Cold War Mode - Authentic US and Red Army unit rosters with equipment and vehicles up until first half of 90s, exclusion of equipment that does not fit Cold War time period from all sources (enemies, loot crates and Arms Dealer store) with some exceptions
- (3CB Factions) CHKDZ Cold War Rival faction

### Changes
- Vehicle box restore action will force arsenal tick (arsenal unlock pass)
- Self-revive kit could be fit into backpack only
- Self-revive kit will heal to 75% on use
- Players will receive small rank increase after releasing enemy POWs
- Fast Travel Check for player only non-working option fix
- Fixed inability to build AT Emplacements
- Fixed soft-lock of Find the Arms Dealer task if task was obtained but not completed between different game runs
- Marked AI Possession feature as expiremental, disabled by default, light refactoring and stabilization pass in attempt to fix some of the non-obvious hard-to-catch issues
- Changed AI Control Time options to 30, 60, 90, 120 seconds
- Player squad dismiss will be full refunded
- Increased amount of donation to faction from 100 to 250 to reduce number of clicks while transfering big sums of money

### Removals
- Removed Projectile Camera

## 2.1.2
### Changes
- Full commander menu will be available at trader location, not only HQ
- Fixed problematic case of AI flares missing when enemy is missing too
- Fixed missing Rivals surrender crate checking for auto loot action 
- Fixed datetime limit for missions showing incorrect values
- Fixed non-appliance of modifications on vehicles being put out of garage
- Rivals car demo event tweaks - it will spawn only in Rivals-infested cities, will have probability tied to rivals activity, it will spawn car instead of planting charge into already existing car thus eliminating situations when players car could be affected 
- Moved Rivals appearance War Level from 3 to 4
- Added passive chance to obtain info about Arms Dealer starting War Level 3 as a fallback for bad luck
- Minor Rivals activity reduction on Rivals troops eliminations 
- Minor localization fixes
- Increased base Rivals events cooldowns from 1200 to 1600 seconds
- Rivals imprisonment will add small progress to next Rivals location reveal
- Reduced base time to call support from 30 seconds to 15
- 15 seconds cooldown on AI Control while laying wounded
- (3CB Factions) Fixed ARD being named TKA
- (SOGPF) Changed civilian helicopter model to one of the AH-1 variants

## 2.1.1
### Additions
- Simplified Chinese localization (credits to vbnshi)

### Changes
- Fixed accidential explicitly disabled AI possession feature
- Reduced mass of self-revive kit from 160 to 80
- Reduced price of self-revive kit box from 3000 to 2100

## 2.1
### Additions
- S.O.G. Prairie Fire CDLC support
- Cam Lao Nam support
- Khe Sanh support
- Tanoa support
- Takistan support
- Sehreno support
- Multiple Rivals factions per modset support, startup menu changes to accomodate it
- Loot Crate Gather Distance parameter
- Overall Enemy Balance parameter changes - new Below Normal (former pre-2.1 Normal value) and Above Normal (sligtly harder than Normal, former pre-2.1 High value) values,  Normal and High parameter values will be slightly harder
- Special item for SP or low-population MP - Combat Readiness Recovery Kit, allows owner of such kit instantly revive someone including user of such kit, one-time use, could be bought in Vehicle Box store in "Other" tab, could be turned on via startup parameter
- Ability to possess any near friendly AI squadmate while laying incapacitated to help your original body (press T while being incapacitated, could be turned off via params menu)
- Rivals mission subvariants for Kill the Traitor and Rescue Prisoners mission types
- New mission type - Salvage Ambushed Convoy
- Inisgnia/patches support for enemy units 
- (3CB Factions) Takistan Army, Horizon Island Legion, Ardistan Army factions
- (3CB Factions) Takistan civilians
- (3CB Factions) TKM rebel faction
- (3CB Factions) Syndikat rival faction
- (3CB Factions) Arid Civilians faction
- (Vanilla) NATO Tropical faction 
- (Vanilla) Syndikat, Livonian Looters rebel factions
- (Vanilla) L'Ensemble rival faction
- (SOGPF) MACV, ARVN, PAVN enemy factions
- (SOGPF) VM, VC rebel factions
- (SOGPF) Vietnam civilian faction
- (SOGPF) Pathet Lao rival faction

### Changes
- Community Version 3.1 integration
- Increased durability of loot crates, slight rework of load/unload invulnerability
- Seaports will be used for airspace control
- Expanded guard unit pool with LATs, machinegunners, grenadiers
- Expanded tower guard unit pool with snipers and riflemen
- Expanded guard building pool with new buildings
- Fixed Rebel Loadout arsenal finite items usage exploit
- Fixed ability to do big attacks for factions that were defeated before
- Fixed Destroy Artillery minor error about event handler
- Fixed Rivals tasks inability to work if there are no buildings in town
- Fixed logic pitfall where player's civilian car could be sould be charged with explosive by Rivials in their activity zone
- Fixed rebel AA sell price exploit
- Fixed rare case when squad leader belongings weren't deleted after some time after intel search action
- Fixed non-removable pallets from Deliver Supplies mission
- Fixed no outcome out of enemy leader interrogation on dedicated server
- Fixed despawn issues of Post Ambush random event
- Fixed "activityIsChanging" headless client error
- Fixed intel tables hanging in the air on dedicated servers
- Fixed cost-free custom outposts on dedicated server
- Fixed inability to cancel outpost task on dedicated servers
- Fixed script A3A_template_Inv error on rebel airstrike on dedicated servers
- Fixed Rivals Activity Level broadcasting to clients on dedicated server on load
- Fixed present "Equip on Buy" button when headless clients are active on ds/hc configuration
- Fixed bug that prevented commander from placing or removing minefields
- Fixed some missing strings, typos, localization errors
- Fixed non-working paradrop and loot helicopters if napalm was disabled
- Fixed fast travel invincibility exploit
- Fixed defuse icons
- Fixed non-locked driver seat on towable vehicle on dedicated server
- Fixed logic pitfall which led to no intel until Arms Dealer quest
- Fixed non-restorable undercover state after crate carry
- Fixed balance cost and threat assesment for light APCs, militia APCs and airborne vehicles
- Fixed inability to assign attacks on Rivals hideouts and cells if there are no unknown locations
- Headgear in arsenal will have distinct colors depending on their scarcity
- Air vehicles can be put into garage even when there is no captured airport yet
- Military Administration capture/destruction will increase support in it's city
- Post-effect will be applied while laying in wounded state
- Transport, light attack and attack helicopters may spawn at helipads on airbases, transport helicopters and light attack helicopters may spawn at milbases
- Prisoners will spawn in military administration in all cases (not only Capture The Military Administration task as it was before), they will have spawn cooldown to prevent HR farming
- Investigate the Battleground mission will be rolled in mission distance radius instead of frontline cities only
- Changed Artillery Menu default keybind from Shift + Y to Shift + U as it had conflict with Shift + Y Zeus menu call
- Civilians will no longer spawn in cities destroyed by Invaders
- Enemy squad will no longer spawn in difficult variant of Deliver Supplies mission for friendly cities
- UAV Flyby Rivals event strike notification distance increased from 25 meters to 35 meters to give players a little bit more time to react
- Reduced probability of Mechanized Airborne QRF
- Rivals random event cooldown will depend on Rivals Difficulty parameter and current level of rivals activity (more active -> less cooldown)
- Improved Mechanized Airborne QRF attacking behaviour
- Increased chance to learn about Arms Dealer via interrogations and intel searches from 15% to 20%
- Increased probability of rival event happening on 5% on each activity level
- Increased base delay for air superiority fighter (300->600 seconds) and CAS support (300->450 seconds) to give rebels more room for air/heavy vehicles usage
- Medics will fully heal on revive, non-medics will heal to 75% on revive
- (Vanilla) 4WD jeep will be added into civilian vehicles pool if Apex DLC is turned on
- (RHS) Fixed wrong classnames for AFRF surrender and equipment boxes
- (3CB Factions) Switched LDF to Occupants factions section
- (Takistan) Removed resource marker, moved initial HQ position farther from Occupant airbase
- (Sefrou Ramal) Moved Military Administration to less problematic landscape
- (Cam Lao Nam) Fixed some problematic outposts without vehicles, removed outposts without roads, disabled simulation on some dynamic objects
- (Khe Sanh) Added PaCa to populated villages list
- (Chernarus 2020) Manual population config, overall population cut from ~11000 to ~8000, disabled Arsenovo and Krasnoe villages
- (Vidda) Tuned population a bit
- (Esseker) manual population config
- (3CB Factions) Removed all cars which are non-authentic to Eastern European setting (pickups, Land Rovers etc)
- (3CB Factions) Replaced vanilla cops with military police/rear echelon/national guard for USMC and US Army factions
- (RHS) Fixed usage of 3CB Factions backpacks in pure RHS USMC Temperate faction
- (SOGPF) Added M1 Garand, M1982A2, L1A1, L2A1, F1 SMG, new m16 and XM177 variants to Arms Dealer stock
- (Vanilla) Removed XMS rifles for militia-tier units in NATO templates
- (Vanilla) Arms Dealer will sell 4WD vehicles if Apex is enabled

### Removals
- Removed Truely Random Crates parameter
- Removed "Buy Loot Crate" action on vehicle box as loot crate was moved to general store to "Other" tab


## 2.0.2
### Changes
- (RHS) Fixed empty classes in Arms Dealer stock
- Fixed undercover icons for vehicles in Vehicle Black Market

## 2.0.1
### Changes
- Additional rally point spawn count parameter values - 3, 5 
- Fixed some minor networking and/or timer issues
- Fixed non-applied death animations on rivals team leaders in Investigate the Battleground task on dedicated server
- Fixed empty hint when enemies are near your group on fast travel
- Fixed missing RHS Arms Dealer stock
- Fixed showing both destroyed and non-destroyed military administrations on dedicated server
- Fixed wrong string formatting in Repair Antenna task
- Fixed wrong price hint in building menu
- Fixed wrong hint on vehicles with no cargo space
- Fixed inability to fast travel if players are occupying 
- Empty vehicles from military bases and airbases will require refueling
- Increased loot crate invincibility time during load/unload from 2 to 10 seconds so crate will not break during unload
- (TFAR Beta) Forced same SR and LR frequences for sides
- (Western Sahara CDLC) Fixed non-working Tura faction

## 2.0
### Additions
- Western Sahara CDLC support as complement content pack for Vanilla and Aegis templates (factions will receive new items, weapons and vehicles from WS CDLC)
- Rivals - OPFOR-backed guerilla faction that has different views on country's future, they will try to disrupt your insurgency movement with dirty methods, covert operations and blunt force
  - They will use cells in cities as their bases of operations, rebels can find out their locations by obtaining intel through various sources (interrogations of cell leaders and other factions leaders, laptops, passive income of intel data) and then eradicate them at that location which will completely cease their operations in particular area 
  - New mission types - Kill Cell Leader, Seize Hideout Cache and Investigate the Battleground (entry point for the Rivals gameplay mechanics, quest can happen anytime after reaching War Level 3)
  - Separate subfaction unit and vehicle roster
  - New random events - Drone Strike, Explosive Car, Roving Mortar
  - New Rivals Incursion Commander Menu tab - allows player to see progress on new threat eradication and allows commander to organize attacks on known enemy cells
  - Invaders and Occupants have new intel type that have the probabilty to show cell on a map or add progress to next cell reveal 
  - Enemy insurgents have a probability to spawn in the cities and in the wild near their cells with a spawn chance tied to activity level 
  - Cell leaders may drop military-grade laptop on death or surrender with it. Laptop has some valuable data that can be obtained, decrypted and used by rebels
  - Rivals units can be imprisoned or interrogated 
  - Separate activity counter in the top information bar which indicates constantly rising process of rivals activity with different actions on each activity level, rebels have to fight the process to reduce spreading of rival incursion and keep things more or less normal
  - Enable Rivals mission parameter - players may want to play classic Antistasi Plus experience so they can disable opposing insurgent faction entirely (requires new game start)
- Nearby vehicles can be refueled, rearmed and repaired via vehicle box if rebels have corresponding sources (repair/ammo/fuel trucks) stored in the garage (as it was pre-Antistasi Plus 1.7/pre-Antistasi Community Version 2.5.0)
- Police stations overhaul with the purpose to give another early game strategy and another way to obtain basic military gear
  - New marker type - Military Administration
  - New "Seize Military Administration" task type
  - Crate with early game equipment (rifles and some ammo for it, sometimes it can contain vests and helmets) will spawn there
  - Military Administrator will spawn there too, he might have some intel
  - Various militia and police units will spawn near and inside the military administration when enemy city with it in proximity
  - Building destruction, city capture or Seize Military Administration task completion will disable Military Administration enemy spawn there
  - Building destruction temporarily increases Occupants aggression and provokes an enemy response
- Malden terrain support
- New Esseker terrain support
- Sefrou Ramal terrain support
- Total list of supported terrains - Altis, Malden, Sefrou Ramal, New Esseker, Livonia, Chernarus 2020, Napf, Vidda, Virolahti
- Total list of supported modsets - Vanilla, RHS, 3CB Factions + RHS
- Full Localization support - mission strings have been exposed for localization so if you want to add your language or fix some spelling or grammatic errors in your language's localization feel free to open PR with translation on Github (only English and Russian localization are present at this moment)
- Interrogation is back, shows only for certain unit types other than ordinary soldiers to reduce tediousness of interrogation, can be either Search for Intel or Interrogate action on enemy, but not both simultaneosly
- Rescue Refugees task restoration
- Improved towing of wheeled vehicles parameter - physics-based towing with the usage of new `setTowParent` and `disableBrakes` BI script commands (unfortunately, vehicle driver seat has to be locked while doing so as per BI recommendations, new way of towing applies applies only on WheeledVehicle-WheeledVehicle and WheeledVehicle-TrackedVehicle towing pairs)
- Enable loot gather crates and loot helicopter commander ability parameter - ability to enable/disable loot crates and loot helicopter if needed
- Support Points Cap parameter - ability to tune maximum quantity of points used by non-lethal rebel support calls
- Rebel Garrison Limit mission parameter - how many units can be in garrison, 1.5x of value for airports, 1.25 for milbases, 0.5x for resources and factories
- New Time multiplier parameter values - 1:8 (Day = 3 Hours) and 1:4 (Day = 6 Hours)
- Added 10 value to "Number of the same item required to unlock" mission parameter as new minimal value for it
- Flag-icon for each Antistasi Plus variant, it will be shown at mission start
- AI factions will use animation sources on their supported vehicles too (SLAT cages, camo nets, different layout of vehicle doors etc)
- (Western Sahara) Tura rebel faction
- (Vanilla) NATO, CSAT, AAF factions
- (Aegis) AUKUS, NATO, CSAT, AFRF, AAF factions
- (RHS, 3CB Factions) AAF, AFRF, CDF, LDF, US Army, USMC factions 
- (3CB Factions) Rebel factions with different starting eqipment and vehicle black market stock - FIA, NAPA and CCM

### Changes
- 3.0 Community Version integration (Garage update, fuel stations, many improvements and fixes of various gameplay systems, migration to singular mod package etc)
- Antistasi Plus codebase migration to singular mod package environment, general refactoring of entire AP's codebase - microoptimisations here and there, unused code cleanup, almost every Plus feature was ported and reviewed during the port, general stability and performance improvements
- Vehicle Black Market new Community Version's UI, less strict and more dynamic approach to vehicle stock, different conditions to unlock certain vehicle types (war tiers, seaports, airbases etc), neutral vehicle skin appliance where possible, remade black market stocks from scratch for each modset
- Faction descriptions on hover (Factions tab in startup menu)
- Сhanged Commander/Rebel menu hotkey from CTRL + T to TAB, added ability to customize it's keybind via general Configure->Controls->Antistasi Plus menu
- Added new construction variants for each category
- Officers and traitors may have intel (it adds them to possible intel unit pool, increases their commanding and courage skills)
- Added vehicles from Vehicle Black Market to various armor pools, so enemy would react adequately on these kinds of vehicles, these vehicles could be sold via ordinary commander action etc
- Rifleman slot will have increased carry capacity bonus (15%->30%) to make slot this more attractive to occupy
- Moved UAV hacking trait from Team Leader to Engineer
- Loot crate balance pass - loot crate is no longer unbreakable, carrying loot crate breaks undercover, loot can't be gathered while enemies are in 50 meters radius from it, players can't sprint anymore while carrying loot crate (but still can jog), bodies will be looted only once (so they will be not repeatedly looted, forcing "we're done here, let's move to other place" altitude)
- Undercover balance pass - players can no longer stay undercover while driving civilian vehicle and wearing military equipment simultaneously, backpacks have been added to undercover check so players must use "civilian" backpacks (messenger bags and sport bags, black assault and field packs), fixed some undercover exploits (players could walk at any base and steal everything there without breaking undercover before etc), everyone except drivers must make their weapons non-visible (by putting them into vehicle cargo, backpack etc)
- Loot crate can be refunded via garage storing action
- Added icons for many player actions in context menu, adjusted icon positions (left side of action text)
- Rebel AI Units initial skill changed from 1 to 5 to reduce grind and tediousness of early game
- Fixed unintentional exclusion of undercovered players from possible random events actors pool
- Fixed civilian overpopulation issue due to some unknown quirks of population-town size dependency, might increase performance in all kinds of towns
- Fixed civilian helicopter exploit - civilian pilots will no longer jump out from their helicopters and planes if they get slightly hit by rebels
- Fixed no text prompt when POW recruitment fails
- Fixed wrong tooltip on money button
- Fixed broken napalm bombing
- Fixed fuel convoy despawn issue
- Fixed some cases when players unintentionally get promotional scores when they shouldn't, tweaked rank promotion system to be much less rapid
- Fixed typo about Support Points gain War Level in support tab
- Fixed unintentional ability to buy civilian helicopters when rebels have no captured airports
- Fixed wrong Smoke and Flare barrage round spawn height as there was no elevation preservation, reduced total number of flares and smoke rounds fired, disabled per-shot randomization of flare round
- Fixed inability to fast travel to rally point while being undercovered
- Fixed uninentionally shown Redo Arms Dealer Task button in Game Options menu
- Fixed issue where undercovered rebels coundn't recieve their share of periodical salary
- Fixed non-counting undercovered units for unflip near units check
- Fixed ability to Search for Intel on enemy leader multiple times
- Fixed APERSBoundingMine_Range_Mag error, also minefields might become more frequent/dense due to this issue elimination
- Fixed no early escape in random events in case if position for event wasn't found
- Fixed non-working despawn checks for Police Patrol, Post Ambush, Utility Truck Movement, Vehicle Patrol random events
- Fixed marker position in Ambush Officer task
- Destroy Artillery task easy variant will have patrolling medium group instead of full squad, mortars will be used instead of howitzers if the latter is not available in the modset, minor spawning and event handlers exploit fixes
- Reduced Deliver Supplies supply sacks defend time for easy/difficult mission variants to 90/180 seconds (was 120/240), fixed non-fully initialized units in reinforcement group, reinforcement group be militia squad in difficult mission variant,  mission can't be rolled for already captured cities anymore
- Reduced max number of prisoners in Rescue Prisoners and Rescue Refugees task to reduce tediousness of breaking them free and putting into transport
- Reduced delay between airdrops in Catch Airdrop task from 2 seconds to 1, added final notification when all crates have been dropped, reduced total quantity of crates to 2 (ammobox will be dropped if it's difficult mission variant), minor optimizations
- Ambush Officer site search will check if origin and destination are connected by roads
- SpecOps spawns on non-road controls on frontlines are no longer specops squad type only, SpecOps task minor spawner optimization (units will spawn only when players are in proximity), fixed non-initialized SpecOps units
- Rescue Informer task will have patrolling helicopter with search light on, minor spawner optimizations, difficulty and enemy quantity tweaks, mission can be rolled at night after War Level 3
- Removed timer reset from Bank Robbery task
- Removed APC/Light Armed Vehicle escort from Helicrash task to reduce complexity and tediousness of this task, minor fixes and improvements
- Rescue Smugglers mission will no longer roll on terrains without water
- Added action to carry salvageable crate in Salvage Supplies task
- Excluded tanks from Post Ambush event vehicles pool as it is too zhirno for players to have heavy tanks so early in the game, added light armed vehicles and light tanks to compensate narrowed vehicle's pool
- SAM and Radar spawn code had been rewritten, hopefully players will see much less flying and exploding AA stationary defenses
- Enemy panicked soldiers will use panic animation while running away
- Attempt to fix inability to save persistent Zeus constructions that might occur under some yet unknown circumstances (only BUILDINGS are Zeus-persistent, dynamic objects are not affected)
- Constructions can be built only near marker area (HQ, outposts, military bases, airbases, resources, factories)
- Undercover break will have sound cue
- Vehicles can be unflipped solo via any vehicle with repair capabilities
- Ability to cancel custom outpost establishment (cancel task button will appear near establish button in the Commander menu), refined autocancel conditions
- Press reporter spawn is back, also he will use press helmets from Laws of War DLC if it is turned on
- Returned intel spawn to Cargo Towers, tables and intel will have enabled physics if building was destroyed
- There is a chance that press reporter will spawn in Civilian Helicopter Fly-by event helicopter crew
- Enemy squad leaders might have flares if they have underbarrel grenade launcher
- Officers from Kill the Officer and Ambush Officer tasks will use officer uniforms and hats to help distinguish them from the rest of soldiers
- Traitors from Kill the Traitor task will use an SMG or carbine and will have a distinct looks to help distinguish them from the rest of soldiers
- Machinegunners and marksmen might have nightvision optics
- Notebook trap bomb will have beep sound when explosion is imminent
- Medical Vehicle reduces revive time to 8/16 seconds (for medic and non-medic) and allows medic to fully heal treated soldier on revive, added medical vehicles to more outpost types spawn pool
- Medical objects will be dropped on ground when treatable person is player or player is medic 
- Increased cost (50->100) for trenches and obstacles contruction, increased cost of sandbag and concrete bunkers 
- Players can't build anymore when enemies are nearby
- Howitzer support has it's own separate support category, adaptation for new support system 
- Mechanized Air QRF (former Vehicle Airdrop) Support minor tweaks and adaptation for new support system, airdrops will be used for waved attacks and invader punishments
- New garage-style placement for the rest of placement types (loot crate, vehicle box's vehicle shop, constructions and vehicle black market)
- Colored rows in arsenal - red for forbidden items, yellow for limited items, grey for initial rebel equipment and white for unlocked and other types of equipment
- Colored statuses for Occ/Inv aggression indicator in the top information bar and other notifications  
- Sort by color in arsenal
- Towing previously reported or military vehicle will break undercover
- UPSMON patrols jitter (frequent switch from running to walking and vice versa) fix
- Players will start with 500 money (new default value for initial money parameter)
- Players will be be not recognized while being undercovered by garrisons on roadblocks on first War Level as insurgency is not yet started and it's relatively peaceful time
- Military bases, airports and Invaders outposts will be guarded by Tier-2 Military from the beginning instead of Militia
- Rebel airstrikes max quantity will be capped by captured airports * 2 value
- Players will no longer start being stuck in some object in the beginning of the playing session, mission tries to find safe position for them
- Smoother logistics load/unload animation
- Templates with unavailable addons will show required addons in tooltip
- Factions will have different marker shapes for milbases and seaports
- "Equip on buy" checkbox in Arms Dealer Store will be hidden when headless clients are present as it is not working together
- Replaced body removal function in resource check tick with ordinary cleanup function (might increase resource tick performance)
- Added MG, LAT, Marksman units to patrol and two-man QRF/reinforcement unit pool
- Added Snipers and Marksmen to four-man medium squad unit pool
- Destroying vehicles will destroy attached logistics items too (with the exception of food sacks)
- Commander support tab info bar will show limits for airstrikes, support points and total count of airbases
- Officers may call support too
- (Altis) Added new outpost near Charkia, removed 2 outposts and added resource point under Zaros Bay
- (Napf) Fixed flag position in outpost near Freidorf, removed resources near Trueb due to blocking issue
- (Livonia) A lot of marker fixes, some resources were removed, added 1 new outpost
- (Vanilla, partially Aegis, a little bit for RHS and 3CB Factions) Modular approach to templates regarding DLCs - DLC content will be added as complementary content for faction templates if it was turned on via startup menu on template selection tab (only for DLCs and Western Sahara CDLC, other CDLCs will be turned on automatically)
- (Vanilla, Aegis) Replaced Van with Zamak in the vehicle box truck category
- (Aegis) Fixed inability to play with Aegis modset
- (Aegis) Fixed potential CAS and AA airstrike errors due to unsupported aircrafts
- (Aegis) Added SKS, NCAR-15, Fort-65x, SCAR-L, HEDP GL grenade and Western Sahara weapons to Arms Dealer stock
- (RHS, 3CB Factions) enemy riflemen may carry light HE launcher 
- (RHS, 3CB Factions) US grenadier may use M32 Grenade Launcher  
- (RHS, 3CB Factions) Added NSP-30 and NSPD flares in starting gear pool 
- (3CB Factions) Added LADA, SUV, Hilux PKM logistic nodes

### Removals
- Other terrains are not yet supported, many of them will be ported in the next versions of Antistasi Plus
- Faction Defeat mission parameter has been removed, Occupants and Invaders can be always fully defeated
- Removed PVP
- Removed "Kill Collaborationist" mission type (Military Administration feature basically integrated that mission into general gameplay loop)
- Removed ability to buy fuel trucks at HQ as it's not compatible balance-wise with new fuel economy
- Removed .sqfc compiled code (it didn't survived mission->mod migration, maybe some time later)
- Removed Rebels vs Invaders game mode as it is obsolete with new template selection system which allows to select any invader faction as occupant
- Removed "Decrease loot quantity as player count increases?" parameter, player scaling is enabled by default
- Removed lootcrate airdrop and HMG airdrop support types 
- Removed Mortar custom outpost type as there is no way to make it non-useless without introducing couple balance-breaking exploits
- Removed HQ Management action from Petros (it's functionality is still available in the Commander Menu (TAB by default))
- Removed Cover Before Revive feature (never worked at all)
- Removed all war tier restrictions on player squad reinforcement action
- Removed possibility of attack helicopter spawn as airbase defense patrol
- Removed enemy intel search money drop probability (they may carry money in their inventory instead)

## 1.9 
*unreleased, discontinued and unavailable for public access version (final version before migrating from mission to mod), most of it's changes were ported to 2.0 thus moved from 1.9 section to section above, this changelog represents leftover unported changes by various reasons*
### Additions
- New convoy type - Food Convoy
- Iron Man Mode mission parameter - one life for Petros. If he dies, save file will be erased and mission will be ended (one-time, irreversible action for current save after full mission loading)

### Changes
- (Taviana) Small custom object placements changes

## 1.8.3.2
###
- Fixed neverending Invaders Punishment mission that might occur after War Level 5

## 1.8.3.1
### Changes
- Fixed inability to access commander reassign button in commander menu for non-commanders

## 1.8.3
### Additions
- Ability to toggle uniform and non-armored headgear randomization for Rebel Loadouts via new switch button in commander menu (ENABLED is pre -1.8.3 behaviour, DISABLED completely disables uniform and headgear randomization allowing commanders to standartize look of their rebels)
- (3CBF) Added CZ550 and M1903A1 to starting gear
- (3CBF) Added USP, PPSH-41, FN FAL, ACR, AUG, Scoped M1901A1, CZ-550 Scope to Arms Dealer store
- (3CBF) Added SKS to CDF and AFRF militia units (carbines category)
- (CUP) Added AK-12, AK-15 and AK-19 to Arms Dealer store
- (CUP) Added AK-12, AK-15 to AFRF elite and specops units

### Changes
- It is no longer guaranteed that firing missile at aircraft will trigger support response (20% chance for CAS, ASF and Gunship supports, 10% chance for everything else)
- Fixed exploit that allowed to call commander menu while being not a commander
- (3CBF, RHS) Replaced Mk. V boat with vanilla boat due to balance issues
- (3CBF) Replaced Mystere with Mig-21 for CHDZZ templates in Arms Dealer vehicle store

## 1.8.2.2 
### Changes
- Fixed incorrect work of military base creation function if there are no roads in proximity

## 1.8.2.1 
### Changes
- (Cam Lao Nam) save corruption fix

## 1.8.2
### Changes
- Multiple fixes and improvements to Salvage Helicrash mission
- Fixed non-invincible airdroppable autoloot crate
- (Khe Sanh) Moved seaport that doesn't allow to buy vehicles, crates and place rally point to another area thus fixing those issues
- (Altis) additional outpost and radio tower

### Removals
- Removed leftover debug system chat posting

## 1.8.1

### Changes
- Fixed missing direction on built constructions
- (SOGPF, SOGPF + Unsung Redux) Fixed missing civilian helicopters on rebel template
- (SOGPF, SOGPF + Unsung Redux) Fixed non-working Loot Helicopter commander ability
- Fixed non-persistent Zeus-placed constructions on dedicated server

### Removals
- Removed "Allow Items and Vehicles from S.O.G. PRAIRIE FIRE DLC?" and "Allow Items and Vehicles from Global Mobilization DLC?" parameters (CDLC content presence will depend on which CDLCs are enabled in A3 Launcher)

## 1.8

## Additions
- SOG Prairie Fire CDLC support
- Cam Lao Nam terrain support
- Khe Sanh terrain support
- RHSPKL (Prei Khmaoch Luong) terrain support
- Chernarus 2020 terrain newest update support
- Unsung Redux (SOGPF complement mod) support
- Persistent Save for Zeus-placed Constructions mission parameter
- Enemy AI Maximum Accuracy mission parameter
- Load to Vehicle action (Arsenal backport, replaces Vehicle Arsenal action)

### Changes
- 2.5.3 Community Version integration (multiple fixes of core systems of Antistasi, player balance scaling)
- Invader Punishment mission is back
- Airbases and milbases will no longer spawn howitzers (mortars will be used instead) when players in proximity, they will be only used as support 
- Fixed no undercover break on outposts and sea ports
- Fixed "Error Type Array, expected String" on some unit spawn
- Fixed overlapping annoucement text
- Fixed Rescue Prisoners _houseX error
- Fixed inability to garage vehicles on milbases
- Fixed exploit that allowed to sell unlocked items to Arms Dealer 
- Fixed unintended ability to get second Find the Arms Dealer task if task was persistently saved but not completed
- Enemy support call timeout increased to 20 minutes
- Increased Arms Dealer stocks - rifle stock (15->20), pistol stock (20-50), launcher stock (10->15)
- Helicrash mission undefined variable fix
- Multiple static MG types support
- Limited Fast Travel mission parameter is on by default
- Players will be kicked if they will try to join into PVP slot of defeated faction
- Faction defeat will hide faction PVP marker
- Enemy will no longer spawn in the middle of friendly town on Deliver Supplies missions
- Reduced number of cops in Supply mission
- Persistent weather variable uses overcast instead of rain
- Rebel Troops Training no longer increases infantry price
- Surrendered units will be removed by garbage cleaner
- Big guard towers will be occupied 
- Deliver Supplies timer will no longer reset
- Ability to override Demolitionist loadout in Rebel Loadouts
- Arsenal action icon (Arsenal backport)  
- Raw position for precision placing mode (SHIFT hotkey while placing something)
- Vehicles can be put into garage near Arms Dealer
- Slightly lowered chance to pop smoke grenade by enemy in some circumstances (40%->35% for general AI reactions, 60%->50% for medics)
- (GM, SOGPF) Items from Global Mobilization may appear in loot boxes when SOGPF DLC is used and "Allow items from Global Mobilization" option is turned on
- (RHS) Lowered recoil of Zu-23 when it is mounted on vehicle
- (3CB Factions Cold War, Takistan) Fixed no tribal uniforms issue 
- (CUP) Adjustments of faction templates with the usage of new CUP Vehicles/Units/Weapons mod items
- (SOGPF) CDLC napalm usage instead of Antistasi implementation

### Removals
- (GM Cold War Mode) Removed HK69 grenade launcher from Bundeswehr weapon pool
- (Cold War mode) removed unintentional modern variants of AS VAL from Arms Dealer store  
- Removed Interrogate action on enemy surrendered units
- Removed inability to put aircrafts on non-airport markers
- Removed Post Log Messages to systemChat (Debug) mission parameter

## 1.7.5
### Additions
- Simplified Chinese translation (provided by GoldJohnKing)

### Changes
- 2.5.2 Community Version merge (garrison corruption fix, some small fixes of core systems of Antistasi)
- Introduced cap on Airstrikes - 5
- Increased MORTAR support distance up to 4 kilometers
- If distance is too short for howitzer, howitzer will be swapped with ordinary mortar
- Reduced big attacks max waves to 3
- Changed condition on Arms Dealer store distance check (should eliminate "you're not near Arms Dealer" error when buying vehicle from him)
- Ability to fast travel to Arms Dealer store when Fast Travel mission parameter has Limited value
- Fixed missing Tab key functionality (skip projectile camera following)

## 1.7.4
### Additions 
- Ability to set emplacement direction on map (first click on map sets up position, second - direction)

### Changes
- Fixed _cured undefined variable error
- Fixed roablock barricade duplication issue
- Fixed missing rebel squad leader unit type in squad leaders pool (rebel squad leaders will recieve rifles on autoequip)
- Fixed missing Arms Dealer store action text for non-English languages
- Fixed enemy inability to use flares in some cases
- Increased number of sources of heavy militia vehicles (affects QRFs, large attacks)
- Fixed wrong variable type in garrison replenish function that prevented some garrisons from being replenished, replenished garrisons will be no longer replenished by wrong faction troops, requires new game start as old garrisons already filled with bad variable (hopefully, i think lost some sanity debugging this)
- Fixed wrong reward for Catch Airdrop function
- Fixed SQF error message when there is not enough money to buy loot crate
- Reduced number of vehicles participating in single attack across all difficulty levels
- Precision mode (SHIFT key) for building position selection mode switched to raw position (allows to put buildings more precisely)
- Fixed inability to put ammocrate from Catch Airdrop mission into vehicles
- Fixed wrong cargo position of barrel palette from Catch Airdrop mission 
- Added light armed vehicles to frontline outposts spawn pool
- Added marksman to SF squads
- Black Market Vehicle Tier 2 will unlock on 5 war level instead of 4
- New Maximum Civilian Pedestrians parameter value - 0 (completely disables footmobile civilians in cities)
- Not every 8-man squad will have soldiers with long range radios (this will reduce quantity of soldiers that able to call for support)
- Arms Dealer store operations will be rounded (no more decimal values)
- Loot crates are recognized by Arms Dealer container detector (items can be sold from/bought into crates)
- Arms Dealer will no longer spawn too close to enemy outposts
- Undercovered players will no longer unvoluntarily drop loot crates and statics while carrying them
- Find The Arms Dealer task can be completed by undercovered rebels too
- (CUP,RHS) Fixed wrong condition that led to no usage of howitzer on enemy Mortar Support actions
- (Cold War Mode) Takistan will use middle east civilian template
- (Vidda, Weferlingen, Isla Abramia, Napf) Fixed missing Spawn Points for airports that may lead to neverending big attacks, missing road patrols etc 
- (Vidda) new outpost and resource
- (CUP) Fixed AFRF Arid wrong HMG classname
  
### Removals
- Removed mission ending on SOGPF detection (it's still not supported yet, but it will prevent from abrupt mission ending when SOGPF is occasionally turned on)
- Removed Rescue Refugees mission
- Removed Invader Punishment mission

## 1.7.3
### Changes
- (RHS) Missing helicopters in Vehicle Black Market fix
- (CUP) Removed hooded anorak uniforms as they clip with headgear

## 1.7.2
### Changes
- Fixed no basic items in Cold War mode
- Fixed no undercover break on milbases

## 1.7.1
### Changes
- Reduced frequency of AIRDROP supports
- Ability to customize squad leader loadout
- Fixed Cold War mode crate filtering function
- Ability to buy black market vehicles with faction money
- Unlimited fast travel by default

## 1.7
### Additions 
- Weferlingen support
- Takistan support
- Vidda support
- Isla Abramia support
- Rebels vs Invaders gamemode is back (with some fixes and adjustments to make it as same as possible as fighting BLUFOR occupants as usual, a bit experimental but stable, also it's more hardcore than default game settings)
- Rebel Loadouts - ability to customize AI rebels weapons and equipment for each infantry class (commander menu, HQ Management tab - intended to be used by experienced commanders that know what they're doing, also you can always rollback to traditional randomized loadouts)
- Limited Global Mobilization CDLC support as complement content pack for 3CB Factions and Global Mobilization Extra - Altis Armed Forces
- (3CB Factions, 3CB Factions + Global Mobilization) Cold War Mode - Authentic US/NATO and Soviet/Warsaw Pact unit rosters with equipment and vehicles up until first half of 90s, exclusion of equipment that does not fit Cold War time period from all sources (enemies, loot crates and Arms Dealer store) with few exceptions. To enable Cold War Mode select US Army Cold War faction in 3CB Factions's "Select Occupant Faction" parameter OR load 3CB Factions with all it's dependencies + Global Mobilization CDLC
- New mission type - Rescue Rebel Informer
- Persistent Constructions Removal action (new button in Constructions submenu)
- Buildable Mortar and HMG Emplacements
- Ability to move and save static weapon position and direction in AA/AT/Mortar/HMG Emplacements
- "Cover Before Revive" AI Management option (ability to toggle AI squadmates behaviour to take your body to nearest cover before reviving, client-side)
- High Command Transfer - ability to transfer all your AI squadmates to commander's High Command which allow to use them as HC squad
- New enemy support type - Vehicle Airdrop (lightweight aeromobile APC with squad paradrop)
- Player Death Penalty mission parameter - how many money player will lose on death
- Maximum Civilian Pedestrians parameter - how many pedestrians might be simultaneously in the city (allows to tune performance of Civilian Presence modules on weak PCs)
- Show/hide top information string (CTRL+HOME shortcut) 
- (3CB Factions) USSR, US factions for Cold War Mode (playing against USSR only is possible too, you need to choose Rebels vs Invaders while choosing US Cold War faction in 3CB Factions faction selector)
- (3CB Factions + Global Mobilization) Warsaw Pact (USSR + East Germany), NATO factions (US + West Germany) for Cold War Mode (playing against Warsaw Pact only is possible too, you need to choose Rebels vs Invaders while loading GM+3CB Factions modset)
- (3CB Factions) Takistan Army (TKA) faction
- (Global Mobilization) Altis Armed Forces faction, automatically detected when Global Mobilization CDLC and Global Mobilization Extra - Altis Armed Forces mod is turned on

### Changes
- 2.5.1 Community Version integration (Hakon's new garage and multiple fixes and improvements of core systems of Antistasi)
- Fixed AI Control Time for HC squads
- Fixed AI Rebel Strike wrong localization string at title
- Fixed singleAttack undefined variable error
- Fixed wrong initial AA Emplacement and Roablock icons
- Fixed inability to recruit soldiers on emplacements, roadblocks and watchposts
- Fixed panic fleeing vehicles
- Fixed inability to get Destroy Radio Tower task with Invaders radio tower
- Fixed possible out of map bounds helicrash position in Helicrash task
- Fixed possible out of map bounds Arms Dealer position in Find the Arms Dealer task
- Fixed inability to repair radio towers with Rebuild Assets commander action
- Fixed Undefined Variable error when mortar support is called by enemy
- Fixed Post Ambush Random Event close spawn
- Fixed fast disappearance of some screen announces
- Fixed inability to use most mines from arsenal and inability to create AT Minefield (Create Minefield action)
- Artillery Response minor fixes
- Unflip Vehicle various fixes
- Rebel training minor fixes (45 level cap, price calculations have been adjusted to new skill cap to prevent excessive price snowballing with each training level past 20)
- One long barricade on road instead of two on sidewalks to prevent roablock vehicle collision issue
- Military bases have been included into win condition check (previously only airports were counted, rebels required to have majority of country population and all airbases and milbases to win)
- Arms Dealer will sell UAV terminals
- Additional "Number of the same item required to unlock" parameter values - 15, 20, 100, 200, 500
- Multiple vehicles for same category support for militia, militia tanks support
- Immediate mission ending due to unsupported modset configuration will show log message in the bottom left corner of screen
- Moderate reduction of money rewards from task completion
- Top string will no longer show Inv aggr when Reb vs Gov gamemode is running and vice versa
- Changed keybinding for Commander Menu and Player Menu to CTRL+T keyboard shortcut due to conflicts with some mods that uses O key
- Find the Arms Dealer task persistence (if players got the task, but it wasn't completed, players will retain the task after server restart)
- All non-primary faction militia has been replaced with Rear Echelon troops from same faction (except Aegis modset)
- Added bunch of new intel spawn locations - Radar Complex HQ, Guard House, Barracks
- Kill Collaborationist tasks will be not guaranteed when police station is in radius (this will give other assasinate type tasks enough room to breathe)
- Various military buildings static weapon emplacement support
- Invaders cargo trucks unit roster support
- Synchronized prices of emplacements and statics in Buy Vehicle menu
- Added one medic to initial static Emplacement crews to increase their survivability 
- Multiple AA vehicles template support
- Multiple Occupant/Invader CAS/AA aircrafts support
- Lowered paradrop plane height to spawnable distance to give defenders chance to shot down the plane
- More militia AT troopers for both Occupants and Invaders
- Deliver Supplies mission will have a couple of enemy squads to make mission less boring
- Paradrop attendance will be turned on by default
- Chance to spawn non-cargo truck on enemy resources and factories (fuel/medical/repair trucks)
- Additional convoy type - fuel convoys
- Commander's ability to buy loot crates with faction money
- Changed max distance from HQ for tasks to 3000 by default
- Returned assassinate mission types to forced mission request function
- Reduced number of waypoints, coverpoints and escape points for Civilian Presence Modules (might lead to better performance on some PCs)
- Changed restorable parameter title from "Default" to "Load from save (Default)" to reduce confusion amongst the players
- (Defeat Factions parameter) Only rebels may defeat faction for good, so Occupants and Invaders can't knockout each other anymore
- (RHS, CUP) Fixed bags instead of statics on some outposts in some cases (only CDF and AFRF were affected)
- (RHS, Aegis, 3CB Factions, CUP) Rear Echelon/Militia engineers and medics may use shotguns
- (RHS) turretless BRDM-2 logistic nodes (allows to mount cargo, ZU-23 and other statics on top of them)
- (RHS) KRAZ, UAZ cargo support
- (RHS, 3CB Factions) Removed T-15 from AFRF templates
- (RHS, 3CB Factions) Fixed misconfiguration that led to less launchers on enemy troops
- (3CB Factions) HIL faction lineup changes - RBS-70 instead of static Stinger, M240 on tripod instead of M2
- (3CB Factions) MT-LB logistic nodes (allows to mount ZU-23 on top of them)
- (3CB Factions) SPG-9 instead of Kornet in all templates
- (3CB Factions, CUP) Replaced Chernarus Police with Gendarmerie on tropical maps 
- (Aegis) Fixed wrong AUG 3GL mags
- (CUP) Vanilla weapons and equipment will no longer appear in crates at enemy outposts 
- (CUP, RHS, 3CB Factions) Fixed launchers duplication arsenal issue
- (RHS) Arms Dealer Stock changes - added PM, Sa vz. 61, Zastava series rifles, M249 PIP, removed vanilla RPG-7 and some vanilla scopes and attachments, adjusted prices of some items, added some additional magazine types and attachments
- (3CBF) Arms Dealer Stock changes - all changes from RHS Arms Dealer change plus added all MP5 variants, CZ75 Czechmate, M16A3, FAMAS, M14DMR, M1 Garand, adjusted prices of some items, added some additional magazine types and attachments
- (Livonia) New factory and milbase
- (Taviana) Road garbage removal algorhitm improvements (significantly cut .sqm file size due to less usage of manual object removal modules, faster mission loading times)
- (Chernarus 2020) new outpost, new resource, new factory on the North
- (Taviana) Additional outpost at the small island on West of Taviana, hangar fix on Sector B, radio tower fix on race track, Novistrana police stations support, removal of radio tower on Sector B
- (Panthera, Napf, Taviana, Chernarus 2020) Navgrid update (may resolve some pathfing issues)
- (Napf) Critical pathfinding issue has been resolved by navgrid update

### Removals
- Removed CIWS (Phalanx/Praetorian air defence systems) from airbases and military bases
- Removed Antistasi Units template support
- Removed possibility of intel spawn in high military towers 
- Removed ability to recruit mortar units at garrison (mortar still can be bought in vehicle menu at flag and then occupied by AI rebel)
- Removed hidden Minimum Players for PVP parameter
- Removed Loot Truck
- Removed radio item requirement for player markers
- Removed all DLC parameters since they seem to confuse people since they're affecting loot boxes loot pool and civilians only and does not work in modded environment at all, all DLCs will be enabled for vanilla except Karts, Art of War and Laws of War since they have no real gameplay value
- Towns will no longer flip on it's faction defeat (never worked properly)
- (Vanilla) Removed possibility of spawning OPFOR GMG on some outpost buildings
- (RHS, 3CB Factions) Removed M1 Garand from initial rebel weapons to give other starting weapons enough room to breathe

## 1.6
### Additions
- Tanoa support
- Virolahti support
- New commander ability - Loot Helicopter (Helicopter gathers scattered loot at area and put it into crate)
- (CUP, RHS, 3CB Factions) Military bases and airports will have howitzers instead of mortars on artillery positions
- Included military bases into possible mortar support locations
- "How many persons required to unflip vehicle" mission parameter
- Rally Point balance pass (Ticket system (mission parameter), fast travel on it can be only used near HQ, rally point can be only abolished on HQ or near rally point itself)
- APCs in militia vehicle pool
- Chemical Airstrike 2.0 - refactored code, invaders will use it too, damage zone is affected by wind, new visual effects
- Civilian Presence city dynamic city size, waypoints can be not on roads too
- Random Events first implementation with Police Vehicle Patrol, Civilian Helicopter Fly By, Utility Truck Movement, Military Vehicle Patrol and Post-Ambush Vehicle encounters
- New Arms Dealer item type - gasmasks (can be bought at Misc section in Arms Dealer store)
- (CUP, RHS, 3CB Factions) Chernarus Defence Force (CDF) Unit Roster
- (CUP, 3CB Factions) Horizon Islands Legion (HIL) Unit Roster

### Changes
- Interrogations and recon planes reveal positions to AI rebels too
- Separate save ID for Antistasi Plus (prevents Antistasi Community Version saves loading which does not work on Antistasi Plus)
- Radioman call support time reduced to 45 seconds, cooldown to 15 minutes
- Changed respawn key from E to R when laying unconscious
- Fixed inability to move HQ assets on HQ border
- Fixed error that does not allowed to roll Helicrash and Airdrop missions
- Fixed wrong invader T1 infantry loadouts
- AT static on top of big towers has been replaced with MG/GMG (depends on faction and modset)
- Fixed Kill Collaborationist POW issue
- Added APCs into Single Attack fallback vehicle pool
- SF radiomen will have the ability to call support
- Single Attack may roll armored vehicles response  
- Rally Point travel will no longer dismount AI units in squad (they will not travel and stay in the vehicle at their origin position)
- Attempt to fix "trying to send a too large non-guaranteed message" log spam
- Log Level will be INFO by default
- (RHS) Empty Launchers will be removed from arsenal on each Arsenal Manage tick
- Cities will change loalty to rebels when their respective faction is defeated
- Top info string will reflect factions current status
- Fixed various typos
- (Panthera) seaport_3 objects fix

### Removals
- Removed Trader on HQ mission parameter with tied functionality
- Removed Grenadier and Autorifleman slots, merged their abilities with the Rifleman and Team Leader (Riflemen got carry capacity, audio and camo coeffs, but lost UAV hacking, Team Leader got UAV hacking instead)
- Removed Fatal Wounds
- Removed "Should Explosives become unlocked?" mission parameter
- Removed Pursuers

## 1.5.5
### Additions
- Ability to hire MG car team

### Changes
- Fixed cost-free AA trucks
- Fixed empty gunner seats in some hirable vehicles
- Removed debug spam in message log
- Russian localization fix
- (3CB Factions) Fixed flatbed truck for rebels instead of infantry truck

### Removals
- (Panthera) Fixed leftover objects

## 1.5.4.1
### Changes
- Fixed cost-free Rocket/Artillery Hiluxes (3CB Factions)
- Fixed broken vanilla templates

## 1.5.4
### Additions
- New commander ability - Loot Crate Airdrop

### Changes
- Reduced cost of constructions
- Fixed inability to sell vehicles after first initial try
- Airdrop/bombing plane replaced with vanilla syndikat plane (not enough speed and durability on other planes from mods (RHS, CUP, 3CB))

### Removals
- Removed War Level requirement on FIA troops training

## 1.5.3
### Additions
- Ability to use Fast Travel system with rally point (in adddition to "Travel To Rally Point" action on HQ flagpole)

### Changes
- Rocket Camera became Projectile Camera - can follow any projectile that launched from rifle with high magnified scope (use TAB to cancel camera following), launcher functionality remains
- Airbases will have appropriate flag marker instead of default FIA one
- Arms Dealer garbage cleaner removal fix
- Share Faction Money no members fix
- Fixed support points locality issue (increments on resource check wasn't broadcasted through network)
- Reduced probability of rolling arms dealer discount intel type and removed money reward from it
- Tied aggro-dependent number of vehicles attacking player in single attack to difficulty settings
- Reduced number of vehicles participating in single attack in Easy and Normal difficulties
- (Livonia, CUP) Fixed unintended CUP Terrains dependency
- (CUP templates) Right PSO-1 scope for SVD

### Removals
- Removed chance to spawn money on tables on military outposts
- Removed force walk on carrying loot crate
- Removed member distance and member reserved slots parameters with tied functionality
- Removed unnecessary .sqfc files

## 1.5.2
### Changes
- Carry static weapon fix (dedicated server fix)
- Establish AA/AT Emplacement War Level typo fix
- Rebel outposts no static weapon/vehicle gunner slot occupation fix

## 1.5.1
### Additions
- New radioman infantry type - populates some infantry squads, calls for support when needed (instead of any squad leader, as it was before), players have the ability to cancel support by shotting radioman before he makes support call
- Taviana support is back
- (TFAR Beta) Force same SW and LR frequencies for side

### Changes
- Carry Loot Crate fix
- Disabled smoke trails for non-existent artillery shells from Destroy Artillery mission
- Fixed label size in Buy Vehicle menu
- Fixed inability to travel to rally point when someone in your squad is inside vehicle
- Fixed War Level typo in Buy Squad message
- Fixed multiple sound spam on Reveal Enemies interrogation action
- Increased Reveal radius for Reveal Enemies interrogation action (50->100 meters)
- Napalm for AI will be off by default
- Randomized bomb type for enemy aircraft support action to reduce napalm spam
- Squad call for support cooldown increase (5 minutes -> 20 minutes)
- Cops will use only predefined weapons instead of all SMGs included in game
- Time to call for support increase (~15 seconds -> ~30 seconds for non-infantry, ~15 seconds -> ~45 seconds for infantry)
- Implemented chance for AI units throwing smoke grenade on danger instead of throwing it all the time
- (Antistasi Units) No disposable launchers fix

### Removals
- Removed smoke in radius from landing helicopters and other vehicles that have no built-in smoke launchers

## 1.5
### Additions
- Livonia support
- Panthera support
- 3CB Factions support as RHS+ - expands Occupants/Invader factions with new vehicles and units, replaces vanilla civilians and their cars with 3CB Faction ones, adds weapons from 3CB Factions to Arms Dealer store, expands starting arsenal with SMLE and Sterling SMG
- UI/UX overhaul - new commander and ordinary player menu (O key shortcut), all other menus had been remade on new UI framework
- Construction overhaul: persistent save for everything players build, revamped UI/UX, much more options to build (has built-in tuneable construction cap, LIFO principle)
- New commander abilities - Smoke Barrage, Flare Barrage, Light Vehicle Airdrop, HMG Airdrop, Recon Plane Run, Supply Crate Airdrop, Chemical Airstrike
- New special commander ability - Paradrop (commander can move player paratroopers to airplane for HALO jump on desired location, costs 1 support point and 500 euros, players must turn on ability to be moved into aircraft in Game Options menu (O key or map-on-tripod object on base))
- Support points for non-offensive commander abilities (capped at 3 max, requires War Level 3 to start gaining them)
- Rally Point - temporary fast travel point that commander could establish (Y->Commander->Place Rally Point, use flagpole on HQ to travel on it, removal refunds 75% of it's cost, units-on-foot-only)
- Civilian Presence Module - Antistasi's ambient footmobile civilians were replaced with the vanilla Civilian Presence Module (no more cilivians in the middle of nowhere, more performance as civilians will use Agent behaviour instead of Unit, civilians will panic and try to find cover in the middle of the firefight) 
- Discord Rich Presence (automatically turns on when client activates Discord Rich Presence mod from Steam Workshop, updates discord user pop-up window with game situation messages, works only when game language is English due to DRP encoding issues)
- New intel types - Arms Dealer Store Discount and Convoy Route reveal (marks next convoy route on map for ambush)
- Ability to buy civilian plane, repair and fuel trucks (military section in vehicle crate, unlocks at 3 factories (repair truck), 3 resources (fuel truck) or airport (civ plane))
- New action on surrended enemy - reveal near enemies position for 30 sec
- Ability to repair military buildings on rebel-controlled points
- Ability to sell non-unlocked guns and items at arms dealer store
- Initial Player Money mission parameter
- Defeat faction mission parameter - rebels could defeat any enemy faction altogether by capturing their last outpost so they will be no longer active on the field and launch any attack on rebels, enabled by default
- Chance for oversized garrison - if aggro is high, there is a chance that garrison will be more populated
- Rocket Camera (Game Options)
- Tune weather and fog options (Environment tab in commander menu)
- Some vehicle  boxes/hangars have a chance to spawn empty heavy vehicle inside it (only on military bases and airports)
- Ability to hire vehicle crew squads
- .sqfc bytecode support where possible (may lead to faster loading times and function execution in some circumstances)
- (Antistasi Units) Cherno 2035 unit template (needs Aegis, Atlas, Atlas- Opposing Forces, Police, CUP Weapons, CUP Vehicles, CUP Units and After East Wind mods to proceed)
- (Chernarus 2020) New outposts and other points of interest on North-East of map
- (CUP) BAF faction mission variant (mission parameters)
- (CUP) USAF faction mission variant (mission parameters)
- (CUP, RHS) Additional vehicle categories in Vehicle Black Market
- (RHS) Added RPK-74M, AKMs, MG42, FIM-92 Stinger and 9K38 Igla into Arms Dealer Store stock
- (RHS, CUP, 3CBF) Ability to buy AA car through vehicle box on HQ

### Changes
- Merge with 2.4.1 Community Version
- Overhauled rebel progression - buying some vehicles at vehicle box, establishing outposts or hiring some squad types are bound to war level and/or captured points 
- Assign As Loot Vehicle replaced with Create Loot Crate action (use flagpole on outpost or vehicle box on HQ) due to design inconsistencies
- Disbanding outposts now refunds correct HR and money value (100% HR and 75% money)
- Artillery triggers counterattacks too (same as it already works with mortars)
- Multiple improvements to Kill Collaborationist, Rescue Smugglers and Destroy Artillery tasks
- AI Limit option maximum changed from 200 to 250
- Moved Artillery Support menu from Shift+Y to AI Management submenu
- Increased Loot Truck price from 1000 to 1500
- AI units have a chance to drop their guns and run away instead of surrender when their morale is low
- Multiple "Search for Intel" action fixes - fixed some bugs and exploits (multiple searchs on same squad leader), localized string for action, search process visualization
- Remade announcement system - much less messages on screen will be overwritten by new information
- AA Emplacements will scan horizon for targets (this will increase their situation awareness, but still not totally fix their built-in stupidity)
- AA/AT Emplacements static gunner replaced with militiaman (allows to replenish gunners on these emplacements)
- Sum Similar Weapons to Unlock changes - optimization pass (less memory allocations, hashmap usage instead of arrays), weapon similarity check changes (attempt to reduce different caliber weapon unlocks with same weapon origin (for example, sudden early M110 unlock situation)), bugfixes, pistols inclusion
- Airbases have SAM sites too
- CIWSes and AA vehicles on airbase will scan horizon
- Adjusted commander loadCoeff (1.4->1.0)
- Move Static Weapon action renamed to "Move Static Weapon/Loot Crate" to reflect new functionality
- Previous vehicle tiers will get a discount when next tier is unlocked (Vehicle Black Market)
- Players can fast travel to Arms Dealer location
- Ability to reroll Arms Dealer location (Game tab on map -> Reroll Arms Dealer Task, commander only)
- Patrol vehicles around military bases and airports will not spawn if side is out of vehicles
- Laser batteries are available from start
- Initial rebel loadout weapons, backpacks and chestrigs changes
- Initial player money on start increased from 100 to 200 
- First document steal or laptop hack in campaign will always have arms dealer task assignment
- Reworked revive movement delay fix - units will gain their controls back a lot faster, without any delay after initial animation played
- Flag on HQ will have specified rebel flag texture
- Infantry Tiers improvements - T1 is militia (War Level 1-4), T2 is regular army (War Level 5-7), elite armed forces is T3 (War Level 8-10), Invaders got new treatment too, each tier has it's own set of weapons and equipment
- Vehicles can be unflipped with near friendly AI units too now (not only with players as it was before)
- "Number of the same item required to unlock" parameter new values
- Fixed "maximumLoad" arsenal bug
- Default commander can hack UAVs
- (2.4.1 CV) All unit templates have been remade
- (2.4.1 CV) Vanilla template has been greatly expanded, militia faction changed to AAF
- (2.4.1 CV - Napf, Chernarus 2020) New navgrid/pathfinding system
- (2.4.1 CV) Faction base soldiers (instead of all being Greek like it is in CV)
- (Altis, 2.4.1 CV) BLUFOR version replaced with INDEP version due to 2.4.1 template changes
- (Aegis) Zamak Flatbed logistics support
- (CUP) Static weapons logistics support
- (CUP) UAZ and some Humvees can load small cargo 
- (CUP) BRDM-2's can load medium-sized cargo and some static weapons (Metis ATGM and Zu-23 amongst them)
- (CUP) Hilux with MLRS and UB-32 are back (Artillery section on Vehicle Black Market)
- (CUP, 3CB Factions) Disabled artillery computer for Hiluxes with MLRS and Rocket payloads
- (CUP) Added armored unarmed Hilux (War Level 3)
- (CUP, RHS) Vehicle Black Market - Changed some available vehicles in some categories
- (CUP) Hilux ZU-23 replaced with Ural ZU-23 on eastern european maps (CUP Technicals store) 
- (CUP) Bad launcher (_empty, _loaded classname deriatives) will be removed from arsenal on each arsenal tick and ammobox transfer to arsenal
- (CUP) Changed Vehicle Black Market AA lineup - ZSU-23 Afghanski, M163 VADS, Tunguska
- (CUP) Technicals menu merged with general "Buy Vehicle" action menu on vehicle box
- (CUP) Removed Jackal and BTR-60 from technicals menu (both moved to Vehicle Black Market)
- (CUP) Hilux with Podnos mortar moved from Technicals menu to Artillery section on Vehicle Black Market
 
### Removals
- Removed Airstrikes title from top status bar
- Removed tent on rebel HQ (all actions from it were moved to new commander UI)
- Removed duplicated or obsolete code
- Singleplayer support is fully turned off, use LAN server to play singleplayer
- Dropped Taviana support (Taviana IP/Steam Workshop issues)
- Disabled Pursuers until full Random Events implementation will happen
- (Altis) removed some outposts to give more variety in possible start positions
- (Chernarus 2020) removed some outposts and static objects to make some overpopulated with objects areas less populated
- (2.4.1 CV) Removed Antistasi Units Mod support
- (2.4.1 CV) Disabled LootToCrate from Community Version (2.4.1) as it conflicts with Antistasi Plus's loot system

## 1.4.2
- Added Assign as Loot Vehicle commander action (Y menu, ability to give autoloot capabilities to any wheeled or tracked vehicle)
- Fixed wrong money reward for completing Ambush Officer and Destroy Artillery tasks
- Slightly lowered prices for vehicles in Vehicles Market
- Revive movement delay fix rollback due inconsistent work on some configurations that leads to no player actions bug
- Rebel attacks waves capped at 3 (no more 2-hour airport/milbase defence slog)
- Fixed another bug that contributed to neverending rebel attack bug
- Fixed trader terminal JIP issue


## 1.4.1
- Upgrade to 2.3.2 Community Version
- Increased base attack timings (3600 seconds -> 5400 seconds for base value, 600 seconds->900 seconds for subsequent additions)
- Mag Repack mission parameter
- Removed Sum Similar Weapons to Unlock parameter (tied functionality is always on from this point)
- Fixed silent HR update on POW recruitment
- Independent params page for Altis version to reduce the confusion with settings for other maps
- Improvements to position searching algorhitms on Rescue Smugglers mission
- The Great Price Reduction on arms dealer weapon store (up to 2x price reduction depending on item)
- Increased Destroy Artillery mission time limit (1->90)
- Removed membership requirement in "Move Static Weapon" action
- Excluded pistols from similar weapons to unlock system due to CUP base classes issues
- Reduced Waved Attack time limit (60 minutes -> 45 minutes)
- (CUP) Removed Skoda Octavia and Volkswagen Golf from civilian vehicle pool due to broken LODs
- (CUP) Hilux with UB-32 pylon replaced with Hilux with Podnos mortar
- Arms Dealer Store on HQ mission parameter (when turned on Arms Dealer store is available right from the start on the HQ in new special terminal, will work only in sessions where arms dealer isn't found yet, also it will disable arms dealer task)
- New rebel airstrike type: Supply Drop (filled with magazines for player's and commander's AI mates weapons, available through commander airstrike menu on Y key)
- Greatly increased chances to obtain Find the Arms Dealer task (5%->25% from interrogations, 20%->40% from documents steal, 25%->60% from laptop hacks)
- Grab Money From Faction Pool money amount changed from 1000 to 500
- Added PDW2000 as starting weapon in vanilla templates
- Improvements and optimizations to Kill Collaborationist mission
- Rebel AA emplacements are occupied with AA Missile Specialists (when AA launchers are unlocked)
- Increased price of AA Emplacement (1200->1750) due to it's potential huge firepower
- Enemy AI Skillcap Aiming Speed paremeter fix
- Added forced game ending when both CUP Units/Vehicles/Weapons and RHS turned on simultaneosly (since it is not supported mode that leads to a lot of errors and incosistent experience)
- Removed ability to move Arms Dealer Store to rebel HQ (never worked properly)
- Removed unused code (leads to slight mission file size reduction)

## 1.4
- New mission types: Prevent Artillery Strike, Ambush Officer, Kill Collaborationist, Seize Airdrop, Rescue Smugglers
- Establish roadblock, watchpost, AA Emplacement or AT Emplacement action (Y menu, commander section)
- Share Faction Money action (Y menu, commander section)
- Move Static Weapon action (Y menu)
- Napf map support
- Chernarus 2.0 map support (Beta)
- Move Arms Dealer to rebel HQ laptop action
- AI aiming accuracy, aiming shake and aiming speed capped by general server AI difficulty settings
- AI soldiers and ammo boxes have no NVGS until war level 4 (attempt to fix balance issue where rebels have more NVGs than regular armed forces early game)
- Rebel AI training cap increased from 40 to 50
- Unlocked items (Arsenal) will be removed from trader stock on each arsenal tick 
- Fixed movement delay after revive (non-ACE only)
- Grab 1000$ from faction pool bugfix (less than 1000$ situation)
- Individual fast travel edge cases bugfix
- Loot truck money found localized string fix
- Early CSAT attacks fix (vehCSATTruck error)
- Loot truck no longer grants reputation increase to everyone on money share
- Helipad spawn pool extension (transport helicopters starting war level 3, small chance to spawn attack helicopter starting war level 8)
- Increased vehicle detection radius for arms dealer store
- Increased vehicle cost on selling
- Ability to sell cargo, flatbed trucks and police cars
- Improvements to trader position search algorhitm
- Mortars on milbases, outposts and airports will be surrounded by sandbags
- Fixed static weapon bags instead of normal ones with cargo capacity on AI rebels
- Reworked Sum Similar Weapons to Unlock mission parameter - no excess weapons and parasite duplicates (requires starting new game, since previous arsenal is already plagued with dupes)
- Reduced count of players required to unflip vehicle from 4 to 3
- Fixed PVP player vehicle ejection
- Fixed ability to buy vehicles from black market dealer even if player has no money
- Increased base attack timing (less frequent attacks on rebels, should resolve problem when rebels are constantly bombed in stone age by neverending attacks from airbases or carriers)
- Whiteboard texture is back
- (CUP) EUROFOR faction
- (CUP) Occupant Side mission parameter (CDF or EUROFOR)
- (CUP) MT-LB is capable to carry ammo boxes
- (CUP, Altis) Land Rover, MTVR militia trucks and cars for BLUFOR militia
- (CUP) CDF Tank pool fix
- (RHS) US unit roster (mission parameter)
- (Altis) new outpost
- (Taviana) Removed preplaced props near mortar emplacements
- (Taviana) Misson file size reduction, slightly lowered loading times
- (Taviana) Additional Police stations in cities to expand possible Kill Collaborationist sites

## 1.0.3
- Aegis mod detection fix
- Added AUR 90 series in the arms dealer's store (Aegis)
- Fixed AA placement on Control Tower

## 1.0.2
- Fixed neverending BLUFOR/OPFOR attacks

## 1.0.1
- Fixed hangar explosion on spawn (Taviana)
- Misson size reduction, slightly lowered loading times (Taviana)
- Weapon prices little tuning 
- SAM Site adjustment - if template has no CIWS vehicle, default AA will be spawned instead
- Altis BLUFOR version release
- A few new control markers
- Tuned excessive logging on BLUFOR squad spawn (less spam to .rpt)
  
## 1.0
- Upgrade to 2.3.1 Community Version 
- Full Arma 3 Atlas, Arma 3 Aegis, Arma 3 Atlas - Opposing Forces, Arma 3 - Police support (unit roster, PVP loadouts, vehicle market, arms dealer store, tiered unit configs)
- Full CUP Vehicles, CUP Weapons, CUP Units support (unit roster, PVP loadouts, vehicle market, arms dealer store, technicals store, tiered unit configs)
- Time Multiplier mission parameter (Experimental)
- Pursuers - punisher squad to shake things up on stale moments (optional, mission parameter)
- New outpost type: Military Base. Heavily guarded outpost with vehicles and SAM site
- Added Unflip Vehicle action (Y menu, requires 4 people to unflip the car, heavy vehicles require repair vehicle in proximity)
- SAM sites
- Altis support - more points of interest, military base markers
- Multiple vehicle tiers on Vehicle Market (use arrow keys to switch tiers, requires certain war levels to unlock next tier vehicle) 
- Player marker radio requirement change rollback
- Planes could be put into garage without nearest airport check
- Individual rebel salary - each rebel recieves his own paycheck, scales with overall side income
- Bodyguard has been replaced with proper specops unit (affects BLUFOR SpecOps squad)
- Invaders uses GMGs on roablocks and bases (works everywhere except RHS since there is no GMG on high tripod)
- Tank pool for BLUFOR and OPFOR sides now includes multiple tank variants 
- Static AA pool (RHS, CUP)
- Technicals store (CUP only, accessable through vehicle box on base)
- Lowered prices for some RHS weapons
- Fixed some minor loot truck issues 
- Removed Clear Forest action on trader's laptop since this action already applies on initial trader spawn 
- More variety to static weapons on High Cargo Towers
- Small IED in the store (Misc section)
- Both Kozilce variants in the starting equipment (RHS)
- (Taviana) Some airports and outposts has been replaced with new Military Base outpost type
- (Taviana) Another wreck clearance pass
- (Taviana) Seaport placement adjustments
- (Taviana) Bank buildings fix
- (Taviana) Bridges fix
- Removed Infantry Unit Tiers setting (the feature is still there but can't be turned off)
- Removed True Viking mod support (Antistasi Units template)

## 0.6
- New mission type: Salvage Helicrash
- Reenabled Destroy Vehicle/Helicopter mission along with some fixes and changes to this mission from unreleased community version
- Ability to buy military aircraft at black market
- Ability to buy AT Offroad at vehicle crate on rebel HQ
- Fixed inability to call rebel airstrike when commander is not a host
- Attempt to mitigate vehicle placement issue on Vehicle Market (use SHIFT key for accurate vehicle placement that ignores terrain gradient and obstacles)
- Localized POW actions and outcomes
- "Grab From Faction Pool" action money amount increased from 100 to 1000
- Releasing POWs will give small amount of money to releasing player from this moment (paycheck depends on current aggro level, applies to occupant POWs only, starts from war level 4)
- 3D icons above uncoscious players (optional, mission parameter)
- Individual Fast Travel (optional, mission parameter)
- When in engagements, AI squads without NVGs will launch flares at night from this moment (vanilla, CUP and RHS flares supported)
- Loot truck gives money to everyone, not only players in proximity from now
- Gather Loot systemChat messages will be transmitted only to players in proximity, not everyone (as it was before)
- Sum Similar Weapons To Unlock mission parameter (sums same weapons with different color to unlock them all to use without limit, optional, mission parameter)
- Bunkers on AT roablocks replaced with sandbags since ordinary sandbag bunkers rendered them useless due to blocking line of sight
- Disabled FFAA and 3CB support since they are not compatible with any of Antistasi Plus features
- Airports will be guarded by vehicles and helicopters (on some cases)
- SystemChat log messages (separate mission parameter, debug purposes)
- Removed radius check for task completion check (basically, every rebel, not only those who in task proximity, will recieve paycheck for task completion)
- Successful task completion will give money to everyone, not only players in proximity
- Raised Train AI skillcap from 20 to 40
- Raised base prices for vehicles on vehicle crate (about 25%-40% increase)
- Removed radio requirement for player markers on map (since it breaks a lot for some reason)
- Boat spawnpoints have been moved closer to cities to ensure that they will spawn at all
- Livonia military buildings support (mostly for future Antistasi Plus ports)
- UI tweaks

## 0.4.4
- Fixed serialization of trader quest completion parameter on dedicated servers and HCs
- Fixed incorrect trader creation function call on dedicated servers and HCs
- Fixed Bug with gearless and weaponless helicopter troops
- Fixed some .rpt errors tied to HALs store, disabled debug mode for it
- Attempt to fix no SpecOps units at Assassinate SpecOps mission location bug
- Few new control markers
- Moved initial HQ placement to Taviana Zoo (safest place on island)
- little roadwreck purge on Taviana's south part

## 0.4.3
- Fixed wrong classname on one entry at arms dealer store for Antistasi Units weapons pool
- "Clear Forest" action on arms dealer's laptop now properly works on dedicated server
- Fixed inability to place black market vehicle in some cases on dedicated server
- Fixed no weapon market action for JIPs and some unidentified cases
- Fixed no backpack removal on bodies after using loot truck on multiplayer environment
- Money items from bodies will be shared between players in proximity after using loot truck action (as it already happens with money laying on ground)
- Louder loot truck action
- Clear Forest action on trader's laptop could be used by everyone from now (not only side's commander, as it was before)
- Fixed "Undefined variable in expression: isinfantryunittiersenabled" error
- Added 25% chance to obtain information about arms dealer after hacking a laptop
- (TFAR only) Ability to use a radio while laying wounded
- Randomized money items position on tables
- Fixed inability to get Destroy Antenna task from Petros
- Fixed officer interrogation bug
- The Great Roadwreck Purge
- HallyG store framework 1.5.0 update

## 0.4.1
- Fixed wrong text on vehicle market entries
- "Clear Forest" action on arms dealer's laptop
- Fixed inability to buy vehicles on vehicle market


## 0.4
- Upgrade to stable release of 2.3 Antistasi Community Version
- New Find the Arms Dealer task type (can be obtained via intel search/interrogation)
- Arms Dealer with the ability to directly sell weapons, magazines, items etc
- New pickupable item - money. Banknotes can be on outpost tables, on traitor, civilian vehicles
- Black Market functionality moved from Petros to Arms Dealer
- Removed ability to buy artillery and loot boxes on black market
- Radio tower placements remade, most of them 
- Loot Bodies and Cargo sound bug fixed
- Additional control zones, 2 new outposts


## 0.2.1
- Fixed bug with CHDKZ flagpole
- Added Infantry Units Tiers setting 


## 0.2
- Upgrade to 2.3 (still unstable) Antistasi Community Version
- Fixed bug with commander squads spawn
- Fixed bug with not working Fatal Wounds mission parameter
- Mag Repack no longer can be accessed while wounded
- Fixed CHDKZ flag issue
- Background Blur Effect appliance on Antistasi menus
- More radio towers to cover all landmass on islands
- Antistasi Units template adjustment
- Removed IFA support due to nonfunctional template at the moment
- Reduced static objects quantity on map
- Reduced number of control zones
- Default Rebels HQ position moved on abandoned airfield
- Both Kozlice variants added as starting weapons on a vanilla template
- Infantry unit tiers enabled for RHS
- Starting equipment adjustment for RHS template

## 0.1
- Taviana support
- Special truck with ability to autoloot bodies around the truck to reduce tediousness of looting enemy (can be bought on Civilian section)
- Integrated Mag Repack script (menu can be accessed via Ctrl+R hotkey)
- Black Market - possibility to spend money on weapons, vehicles, aircrafts et cetera (can be accessed via Petros when seaport is captured, based on according Antistasi Singleplayer feature, credits to GospelG)
- Infantry unit tiers based on current war level, the bigger war level - the better enemy's infantry units equipment (requires Antistasi Units mod)
