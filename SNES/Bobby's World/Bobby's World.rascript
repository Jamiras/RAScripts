// Bobby's World
// #ID = 439

// MD5: 6452748e3042c9b7a4ff37dde5e9e69b (U) (Proto)

// $0036: Horizontal Position 1
// $0037: Horizontal Position 2
// $04ED: Bobby's horizontal moves before/inside bosses rooms
// $07BC: Final level transition
// $0B48: first place in password screen
// $0B4A: second place in password screen
// $0B4C: third place in password screen
// $0B4E: fourth place in password screen
// $0E41: Bobby's lives

// $0E69: Lollipops left number
function lollipop_msd() => byte(0x000E69)

// $0E71: Lollipop right number
function lollipop_lsd() => byte(0x000E71)

// $1395: Bobby's lives
function current_lives() => byte(0x001395)

// $1397: Number of continues
function current_continues() => byte(0x001397)

// $139B: Available hearts
function current_hearts() => byte(0x00139B)

// $139D: Total hearts
function total_hearts() => byte(0x00139D)

// $1AF1: When a enemies hits the shield, this memory became variable with only one value as "26"
// $1AF5: Memory of jump
// $1B27: Memory of the spider Webbly

// $1B49: Boss HP
function boss_hp() => byte(0x001B49)

// $7AA5: Level transition
// $7B0E: Level transition
function current_stage() => byte(0x7B0E)
stage_outerspace = 0
stage_under_the_bed = 1
stage_underwater = 0x55
stage_wildwest = 3
stage_closet = 8

achievement(
    title = "Candy Shop", description = "Collect 99 lollipops", points = 10,
    id = 41401, badge = "42607", published = "10/26/2016 1:34:07 AM", modified = "10/26/2016 1:38:18 AM",
    trigger = lollipop_lsd() == 9 && lollipop_msd() == 9
)

achievement(
    title = "Better than a cat", description = "Collect 9 lives", points = 25,
    id = 41402, badge = "42624", published = "10/26/2016 1:36:24 AM", modified = "10/26/2016 1:38:22 AM",
    trigger = byte(0x000E41) == 9 && current_lives() == 9
)

achievement(
    title = "Bobby's in love", description = "Collect all 6 hearts", points = 10,
    id = 41403, badge = "42609", published = "10/26/2016 1:36:38 AM", modified = "10/26/2016 1:38:24 AM",
    trigger = total_hearts() == 6 && current_hearts() == 6
)

achievement(
    title = "Spider Man", description = "Pick up the jumping Webbly", points = 10,
    id = 41404, badge = "42630", published = "10/26/2016 1:36:49 AM", modified = "10/26/2016 1:38:26 AM",
    trigger = word(0x001B27) == 2
)

achievement(
    title = "Webbly first", description = "Block 10 enemies hits", points = 20,
    id = 41405, badge = "42631", published = "10/26/2016 1:36:55 AM", modified = "10/26/2016 1:38:29 AM",
    trigger = repeated(10, byte(0x001AF1) == 26)
)

achievement(
    title = "Don't look down", description = "Stay suspended by 55 seconds", points = 5,
    id = 41406, badge = "42632", published = "10/26/2016 1:36:58 AM", modified = "10/26/2016 1:38:31 AM",
    trigger = repeated(3200, byte(0x001B27) == 6)
)

achievement(
    title = "Pendulum", description = "Stay 25 second swinging", points = 5,
    id = 41407, badge = "42634", published = "10/26/2016 1:37:04 AM", modified = "10/26/2016 1:38:33 AM",
    trigger = repeated(1500, byte(0x001B27) == 4)
)

achievement(
    title = "Roger that!", description = "Make a Roger's jackpot", points = 5,
    id = 41408, badge = "42639", published = "10/26/2016 1:37:11 AM", modified = "10/26/2016 1:38:35 AM",
    trigger = byte(0x000B48) == 5 && byte(0x000B4A) == 5 && byte(0x000B4C) == 5 && byte(0x000B4E) == 5
)

achievement(
    title = "Jump mania", description = "Jump over 50 times", points = 10,
    id = 41409, badge = "42641", published = "10/26/2016 1:37:17 AM", modified = "10/26/2016 1:38:37 AM",
    trigger = repeated(901, byte(0x001AF5) == 5)
)

achievement(
    title = "Out of space", description = "Clear stage 1", points = 10,
    id = 41410, badge = "42628", published = "10/26/2016 1:37:24 AM", modified = "10/26/2016 2:37:51 AM",
    trigger = current_stage() == stage_under_the_bed
)

achievement(
    title = "Just a dream", description = "Clear stage 2", points = 15,
    id = 41411, badge = "42627", published = "10/26/2016 1:37:27 AM", modified = "10/26/2016 2:38:05 AM",
    trigger = byte(0x007AA5) == 1
)

achievement(
    title = "Krusty Krab", description = "Clear stage 3", points = 20,
    id = 41412, badge = "42629", published = "10/26/2016 1:37:30 AM", modified = "10/26/2016 2:38:16 AM",
    trigger = current_stage() == stage_wildwest
)

achievement(
    title = "Sunset Riders", description = "Clear stage 4", points = 20,
    id = 41413, badge = "42633", published = "10/26/2016 1:37:32 AM", modified = "10/26/2016 2:38:25 AM",
    trigger = current_stage() == stage_closet
)

function trigger_win_game() => byte(0x0007BC) == 1 && current_stage() == stage_closet && byte(0x0007F0) == 0

achievement(
    title = "It's Halloween", description = "Clear stage 5", points = 35,
    id = 41414, badge = "42635", published = "10/26/2016 1:37:34 AM", modified = "10/26/2016 2:38:45 AM",
    trigger = trigger_win_game()
)

achievement(
    title = "All Clean!", description = "Beat the game", points = 30,
    id = 41415, badge = "42638", published = "10/26/2016 1:37:37 AM", modified = "10/26/2016 2:28:39 AM",
    trigger = trigger_win_game()
)

achievement(
    title = "Easier than my homework", description = "Beat the game without use continues", points = 40,
    id = 41416, badge = "42637", published = "10/26/2016 1:37:39 AM", modified = "10/26/2016 2:29:03 AM",
    trigger = trigger_win_game() && current_continues() == 3
)

// Ticket 11440: I beat the game without using passwords but the cheevo didn't trigger. People have been saying that if
//               you open "Options" menu before starting the game this achievement won't trigger no matter what.
//               MD5: cb2b41d01a37860539192a2c9034264c
// Ticket 8749: //               MD5: 6452748e3042c9b7a4ff37dde5e9e69b
// Ticket 6869: I did these achievements and i did not get it.
achievement(
    title = "Shining Bedroom", description = "Beat the game without using passwords", points = 40,
    id = 41417, badge = "42640", published = "10/26/2016 1:37:42 AM", modified = "10/26/2016 2:30:52 AM",
    trigger = trigger_win_game() &&                        // beat game
              never(byte(0x000673) == 1) &&                // reset at title screen (game over)
              once(current_stage() == stage_outerspace) && // require first stage
              unless(byte(0x000673) == 3) &&               // prevent false start on password screen
                                                           // use pause to prevent reset when password displayed between stages
              unless(byte(0x0007BC) > 1) &&                // prevent false start on intro cutscene
                                                           // use pause to prevent reset on intermediate cutscenes
              unless(byte(0x000673) == 2)                  // prevent trigger on continue screen on stage 5
//    trigger_before = trigger_win_game() && byte(0x000B48) == 0 
)

// Ticket 11438: I was playing for the first time, then reached the first boss, then died. Started playing against the
//               first boss for the second time, beat it but taking one hit. Then, when I was in the first stage of the
//               second "world", in the beginning, suddenly this one triggered.
//               MD5: cb2b41d01a37860539192a2c9034264c
achievement(
    title = "Sick!", description = "Beat the first boss without taking damage", points = 30,
    id = 41419, badge = "42642", published = "10/26/2016 1:37:47 AM", modified = "10/26/2016 1:38:52 AM",
    trigger = never(current_stage() != stage_outerspace) && once(boss_hp() == 20) && boss_hp() == 255 && 
              never(current_hearts() < prev(current_hearts()))
//    trigger_before = current_stage() == 1 && never(current_hearts() < prev(current_hearts())) && once(byte(0x0004ED) == 132)
)

// Ticket 11439: I beat the second boss TAKING damage at 3-4, then at the beginning of 4-1 this one triggered.
//               MD5: cb2b41d01a37860539192a2c9034264c
achievement(
    title = "Holly Krab", description = "Beat the second boss without taking damage", points = 30,
    id = 41418, badge = "42643", published = "10/26/2016 1:37:44 AM", modified = "10/26/2016 1:38:51 AM",
    trigger = never(current_stage() != stage_underwater) && once(boss_hp() == 20) && boss_hp() == 255 && 
              never(current_hearts() < prev(current_hearts()))
//    trigger_before = never(current_hearts() < prev(current_hearts())) && current_stage() == 3 && once(byte(0x0004ED) == 131)
)

// Ticket 11441: Reached the third boss with 12 lives. Got hit, then intentionally died to try again. 11 lives, got
//               hit, intentionally died. 10 lives, got hit, intentionally died. 9 lives, didn't get hit and beat him.
//               Besides that, achievement didn't trigger.
//               MD5: cb2b41d01a37860539192a2c9034264c
achievement(
    title = "Friday 13th", description = "Beat the third boss without taking damage", points = 30,
    id = 41420, badge = "42644", published = "10/26/2016 1:38:05 AM", modified = "10/26/2016 2:29:17 AM",
    trigger = never(current_stage() != stage_closet) && once(boss_hp() == 20) && boss_hp() == 255 && 
              never(current_hearts() < prev(current_hearts()))
//    trigger_before = trigger_win_game() && never(current_hearts() < prev(current_hearts())) && 
//              once(byte(0x0004ED) == 211)
)

stages = {
    stage_outerspace: "In Outer Space",
    stage_under_the_bed: "Under the Bed",
    stage_underwater: "Underwater",
    stage_wildwest: "In the Wild West",
    stage_closet: "In the Closet",   
}

rich_presence_conditional_display(byte(0x000673) == 1, "Title Screen")
rich_presence_conditional_display(byte(0x000673) == 6, "Title Screen")
rich_presence_conditional_display(byte(0x000673) == 3, "Password Screen")

rich_presence_display("{0} with {1} lives", 
    rich_presence_lookup("Stage", current_stage(), stages),
    rich_presence_value("Lives", current_lives())
)

// F1 = options
// F2 = password
// F3 = title
// F4 = opening story
// F5 = stage 1
// F6 = stage 2
// F7 = stage 3
// F8 = stage 4
// F9 = stage 5


// F10 = between levels password