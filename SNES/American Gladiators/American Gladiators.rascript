// American Gladiators
// #ID = 382
// MD5: 8cf22b97ac6d18b72526a51be2cfbb5f

// manual: http://replacementdocs.com/download.php?view.9381

// $0000: Screen
function screen() => byte(0x0000)
screen_assault = 0
screen_cannonball = 1
screen_atlasphere = 2
screen_joust = 3
screen_powerball = 4
screen_wall_eliminator = 6
screen_titles = 7
screen_after_event = 8
screen_gladiators_bracket = 9

// $00B2: Round timer (BCD)
function round_timer() => bcd(byte(0x0000B2))

// $0112: 0=One to One
//        1=Tournament
function mode() => byte(0x000112)
mode_one_to_one = 0
mode_tournament = 1

// $011C: Round
function round() => byte(0x00011C)
round_assault = 0
round_human_cannonball = 1
round_atlasphere = 2
round_joust = 3
round_powerball = 4
round_wall = 5
round_eliminator = 6
round_end_of_tournament = 7

events = {
    round_assault: "Assault",
    round_human_cannonball: "Human Cannonball",
    round_atlasphere: "Atlasphere",
    round_joust: "Joust",
    round_powerball: "Powerball",
    round_wall: "The Wall",
    round_eliminator: "The Eliminator"
}

// $0120: 1=Titles
function titles() => byte(0x000120)
function in_game() => titles() == 0

// $0306: P1 score (BCD)
function p1_score() => bcd(byte(0x000306))

// $0428: P2 score (BCD)
function p2_score() => bcd(byte(0x000428))

brackets = {
    0: "",
    1: " (Semi-finals)",
    2: " (Finals)"
}
function wins() => byte(0x0201 + byte(0x0300) * 8)

rich_presence_conditional_display(!in_game(), "Titles")

// byte(0x0300) is the index of the player's information in the table at $0200
// for One-to-one, it will be 0x00. for tournament, it will be 0x00 for female, or 0x10 for male
// anything else is a secondary player, so we're viewing the results of a part of the tournament
// the player didn't participate in.
rich_presence_conditional_display(low4(0x0300) != 0, "Examining tournament results")

// after the eliminator
rich_presence_conditional_display(round() == 7 && screen() == screen_after_event, "Final score{2}: {0}-{1}",
    rich_presence_value("Score", p1_score()),
    rich_presence_value("Score", p2_score()),
    rich_presence_lookup("Bracket", wins(), brackets)
)

// between events
rich_presence_conditional_display(screen() == screen_after_event, "After {0} events{3} | Overall score: {1}-{2}",
    rich_presence_value("Round", round()),
    rich_presence_value("Score", p1_score()),
    rich_presence_value("Score", p2_score()),
    rich_presence_lookup("Bracket", wins(), brackets)
)

// if round is 7, but not on the after event screen (handled above), then we're transitioning
// between player and non-player results. just pretend we're still looking at the bracket.
// alternately, if we're explicitly looking at the bracket, just say so.
rich_presence_conditional_display(screen() == screen_gladiators_bracket || round() == 7, 
    "Examining tournament results")

// actually in an event
rich_presence_display("Round {0}{4}: {1} | Overall score: {2}-{3}",
    rich_presence_value("Round", round() + 1),
    rich_presence_lookup("Event", round(), events),
    rich_presence_value("Score", p1_score()),
    rich_presence_value("Score", p2_score()),
    rich_presence_lookup("Bracket", wins(), brackets)
)

// ====================================

function p1_round_points() => byte(0x0304)
function p2_round_points() => byte(0x0426)

function p1_is_computer() => bit6(0x0200 + byte(0x0300) * 8) == 1
function opponent_is_computer() => bit6(0x0200 + byte(0x0422) * 8) == 1

// ---------------
// Assault
// ---------------
// Run to first station, ABXY to enter third-person mode, R to pick up weapon, dpad+ABXY to fire,
// L to drop weapon, then move out of the station to return to overhead view
// - 10 points for bullseye, 5 for hitting target, 0 for getting hit. +1 for each weapon fired.

function assault_complete() => byte(0x0b5e) == 1 && prev(byte(0x0b5e)) == 0
function assault_points() => byte(0x0b7b)
function assault_message() => byte(0x0c4d)
assault_message_none = 0xFF
assault_message_player_one = 1
assault_message_five_points = 7
assault_message_ten_points = 8

achievement("Target Practice", "Eliminate the gladiator in Assault", 5,
    trigger = round() == round_assault && in_game() &&
              assault_points() > 0 &&
              (assault_message() == assault_message_five_points ||
               assault_message() == assault_message_ten_points)
)

achievement("Longshot", "Eliminate the gladiator in Assault from the first station", 5,
    trigger = round() == round_assault && in_game() &&
              (assault_message() == assault_message_five_points && assault_points() == 6) ||
              (assault_message() == assault_message_ten_points && assault_points() == 11)
)

achievement("Run and Gun", "Complete Assault by leaving through the far exit", 10,
    trigger = round() == round_assault && in_game() &&
              assault_complete() && 
              assault_points() == 5 && // five shots fired, did not hit target
              assault_message() == assault_message_none // complete also set on you're hit message
)

// ---------------
// Human Cannonball
// ---------------
// Aim for about 75% on left meter, and perfectly centered on right. Press ABXY to tuck about halfway through swing
// - 10 points for knocking them off the pedestal

achievement("I'm Gonna Wreck 'Em", "Knock the gladiator off the pedestal in Human Cannonball", 5,
    trigger = round() == round_human_cannonball && in_game() &&
              byte(0x0b4d) == 1 // opponent knocked off pillar
)

// ---------------
// Atlasphere
// ---------------
// Move from pit to pit. Have to get up incline just outside pit, so need running start.
// Cannot score same pit twice in a row.
// - 1 point per pit activated

achievement("Human Hamster Ball", "Complete Atlasphere with more points than your opponent", 5,
    trigger = never(round() != round_atlasphere) && in_game() &&
              once(round_timer() == 60) && // prevent trigger when atlasphere starting
              opponent_is_computer() &&
              round_timer() == 0x00 &&
              p1_round_points() > p2_round_points()
)

achievement("Round and Round and Round Again", "Score at least eight points in Atlasphere", 5,
    trigger = never(round() != round_atlasphere) && in_game() &&
              opponent_is_computer() &&
              once(round_timer() == 60) && // prevent trigger when atlasphere starting
              p1_round_points() >= 8
)

// ---------------
// Joust
// ---------------
// 10 points for knocking gladiator off platform, 5 for surviving until timer expires (can just back up and wait)

function joust_player_hp() => byte(0x0b82)
function joust_opponent_hp() => byte(0x0b8c)

achievement("Nice Knowin' Ya", "Exhaust your opponent in Joust", 5,
    trigger = round() == round_joust && in_game() &&
              opponent_is_computer() &&
              joust_opponent_hp() == 0 &&
              joust_player_hp() > 0 // prevent trigger when joust starting
)

// It's really cheating, but not a cheat code, so it can't be protected against.
// When the match starts, step forward twice and hold any button. Press back and the player
// will perform a spinning attack that won't miss. Continue to hold the button and press back
// to easily defeat the opponent.
achievement("Guard! Turn! Parry! Dodge! Spin! Ha! Thrust", 
            "Exhaust your opponent in Joust while still having at least half the health bar", 10,
    trigger = round() == round_joust && in_game() &&
              opponent_is_computer() &&
              joust_opponent_hp() == 0 &&
              joust_player_hp() >= 30 // bar starts at 62, this gives an extra point or two of generosity
)

// ---------------
// Powerball
// ---------------
// Grab balls (Y) from alternating buckets on top/bottom of screen. Run to bin and deposit with (A).
// Press ABXY near gladiator to push them away.
// 1 point for each deposited ball, 2 points for using the middle bin.

achievement("There and Back Again and Again and Again", "Complete Powerball with more points than your opponent", 5,
    trigger = never(round() != round_powerball) && in_game() &&
              opponent_is_computer() &&
              once(round_timer() == 60) && // prevent trigger when powerball starting
              round_timer() == 0x00 &&
              p1_round_points() > p2_round_points()
)

achievement("Dashing Delivery Deposits", "Score at least eight points in Powerball", 5,
    trigger = never(round() != round_powerball) && in_game() &&
              opponent_is_computer() &&
              once(round_timer() == 60) && // prevent trigger when powerball starting
              p1_round_points() >= 8
)

achievement("When Push Comes to Shove", "Drop at least three balls in the center bin in one match of Powerball", 10,
    trigger = never(round() != round_powerball) && in_game() &&
              opponent_is_computer() &&
              repeated(3, p1_round_points() == prev(p1_round_points()) + 2)
)

// ---------------
// The Wall
// ---------------
// Press A repeatedly to simulate the rhythm of movement. Use dpad to "steer".
// - 10 points for first to top, 5 points for second.

function reach_top_of_wall() => p1_score() > prev(p1_score())

// The Wall: Reach the top (5)
achievement("On Top of the World", "Reach the top of The Wall", 5,
    trigger = round() == round_wall && in_game() &&
              reach_top_of_wall()
)

// The Wall: Reach the top before your opponent (5)
achievement("Hello Down There", "Reach the top of The Wall before your opponent", 5,
    trigger = in_game() &&
              reach_top_of_wall() &&
              disable_when(once(p2_score() > prev(p2_score())), until = round() != round_wall)
)

// ---------------
// The Eliminator
// ---------------
// Alternate L and R to run. Don't get hit by the swinging bags. Press ABXY to jump over hurdles
// When approaching end of level, press ABXY to select which path to take. One has a gladiator to slow you down.
// You get a 10 second penalty for being hit by the swinging bags.
// - 10 points for first, 5 points for second.

function p1_eliminator_time() => bcd(byte(0x03f2))
function p1_completed_eliminator() => byte(0x036c) == 1
function p2_completed_eliminator() => byte(0x048e) == 1
function p1_eliminator_hurdle_knocked_over(index) => byte(0x0410 + index*2) == 1

achievement("If You're Not First, You're Last", "Complete The Eliminator before your opponent", 5,
    trigger = round() == round_eliminator && in_game() &&
              opponent_is_computer() &&
              p1_completed_eliminator() &&
              !p2_completed_eliminator()
)

achievement("You Call Those Obstacles?", 
            "Complete The Eliminator without being hit by a bag or tripping on a hurdle", 5,
    trigger = round() == round_eliminator && in_game() &&
              p1_completed_eliminator() &&
              once(round() != round_eliminator) &&
              // can't do prev(bcd)
              // never(p1_eliminator_time() == prev(p1_eliminator_time()) - 10) && // 10 second penalty for bag
              never(byte(0x03f2) == prev(byte(0x03f2)) - 16) &&
              never(p1_eliminator_hurdle_knocked_over(0)) &&
              never(p1_eliminator_hurdle_knocked_over(1)) &&
              never(p1_eliminator_hurdle_knocked_over(2)) &&
              never(p1_eliminator_hurdle_knocked_over(3))
)

achievement("Second Wind", "Complete The Eliminator with at least 20 seconds remaining", 10,
    trigger = round() == round_eliminator && in_game() &&
              p1_completed_eliminator() &&
              p1_eliminator_time() >= 20 // P1 eliminator timer (BCD)
)

// Gladiator-in-training - have at least 40 points after finishing The Eliminator (10)
// - 10 points for cannonball, 10 for wall first, 10 for eliminator first, 10/5 for joust
//   as many as possible from Assault, Atlasphere and Powerball

achievement("Gladiator-in-Training", "Have at least 40 points after finishing The Eliminator", 10,
    trigger = round() == round_end_of_tournament && in_game() &&
              screen() == screen_after_event &&
              p1_score() >= 40 &&
              opponent_is_computer() &&
              !p1_is_computer()
)

function bracket_scroll_offset() => word(0x01ea)

achievement("Champion Gladiator", "Win a Tournament", 10,
    trigger = round() == round_end_of_tournament && in_game() &&
              screen() == screen_gladiators_bracket && // wins doesn't get incremented until the bracket screen
              bracket_scroll_offset() == 0x200 &&
              wins() == 3
)

leaderboard("Gladiator-in-Training", "Highest score after finishing the Eliminator",
    start = round() == round_end_of_tournament && in_game() &&
            screen() == screen_after_event &&
            opponent_is_computer() && !p1_is_computer(),
    submit = always_true(),
    cancel = always_false(),
    value = p1_score()
)
