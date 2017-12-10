// Pinball
// #ID = 1877
// md5: 2f881b682e3e75084081f2b0d179522c (JU)
// md5: 35f89365209e77450855cfaa047ca3d7 (E) [!]

function current_screen() => byte(0x000003)
function is_menu() => current_screen() == 1
function is_demo() => byte(0x000004) == 1

// 0x03 = 1 is menu, 0x04 = 1 is demo, both are 0 when playing, and 0x04 is FF on initial load
function in_game() => never(current_screen() != 0) && never(byte(0x0004) != 0) 

// 2902: Unlocks in the demo
achievement(
    title = "Evolution!", description = "Right order [ Nothing ][ Egg ][ Chicken ]", points = 5,
    id = 24113, badge = "24764", published = "6/24/2015 10:42:45 PM", modified = "9/13/2016 1:57:01 AM",
    trigger = in_game() && byte(0x00012D) == 0x06 && byte(0x00012E) == 0x00 && byte(0x00012F) == 0xFF
)

achievement(
    title = "Bump, bump...", description = "Make eggs bump or bumpers from eggs.", points = 5,
    id = 24114, badge = "24773", published = "6/24/2015 10:44:08 PM", modified = "9/13/2016 1:57:07 AM",
    trigger = in_game() && byte(0x000129) == 0x01 && byte(0x00012A) == 0x01
)

achievement(
    title = "Emergency Exit", description = "Who let the balls out? Who, who, who...", points = 5,
    id = 24115, badge = "24757", published = "6/24/2015 10:44:23 PM", modified = "9/13/2016 1:57:13 AM",
    trigger = byte(0x000131) == 0xFE && never(is_menu()) && never(is_demo())
)

achievement(
    title = "Four Targets Down", description = "Destroy 4 paddles on the left.", points = 5,
    id = 24116, badge = "24774", published = "6/24/2015 10:44:41 PM", modified = "9/13/2016 1:57:17 AM",
    trigger = byte(0x000130) == 0xF0 && never(is_menu()) && never(is_demo())
)

// 9565: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "Extra Ball", description = "One more, please.", points = 10,
    id = 24117, badge = "24765", published = "6/24/2015 10:46:29 PM", modified = "6/27/2015 2:11:15 AM",
    trigger = in_game() && byte(0x00010F) >= 0x05 // 50000 points
)

// 8940: Extra Ball Plus triggered after starting a new game after earning a normal extra ball in my first game.<br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "Extra Ball Plus", description = "Get one more ball without losing any!", points = 15,
    id = 24118, badge = "24763", published = "6/24/2015 10:46:35 PM", modified = "6/27/2015 1:48:36 AM",
    trigger = in_game() && byte(0x00010F) >= 0x05 && byte(0x000151) == 0x03 && byte(0x00010E) == 0x00 // 50k and 3 balls
)

achievement(
    title = "Penguinotery 777", description = "777 get, even dead.", points = 15,
    id = 24119, badge = "24755", published = "6/24/2015 10:46:48 PM", modified = "6/27/2015 1:39:36 AM",
    trigger = in_game() && never(byte(0x000118) != 0x02) && never(byte(0x000119) != 0x02) && never(byte(0x00011A) != 0x02) && repeated(100, byte(0x000118) == 0x02) && repeated(100, byte(0x000119) == 0x02) && repeated(100, byte(0x00011A) == 0x02)
)

achievement(
    title = "Royal Flush", description = "Have you ever played Poker?", points = 15,
    id = 24120, badge = "24754", published = "6/24/2015 10:46:53 PM", modified = "9/13/2016 1:57:20 AM",
    trigger = byte(0x000128) == 0xF8 && never(is_menu()) && never(is_demo())
)

// 9566: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
// 8941: "It's over 9 hundred!" triggered when I had the counter at 500 on one ball, then at 300 on my next ball after it reset upon losing my first ball.<br/>MD5: 2f881b682e3e75084081f2b0d179522c
// 2821: I think I clicked the counter 9 times. But this was after I lost my first ball, and because of that the counter was set on 000 again. When I clicked the counter playing my second ball, the said counter was set on 300 while I got the achievement...
achievement(
    title = "It's over 9 hundred!", description = "Click top left counter to set more than 900.", points = 15,
    id = 24121, badge = "24775", published = "6/24/2015 10:47:08 PM", modified = "6/27/2015 2:25:12 AM",
    trigger = in_game() && low4(0x0000CF) >= 0x08
)

achievement(
    title = "Seal Teaser", description = "Leave just one ball in top left tunel", points = 20,
    id = 24122, badge = "24762", published = "6/24/2015 10:47:12 PM", modified = "9/13/2016 1:57:24 AM",
    trigger = repeated(100, byte(0x0000D0) == 0x01) && in_game()
)

achievement(
    title = "Got ya, babe!", description = "Catch her!", points = 10,
    id = 24123, badge = "24756", published = "6/24/2015 10:48:07 PM", modified = "9/13/2016 1:57:28 AM",
    trigger = repeated(50, byte(0x00011C) == 0x7C) && in_game() && never(byte(0x00011C) == 0x00)
)

achievement(
    title = "Got ya, ball!", description = "What can girl give you? Ball is the future, Mario!", points = 10,
    id = 24124, badge = "24759", published = "6/24/2015 10:48:11 PM", modified = "9/13/2016 1:57:31 AM",
    trigger = repeated(20, byte(0x00011C) == 0x94) && never(byte(0x00011C) == 0x00) && in_game()
)

// 10296: Triggered when i opened the rom.<br/>MD5: 35f89365209e77450855cfaa047ca3d7
// 9567: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
// 2085: Hi, this not worked to me, the value 010e continue 00, with 03 balls and score 102.630, playing on mode B. thanks. :)
achievement(
    title = "Invisible Flippers", description = "Make them invisible!", points = 15,
    id = 24125, badge = "24760", published = "6/24/2015 10:48:16 PM", modified = "6/27/2015 1:48:56 AM",
    trigger = in_game() && byte(0x00010E) >= 0x01 // 100k
)

// 10297: Triggered when i opened the rom.<br/>MD5: 35f89365209e77450855cfaa047ca3d7
// 9568: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "Visible Flippers", description = "Get them back.", points = 20,
    id = 24126, badge = "24761", published = "6/24/2015 10:48:20 PM", modified = "6/27/2015 1:49:01 AM",
    trigger = in_game() && byte(0x00010E) >= 0x01 && never(byte(0x00010F) <= 0x04) // 150k
)

// 10298: Triggered when i opened the rom.<br/>MD5: 35f89365209e77450855cfaa047ca3d7
// 9569: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "TOP 1", description = "Get 200k points", points = 25,
    id = 24127, badge = "24766", published = "6/24/2015 10:48:26 PM", modified = "6/27/2015 2:11:21 AM",
    trigger = in_game() && byte(0x00010E) >= 0x02
)

// 10299: Triggered when i opened the rom.<br/>MD5: 35f89365209e77450855cfaa047ca3d7
// 9570: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "TOP 2", description = "Get 300k points", points = 25,
    id = 24128, badge = "24767", published = "6/24/2015 10:48:29 PM", modified = "6/27/2015 2:11:25 AM",
    trigger = in_game() && byte(0x00010E) >= 0x03
)

// 10300: Triggered when i opened the rom.<br/>MD5: 35f89365209e77450855cfaa047ca3d7
// 9571: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "TOP 3", description = "Get 400k points", points = 30,
    id = 24129, badge = "24768", published = "6/24/2015 10:48:34 PM", modified = "6/27/2015 2:11:31 AM",
    trigger = in_game() && byte(0x00010E) >= 0x04
)

achievement(
    title = "Heavy TOP 1", description = "Get 100k points with heavy balls in 1P Game B ", points = 30,
    id = 24130, badge = "24769", published = "6/24/2015 10:48:38 PM", modified = "6/27/2015 2:11:34 AM",
    trigger = in_game() && repeated(30, byte(0x000113) >= 0x01) && once(byte(0x00014F) == 0x01)
)

achievement(
    title = "Heavy TOP 2", description = "Get 200k points with heavy balls in 1P Game B ", points = 35,
    id = 24131, badge = "24770", published = "6/24/2015 10:48:41 PM", modified = "6/27/2015 2:11:38 AM",
    trigger = in_game() && repeated(30, byte(0x000113) >= 0x02) && once(byte(0x00014F) == 0x01)
)

achievement(
    title = "Heavy TOP 3", description = "Get 300k points with heavy balls in 1P Game B ", points = 40,
    id = 24132, badge = "24771", published = "6/24/2015 10:48:44 PM", modified = "6/27/2015 2:11:41 AM",
    trigger = in_game() && repeated(30, byte(0x000113) >= 0x03) && once(byte(0x00014F) == 0x01)
)

// 9572: <br/>MD5: 2f881b682e3e75084081f2b0d179522c
achievement(
    title = "Insane Score", description = "Get 500k points", points = 50,
    id = 24133, badge = "24772", published = "6/24/2015 10:48:49 PM", modified = "6/27/2015 2:11:46 AM",
    trigger = in_game() && byte(0x00010E) >= 0x05
)

modes = {
    0: "1P Game A",
    1: "1P Game B",
    2: "2P Game A",
    3: "2P Game B",
    4: "Demo",
    8: "Menu",
    9: "Menu",
   10: "Menu",
   11: "Menu",
}

rich_presence_display("{0}: {1} points, {2} balls",
    rich_presence_lookup("Mode", byte(0x014F) + byte(0x0004) * 4 + byte(0x0003) * 8, modes),
    rich_presence_value("Score", byte(0x0100) * 100000 + byte(0x0101) * 10000 + byte(0x0102) * 1000 + byte(0x0103) * 100 + byte(0x0104) * 10),
    rich_presence_value("Balls", byte(0x0151))
)
