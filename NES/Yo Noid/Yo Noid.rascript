// Yo! Noid
// #ID = 2099

// $0070: mode (0=titles,2=level,3=scoring,7=gameover,10=pizza_contest,11=intro)
function mode() => byte(0x0070)

// $0077: mode (0=playing, 0x40=demo, 0x80=not-playing)
function playing() => byte(0x0077)

// $00C0: STAGE PROGESS
function stage_progress() => byte(0x0000C0)

// $00D3: END STAGE
function end_stage() => byte(0x0000D3)

// $00DE: Invincible - 00 - no - 01 yes
function invincible() => byte(0x0000DE)

// $0329: STAGE
function current_stage() => byte(0x000329)

// $0CB1: LIVES: x0
function lives_tens() => low4(0x0004B1)

// $0CB2: LIVES: 0x
function lives_ones() => low4(0x0004B2)

// $0CDA: SCORE: x00.000
function score_hundred_thousands() => byte(0x000CDA)

// Ticket 25749: I got this achievement during Stage 1's ending. I picked the II card, and it gave it to me. I didn't
//               get invincibility, nor was I ever invincible.
//               
//               (ROM Region is US)<br>MD5: Unknown<br>Emulator: RetroArch (NesTopia UE)
// Ticket 24925: Random trigerred after 3 level<br>MD5: Unknown<br>Emulator: RANes
// Ticket 13331: Triggered when I selected the II card during pizza eating contest
//               MD5: 107c2ac2d5998d3490db832d5d77a5f4
achievement(
    title = "Can't touch this!", description = "Become Invincible!", points = 5,
    id = 9333, badge = "23905", published = "6/24/2014 12:49:20 AM", modified = "6/7/2015 8:17:39 PM",
    trigger = invincible() == 1 && mode() == 2 && playing() == 0
//    trigger = invincible() == 1
)

function trigger_complete_stage(stage) => current_stage() == stage && mode() == 3

achievement(
    title = "Stage 1", description = "Complete Stage 1", points = 10,
    id = 23422, badge = "23795", published = "6/4/2015 2:01:55 PM", modified = "6/7/2015 8:07:18 PM",
    trigger = trigger_complete_stage(1)
//    trigger = current_stage() == 1 && never(current_stage() != 1) && end_stage() == 255 && never(end_stage() != 255)
)

achievement(
    title = "Stage 2", description = "Complete Stage 2", points = 10,
    id = 23423, badge = "23796", published = "6/4/2015 2:23:33 PM", modified = "6/7/2015 8:39:46 PM",
    trigger = trigger_complete_stage(2)
//    trigger = current_stage() == 2 && never(current_stage() != 2) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 3", description = "Complete Stage 3", points = 10,
    id = 23425, badge = "23797", published = "6/4/2015 2:31:55 PM", modified = "6/7/2015 8:39:48 PM",
    trigger = trigger_complete_stage(3)
//    trigger = current_stage() == 3 && never(current_stage() != 3) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

// Ticket 24924: Doesn't triggere<br>MD5: Unknown<br>Emulator: RANes
achievement(
    title = "Stage 4", description = "Complete Stage 4", points = 10,
    id = 23427, badge = "23803", published = "6/4/2015 6:53:00 PM", modified = "6/7/2015 8:39:49 PM",
    trigger = trigger_complete_stage(4)
//    trigger = current_stage() == 4 && never(current_stage() != 4) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 5", description = "Complete Stage 5", points = 10,
    id = 23428, badge = "23804", published = "6/4/2015 7:26:16 PM", modified = "10/14/2019 10:54:01 PM",
    trigger = trigger_complete_stage(5)
//    trigger = current_stage() == 5 && never(current_stage() != 5) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 6", description = "Complete Stage 6", points = 10,
    id = 23429, badge = "23805", published = "6/4/2015 7:26:17 PM", modified = "6/7/2015 8:39:51 PM",
    trigger = trigger_complete_stage(6)
//    trigger = current_stage() == 6 && never(current_stage() != 6) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 7", description = "Complete Stage 7", points = 10,
    id = 23430, badge = "23806", published = "6/4/2015 7:34:40 PM", modified = "6/7/2015 8:39:52 PM",
    trigger = trigger_complete_stage(7)
//    trigger = current_stage() == 7 && never(current_stage() != 7) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 8", description = "Complete Stage 8", points = 10,
    id = 23431, badge = "23807", published = "6/4/2015 7:40:33 PM", modified = "6/7/2015 8:39:54 PM",
    trigger = trigger_complete_stage(8)
//    trigger = current_stage() == 8 && never(current_stage() != 8) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 9", description = "Complete Stage 9 (without warp).", points = 15,
    id = 23454, badge = "23848", published = "6/6/2015 8:53:37 PM", modified = "6/7/2015 8:39:55 PM",
    trigger = trigger_complete_stage(9) && stage_progress() == 62
//    trigger = current_stage() == 9 && never(current_stage() != 9) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255) && stage_progress() == 62 && never(stage_progress() != 62)
)

achievement(
    title = "Stage 10", description = "Complete Stage 10", points = 15,
    id = 23455, badge = "23849", published = "6/6/2015 9:37:18 PM", modified = "6/7/2015 8:39:57 PM",
    trigger = trigger_complete_stage(10)
//    trigger = current_stage() == 10 && never(current_stage() != 10) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 11", description = "Complete Stage 11", points = 15,
    id = 23456, badge = "23850", published = "6/6/2015 9:37:19 PM", modified = "6/7/2015 8:39:58 PM",
    trigger = trigger_complete_stage(11)
//    trigger = current_stage() == 11 && never(current_stage() != 11) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 12", description = "Complete Stage 12", points = 15,
    id = 23457, badge = "23851", published = "6/6/2015 9:37:21 PM", modified = "10/21/2019 12:38:01 AM",
    trigger = trigger_complete_stage(12)
//    trigger = current_stage() == 12 && never(current_stage() != 12) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Stage 13", description = "Complete Stage 13", points = 20,
    id = 23458, badge = "23852", published = "6/6/2015 9:45:38 PM", modified = "6/7/2015 8:40:00 PM",
    trigger = trigger_complete_stage(13)
//    trigger = current_stage() == 13 && never(current_stage() != 13) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

achievement(
    title = "Complete the game!", description = "Complete Stage 14 and the Boss!", points = 30,
    id = 23459, badge = "23855", published = "6/6/2015 10:01:36 PM", modified = "6/7/2015 8:40:02 PM",
    trigger = trigger_complete_stage(14)
//    trigger = current_stage() == 14 && never(current_stage() != 14) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255)
)

// Ticket 24666: I completed the game with either 19 or 20 lives but the achievement didn't trigger for me at
//               all.<br>MD5: 9f6699315a98a17f953eef92f179992b
achievement(
    title = "Hardcore Noid!!!", description = "Complete the game with 15 or more remaining lives!!!", points = 70,
    id = 23507, badge = "23901", published = "6/7/2015 7:47:48 PM", modified = "10/21/2019 12:38:01 AM",
    trigger = trigger_complete_stage(1) && (lives_tens() >= 2 || (lives_tens() == 1 && lives_ones() >= 5))
//    trigger = current_stage() == 14 && never(current_stage() != 14) && repeated(500, end_stage() == 255) && 
//              never(end_stage() != 255) && lives_tens() >= 49 && never(lives_tens() < 49) && lives_ones() >= 53 && 
//              never(lives_ones() < 53)
)

achievement(
    title = "100K", description = "Get 100.000 points!!!", points = 30,
    id = 23509, badge = "23902", published = "6/7/2015 8:10:42 PM", modified = "10/5/2019 8:43:02 PM",
    trigger = score_hundred_thousands() == 49 && never(score_hundred_thousands() != 49)
)

achievement(
    title = "200K", description = "Get 200.000 points!!!", points = 40,
    id = 23510, badge = "23903", published = "6/7/2015 8:10:43 PM", modified = "10/17/2019 11:44:01 PM",
    trigger = score_hundred_thousands() == 50 && never(score_hundred_thousands() != 50)
)

achievement(
    title = "A High Score for REAL!!!", description = "Get an impressive score!!!", points = 60,
    id = 23511, badge = "23904", published = "6/7/2015 8:10:45 PM", modified = "10/21/2019 12:38:01 AM",
    trigger = score_hundred_thousands() == 52 && never(score_hundred_thousands() != 52)
)

achievement(
    title = "Starting the adventure!!! ", description = "Start the game!", points = 5,
    id = 23497, badge = "23900", published = "6/7/2015 6:35:28 PM", modified = "6/7/2015 8:07:36 PM",
    trigger = stage_progress() == 3
)

rich_presence_conditional_display(mode() == 0 || mode() == 0x0B, "Titles")
rich_presence_conditional_display(playing() == 0x40, "Demo")
rich_presence_conditional_display(current_stage() == 15, "Ending")

rich_presence_display("Stage {0}, {1} lives",
    rich_presence_value("Stage", current_stage()),
    rich_presence_value("Lives", lives_tens() * 10 + lives_ones())
)
