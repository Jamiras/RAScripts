// The Great Waldo Search
// #ID=1723
//
// MD5: 719dcbfec73796ca202277d82b27ed96 (U)

function current_screen() => byte(0x005C)
screen_carpet_flyers = 0
screen_underground_hunters = 1
screen_battling_monks = 2
screen_unfriendly_giants = 3
screen_land_of_waldos = 4
screen_carpet_ride = 5
screen_thq = 6
screen_radiance_software = 7
screen_title = 8
screen_wizard = 9
screen_lvl_victory = 10
screen_loss = 11
screen_waldo_victory = 12
screen_normal_victory = 13
screen_credits = 14
screen_pause = 15

function current_difficulty() => byte(0x0042)
difficulty_normal = 0
difficulty_expert = 1

function is_demo_mode() => bit7(0x0044) == 1
function is_clue_mode() => byte(0x0036) == 1
function is_clue_found() => bit6(0x00BD) == 1 

function is_waldo_found() => bit7(0x0068) == 1
function is_scroll_found() => bit6(0x0068) == 1
function is_woof_found() => bit5(0x0068) == 1
function minigame_tickets() => byte(0x00A0)
function current_clocks() => byte(0x00B7)
function seconds_elapsed() => byte(0x00B9)

function trigger_begin_level() => once(byte(0x0091) == 0) && !is_demo_mode() && unless(current_screen() == screen_pause)
function trigger_complete_level() => is_waldo_found() && is_scroll_found() && current_screen() <= screen_land_of_waldos

// ========================================================

achievement(title = "There's Waldo", points = 10,
            description = "Complete all of the Normal levels",
            trigger = trigger_begin_level() && current_screen() == screen_normal_victory && current_difficulty() == difficulty_normal
)

achievement(title = "Come Out, Come Out, Wherever You Are", points = 20,
            description = "Complete all of the Expert levels",
            trigger = trigger_begin_level() && current_screen() == screen_normal_victory && current_difficulty() == difficulty_expert
)

achievement(title = "Lost His Shoe Again", points = 15,
            description = "Complete all of the levels in the Waldo Challenge",
            trigger = trigger_begin_level() && current_screen() == screen_waldo_victory
)

achievement(title = "Magic Carpet Ride", points = 5,
            description = "Collect all the score markers in the magic carpet mini-game", 
            trigger = trigger_begin_level() && is_woof_found() && minigame_tickets() == 24
)

function trigger_time_limit(seconds) => seconds_elapsed() > 0 &&  // prevents trigger if player loses level
                                        seconds_elapsed() <= seconds && 
                                        never(current_clocks() < prev(current_clocks()))
achievement(title = "Rapid Target", points = 5,
            description = "Find Waldo within the first five seconds",
            trigger = trigger_begin_level() && is_waldo_found() && current_screen() <= screen_land_of_waldos && trigger_time_limit(5)
)

achievement(title = "Eagle Eyes", points = 5,
            description = "Find Waldo and the Scroll within twenty seconds",
            trigger = trigger_begin_level() && trigger_complete_level() && trigger_time_limit(20)
)

achievement(title = "Time to Spare", points = 5,
            description = "Find Waldo and the Scroll with four spare clocks",
            trigger = trigger_begin_level() && trigger_complete_level() && current_clocks() == 4
)

achievement(title = "No Time to Spare", points = 5,
            description = "Find Waldo and the Scroll without collecting any clocks",
            trigger = trigger_begin_level() && trigger_complete_level() && 
                      never(current_clocks() > prev(current_clocks())) && 
                      unless(current_clocks() < prev(current_clocks())) &&
                      unless(current_screen() == screen_carpet_ride)
)

achievement(title = "Treasure Hunter", points = 5,
            description = "Find the thing described by a clue",
            trigger = trigger_begin_level() && current_difficulty() == difficulty_expert &&
                      is_clue_mode() && is_clue_found() && byte(0x009D) > 0
)

function trigger_found_item(index) => bit7(0x0607 + index * 8) == 1
achievement(title = "Gotta Find Them All", points = 5,
            description = "Find five clocks and and five point markers in a level",
            trigger = trigger_begin_level() && never(current_screen() == screen_lvl_victory) && 
                      trigger_found_item(3) && trigger_found_item(4) && trigger_found_item(5) &&
                      trigger_found_item(6) && trigger_found_item(7) &&
                      trigger_found_item(8) && trigger_found_item(9) && trigger_found_item(10) &&
                      trigger_found_item(11) && trigger_found_item(12)
)

achievement(title = "Gotta Find Them All Again", points = 10,
            description = "Find five clocks, five point markers, and both clues in an expert level",
            trigger = trigger_begin_level() && never(current_screen() == screen_lvl_victory) && 
                      current_difficulty() == difficulty_expert &&
                      trigger_found_item(3) && trigger_found_item(4) && trigger_found_item(5) &&
                      trigger_found_item(6) && trigger_found_item(7) &&
                      trigger_found_item(8) && trigger_found_item(9) && trigger_found_item(10) &&
                      trigger_found_item(11) && trigger_found_item(12) &&
                      trigger_found_item(13) && trigger_found_item(14)
)

achievement(title = "Score!", points = 10,
            description = "Score 50,000 points or more",
            trigger = trigger_begin_level() && byte(0x0095) >= 5
)

// ========================================================

difficulties = {
    difficulty_normal: "",
    difficulty_expert: " on Expert",
}

waldo_challenges = {
    5: "1st",
    4: "2nd",
    3: "3rd",
    2: "4th",
    1: "5th"
}

non_challenge_levels = {
    3: "among the Carpet Flyers",
    4: "among the Underground Hunters",
    5: "among the Battling Monks",
    6: "among the Unfriendly Giants",
    7: "in the Land of Waldos",
}

rich_presence_conditional_display(is_demo_mode(), "Watching the demo")

rich_presence_conditional_display(current_screen() >= screen_waldo_victory && current_screen() < screen_pause, "Victorious")

rich_presence_conditional_display(byte(0x0043) >= 1 && byte(0x0043) <= 5, "Looking for Waldo in the {0} Waldo Challenge",
    rich_presence_lookup("Challenge", byte(0x0043), waldo_challenges)
)

rich_presence_conditional_display(current_screen() == screen_pause, "Looking for Waldo {0}{1}",
    rich_presence_lookup("NonChallenge", byte(0x006C), non_challenge_levels),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

rich_presence_conditional_display(current_screen() <= screen_carpet_ride, "Looking for Waldo {0}{1}",
    rich_presence_lookup("NonChallenge", byte(0x006C), non_challenge_levels),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

rich_presence_conditional_display(current_screen() >= screen_wizard, "Selecting a level")

rich_presence_display("In the titles")

leaderboard(
    title = "Waldo Challenge",
    description = "Highest score for completing the Waldo Challenge",
    start = current_screen() == screen_land_of_waldos && byte(0x0043) == 5,
    submit = current_screen() == screen_waldo_victory,
    cancel = current_screen() == screen_loss,
    value = byte(0x0094) * 100000 + byte(0x0095) * 10000 + byte(0x0096) * 1000 + byte(0x0097) * 100 + byte(0x0098) * 10 + byte(0x0099)
)
