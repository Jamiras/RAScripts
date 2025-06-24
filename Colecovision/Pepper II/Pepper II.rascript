// Pepper II
// #ID=14002
// MD5: 679f02b1d1a7d68af42735d67cbccaff

// Difficulties (1P/2P):
// * skill 1 (X/R2) is suitable for beginners
// * skill 2 (Y/L2) is faster
// * skill 3 (R/R3) is like the arcade
// * skill 4 (L/L3) is more challenging than the arcade

// * asterisk (select) to start a new game on the current difficulty after game over

// http://www.colecovisionzone.com/photos/game/manual/pepper%20ii%20manual.pdf

// per https://tvtropes.org/pmwiki/pmwiki.php/Main/UnInstallment
// - The 1982 arcade game Pepper II was so named because video games were a new fad at the 
//   time and it was possible to have a game not in your area. Exidy, the makers of Pepper II,
//   banked on the concept that if a "sequel" was made to the original (but non-existent)
//   Pepper, then prospective audiences might figure that was a series that proved itself
//   with a first installment that was successful enough to warrant a sequel, and/or think
//   it to be even better than the original and thus want to play.

// * complete all four mazes
// * complete all four mazes again
// * complete all four mazes a third time
// * complete all four mazes without being hit
// * complete all four mazes (skill 3+ [skill level 3 is considered arcade difficulty])
// * complete a maze without leaving the screen
// * complete a maze without holding still for more than a second
// * capture three/five roaming eyes while in devil mode
// * collect four pitchforks in a single maze without losing devil mode
// * score points: 25000, 50000, 100000, 250000
// * score 1000 points without filling any segments or leaving the screen
// * collect one/three/five/ten bonus prizes (hammer, safety pin)

function current_difficulty() => byte(0x0004)
function current_loop() => byte(0x0009) + 1

function number_of_players() => byte(0x0077)

function remaining_peppers() => byte(0x0078)

function bonus_prizes_collected() => byte(0x0079)

// this is a bit vector (bit1=maze1, bit2=maze2, bit3=maze3, bit4=maze4)
function completed_mazes() => byte(0x007D)
function all_mazes_complete() => completed_mazes() == 0x1E

function current_score() => tbyte(0x0080) * 10

function current_maze() => byte(0x0184)
function in_maze() => byte(0x0006) == 1

function player_direction() => byte(0x0195)

function rooms_filled() => byte(0x021C)

function devil_mode() => byte(0x0223) == 1
function remaining_devil_time() => byte(0x0254)

function roaming_eyes_captured() => byte(0x0242)

// ========================================

function choosing_difficulty() => byte(0x001E) == 0x0F

rich_presence_conditional_display(choosing_difficulty(), "Picking difficulty")
rich_presence_display("{0} points, {1} mazes complete, loop {2}, difficulty {3}",
    rich_presence_value("Score", current_score(), format="POINTS"),
    rich_presence_value("Mazes", bitcount(0x007D)),
    rich_presence_value("Loop", current_loop()),
    rich_presence_value("Difficulty", current_difficulty())
)

// ========================================

function in_game() => in_maze() && number_of_players() == 1
function is_game_over() => byte(0x00008) == 1

function start_loop() => current_score() == 0 || completed_mazes() < prev(completed_mazes())
function complete_loop() => in_game() && all_mazes_complete()

achievement("Once Around", "Complete all four mazes", points=5,
    trigger = complete_loop()
)

achievement("Twice Around", "Complete all four mazes in the second loop", points=5,
    trigger = complete_loop() && current_loop() == 2
)

achievement("And Around Again", "Complete all four mazes in the third loop", points=10,
    trigger = complete_loop() && current_loop() == 3
)

achievement("Once More", "Complete all four mazes in the fourth loop", points=10,
    trigger = complete_loop() && current_loop() == 4
)

achievement("It Just Keeps Going", "Complete all four mazes in the fifth loop", points=10,
    trigger = complete_loop() && current_loop() == 5
)

achievement("It Never Stops", "Complete all four mazes in the sixth loop", points=25,
    trigger = complete_loop() && current_loop() == 6
)

achievement("Arcade Master", "Complete all four mazes on skill 3 or higher", points=10,
    trigger = complete_loop() && current_difficulty() >= 3
)

achievement("Arcade Master 2", "Complete all four mazes in the second loop on skill 3 or higher", points=25,
    trigger = complete_loop() && current_difficulty() >= 3 && current_loop() == 2
)

achievement("Untouchable", "Complete all four mazes without dying", points=10,
    trigger = complete_loop() && once(start_loop()) && 
              never(remaining_peppers() < prev(remaining_peppers())) &&
              unless(byte(0x0006) == 0) // prevent reset when changing mazes
)

achievement("Focus", "Complete a maze without leaving the screen", points=5,
    trigger = in_game() && once(rooms_filled() == 0) && 
              completed_mazes() > prev(completed_mazes()) &&
              never(current_maze() != prev(current_maze()))
)

achievement("Hide 'n Seek", "Earn 1000 points in a single maze without filling any segments, changing mazes, or dying", points=5,
    trigger = in_game() && 
              repeated(100, current_score() > prev(current_score())) && // 10 points per segment
              never(remaining_peppers() < prev(remaining_peppers())) && // died
              never(rooms_filled() != 0) &&                             // segment has been filled
              never(current_maze() != prev(current_maze()))             // changed mazes
)

function player_moved() => word(0x00DF) != prev(word(0x00DF))
function player_direction_changed() => player_direction() != prev(player_direction())
achievement("Hot Feet", 
            "Complete a maze without holding still for a total of three seconds after starting a loop", points=5,
    trigger = number_of_players() == 1 && // only use part of in_game() because the in_maze() flag goes to 0 for two frames
                                          // every time a segment is completed. it's handled by the complex chain below.
              once(start_loop()) && 
              never(choosing_difficulty()) && // hide when reset - can't detect Colecovision screen, so use difficulty screen
              trigger_when(completed_mazes() > prev(completed_mazes())) &&
              // once the player has moved once, count every frame they don't move
              never(repeated(3 * 60,                             // 60 frames per second
                             once(in_maze()) &&                  // wait until player has control
                             once(player_direction_changed()) && // 0=stop moving after entering maze, 
                                                                 // or first time player changes direction
                             once(player_direction() != 0) &&    // once player starts moving
                             player_direction() == 0))           // count when player isn't moving
)

// GOOD
achievement("Eye Catcher", "Capture three roaming eyes while in devil mode", points=2,
    trigger = in_game() && devil_mode() && roaming_eyes_captured() >= 3
)

// GOOD
achievement("Eye Hunter", "Capture five roaming eyes while in devil mode", points=4,
    trigger = in_game() && devil_mode() && roaming_eyes_captured() >= 5
)

achievement("How Devilish", "Collect four pitchforks or magic boxes without losing devil mode", points=5,
    trigger = in_game() && repeated(4, remaining_devil_time() > prev(remaining_devil_time())) &&
              never(!devil_mode())
)

achievement("50K", "Have at least 50000 points", points=2,
    trigger = in_game() && current_score() >= 50000
)

achievement("100K", "Have at least 100000 points", points=3,
    trigger = in_game() && current_score() >= 100000
)

achievement("250K", "Have at least 250000 points", points=5,
    trigger = in_game() && current_score() >= 250000
)

achievement("Prize Finder", "Collect your first prize", points=1,
    trigger = in_game() && bonus_prizes_collected() == 1
)

achievement("Prize Grabber", "Collect three prizes in one game", points=3,
    trigger = in_game() && bonus_prizes_collected() == 3
)

achievement("Prize Hunter", "Collect five prizes in one game", points=5,
    trigger = in_game() && bonus_prizes_collected() == 5
)

achievement("Prize Collector", "Collect ten prizes in one game", points=10,
    trigger = in_game() && bonus_prizes_collected() == 10
)

leaderboard("Beginner Mode", "Highest score on difficulty 1 or 2",
    start = in_game() && current_difficulty() < 3 && current_score() < 20,
    cancel = choosing_difficulty(),
    submit = is_game_over(),
    value = prev(current_score()) // score goes to 0 in the same frame the game over flag is set
)

leaderboard("Arcade Mode", "Highest score on difficulty 3",
    start = in_game() && current_difficulty() == 3 && current_score() < 20,
    cancel = choosing_difficulty(),
    submit = is_game_over(),
    value = prev(current_score()) // score goes to 0 in the same frame the game over flag is set
)

leaderboard("Challenge Mode", "Highest score on difficulty 4",
    start = in_game() && current_difficulty() == 4 && current_score() < 20,
    cancel = choosing_difficulty(),
    submit = is_game_over(),
    value = prev(current_score()) // score goes to 0 in the same frame the game over flag is set
)
