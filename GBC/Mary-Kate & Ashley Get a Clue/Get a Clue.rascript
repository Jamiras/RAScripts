// Mary-Kate & Ashley: Get a Clue!
// #ID = 11592

// A=Jump, B=Action, Select=switch characters
// collect three papers in a level for the solution

// TODO: test game over!!

function selected_character() => byte(0xDBC5)
character_ashley = 0    // green: activates switches, throws clue
character_clue = 1      // dog  : girls can stand on, can swim
character_mary_kate = 2 // blue : ashley can stand on, jumps high

// five cases, 10 points each?
// challenge - without dying

function current_case() => byte(0xDC83)
function current_case_in_stage() => byte(0xDCAC)
function current_stage() => byte(0xDDBA)
function bonus_stage_time() => byte(0xDC65)
function in_bonus() => byte(0xDC68) == 0
function lives() => bcd(byte(0xDC6A)) - 1

cases = {
    0: "Ballet Bandit",
    1: "Missing Mummy",
    2: "Rock & Roll Mystery",
    3: "Green Ghost",
    4: "Summer Camp Caper"
}

stages = {
    1: "Stage 1-1", // XXXXXX - Case of the Ballet Bandit
    2: "Stage 1-2",
    3: "Stage 1-3",
    4: "Stage 1-4",
    5: "Stage 1-5",
    6: "Stage 1-6",
    7: "Stage 1-7",
    8: "Stage 1-8",
    9: "Stage 1-9",
    10: "Stage 1-10",
    13: "Stage 2-1", // MHNTGF - Case of the Missing Mummy
    14: "Stage 2-2",
    15: "Stage 2-3",
    16: "Stage 2-4",
    17: "Stage 2-5",
    18: "Stage 2-6",
    19: "Stage 2-7",
    20: "Stage 2-8",
    21: "Stage 2-9",
    22: "Stage 2-10",
    25: "Stage 3-1", // NLBRTC - Case of the Rock & Roll Mystery
    26: "Stage 3-2",
    27: "Stage 3-3",
    28: "Stage 3-4",
    29: "Stage 3-5",
    30: "Stage 3-6",
    31: "Stage 3-7",
    32: "Stage 3-8",
    33: "Stage 3-9",
    34: "Stage 3-10",
    37: "Stage 4-1", // RGTMNL - Case of the Green Ghost
    38: "Stage 4-2",
    39: "Stage 4-3",
    40: "Stage 4-4",
    41: "Stage 4-5",
    42: "Stage 4-6",
    43: "Stage 4-7",
    44: "Stage 4-8",
    45: "Stage 4-9",
    46: "Stage 4-10",
    49: "Stage 5-1", // FBLHCH - Case of the Summer Camp Caper
    50: "Stage 5-2",
    51: "Stage 5-3",
    52: "Stage 5-4",
    53: "Stage 5-5",
    54: "Stage 5-6",
    55: "Stage 5-7",
    56: "Stage 5-8",
    57: "Stage 5-9",
    58: "Stage 5-10",
}

rich_presence_conditional_display(current_case_in_stage() == 0, "Titles")
rich_presence_conditional_display(current_case_in_stage() > 5, "Titles")

rich_presence_conditional_display(in_bonus(), "Stage {0}-Bonus: Case of the {1} | {2} Lives",
    rich_presence_value("Case", current_case() + 1),
    rich_presence_lookup("CaseName", current_case(), cases),
    rich_presence_value("Lives", lives())
)

rich_presence_conditional_display(current_stage() == 99, "Stage {0}-11: Case of the {1} | {2} Lives",
    rich_presence_value("Case", current_case() + 1),
    rich_presence_lookup("CaseName", current_case(), cases),
    rich_presence_value("Lives", lives())
)

rich_presence_display("{0}: Case of the {1} | {2} Lives",
    rich_presence_lookup("Stage", current_stage(), stages),
    rich_presence_lookup("CaseName", current_case(), cases),
    rich_presence_value("Lives", lives())
)

// F8
achievement("Misplaced", "Solve the Case of the Ballet Bandit", 5,
    trigger = current_case() == 0 && !in_bonus() && current_stage() == 99 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)

// F9
achievement("Relocated", "Solve the Case of the Missing Mummy", 10,
    trigger = current_case() == 1 && !in_bonus() && current_stage() == 99 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)

// F10
achievement("Desperation", "Solve the Case of the Rock & Roll Mystery", 10,
    trigger = current_case() == 2 && !in_bonus() && current_stage() == 99 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)

// F7
achievement("For His Brother", "Solve the Case of the Green Ghost", 10,
    trigger = current_case() == 3 && !in_bonus() && current_stage() == 99 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)

// F6
achievement("Framed", "Solve the Case of the Summer Camp Caper", 10,
    trigger = current_case() == 4 && !in_bonus() && current_stage() == 99 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)

achievement("Solve the Crime", "Collect enough hearts to have 15 lives in reserve", 3,
    trigger = current_case_in_stage() != 0 &&
              lives() == 15 && prev(lives()) == 14
)

achievement("By Dinner Time", "Complete a bonus stage before the timer expires", 2,
    trigger = in_bonus() && current_stage() == 99 &&
              bonus_stage_time() > 0 &&
              byte(0xDCE4) == 1 && byte(0xDD08) == 0xFF
)