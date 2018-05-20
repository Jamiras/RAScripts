// South Park Rally
// #ID=10392
// MD5: 1c494719032ff99382b167c43fb11762

// https://www.gamesradar.com/south-park-rally/cheats/

// controls:
// - left analog = steer
// - a = gas
// - b = brake
// - r = handbrake
// - c down = change selected weapon
// - c right = toggle HUD elements
// - z = fire weapon

function current_character() => byte(0x08D7CC) // duplicated at 0x0B3CFF
character_stan = 24
character_kyle = 14
character_cartman = 4
character_kenny = 13
character_wendy = 30
character_chef = 6
character_barbrady = 0
character_jimbo = 28
character_pip = 21
character_garrison = 17
character_bebe = 1
character_shelly = 23
character_tweek = 27
character_mackey = 18
character_cartman_cop = 5
character_big_gay_al = 2
character_ike = 11
character_visitor = 29
character_ned = 20
character_mephesto = 16
character_death = 9
character_grandpa = 10
character_marvin = 15
character_jesus = 12
character_terrance_and_phillip = 25
character_damien = 8
character_satan = 22

characters = {
    character_stan: "Stan",
    character_kyle: "Kyle",
    character_cartman: "Cartman",
    character_kenny: "Kenny",
    character_wendy: "Wendy",
    character_chef: "Chef",
    character_barbrady: "Barbrady",
    character_jimbo: "Jimbo",
    character_pip: "Pip",
    character_garrison: "Mr. Garrison",
    character_bebe: "Bebe",
    character_shelly: "Shelly",
    character_tweek: "Tweek",
    character_mackey: "Mr. Mackey",
    character_cartman_cop: "Cartman Cop",
    character_big_gay_al: "Big Gay Al",
    character_ike: "Ike",
    character_visitor: "Visitor",
    character_ned: "Ned",
    character_mephesto: "Mephesto",
    character_death: "Death",
    character_grandpa: "Grandpa",
    character_marvin: "Marvin",
    character_jesus: "Jesus",
    character_terrance_and_phillip: "Terrance and Phillip",
    character_damien: "Damien",
    character_satan: "Satan",
}

function current_track() => byte(0x086380)
track_city = 0
track_forest = 1
track_big_gay_als_home = 2
track_volcano = 3
track_mountain = 4
track_farm = 5
track_sewers = 6
track_gridiron = 7

tracks = {
    track_city: "in the city",
    track_forest: "in the forest",
    track_big_gay_als_home: "at Big Gay Al's",
    track_volcano: "at the volcano",
    track_mountain: "at the mountain",
    track_farm: "at the farm",
    track_sewers: "in the sewers",
    track_gridiron: "on the gridiron",
}

track_names = {
    track_city: "City",
    track_forest: "Forest",
    track_big_gay_als_home: "Big Gay Al's",
    track_volcano: "Volcano",
    track_mountain: "Mountain",
    track_farm: "Farm",
    track_sewers: "Sewers", 
    track_gridiron: "Gridiron",
}

function current_race() => byte(0x086D94)
race_rally_days_1 = 0
race_rally_days_2 = 1
race_cow_days = 2
race_valentines_day = 3
race_spring_cleaning = 4
race_read_a_book_day = 5
race_easter = 6
race_pink_lemonade = 7
race_memorial_day = 8
race_fourth_of_july = 9
race_halloween = 10
race_thanksgiving = 11
race_christmas = 12
race_new_years_eve = 13
race_ass_battle = 14

races = {
    race_rally_days_1: "Rally Days 1",
    race_rally_days_2: "Rally Days 2",
    race_cow_days: "Cow Days",
    race_valentines_day: "Valentine's Day",
    race_spring_cleaning: "Spring Cleaning",
    race_read_a_book_day: "Read-a-Book Day",
    race_easter: "Easter",
    race_pink_lemonade: "Pink Lemonade",
    race_memorial_day: "Memorial Day",
    race_fourth_of_july: "4th of July",
    race_halloween: "Halloween",
    race_thanksgiving: "Thanksgiving",
    race_christmas: "Christmas",
    race_new_years_eve: "New Year's Eve",
    race_ass_battle: "Ass Battle",
}

function current_screen() => byte(0x086304)
screen_logos = 2
screen_title_song = 4
screen_epilogue = 5
screen_menus = 6
screen_in_game = 7

function is_demo() => byte(0x086C9C) == 1
function is_championship() => byte(0x086CA0) == 0
function is_arcade() => byte(0x086CA0) == 1
function is_multiplayer() => byte(0x086CA0) == 2
function is_paused() => byte(0x086C90) == 1

rich_presence_conditional_display(is_demo(), "Watching the demo")
rich_presence_conditional_display(current_character() == character_terrance_and_phillip && is_championship() && current_screen() == screen_in_game, 
    "{0} are participating in the {1} championship race",
    rich_presence_lookup("Char", current_character(), characters),
    rich_presence_lookup("Race", current_race(), races)
)
rich_presence_conditional_display(is_championship() && current_screen() == screen_in_game, 
    "{0} is participating in the {1} championship race",
    rich_presence_lookup("Char", current_character(), characters),
    rich_presence_lookup("Race", current_race(), races)
)
rich_presence_conditional_display(current_character() == character_terrance_and_phillip && current_screen() == screen_in_game, 
    "{0} are participating in a {1} race {2}",
    rich_presence_lookup("Char", current_character(), characters),
    rich_presence_lookup("Race", current_race(), races),
    rich_presence_lookup("Track", current_track(), tracks)
)
rich_presence_conditional_display(current_screen() == screen_in_game, "{0} is participating in a {1} race {2}",
    rich_presence_lookup("Char", current_character(), characters),
    rich_presence_lookup("Race", current_race(), races),
    rich_presence_lookup("Track", current_track(), tracks)
)
rich_presence_conditional_display(current_screen() == screen_epilogue, "{0} is celebrating victory",
    rich_presence_lookup("Char", current_character(), characters)
)
rich_presence_display("Preparing to race")

weapon_salty_balls = 0
weapon_cheesy_poofs = 1
weapon_anal_probe = 2
weapon_rat = 3
weapon_water_balloon = 4
weapon_barf = 5
weapon_kitty = 6
weapon_cow = 7
weapon_taco = 8
weapon_dog = 9
weapon_gnome = 10
weapon_frog = 11
weapon_peace = 12
weapon_frida = 13
weapon_phillip = 14

function is_unlocked(unlockable)
{
    addr = 0x088750 + unlockable / 16
    bit = unlockable % 16
    if (bit == 0)
        return bit0(addr)
    if (bit == 1)
        return bit1(addr)
    if (bit == 2)
        return bit2(addr)
    if (bit == 3)
        return bit3(addr)
    if (bit == 4)
        return bit4(addr)
    if (bit == 5)
        return bit5(addr)
    if (bit == 6)
        return bit6(addr)
    return bit7(addr)
}

unlockable_cheat_sheet = 0x01
unlockable_pip = 0x02
unlockable_garrison = 0x03
unlockable_bebe = 0x04
unlockable_shelly = 0x06
unlockable_tweek = 0x10
unlockable_mackey = 0x11
unlockable_cartman_cop = 0x13
unlockable_big_gay_al = 0x17
unlockable_ike = 0x20
unlockable_visitor = 0x21
unlockable_ned = 0x22
unlockable_mephesto = 0x23
unlockable_death = 0x24
unlockable_grandpa = 0x25
unlockable_marvin = 0x26
unlockable_jesus = 0x30
unlockable_terrance_and_phillip = 0x31
unlockable_damien = 0x32
unlockable_satan = 0x33
unlockable_random_checkpoints = 0x34
unlockable_race_rally_days = 0x40
unlockable_race_rally_days2 = 0x41
unlockable_race_cow_days = 0x42
unlockable_race_valentines_day = 0x43
unlockable_race_spring_cleaning = 0x44
unlockable_race_read_a_book_day = 0x45
unlockable_race_easter = 0x46
unlockable_race_pink_lemonade = 0x47
unlockable_race_memorial_day = 0x50
unlockable_race_fourth_of_july = 0x51
unlockable_race_halloween = 0x52
unlockable_race_thanksgiving = 0x53
unlockable_race_christmas = 0x54
unlockable_race_new_years_eve = 0x55
unlockable_track_city = 0x80
unlockable_track_forest = 0x81
unlockable_track_big_gay_als_home = 0x82
unlockable_track_volcano = 0x83
unlockable_track_mountains = 0x84
unlockable_track_farm = 0x85
unlockable_track_sewers = 0x86

function current_tokens() => byte(0x08D65A)

function is_before_race() => byte(0x086CB8) == 0
function is_winner() => byte(0x086374) == 0xA0 // is this reliable?
function trigger_start_race() => once(is_before_race()) && byte(0x86CB8) == 1 && !is_demo()
function trigger_in_race(race) => current_screen() == screen_in_game && never(current_race() != race) && is_championship()
function trigger_win_race(race, end_trigger) => trigger_start_race() && end_trigger && is_winner() && trigger_in_race(race)

// ----------------------------------------------------------------------------
// Races (117pts)

achievement(
    title = "Rally Days 1", points = 3,
    description = "Win the Rally Days championship race",
    trigger = trigger_win_race(race_rally_days_1, byte(0x087270) == 1)
)

achievement(
    title = "Rally Days 2", points = 4,
    description = "Win the Rally Days 2 championship race",
    trigger = trigger_win_race(race_rally_days_2, byte(0x087230) == 1)
)

// Bebe, Big Gay Al, Cartman, Chef, Damien, Grandpa, Jesus, Jimbo, Kenny, Kyle, Marvin, Mephesto, Mr. Garrison, 
// Mr. Mackey, Pip, Satan, Shelly, Stan, Tweek, Visitor, Wendy
function racer_health(index) => dword(0x0B7D70 + index * 44)
// Ike, Death, Terrance and Phillip
function racer_health2(index) => dword(0x0B7D50 + index * 44)
// Barbrady, Cartman Cop, Ned
function racer_health3(index) => dword(0x0B7D68 + index * 44)
achievement(
    title = "Cow Days", points = 5,
    description = "Win the Cow Days championship race",
    trigger = trigger_start_race() && is_winner() && trigger_in_race(race_cow_days) &&
              ((once(racer_health(0) == 0x42F00000) && racer_health(0) == 0) ||
               (once(racer_health2(0) == 0x42F00000) && racer_health2(0) == 0) ||
               (once(racer_health3(0) == 0x42F00000) && racer_health3(0) == 0))
)

// Big Gay Al, Cartman, Chef, Damien, Grandpa, Jesus, Jimbo, Kyle, Marvin, Mephesto, Mr. Garrison, Mr. Mackey, Pip, 
// Satan, Shelly, Stan, Tweek, Visitor, Wendy
function cupid_targets() => byte(0x0B6A4C) // bits 1-5 indicate which opponents have been hit
// Barbrady, Bebe, Cartman Cop, Kenny, Ned
function cupid_targets2() => byte(0x0B6A44) // bits 1-5 indicate which opponents have been hit
// Death, Ike, Terrance and Phillip
function cupid_targets3() => byte(0x0B6A2C) // bits 1-5 indicate which opponents have been hit
achievement(
    title = "Valentine's Day", points = 5,
    description = "Win the Valentine's Day championship race",
    trigger = trigger_start_race() && is_winner() && trigger_in_race(race_valentines_day) && 
              (cupid_targets() == 0x3E || cupid_targets2() == 0x3E || cupid_targets3() == 0x3E)
)

achievement(
    title = "Spring Cleaning", points = 6,
    description = "Win the Spring Cleaning championship race",
    trigger = trigger_win_race(race_spring_cleaning, byte(0x0872C0) == 1)
)

achievement(
    title = "Read-a-Book Day", points = 6,
    description = "Win the Read-a-Book Day championship race",
    trigger = trigger_win_race(race_read_a_book_day, byte(0x0872A0) == 1)
)

// $0B7B8C = eggs
achievement(
    title = "Easter", points = 7,
    description = "Win the Easter championship race",
    trigger = trigger_win_race(race_easter, byte(0x0872B0) == 1)
)

achievement(
    title = "Pink Lemonade", points = 7,
    description = "Win the Pink Lemonade championship race",
    trigger = trigger_win_race(race_pink_lemonade, byte(0x0872D4) == 1)
)

achievement(
    title = "Memorial Day", points = 8,
    description = "Win the Memorial Day championship race",
    trigger = trigger_win_race(race_memorial_day, byte(0x087240) == 1)
)

achievement(
    title = "Independance Day", points = 9,
    description = "Win the 4th of July championship race",
    trigger = trigger_win_race(race_fourth_of_july, byte(0x087270) == 1)
)

achievement(
    title = "Halloween", points = 10,
    description = "Win the Halloween championship race",
    trigger = trigger_win_race(race_halloween, byte(0x087260) == 1)
)

achievement(
    title = "Thanksgiving", points = 12,
    description = "Win the Thanksgiving championship race",
    trigger = trigger_win_race(race_thanksgiving, byte(0x0872F0) == 1)
)

achievement(
    title = "Christmas", points = 15,
    description = "Win the Christmas championship race",
    trigger = trigger_win_race(race_christmas, byte(0x087230) == 1)
)

achievement(
    title = "New Year's Eve", points = 20,
    description = "Win the New Year's Eve championship race",
    trigger = trigger_win_race(race_new_years_eve, 
                               (once(word(0x0B7D72) == 0x42F0) && dword(0x0B7D70) == 0) || // Death, Ike
                               (once(word(0x0B7D92) == 0x42F0) && dword(0x0B7D90) == 0) || // Bebe, Big Gay Al, Cartman, Chef, Damien, Grandpa,
                                                                                           // Jesus, Jimbo, Kenny, Kyle, Marvin, Mephesto, 
                                                                                           // Mr. Garrison, Mr. Mackey, Pip, Satan, Shelly, 
                                                                                           // Terrance and Phillip, Tweek, Visitor, Wendy 
                               (once(word(0x0B7D8A) == 0x42F0) && dword(0x0B7D88) == 0))   // Barbrady, Cartman Cop, Ned
)

// ----------------------------------------------------------------------------
// Hidden items (80pts)

function coin_achievement(race)
{
    achievement(
        title = "Extra Credit - " + races[race], points = 5,
        description = "Find the extra credit coin in the " + races[race] + " championship race",
        trigger = current_tokens() > prev(current_tokens()) && current_race() == race && 
                  current_screen() == screen_in_game && byte(0x086D90) == 0
    )
}

coin_achievement(race_rally_days_1)    // The coin is behind a green building near checkpoint 3.
coin_achievement(race_rally_days_2)    // The coin is at the very west end of the train track.
coin_achievement(race_cow_days)        // The coin is in a corner of the barn with the haystacks.
coin_achievement(race_valentines_day)  // The coin is in the boat ride entrance of the dance floor.
coin_achievement(race_spring_cleaning) // The coin is hidden behind a small ramp next to checkpoint 2.
coin_achievement(race_read_a_book_day) // The coin is behind the tollbooth of Starks Pond.
coin_achievement(race_easter)          // The coin is on a brown hill just in front of the starting point on the right.
coin_achievement(race_pink_lemonade)   // Go up the staircase and the coin is between the two ramps, behind the Mr. Hankey box.
coin_achievement(race_memorial_day)    // The coin is on the very edge, near where you originally find the laser.
coin_achievement(race_fourth_of_july)  // The coin is behind the South Park Public Access building (the one with the radio tower) west of checkpoint 2.
coin_achievement(race_halloween)       // The coin is behind a triad of trees in the shopping square.
coin_achievement(race_thanksgiving)    // The coin is in the ring of the two-story barn.
coin_achievement(race_christmas)       // The coin is in the area with the two cars next to checkpoint 3.
coin_achievement(race_new_years_eve)   // The coin is on the stone ramp above where checkpoint 1 was in Memorial Day. 

function pinkeye_achievement(track, points)
{
    // these actually set the condition field to 0x41700000, but the player flag isn't set until one frame later
    // by only checking for word() != 0, we ignore the 0x41700000 tick, but catch the next frame, where the player flag is set.
    condition = word(0x0B15EC) != 0 && byte(0xB15EF) == 0x41
    if (track == track_farm)
        condition = condition && (current_race() == race_thanksgiving || 
                                  current_race() == race_cow_days && dword(0x0B2A34) == 0) // prevent trigger if CPU picks up item

    achievement(
        title = "Pinkeye - " + track_names[track], points = points,
        description = "Collect the Pinkeye item " + tracks[track],
        trigger = current_screen() == screen_in_game && is_championship() &&
                  current_track() == track && condition
    )    
}

pinkeye_achievement(track_farm, 2)
pinkeye_achievement(track_mountain, 2)
pinkeye_achievement(track_sewers, 3)

// pinkeye timer is a $0B349C on the valentine's day track, but something else also uses that timer (hit by bow?)
// the secondary timer starts at 0x3F99CF19, so simply check that the timer goes to 0x41700000
achievement(
    title = "Pinkeye - Big Gay Al's", points = 3,
    description = "Collect the Pinkeye item at Big Gay Al's",
    trigger = current_screen() == screen_in_game && is_championship() &&
              current_track() == track_big_gay_als_home && // TODO: !player affected
              (word(0x0B347E) == 0x4170 || // valentine's day
               word(0x0B3496) == 0x4170 || // valentine's day
               word(0x0B349E) == 0x4170 || // valentine's day
               word(0x0B34D6) == 0x4170 || // pink lemonade
               word(0x0B34EE) == 0x4170 || // pink lemonade
               word(0x0B34F6) == 0x4170)   // pink lemonade
)

// ----------------------------------------------------------------------------
// Unlockables (138pts)

// $0F1334: 40017800 race results (rank)
//          4001AC00 secrets unlocked (rally days 1)
//          4001B000 secrets unlocked (rally days 2, valentines)
//          E803D402 stage 1 complete (next)
//          E803D402 stage 4 complete (next)
//          E803D402 race results (next)
//          9001E800 rumble pak
//          02D40528 pause screen
//          02D40528 are you sure?
//
// to capture unlocks on the "secrets unlocked screen", watch the current screen changing from "race results" to "secrets unlocked".
// also require that the secret not be unlocked during the level to prevent triggering when other secrets are unlocked
function trigger_unlock_immediate(unlockable, race) => is_unlocked(unlockable) == 1 && once(is_unlocked(unlockable) == 0) && 
                                                       never(current_race() != race)                                             
function trigger_unlock(unlockable, race) => trigger_unlock_immediate(unlockable, race) &&
                                             word(0x0F1334) == 0x0140 && word(0x0F1336) != 0x0078 && prev(word(0x0F1336)) == 0x0078

achievement(
    title = "Unlockables Checklist", points = 6,
    description = "Win the Rally Days 1 championship race without driving over a single item or boost box",
    trigger = trigger_unlock(unlockable_cheat_sheet, race_rally_days_1)
)

achievement(
    title = "Mr. Garrison", points = 3,
    description = "Be the only racer to activate all four checkpoints in the Rally Days 2 championship race",
    trigger = trigger_unlock(unlockable_garrison, race_rally_days_2)
)

achievement(
    title = "Pip", points = 5,
    description = "Activate only checkpoints 1 and 4 in the Rally Days 2 championship race",
    trigger = trigger_unlock(unlockable_pip, race_rally_days_2)
)

achievement(
    title = "Bebe", points = 3,
    description = "Lose the Cow Days championship race without touching the cure",
    trigger = trigger_unlock(unlockable_bebe, race_cow_days)
)

// First cow on parapet - launch from upstairs (0x0B6A70 = cows collected)
// Second ow on other parapet - launch from upstairs
// Third cow behind ice skater painting in boat ride - cow tunnel leads to roof
achievement(
    title = "Shelly", points = 9,
    description = "Find the three golden cows in the Valentine's Day championship race",
    trigger = trigger_unlock_immediate(unlockable_shelly, race_valentines_day)
)

achievement(
    title = "Mr. Mackey", points = 5,
    description = "Win the Spring Cleaning championship race without continuing",
    trigger = trigger_unlock(unlockable_mackey, race_spring_cleaning)
)

achievement(
    title = "Tweek", points = 5,
    description = "Get five caffeine pick-ups in the Spring Cleaning championship race", // blue boxes - speed boost, not item
    trigger = trigger_unlock_immediate(unlockable_tweek, race_spring_cleaning)
)

achievement(
    title = "Cartman Cop", points = 5,
    description = "Hit the Read-a-Book Day truck with salty balls five times", // red boxes
    trigger = trigger_unlock_immediate(unlockable_cartman_cop, race_read_a_book_day)
)

achievement(
    title = "Big Gay Al", points = 5,
    description = "Win the Pink Lemonade championship race without continuing",
    trigger = trigger_unlock(unlockable_big_gay_al, race_pink_lemonade)
)

achievement(
    title = "Ike", points = 9,
    description = "Find the golden cow in the Memorial Day championship race", // green box for phillip fart power, hit phillip booster,
    trigger = trigger_unlock_immediate(unlockable_ike, race_memorial_day)      // then fart onto plane wing
)

achievement(
    title = "Visitor", points = 5,
    description = "Collect both pot pies in the Memorial Day championship race", // One is in a narrow cliff area just above checkpoint 1. The
    trigger = trigger_unlock_immediate(unlockable_visitor, race_memorial_day)    // other is on a narrow passage next to checkpoint 4. 
)

achievement(
    title = "Mephesto", points = 7,
    description = "Win the 4th of July championship race without continuing",
    trigger = trigger_unlock(unlockable_mephesto, race_fourth_of_july)
)

achievement(
    title = "Ned", points = 5,
    description = "Collect twelve speed boost power-ups in the 4th of July championship race", // terrance boxes, not usable items
    trigger = trigger_unlock(unlockable_ned, race_fourth_of_july)
)

achievement(
    title = "Grandpa", points = 10,
    description = "Win the Halloween championship race without continuing",
    trigger = trigger_unlock(unlockable_grandpa, race_halloween)
)

achievement(
    title = "Death", points = 5,
    description = "Win the Halloween championship race by dropping off four candies at a time",
    trigger = trigger_unlock(unlockable_death, race_halloween)
)

achievement(
    title = "Marvin", points = 4,
    description = "Lose the Thanksgiving championship race without collecting any turkeys",
    trigger = trigger_unlock(unlockable_marvin, race_thanksgiving)
)

achievement(
    title = "Jesus", points = 12,
    description = "Win the Christmas championship race without continuing",
    trigger = trigger_unlock(unlockable_jesus, race_christmas)
)

achievement(
    title = "Terrance and Phillip", points = 10,
    description = "Find all four golden cows in the Christmas championship race",
    trigger = trigger_unlock_immediate(unlockable_terrance_and_phillip, race_christmas)
    // One is behind a house to the right of the starting point. One is behind the southwest building near checkpoint 3.
    // One is in a small ditch north of the road north of checkpoint 2. The last is behind a house west of checkpoint 4.
)

achievement(
    title = "Damien", points = 10,
    description = "Be the only player to hold the key in the New Year's Eve championship race",
    trigger = trigger_unlock(unlockable_damien, race_new_years_eve)
)

achievement(
    title = "Satan", points = 15,
    description = "Win the New Years Eve championship race without continuing",
    trigger = trigger_unlock(unlockable_satan, race_new_years_eve)
)

// ----------------------------------------------------------------------------
// Challenges (65pts)

// rat - red box
// cow/dog - blue box
achievement(
    title = "Pig and Elephant DNA Just Don't Splice", points = 4,
    description = "Have the rat, cow, and dog items in your inventory at the same time during the Rally Days 1 championship race",
    trigger = trigger_in_race(race_rally_days_1) && 
              ((byte(0x0B4683) == weapon_rat && byte(0x0B468B) == weapon_cow && byte(0x0B4693) == weapon_dog) ||
               (byte(0x0B4683) == weapon_rat && byte(0x0B468B) == weapon_dog && byte(0x0B4693) == weapon_cow) ||
               (byte(0x0B4683) == weapon_cow && byte(0x0B468B) == weapon_rat && byte(0x0B4693) == weapon_dog) ||
               (byte(0x0B4683) == weapon_cow && byte(0x0B468B) == weapon_dog && byte(0x0B4693) == weapon_rat) ||
               (byte(0x0B4683) == weapon_dog && byte(0x0B468B) == weapon_cow && byte(0x0B4693) == weapon_rat) ||
               (byte(0x0B4683) == weapon_dog && byte(0x0B468B) == weapon_rat && byte(0x0B4693) == weapon_cow))
)

achievement(
    title = "Drugs Are Bad, Mmmkay?", points = 6,
    description = "Win the Rally Days 2 championship race without picking up any items",
    trigger = trigger_win_race(race_rally_days_2, byte(0x087230) == 1) &&
              never(byte(0x0B46EB) != 0xFF)
)

// couldn't find "ahead by %", so just make sure all opponents are at 80% or higher
// $0B7D70 = player health (40000000 = cured, 42BEFFFE/FF=79/80% boundary)
// $0B7D9C = opponent 1
// $0B7DC8 = opponent 2
// $0B7DF4 = opponent 3
// $0B7E20 = opponent 4
// $0B7E4C = opponent 5
health_80_percent = 0x42BEFFFE
achievement(
    title = "I'm Super! Thanks for Asking", points = 6,
    description = "Win the Cow Days championship race at least 80% ahead of everyone else",
    trigger = trigger_win_race(race_cow_days, is_winner()) &&
              ((once(racer_health(0) == 0x42F00000) && racer_health(0) == 0 &&
               racer_health(1) > health_80_percent &&
               racer_health(2) > health_80_percent &&
               racer_health(3) > health_80_percent &&
               racer_health(4) > health_80_percent &&
               racer_health(5) > health_80_percent) ||
              (once(racer_health2(0) == 0x42F00000) && racer_health2(0) == 0 &&
               racer_health2(1) > health_80_percent &&
               racer_health2(2) > health_80_percent &&
               racer_health2(3) > health_80_percent &&
               racer_health2(4) > health_80_percent &&
               racer_health2(5) > health_80_percent) ||
              (once(racer_health3(0) == 0x42F00000) && racer_health3(0) == 0 &&
               racer_health3(1) > health_80_percent &&
               racer_health3(2) > health_80_percent &&
               racer_health3(3) > health_80_percent &&
               racer_health3(4) > health_80_percent &&
               racer_health3(5) > health_80_percent))
)

achievement(
    title = "They're Coming Right For Us!", points = 14,
    description = "Hit all five opponents in the Valentine's Day championship race without losing the bow and arrow",
    trigger = trigger_in_race(race_valentines_day) &&
              never(dword(0x0B145F) == 0) &&   // $0B145C is 0x800B6C98 when holding the bow
              ((once(cupid_targets() == 0) && cupid_targets() == 0x3E) ||    
               (once(cupid_targets2() == 0) && cupid_targets2() == 0x3E) ||    
               (once(cupid_targets3() == 0) && cupid_targets3() == 0x3E))    
)

// $0B22AC/$0B22B0/$0B22B4 = non-zero when holding underpants, 0 when not
achievement(
    title = "Phase 3 - Profit", points = 9,
    description = "Hold all three pairs of underpants in the Spring Cleaning championship race",
    trigger = trigger_in_race(race_spring_cleaning) && trigger_start_race() &&
              dword(0x0B22AC) != 0 && dword(0x0B22B0) != 0 && dword(0x0B22B4) != 0
)

function collect_pot_pie(index) => dword(0x0B7AEC + index * 8) > prev(dword(0xB7AF0 + index * 8))
achievement(
    title = "No Kitty! This is My Pot-Pie", points = 4,
    description = "Collect a pot pie in the Memorial Day championship race while having a kitty in your inventory",
    trigger = trigger_in_race(race_memorial_day) && trigger_start_race() &&
             (byte(0x0B271B) == weapon_kitty && collect_pot_pie(0) ||
              byte(0x0B2723) == weapon_kitty && collect_pot_pie(0) ||
              byte(0x0B272B) == weapon_kitty && collect_pot_pie(0) ||
              byte(0x0B271B) == weapon_kitty && collect_pot_pie(1) ||
              byte(0x0B2723) == weapon_kitty && collect_pot_pie(1) ||
              byte(0x0B272B) == weapon_kitty && collect_pot_pie(1))
)

// Couldn't figure out how to not trigger when the player is flipped over by driving up a wall
//achievement(
//    title = "Kick the Baby", points = 5,
//    description = "Spend at least two seconds airborne",
//    trigger = current_screen() == screen_in_game && is_championship() &&
//              never(dword(0x086720) == 0) && // level loading
//              never(byte(0x09357E) == 0xFF) && // fall off map
//              never(byte(0x0B1EC0) != 0) && // hit by something
//              repeated(140, byte(0x0B1EB8) == 0) && never(byte(0x0B1EB8) == 1) && unless(is_paused()) // volcano
//)

achievement(
    title = "Hello There, Children", points = 6,
    description = "Deliver at least 15 candies during the Halloween championsip race",
    trigger = trigger_in_race(race_halloween) &&
              ((byte(0x0B8B44) >= 15 && byte(0x0B8B45) == 0) || // Cartman, Chef, Death, Ike, Kenny, Kyle, Stan, Terrance and Phillip
               (byte(0x0B8B5C) >= 15 && byte(0x0B8B5D) == 0) || // Barbrady, Cartman Cop, Ned
               (byte(0x0B8B64) >= 15 && byte(0x0B8B65) == 0) )  // Bebe, Big Gay Al, Damien, Grandpa, Jesus, Jimbo, Marvin, Mephesto, 
                                                                // Mr. Garrison, Mr. Mackey, Pip, Satan, Shelly, Tweek, Visitor, Wendy
)

achievement(
    title = "Respect Mah Authoritah!", points = 10,
    description = "Have at least 10 credits", // start at 5
    trigger = current_tokens() >= 10 &&
              current_screen() == screen_in_game && 
              byte(0x086D90) == 0 && prev(byte(0x086D90)) == 1
)

achievement(
    title = "Screw You Guys, I'm Going Home", points = 4,
    description = "Quit the championship after winning a race",
    trigger = once(is_before_race()) && never(current_race() != prev(current_race())) && is_winner() && // win race
              once(word(0xF1334) == 0x03E8) && // race results screen - prevents quitting during race if winning
              current_screen() == screen_menus && prev(current_screen()) == screen_in_game // return to menu
)

achievement(
    title = "And Meet Some Friends of Mine", points = 2,
    description = "Watch the complete theme song",
    trigger = current_screen() == screen_title_song && word(0x086CA6) == 0x41E0
)

