// Magic Darts
// #ID=1816
// MD5: ae5a1d9c887ec6c9dcd9225d11bb7dbd (U legacy)
// MD5: d969b9784155ba24919dbf21568db82e (U)
// MD5: 574317026787ed57fc8f7ad470c7e3e7 (J)

// https://youtu.be/VC3VdEiyu_E?t=87
// A cast of whimsical characters come together to play one of six different dart games.

// === 301/501/701 (50) ===
// 10 Win a game of 701 against at least one CPU
//  5 Complete a game of 301/501/701 on Double In, Double Out
// 10 Complete a game of 301 in 4 rounds or less
// 10 Complete a game of 301 on Double In, Double Out in 6 rounds or less
// 15 Complete a game of 701 in 9 rounds or less

// === Count Up: 8 rounds, 3 darts (60) ===
//  5 Get 500 points as any character in Count Up (without using the Alien's special power)
// 10 Get 600 points as any character in Count Up (without using the Alien's special power)
// 20 Get 700 points as any character in Count Up (without using the Alien's special power)
//  5 Get 500 points as any character using light darts in Count Up (without using the Alien's special power)
//  5 Get 500 points as any character using heavy darts in Count Up (without using the Alien's special power)
// 15 Win a game of Count Up against three CPUs

// === Round the Clock: Hit 1-10 in order (10) ===
// 10 Win a game of Round the Clock against at least one CPU
// 10 Win a game of Round the Clock using less than 20 darts

// === Half It (20) ===
// 10 Win a game of Half It against at least one CPU
// 10 Score at least 300 points in Half It

// === Any (55) ===
//  5 Get a bullseye
//  5 Get a triple 20
// 10 Score at least 100 points in a single round
// 10 Land all three darts in the center ring or bullseye in a single round
// 10 Hit a dart with another dart
// 15 Shanghai - double, triple, and single of same number in a single round

// === Trick Shots (30) ===
//  5 Robot Arm: Center vertically, horizontally, half power - 30% chance
//  5 Reverse Monkey: hold B while throwing, next throw will be over the shoulder
//  5 Macho Shake: 30% chance when throwing with max power
//  5 Alien Aim: hold A+B to freeze the dart in midair, then aim with D+Pad
// 10 Strange Alien: Hit the fly using the alien power [character changes from 15 to 5 - prevent unlock via password]

// === Easter Egg ===
// Press and hold the A & B buttons at the title screen, and press Start to enter the "Select your game" menu. 
// Now, while still holding A & B, press and hold Select for almost a minute until the secret message appears. "By K1 Nakanishi"

// first place $38 = 1-based index of player - i.e. if player 1 took first, $38 would be 1. if player 3 took first, $38 would be 3.
function winner_index(place) => byte(0x0038 + 8 * place)

function player_character(index) => byte(0x0060 + index * 16)
character_none = 0
character_tom = 1
character_bob = 2
character_ann = 3
character_sue = 4
character_joe = 8 // expert male
character_max = 9 // macho man
character_lee = 10 // kung fu
character_rom = 11 // robot
character_liz = 12 // expert female
character_ken = 13 // ninja
character_rio = 14 // monkey
character_ebe = 15 // alien
character_ebe2 = 5 // alien alternate face [enter EBE or SEX as player name]
// 6 and 7 are glitches, 16+ break the game

function player_dart_weight(index) => byte(0x0067 + index * 16)
weight_light = 1
weight_medium = 2
weight_heavy = 3

function player_is_cpu(index) => player_character(index) != character_none && byte(0x006E + index * 16) == 0
function player_is_player(index) => player_character(index) != character_none && byte(0x006E + index * 16) == 1
function player_vs_cpu() => player_is_player(0) && player_is_cpu(1)

function reverse_monkey(index) => player_character(index) == character_rio && byte(0x0068) == 0x10

function current_screen() => byte(0x044B)
screen_title = 1
screen_select_game = 2
screen_open_or_double = 3
screen_num_players = 4
screen_player_character = 5
screen_add_computers = 6
screen_computer_players = 7
screen_dartboard = 8
screen_winner = 9

function game_variant() => byte(0x04B0)
variant_301 = 1
variant_501 = 2
variant_701 = 3
variant_countup = 4
variant_roundtheclock = 5
variant_halfit = 6

function mode_inout() => byte(0x04B4)
mode_openin_openout = 1
mode_openin_doubleout = 2
mode_doublein_doubleout = 3

function throwing_phase() => byte(0x04CA)
phase_player_intro = 2
phase_left_right = 3
phase_angle = 4
phase_power = 5
phase_throw = 6
phase_in_flight = 7
phase_hit_board = 8
phase_scoring = 9

function current_player() => byte(0x04CF) // 1-based
function current_player_is_player() => current_player() == 1 && player_is_player(0)

function current_dart_within_round() => byte(0x04D6)
function current_round() => byte(0x04D7) // 1-based

// 0x04DC is 0 for normal throws, 1 when a special ability is active, and 2 after.
// alien aim is 1=>2
// max shake is 1=>1
// robot arm is 0=>1
function trigger_trick_shot(character) => byte(0x04DC) == 1 && current_player_is_player() &&
                                          player_character(0) == character
function using_alien_aim() => byte(0x04DC) == 2

// NOTE: player_score is BIG endian, since we're only checking for "0" and change, we don't need to care
function player_score(index) => word(0x04F4 + index * 2)

function current_player_round_score() => word(0x0661)
function current_player_last_score() => byte(0x0501)

// bullseye registers as 50x2, but only scores 50. others are as expected
function last_number_hit() => byte(0x060E)
function last_multiplier() => byte(0x060F)

function trigger_game_start() => word(0x04D6) == 0x0100 // round 1, 0 darts thrown
function never_using_alien_aim() => once(trigger_game_start()) &&
                                    (always_true() || (always_false() &&
                                    never(using_alien_aim()) &&
                                    unless(current_player() != 1)))
                               
// alternate form of never_using_alien_aim that requires AndNext     
function never_using_alien_aim2() => once(word(0x04D6) == 0x0100) && // round 1, 0 darts thrown
                                     never(current_player() == 1 && using_alien_aim())
                                    
function trigger_game_complete() => current_screen() == screen_winner && byte(0x044C) == 1
function trigger_win() => trigger_game_complete() && winner_index(0) == 1 && player_is_player(0)

// ==============================

characters = {
    character_tom: "Tom",
    character_bob: "Bob",
    character_ann: "Ann",
    character_sue: "Sue",
    character_joe: "Joe",
    character_max: "Max",
    character_lee: "Lee",
    character_rom: "Rom",
    character_liz: "Liz",
    character_ken: "Ken",
    character_rio: "Rio",
    character_ebe: "Ebe",
    character_ebe2: "Ebe",
}

variants = {
    variant_301: "301",
    variant_501: "501",
    variant_701: "701",
    variant_countup: "Count Up",
    variant_roundtheclock: "Round the Clock",
    variant_halfit: "Half It",
}

rich_presence_conditional_display(current_screen() != screen_dartboard, "Not in a game")

rich_presence_conditional_display(player_character(3) != character_none, "{0} is playing {1} with {2}, {3}, and {4}",
    rich_presence_lookup("Character", player_character(0), characters),
    rich_presence_lookup("Variant", game_variant(), variants),
    rich_presence_lookup("Character", player_character(1), characters),
    rich_presence_lookup("Character", player_character(2), characters),
    rich_presence_lookup("Character", player_character(3), characters)
)

rich_presence_conditional_display(player_character(2) != character_none, "{0} is playing {1} with {2} and {3}",
    rich_presence_lookup("Character", player_character(0), characters),
    rich_presence_lookup("Variant", game_variant(), variants),
    rich_presence_lookup("Character", player_character(1), characters),
    rich_presence_lookup("Character", player_character(2), characters)
)

rich_presence_conditional_display(player_character(1) != character_none, "{0} is playing {1} with {2}",
    rich_presence_lookup("Character", player_character(0), characters),
    rich_presence_lookup("Variant", game_variant(), variants),
    rich_presence_lookup("Character", player_character(1), characters)
)

rich_presence_display("{0} is playing {1}",
    rich_presence_lookup("Character", player_character(0), characters),
    rich_presence_lookup("Variant", game_variant(), variants)
)

// ==============================

achievement(
    title = "Light to 500",
    description = "Get at least 500 points in Count Up using light darts",
    points = 5,
    trigger = game_variant() == variant_countup &&
              player_is_player(0) && current_player() == 1 && byte(0x04F2) >= 5 && 
              throwing_phase() == phase_hit_board && 
              player_dart_weight(0) == weight_light &&
              never_using_alien_aim()
)

achievement(
    title = "Heavy to 500",
    description = "Get at least 500 points in Count Up using heavy darts",
    points = 5,
    trigger = game_variant() == variant_countup &&
              player_is_player(0) && current_player() == 1 && byte(0x04F2) >= 5 &&
              throwing_phase() == phase_hit_board && 
              player_dart_weight(0) == weight_heavy &&
              never_using_alien_aim()
)

achievement(
    title = "Counted to 500",
    description = "Get at least 500 points in Count Up",
    points = 5,
    trigger = game_variant() == variant_countup &&
              player_is_player(0) && current_player() == 1 && byte(0x04F2) >= 5 &&
              throwing_phase() == phase_hit_board && 
              never_using_alien_aim()
)

achievement(
    title = "Counted to 600",
    description = "Get at least 600 points in Count Up",
    points = 10,
    trigger = game_variant() == variant_countup &&
              player_is_player(0) && current_player() == 1 && byte(0x04F2) >= 6 &&
              throwing_phase() == phase_hit_board && 
              never_using_alien_aim()
)

// expert M and expert F seems to have the most control - center horizontal, 80% vertical, all but 2 or 3 power
// hits T20 about 30% of the time
achievement(
    title = "Counted to 700",
    description = "Get at least 700 points in Count Up",
    points = 25,
    trigger = game_variant() == variant_countup &&
              player_is_player(0) && current_player() == 1 && byte(0x04F2) >= 7 &&
              throwing_phase() == phase_hit_board && 
              never_using_alien_aim()
)

// monkey is a strong opponent, ninja is a weak opponent - it's usually easy to win against three ninjas
achievement(
    title = "Count Up vs",
    description = "Win a game of Count Up against three CPUs",
    points = 25,
    trigger = game_variant() == variant_countup &&
              trigger_win() && never_using_alien_aim() &&
              player_is_player(0) && player_is_cpu(1) && player_is_cpu(2) && player_is_cpu(3)
)

achievement(
    title = "Double In, Double Out",
    description = "Win a game of 301/501/701 on Double In, Double Out",
    points = 10,
    trigger = mode_inout() == mode_doublein_doubleout && 
              trigger_win() && never_using_alien_aim() &&
              (game_variant() == variant_301 || game_variant() == variant_501 || game_variant() == variant_701)
)

achievement(
    title = "Rapid 301",
    description = "Win a game of 301 in four rounds or less",
    points = 10,
    trigger = game_variant() == variant_301 && 
              trigger_win() && never_using_alien_aim() && 
              current_round() <= 4
)

achievement(
    title = "Rapid 301 Double In, Double Out",
    description = "Win a game of 301 on Double In, Double Out in six rounds or less",
    points = 25,
    trigger = game_variant() == variant_301 && mode_inout() == mode_doublein_doubleout && 
              trigger_win() && never_using_alien_aim() && 
              current_round() <= 6
)

achievement(
    title = "Rapid 701",
    description = "Win a game of 701 in eleven rounds or less",
    points = 25,
    trigger = game_variant() == variant_701 && 
              trigger_win() && never_using_alien_aim() && 
              current_round() <= 11
)

achievement(
    title = "701 vs", 
    description = "Win a game of 701 against at least one CPU",
    points = 10,
    trigger = game_variant() == variant_701 && player_vs_cpu() && 
              trigger_win() && never_using_alien_aim()
)

achievement(
    title = "Time is Fleeting",
    description = "Win a game of Round the Clock using less than 20 darts",
    points = 25,
    trigger = game_variant() == variant_roundtheclock && 
              trigger_win() && never_using_alien_aim() &&
              current_round() < 8 // 21 darts to reach round 8
)

achievement(
    title = "Round the Clock vs",
    description = "Win a game of Round the Clock against at least one CPU",
    points = 25,
    trigger = game_variant() == variant_roundtheclock && player_vs_cpu() && 
              trigger_win() && never_using_alien_aim()              
)

achievement(
    title = "Strong Finish",
    description = "Finish a game of Half It with at least 300 points",
    points = 25,
    trigger = game_variant() == variant_halfit &&
              player_is_player(0) && trigger_game_complete() && never_using_alien_aim() &&
              (byte(0x04F4) > 1 || (byte(0x04F4) == 1 && byte(0x04F5) >= 44)) // score
)

achievement(
    title = "Half It vs",
    description = "Win a game of Half It against at least one CPU",
    points = 10,
    trigger = game_variant() == variant_halfit && player_vs_cpu() &&
              trigger_win() && never_using_alien_aim()
               
)

achievement(
    title = "T20",
    description = "Hit the treble 20",
    points = 3,
    trigger = current_player_is_player() && throwing_phase() == phase_scoring &&
              current_player_last_score() == 60 && never_using_alien_aim()
)

achievement(
    title = "Bullseye",
    description = "Hit the bullseye",
    points = 4,
    trigger = current_player_is_player() && throwing_phase() == phase_scoring &&
              current_player_last_score() == 50 && never_using_alien_aim()
)

achievement(
    title = "Hat Trick",
    description = "Land all three darts in one round in the inner ring or bullseye",
    points = 10,
    trigger = current_player_is_player() && 
              repeated(3, current_player_last_score() == 25 || current_player_last_score() == 50) &&
              unless(player_score(0) == prev(player_score(0))) && // only check when the score updates
              never(using_alien_aim()) &&                         // put resets in alt groups so they aren't paused
              (never(current_player() != 1) ||                    // reset counter if its not the player's turn
               never(current_round() != prev(current_round())))   // reset counter between rounds
)

trigger_shanghai = always_false()
for i in range(1, 20)
    trigger_shanghai = trigger_shanghai || (once(last_multiplier() == 1) && once(last_multiplier() == 2) && 
                                            once(last_multiplier() == 3) && unless(last_number_hit() != i) &&
                                            unless(throwing_phase() != phase_scoring))

achievement(
    title = "Shanghai",
    description = "Hit a single, double, and triple of the same number in one round",
    points = 10,
    trigger = current_player_is_player() && never(using_alien_aim()) &&
              never(current_dart_within_round() == 0) &&
              never(current_round() != prev(current_round())) &&  // reset counter between rounds
              trigger_shanghai
)

achievement(
    title = "A Ton or More",
    description = "Score at least 100 points in a single round of Count Up",
    points = 10,
    trigger = game_variant() == variant_countup &&
              current_player_is_player() && 
              throwing_phase() == phase_hit_board &&
              current_player_round_score() >= 100 &&
              current_dart_within_round() > 0 &&
              never_using_alien_aim()
)

function dart_x(index) => byte(0x0639 + index * 2)
function dart_y(index) => byte(0x0638 + index * 2)

function within_one_pixel(index1, index2)
{
    return current_dart_within_round() == index2 + 1 &&
           (dart_x(index1) + 1 - dart_x(index2) <= 2) &&
           (dart_y(index1) + 1 - dart_y(index2) <= 2)
}

achievement(
    title = "Split the Arrow in Twain",
    description = "Hit a dart with another dart",
    points = 10,
    trigger = current_player_is_player() && throwing_phase() == phase_hit_board && never_using_alien_aim() &&
              (within_one_pixel(0, 1) || within_one_pixel(0, 2) || within_one_pixel(1, 2))
)

achievement(
    title = "Fully Extended",
    description = "Use the robot's trick shot",
    points = 2,
    trigger = trigger_trick_shot(character_rom)
)

achievement(
    title = "Reverse Monkey",
    description = "Use the monkey's trick shot",
    points = 2,
    trigger = byte(0x0068) == 16 && throwing_phase() == phase_in_flight &&
              current_player_is_player() && player_character(0) == character_rio
)

achievement(
    title = "Macho Shake",
    description = "Use the strong man's trick shot",
    points = 2,
    trigger = trigger_trick_shot(character_max)
)

achievement(
    title = "Telekinesis",
    description = "Use the alien's trick shot",
    points = 2,
    trigger = trigger_trick_shot(character_ebe) || trigger_trick_shot(character_ebe2)
)

achievement(
    title = "They Walk Among Us",
    description = "Hit a fly with the alien's trick shot",
    points = 5,
    trigger = once(player_character(0) == character_ebe) &&  // along with next line, requires
              never(player_score(0) == 0) &&                 // ensure player has earned points as normal alien
              once(player_character(0) == character_ebe2) &&
              never(current_screen() != screen_dartboard)
)

leaderboard(
    title = "Count Up",
    description = "Highest score in Count Up",
    start = game_variant() == variant_countup && current_screen() == screen_dartboard &&
            player_is_player(0) && trigger_game_start(),
    cancel = always_true() && (current_screen() < screen_dartboard || using_alien_aim()),
    submit = current_screen() == screen_winner,
    value = byte(0x04F4) * 256 + byte(0x04F5)
)

leaderboard(
    title = "Half It",
    description = "Highest score in Half It",
    start = game_variant() == variant_halfit && current_screen() == screen_dartboard &&
            player_is_player(0) && trigger_game_start(),
    cancel = always_true() && (current_screen() < screen_dartboard || using_alien_aim()),
    submit = current_screen() == screen_winner,
    value = byte(0x04F4) * 256 + byte(0x04F5)
)

