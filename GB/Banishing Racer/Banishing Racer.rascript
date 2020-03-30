// Banishing Racer
// #ID = 3609

// $C20B: Level
function level() => byte(0x00C20B)

// $C595: ff = 0x01 invincibility
function invincibility() => byte(0x00C595)

function lives() => byte(0x00C21D)

achievement(
    title = "San Francisco", description = "Complete Stage 1 - San Francisco", points = 5,
    id = 6697, badge = "07059", published = "3/31/2014 1:57:19 AM", modified = "1/31/2020 10:03:29 AM",
    trigger = once(level() == 1) && once(level() == 2) && level() == 3 && 
              never(invincibility() == 255) && never(level() == 0)
)

achievement(
    title = "Las Vegas", description = "Complete Stage 2 - Las Vegas", points = 5,
    id = 6698, badge = "07060", published = "3/31/2014 1:57:23 AM", modified = "1/31/2020 10:03:28 AM",
    trigger = once(level() == 3) && once(level() == 4) && once(level() == 5) && level() == 6 && 
              never(invincibility() == 255) && never(level() == 0)
)

achievement(
    title = "Denver", description = "Complete Stage 3 - Denver", points = 5,
    id = 6699, badge = "07061", published = "3/31/2014 1:57:26 AM", modified = "1/31/2020 10:03:27 AM",
    trigger = once(level() == 6) && once(level() == 7) && once(level() == 8) && level() == 9 && 
              never(invincibility() == 255) && never(level() == 0)
)

achievement(
    title = "Detroit", description = "Complete Stage 4 - Detroit", points = 10,
    id = 6700, badge = "07063", published = "3/31/2014 1:57:29 AM", modified = "1/31/2020 10:03:26 AM",
    trigger = once(level() == 9) && once(level() == 10) && once(level() == 11) && 
              level() == 12 && never(invincibility() == 255) && never(level() == 0)
)

// Ticket 24683: Completed game, made it all the way through end credits. Didn't trigger.<br>MD5:
//               8fdffb08770609255ec3cd314f79f976<br>Emulator: RetroArch (VBA-M 2.1.3 2622db1)
// Ticket 24126: Beat the game and it didn't trigger. Have to beat New York to see Final Boss<br>MD5:
//               Unknown<br>Emulator: RetroArch (Gambatte)
// Ticket 23758: That was really hard to win. The spring smileys, the ninja turtles, the slow-scrolling level, and the
//               transformer boss with all the rockets. I spent hours
//               MD5: Unknown
//               Emulator: RetroArch (Gearboy)
// Ticket 19058: After beating the game it doesn't trigger
//               MD5: 8fdffb08770609255ec3cd314f79f976
//               Emulator: RAVBA
achievement(
    title = "New York", description = "Complete Stage 5 - New York", points = 25,
    id = 6701, badge = "07065", published = "3/31/2014 1:57:32 AM", modified = "1/31/2020 10:03:25 AM",
    trigger = once(level() == 12) && once(level() == 13) && once(level() == 14) && 
              byte(0x00C204) == 3 && never(invincibility() == 255) && never(byte(0xC206) == 0)
//    trigger = once(level() == 12) && once(level() == 13) && repeated(10, level() == 14) && 
//              repeated(10, byte(0x00C204) == 3) && never(invincibility() == 255) && never(level() == 0)
)

achievement(
    title = "Nice Score", description = "Reach 20000 Score", points = 5,
    id = 6702, badge = "07067", published = "3/31/2014 2:21:38 AM", modified = "1/31/2020 10:03:24 AM",
    trigger = once(byte(0x00C20D) >= 208) && repeated(10, byte(0x00C20E) >= 7) && never(byte(0x00C20E) < 7) && 
              never(invincibility() == 255) && never(level() == 0)
)

achievement(
    title = "Good Score", description = "Reach 50000 Score", points = 10,
    id = 6703, badge = "07069", published = "3/31/2014 2:21:41 AM", modified = "1/31/2020 10:03:23 AM",
    trigger = once(byte(0x00C20D) >= 136) && repeated(10, byte(0x00C20E) >= 19) && never(byte(0x00C20E) < 19) && 
              never(invincibility() == 255) && never(level() == 0)
)

levels = {
    0: "1-1",
    1: "1-2",
    2: "1-3",
    3: "2-1",
    4: "2-2",
    5: "2-3",
    6: "3-1",
    7: "3-2",
    8: "3-3",
    9: "4-1",
    10: "4-2",
    11: "4-3",
    12: "5-1",
    13: "5-2",
    14: "5-3"
}

rich_presence_conditional_display(byte(0xC206) == 0, "Titles")
rich_presence_conditional_display(byte(0xC204) == 3, "Ending")

rich_presence_conditional_display(lives() == 0xFF, "Stage {0}, Game Over", 
    rich_presence_lookup("Level", level(), levels)    
)

rich_presence_display("Stage {0}, {1} lives",
    rich_presence_lookup("Level", level(), levels),
    rich_presence_value("Lives", lives())
)
