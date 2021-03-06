// Anticipation!
// #ID = 1542
// md5: 14de068a0ea0b211c697d8795228c282 (U)
// md5: e6f6a99ac2ac889b9d70c0eabf52af69 (E)

// ============================================================

difficulty_easy = 0      // B1+B2: Cat+Dot+Blanks, B3: Cat
difficulty_medium = 1    // B1: Cat+Dot+Blanks, B2: Cat, B3: None?
difficulty_hard = 2      // B1: Cat, B2+B3+B4: None
difficulty_very_hard = 3 // B1+B2+B3+B4: None
difficulties = {
    difficulty_easy: "Easy",
    difficulty_medium: "Medium",
    difficulty_hard: "Hard",
    difficulty_very_hard: "Very Hard",
}

function current_difficulty() => byte(0x00AF)
function human_players() => byte(0x00AC)
function computer_players() => byte(0x0AD) // -1

function opponents_value() => computer_players() * 8 + human_players()
opponents = {
    9: "alone",
    10: "with a friend",
    11: "with two friends",
    12: "with three friends",
    17: "against a CPU player",
    18: "with a friend and a CPU player",
    19: "with two friends and a CPU player",
    25: "against two CPU players",
    26: "with a friend and two CPU players",
    27: "with two friends and two CPU players",
    33: "against three CPU players",
}

rich_presence_display("Playing {0} on {1}",
    rich_presence_lookup("Opponents", opponents_value(), opponents),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

// ============================================================
// Solution decoder - NOT the real Rich Presence - use the one above

letters = {
    0x00: " ",
    0x96: "A",
    0x97: "B",
    0x98: "C",
    0x99: "D",
    0x9A: "E",
    0x9B: "F",
    0x9C: "G",
    0x9D: "H",
    0x9E: "I",
    0x9F: "J",
    0xA0: "K",
    0xA1: "L",
    0xA2: "M",
    0xA3: "N",
    0xA4: "O",
    0xA5: "P",
    0xA6: "Q",
    0xA7: "R",
    0xA8: "S",
    0xA9: "T",
    0xAA: "U",
    0xAB: "V",
    0xAC: "W",
    0xAD: "X",
    0xAE: "Y",
    0xAF: "Z",
}

rich_presence_display("{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}{11}{12}{13}{14}{15}{16}{17}{18}",
    rich_presence_lookup("Letter", byte(0x0470), letters),
    rich_presence_lookup("Letter", byte(0x0471), letters),
    rich_presence_lookup("Letter", byte(0x0472), letters),
    rich_presence_lookup("Letter", byte(0x0473), letters),
    rich_presence_lookup("Letter", byte(0x0474), letters),
    rich_presence_lookup("Letter", byte(0x0475), letters),
    rich_presence_lookup("Letter", byte(0x0476), letters),
    rich_presence_lookup("Letter", byte(0x0477), letters),
    rich_presence_lookup("Letter", byte(0x0478), letters),
    rich_presence_lookup("Letter", byte(0x0479), letters),
    rich_presence_lookup("Letter", byte(0x047A), letters),
    rich_presence_lookup("Letter", byte(0x047B), letters),
    rich_presence_lookup("Letter", byte(0x047C), letters),
    rich_presence_lookup("Letter", byte(0x047D), letters),
    rich_presence_lookup("Letter", byte(0x047E), letters),
    rich_presence_lookup("Letter", byte(0x047F), letters),
    rich_presence_lookup("Letter", byte(0x0480), letters),
    rich_presence_lookup("Letter", byte(0x0481), letters),
    rich_presence_lookup("Letter", byte(0x0482), letters)
)

// ============================================================

function current_die_face() => byte(0x007F)
function die_countdown_timer() => byte(0x007A) // goes from 213 to 0 (~4 seconds per side)
function current_guess_timer() => byte(0x0086)
function guess_countdown_timer() => byte(0x0087) // goes from 60 to 0 (1 second per)
function guess_player() => byte(0x0043)
function current_puzzle_color() => byte(0x008D) // 0=Y, 1=G, 2=B, 3=R, 4=Gray
function current_board() => byte(0x0088)
function current_player() => byte(0x008C)
function current_puzzle_length() => byte(0x046F)
function current_puzzle_difficulty() => byte(0x00B1) // board + difficulty (i.e. med(2) board2(1) = 3)

function current_puzzle_category() => byte(0x00C7)
category_natural = 0
category_man_made = 1
category_clothing = 2
category_food = 3
category_tool = 4
category_thing = 5
category_math = 6
category_science = 7
category_weapon = 8
category_leisure = 9
category_office = 10
category_travel = 11
category_music = 12
category_miscellaneous = 13
category_alphabet = 14
category_whatchamacallit = 15

function player_has_color(player, color) => byte(0x0433 + color * 4 + player) == 1
color_yellow = 0
color_green = 1
color_blue = 2
color_red = 3
color_gray = 4

// 0x0054 = segment being drawn (starting at index 0), 0x0055 = pencil state (0=in air)
function drawing_started() => word(0x0054) != 0 

function trigger_no_one_can_answer() => word(0x0008) == 0xDD0B

// 0x00BB indicates whether the completed puzzle is a new color for the player (value=1), but it goes 
// back to 0 when in a puzzle, so we can't just watch for 0. 0x00BA goes to 0x70 while the piece is 
// moving, so if the piece is moving, but the puzzle was not new, assume the color was already won
function trigger_already_won_color() => word(0x00BA) == 0x0070

function player_board_space(player) => byte(0x0403 + player) 
function player_board(player) => high4(0x0403 + player)
// 00-0F = board 1
// 10-1F = board 2
// 20-2E = board 3
// 2F    = center (all boards)
// 30-3E = board 4

function player_token_floating(player) => byte(0x0421 + player) > 0 // 0x422 confirmed for horn

// 0x0052
// 1 = N
// 4 = NNE
// ? = NE
// ? = ENE
// 0 = E
// ? = ESE
// E = SE
// ? = SSE
// 9 = S
// C = SSW
// B = SW
// ? = WSW
// 8 = W
// ? = WNW
// 6 = NW
// 7 = NNW

// ============================================================

// === Boards(4) (35pts) ===
//  5 - Completed the Circle - Complete the first board
//  5 - Survived the Square - Complete the second board
// 10 - Passed the Pentagon - Complete the third board
// 15 - Hopped the Holes - Complete the fourth board

function trigger_complete_board(board) => player_board_space(0) == 0x2F && prev(player_board(0)) == board

achievement(
    title = "Completed the Circle", description = "Complete the first board", points = 5,
    trigger = trigger_complete_board(0)
)

achievement(
    title = "Survived the Square", description = "Complete the second board", points = 5,
    trigger = trigger_complete_board(1)
)

achievement(
    title = "Passed the Pentagon", description = "Complete the third board", points = 5,
    trigger = player_board_space(0) == 0x2F && prev(player_board_space(0)) >= 0x20 && prev(player_board_space(0)) <= 0x2E
)

achievement(
    title = "Hopped the Holes", description = "Complete the fourth board", points = 10,
    trigger = trigger_complete_board(3)
)

// === Winning(7) (140pts) ===
// 10 - That Was Easy - Win a game on Easy or higher against at least one CPU
// 20 - Winner's Circle - Win a game on Medium or higher against at least one CPU
// 30 - Not So Hard - Win a game on Hard or higher against at least one CPU
// 50 - What a Challenge - Win a game on Very Hard against at least one CPU

// 10 - Versus Victory - Win a game against one CPU
// 10 - Threesome - Win a game against two CPUs
// 15 - Full Party - Win a game against three CPUs

function trigger_win_game() => current_board() == 0x8B && current_player() == 0
function trigger_win_on_difficulty(difficulty) => trigger_win_game() && current_difficulty() == difficulty
function trigger_win_against_cpu_players(cpu_players) => 
    trigger_win_game() && human_players() == 1 && computer_players() == cpu_players + 1

achievement(
    title = "That Was Easy", description = "Win a game on Easy against at least one CPU", points = 10,
    trigger = trigger_win_on_difficulty(difficulty_easy) && computer_players() > 1
)

achievement(
    title = "Winner's Circle", description = "Win a game on Medium against at least one CPU", points = 10,
    trigger = trigger_win_on_difficulty(difficulty_medium) && computer_players() > 1
)

achievement(
    title = "Not So Hard", description = "Win a game on Hard against at least one CPU", points = 25,
    trigger = trigger_win_on_difficulty(difficulty_hard) && computer_players() > 1
)

achievement(
    title = "What a Challenge", description = "Win a game on Very Hard against at least one CPU", points = 25,
    trigger = trigger_win_on_difficulty(difficulty_very_hard) && computer_players() > 1
)

achievement(
    title = "Versus Victory", description = "Win a game against one CPU", points = 10,
    trigger = trigger_win_against_cpu_players(1)
)

achievement(
    title = "Threesome", description = "Win a game against two CPUs", points = 10,
    trigger = trigger_win_against_cpu_players(2)
)

achievement(
    title = "Full Party", description = "Win a game against three CPUs", points = 10,
    trigger = trigger_win_against_cpu_players(3)
)

// === Winning Challenges(6) (100pts) ===
//  5 - A Lap Ahead - Win a game against three CPUs without any CPU players on the last board
// 10 - Bottomed Out - Win a game against three CPUs with at least one CPU player still on the first board
// 40 - Shut Out - Win a game against three CPUs without letting any CPU player solve a puzzle
// 10 - Controlling Your Destiny - Win a game by solving a puzzle selected using a gray tile
// 25 - Score! - Win a game with at least 600 points
// 10 - Careful Guesser - Win a game without entering any incorrect letters

achievement(
    title = "A Lap Ahead", description = "Win a game against three CPUs without any CPU players on the last board", points = 10,
    trigger = trigger_win_against_cpu_players(3) && 
        ((player_board(1) < 2 && player_board(2) < 2 && player_board(3) < 2) ||
         (player_board(1) < 3 && player_board(2) < 3 && player_board(3) < 3 && current_difficulty() >= difficulty_hard))
)

achievement(
    title = "Bottomed Out", description = "Win a game against three CPUs with at least one CPU player still on the first board", points = 10,
    trigger = trigger_win_against_cpu_players(3) && 
        (player_board(1) == 0 || player_board(2) == 0 || player_board(3) == 0)
)

achievement(
    title = "Shut Out", description = "Win a game against three CPUs without letting any CPU player solve a puzzle", points = 25,
    trigger = trigger_win_against_cpu_players(3) && 
              player_board(1) == 0 && player_board(2) == 0 && player_board(3) == 0 &&
              dword(0x0433) == 0 && dword(0x0437) == 0 && dword(0x043B) == 0 && dword(0x043F) == 0
)

achievement(
    title = "Controlling Your Destiny", description = "Win a game by solving a puzzle selected using a gray tile", points = 10,
    trigger = once(current_puzzle_color() == color_gray) &&
              player_has_color(0, color_yellow) &&
              player_has_color(0, color_blue) &&
              player_has_color(0, color_green) &&
              player_has_color(0, color_red) &&
              never(trigger_no_one_can_answer()) &&              // no one can answer
              never(current_player() != 0) &&                    // computer answered
              never(word(0x000B) == 0x2181) &&                   // a token moves
              (player_board(0) == 3 ||                            // board 4
               (player_board(0) == 2 &&                           // board 3 on easy/medium
                player_board_space(0) != 0x2F && 
                current_difficulty() < 2))
)

achievement(
    title = "Score!", description = "Win a game with at least 600 points", points = 25,
    trigger = trigger_win_game() && byte(0x0573) >= 0xF6
)

achievement(
    title = "Careful Guesser", description = "Win a game without entering any incorrect letters", points = 10,
    trigger = trigger_win_game() && never(bit5(0x00C4) == 1) &&     // never incorrect letter
              (once(word(0x0010) == 0x8393) ||                      // game setup screen (U)
               once(word(0x0010) == 0x83B1))                        // game setup screen (E)
)

// === Puzzle Challenges(5) (50pts) ===
//  5 - Who Needs a Keyboard - Enter a four letter or longer answer in under five seconds
//  5 - Buzzer Beater - Solve a puzzle just before the die turns to zero
// 10 - Connect the Dots - Solve a dot puzzle before any lines have been drawn
// 20 - Intuition - Solve a non-dot puzzle with the die on a five or six
// 10 - Something Abstract - Solve a Whatchamacallit puzzle

// 0x008A goes from 0 to 2 on a wrong answer, and from 0 to 1 for a frame, then 3 on a correct answer
function trigger_win_puzzle() => guess_player() == 0 && byte(0x008A) == 3 && prev(byte(0x008A)) == 1

// 0=easy board 1, 1=easy board 2 or medium board 1, 2=easy board 3, medium board 2, or hard board 1, ...
function dots_visible() => current_puzzle_difficulty() <= 1

achievement(
    title = "Who Needs a Keyboard", description = "Enter a four letter or longer answer in under five seconds", points = 5,
    trigger = trigger_win_puzzle() && current_puzzle_length() >= 4 && current_guess_timer() >= 20
)

achievement(
    title = "Buzzer Beater", description = "Solve a puzzle just before the die turns to zero", points = 5,
    trigger = trigger_win_puzzle() && current_die_face() == 1 && die_countdown_timer() < 40
)

achievement(
    title = "Connect the Dots", description = "Solve a dot puzzle before any lines have been drawn", points = 10,
    trigger = trigger_win_puzzle() && dots_visible() && !drawing_started()
)

achievement(
    title = "Intuition", description = "Solve a non-dot puzzle when the die is on five or six", points = 10,
    trigger = trigger_win_puzzle() && !dots_visible() && current_die_face() >= 5
)

//achievement(
//    title = "Blind Ambition", description = "Solve a non-dot puzzle before any lines have been drawn", points = 30,
//    trigger = trigger_win_puzzle() && !dots_visible() && !drawing_started()
//)

achievement(
    title = "Something Abstract", description = "Solve a Whatchamacallit puzzle", points = 10,
    trigger = trigger_win_puzzle() && current_puzzle_category() == category_whatchamacallit
)

// === Board Challenges(8) (60pts)
// 20 - Perfect Board - Collect all four colors on a board without missing a puzzle or winning a color that you already have
//  5 - Surplus - Collect a color that you already have
// 10 - Threepeat - Collect the same color three times in a row
//  5 - Puzzle Pauper - Complete the first board with only 70 points (
// 10 - To Your Corners - Land on all four corners of the second board
//  5 - Spin Out - Use a gray tile on the third board
// 10 - Making the Rounds - Land on all three gray squares on the third board in one turn
//  5 - That's Not a Valid Space - Fall off the fourth board

achievement(
    title = "Perfect Board", description = "Complete a board in only four puzzles", points = 10,
    trigger = once(!player_has_color(0, color_yellow)) &&
              once(!player_has_color(0, color_blue)) &&
              once(!player_has_color(0, color_green)) &&
              once(!player_has_color(0, color_red)) &&
              player_has_color(0, color_yellow) &&
              player_has_color(0, color_blue) &&
              player_has_color(0, color_green) &&
              player_has_color(0, color_red) &&
              never(player_board_space(0) == 0x2F) &&   // reset on each board
              never(trigger_no_one_can_answer()) &&     // no-one can answer
              never(current_player() != 0) &&           // computer answered
              never(trigger_already_won_color())        // color already won
)

achievement(
    title = "Surplus", description = "Collect a color that you already have", points = 2,
    trigger = trigger_win_puzzle() &&
              ((current_puzzle_color() == color_yellow && player_has_color(0, color_yellow)) ||
               (current_puzzle_color() == color_blue && player_has_color(0, color_blue)) ||
               (current_puzzle_color() == color_green && player_has_color(0, color_green)) ||
               (current_puzzle_color() == color_red && player_has_color(0, color_red)))
)

achievement(
    title = "Threepeat", description = "Win the same color three times in a row", points = 5,
    trigger = trigger_win_puzzle() && 
              never(current_player() != 0) &&                    // another player answered
              never(trigger_no_one_can_answer()) &&              // no-one can answer
              repeated(5, byte(0x0497) != prev(byte(0x0497))) && // 3x buzz-in and reset
              never(current_puzzle_color() != prev(current_puzzle_color())) &&
              never(word(0x0010) == 0x8393) &&                   // options select (prevents trigger on reset)
              never(byte(0x0079) == 0xFF)                        // puzzle timer expired with no winner
)

// 10 points are awared for each roll of a 1 on the first three puzzles, then 40 points for advancing to the
// next board, regardless of the roll on the fourth puzzle.
achievement(
    title = "Puzzle Pauper", description = "Complete the first board with only 70 points", points = 10,
    trigger = trigger_complete_board(0) && byte(0x0573) == 0xF0 && byte(0x0577) == 0xF3
)

achievement(
    title = "To Your Corners", description = "Land on all four corners of the second board", points = 10,
    trigger = repeated(250, player_board_space(0) == 16) &&
              repeated(250, player_board_space(0) == 20) &&
              repeated(250, player_board_space(0) == 24) &&
              repeated(250, player_board_space(0) == 28) &&
              never(player_board(0) != 1) &&
              never(byte(0x03CD) == 0)                       // shoe X
)

achievement(
    title = "Making the Rounds", description = "Land on all three gray squares on the third board in one turn", points = 10,
    trigger = repeated(60, player_board_space(0) == 34) &&
              repeated(60, player_board_space(0) == 39) &&
              repeated(60, player_board_space(0) == 44) &&
              unless(player_token_floating(0)) &&
              never(current_puzzle_color() != color_gray) &&
              never(player_board(0) != 2)
)

achievement(
    title = "Spin Out", description = "Land on a gray tile", points = 3,
    trigger = current_puzzle_color() == color_gray && player_board_space(0) != 0x2F &&
              unless(byte(0x03DD) == 0x0D) &&            // prevents triggering between floors
              current_player() == 0 && player_board(0) >= 2
)

achievement(
    title = "That's Not a Valid Space", description = "Fall off the fourth board", points = 5,
    trigger = player_board(0) == 2 && prev(player_board(0)) == 3 &&
              player_board_space(0) != 0x2F && current_player() == 0
)
