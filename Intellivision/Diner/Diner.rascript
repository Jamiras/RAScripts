// Diner
// #ID=3600
// MD5=ae3b9621c32fd1d327e2aa994e69f62a

// extra life every 20000pts
// extra pepper with each side order

// food balls (50pts): red meatballs, tan mashed potatoes, white rice balls, green lettuce heads, yellow macaroni

// rotten food: hot dogs, bananas, cherries, mugsy (mug o' root beer)
// squash progression: 500, 1k, 2k, 4k, 8k

// side orders: cup of coffee, hot fudge sundae, double thick malt, can of soda pop, hamburger bun

// blue plate special (after every four rounds): 1k for each food ball eaten, die if collect flashing food ball
// number of food balls is determined by number of side orders collected on previous four levels

// pause by pressing 1 and 9 at the same time (possible in emulator?)

state_title = 0x80
state_player_select = 0x11
state_level_select = 0x21
state_player_start = 0x09
state_in_level = 0x00
state_dying = 0x05
state_bonus_announcement = 0x01 // advancing to blue plate special
state_level_complete = 0x03     // advancing to next level
state_game_over = 0x49
function current_state() => byte(0x0534)

function is_single_player() => byte(0x06dc) == 0

difficulty_1 = 0
difficulty_2 = 4
difficulty_3 = 11
difficulty_4 = 15
function current_difficulty() => byte(0x06ac)
difficulties = {
    difficulty_1: "1",
    difficulty_2: "2",
    difficulty_3: "3",
    difficulty_4: "4",
}

function current_score_low() => word(0xdb8)
function current_score_high() => word(0xdc0)
function current_score() => current_score_low() * 10 + current_score_high() * 100000
function remaining_peppers() => byte(0x066c)
function remaining_lives() => byte(0x069c)
function is_food_ball_rolling() => low4(0x0778) != 0
function squashed_food() => byte(0x078c)

// there are 15 levels, then they start repeating
// selecting difficulty 2 starts on "stage 5" (still reports as level 1)
// selecting difficulty 3 starts on "stage 12" (still reports as level 1)
// selecting difficulty 4 starts on "stage 16" (level 1 map with color change)
function current_map() => byte(0x04f4)
function current_level() => byte(0x0538) + 1
function in_blue_plate_round() => byte(0x0550) == 1

function complete_level() => !in_blue_plate_round() && 
                             (current_state() == state_level_complete || current_state() == state_bonus_announcement)

function in_level() => current_state() == state_in_level && !in_blue_plate_round()
function in_single_level() => never(current_state() != state_in_level) && ignore_death()

function single_level_challenge2() =>           
               (once(current_state() == state_player_select) &&   // simple case - first level
                current_state() == state_level_complete) ||
               (once(current_state() == state_in_level &&         // advanced case - second/third level
                     prev(current_state()) == state_level_complete) &&
                current_state() == state_level_complete) ||
               (once(current_state() == state_in_level &&         // advanced case - fourth level
                     prev(current_state()) == state_level_complete) &&
                current_state() == state_bonus_announcement)
function single_level_challenge() =>           
               (once(current_state() == state_player_select) &&   // simple case - first level
                current_state() == state_level_complete) ||
               (once(current_level() > prev(current_level())) &&  // advanced case - second/third level
                current_state() == state_level_complete) ||
               (once(current_level() > prev(current_level())) &&  // advanced case - fourth level
                current_state() == state_bonus_announcement)
                
                
function without_using_pepper() => never(remaining_peppers() < prev(remaining_peppers()))
function without_dying() => never(current_state() == state_dying)
function ignore_death() => unless(current_state() == state_dying || current_state() == state_player_start)

blue_plate_lookup = {
    0: "",
    1: " Blue Plate"
}

// this value remains 1 while transitioning from instructions back to titles
// current_state() briefly flashes to 0 during that transition
rich_presence_conditional_display(current_state() == state_title, "Titles")

rich_presence_conditional_display(current_state() == state_game_over, "{0} Points | Level {1}{2} | Difficulty {3} | Game Over",
    rich_presence_value("Score", current_score()),
    rich_presence_value("Level", current_level()),
    rich_presence_lookup("BluePlate", byte(0x0550), blue_plate_lookup),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

rich_presence_display("{0} Points | Level {1}{2} | Difficulty {3} | {4} Lives",
    rich_presence_value("Score", current_score()),
    rich_presence_value("Level", current_level()),
    rich_presence_lookup("BluePlate", byte(0x0550), blue_plate_lookup),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_value("Lives", remaining_lives())
)

leaderboard("High Score", "Highest Score at Game Over", 
    start = current_state() == state_game_over,
    submit = current_state() == state_game_over,
    cancel = always_false(),
    value = current_score()
)

achievement("25K", "Have at least 25000 points", 5,
    trigger = current_state() == state_in_level && 
              (current_score_high() > 0 || current_score_low() >= 2500)
)

achievement("50K", "Have at least 50000 points", 10,
    trigger = current_state() == state_in_level && 
              (current_score_high() > 0 || current_score_low() >= 5000)
)

achievement("100K", "Have at least 100000 points", 25,
    trigger = current_state() == state_in_level && 
              current_score_high() >= 1
)

achievement("Set 'Em Up and Knock 'Em Down", "Score at least 50000 points in the first level", 10, id=170788,
    trigger = current_level() == 1 &&
              current_state() == state_in_level && 
              current_score_low() >= 5000 &&
              once(current_state() == state_player_select) && // prevent trigger when returning to title after game over
              never(current_state() == state_game_over)
)

achievement("Sneaky Chef", "Complete a level without dying", 3,
    trigger = single_level_challenge() && without_dying()
)

function is_peppered(index) => byte(0x64C + 64*index) == 0x80 && prev(byte(0x64C + 64*index)) != 0x80
achievement("Over Seasoned", "Disable two or more pieces of rotten food with one pepper", 2,
   trigger = in_level() &&
             never(squashed_food() > prev(squashed_food())) &&
             never(remaining_peppers() < prev(remaining_peppers())) &&
             tally(2, is_peppered(0), is_peppered(1), is_peppered(2), is_peppered(3), is_peppered(4))
)

achievement("No Seasoning", "Complete a level without using pepper", 2,
    trigger = single_level_challenge() && without_using_pepper()
)

achievement("Pepper Allergy", "Reach the bonus game from the start or another bonus game without using pepper", 10,
    trigger = current_state() == state_bonus_announcement &&            // reach the blue plate special
              without_using_pepper() &&                                 // without using pepper
              (once(current_state() == state_player_select) ||          // before first round
               once(in_blue_plate_round()))                             // after (in) bonus game
)

achievement("Beginner Bowler", "Knock out three pieces of rotten food with one food ball", 5,
    trigger = in_level() && is_food_ball_rolling() && squashed_food() >= 3
)

achievement("Intermediate Bowler", "Knock out four pieces of rotten food with one food ball", 5,
    trigger = in_level() && is_food_ball_rolling() && squashed_food() >= 4
)

achievement("Expert Bowler", "Knock out five pieces of rotten food with one food ball", 10,
    trigger = in_level() && is_food_ball_rolling() && squashed_food() >= 5
)

achievement("Rollin' Rollin' Rollin'", "Knock out ten or more pieces of rotten food with food balls in one level", 5,
    trigger = in_single_level() &&
              never(in_blue_plate_round()) &&
              // more than one piece of food can be squashed in a single frame. this construct
              // will capture one hit for each piece of food squashed in a single frame. for
              // example, if three pieces of food were squashed, conditions 1, 2, and 3 would
              // each gain one hit.
              measured(tally(10,
                  squashed_food() > prev(squashed_food()),      // at least one food squashed this frame
                  squashed_food() - prev(squashed_food()) >= 2, // at least two food squashed this frame
                  squashed_food() - prev(squashed_food()) >= 3, // at least three food squashed this frame
                  squashed_food() - prev(squashed_food()) >= 4, // at least four food squashed this frame
                  squashed_food() - prev(squashed_food()) >= 5  // at least five food squashed this frame
              ))
)

function side_orders_collected() => byte(0x06A4)
achievement("I'd Also Like A...", "Collect your first side order", 3,
    trigger = in_level() &&
              side_orders_collected() > prev(side_orders_collected())
)

achievement("And Then...?", "Collect three side orders between bonus levels", 10,
    trigger = current_state() == state_in_level &&
              repeated(3, side_orders_collected() > prev(side_orders_collected())) &&
              never(in_blue_plate_round()) &&               // reset at blue plate special round
              never(current_state() == state_player_select) // reset at start of game
)

achievement("Blue Plate Special", "Catch at least six food balls during a bonus level", 5,
    trigger = never(!in_blue_plate_round()) && 
              repeated(6, current_score_low() != prev(current_score_low()))
)

// complete level 4 (difficulty 2 starts on level 5) [1-4] [2-15] [3-8]
achievement("Mind the Gaps", "Complete the contracting floors level", 5,
    trigger = complete_level() && current_map() == 3
)

// complete level 11 (difficulty 2 starts on level 5, difficulty 3 starts on level 12) [1-11] [2-7] [3-15]
achievement("Tessellation", "Complete the repeating zig-zag level", 10,
    trigger = complete_level() && current_map() == 10
)

// complete level 15 (difficulty 3 starts on level 12, difficulty 3 starts on level 12) [1-15] [2-11] [3-4]
achievement("Ups and Downs", "Complete the all-ladders level", 25,
    trigger = complete_level() && current_map() == 14
)

// reach the ninth level on any difficulty
achievement("Where's My Tip?", "Complete eight maps in a single game", 10,
    trigger = complete_level() && current_level() == 8
)


