// Castle of Illusion Starring Mickey Mouse
// #ID = 9

// $9405: Time in level?
// $D4AB: Boss Health VOLATILE
// $F22C: Mickey's Score, upper 16-bits literal
// $F22E: Mickey's Score, lower 16-bits literal
// $F250: 16-bit - Clear Bonus
// $F260: 16-bit - Technical Bonus
// $F270: 16-bit Secret Bonus
// $F300: 16-bit - Animation ID?
//        002e is final endgame animation
// $F320: Ammo Count literal,
//        Maxes out at 0x1e or 30
// $F322: Mickey's Power, maxes out at 05
// $F324: Mickey Number of Tries remaining
//        Maxes out at 0x0a or 10
function current_lives() => byte(0xF324)

// $F40A: Prepared to bottom-bounce = 0x01

// $F40B: Set to 01 when demo mode is active
//        Resets to title if start is pressed while this is 01
function is_demo_mode() => byte(0x00F40B)

// $F41E: Current Sound Test ID in options
// $F44E: Set to 01 when gem has just been collected,
//        Initiates Level Completed screen, then
//        plays transition cutscene

// $FF0C: 8-bit - Difficulty 0=Normal; 1=Hard; 2=Practice
function current_difficulty() => byte(0x00FF0C)
difficulty_normal = 0
difficulty_hard = 1
difficulty_practice = 2

// $FF0E: 8-bit - Difficulty 2
//        0=Normal; 1=Hard; 2=Practice
// $FF0F: Control System in Use, 00, 01, 02
// $FF42: Map Number?

// $FF44: 16-bit - World number, starting at 00
function current_world() => word(0x00FF44)
world_forest = 0
world_toyland = 1
world_storm = 2
world_library = 3
world_castle = 4

// $FF46: 16-bit stage number, starting at 0
function current_stage() => word(0x00FF46)

worlds = {
    world_forest: "the Enchanted Forest",
    world_toyland: "Toyland",
    world_storm: "the Storm",
    world_library: "the Library",
    world_castle: "the Castle",
    5: "the Castle" // Mizrabel fight
}

difficulties = {
    difficulty_normal: "on Normal",
    difficulty_hard: "on Hard",
    difficulty_practice: "in Practice Mode"
}

rich_presence_conditional_display(byte(0xF40B) == 1, "Watching the demo")

rich_presence_conditional_display(byte(0xF300) <= 10, "In the titles")

rich_presence_display("Mickey is in {0} with {1} lives {2}",
    rich_presence_lookup("Location", current_world(), worlds),
    rich_presence_value("Lives", current_lives()),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

achievement(
    title = "High Powered Mouse", description = "Get a Power Level of 5 (Normal or Hard Difficulty)", points = 20,
    id = 176, badge = "04979", published = "4/11/2013 6:36:49 PM", modified = "4/13/2016 12:41:15 PM",
    trigger = word(0x00F322) == 5 && current_difficulty() != 2
)

achievement(
    title = "Lucky Seven", description = "Obtain 7 Lives", points = 20,
    id = 177, badge = "04978", published = "4/11/2013 7:16:19 PM", modified = "1/4/2014 11:51:59 PM",
    trigger = word(0x00F324) >= 7
)

achievement(
    title = "Keeps The Doctor Away", description = "Collect 30 apples", points = 20,
    id = 58, badge = "04983", published = "12/1/2012 11:01:36 PM", modified = "1/4/2014 11:54:15 PM",
    trigger = byte(0x00F320) == 30 &&
              ((current_world() == 0) ||
               (current_world() == 3))
)

achievement(
    title = "Losing Your Marbles", description = "Collect 30 marbles", points = 20,
    id = 4319, badge = "04946", published = "1/4/2014 12:42:17 AM", modified = "1/4/2014 11:51:55 PM",
    trigger = byte(0x00F320) == 30 &&
              ((current_world() == 1) ||
               (current_world() == 2))
)

achievement(
    title = "Mickey Mage", description = "Collect 15 fireballs", points = 20,
    id = 4343, badge = "04984", published = "1/4/2014 10:29:44 PM", modified = "1/5/2014 2:56:17 AM",
    trigger = byte(0x00F320) >= 15 && current_world() == 4
)

achievement(
    title = "Hi Scoring Mouse", description = "Get Over 75000 Points", points = 20,
    id = 4316, badge = "04944", published = "1/3/2014 11:54:58 PM", modified = "1/4/2014 11:51:51 PM",
    trigger = word(0x00F22E) >= 9464 && word(0x00F22C) >= 1
)

achievement(
    title = "Mousetacular", description = "Get Over 150000 Points", points = 25,
    id = 4317, badge = "04972", published = "1/4/2014 12:06:24 AM", modified = "1/4/2014 11:56:48 PM",
    trigger = word(0x00F22E) >= 18928 && word(0x00F22C) >= 2
)

achievement(
    title = "Taking The Mickey", description = "Get Over 250000 Points", points = 30,
    id = 4318, badge = "04980", published = "1/4/2014 12:06:47 AM", modified = "1/4/2014 11:56:45 PM",
    trigger = word(0x00F22E) >= 53392 && word(0x00F22C) >= 3
)

achievement(
    title = "Milky Way", description = "Jump Inside The Milk Bottle", points = 10,
    id = 4336, badge = "04960", published = "1/4/2014 6:04:39 PM", modified = "2/26/2014 6:16:53 PM",
    trigger = word(0x00FF42) == 21
)

achievement(
    title = "Secret Squeak", description = "Earn a Secret Bonus of over 25000", points = 20,
    id = 4348, badge = "04982", published = "1/4/2014 11:42:36 PM", modified = "1/4/2014 11:51:15 PM",
    trigger = word(0x00F270) >= 25000
)

achievement(
    title = "Technicallly Brilliant", description = "Earn a Technical Bonus of 10000", points = 20,
    id = 4349, badge = "04981", published = "1/4/2014 11:47:49 PM", modified = "1/5/2014 2:27:33 AM",
    trigger = word(0x00F260) >= 10000
)

achievement(
    title = "Red Gem", description = "Collect the Red Gem", points = 15,
    id = 4337, badge = "04971", published = "1/4/2014 7:26:57 PM", modified = "1/4/2014 11:51:40 PM",
    trigger = byte(0x00FF42) == 4 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Orange Gem", description = "Collect the Orange Gem", points = 15,
    id = 4338, badge = "04962", published = "1/4/2014 7:32:08 PM", modified = "1/4/2014 11:51:37 PM",
    trigger = byte(0x00FF42) == 8 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Yellow Gem", description = "Collect the Yellow Gem", points = 15,
    id = 4339, badge = "04970", published = "1/4/2014 7:37:51 PM", modified = "1/4/2014 11:51:35 PM",
    trigger = byte(0x00FF42) == 12 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Green Gem", description = "Collect the Green Gem", points = 15,
    id = 4340, badge = "04968", published = "1/4/2014 7:52:14 PM", modified = "1/4/2014 11:51:33 PM",
    trigger = byte(0x00FF42) == 21 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Blue Gem", description = "Collect the Blue Gem", points = 15,
    id = 4342, badge = "04973", published = "1/4/2014 10:21:23 PM", modified = "1/4/2014 11:51:32 PM",
    trigger = byte(0x00FF42) == 22 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Indigo Gem", description = "Collect the Indigo Gem", points = 15,
    id = 4344, badge = "04974", published = "1/4/2014 10:33:13 PM", modified = "1/4/2014 11:51:29 PM",
    trigger = byte(0x00FF42) == 23 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Violet Gem", description = "Collect the Violet Gem", points = 15,
    id = 4345, badge = "04975", published = "1/4/2014 10:52:09 PM", modified = "1/4/2014 11:51:27 PM",
    trigger = byte(0x00FF42) == 26 && byte(0x00F44E) == 1 && prev(byte(0x00F44E)) == 0
)

achievement(
    title = "Save Minnie", description = "Rescue Minnie From Mizrabel", points = 30,
    id = 4346, badge = "04976", published = "1/4/2014 11:17:53 PM", modified = "1/4/2014 11:51:21 PM",
    trigger = word(0x00F300) == 46
)

achievement(
    title = "Mighty Mouse", description = "Rescue Minnie From Mizrabel on Hard Difficulty", points = 40,
    id = 4347, badge = "04977", published = "1/4/2014 11:24:42 PM", modified = "1/20/2014 12:55:20 AM",
    trigger = word(0x00F300) == 46 && current_difficulty() == 1
)

achievement(
    title = "Decaffeinated", description = "Jump Inside A Coffee Cup", points = 10,
    id = 4341, badge = "04969", published = "1/4/2014 10:08:38 PM", modified = "1/5/2014 8:42:44 PM",
    trigger = current_world() == 3 &&
              ((word(0x00FF42) == 18) ||
               (word(0x00FF42) == 19) ||
               (word(0x00FF42) == 20))
)


