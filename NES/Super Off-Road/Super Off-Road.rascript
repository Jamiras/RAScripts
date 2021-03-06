// Ivan "Ironman" Stewart's Super Off-Road
// #ID = 1757

// ============================================================================
// == Achievements
// ==

track_sidewinder = 0
track_huevos_grande = 1
track_big_dukes = 2
track_hurricane_gulch = 3
track_wipeout = 4
track_fandango = 5
track_blaster = 6
track_cliffhanger = 7

track_names = {
    track_sidewinder: "Sidewinder",
    track_huevos_grande: "Huevos Grande",
    track_big_dukes: "Big Dukes",
    track_hurricane_gulch: "Hurricane Gulch",
    track_wipeout: "Wipeout",
    track_fandango: "Fandango",
    track_blaster: "Blaster",
    track_cliffhanger: "Cliffhanger",
}

function current_race() => byte(0x0007AF)
function current_track() => byte(0x000723)
function player_lap(index) => byte(0x00033F + index * 71)

// not really sure what 0x0000C3 is, but it changes to 0 before the current track is updated and stays
// that way until the next race starts. it's a quick and dirty way to ensure the player is in the race when
// triggering win conditions off the current race since the winner isn't cleared when returning to the shop,
// which is where the current track is updated.
function is_in_race() => byte(0x0000C3) != 0

// this ensures the race timer is not 00:00
function is_race_started() => dword(0x000737) > 0

// this trigger ensures the rest of the achievement's conditions must be met within a single race.
// * the once(!is_race_started()) ensures the achievement can't be reset within the race
// * the is_race_started() ensures the achievement can't be met before the race starts
// * the never(!is_in_race()) ensures the achievement can't be met between races
function trigger_within_race() => once(!is_race_started()) && is_race_started() && never(!is_in_race())

// (flag == 8) = computer controlled
function player_flag(index) => byte(0x00030D + index * 71)
function number_of_players() => byte(0x00072D)
function is_single_player() => number_of_players() == 1

function trigger_win_any_race() => is_single_player() && is_in_race() && is_race_started() && player_lap(0) == 5

function achievement_race_time(track, title, seconds, points) {
    timer_tens = byte(0x000737)
    timer_ones = byte(0x000738)
    tens = seconds / 10
    ones = seconds - (tens * 10)

    achievement(
        title = track_names[track] + " " + title,
        description = "Win a race at " + track_names[track] + " in under " + seconds + " seconds",
        points = points,
        trigger = trigger_win_any_race() && (
           (timer_tens < tens && current_track() == track) || 
           (timer_tens < tens && current_track() == track + 8) || 
           (timer_tens == tens && timer_ones < ones && current_track() == track) ||
           (timer_tens == tens && timer_ones < ones && current_track() == track + 8)
        )
    )
}

// quick saves: F3 - Race 15 (Fandango), Race 16 (Sidewinder)
//              F4 - Race 21 (Fandango-R), Race 22 (Sidewinder-R)
//              F5 - Race 23 (Wipeout), Race 24 (Big Dukes-R)
//              F6 - Race 30 (Wipeout-R), Race 31 (Big Dukes)
//              F7 - Race 25 (Blaster-R), Race 26 (Cliffhanger-R)
//              F8 - Race 32 (Blaster), Race 33 (Cliffhanger)
//              F9 - Race 34 (Huevos Grande-R), Race 35 (Hurricane Gulch)
//              F0 - Race 42 (Huevos Grande), Race 43 (Hurricane Gulch-R)

//   00 01 02 03 04 05 06 07 08 09 
// 0    F+ S~ F+ S- W^ F+ S- W+ D- > 2 - win race 4, 5 or 7
// 1 F+ S- W+ D^ B- F+ S- W+ D^ B- > 0 - any extra win 14 or higher will carry all the way
// 2:C+ F+ S^ W* D- B- C+ H+ F+ S- > 2
// 3 W+ D- B- C+ H+ G- F+ S- W+ D- > 2
// 4 B- C+ H+ G- F+ S- W+ D- B- C+ > 2
// 5 H+ G- F+ S- W+ D- B-

// race times (7 tracks x20 = 140 + 1 track x40 = 180pts)
achievement_race_time(track_fandango,        "Challenger", 55,  5) // <  1, 6,15,28,44,60,76,92
achievement_race_time(track_fandango,        "Pro",        50, 10) // >  3,10,21,36,52,68,84
achievement_race_time(track_sidewinder,      "Challenger", 46,  5) // <  2, 7,16,29,37,45,61,77,93
achievement_race_time(track_sidewinder,      "Pro",        41, 10) // >  4,11,22,53,69,85
achievement_race_time(track_wipeout,         "Challenger", 46,  5) // >  5,12,23,38,54,70,86
achievement_race_time(track_wipeout,         "Pro",        41, 10) // <  8,17,30,46,62,78,94
achievement_race_time(track_big_dukes,       "Challenger", 45,  5) // <  9,18,31,63,79,95
achievement_race_time(track_big_dukes,       "Pro",        40, 10) // > 13,24,39,47,55,71,87
achievement_race_time(track_blaster,         "Challenger", 52,  5) // > 14,32,56,72,88
achievement_race_time(track_blaster,         "Pro",        47, 10) // < 19,25,40,48,64,80,96
achievement_race_time(track_cliffhanger,     "Challenger", 46,  5) // < 20,33,49,65,81,97
achievement_race_time(track_cliffhanger,     "Pro",        41, 10) // > 26,41,57,73,89
achievement_race_time(track_huevos_grande,   "Challenger", 49,  5) // > 27,42,58,74,90
achievement_race_time(track_huevos_grande,   "Pro",        44, 10) // < 34,50,66,82,98
achievement_race_time(track_hurricane_gulch, "Challenger", 48,  5) // < 35,51,67,83,99
achievement_race_time(track_hurricane_gulch, "Pro",        43, 10) // > 43,59,75,91

// reach races (45pts) [225]
function trigger_complete_race(race) {
    return is_single_player() && is_in_race() && is_race_started() && current_race() == race &&
           (player_lap(0) == 5 || player_lap(1) == 5 || player_lap(2) == 5 || player_lap(3) == 5)
}

achievement(
    title = "Tournament",
    description = "Complete the qualifiers and start the tournament",
    points = 5,
    trigger = is_single_player() && is_in_race() && is_race_started() && current_race() == 15
)

achievement(
    title = "Veteran Racer",
    description = "Complete the fiftieth race",
    points = 25,
    trigger = trigger_complete_race(50)
)

achievement(
    title = "Checkered Flag",
    description = "Complete the last race",
    points = 25,
    trigger = trigger_complete_race(99)
)

// win X races in a row (35pts) [260]
function winning_player() => byte(0x00005A)

function achievement_repeat_winner(title, times, points) {
    achievement(
        title = title,
        description = "Win " + times + " races in a row",
        points = points,
        trigger = trigger_win_any_race() && repeated(times, current_race() > prev(current_race())) && 
                  never(player_lap(1) == 5) && never(player_lap(2) == 5) && never(player_lap(3) == 5)
    )
}

achievement_repeat_winner("Hat Trick", 3, 5)
achievement_repeat_winner("Champion Driver", 4, 5)
achievement_repeat_winner("World Class Driver", 5, 10)

// special win conditions (70pts) [330]

achievement(
    title = "Coming Through!",
    description = "Win a race being a lap ahead of another racer",
    points = 5,
    trigger = trigger_win_any_race() && (player_lap(1) < 4 || player_lap(2) < 4 || player_lap(3) < 4)
)

achievement(
    title = "Eat My Dust",
    description = "Win a race being a lap ahead of all other racers",
    points = 10,
    trigger = trigger_win_any_race() && player_lap(1) < 4 && player_lap(2) < 4 && player_lap(3) < 4
)

achievement(
    title = "Comeback",
    description = "Win after starting the last lap in last place",
    points = 10,
    
    // the once() clause ensures the achievement only becomes active while the player is on their third lap.
    // the never() clauses disable the achievement if any of the competitors are not on their last lap.
    trigger = trigger_win_any_race() && once(player_lap(0) == 3) && 
              never(player_lap(1) < 4) && never(player_lap(2) < 4) && never(player_lap(3) < 4) 
)

function player_nitros(index) => byte(0x000310 + index * 71)
function nitro_used() => player_nitros(0) < prev(player_nitros(0))

achievement(
    title = "Turbo Blaster",
    description = "Use at least 20 nitros in a single race and win",
    points = 5,
    trigger = trigger_win_any_race() && trigger_within_race() && repeated(20, nitro_used())
)

achievement(
    title = "No Rush",
    description = "Win a race without using any nitros",
    points = 5,
    trigger = trigger_win_any_race() && trigger_within_race() && never(nitro_used())
)

// upgrades (30) [360]
function truck_shocks() => byte(0x00030E)
function truck_tires() => byte(0x00030F)
function truck_acceleration() => byte(0x000311)
function truck_top_speed() => byte(0x000312)

achievement(
    title = "Tricked Out",
    description = "Fully upgrade your truck",
    points = 5,
    trigger = is_single_player() && truck_shocks() == 6 && truck_tires() == 6 && truck_acceleration() == 6 && truck_top_speed() == 6
)

achievement(
    // 0x0007E8 is the lower 8 bits of the player's score, which resets to 0 if they continue.
    // the upper bits are at 0x0007E4, so we can't make sure both are 0 in the reset trigger.
    // there's a small chance that someone who gets exactly 2560 points will disable this achievemet,
    // but in my testing of this achievement, I barely had 2000 points when reaching race 15.

    title = "All the Original Parts",
    description = "Enter the tournament without upgrading your truck or continuing",
    points = 25,
    trigger = is_single_player() && is_in_race() && never(byte(0x0007E8) == 0) &&
              once(current_race() == 1) && current_race() == 15 && 
              truck_shocks() == 0 && truck_tires() == 0 && truck_acceleration() == 0 && truck_top_speed() == 0
)

// money (40) [400]
function collected_money() => byte(0x00033C)

achievement(
    title = "Spare Change",
    description = "Collect at least $100,000 from money bags in one race",
    points = 5,
    trigger = is_single_player() && trigger_within_race() && collected_money() >= 10
)

function cash_millions() => byte(0x000306)
function cash_ten_millions() => byte(0x000305)

achievement(
    title = "Millionaire",
    description = "Have $1M in cash",
    points = 10,
    trigger = is_single_player() && (cash_ten_millions() > 0 || cash_millions() > 0)
)

achievement(
    title = "Multi-millionaire",
    description = "Have $5M in cash",
    points = 25,
    trigger = is_single_player() && (cash_ten_millions() > 0 || cash_millions() >= 5)
)

// ============================================================================
// == Rich Presence
// ==

// is_in_race() checks the entire byte, which would make the lookups unwieldy. the value almost always
// starts with D (i.e. 0xD#), so just do a quick check against the uppermost bit.
function is_in_race_fuzzy() => bit7(0x0000C3)

// prefixes[b0] = in race?, prefixes[b1-b3] = number of players (0 = demo)
prefixes = { 0: "Demo", 1: "Demo", 2: "After", 3: "In", 4: "After", 5: "In", 6: "After", 7: "In", 8: "After", 9: "In" }

// display "at Shop" when not in a race or "Unknown" when at continue screen,
// - b0-b2 = current_race
// - b4 = is_in_race_fuzzy
// - b5 = byte(0x000722) == 0x10 || byte(0x000722) == 0xE0 # 0x10 = in race/in shop, 0xE0 = race indicator screen
track_names_ex = {}
for key in track_names {
    track_names_ex[key + 32] = "Shop"
    track_names_ex[key + 32 + 8] = "Shop"
    track_names_ex[key + 32 + 16] = track_names[key]
    track_names_ex[key + 32 + 16 + 8] = track_names[key]
}

rich_presence_display("{0} Race {1} at {2}",
    rich_presence_lookup("Prefix", is_in_race_fuzzy() + number_of_players() * 2, prefixes),
    rich_presence_value("Race", current_race()),
    rich_presence_lookup("TrackName", current_track() + (is_in_race_fuzzy() * 16) + 
                                      (bit4(0x000722) * 32) + (bit7(0x000722) * 32), track_names_ex)
)

// ============================================================================
// == Leaderboards
// ==

function current_track_bits(track) {
    bit_2 = track / 4
    track = track - bit_2 * 4
    bit_1 = track / 2
    bit_0 = track - bit_1 * 2
    
    return bit2(0x000723) == bit_2 && bit1(0x000723) == bit_1 && bit0(0x000723) == bit_0
}

function remaining_trucks() => byte(0x00075D)

function leaderboard_track_time(track) {
    leaderboard(
        title = track_names[track], description = "Fastest time winning at " + track_names[track],
        start = is_single_player() && is_in_race() && current_track_bits(track) && byte(0x00073D) == 0,
        cancel = byte(0x00073C) == 110,
        submit = player_lap(0) == 5,
        value = byte(0x000737) * 1000 + byte(0x000738) * 100 + byte(0x000739) * 10 + byte(0x00073A)
    )
}

leaderboard_track_time(track_fandango)
leaderboard_track_time(track_sidewinder)
leaderboard_track_time(track_wipeout)
leaderboard_track_time(track_big_dukes)
leaderboard_track_time(track_blaster)
leaderboard_track_time(track_cliffhanger)
leaderboard_track_time(track_huevos_grande)
leaderboard_track_time(track_hurricane_gulch)
