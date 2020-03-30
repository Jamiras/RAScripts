// Disney's Magical Quest 3 Starring Mickey & Donald
// #ID = 572

// $004ADD: Level ID
function level() => byte(0x004ADD)
levels = {
    1: "Stage 1", // 1-1
    2: "Stage 1", // 1-2
    3: "Stage 1", // 1-3
    30: "Stage 1", // 1-Boss
    4: "Stage 2", // 2-0
    5: "Stage 2", // 2-1
    6: "Stage 2", // 2-2
    7: "Stage 2", // 2-3
    8: "Stage 2", // 2-Boss
    26: "Stage 3", // 3-1
    27: "Stage 3", // 3-2
    28: "Stage 3", // 3-3
    29: "Stage 3", // 3-Boss
    9: "Stage 4", // 4-1
    10: "Stage 4", // 4-2
    11: "Stage 4", // 4-3
    12: "Stage 4", // 4-Boss
    13: "Stage 5", // 5-1
    14: "Stage 5", // 5-2
    15: "Stage 5", // 5-Boss
    16: "Stage 6", // 6-1
    17: "Stage 6", // 6-2
    18: "Stage 6", // 6-Boss
    19: "Stage 7", // 7-1
    20: "Stage 7", // 7-2
    21: "Stage 7", // 7-3
    22: "Stage 7", // 7-4
    69: "Stage 7", // 7-5
    23: "Stage 7", // 7-6
    24: "Stage 7", // 7-7
    25: "Stage 7", // 7-Boss
}

// $01AA3F: Hearts Cotainers?
function hearts() => byte(0x01AA3F)

// $01AA42: Lives Remaining
function lives() => byte(0x01AA42)

// $037FFE: Difficulty Setting: 00-Easy, 02-Normal, 04-Hard
function current_difficulty() => byte(0x037FFE)
difficulty_easy = 0
difficulty_normal = 2
difficulty_hard = 4

difficulties = {
    difficulty_easy: "Easy",
    difficulty_normal: "Normal",
    difficulty_hard: "Hard"
}

// $038036: Player Character: 00-Mickey, 02-Donald
function current_character() => byte(0x038036)
character_mickey = 0
character_donald = 2

characters = {
    character_mickey: "Mickey",
    character_donald: "Donald",
}

rich_presence_conditional_display(level() == 0, "Titles")
rich_presence_display("{0}, {1} {2}, {3} lives, {4} hearts",
    rich_presence_lookup("Character", current_character(), characters),
    rich_presence_lookup("Level", level(), levels),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_value("Lives", lives()),
    rich_presence_value("Hearts", hearts())
)
