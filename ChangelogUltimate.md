# 11

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