// Police Quest: In Pursuit of the Death Angel
// #ID = 18956

// Ver 1.0I 11/23/88

// https://mirrors.apple2.org.za/ftp.apple.asimov.net/documentation/applications/misc/Police%20Quest%20manual.pdf
// https://lparchive.org/Police-Quest-1/Update%2001/
// https://github.com/historicalsource/police-quest-1/tree/main/SRC

class LookupItem
{
    id = 0
    label = ""
}

class LocationEnum
{
    function current() => byte(0xfed3)
    function is(lookup) => this.current() == lookup.id
    function was(lookup) => prev(this.current()) == lookup.id
    
    intro_title = LookupItem(1, "in the Titles")
    intro_credits = LookupItem(2, "in the Titles")
    closeup_helen_hots = LookupItem(3, "at a traffic stop")
    station_briefing_room = LookupItem(4, "in the police station")
    station_locker_room = LookupItem(5, "in the police station")
    station_hallway = LookupItem(6, "in the police station")
    station_parking_lot = LookupItem(7, "in the police station parking lot")
    cadillac_glove_compartment = LookupItem(8, "at a traffic stop")
    cadillac_trunk = LookupItem(9, "at a traffic stop")
    map_a1 = LookupItem(10, "driving around Lytton")
    map_a2 = LookupItem(11, "driving around Lytton")
    map_a3 = LookupItem(12, "driving around Lytton")
    map_a4 = LookupItem(13, "driving around Lytton")
    map_b1 = LookupItem(14, "driving around Lytton")
    map_b2 = LookupItem(15, "driving around Lytton")
    map_b3 = LookupItem(16, "driving around Lytton")
    map_b4 = LookupItem(17, "driving around Lytton")
    map_c1 = LookupItem(18, "driving around Lytton")
    map_c2 = LookupItem(19, "driving around Lytton")
    map_c3 = LookupItem(20, "driving around Lytton")
    map_c4 = LookupItem(21, "driving around Lytton")
    map_d1 = LookupItem(22, "driving around Lytton")
    map_d2 = LookupItem(23, "driving around Lytton")
    map_d3 = LookupItem(24, "driving around Lytton")
    map_d4 = LookupItem(25, "driving around Lytton")   
    crash = LookupItem(26, "investigating a crash")
    // 27 = freeway 1
    // 28 = freeway 2
    // 29 = janitor
    // 30 = pulled over girl
    // 31 = pulled over drunk
    // 32 = pulled over stolen car
    blue_room_exterior = LookupItem(33, "at The Blue Room")
    blue_room_interior = LookupItem(34, "at The Blue Room")
    caffiene_castle = LookupItem(35, "at Caffiene Castle")
    caffiene_castle_interior = LookupItem(36, "at Caffiene Castle")
    wino_willys = LookupItem(37, "at Wino Willy's")
    // 38 = briefcase
    // 39 = locker room    
    jail_interior = LookupItem(40, "at the jail")
    jail_parking_lot = LookupItem(41, "at the jail")
    station_dooley = LookupItem(42, "in the police station")
    station_morgan = LookupItem(43, "in the police station")
    // 44 = briefing1
    // 45 = briefing2
    // 46 = squadroom
    station_locker = LookupItem(47, "in the police station")
    // 48 = bartender (blue room and biker bar)
    station_narcotics = LookupItem(49, "in the police station")
    clipboard_closeup = LookupItem(50, "in the police station")
    station_computer = LookupItem(51, "in the police station")
    station_hallway2 = LookupItem(52, "in the police station")
    courthouse_exterior = LookupItem(53, "at the courthouse")
    courthouse_entryway = LookupItem(54, "at the courthouse")
    courthouse_courtroom = LookupItem(55, "at the courthouse")
    city_park_entrance = LookupItem(56, "at the city park")
    city_park_picnic_table = LookupItem(57, "at the city park")
    // 58 = drunk jail
    // 59 = taselli jail
    cotton_cove = LookupItem(60, "at Cotton Cove")
    // 61 = simms jail
    // 62 = sweet cheeks jail
    delphoria_outside = LookupItem(63, "at the Hotel Delphoria")
    delphoria_entrance = LookupItem(64, "at the Hotel Delphoria")
    delphoria_floor2_east = LookupItem(65, "at the Hotel Delphoria")
    delphoria_floor2_west = LookupItem(66, "at the Hotel Delphoria")
    delphoria_204 = LookupItem(67, "at the Hotel Delphoria")
    delphoria_bar = LookupItem(68, "at the Hotel Delphoria")
    delphoria_storage = LookupItem(69, "at the Hotel Delphoria")
    delphoria_poker_room = LookupItem(70, "at the Hotel Delphoria")
    delphoria_private_poker_room = LookupItem(71, "at the Hotel Delphoria")
    // 72 = rmRights?
    // 73 = following sweet cheeks
    // 74 = dynamic hotel
    delphoria_poker_table = LookupItem(75, "at the Hotel Delphoria")
    delphoria_stairs_top = LookupItem(76, "at the Hotel Delphoria")
    delphoria_stairs_middle = LookupItem(77, "at the Hotel Delphoria")
    delphoria_stairs_bottom = LookupItem(78, "at the Hotel Delphoria")
    delphoria_suite = LookupItem(79, "at the Hotel Delphoria")
    traffic_stop_residential = LookupItem(80, "at a traffic stop")
    // 81 = poker
    // 82 = find kicker
    // 83 = display cards
    // 84 = player cards
    // 85 = score hand
    // 86 = evaluate cards
    // 87 = deal cards
    // 88 = betting
    // 89 = draw cards
    // 90 = computer bet
    // 91 = computer draw
    traffic_stop_commercial = LookupItem(92, "at a traffic stop")
    traffic_stop_ocean = LookupItem(93, "at a traffic stop")
    // 94 = traffic stop generic
    // 95 = traffic stop generic
    // 96 = car radio
    // 97 = additional Morgan messages
    // 98 = error handling
    // 99 = debug
    // 100 = ??
    // 101 = ??
    // 102 = help
    epilogue_text = LookupItem(103, "at the Hotel Delphoria")
    // 104 = winner
    // 105 = trace messages
    // 106 = walkthrough?
    // 107 = ??
    // 108 = peddling suspect
    // 109 = phone messages
    narcotics_cabinet_closeup = LookupItem(110, "in the police station")
    narcotics_cabinet_folder = LookupItem(111, "in the police station")
    computer_closeup = LookupItem(112, "in the police station")
    book_closeup = LookupItem(113, "examining evidence")
    gun_closeup = LookupItem(114, "examining evidence")
    station_newspaper = LookupItem(116, "in the police station")
    // 117 = driving
    // 118 = gunfight
    // 119 = suspect vehicle
}
Location = LocationEnum()
location_map = field_map(Location, (k, v) => {v.id: v.label})

function in_intro() => Location.current() <= Location.intro_credits.id

function current_score() => byte(0xff03)
function bit_changed(flag) => flag == 1 && prev(flag) != 1

function can_type() => byte(0x8803) == 0
function scene_loaded() => bit2(0xfee0) == 0 && prev(bit2(0xfee0)) == 1

// type STINK BUG to enable debugging mode
function debug_mode() => bit4(0xfef3) == 1
function debug_protection() => disable_when(debug_mode())
debug_lookup = { 0:"", 1:"." }

rich_presence_conditional_display(Location.current() == 0, "Game not started")
rich_presence_conditional_display(in_intro(), "Titles")

rich_presence_display("Sonny is {0}, {1} of 245 points{2}",
   rich_presence_lookup("Scene", Location.current(), location_map, "exploring Lytton"),
   rich_presence_value("Score", current_score()),
   rich_presence_lookup("Debug", bit4(0xfef3), debug_lookup)
)

function trigger_is_pullover() => Location.is(Location.traffic_stop_residential) ||
              Location.is(Location.traffic_stop_commercial) ||
              Location.is(Location.traffic_stop_ocean)

// ===== Lytton Police Department =====
// * Walk into the locker room (lower right door)
// * Go to the lower right locker
//   > OPEN LOCKER (1 -> 1)
//   > GET ALL (3 -> 4 [1pt each for GET GUN, GET AMMO and GET CASE])
//   > CLOSE LOCKER
// * Leave the locker room
//   > OPEN BRIEFCASE (1 -> 5)
//     [note: opening the briefcase in the car prevent Sonny from walking if he gets out before closing the briefcase]
//   > GET ALL (3 -> 8 [1pt each for GET NOTEBOOK*, GET PEN, and GET TICKET BOOK])
//   > CLOSE BRIEFCASE
// * Go in the upper right door {SAVE A}
//   > LOOK IN PIGEON HOLE (1* -> 9)
//   > LOOK IN PIGEON HOLE (1* -> 10)
//      - you get one point for looking in Steve or Jack's pigeon hole, and a second for looking in yours
//        or two points if you look in yours first then nothing for Steve's.
// * Approach the newspaper
//   > LOOK NEWSPAPER (5* -> 15)
// * Press right three times to reach the last page (or left once).

// function current_newspaper_page() => byte(0xff21)
// function page_transition_complete() => byte(0x005c) == 0xff
// achievement("State of Emergency", "Find the article about Daventry", 2, type="missable",
//     trigger = Location.is(Location.station_newspaper) && 
//               current_newspaper_page() == 4 &&
//               page_transition_complete()
// )

//   > DROP NEWSPAPER
// * Go stand at the left side of the front right desk and wait for the briefing to begin. (4 -> 19)
// * Wait for the briefing to end (4 -> 23)

achievement("Pay Attention", "Attend the briefing", 5, type="progression",
    trigger = Location.is(Location.station_briefing_room) &&
              debug_protection() &&
              bit_changed(bit0(0xfed8))
)

//   > TAKE NOTES (1* -> 24)
// * Type anything and press Return three times.
// * Leave the room and walk over to the board on the left.
//   > GET KEYS (1 -> 25)
// * Walk to the table at the back wall.
//   > GET RADIO (2 -> 27)
// * Go straight left out of the building (two screens).
// * Walk around behind and in front of the bottom left car until the game acknowledges a completed 
//   safety check (5 -> 32)
// * Go to the driver's door of the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR {SAVE B}
//   > DRIVE

achievement("On Patrol", "Leave the station", 5, type="progression",
    trigger = Location.is(Location.map_c3) && 
              Location.was(Location.station_parking_lot) &&
              debug_protection()
)

// * Drive around until you get a call to respond to the "corner at Fig and 4th".

// ===== Crash =====
// * Go to map B2 and pull up near the car angled into the building.
// * Press 4 to park. (3 -> 35)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR {SAVE C}
// * Approach the man in the car.
//   > LOOK MAN
//   > LOOK MAN
// * Walk over to the crowd.
//   > TALK
//   > TALK
//   > USE RADIO
// * Wait for Hamilton and Dooley to arrive and tell you to go looking for the blue cadillac (5 -> 40)

achievement("Homicide Division", "Briefly meet Hamilton before being sent back on patrol", 5, type="progression",
    trigger = Location.is(Location.crash) && 
              debug_protection() &&
              bit_changed(bit4(0xfefc))
)

// * Go back to the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE
// * Drive around until Steve summons you to the Caffiene Castle. 

// ===== Carol's Caffeine Castle =====
// * Then go there [map A3] (3 -> 43)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk inside, then to the table where Steve is sitting.
//   > SIT
// * Wait for Carol to bring you coffee.
// * Wait until Carol says the phone is for you.
//   > STAND
// * Walk to the phone
//   > ANSWER PHONE (2 -> 45)
// * Go back outside and to the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Helen Hots =====
// * Drive around until you see a car run a red light.
// * Activate your siren by pressing 0, then follow it until it pulls over. 
// * Press 4 to switch to street view. (4 -> 49) {SAVE D}
//   - NOTE: you can drive away, but the game won't advance until you actually get her pulled over.

achievement("High Speed Chase", "Pull over your first traffic violation", 5, type="progression",
    trigger = trigger_is_pullover() && 
              debug_protection() &&
              byte(0xff00) == 30 && // script for Helen Hots encounter
              scene_loaded()
)

//   > USE RADIO (1* -> 50)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk to the car.
//   > LOOK WOMAN
//   > ASK LICENSE
//   > WRITE TICKET
// * Wait for her to proposition you.
//   > SAY NO (2 -> 52)
//     - If you say KISS, the story advances, and you don't get any points. If you say SEX, you get 1 point.
//   > RETURN LICENSE
//   > SIGN TICKET
//   > GIVE TICKET (5 -> 57)

// missable because there are ways to progress the story without giving her a ticket
achievement("You Ran a Red Light Back There", "Give a ticket to Ms. Hots", 5, type="missable",
    trigger = Location.is(Location.closeup_helen_hots) && 
              debug_protection() &&
              bit_changed(bit1(0xfeee))
)

// * Return to the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Biker Gang =====
// * Drive around until you get a complaint at the Caffeine Castle.
// * Go back there (A3) {SAVE E}
//   > GET NIGHTSTICK (3 -> 60)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter Carol's Caffeine Castle
//   > TALK CAROL (3* -> 63)
// * Leave Carol's and enter Wino Willy's
//   > MOVE BIKES
//   > USE NIGHTSTICK (5 -> 68)

achievement("No Need to Be Rough", "Get the bikers to leave", 5, type="progression",
    trigger = Location.is(Location.wino_willys) && 
              debug_protection() &&
              byte(0xff5e) == 4 && prev(byte(0xff5e)) == 3 // biker gang progress
)

//   > ASK ABOUT DRUGS (3* -> 71)
// * Leave and return to your car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== DUI =====
// * Drive around until you see a car weaving across the road. 
// * Activate your siren by pressing 0, then follow it until it pulls over. 
// * Press 4 to switch to street view. (3 -> 74) {SAVE F}
//   > USE RADIO (1* -> 75)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Approach the driver.
//   > LOOK MAN
//   > TALK MAN
//   > SHOW LICENSE
//   > GET OUT
//   > GIVE TEST (3 -> 78)

achievement("Walk the Line", "Administer a sobriety test", 5, type="progression",
    trigger = trigger_is_pullover() && 
              debug_protection() &&
              bit_changed(bit1(0xfef6))
)

//   > CUFF MAN
//   > NO
//   > SEARCH MAN
//   > FOLLOW ME (3 -> 81)
// * Walk to the back of your car.
//   > OPEN DOOR
// * Wait for him to get in.
//   > CLOSE DOOR
// * Move to the front door.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > RADIO FOR TOW TRUCK
//   > DRIVE
// * Go to the jail (purple building in map D3).
// * Press 4 to switch to the parking lot view. {SAVE G}
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk to the back door.
//   > OPEN DOOR
// * Wait for him to get out.
//   > CLOSE DOOR
// * Follow him up the stairs, and stop in front of the lockers.
//   > OPEN LOCKER
//   > PUT GUN IN LOCKER (2 -> 83)
//   > CLOSE LOCKER
// * Walk to the other side of the door.
//   > PUSH BUTTON
// * Go inside. Wait for the jailer to ask what you need.
//   > DUI
//   > GET CUFFS (2 -> 85)

achievement("Thankssh A Lot Ociffer", "Escort the drunk driver to his cell", 10, type="progression",
    trigger = never(!Location.is(Location.jail_interior)) && 
              once(bit6(0xfef0) == 0) && bit6(0xfef0) == 1 &&
              debug_protection() &&
              bit3(0xfee4) == 0 && prev(bit3(0xfee4)) == 1 // cell door shuts
)

// * As you try to leave, Laura tells you about a promotion, then the jailer tells you Dooley wants
//   you back at the station.
// * Exit
//   > OPEN LOCKER
//   > GET GUN
//   > CLOSE LOCKER
// * Go to the car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Police Station =====
// * Go to the police station (map C3).
// * Press 4 to switch to parking lot view.
//   > DROP NIGHTSTICK
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter the station.
// * Walk to the table.
//   > WRITE MEMO
//   > PUT MEMO IN BASKET (2 -> 87)
// * Proceed east into the main hall.
// * Work your way to the lower left door
//   > OPEN DOOR
// * There's a chicken assauting Sgt. Dooley
//   > OPEN DOOR
// * Leave. Back in the hallway, get invited to the Blue Room.
// * Go to the locker room. Walk to your locker.
//   > OPEN LOCKER
//   > UNDRESS
//     - The game will tell you it's regulation to take a shower. If you choose not to, it says "Who'll know?".
//       There doesn't seem to be any effect and the game doesn't actually track whether or not you shower.
//       If you just close the locker and reopen it, it will proceed as if you did shower.
//       Feel free to skip ahead to the next CHANGE CLOTHES line.
//   > CLOSE LOCKER
// * Walk to the shower on the right.
//   > TURN ON
//     - NOTE: if you turn on the shower while wearing your police uniform, you lose a point. If you leave the locker
//       room and return, you can repeat it to lose another point. Each time you leave the locker room and come back,
//       you can lose a point. The fact that you did it is not remembered after leaving the locker room, so it's
//       impossible to restrict its use for a low-point run.

// [POINTLESS - You're forced to shower to dye your hair later]
// achievement("Keeping Clean", "Take a shower", 1,
//     trigger = Location.is(Location.station_locker_room) && 
//               byte(0xff27) == 4 && // in towel
//               bit_changed(bit1(0xfee8)) // shower turned on
// )

//   > TURN OFF
// * Return to the locker.
//   > OPEN LOCKER
//   > CHANGE CLOTHES (2 -> 89)
//   > GET KEYS (1 -> 90)
//   > CLOSE LOCKER
// * Leave the locker room.
// * Go to the key holder.
//   > RETURN KEY
// * Go to the table.
//   > RETURN RADIO
// * Go outside to the blue corvette.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== The Blue Room =====
// * Go to map B4. Drive into the indented area.
// * Press 4 to switch to parking view. (2 -> 92) {SAVE H}
//   > GET WALLET (3* -> 95)
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter the building.
// * Walk to the right of the middle table.
//   > SIT
// * Jack will talk. Eventually Keith, another colleague, and a dancer arrive.
// * After a dance, the dancer leaves. (2 -> 97)

//achievement("An Evening with the Boys", "Celebrate Jack's birthday", 2, type="progression",
//    trigger = Location.is(Location.blue_room_interior) && byte(0xff62) == 3 && prev(byte(0xff62)) == 2
//)

//   > STAND
// * Go outside and to the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Police Station =====
// * Return to the police station (C3)
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Go inside to the locker room and to your locker.
//   > OPEN LOCKER
//   > UNDRESS
//   > CHANGE CLOTHES
//   > GET ALL
//   > CLOSE LOCKER
// * Go to the briefing room.
// * Walk to your spot and listen to the briefing (1 > 98).
// * Walk to the pigeonholes.
//   > LOOK IN HOLE (3* > 101) - clue about backroom gambling
// * Go back to the main hallway.
//   > GET RADIO
//   > GET KEYS
// * Go outside to the car.
// * Perform a safety check (walk around the car until the game acknowledges it).
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Stolen Cadillac =====
// * Drive around until you get a report on the stolen cadillac.
// * Activate your siren by pressing 0, then follow it until it pulls over. 
// * Press 4 to switch to street view. (5 -> 106)
//   > USE RADIO
// * Wait for backup to arrive. {SAVE I}
//   > OPEN DOOR
//   > STAND
//   > LOAD GUN (4* -> 110)
//   > DRAW GUN
//   > SAY GET OUT OF CAR WITH HANDS UP (4 -> 114)
//   > SAY LIE DOWN (2 -> 116)
//   > PUT GUN AWAY
// * Approach the suspect
//   > CUFF MAN

achievement("On the Ground", "Arrest the car thief", 5, type="progression",
    trigger = trigger_is_pullover() && 
              debug_protection() &&
              byte(0xff77) == 0x0f && prev(byte(0xff77)) == 0x0e // Car thief progress
)

//   > SEARCH MAN (2 -> 118)
//   > SAY STAND
//   > READ RIGHTS (1 -> 119)
//   > FOLLOW ME
// * Walk to the back door of the car.
//   > OPEN DOOR
// * Step out of the way, and wait for him to get in. Walk back to the door.
//   > CLOSE DOOR
// * As Jack walks by:
//   > LOOK GUN (4* -> 123)
//   > RETURN GUN
// * Go to the Cadillac's trunk.
//   > LOOK LICENSE PLATE
//   > OPEN TRUNK (2* -> 125)
//   > CLOSE TRUNK
// * Walk to the Cadillac's door.
//   > LOOK DOOR (2* -> 127)
//   > LOOK IN GLOVE COMPARTMENT
//   > READ BOOK (2* -> 129)
//   > CLOSE BOOK
//   > LOOK LICENSES (2* -> 131)

evidence = [
    bit1(0xfee9), // read book
    bit7(0xfeea), // look licenses
    bit6(0xfefd), // look license plate [temporary]
    bit0(0xfee9), // open trunk
    bit4(0xfeef)  // look door
]
achievement("Evidence", "Thoroughly search the stolen car", 5, type="missable",
    trigger = measured(tally_of(evidence, length(evidence), b => once(b == 1))) &&
              debug_protection() &&
              never(byte(0xff00) != 0x20 && // cadillac pulled over
                    byte(0xff00) != 0x08 && // glove compartment
                    byte(0xff00) != 0x71 && // book
                    byte(0xff00) != 0x09)   // trunk
)

//   > CLOSE COMPARTMENT
// * Return to your car.
//   > SIT
//   > CLOSE DOOR
//   > DRIVE
// * Go to the jail (purple building in map D3).
// * Press 4 to switch to the parking lot view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk to the back door.
//   > OPEN DOOR
// * Wait for him to get out.
//   > CLOSE DOOR
// * Follow him up the stairs, and stop in front of the lockers.
//   > OPEN LOCKER
//   > PUT GUN IN LOCKER
//   > CLOSE LOCKER
// * Walk to the other side of the door.
//   > PUSH BUTTON
// * Go inside. {SAVE J}
// * Wait for the jailer to ask what you need.
//   > DRUGS
//   > GET CUFFS (3 -> 134)

achievement("Shove it, Pig!", "Escort the car thief to his cell", 10, type="progression",
    trigger = never(!Location.is(Location.jail_interior)) && 
              once(bit5(0xfef0) == 0) && bit5(0xfef0) == 1 &&
              debug_protection() &&
              bit3(0xfee4) == 0 && prev(bit3(0xfee4)) == 1 // cell door shuts
)

// * Wait for Jack to tell you Dooley wants to talk, then leave the jail.
//   > OPEN LOCKER
//   > GET GUN
//   > CLOSE LOCKER
// * Return to your car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Promotion =====
// * Return to the police station (C3)
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter the building. Go to Dooley's office (across from the locker room).
//   > OPEN DOOR
// * Enter Dooley's office. 
// * After Dooley leaves, walk behind the desk.
//   > READ MEMO (2 -> 136)
// * Leave Dooley's office and go to your locker.
//   > OPEN LOCKER
//   > UNDRESS
//   > CHANGE CLOTHES
//   > GET ALL
//   > CLOSE LOCKER
// * Go back to the main hallway.
//   > RETURN KEYS
// * Keep the radio and head into the entry hall.
// * Walk to the left door.
//   > OPEN DOOR
// * Enter the room {SAVE K}.
// * Walk up to the desk.

achievement("Promotion", "Get reassigned to narcotics", 10, type="progression",
    trigger = Location.is(Location.station_morgan) &&
              debug_protection() &&
              byte(0xff23) == 1 && prev(byte(0xff23)) == 0 // Taselli progress
)

// * After being welcomed to the team, leave the room and enter the doorway on the right.
// * Luara will show you around.
// * After she leaves, walk up to the file cabinet.
//   > OPEN CABINET
//   > READ HOFFMAN FILE
//   > TAKE FILE (2 -> 139)
// * Walk over to the key rack.
//   > TAKE KEYS (3 -> 142)
//   > TAKE CLIPBOARD
// * Page through to the "FBI Most-Wanted List"
//   > TAKE LIST (2 -> 144)
//   > RETURN CLIPBOARD
// * Go outside to the parking lot.
// * Do a safety walkaround of the upper right car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== No-bail Warrant =====
// * Be careful getting out of the parking lot. You can hit the other cars in the parking lot.
// * Drive to the courthouse (D3).
// * Press 4 to switch to parking view (1 -> 145). {SAVE L}
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk up to the building.
//   > OPEN DOOR
// * Walk over to the window.
//   > EMERGENCY (3 -> 148)
// * When permitted, walk to the door.
//   > OPEN DOOR
// * Enter the courtroom.
// * Approach the bench.
//   > HOFFMAN
//   > SHOW FILE
//   > SHOW LIST
// * Wait for the bailiff to present the evidence to the judge and return.
//   > SAY TATTOO (7 > 155)
// * You'll automatically leave the courtroom. Return to your car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE
// * Drive across the street to the jail.
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk up to the lockers.
//   > OPEN LOCKER
//   > PUT GUN IN LOCKER
//   > CLOSE LOCKER
// * Walk to the button.
//   > PUSH BUTTON.
// * Enter the jail {SAVE M}
// * Walk up to the jailer.
//   > GIVE WARRANT (2 -> 157)

achievement("The Telltale Flower", "Prevent Hoffman from getting out of jail", 10, type="progression",
    trigger = Location.is(Location.jail_interior) &&
              debug_protection() &&
              bit_changed(bit2(0xfeef))
)

// * Leave the jail.
//   > OPEN LOCKER
//   > GET GUN
//   > CLOSE LOCKER
// * Walk to the car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== The Stake Out =====
// * Drive back to the police station (c3)
// * Laura gets in the car.
//   > DRIVE
// * Drive to the park (B1)
// * Press 4 to switch to parking view (1 -> 158). {SAVE N}
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk north.
// * Go stand behind the upper right bush. The game will let you know if you're in the right place.
//   > USE RADIO
//   > LOAD GUN
// * Wait for the two men to arrive (there's a long delay between them).
// * When they start arguing ("This ain't enough!"):
//   > USE RADIO
//     - Failing to do this results in the pusher getting away, which the game treats as a fail condition.
//   > DRAW GUN
//   > SAY HALT, POLICE (5 -> 163)
// * Step out from behind the bushes. The second man will run away.
//   > PUT GUN AWAY
// * Walk up to the first man.
//   > CUFF MAN (1 -> 164)
//   > READ RIGHTS (1 -> 165)
//     - If you do this at the car, you don't get the point.
//   > FOLLOW ME
// * Escort him back to the car.
//   > SEARCH MAN (6* -> 171)
//   > QUESTION MAN
//   > QUESTION MAN (2* -> 173)
//   > QUESTION COLBY*
//   > QUESTION COLBY (3* -> 176)
//   > OPEN DOOR
//   > CLOSE DOOR
// * Move to the front of the vehicle.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE
// * Head to the jail (D3). While en route:
//   > USE RADIO (1* -> 177)
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk to the back of the car.
//   > OPEN DOOR
// * Step out of the way. Wait for the suspects to exit the vehicle.
//   > CLOSE DOOR
// * Walk up to the lockers.
//   > OPEN LOCKER
//   > PUT GUN IN LOCKER
//   > CLOSE LOCKER
// * Walk to the button.
//   > PUSH BUTTON.
// * Enter the jail {SAVE O}
// * Walk up to the jailer.
//   > SAY DRUGS
//   > GET CUFFS (2 -> 179)

achievement("The Pusher in the Park", "Escort the drug dealer to his cell", 10, type="progression",
    trigger = never(!Location.is(Location.jail_interior)) && 
              once(bit0(0xfef0) == 0) && bit0(0xfef0) == 1 &&
              debug_protection() &&
              bit3(0xfee4) == 0 && prev(bit3(0xfee4)) == 1 // cell door shuts
)

// * Leave the jail.
//   > OPEN LOCKER
//   > GET GUN
//   > CLOSE LOCKER
// * Return to your car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE
// * Return to the police station (C3)
// * Press 4 to switch to parking view.
// * Laura sends you to the Blue Room.

// ===== The Blue Room =====
//   > DRIVE
// * Go to The Blue Room (B4)
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter the building and approach the right side of the table.
//   > SIT
//   > TALK TO JACK
// * Wait for the taxi to come pick up Jack. Then Keith arrives and tells you to go talk to Lieutenant Morgan.
// * Go outside to the car. (1 -> 180)
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Police Station =====
// * Return to the police station (C3)
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Go inside.
//   > OPEN DOOR {SAVE P}
// * Enter Morgan's office and approach his desk.
// * He tells you to get the black book from evidence (1 -> 181)
// * Leave the office and head right into the main hallway. Approach the window in the back right.
//   > SAY BLACK BOOK
//   > RETURN BOOK
//   > SAY GUN
//   > LOOK TAG (see examined by Frank Williams of the Crime Lab)
//   > RETURN GUN
// * Enter the open door at the back left of the main hallway.
// * Walk up to the computer
//   > TURN ON COMPUTER
//   > SW9764912 (2 -> 183)
//     - Note the weapon was reported stolen, and to contact Det. Taber at 1-312-555-3382
//   > QUIT
// * Go back to the narcotics office and to your desk.
//   - If you spend too much time in the office, Laura will restart the Taselli bail script, and you
//     won't be able to proceed. So, go use the phone quickly, and leave when you're done.
//   > USE PHONE
//   > 411
//   > WILLIAMS
//   > USE PHONE
//   > 555-4522
//   > SAY SONNY BONDS
//   > SAY TASELLI (5 -> 183)

achievement("The Fingerprints Match", "Find out who owned the gun", 5, type="missable",
    trigger = Location.is(Location.station_narcotics) &&
              debug_protection() &&
              bit_changed(bit6(0xfef1))
)

//   > USE PHONE
//   > 1-312-555-3382
//   > SAY TASELLI (5 -> 193)
//     - This is the only phone call you need to make to advance the story.

achievement("The Big Time", "Find out about Jessie Bains", 5, type="progression",
    trigger = Location.is(Location.station_narcotics) &&
              debug_protection() &&
              bit_changed(bit0(0xfeec))
)

// * Leave the office and re-enter it. Laura will return.
// * Wait until she sends you to Morgan's office.
// * Go to Morgan's office and approach the desk.
// * Go outside to the car. Do a walkaround and get in.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Jail ====
// * Go to the jail (D3).
// * Press 4 to switch to the parking lot view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Go up the stairs, and stop in front of the lockers.
//   > OPEN LOCKER
//   > PUT GUN IN LOCKER
//   > CLOSE LOCKER
// * Walk to the other side of the door.
//   > PUSH BUTTON
//     - It's safe to bring your gun into the jail, but doing so costs you 2 points.
// * Go inside.
//   > SAY HELP WITH OPERATION (5 -> 198)
// * Leave the jail.
//   > OPEN LOCKER
//   > GET GUN
//   > CLOSE LOCKER
// * Return to your car
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Cotton Cove =====
// * Just drive around until you get a call for Cotton Cove.
// * Head to the southeasternmost area of D4.
// * Press 4 to switch to parking view. (2 -> 200) {SAVE Q}
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Walk up to the body.
//   > UNCOVER BODY 
//     - NOTE: walkthroughs say "MOVE BLANKET" and "REMOVE COVER". The first does nothing, and the second
//             says it doesn't understand.
//   > LOOK BODY or OPEN SHIRT (2 -> 202)
//     - Similarly, "REMOVE SHIRT" isn't understood.

achievement("Positive Identification", "Identify the body at Cotton Cove", 5, type="progression",
    trigger = Location.is(Location.cotton_cove) &&
              debug_protection() &&
              bit_changed(bit0(0xfefb))
)

//   > COVER BODY
// * Return to the car.
//   > OPEN DOOR
//   > SIT
//   > USE RADIO (3 -> 205)
//     - This is actually required to advance the story.
//   > CLOSE DOOR
//   > DRIVE
// * Return to the police station (C3).

// ===== Police Station =====
// * Press 4 to switch to parking view.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Go inside.
//   > OPEN DOOR
// * Enter Morgan's office and approach his desk. You'll be briefed on an operation.
// * Sergeant Dooley enters to inform you that Jack's daughter has died. (2 -> 207)
// * Go to your desk in the narcotics office.
//   > USE PHONE
//   > 411
//   > COBB
//   > USE PHONE
//   > 555-2622 (3 -> 210)

achievement("Condolences", "Take a moment to call a friend having a bad day", 2, type="missable",
    trigger = Location.is(Location.station_narcotics) &&
              debug_protection() &&
              bit_changed(bit7(0xfef8))
)

// * Go to your locker in the locker room.
//   > OPEN LOCKER
//   > UNDRESS
//   > CLOSE LOCKER
// * Go to the right shower
//   > TURN ON
//   > USE BLEACH
//   > RINSE HAIR
//   > TURN OFF (3 -> 213)
// * Return to your locker.
//   > OPEN LOCKER
//   > WEAR SUIT
//   > CLOSE LOCKER

achievement("Stylin'", "Complete the undercover outfit", 5, type="progression",
    trigger = Location.is(Location.station_locker_room) &&
              debug_protection() &&
              byte(0xff27) == 0x0d // sonny sprite = undercover outfit
)

// * Go to the radio table in the main hallway.
//   > RETURN RADIO
// * Go to Morgan's office and approach the desk. (1 -> 214)
// * After his speech, step behind the desk.
//   > LOOK PHONE (2* -> 216) - his number is 555-6674
// * Go to the parking lot and walk around the car.
//   > OPEN DOOR
//   > SIT
//   > CLOSE DOOR
//   > DRIVE

// ===== Hotel Delphoria ====
// * Go to Hotel Delphora (A2)
// * Press 4 to switch to parking view (1 -> 217) {SAVE R}.
//   > OPEN DOOR
//   > STAND
//   > CLOSE DOOR
// * Enter the hotel.
// * Walk up to the counter.
//   > RING BELL
//   > RENT ROOM
//   > PAY CLERK (3 -> 220)
//     - if you do this a little later with Sweet Cheeks present, he makes a funny comment to her.
// * Head left into the bar and walk up to the counter.
//   > BEER
//   > PAY BARTENDER
// * A couple guys wander through, and the bartender returns.
// * Sweet Cheeks leaves and returns.
//   > STAND
// * Walk over to the counter
//   > GIVE MONEY (3 -> 223)
// * Return to the lobby with Sweet Cheeks.
// * Get in the elevator.
//   > PRESS TWO
// * Go right to room 204.
//   > UNLOCK DOOR (1 -> 224)
// * Walk over to the phone
//   > USE PHONE
//   > 555-6674
//   > SONNY BONDS (3* -> 227)
//   > USE PHONE
//   > 411
//   > CAB
//   > USE PHONE
//   > 555-9222
//   > HOTEL (3 -> 230)
// * Leave the room.
//   > LOCK DOOR
// * Return to the elevator
//   > PRESS ONE
// * Go left to the bar and approach the counter.
//   > GIVE MONEY (1 -> 231)
// * Follow him into the next room.
// * When he asks to frisk you, walk up next to him and move around until he does.
// * Walk up to the empty chair on the right of the upperleft table. {SAVE S}
//   > SIT

achievement("High Stakes", "Join the poker game in the back room of the hotel", 10, type="progression",
    trigger = Location.is(Location.delphoria_poker_room) &&
              debug_protection() &&
              bit_changed(bit3(0xfef3))
)

// * After each hand, you can SAVE or RESTORE, so use slot T to save-scum your way to victory (about $1000).
// * Type DEAL to play the next hand.
// * To fold, type FOLD when prompted how many chips to bet, or bet 0 if the minimum is above 0.
// * Win $300 or play 30 games and you'll be invited to another game later (3 -> 234)
//   Lose $300 to be kicked out.

achievement("Your Kind of Game", "Get invited to the private game", 5, type="progression",
    // https://github.com/historicalsource/police-quest-1/blob/16fdc5439e0d863ea3031626ac2a2ec066c85700/SRC/GAMEDEFS#L282-L284
    trigger = Location.is(Location.delphoria_poker_room) &&
              once(byte(0xff1f) == 170 &&                        // won first poker game
                   prev(byte(0xff1f)) == 160) &&                 // playing first poker game
              once(byte(0xff1f) == 170 && !can_type() &&         // dialog appears after winning first poker game
                   never(!Location.is(Location.delphoria_poker_room))) &&
              can_type() &&                                      // dialog disappears
              debug_protection() &&
              never(!Location.is(Location.delphoria_poker_room) && 
                    !Location.is(Location.delphoria_poker_table))
)

// * Return to the elevator.
//   > PRESS TWO
// * Go to room 204.
//   > UNLOCK DOOR
// * Wait for the other officers to show up. Walk up to the man on the left.
//   > GET TRANSMITTER (5 -> 239)
// * Return to the bar. (elevator, PRESS ONE, etc)
// * Approach the counter.
//   > FRANK SENT ME
// * Follow the bartender, and get frisked again.
// * Proceed into the private room. {SAVE U}
//   > SIT
// * Play poker. Either win $300 or play 30 games. (3 -> 242)
// * Frank will invite you to do some "work".
//   > SAY YES

achievement("A Business Proposition", "Agree to work for Mr. Bains", 5, type="progression",
    trigger = Location.is(Location.delphoria_private_poker_room) &&
              debug_protection() &&
              byte(0xff8b) == 3 && prev(byte(0xff8b)) == 1
)

//   > SAY YES
//   > STAND
// * Follow him into the next room, up the stairs, and to his room (stop at the doorway). {SAVE V}
//   > USE PEN (5 -> 247)
// * Enter the room.
// * There will be a long scene, resulting in the defeat of the Death Angel.
//   - Sure looks like we killed him but the game explains it as a "near fatal belly wound".
// * Then the charges against him are listed, and things cut to the courtroom where he gets sentenced (4 -> 251).
// * And finally, you get your celebration.

// https://github.com/historicalsource/police-quest-1/blob/16fdc5439e0d863ea3031626ac2a2ec066c85700/SRC/RM104.CG#L227
function trigger_complete_game() => Location.is(Location.courthouse_exterior) && 
                                    debug_protection() &&
                                    byte(0xff8b) == 9 && prev(byte(0xff8b)) == 8
achievement("Key to the City", "Receive your final reward", 25, type="win_condition",
    trigger = trigger_complete_game()
)

achievement("To the Letter of the Law", "Complete the game with 245 (or more) points", 25, type="missable",
    trigger = trigger_complete_game() && current_score() >= 245
)

// There's many things that can be skipped, including several procedures (like reading people their rights).
// I've marked them with asterisks above, resulting in 172 or 245 points. Unfortunately, because you lose a point
// for showering in your clothes, and can repeat that each time you re-enter the locker room, you can effectively
// zero out your score prior to going to Hotel Delphoria, so having a low point run is.. pointless.





