// The Adventures of Willy Beamish
// #ID = 16006
// MD5: 88e929c3c9db840c2f784d16398651d8

// A button (X) -> repeat speech, or preview speech for selection
// B button (A) -> action
// C button (B) -> toggle between look and arrow
// A+B+C+Start -> return to main menu

// 0x055a70-0x05624f - event flags

screen_school_detention = 0x0004
screen_school_detention_desk_open = 0x0053
screen_school_hallway = 0x0005
screen_school_closeups = 0x0018
screen_school_bathroom = 0x0006
screen_ending_closeups = 0x0019
screen_game_over = 0x001C
screen_house_outside = 0x000A
screen_house_foyer = 0x0034
screen_house_closeups = 0x001A
screen_house_living_room = 0x000B
screen_house_dining_room = 0x000C
screen_house_kitchen = 0x000E
screen_house_backyard = 0x000F
screen_house_upstairs = 0x0010
screen_house_bathroom = 0x0011
screen_house_tiffany = 0x0013
screen_house_willy = 0x0015
screen_house_nintari = 0x0000
screen_house_brianna = 0x0012
screen_house_attic = 0x0016
screen_house_trains = 0x004D
screen_house_newspaper = 0x000D // also, phone call cutscene for job, and washing car
screen_neighborhood_map = 0x001D
screen_treehouse = 0x001E
screen_treehouse_horny = 0x0043
screen_pizzeria = 0x0028
screen_pizzeria_closeups = 0x0036 // also slave-for-life cutscene and explosion
screen_pizzeria_bathroom = 0x0029
screen_park = 0x001F
screen_park_closeups = 0x0048
screen_downtown_map = 0x002A
screen_pier = 0x0020
screen_pier_fountain = 0x0038
screen_pier_kiosk = 0x0045
screen_pier_lottery = 0x0051
screen_alicia_transform = 0x0044
screen_alicia_dining_room = 0x003B
screen_alicia_living_room = 0x003A
screen_alicia_foyer = 0x0039
screen_alicia_kitchen = 0x003C
screen_alicia_upstairs = 0x003D
screen_alicia_brianna = 0x003F
screen_alicia_willy = 0x0041
screen_alicia_tiffany = 0x0040
screen_alicia_bathroom = 0x003E
screen_west_frumpton_closeups = 0x0049
screen_west_frumpton_map = 0x0021
screen_tootsweet_hq = 0x004F
screen_sludgeworks_gate = 0x0022
screen_plumbers_union = 0x0031
screen_plumbers_union_closeups = 0x004C
screen_golden_bowl = 0x0032
screen_day4_closeups = 0x0046
screen_tootsweet_hq_race = 0x0047
screen_frog_contest = 0x0033
screen_security_office = 0x002F
screen_humpford_entrance = 0x002B
screen_humpford_foyer = 0x002C
screen_humpford_closeups = 0x0030
screen_humpford_dining = 0x002D
screen_humpford_kitchen = 0x002E
screen_plumbers_union_office = 0x0023
screen_golden_bowl_inside = 0x0024
screen_golden_bowl_closeups = 0x004A
screen_sludgeworks_closeups = 0x004B
screen_sludgeworks_inside = 0x0025
screen_sludgeworks_tubes = 0x0026
screen_sludgeworks_conveyor = 0x0027
screen_sludgeworks_tunnels = 0x0057
screen_sludgeworks_dad = 0x0037

screens = {
    screen_school_detention: "in detention",
    screen_school_detention_desk_open: "in detention",
    screen_school_hallway: "in the school hallway",
    screen_school_bathroom: "in the school bathroom",
    screen_game_over: "defeated",
    screen_house_outside: "outside his house",
    screen_house_foyer: "in his foyer",
    screen_house_living_room: "in his living room",
    screen_house_dining_room: "in his dining room",
    screen_house_kitchen: "in his kitchen",
    screen_house_backyard: "in his backyard",
    screen_house_upstairs: "in his upstairs hallway",
    screen_house_bathroom: "in his bathroom",
    screen_house_tiffany: "in Tiffany's room",
    screen_house_willy: "in his room",
    screen_house_nintari: "playing K'noidtrix",
    screen_house_brianna: "in Brianna's room",
    screen_house_attic: "in his attic",
    screen_house_trains: "in his attic",
    screen_house_newspaper: "in his dining room",
    screen_neighborhood_map: "exploring the neighborhood",
    screen_treehouse: "at the treehouse",
    screen_treehouse_horny: "at the treehouse",
    screen_pizzeria: "at the pizzeria",
    screen_pizzeria_bathroom: "at the pizzeria",
    screen_pizzeria_closeups: "at the pizzeria",
    screen_park: "at the park",
    screen_park_closeups: "at the park",
    screen_downtown_map: "exploring downtown",
    screen_pier: "at the pier",
    screen_pier_fountain: "at the pier",
    screen_pier_kiosk: "at the pier",
    screen_pier_lottery: "at the pier",
    screen_alicia_transform: "in his house",
    screen_alicia_dining_room: "in his dining room",
    screen_alicia_living_room: "in his living room",
    screen_alicia_foyer: "in his foyer",
    screen_alicia_kitchen: "in his kitchen",
    screen_alicia_upstairs: "in his upstairs hallway",
    screen_alicia_brianna: "in Brianna's room",
    screen_alicia_willy: "in his room",
    screen_alicia_tiffany: "in Tiffany's room",
    screen_alicia_bathroom: "in his bathroom",
    screen_west_frumpton_closeups: "in West Frumpton",
    screen_west_frumpton_map: "exploring West Frumpton",
    screen_tootsweet_hq: "at Tootsweet headquarters",
    screen_sludgeworks_gate: "at the Sludgeworks",
    screen_plumbers_union: "at the plumber's union",
    screen_plumbers_union_closeups: "at the plumber's union",
    screen_golden_bowl: "at the Golden Bowl",
    screen_day4_closeups: "in West Frumpton",
    screen_tootsweet_hq_race: "at Tootsweet headquarters",
    screen_frog_contest: "racing frogs",
    screen_security_office: "in the security office",
    screen_humpford_entrance: "at the Humpford mansion",
    screen_humpford_foyer: "in the Humpford mansion",
    screen_humpford_closeups: "in the Humpford mansion",
    screen_humpford_dining: "in the Humpford mansion",
    screen_humpford_kitchen: "in the Humpford mansion",
    screen_plumbers_union_office: "in the plumber's union",
    screen_golden_bowl_inside: "in the Golden Bowl",
    screen_golden_bowl_closeups: "in the Golden Bowl",
    screen_sludgeworks_closeups: "in the Sludgeworks",
    screen_sludgeworks_inside: "in the Sludgeworks",
    screen_sludgeworks_tubes: "in the Sludgeworks",
    screen_sludgeworks_conveyor: "in the Sludgeworks",
    screen_sludgeworks_tunnels: "in the Sludgeworks",
    screen_sludgeworks_dad: "in the Sludgeworks",
}
function current_screen() => word(0x48E50)
function previous_screen() => word(0x48B9C)

// screen_school_closeups is used for multiple scenes
subscreen_school_nurse = 0x004c // from detention
subscreen_school_nurse2 = 0x0058 // from bathroom
subscreen_school_escape = 0x3B0E
subscreen_school_principal = 0xF0F6
subscreen_school_pushups = 0xF958
subscreen_ending_hospital = 0xD4B8
subscreen_ending_military_school = 0xDA90
subscreen_ending_military_school2 = 0xDAC6
subscreen_ending_poor = 0xE292
subscreen_house_walking_dog = 0x2010
subscreen_house_swing_launch = 0xFB5C
subscreen_house_cut_finger = 0xFB54
subscreen_house_scale = 0xFB98 // also mowing lawn
subscreen_house_sleep = 0xFB9A
subscreen_house_sleep2 = 0xFB9C
subscreen_house_sleep3 = 0xFB9E
subscreen_house_good_night = 0x205E
subscreen_house_good_night2 = 0x2060
subscreen_house_good_night3 = 0x2062
subscreen_house_later = 0x3146
subscreen_house_later2 = 0x3148
subscreen_house_cereal = 0xF2DA

school_subscreens = {
    subscreen_school_principal: "in the principal's office",
    subscreen_school_nurse: "in the nurse's office",
    subscreen_school_nurse2: "in the nurse's office",
    subscreen_school_escape: "leaving the school",
    subscreen_school_pushups: screens[screen_school_hallway],
    subscreen_ending_hospital: "at the hospital",
    subscreen_ending_military_school: "at military school",
    subscreen_ending_military_school2: "at military school",
    subscreen_ending_poor: "broke",
}
    
house_subscreens = {
    subscreen_house_walking_dog: "walking the dog",
    subscreen_house_swing_launch: screens[screen_house_backyard],
    subscreen_house_cut_finger: screens[screen_house_kitchen],
    subscreen_house_scale: screens[screen_house_tiffany],
    subscreen_house_sleep: "is going to bed",
    subscreen_house_sleep2: "is going to bed",
    subscreen_house_sleep3: "is going to bed",
    subscreen_house_good_night: "is going to bed",
    subscreen_house_good_night2: "is going to bed",
    subscreen_house_good_night3: "is going to bed",
    subscreen_house_later: "is going to bed",
    subscreen_house_later2: "is going to bed",
    subscreen_house_cereal: screens[screen_house_dining_room],
    subscreen_ending_hospital: "at the hospital",
    subscreen_ending_military_school: "at military school",
    subscreen_ending_military_school2: "at military school",
    subscreen_ending_poor: "broke",
}
function current_subscreen() => word(0x48184)

function current_cursor() => word(0x4823A)
cursor_arrow = 0x75E0
cursor_wait = 0x75E8
cursor_exit = 0x75F8

function trigger_ignore_loading() => unless(current_cursor() == cursor_wait)

function current_mode() => byte(0x0485C8)
mode_intro = 0
mode_in_game = 1
mode_titles = 4

function current_day() => byte(0x49696)

function in_game() => word(0x0FF1E) == 0x41F9
function trigger_in_game() => never(!in_game()) && trigger_ignore_loading()

rich_presence_conditional_display(current_mode() == mode_titles, "Willy is watching the opening credits")

rich_presence_conditional_display(!in_game(), "Willy is in the school on day 1") // intro

rich_presence_conditional_display(current_screen() == screen_school_closeups || 
                                  current_screen() == screen_ending_closeups, "Willy is {0} on day {1}",
    rich_presence_lookup("SchoolLocation", current_subscreen(), school_subscreens, "in the school"),
    rich_presence_value("Day", current_day())
)

rich_presence_conditional_display(current_screen() == screen_house_closeups, "Willy is {0} on day {1}",
    rich_presence_lookup("HouseLocation", current_subscreen(), house_subscreens, "at his house"),
    rich_presence_value("Day", current_day())
)

rich_presence_display("Willy is {0} on day {1}",
    rich_presence_lookup("Location", current_screen(), screens),
    rich_presence_value("Day", current_day())
)

// http://www.sierrachest.com/index.php?a=games&id=337&title=willy-beamish&fld=walkthrough&pid=130
item_frying_pan = 0      // 0x564A0
item_entry_blank = 1     // 0x564DA
item_red_hall_pass = 2   // 0x56514
item_white_hall_pass = 3 // 0x5654E
item_red_crayon = 4      // 0x56588
item_white_crayon = 5    // 0x565C2
item_key_on_chain = 6    // 0x565FC
item_chain = 7           // 0x56636
item_ferry_token = 8     // 0x56670
item_cup = 9             // 0x566AA
item_helmet = 10         // 0x566E4
item_wooden_block = 11   // 0x5671E
item_conditioner = 12    // 0x56758
item_telephone = 13      // 0x56792
item_yoyo = 14           // 0x567CC
item_plunger = 15        // 0x56806
item_mouse = 16          // 0x56840
item_ferry_token_2 = 17  // 0x5687A
item_tablecloth = 18     // 0x568B4
item_hairspray = 19      // 0x568EE
item_baseball_card = 20  // 0x56928
item_photograph = 21     // 0x56962
item_smoke_bomb = 22     // 0x5699C
item_ninja_star = 23     // 0x569D6
item_security_badge = 24 // 0x56A10
item_lottery_ticket = 25 // 0x56A4A
item_tape_recorder = 26  // 0x56A84
item_tshirt = 27         // 0x56ABE
item_pipe_wrench = 28    // 0x56AF8
item_comic_book = 29     // 0x56B32
item_no_smoking_sign = 30// 0x56B6C
item_blueprint = 31      // 0x56BA6
item_nudie_calendar = 32 // 0x56BE0
item_cola = 33           // 0x56C1A
item_fire_ants = 34      // 0x56C54
item_money = 35          // 0x56C8E
item_diary = 36          // 0x56CC8
item_nintari_key = 37    // 0x56D02
item_report_card = 38    // 0x56D3C
item_flies = 39          // 0x56D76
item_toupee = 40         // 0x56DB0
item_game_buddy = 41     // 0x56DEA
item_horny = 42          // 0x56E24

// item location is typically 1 until the user picks it up
// 2 = in inventory, 0x11 = cursor/on screen
function item_location(item) => word(0x564A0 + item * 0x3A)
function item_in_inventory(item) => item_location(item) == 2
function item_collected(item) => item_location(item) == 2 && prev(item_location(item)) != 2

function trigger_visit_screen(screen) => trigger_ignore_loading() && once(current_screen() == screen)
function trigger_subscreen(screen, subscreen) => current_screen() == screen && current_subscreen() == subscreen
function trigger_visit_subscreen(screen, subscreen) => trigger_ignore_loading() && once(trigger_subscreen(screen, subscreen))

// i couldn't find a unique speech identifier, but $24BE6 indicates the length of the current speech/sound effect buffer
// so it's mostly unique.
function current_speech_length() => word(0x24be6)

// trouble goes from 0 to 10. each level raises the meter by 8 pixels, but the levels are 11 pixels apart
// so level=1 is just above "good boy", 2 is just below "ok", 3 and 4 are a few pixels on either side of "uh-oh",
// 5 is just above "not good"", 6 is just below "big trouble", 7 is halfway to "watch out", 8 is just above
// "watch out", 9 is at "cadet school" (but doesn't actually trigger it) and 10 is fully filled (game over)
function trouble_level() => byte(0x4819C)

// phone calls (from graffiti):
// 910-2002: 0x0E - private line (adult chat)
// 342-3403: 0x13 - Golden Bowl tavern
// 942-2156: 0x1D - arnold
// 432-7446: 0x1E - astrological prediction
// 665-5433: 0x20 - insurance
// 741-6972: 0x24 - brockton mortuary
// 858-2593: 0x28 - annoyed lady (calls cops)
// 369-8796: 0x30 - John's place answering machine
// 999-9999: 0x3F - cabana on the beach side

// from Willy's secret notebook
// 555-9981: 0x2A - disconnected
// 555-2154: 0x1B - disconnected
// 555-4499: 0x29 - disconnected
// 555-6749: 0x29 - disconnected
// 555-TRUX: 0x2F - disconnected
// 555-3444: 0x1E - astrology
// 555-9872: 0x29 - disconnected
// 555-5778: 0x2A - disconnected
// 555-3434: 0x1D - arnold
// 555-4889: 0x2C - disconnected
// 555-TIZE: 0x27 - disconnected
// 555-LIFE: 0x1E - astrology


// ==== Day One, School ====
// * Select any option
// * "Oh, that was just my frog, Horny."
// * Option 1 or 2
// * Give toupee to principal; return to detention
// * Open Willy's desk
// * Use White Crayon on Wooden Block
// * Get Wooden Block
// * Wait for Ms. Glass to fall asleep
// * Sneak out door
// * Try to sneak outside
// * Select any option
// * Show Hall Pass
// * "Smokin' ain't allowed in school"; get sent to nurse's office; return to detention
// * Sneak out door
// * Try to sneak outside
// * "School's Out"; do pushups
// * Show hall pass
// * Leave

function trigger_snuck_out_of_detention() => byte(0x56216) == 1 && // becomes 0 if detention timer expires
    (current_screen() == screen_school_closeups && current_subscreen() == subscreen_school_escape)

achievement("Early Release [m]", "Sneak out of the school before detention is over", 5,
    trigger = trigger_in_game() && 
              trigger_snuck_out_of_detention()
)

// visit principal frick first, then get sent to the nurse by spider
// or visit nurse first and get sent to the principal by trying to pass the coach without a hall pass
achievement("Detention Detours [m]", "Visit the principal and the nurse before sneaking out of school", 5,
    trigger = trigger_in_game() && 
              trigger_visit_screen(screen_school_detention) &&
              trigger_visit_subscreen(screen_school_closeups, subscreen_school_principal) &&
              (trigger_visit_subscreen(screen_school_closeups, subscreen_school_nurse) ||    // direct from detention
               trigger_visit_subscreen(screen_school_closeups, subscreen_school_nurse2)) &&  // after confronting spider
              trigger_snuck_out_of_detention()
)

// ==== Day One, Home ====
// > [scd_U-A.brm]

grandpa_interactions = {
    screen_house_outside:     0x69D6, // "watch yourself boy, something foul is afoot in the city of frumpton"
                              // 0x1748, // "you would have been in more trouble from your parents if you tried to hide the truth"
                              // byte(0x55a7e) == 1 (advice from grandpa)
    screen_house_tiffany:     0xB45C, // "i really don't think you should take your sister's diary, willy"
    screen_house_attic:       0x23C0, // "better be careful willy, those trains are important to your dad's mental health"
    screen_house_dining_room: 0x8140 // "well, willy, what are you going to do?"
                              // does not happen if willy did not sneak home
}

// * Take report card
// * Go inside House
// * Walk Duffy
// * Listen to the answering machine messages

achievement("If It Was Important, They'll Call Back [m]", "Listen to all the answering machine messages", 3,
    trigger = trigger_in_game() && current_screen() == screen_house_foyer &&
              byte(0x55FF6) == 0xE7 && 
              prev(byte(0x55FF6)) < 10 // 5 messages on day 1; 3 on day 2
)

// * Enter kitchen
// * Talk to Brianna; take Brianna outside to play on swings
// * Refuse to swing her higher
// * Cut Vegetables
// * Go upstairs to the bathroom
// * Open the cabinet under the sink
// * Use Germ-Away on cut
// * Use Band-Aid on cut
// * Go into attic
// * Talk to Grandpa
// * Play with trains
// * Go into Tiffany's room
// * Take her diary

// * Go to your room
// * Play Nintari

function trigger_playing_knoidtrix() => current_screen() == 0 && previous_screen() == screen_house_willy
function knoidtrix_level() => byte(0x26C1C) - 6

achievement("Ready for the Championship [m]", "Reach Level 3 in Super Space K'noidtrix", 3,
    trigger = trigger_playing_knoidtrix() && knoidtrix_level() == 3 && prev(knoidtrix_level()) == 2
)

// * Advance time

// ==== Day One, Dinner Time ====
// * Go to dining room

trigger_grandpa = trigger_in_game()
for interaction in grandpa_interactions
{
    trigger_grandpa = trigger_grandpa && 
        once(current_screen() == interaction && current_speech_length() == grandpa_interactions[interaction])
}

// you must sneak out of the school _and_ take the report card to get the interaction in the dining room
achievement("Otherworldly Advice [m]", "See Grandpa's ghost four times on day 1 (single session)", 3,
    trigger = trigger_grandpa
)

// * "Here Dad"
// * Give report card to dad
// * "Here, boy. You're a part of the family, too."
// * Go to living room
// > [scd_U-B.brm]
// * Talk to dad
// * "Oh, all right."; get money
// * Go to bathroom
// * Use Horny on Tiffany to get key
// * Grab Key

achievement("I Believe That's Mine [m]", "Recover the Nintari key on day one", 5,
    trigger = trigger_in_game() && current_screen() == screen_house_bathroom &&
              item_collected(item_nintari_key)
)

// * Go to Brianna's room
// * Help her up
// * Go to your bedroom
// * Get Jar of Flies
// * Unlock Nintari; play Nintari
// * Advance time
// * Go to bed


// helping brianna back into bed is the only thing that lowers trouble level. 
// there's several things that raise it, but they're all easily avoidable.
achievement("The Good Son [m]", "Finish the first day under UH-OH trouble level", 5,
    trigger = trigger_in_game() && current_day() == 2 &&     // day advances before the point where we want this to trigger
              current_screen() == screen_house_closeups &&   // subscreen varies slightly based on what the player has done.
              previous_screen() == screen_house_willy &&     // assume that any closeup in willy's bedroom is the sleep sequence.
              byte(0x48185) == 0x20 &&                       // try to match part of the subscreen
              trouble_level() < 4
)

// ==== Day Two ====
// * "Sure, Brianna"
// * "All right boy"
// * "Okay, okay"; wash truck; get more money
// * Go to attic; talk to dad
// * Leave house
// > [scd_U-C.brm]
// * Go to treehouse
// * Get Comic Book
// * Talk to Perry
// * Give him the diary; get baseball card

achievement("Only Twelve in the Whole World [m]", "Get the Mickey Morris card", 3,
    trigger = trigger_in_game() && current_screen() == screen_treehouse &&
              item_collected(item_baseball_card)
)

// * Select either choice when Dana talks about frog
// * Go to pizzeria
// * "I do!"
// * "Lemme go..."
// * Take No Smoking Sign and throw it in the trash
// * Give Comic Book

achievement("Bye-Bye Bully", "Spider won't be bothering you anymore", 5,
    trigger = trigger_in_game() &&
              once(current_screen() == screen_pizzeria_bathroom) && // the bathroom is only accessible going into this
              current_screen() == screen_pizzeria_closeups &&       // this relies on the brief transition to the pier
              previous_screen() == screen_pier &&                   // before the cutscene
              current_speech_length() == 0x5FF6                     // scream sound
)

// * Talk to either Dana or Perry; go to park
// > [scd_U-D.brm]
// * Put Horny on ground
// * Give flies to Horny
// * Give money to vendor
// * Give soda to Horny
// * Click on Horny

achievement("Experimental Frog [m]", "Make Horny sleep, jump 15 feet, and jump in the fountain at the park", 3,
    trigger = trigger_in_game() &&
              current_screen() == screen_park &&
              byte(0x55ac6) == 1 && // horny jumps for gigi
              byte(0x55d7e) > 0  && // give soda to horny
              byte(0x55d96) > 0  && // give flies to horny
              byte(0x55ffe) == 0    // horny resting
)

// * Leave park; Tiffany crashes car
// * Go to town; then to the pier (fountain)
// * Examine the fountain
// * Take a token from the fountain
// * Leave the fountain
// * Examine the kiosk
// * Give the picture to the lady
// * Examine the lottery machine
// * Push the blue button
// * Pick up the lottery ticket
// * Advance time until you have to go home
// * Return home; meet babysitter
// > [scd_U-E.brm]
// * Go to dining room; find out more about babysitter
// * Go to bathroom
// * Get hairspray from the cabinet
// * Press C twice to get targeting reticle
// * Spray bat with hairspray
// * Go to Brianna's room
// * Get mouse
// * Go to the living room
// * Click on the back of the couch to hide behind it
// * Put the mouse on the coffee table
// * Switch back to the targeting reticle and click on the bat

achievement("Babysitter from Hell", "Survive the second night", 10,
    trigger = trigger_in_game() &&
              current_screen() == screen_house_closeups &&
              previous_screen() == screen_alicia_living_room &&
              current_speech_length() == 0x09E6                    // good night, don't let the bats... err, bed bugs bite.
)

// ==== Day Three ====
// * Go into the kitchen
// * "Here you go, boy"
// * Go to the living room
// * "Okay Duffy, let's go"
// * Go to the living room
// * Talk to Brianna; push her on the swing (but not too high)
// * Go to the treehouse
// * Get fire ants
// * Go to the pier
// > [scd_U-F.brm]
// * Approach the fountain; see Tiffany
// * Attempt to get on the ferry
// * Give token to ferryman
// * Go to Tootsweet headquarters
// * Get entry blank
// * Go to Golden Bowl
// * Try to enter several times until gang shows up
// * Throw the smoke bomb
// * Use the wrench on the fire hydrant
// * Leave; run to the Tootsweet headquarters
// * Talk to the tourists
// - "Those guys are going to clobber me!"

achievement("What Did He Say?", "Defeat the Cripes (with a little help)", 10,
    trigger = trigger_in_game() &&
              current_screen() == screen_west_frumpton_closeups &&
              previous_screen() == screen_west_frumpton_map &&
              current_speech_length() == 0x28C6 // second 'what did he say'
)

// * Go in house
// * Go to bed

// ==== Day Four ====

// * Go to the kitchen
// * "Here you go, boy"
// * Go to the living room
// * "Okay Duffy, let's go" 
// * Leave house
// > [scd_U-G.brm]

// --- DETOUR ---
// * Go to the pier
// * Get on the ferry
// * Go to Tootsweet headquarters
// * Give flies to Horny
// * Give entry blank to old man
// * Talk to each of the other contestants until the race begins
// - press the red button to make horny jump. the up/down meter on the left determines how far he'll jump
// - take first (only have to beat Turbofrog)

achievement("World Class Frog [m]", "Take first in the frog-jumping competition", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_tootsweet_hq_race &&
              byte(0x55eee) == 1 && // first place
              byte(0x5608e) == 1    // race is over
)

// --- RELOAD GAME ---

// * Go to treehouse
// * Give T-Shirt to Dana

achievement("Impress the Girl [m]", "Convince Dana to bring Gigi to the frog-jumping competition", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_treehouse &&
              byte(0x55fde) == 1 && // give shirt to dana
              prev(byte(0x55fde)) == 0
)

// * Go to the pier
// * Get on the ferry
// * Go to Tootsweet headquarters
// * Give flies to Horny
// * Give entry blank to old man
// * Talk to each of the other contestants until the race begins
// - press the red button to make horny jump. the up/down meter on the left determines how far he'll jump
// - gigi will take first
// - second prize is $2500 and a jet ski, and a years supply of slam dunk cola
// - first prize is $25000 and a jet ski, and a years supply of slam dunk cola, but you can't get first if gigi comes
// * Combine the key with the chain
// * Use the key chain on the guard
// - "Hoopa, Coiler, Agamemnon"

achievement("Very Powerful Words", "Escape from the security office", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_day4_closeups &&
              previous_screen() == screen_security_office &&
              byte(0x55ede) == 1 // use key on guard (goes to 3 if use wrong phrase, which prevents trigger in that scenario)
)

// * Get on the jet ski (at the pier)
// * Ride to mansion
// * Enter mansion
// > [scd_U-H.brm]
// * Talk to parrot
// - "Sure. Hi. What's your name?"
// - "Who's Harry?"
// - "Go on tell me more. I'm all ears."
// - "They can't do that, can they?"
// * Go to dining room (right)
// * Take cup off table; put on floor
// * Pick up cup
// * Get table cloth
// * Go back to entrance hall
// * Put table cloth on ground in front of suit of armor
// * Examine suit of armor
// * Get blueprint
// * Get helmet
// * Go to kitchen (right from dining room)
// > [scd_U-I.brm]
// * Throw cup at cook
// * Sneak up behind cook (exit button near bottom of screen)
// * Grab sauce pan and empty it onto the floor behind the cook
// * Push the pot
// * Go back to entrance (exit button at entrance)
// **** IMPORTANT: leave the kitchen and return here or the game may lock up when willy rides the carousel
// * Jump onto far carousel
// * Throw helmet onto cook
// * Press lower right button

achievement("Dinner is Canceled", "Rescue the frogs", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_humpford_kitchen &&
              byte(0x55b6e) == 1 &&                           // helmet on chef
              byte(0x55fd6) == 1 && prev(byte(0x55fd6)) == 0  // stop conveyor
)

// * Leave the kitchen; you will get caught
// * Ride to West Frumpton
// * Put the magnifying glass in the lowerright corner of the screen to examine the jet ski
// - press A several times if you're having trouble finding the spot
// * Get off the jet ski and go to the plumbers' union
// > [scd_U-J.brm]
// * Climb in the window
// * Try to search the desk; Louis shows up
// * Grab the plunger
// * Use it on Louis
// * Grab the security pass off the desk
// * Leave
// * Enter the phone booth
// * Place the tape recorder on the ledge
// * Put the phone on the recorder
// * Press the record button (circle)
// * Dial 432-SIGN (432-7446)
// * When the message is done, press the record button again to stop recording
// * Push down on the receiver hook to hang up
// * Put the phone back on the recorder
// * Dial the Golden Bowl (342-3403)
// * Press the play button (triangle)

achievement("A Game of Phones", "Get Ray to abandon his post", 5,
    trigger = in_game() &&
              current_screen() == screen_plumbers_union_closeups &&
              byte(0x55bae) == 1 && // play recorded message
              byte(0x55f76) == 0 && prev(byte(0x55f76)) == 1
)

// * Go to the Golden Bowl
// * Give the lottery ticket to the bartender
// * Grab the calendar off the counter (not the wall)
// * Go to the factory (right side of map)
// > [scd_U-K.brm]
// * Give the calendar to the strikers
// * Attempt to enter the factory
// * Give the security pass to the guard (left of strikers)
// * Enter the factory

achievement("Sure, I Work Here", "Sneak into the Sludgeworks", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_sludgeworks_inside &&
              previous_screen() == screen_sludgeworks_closeups
)

// * Run to the console in the middle of the screen
// * Open the cover on the switch
// * Toggle the switch [the guards will start coming, you have to push the buttons and the stick fast!]
// * Press Green, Purple, Red, Purple
// * Push the top of the stick left

achievement("I Hope You Can Swim", "Retract the bridge before you're caught", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_sludgeworks_inside &&
              byte(0x55f3e) == 1 && prev(byte(0x55f3e)) == 0
)

// * Move to the next room
// * Approach the console
// * Turn it on
// * Enter AIR and press enter to eliminate the guards

// * When the goon throws his hat, duck
// * Pick up the hat
// * Change to the targeting reticle and throw it at the goon

achievement("Who Throws a Hat?", "Defeat the goon", 5,
    trigger = trigger_in_game() &&
              current_screen() == screen_sludgeworks_conveyor &&
              byte(0x55ea6) == 1 && // goon threw hat
              byte(0x55e8e) == 0 && // throw hat back
              byte(0x55f3e) == 1    // willy arrives in middle of conveyor
)

// * Jump to the platform when it's raised
// * Jump to the tram when the platform is lowered
// > [scd_U-L.brm]
// * Go straight, right, left, straight, left

// * Use yo-yo on yourself to start swinging it
// * Click on Leona when the targeting reticle appears
// * Jump to the flushing lever

achievement("It Was Nothing, Dad", "Rescue your father", 10,
    trigger = trigger_in_game() &&
              current_screen() == screen_sludgeworks_closeups &&
              previous_screen() == screen_sludgeworks_dad &&
              current_speech_length() == 0x9348 // "eh, it was nothing, dad"
)
