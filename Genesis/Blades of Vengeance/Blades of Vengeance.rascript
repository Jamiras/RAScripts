// Blades of Vengeance
// #ID = 3714

// $07F6: stage 4 A
function stage4a() => byte(0x0007F6)

// $1272: stage 7 fix
function stage7() => byte(0x001272)

// $134B: stage 5
function stage5() => byte(0x00134B)

// $136F: stage 5 fix
function stage5fix() => byte(0x00136F)

// $1EB2: STAGE NUMBERS
function stagenum() => byte(0x001EB2)

// $685B: stage 8
function stage8() => byte(0x00685B)

// $6B6D: stage 4 B
function stage4b() => byte(0x006B6D)

// $EA8E: selected character
function character() => byte(0x00EA8E)
function character2() => byte(0x00EAEE)

// $EB45: silver coins
function silver_coins() => byte(0x00EB45)

// $EB47: healing 2
function healing2() => byte(0x00EB47)

// $F428: (16 bits) score x10e4 (binary-coded decimal)
function score_10k() => word(0x00F428)

// $F42A: (16 bits) score (binary-coded decimal)
function score() => word(0x00F42A)

// $F44E: stage 6
function stage6() => byte(0x00F44E)

function stage() => byte(0x00F45A)

// $F46F: Number of life
function lives() => byte(0x00F46F)

// $F516: stage 7 ..5..
function stage7_5() => byte(0x00F516)


//             EEE2  F3BC
// F5=1-1         0     7
// F8,F9=1-2      3     9
// F0,F1*=1-3     1     5
//    1-secret    2     3
// F3=2-1         4     F
//    2-2         5     B
// F5*=2-3        6     C
// F6*=3-1        d    22
//     4-1       19    16 
//     4-2       1A    15
// F7*=4-3       1B    1D
// F8*=5-1       0C    28
//     6-1        9     4
//     6-2        7    10
//     6-3       0A    0E
//     6-4       0B    04
// F9*=6-5       08    03
//     7-1       11    04
//     7-2       12     ?
//     7-3       13    09
//     7-4       17     4
//     7-5       18     3
//     7-6       15     4
//     7-7       14     6
//     7-8       16     4
// F0*=7-9       21     2
//     8-1       0E    12
//     8-2       0F    1A
// F4*=8-3       10    03
// main menu     1c     4
// char select   1d     4
// store         1e     4
// cutscene      1f     8
// gameover      20     4
// inventory     22     4
// ending        23
// ending-2      26
// ending-2      29
// ending-2      2A
// ending-2      2B
// F2

function screen() => byte(0xeee2)
screen_titles = 0x1c
screen_char_select = 0x1d
screen_plunder = 0x1e
screen_cutscene = 0x1f
screen_store = 0x22
screen_1_1 = 0x00
screen_1_2 = 0x03
screen_1_3 = 0x01
screen_1_secret = 0x02 // warp door
screen_2_1 = 0x04
screen_2_2 = 0x05
screen_2_3 = 0x06
screen_3 = 0x0d
screen_4_1 = 0x19
screen_4_2 = 0x1A
screen_4_3 = 0x1B
screen_5_1 = 0x0C
screen_6_1 = 0x09
screen_6_2 = 0x07
screen_6_3 = 0x0A
screen_6_4 = 0x0B
screen_6_5 = 0x08
screen_7_1 = 0x11
screen_7_2 = 0x12
screen_7_3 = 0x13
screen_7_4 = 0x17
screen_7_5 = 0x18
screen_7_6 = 0x15
screen_7_7 = 0x14
screen_7_8 = 0x16
screen_7_9 = 0x21
screen_8_1 = 0x0E
screen_8_2 = 0x0F
screen_8_3 = 0x10
screen_ending = 0x23 // -0x2B

function trigger_complete(stage) => screen() == screen_plunder && prev(screen()) == stage

achievement(
    title = "Stage 1", description = "Finish stage 1", points = 10,
    id = 59858, badge = "62598", published = "5/5/2018 1:22:41 AM", modified = "5/24/2018 5:40:07 PM",
    trigger = trigger_complete(screen_1_3)
//    trigger = once(stagenum() == 124)
)

achievement(
    title = "Stage 2", description = "Finish stage 2", points = 10,
    id = 60053, badge = "62751", published = "5/9/2018 12:48:53 AM", modified = "5/24/2018 5:41:18 PM",
    trigger = trigger_complete(screen_2_3)
//    trigger = once(stagenum() == 134)
)

achievement(
    title = "Stage 3", description = "Finish stage 3", points = 10,
    id = 60154, badge = "62823", published = "5/9/2018 8:43:32 PM", modified = "5/24/2018 3:51:37 PM",
    trigger = trigger_complete(screen_3)
//    trigger = repeated(100, stage4a() == 4) && repeated(100, stage4b() == 4)
)

achievement(
    title = "Stage 4", description = "Finish stage 4 ", points = 10,
    id = 60155, badge = "62824", published = "5/9/2018 9:26:04 PM", modified = "5/24/2018 3:51:45 PM",
    trigger = trigger_complete(screen_4_3)
//    trigger = repeated(100, stage5() == 5) && repeated(100, stage5fix() == 5)
)

achievement(
    title = "Stage 5", description = "Finish stage 5", points = 10,
    id = 60179, badge = "00000", published = "5/12/2018 12:49:05 AM", modified = "5/24/2018 3:51:50 PM",
    trigger = trigger_complete(screen_5_1)
//    trigger = repeated(100, stage6() == 6)
)

// Ticket 25192: The achievements clear stage 6 and kings collectors are broken.
// Ticket 19232: Some of these cheevos are broken for me. King of Collectors and Clear Stage 6 never popped for me and
//               I did it twice now.
// Ticket 18830: I have completed the game but the sixth level is still blocked although it is not the last level, I
//               leave an image as proof that I have the achievement of finishing the game
achievement(
    title = "Stage 6", description = "Finish stage 6 ", points = 10,
    id = 60183, badge = "63037", published = "5/12/2018 7:02:11 PM", modified = "9/27/2019 3:41:01 AM",
    trigger = trigger_complete(screen_6_5)    
//    trigger = repeated(400, stage7_5() == 5) && repeated(400, stage7() == 7) && 
//              repeated(400, stage6() == 6)
)

achievement(
    title = "Stage 7", description = "Finish stage 7 ", points = 10,
    id = 60184, badge = "63038", published = "5/12/2018 7:32:05 PM", modified = "5/24/2018 3:51:57 PM",
    trigger = trigger_complete(screen_7_9)
//    trigger = repeated(100, stage8() == 7) && repeated(2000, stage6() == 6)
)

achievement(
    title = "Stage 8", description = "Finish stage 8", points = 25,
    id = 60194, badge = "63083", published = "5/13/2018 2:14:32 PM", modified = "9/27/2019 3:41:01 AM",
    trigger = trigger_complete(screen_8_3)
//    trigger = repeated(900, stage7() == 36)
)

achievement(
    title = "Collector Lord", description = "Have 20 silver bags", points = 10,
    id = 59857, badge = "62978", published = "5/5/2018 12:53:49 AM", modified = "5/24/2018 3:52:13 PM",
    trigger = silver_coins() >= 20
//    trigger = silver_coins() == 20
)

// Ticket 25193: The achievements clear stage 6 and kings collectors are broken.
// Ticket 19231: Some of these cheevos are broken for me. King of Collectors and Clear Stage 6 never popped for me and
//               I did it twice now. Please fix.
achievement(
    title = "King of Collectors", description = "Have 80 silver bags", points = 20,
    id = 60172, badge = "62976", published = "5/11/2018 8:50:52 PM", modified = "5/24/2018 3:52:17 PM",
    trigger = silver_coins() >= 80
//    trigger = repeated(100, silver_coins() == 80)
)

achievement(
    title = "Master of Details", description = "Collect 50 silver bags and 6 healing potions in stage 1", points = 25,
    id = 60185, badge = "63039", published = "5/12/2018 8:16:57 PM", modified = "10/24/2019 10:21:01 AM",
    trigger = silver_coins() >= 50 && healing2() == 6 && 
              (screen() == screen_1_1 || screen() == screen_1_2)
)

achievement(
    title = "Extra Life", description = "Have 8 extra lives", points = 10,
    id = 60186, badge = "63080", published = "5/12/2018 9:31:24 PM", modified = "9/27/2019 3:41:01 AM",
    trigger = repeated(200, lives() == 8)
)

achievement(
    title = "King of Points I", description = "Reach 50,000 points", points = 5,
    id = 60195, badge = "63122", published = "5/14/2018 8:33:51 PM", modified = "5/24/2018 3:52:28 PM",
    trigger = score_10k() >= 5
//    trigger = score_10k() >= 5 && score() >= 0
)

achievement(
    title = "King of Points II", description = "Reach 100,000 points", points = 10,
    id = 60196, badge = "63123", published = "5/14/2018 8:36:40 PM", modified = "5/24/2018 3:52:32 PM",
    trigger = score_10k() >= 0x10
//    trigger = byte(0x00F428) >= 10 && byte(0x00F42A) >= 0
)

achievement(
    title = "King of Points III", description = "Reach 200,000 points", points = 10,
    id = 60197, badge = "63124", published = "5/14/2018 8:39:09 PM", modified = "6/12/2018 1:46:42 AM",
    trigger = score_10k() >= 0x20
//    trigger = repeated(10, byte(0x00F428) >= 32)
)

achievement(
    title = "King of Points IV", description = "Reach 300,000 points", points = 25,
    id = 60198, badge = "63125", published = "5/14/2018 8:43:07 PM", modified = "6/12/2018 1:46:46 AM",
    trigger = score_10k() >= 0x30
//    trigger = repeated(10, byte(0x00F428) >= 48)
)

achievement(
    title = "King of Points V", description = "Reach 400,000 points", points = 25,
    id = 60199, badge = "63126", published = "5/14/2018 8:45:23 PM", modified = "6/12/2018 1:46:56 AM",
    trigger = score_10k() >= 0x40
//    trigger = repeated(10, byte(0x00F428) >= 64)
)

characters = {
    0: "Huntress",
    1: "Barbarian",
    2: "Wizard"
}

screens = {
    screen_1_1: "1",
    screen_1_2: "1",
    screen_1_3: "1",
    screen_1_secret: "1",
    screen_2_1: "2",
    screen_2_2: "2",
    screen_2_3: "2",
    screen_3: "3",
    screen_4_1: "4",
    screen_4_2: "4",
    screen_4_3: "4",
    screen_5_1: "5",
    screen_6_1: "6",
    screen_6_2: "6",
    screen_6_3: "6",
    screen_6_4: "6",
    screen_6_5: "6",
    screen_7_1: "7",
    screen_7_2: "7",
    screen_7_3: "7",
    screen_7_4: "7",
    screen_7_5: "7",
    screen_7_6: "7",
    screen_7_7: "7",
    screen_7_8: "7",
    screen_7_9: "7",
    screen_8_1: "8",
    screen_8_2: "8",
    screen_8_3: "8",
}

rich_presence_conditional_display(screen() == screen_titles || screen() == screen_char_select, "Titles")
rich_presence_conditional_display(screen() >= screen_ending, "Victorious")
rich_presence_conditional_display(screen() >= screen_plunder && screen() != screen_7_9, "Between Stages")

rich_presence_conditional_display(character2() == 0xFF, "The {0} is fighting through stage {1} with {2} extra lives",
    rich_presence_lookup("Char", character(), characters),
    rich_presence_lookup("Stage", screen(), screens),
    rich_presence_value("Lives", lives())
)

rich_presence_display("The {0} is fighting through stage {1} with {2} extra lives and the {3}",
    rich_presence_lookup("Char", character(), characters),
    rich_presence_lookup("Stage", screen(), screens),
    rich_presence_value("Lives", lives()),
    rich_presence_lookup("Char", character2(), characters)
)
