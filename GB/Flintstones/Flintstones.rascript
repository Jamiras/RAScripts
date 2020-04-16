// Flintstones, The
// #ID = 4149

// $C1F7: area value -
//        09=act 1 complete,16=act 2, 1e=act3, 27=act 4, 2f=act 5
//        38=act 6, 45=act 7 - 46=end screen
function area() => byte(0x00C1F7)

achievement(
    title = "Beat act 1", description = "Beat act 1", points = 5,
    id = 8440, badge = "00136", published = "5/22/2014 8:23:30 AM", modified = "1/31/2020 10:02:31 AM",
    trigger = area() == 9 && unless(byte(0x00C130) == 1)
)

achievement(
    title = "Beat act 2", description = "Beat act 2", points = 5,
    id = 8441, badge = "00136", published = "5/22/2014 8:23:32 AM", modified = "1/31/2020 10:02:30 AM",
    trigger = area() == 22 && unless(byte(0x00C130) == 1)
)

achievement(
    title = "Beat act 3", description = "Beat act 3", points = 5,
    id = 8442, badge = "00136", published = "5/22/2014 8:23:33 AM", modified = "1/31/2020 10:02:29 AM",
    trigger = area() == 30 && unless(byte(0x00C130) == 1)
)

achievement(
    title = "Beat act 4", description = "Beat act 4", points = 5,
    id = 8443, badge = "00136", published = "5/22/2014 8:23:34 AM", modified = "1/31/2020 10:02:28 AM",
    trigger = area() == 39 && unless(byte(0x00C130) == 1)
)

// Ticket 25446: Achievement triggered  before beating boss.<br>MD5: Unknown<br>Emulator: RetroArch (VBA-M 2.1.3)
achievement(
    title = "Beat act 5", description = "Beat act 5", points = 5,
    id = 8444, badge = "00136", published = "5/22/2014 8:23:35 AM", modified = "1/31/2020 10:02:27 AM",
    trigger = area() == 48 && unless(byte(0x00C130) == 1)
//    trigger = area() == 47 && unless(byte(0x00C130) == 1)
)

achievement(
    title = "Beat act 6", description = "Beat act 6", points = 5,
    id = 8445, badge = "00136", published = "5/22/2014 8:23:37 AM", modified = "1/31/2020 10:02:25 AM",
    trigger = area() == 57 && unless(byte(0x00C130) == 1)
)

achievement(
    title = "Beat the game", description = "Beat the game", points = 10,
    id = 8446, badge = "00136", published = "5/22/2014 8:23:42 AM", modified = "1/31/2020 10:02:24 AM",
    trigger = area() == 70 && unless(byte(0x00C130) == 1)
)

function lives() => byte(0x00C139) * 10 + byte(0x00C13A)

levels = {
    1: "Act 1",
    2: "Act 1",
    3: "Act 1",
    4: "Act 1",
    5: "Act 1",
    6: "Act 1",
    7: "Act 1",
    8: "Act 1",
    9: "Act 1", // complete
    10: "Act 1", // minigame
    11: "Act 2", // story
    12: "Act 2",
    13: "Act 2",
    14: "Act 2",
    15: "Act 2",
    16: "Act 2",
    17: "Act 2",
    18: "Act 2",
    19: "Act 2",
    20: "Act 2",
    21: "Act 2",
    22: "Act 2", // complete
    23: "Act 2", // minigame
    24: "Act 3", // story
    25: "Act 3",
    26: "Act 3",
    27: "Act 3",
    28: "Act 3",
    29: "Act 3",
    30: "Act 3", // complete
    31: "Act 3", // minigame
    32: "Act 4", // story
    33: "Act 4",
    34: "Act 4",
    35: "Act 4",
    36: "Act 4",
    37: "Act 4",
    38: "Act 4",
    39: "Act 4", // complete
    40: "Act 4", // minigame
    41: "Act 5", // story
    42: "Act 5",
    43: "Act 5",
    44: "Act 5",
    45: "Act 5",
    46: "Act 5",
    47: "Act 5",
    48: "Act 5", // complete
    49: "Act 5", // minigame
    50: "Act 6", // story
    51: "Act 6",
    52: "Act 6",
    53: "Act 6",
    54: "Act 6",
    55: "Act 6",
    56: "Act 6",
    57: "Act 6", // complete
    58: "Act 6", // minigame
    59: "Act 7",
    60: "Act 7",
    61: "Act 7",
    62: "Act 7",
    63: "Act 7",
    64: "Act 7",
    65: "Act 7",
    66: "Act 7",
    67: "Act 7",
    68: "Act 7",
    69: "Act 7", // complete
    70: "Act 7", // victory
}

rich_presence_conditional_display(area() == 0, "Titles")

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Level", area(), levels),
    rich_presence_value("Lives", lives())
)