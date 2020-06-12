// Remote Control
// #ID=1906
// md5: 2301abaeec1b305f5956e3d7630d943b

//  5 My Favorite Reruns - correctly answer all the questions in a category in a row
//  5 Off the Air - clear out all the questions in four different categories in a round
//  5 Channel Surfer - correctly answer questions from all 9 channels in a round
//  5 Paid Programming - find one of the special channels (beat the bishop, home shopping zone, ranger bob)
//  5 Hit the Road Jack - eliminate an opponent
// 10 Hey Hey-ay, Goodbye - eliminate an opponent with 0 points
//  5 Fifteen Minutes of Fame - win
// 10 Couch Potato - win the game on hard
// 10 Multiple Choice is Easy - win with no wrong answers
// 10 Ready for Prime Time - score 150 points
// 25 Child of the '70s - score 300 points (every question)
// 10 Feel the Thunder - score at least fifty points in the lightning round
// 10 Snack Break - win a game without participating in the lightning round
//  2 I Wanna Answer - push the button at least 10 times before you're allowed
//  3 Buzzer Beater - answer a question just before the timer runs out
// --
// 120

// Beat the Bishop - solve a random math problem before the bishop crosses the screen
// Home Shopping Zone / Ranger Bob - lose 10 points

function channel_category(channel) => byte(0x037a + channel)
category_home_shopping_zone = 0x01
category_ranger_bob = 0x02
category_beat_the_bishop = 0x03
category_all_in_the_family = 0x04
category_beauties_and_assassins = 0x05
category_the_bat_channel = 0x06
category_black_and_white_tv = 0x07
category_the_bob_channel = 0x08
category_beaver_tv = 0x09
category_bald_guys = 0x0a
category_bon_jovi_channel = 0x0b
category_brady_network = 0x0c
category_brady_physics = 0x0d
category_the_bewitched_channel = 0x0e
category_boy_were_they_stupid = 0x0f
category_channel_number_five = 0x10
category_the_cosby_show = 0x11
category_cop_shows = 0x12
category_dr_blister = 0x13
category_the_elvis_channel = 0x14
category_flab_tv = 0x15
category_gilligans_island = 0x16
category_gourmet_channel = 0x17
category_happy_days = 0x18
category_hogans_heroes = 0x19
category_kiddie_tv = 0x1a
category_mash = 0x1b
category_the_movie_channel = 0x1c
category_mary_tyler_moore = 0x1d
category_mtv = 0x1e
category_more_mtv = 0x1f
category_still_more_mtv = 0x20
category_odd_couple = 0x21
category_private_eyes = 0x22
category_phd_tv = 0x23
category_prime_time = 0x24
category_more_prime_time = 0x25
category_still_more_prime_time = 0x26
category_another_prime_time = 0x27
category_prime_prime_time = 0x28
category_reruns = 0x29
category_more_reruns = 0x2a
category_still_more_reruns = 0x2b
category_sctv = 0x2c
category_six_feet_under = 0x2d
category_saturday_night_live = 0x2e
category_the_soaps_channel = 0x2f
category_the_cartoon_channel = 0x30
category_video_high = 0x31
category_whatever_happened_to = 0x32
category_the_wrestling_channel = 0x33


function current_screen() => byte(0x05e7)
screen_announcer = 0x18
screen_contestants = 0x06
screen_question = 0x04
screen_question_leadin = 0x20
screen_character_select = 0x12
screen_titles = 0x60


function is_computer_controlled(player) => bit0(0x0324 + player)
function is_single_player() => is_computer_controlled(1) == 0 && is_computer_controlled(2) == 1

function is_current_score_equal(player, score)
{
    hundreds = score / 100
    tens = (score % 100) / 10
    ones = score % 10
    
    return (byte(0x350 + (player - 1)) == ones &&
            byte(0x353 + (player - 1)) == tens &&
            byte(0x356 + (player - 1)) == hundreds)
}

function current_face(player) => byte(0x03b7 + player)
face_none = 0
face_neutral = 1
face_sad = 2
face_happy = 3

function selected_character(player) => byte(0x0321 + player)
character_freddy = 0 // black hair
character_mike = 1   // blue shirt
character_billy = 2  // green glasses
character_pablo = 3  // gray shirt
character_brenda = 4 // pop hair
character_lauren = 5 // blonde
character_susan = 6  // redhead
character_howie = 7  // glasses

function player_in_control() => byte(0x359) + 1

function trigger_answer_correctly() => current_screen() == screen_question && current_face(1) == face_happy
function trigger_answer_incorrectly() => current_screen() == screen_question && 
                                         byte(0x391) == 1 &&              // face(1) == face_sad when timer runs out too,
                                         current_face(1) == face_sad      // this ensures the player buzzed in

function current_round() => byte(0x0368)
function trigger_round_change() => current_round() != prev(current_round())

function selected_channel() => byte(0x0363)
function channel_started(channel) => byte(0x0359 + channel) > 0     // updates just before selecting next channel
function channel_completed(channel) => byte(0x0359 + channel) == 3  // updates just before selecting next channel
function current_category() => channel_category(selected_channel())


// GOOD
// IMG: happy_howie
function trigger_buzz_in() => byte(0x0000) == 1 && prev(byte(0x0000)) == 0
achievement("I Wanna Answer", "Push the button at least twenty times while the question is being read", 1,
    trigger = never(current_screen() != screen_question_leadin) &&
              repeated(40, bit0(0x0095) != prev(bit0(0x0095))) &&
              unless(byte(0x000a) == 1) // paused
)

// GOOD
// IMG: happy_freddie
achievement("I Know This", "Answer a question without the buzz-in or answer timers counting down", 3,
    trigger = trigger_answer_correctly() && 
              byte(0x0364) == 5 &&  // buzz-in timer
              byte(0x0392) == 4 &&  // answer timer
              current_round() >= 1 && current_round() <= 2
)

// IMG: billy_eliminated
achievement("Hit the Road, Jack", "Eliminate an opponent", 4,
    trigger = current_round() == 2 && // NOTE: current_screen() is screen_character_select (12) only for the exact frame of elimination
              is_single_player() &&
              ((current_face(2) == face_none && prev(current_face(2)) != face_none) ||
               (current_face(3) == face_none && prev(current_face(3)) != face_none))
)

// IMG: elimination_cloud
achievement("Hey Hey-ay, Goodbye", "Eliminate an opponent with 0 points", 10,
    trigger = current_round() == 2 && // NOTE: current_screen() is screen_character_select (12) only for the exact frame of elimination
              is_single_player() &&
              ((current_face(2) == face_none && prev(current_face(2)) != face_none) && is_current_score_equal(2, 0) ||
               (current_face(3) == face_none && prev(current_face(3)) != face_none) && is_current_score_equal(3, 0))
)

function trigger_win_game() => current_screen() == screen_titles && 
                               is_single_player() &&
                               current_face(1) != face_none &&
                               current_face(2) == face_none &&  
                               current_face(3) == face_none

// IMG: host
achievement("Fifteen Minutes of Fame", "Win the game", 5,
    trigger_win_game()
)

// IMG: host_bored
achievement("Snack Break", "Win a game without participating in the lightning round", 10,
    trigger_win_game() && once(current_round() == 2) && 
    (always_true() || // put pause into alt group, which will be paused at trigger, so other alt must be true
        never(low4(0x0095) != 0) &&                 // never press A, B, Select, or Start
        unless(current_round() != 3) &&             // in lightning round
        unless(current_screen() != screen_question) // when choices are visible
    )
)

// IMG: happy_mike
achievement("Multiple Choice is Easy", "Win with no wrong answers", 25,
    trigger = trigger_win_game() && 
              once(byte(0x0328) == 0) && // before player 1 has a name
              never(trigger_answer_incorrectly())
)

// this magic trickery sets a flag in round 1 that is reset any time the player has more points than the other players
// the reset is disabled in rounds 2 and 3, so if the flag was set when entering round 2, it'll still be set when the
// game is over. if the flag is cleared in round 1, it can't be reset in later rounds, so it won't trigger when the game
// is over. it can still be reset in round 1 before the end of the round.
function not_more_points_than_player(player) =>
    (never(byte(0x356) > byte(0x356 + player - 1)) && // hundreds
     unless(current_round() > 1)) ||
    (never(byte(0x356) == byte(0x356 + player - 1) && byte(0x353) > byte(0x353 + player - 1)) && // tens
     unless(current_round() > 1)) ||
    (never(byte(0x356) == byte(0x356 + player - 1) && byte(0x353) == byte(0x353 + player - 1) && // ones
     byte(0x350) > byte(0x350 + player - 1)) && unless(current_round() > 1))

// IMG: happy_lauren
achievement("Comeback Kid", "Win after starting the second round in last place", 10,
    trigger = trigger_win_game() && 
             (once(current_round() == 1) || // this is the trigger flag - must be true at end of game
              not_more_points_than_player(2) ||
              not_more_points_than_player(3)
             )
)

// IMG: happy_brenda
achievement("Feel the Thunder", "Score at least fifty points in the lightning round", 5,
    trigger = current_screen() == screen_contestants &&    // wait until round over before obscuring screen
              is_single_player() &&
              never(current_round() != 3) &&               // lightning round
              repeated(5, byte(0x353) > prev(byte(0x353))) // five answers, 10 points each
    
)

// GOOD
// IMG: 150
achievement("Ready for Prime Time", "Score at least 150 points", 10,
    current_screen() == screen_contestants && 
       (byte(0x356) > 1 ||
        (byte(0x356) == 1 && byte(0x353) >= 5))    
)

// IMG: 300
achievement("Child of the '70s", "Score at least 300 points", 25,
    current_screen() == screen_contestants && byte(0x356) >= 3
)

// IMG: shopping_network
achievement("Paid Programming", "Find one of the special channels", 2,
    trigger = current_screen() == screen_contestants &&
              player_in_control() == 1 &&
              once(current_screen() == screen_question) &&
              never(current_category() != category_beat_the_bishop &&
                    current_category() != category_home_shopping_zone &&
                    current_category() != category_ranger_bob)
)

// GOOD
// IMG: more_reruns
function channel_sweep(channel) => repeated(3, trigger_answer_correctly() && prev(current_face(1)) == face_neutral) && 
                                   unless(selected_channel() != channel - 1)
achievement("My Favorite Reruns", "Correctly answer all the questions in a category", 5,
    trigger = current_screen() == screen_contestants && 
              never(trigger_round_change()) &&
              (channel_sweep(1) || channel_sweep(2) || channel_sweep(3) || 
               channel_sweep(4) || channel_sweep(5) || channel_sweep(6) || 
               channel_sweep(7) || channel_sweep(8) || channel_sweep(9))
)


// GOOD
// IMG: half_channels
achievement("Off the Air", "Clear out all the questions in four channels in a single round", 5,
    current_screen() == screen_contestants && 
    never(trigger_round_change()) &&
    tally(4, once(channel_completed(1)), once(channel_completed(2)), once(channel_completed(3)),
             once(channel_completed(4)), once(channel_completed(5)), once(channel_completed(6)),
             once(channel_completed(7)), once(channel_completed(8)), once(channel_completed(9)))
)

// GOOD
// IMG: all_channels
function channel_surfer(channel) => once(selected_channel() == channel - 1 && trigger_answer_correctly())
achievement("Channel Surfer", "Correctly answer questions from all nine channels in a single round", 10,
    trigger = never(trigger_round_change()) && 
              channel_surfer(1) && channel_surfer(2) && channel_surfer(3) &&
              channel_surfer(4) && channel_surfer(5) && channel_surfer(6) &&
              channel_surfer(7) && channel_surfer(8) && channel_surfer(9)
)

rounds = {
    0: "Round 1",   // after selecting players, but before the first question
    1: "Round 1",
    2: "Round 2",
    3: "Lightning Round"
}

function current_score() => byte(0x0356) * 100 + byte(0x0353) * 10 + byte(0x0350)

rich_presence_conditional_display(current_screen() == screen_titles || current_screen() == screen_character_select, "Not playing")

rich_presence_conditional_display(is_computer_controlled(2) == 0, "{0}, Competing with a friend",
    rich_presence_lookup("round", current_round(), rounds)
)

rich_presence_display("{0}, {1} points",
    rich_presence_lookup("round", current_round(), rounds),
    rich_presence_value("score", current_score())
)
