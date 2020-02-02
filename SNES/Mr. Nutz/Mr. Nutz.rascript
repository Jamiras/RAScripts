// Mr. Nutz
// #ID = 1041

// $0018A6: Health
function current_health() => word(0x0018A6)

// $001EC9: 01 - cheater mode activated
function cheat_mode() => byte(0x001EC9)

// $001ED2: Boss
function boss_id() => word(0x001ED2)

// $001ED6: Boss Health
function boss_health() => word(0x001ED6)

// $01B524: Stages
function current_stage() => word(0x01B524)

// $01B534: Stages
function current_stage2() => word(0x01B534)

// Ticket 24478: achievement popped when i collected the extra life near the end of the level<br>MD5:
//               f5889db38b2152fde80258c3a89f6a83<br>Emulator: RetroArch (Snes9x)
// Ticket 24446: Triggers if you grab the 1-up at the end of the boss level after beating the boss<br>MD5:
//               f5889db38b2152fde80258c3a89f6a83<br>Emulator: RetroArch (RA-1.7.8.4, Bnes 094 Balanced)
achievement(
    title = "Bested Octopus", description = "Eliminate the octopus with full health", points = 20,
    id = 34841, badge = "35943", published = "4/20/2016 6:28:11 PM", modified = "3/11/2019 9:18:51 AM",
    trigger = boss_id() == 1 && boss_health() == 0 && current_stage() == 40 && current_stage2() == 40 && 
              current_health() == 4 && never(cheat_mode() == 1)
)

stages = {
    1: "Woody Land 1",
    2: "Woody Land Secret 1",
    3: "Woody Land 2",
    4: "Woody Land Secret 2",
    5: "Woody Land 3",
    12: "Woody Land 4",
    11: "Woody Land Secret 3",
    10: "Woody Land 5",
    6: "Adventure Park 1",
    9: "Adventure Park Secret 1",
    13: "Adventure Park 2",
    7: "Adventure Park Secret 2",
    8: "Adventure Park 3",
    14: "Witch's House", // also Little Clown
    15: "The Living Room",
    16: "The Living Room",
    17: "Fowl Kitchen",
    18: "Wash Basin 1",
    19: "Wash Basin 2",
    20: "Wash Basin 3",
    22: "Wash Basin Secret",
    40: "Wash Basin 4",
    24: "Volcano Underpass 1",
    26: "Volcano Underpass 2",
    27: "Volcano Underpass Secret 1",
    28: "Volcano Underpass 3",
    29: "Volcano Underpass Secret 2",
    34: "Clouds", // also Frozen Nutz secret
    30: "Clouds",
    31: "Ograoum Papas",
    38: "Mean Streets 1",
    39: "Mean Streets 2",
    42: "Mean Streets 3",
    32: "Ice Scream",
    37: "Ice Scream",
    36: "Ice Scream",
    33: "Frozen Nutz 1",
    35: "Frozen Nutz 2",
    41: "Mr. Blizzard",
    100: "Epilogue",
}

function current_lives() => byte(0x1889) * -1 + 0xB7

rich_presence_conditional_display(current_stage() == 0, "Titles")

//rich_presence_conditional_display(byte(0x1b531) == 0, "Demo")

rich_presence_conditional_display(byte(0x1889) > 0xB7, "{0}, {1} lives",
    rich_presence_lookup("Stage", current_stage(), stages, fallback="Secret"),
    rich_presence_value("Lives", current_lives() + 16)
)

rich_presence_conditional_display(byte(0x1889) < 0xB0, "{0}, {1} lives",
    rich_presence_lookup("Stage", current_stage(), stages, fallback="Secret"),
    rich_presence_value("Lives", current_lives() - 6)
)

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", current_stage(), stages, fallback="Secret"),
    rich_presence_value("Lives", current_lives())
)