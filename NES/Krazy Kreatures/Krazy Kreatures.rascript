// Krazy Kreatures
// #ID = 10361
// md5: 786ddbe216cf0202009ba6a255570384

// 0026 - cursor X
// 0027 - cursor Y
// 00B9 - level (-1)
// 00BA - BCD score
// 00BB - BCD score x100
// 00BC - BCD score x10000
// 00BD - 1
// 00BE - 2
// 00BF - 7
// 00C4 - match directions (1=horizontal, 2=vertical, 4=down-to-right, 8-down-to-left)
// 00C5 - points for placed tile (3=10,4=20,5=30,6=40,7=50,8=60,29=200,2A=300)
// 00C6 - horizontal matching items
// 00C7 - vertical matching items
// 00C8 - down-to-right matching items
// 00C9 - down-to-left matching items
// 00CA - longest match
// 00CB - type
// 00CC - remaining empty spaces
// 00CD - next delivery timer
// 00CE - full screen countdown timer
// 00CF - end-of-level countdown timer
// 00DF - remaining matches required
// 0101 - game state (0=playing, score board or level select, 1=game over or menu)
// 0102 - mode (0=1P, 1=vs, 2=coop)
// 0103 - difficulty (0=easy, 1=medium, 2=hard)
// 0104 - game (3=klux)
// 0105 - starting level (-1)
// 030F - 1 in game, 0 in menus/game over/score board
// 03D2-04B1 = board (00=blank, 01=off limits, 02=scored, otherwise tile id)
// 05DB - maximum number of empty spaces

difficulty_easy = 0
difficulty_medium = 1
difficulty_hard = 2

difficulty_lowercase = {
    difficulty_easy: "easy",
    difficulty_medium: "medium",
    difficulty_hard: "hard",
}

difficulty_titlecase = {
    difficulty_easy: "Easy",
    difficulty_medium: "Medium",
    difficulty_hard: "Hard",
}

mode_solo = 0
mode_vs = 1
mode_coop = 2

modes = {
    mode_solo: "",
    mode_vs: "VS",
    mode_coop: "Co-op",
}

function current_level() => byte(0x00B9)
function current_difficulty() => byte(0x0103)
function current_mode() => byte(0x0102)

function trigger_in_game() => byte(0x030F) == 1
function trigger_in_klux() => trigger_in_game() && byte(0x104) == 3
function trigger_game_over() => byte(0x0101) == 0x01

function trigger_complete_level(level) {
   if (level == 32) {
       // when completing level 32, it doesn't advance the current_level. instead
       // we have to catch the end-of-level countdown timer ticking to 0 (CE=00, CF=01; next frame would 
       // be CE=FF, CF=00, but that also sets 0x030F (in game) to 0). The 0x5DB check ensure we don't trigger
       // going into level 32 since level 31 and 32 have a different number of empty spaces available.
       return trigger_in_game() && current_level() == level - 1 && byte(0x05DB) == 0x70 &&
              byte(0x0101) == 0 && byte(0x00DF) == 0 && word(0x00CE) == 0x0100
   }

   // for other levels just capture the current level being incremented
   return trigger_in_game() && current_level() == level && prev(current_level()) == level - 1
}

function trigger_difficulty(difficulty) {
    if (difficulty == difficulty_hard)
        return current_difficulty() == difficulty_hard
        
    return current_difficulty() >= difficulty
}

// ========================================================
// Stage achievements (240 points)
// -- To select levels 13-24, pause the game, hold A and press select 10 times. Then lose. The level 
//    select menu will now go up to 24.

function achievement_complete_level(level, difficulty, points) {
    title = "Wave " + level + " (" + difficulty_titlecase[difficulty] + ")"
    description = "Complete level " + level
    trigger = trigger_complete_level(level)

    if (difficulty == difficulty_hard) {
        description = description + " on hard"
        trigger = trigger && trigger_difficulty(difficulty_hard)
    } else if (difficulty == difficulty_medium) {
        description = description + " on medium or hard"
        trigger = trigger && trigger_difficulty(difficulty_medium)
    }

    achievement(title = title, description = description, points = points, trigger = trigger)
}

// Easy (35)
achievement_complete_level(7, difficulty_easy, 5)
achievement_complete_level(11, difficulty_easy, 5)
achievement_complete_level(13, difficulty_easy, 5)
achievement_complete_level(19, difficulty_easy, 5)
achievement_complete_level(24, difficulty_easy, 5)
achievement_complete_level(28, difficulty_easy, 5)
achievement_complete_level(32, difficulty_easy, 10)

// Medium (80)
achievement_complete_level(7, difficulty_medium, 10)
achievement_complete_level(11, difficulty_medium, 10)
achievement_complete_level(13, difficulty_medium, 10)
achievement_complete_level(19, difficulty_medium, 10)
achievement_complete_level(24, difficulty_medium, 10)
achievement_complete_level(28, difficulty_medium, 10)
achievement_complete_level(32, difficulty_medium, 25)

// Hard (125)
achievement_complete_level(7, difficulty_hard, 10)
achievement_complete_level(11, difficulty_hard, 10)
achievement_complete_level(13, difficulty_hard, 10)
achievement_complete_level(19, difficulty_hard, 10)
achievement_complete_level(24, difficulty_hard, 10)
achievement_complete_level(28, difficulty_hard, 25)
achievement_complete_level(32, difficulty_hard, 50)

// ========================================================
// Perfect levels (80 points)

function achievement_perfect_level(level, points) {
    achievement(
        title = "Wave " + level + " (Perfect)",
        description = "Completely clear level " + level + " (any difficulty)",
        points = points,
        trigger = trigger_complete_level(level) &&
                  byte(0x05DA) == byte(0x05DB)
    )
}

achievement_perfect_level(1, 5)
achievement_perfect_level(2, 10)
achievement_perfect_level(8, 10)
achievement_perfect_level(15, 10)
achievement_perfect_level(16, 10)
achievement_perfect_level(18, 10)
achievement_perfect_level(25, 10)

// ========================================================
// Match achievements (55 points)

function horizontal_match_length() => byte(0x00C6)
function vertical_match_length() => byte(0x00C7)
function longest_match_length() => byte(0x00CA)
function trigger_match(count) => trigger_in_game() && longest_match_length() >= count

function achievement_match_length(label, count, points) {
    achievement(
        title = label + "-in-a-row",
        description = "Match at least " + count + " tiles in a row (horizontally, vertically, or diagonally)",
        points = points,
        trigger = trigger_match(count)
    )
}

achievement_match_length("Seven", 7, 2)
achievement_match_length("Nine", 9, 5)
achievement_match_length("Eleven", 11, 10)

achievement(
    title = "Medium Cross",
    description = "Match a vertical column of at least 5 tiles and a horizontal row of at least 5 tiles with one tile",
    points = 3,
    trigger = trigger_in_game() && vertical_match_length() >= 5 && horizontal_match_length() >= 5
)

achievement(
    title = "Large Cross",
    description = "Match a vertical column of at least 7 tiles and a horizontal row of at least 7 tiles with one tile",
    points = 10,
    trigger = trigger_in_game() && vertical_match_length() >= 7 && horizontal_match_length() >= 7
)

achievement(
    title = "Every Which Way",
    description = "Match a column, row, and both diagonals with one tile",
    points = 10,
    trigger = trigger_in_game() && byte(0x00C4) == 0x0F
)

// ========================================================
// Score achievements (25 points)

achievement(
    title = "High Score",
    description = "Score at least 20,000 points",
    points = 5,
    trigger = trigger_in_game() && byte(0x00BC) >= 0x02
)

achievement(
    title = "Higher Score",
    description = "Score at least 100,000 points",
    points = 10,
    trigger = trigger_in_game() && byte(0x00BC) >= 0x10
)

achievement(
    title = "Klux",
    description = "Score at least 3,000 points in Klux",
    points = 5,
    trigger = trigger_in_klux() && (byte(0x00BC) >= 0 || byte(0x00BB) >= 0x30)
)

// ========================================================
// Leaderboard

function score_leaderboard(difficulty) {
    leaderboard(
        title = "High Score (" + difficulty_titlecase[difficulty] + ")", 
        description = "Highest score on " + difficulty_lowercase[difficulty] + " difficulty",
        start = byte(0x002B) == 0x95 && current_difficulty() == difficulty, // triggers on game over screen to not obscure puzzle
        cancel = byte(0x002B) == 0,
        submit = byte(0x002B) != 0x95,
        value = high4(0x00BC) * 100000 + low4(0x00BC) * 10000 + high4(0x00BB) * 1000 + low4(0x00BB) * 100 + high4(0x00BA) * 10 + low4(0x00BA)
    )
}

score_leaderboard(difficulty_easy)
score_leaderboard(difficulty_medium)
score_leaderboard(difficulty_hard)

// ========================================================
// Rich Presence

level_lookup = {
    0x00: "Menu",
    0x01: "Menu",
    0x02: "Menu",
    0x03: "Menu",
    0x04: "Menu",
    0x05: "Menu",
    0x06: "Menu",
    0x07: "Menu",
    0x08: "Menu",
    0x09: "Menu",
    0x0A: "Menu",
    0x0B: "Menu",
    0x0C: "Menu",
    0x0D: "Menu",
    0x0E: "Menu",
    0x0F: "Menu",
    0x10: "Menu",
    0x11: "Menu",
    0x12: "Menu",
    0x13: "Menu",
    0x14: "Menu",
    0x15: "Menu",
    0x16: "Menu",
    0x17: "Menu",
    0x18: "Menu",
    0x19: "Menu",
    0x1A: "Menu",
    0x1B: "Menu",
    0x1C: "Menu",
    0x1D: "Menu",
    0x1E: "Menu",
    0x1F: "Menu",
    0x20: "Wave 1",
    0x21: "Wave 2",
    0x22: "Wave 3",
    0x23: "Wave 4",
    0x24: "Wave 5",
    0x25: "Wave 6",
    0x26: "Wave 7",
    0x27: "Wave 8",
    0x28: "Wave 9",
    0x29: "Wave 10",
    0x2A: "Wave 11",
    0x2B: "Wave 12",
    0x2C: "Wave 13",
    0x2D: "Wave 14",
    0x2E: "Wave 15",
    0x2F: "Wave 16",
    0x30: "Wave 17",
    0x31: "Wave 18",
    0x32: "Wave 19",
    0x33: "Wave 20",
    0x34: "Wave 21",
    0x35: "Wave 22",
    0x36: "Wave 23",
    0x37: "Wave 24",
    0x38: "Wave 25",
    0x39: "Wave 26",
    0x3A: "Wave 27",
    0x3B: "Wave 28",
    0x3C: "Wave 29",
    0x3D: "Wave 30",
    0x3E: "Wave 31",
    0x3F: "Wave 32",
    0x80: "Klux",
}

difficulty_lookup = {}
for difficulty in difficulty_titlecase {
    difficulty_lookup[difficulty] = ""
    difficulty_lookup[difficulty + 4] = difficulty_titlecase[difficulty]
}

mode_lookup = {}
for mode in modes {
    mode_lookup[mode] = ""
    mode_lookup[mode + 4] = modes[mode]
}

rich_presence_display("{0} {1}{2}",
    rich_presence_lookup("Wave", bit1(0x104) * 64 + bit0(0x30F) * 32 + current_level(), level_lookup),
    rich_presence_lookup("Difficulty", bit0(0x30F) * 4 + current_difficulty(), difficulty_lookup),
    rich_presence_lookup("Mode", bit0(0x30F) * 4 + current_mode(), mode_lookup)
)
