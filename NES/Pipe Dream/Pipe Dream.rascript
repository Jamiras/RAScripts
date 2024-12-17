// Pipe Dream
// #ID = 1878
// MD5: 6344e74ac60ca77acc14797c011657a6 (U)

// https://gamefaqs.gamespot.com/nes/587512-pipe-dream/faqs
// https://youtu.be/SfPAmtMdDxk?t=74

// to enable cheating, hold Start, press A, B, B, A, release Start and press Start again. 
// Now you can press B to pause the Flooz and Select to allow it to flow again.
// NOTE: Having the cheat enabled also has a secondary effect not documented in the GameFAQs page:
//       If you fail a level while the cheat is enabled, you advance to the next stage without losing a life.
function is_cheating() => byte(0x06B9) != 0 // 0=cheat not enabled, 1=cheat enabled, 0xFF=flooz stopped
function trigger_no_cheating() => never(is_cheating())

function current_level() => byte(0x0444)
function current_sublevel() => byte(0x0445)
function current_screen() => byte(0x002B)
screen_main_board = 2
screen_logo = 4
screen_bonus = 5
screen_paused = 6
screen_level_select = 7
screen_title = 8

function current_mode() => byte(0x0451)
mode_a = 0
mode_b = 1
mode_c = 2

modes = {
    mode_a: "Mode A",
    mode_b: "Mode B",
    mode_c: "Mode C",
}

players = {
    1: "",
    2: " (2P)",
}

function current_players() => byte(0x0442)
function trigger_is_bonus_level() => byte(0x00C9) == 0x18
function trigger_is_demo() => byte(0x0440) == 0xFF

rich_presence_conditional_display(current_screen() == screen_logo, "Titles")
rich_presence_conditional_display(current_screen() == screen_title, "Titles")
rich_presence_conditional_display(trigger_is_demo(), "Level {0}-{1} Demo",
    rich_presence_value("Level", current_level()),
    rich_presence_value("Sublevel", current_sublevel())
)
rich_presence_conditional_display(byte(0x002B) == 7, "Selecting a level")
rich_presence_conditional_display(trigger_is_bonus_level(), "Level {0}-Bonus {1}{2}",
    rich_presence_value("Level", current_level() - 1),
    rich_presence_lookup("Mode", current_mode(), modes),
    rich_presence_lookup("Players", current_players(), players)
)
rich_presence_conditional_display(is_cheating(), "Level {0}-{1} {2}{3}.",
    rich_presence_value("Level", current_level()),
    rich_presence_value("Sublevel", current_sublevel()),
    rich_presence_lookup("Mode", current_mode(), modes),
    rich_presence_lookup("Players", current_players(), players)
)
rich_presence_display("Level {0}-{1} {2}{3}",
    rich_presence_value("Level", current_level()),
    rich_presence_value("Sublevel", current_sublevel()),
    rich_presence_lookup("Mode", current_mode(), modes),
    rich_presence_lookup("Players", current_players(), players)
)

function required_pipes_remaining() => byte(0x0447)

function trigger_in_game() => current_screen() >= screen_main_board && current_screen() <= screen_bonus && 
                              current_screen() != screen_logo
function trigger_flooz_stopped() => byte(0x00FA) == 0 // flooz has stopped flowing
function trigger_start_level() => !trigger_is_demo() && once(byte(0x00B6) == 0) // flooz has not started to flow
function trigger_during_level() => trigger_start_level() && never(trigger_flooz_stopped())
function trigger_level_complete() => byte(0x00E2) > 8 // 9 = game over, 12 = push button
function trigger_level_won() => trigger_flooz_stopped() && prev(byte(0x00FA)) == 255 && required_pipes_remaining() == 0
function trigger_full_flow() => byte(0x00EA) == 255

function trigger_during_bonus_level() => trigger_is_bonus_level() && 
                                         never(byte(0x00F9) == 255) &&
                                         never(current_screen() == screen_level_select) // LucasArts title card uses $C9 as a timer

// ==== Progress (250pts) (18x) ====
// Game A        200pts
// Game B  1-10   20pts
// Game B 11-16   30pts

function achievement_game_a(level, points, type="progression") {
    achievement(
        title = "A-" + level + " Plumber",
        description = "Complete all four rounds of level " + level + " in mode A",
        points = points,
        type = type,
        trigger = once(current_sublevel() == 1) &&
                  current_sublevel() == 4 &&
                  current_level() == level &&
                  current_mode() == mode_a &&
                  trigger_level_won() &&
                  trigger_no_cheating()
    )
}

achievement_game_a(1, 5)
achievement_game_a(2, 5)
achievement_game_a(3, 5)
achievement_game_a(4, 5)
achievement_game_a(5, 5)
achievement_game_a(6, 5)
achievement_game_a(7, 10)
achievement_game_a(8, 10)
achievement_game_a(9, 10)
achievement_game_a(10, 10)
achievement_game_a(11, 10)
achievement_game_a(12, 10)
achievement_game_a(13, 10)
achievement_game_a(14, 10)
achievement_game_a(15, 25)
achievement_game_a(16, 25, type="win_condition")

achievement(
    title = "Apprentice Plumber",
    description = "Complete level 10 in mode B",
    points = 10,
    trigger = once(current_level() == 1) &&
              current_level() == 10 &&
              current_mode() == mode_b &&
              trigger_level_won() &&
              trigger_no_cheating()
)

achievement(
    title = "Master Plumber",
    description = "Complete level 16 in mode B",
    points = 25,
    trigger = once(current_level() == 1) &&
              current_level() == 16 &&
              current_mode() == mode_b &&
              trigger_level_won() &&
              trigger_no_cheating()
)

// ==== Challenges (150pts) (x15) ====
// 10 - pass through 50 sections of pipe
//  5 - have flooz pass through all four corners of a level
// 10 - complete a level without replacing pieces or having unused pieces
//  5 - loop back through 4 crosses on a single board
// 10 - loop back through 8 crosses on a single board
// 15 - create a loop after passing through four tunnels
// 10 - get at least 20K points from a loop
// 20 - get at least 50K points from a loop
//  5 - pass through at least 10 pipes after activating full flow
// 10 - pass through at least 10 pipes in a bonus level
//  5 - loop back through a cross in a bonus level
//  5 - 100K points
// 10 - 500K points
// 15 - 1M points
// 15 - 500K points in mode C (limited to single level)

function trigger_visit_square(x, y) => once(word(0x00B8) == (x * 256 + y))
trigger_all_squares = once(word(0x00B8) == 0)
for x in range(0,9) {
    for y in range(0,7) {
        trigger_all_squares = trigger_all_squares && trigger_visit_square(x, y)
    }
}

// This achievement ends up being too long (1431/1024 bytes serialized)
//achievement(
//    title = "Tight Fit",
//    description = "Have flooz pass through every square on a board",
//    points = 20,
//    trigger = trigger_level_won() &&
//              trigger_no_cheating() &&
//              trigger_all_squares
//)

function trigger_pipes(count) => repeated(count, word(0x00B8) != prev(word(0x00B8)))

// Good
achievement(
    title = "A Series of Tubes",
    description = "Have flooz pass through at least 50 sections of pipe on a single level",
    points = 5,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_pipes(50)
)

// Good
achievement(
    title = "To Your Corners",
    description = "Have flooz pass through all four corners of a level",
    points = 5,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_visit_square(0, 0) &&
              trigger_visit_square(9, 0) &&
              trigger_visit_square(0, 7) &&
              trigger_visit_square(9, 7)
)

function current_sound() => word(0x0041)

// TODO: not trigger until after pipes destroyed
achievement(
    title = "Careful Planning",
    description = "Complete a level without replacing pieces or having unused pieces",
    points = 10,
    trigger = trigger_start_level() &&
              byte(0x00E2) == 12 &&               // "push button" - wait to ensure extra pipes are destroyed
              required_pipes_remaining() == 0 &&
              trigger_no_cheating() &&
              never(current_sound() == 0xA0B4) && // sound for placing a pipe over an existing pipe
              never(current_sound() == 0xA0A6)    // sound for pipe being destroyed after complete
)

function trigger_complete_loop() => byte(0x053B) != prev(byte(0x053B))
function trigger_loops(count) => repeated(count, trigger_complete_loop())

// Good
achievement(
    title = "Coiled Pipes",
    description = "Loop back through at least four cross pipes on a single level",
    points = 5,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_loops(4)
)

// Good?
achievement(
    title = "Tangled Pipes",
    description = "Loop back through at least eight cross pipes on a single level",
    points = 10,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_loops(8)
)

function trigger_tunnels(count) => byte(0x0071) == count

// Good
achievement(
    title = "Four Dimensional Plumbing",
    description = "Pass through four tunnels on a single level",
    points = 10,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_tunnels(4) 
)

// Good
achievement(
    title = "There and Back Again",
    description = "Earn at least 20,000 points from a single loop",
    points = 10,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_complete_loop() &&
              word(0x006A) >= 20000
)

// Good?
achievement(
    title = "The Long Way Around",
    description = "Earn at least 50,000 points from a single loop",
    points = 25,
    trigger = trigger_during_level() &&
              trigger_no_cheating() &&
              trigger_complete_loop() &&
              word(0x006A) >= 50000
)

// Good
achievement(
    title = "Let It Flow",
    description = "Pass through at least ten pipe segments after activating full flow",
    points = 5,
    trigger = !trigger_is_demo() &&
              never(trigger_flooz_stopped()) &&
              never(!trigger_full_flow()) &&
              trigger_pipes(10) &&
              trigger_no_cheating()
)

// Good
achievement(
    title = "Bonus Flow",
    description = "Pass through at least twelve pipe segments in a bonus round",
    points = 10,
    trigger = !trigger_is_demo() &&
              trigger_pipes(13) &&         // 13, because we don't count transition from start pipe to first pipe
              trigger_no_cheating() &&
              trigger_during_bonus_level()
)

// Good
achievement(
    title = "Bonus Loop",
    description = "Create a loop in a bonus round",
    points = 5,
    trigger = !trigger_is_demo() &&
              trigger_loops(1) &&
              trigger_no_cheating() &&
              trigger_during_bonus_level()
)

function trigger_score(score) {
    // the three bytes that make up the score are $048C, $048E, and $0490
    // to simplify the logic, we can look at the dword at $048E, but have
    // to have separate clauses for values at $048C.
    score_b1 = score % 256
    score_b2 = (score / 256) % 256
    score_b3 = (score / 65536)
    
    score_high = score_b3 * 65536 + score_b2
    return (dword(0x048E) > score_high || (dword(0x048E) == score_high && byte(0x048C) >= score_b1))
}

// Good
achievement(
    title = "Buckets of Flooz",
    description = "Have at least 100,000 points",
    points = 5,
    trigger = trigger_in_game() && 
              trigger_no_cheating() &&
              trigger_score(100000)
)

// Good?
achievement(
    title = "Tanks of Flooz",
    description = "Have at least 500,000 points",
    points = 10,
    trigger = trigger_in_game() &&
              trigger_no_cheating() &&
              trigger_score(500000)
)

// Good?
achievement(
    title = "Reservoir of Flooz",
    description = "Have at least 1,000,000 points",
    points = 25,
    trigger = trigger_in_game() &&
              trigger_no_cheating() &&
              trigger_score(1000000)
)

achievement(
    title = "So Much Flooz",
    description = "Have at least 500,000 points in mode C",
    points = 25,
    trigger = trigger_in_game() &&
              trigger_no_cheating() &&
              current_mode() == mode_c &&
              trigger_score(500000)              
)

leaderboard(
    title = "C-16 Plumber",
    description = "Highest score on Level 16 (Mode C)",
    start = byte(0x00B6) == 0 && current_level() == 16 && current_mode() == mode_c && !is_cheating(),
    submit = (trigger_level_complete() || bit7(0x0490) == 1) && 
             (current_screen() == screen_main_board || current_screen() == screen_paused),
    cancel = is_cheating(),
    value = (byte(0x0490) * 65536) + (byte(0x048E) * 256) + byte(0x048C)
)

