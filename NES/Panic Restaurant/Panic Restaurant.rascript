// Panic Restaurant
// #ID = 1871

// $0019: menu = 1, start scene = 2, recipe menu = 4, respawn = 5, in=game = 6, stage clear = 8, slots = 9, game over = 13, ending = 16
function screen() => byte(0x000019)

// $0094: Stage
function stage() => byte(0x000094)

// $00AD: Boss Health
function boss_hp() => byte(0x0000AD)

// $00D6: Lives
function lives() => byte(0x0000D6)

// $00D7: Health
function hp() => byte(0x0000D7)

// $00D8: Item
function item() => byte(0x0000D8)

// $00D9: Score [Hex] [0-25500]
function score_high() => byte(0x0000D9)

// $00DA: Score [Hex] 01 = 25600
function score_low() => byte(0x0000DA)

// $00DF: Checkpoint
function checkpoint() => byte(0x0000DF)

// $00E1: Coin
function coin() => byte(0x0000E1)

// $03E6: minigame count
function minigames() => byte(0x0003E6)

achievement(
    title = "Stage 1 - Garden", description = "Beat Stage 1", points = 10,
    id = 4811, badge = "05448", published = "2/8/2014 2:36:56 PM", modified = "2/8/2014 2:41:25 PM",
    trigger = repeated(10, stage() == 1)
)

achievement(
    title = "Stage 2 - Dining Room", description = "Beat Stage 2 ", points = 10,
    id = 4812, badge = "05454", published = "2/8/2014 2:37:01 PM", modified = "2/8/2014 2:41:29 PM",
    trigger = repeated(10, stage() == 2)
)

achievement(
    title = "Stage 3 - Kitchen", description = "Beat Stage 3", points = 10,
    id = 4813, badge = "05458", published = "2/8/2014 2:37:07 PM", modified = "2/8/2014 2:41:32 PM",
    trigger = repeated(10, stage() == 3)
)

achievement(
    title = "Stage 4 - Courtyard", description = "Beat Stage 4", points = 10,
    id = 4814, badge = "05462", published = "2/8/2014 2:37:12 PM", modified = "2/8/2014 2:41:35 PM",
    trigger = repeated(10, stage() == 4)
)

achievement(
    title = "Stage 5 - Freezer", description = "Beat Stage 5", points = 10,
    id = 4815, badge = "05465", published = "2/8/2014 2:37:18 PM", modified = "2/8/2014 2:41:38 PM",
    trigger = repeated(10, stage() == 5)
)

achievement(
    title = "Stage 6 - Basement", description = "Beat Stage 6", points = 20,
    id = 4816, badge = "05468", published = "2/8/2014 2:37:21 PM", modified = "1/21/2018 11:13:40 PM",
    trigger = repeated(10, byte(0x0000E0) == 9) && repeated(10, byte(0x000060) == 12) && 
              repeated(10, stage() == 5) && never(stage() != 5) && never(byte(0x000060) != 12)
)

achievement(
    title = "Popcorn Pete", description = "Reach Popcorn Pete Without Taking Damage - Stage 1", points = 15,
    id = 5267, badge = "05447", published = "2/19/2014 10:33:57 AM", modified = "10/20/2019 11:22:01 PM",
    trigger = repeated(10, screen() == 6) && never(hp() < prev(hp())) && 
              never(lives() < prev(lives())) && repeated(10, checkpoint() == 0) && repeated(10, checkpoint() == 1) && 
              repeated(10, checkpoint() == 2) && repeated(10, stage() == 0) && never(stage() != 0) && repeated(10, byte(0x00006E) == 80)
)

achievement(
    title = "Microwave Mick", description = "Reach Microwave Mick Without Taking Damage - Stage 2", points = 20,
    id = 5268, badge = "05453", published = "2/19/2014 10:34:04 AM", modified = "10/14/2019 9:38:01 PM",
    trigger = repeated(10, screen() == 6) && never(hp() < prev(hp())) && 
              never(lives() < prev(lives())) && repeated(10, checkpoint() == 0) && repeated(10, checkpoint() == 1) && 
              repeated(10, checkpoint() == 2) && repeated(10, stage() == 1) && never(stage() != 1) && repeated(10, byte(0x00006E) == 80) && 
              repeated(10, checkpoint() == 3)
)

// Ticket 17057: Does not work. Checked 2 times
//               MD5: Unknown
//               Emulator: RANes
achievement(
    title = "Willy Wok", description = "Reach Willy Wok Without Taking Damage - Stage 3", points = 20,
    id = 5269, badge = "05457", published = "2/19/2014 10:34:07 AM", modified = "10/24/2019 12:19:01 AM",
    trigger = once(screen() == 6) && once(stage() == 2) && never(stage() != 2) && 
              never(hp() < prev(hp())) && never(lives() < prev(lives())) && once(checkpoint() == 0) && once(checkpoint() == 1) && 
              once(checkpoint() == 2) && once(checkpoint() == 3) && once(checkpoint() == 4) && once(byte(0x00006E) == 248) && 
              once(byte(0x00006F) == 14)
)

achievement(
    title = "Patty O'Burger", description = "Reach Patty O'Burger Without Taking Damage - Stage 4", points = 20,
    id = 5270, badge = "05461", published = "2/19/2014 10:34:12 AM", modified = "10/24/2019 12:19:01 AM",
    trigger = repeated(10, screen() == 6) && never(hp() < prev(hp())) && 
              never(lives() < prev(lives())) && repeated(10, checkpoint() == 0) && repeated(10, checkpoint() == 1) && 
              repeated(10, checkpoint() == 2) && repeated(10, stage() == 3) && never(stage() != 3) && repeated(10, byte(0x00006E) == 80) && 
              repeated(10, checkpoint() == 3) && repeated(10, checkpoint() == 4) && repeated(10, checkpoint() == 5)
)

achievement(
    title = "Frozen Fritta", description = "Reach Frozen Fritta Without Taking Damage - Stage 5", points = 20,
    id = 5271, badge = "05464", published = "2/19/2014 10:34:15 AM", modified = "10/14/2019 9:38:01 PM",
    trigger = repeated(10, screen() == 6) && never(hp() < prev(hp())) && 
              never(lives() < prev(lives())) && repeated(10, checkpoint() == 0) && repeated(10, checkpoint() == 1) && 
              repeated(10, checkpoint() == 2) && repeated(10, stage() == 4) && never(stage() != 4) && repeated(10, byte(0x00006E) == 80) && 
              repeated(10, checkpoint() == 3) && repeated(10, checkpoint() == 4)
)

achievement(
    title = "Ohdove - The Mad Chef", description = "Reach Ohdove Without Taking Damage - Stage 6", points = 30,
    id = 5272, badge = "05466", published = "2/19/2014 10:34:19 AM", modified = "10/24/2019 12:19:01 AM",
    trigger = repeated(10, screen() == 6) && never(hp() < prev(hp())) && 
              never(lives() < prev(lives())) && repeated(10, checkpoint() == 0) && repeated(10, checkpoint() == 1) && 
              repeated(10, checkpoint() == 2) && repeated(10, stage() == 5) && never(stage() != 5) && repeated(10, byte(0x00006E) == 80) && 
              repeated(10, checkpoint() == 3) && repeated(10, checkpoint() == 4) && repeated(10, checkpoint() == 5)
)

achievement(
    title = "Forkin' About", description = "Defeat Microwave Mick With a Fork", points = 40,
    id = 5266, badge = "05846", published = "2/19/2014 10:30:58 AM", modified = "10/24/2019 12:19:01 AM",
    trigger = repeated(10, checkpoint() == 3) && never(checkpoint() != 3) && repeated(10, stage() == 1) && 
              never(stage() != 1) && repeated(10, boss_hp() == 255) && repeated(10, item() == 3) && never(item() != 3)
)

achievement(
    title = "Master Chef", description = "Complete the Game Without Losing a Life", points = 50,
    id = 8276, badge = "08288", published = "5/17/2014 10:19:58 PM", modified = "10/24/2019 12:19:01 AM",
    trigger = repeated(10, stage() == 0) && repeated(10, stage() == 1) && 
              repeated(10, stage() == 2) && repeated(10, stage() == 3) && repeated(10, stage() == 4) && 
              repeated(10, stage() == 5) && repeated(10, byte(0x000060) == 12) && never(lives() < prev(lives())) && 
              once(byte(0x0000E0) == 9)
)

achievement(
    title = "Nice Score", description = "Reach 50000 Score", points = 5,
    id = 5273, badge = "05847", published = "2/19/2014 10:53:46 AM", modified = "5/8/2018 10:48:22 PM",
    trigger = once(score_high() >= 244) && once(score_low() >= 1) && never(once(score_low() < 1)) && 
              never(once(screen() == 0)) &&
              (always_false() || (once(score_low() >= 2) && never(once(screen() == 0))))
)

achievement(
    title = "Good Score", description = "Reach 100000 Score", points = 10,
    id = 5264, badge = "05845", published = "2/19/2014 10:30:14 AM", modified = "5/8/2018 10:48:28 PM",
    trigger = once(score_high() >= 232) && once(score_low() >= 3) && never(once(score_low() < 3)) && 
              never(once(screen() == 0)) &&
              (always_false() || (once(score_low() >= 4) && never(once(screen() == 0))))
)

achievement(
    title = "Awesome Score", description = "Reach 200.000 Score", points = 20,
    id = 5265, badge = "05844", published = "2/19/2014 10:30:20 AM", modified = "12/10/2019 8:37:00 PM",
    trigger = never(once(score_low() < 7)) &&
              ((once(score_high() >= 208)) ||
               (once(score_low() >= 8)))
)

achievement(
    title = "Gold Collector", description = "Reach a Total of 10 Coins", points = 5,
    id = 4823, badge = "05469", published = "2/8/2014 2:39:47 PM", modified = "2/8/2014 2:42:05 PM",
    trigger = repeated(10, coin() >= 10)
)

achievement(
    title = "Treasure Hunter", description = "Reach a Total of 50 Coins", points = 10,
    id = 4824, badge = "05470", published = "2/8/2014 2:39:51 PM", modified = "2/8/2014 2:42:08 PM",
    trigger = repeated(10, coin() >= 50)
)

achievement(
    title = "The Spoon", description = "Obtain the Spoon Item", points = 5,
    id = 4826, badge = "05446", published = "2/8/2014 2:40:10 PM", modified = "2/8/2014 2:42:15 PM",
    trigger = repeated(10, item() == 1)
)

achievement(
    title = "The Pot", description = "Obtain the Pot Item", points = 5,
    id = 4827, badge = "05451", published = "2/8/2014 2:40:14 PM", modified = "2/8/2014 2:42:19 PM",
    trigger = repeated(10, item() == 4)
)

achievement(
    title = "The Fork", description = "Obtain the Fork Item", points = 5,
    id = 4828, badge = "05452", published = "2/8/2014 2:40:17 PM", modified = "2/8/2014 2:42:21 PM",
    trigger = repeated(10, item() == 3)
)

achievement(
    title = "Plates", description = "Obtain the Plate Item", points = 5,
    id = 4829, badge = "05455", published = "2/8/2014 2:40:20 PM", modified = "2/8/2014 2:42:25 PM",
    trigger = repeated(10, item() == 2)
)

achievement(
    title = "Lolli-Pop", description = "Collect the Lollipop", points = 5,
    id = 4825, badge = "05449", published = "2/8/2014 2:39:57 PM", modified = "2/8/2014 2:42:11 PM",
    trigger = repeated(10, hp() == 3)
)

achievement(
    title = "Catch the Fish", description = "Catch a Total of 15 Fish in Stage 2 Minigame Catch the Fish", points = 10,
    id = 4830, badge = "05450", published = "2/8/2014 2:40:31 PM", modified = "1/21/2018 11:14:54 PM",
    trigger = repeated(10, minigames() == 15) && repeated(10, stage() == 1) && never(stage() != 1)
)

achievement(
    title = "Take the Egg", description = "Catch a Total of 10 Eggs in Stage 3 Minigame Take the Egg", points = 10,
    id = 4831, badge = "05456", published = "2/8/2014 2:40:35 PM", modified = "1/21/2018 11:14:57 PM",
    trigger = repeated(10, minigames() == 10) && repeated(10, stage() == 2) && never(stage() != 2)
)

achievement(
    title = "Fried Eggs", description = "Catch a Total of 10 Eggs in Stage 4 Minigame Take the Egg", points = 10,
    id = 4832, badge = "05460", published = "2/8/2014 2:40:39 PM", modified = "1/21/2018 11:15:00 PM",
    trigger = repeated(10, minigames() == 10) && repeated(10, stage() == 3) && never(stage() != 3)
)

achievement(
    title = "Go Fish", description = "Catch a Total of 15 Fish in Stage 5 Minigame Catch the Fish", points = 10,
    id = 4833, badge = "05463", published = "2/8/2014 2:40:42 PM", modified = "1/21/2018 11:15:03 PM",
    trigger = repeated(10, stage() == 4) && never(stage() != 4) && repeated(10, minigames() == 15)
)

achievement(
    title = "Popcorn Pete", description = "Defeat Popcorn Pete", points = 10,
    id = 4817, badge = "05447", published = "2/8/2014 2:37:30 PM", modified = "1/21/2018 11:15:10 PM",
    trigger = repeated(10, stage() == 0) && never(stage() != 0) && repeated(10, checkpoint() == 2) && 
              never(checkpoint() != 2) && repeated(10, boss_hp() == 255)
)

achievement(
    title = "Microwave Mick", description = "Defeat Microwave Mick", points = 10,
    id = 4818, badge = "05453", published = "2/8/2014 2:37:36 PM", modified = "1/21/2018 11:15:13 PM",
    trigger = repeated(10, stage() == 1) && never(stage() != 1) && repeated(10, checkpoint() == 3) && 
              never(checkpoint() != 3) && repeated(10, boss_hp() == 255)
)

achievement(
    title = "Willy Wok", description = "Defeat Willy Wok", points = 10,
    id = 4819, badge = "05457", published = "2/8/2014 2:37:44 PM", modified = "1/21/2018 11:15:17 PM",
    trigger = repeated(10, stage() == 2) && never(stage() != 2) && repeated(10, checkpoint() == 4) && 
              never(checkpoint() != 4) && repeated(10, boss_hp() == 255)
)

achievement(
    title = "Patty O'Burger", description = "Defeat Patty O'Burger", points = 10,
    id = 4820, badge = "05461", published = "2/8/2014 2:37:49 PM", modified = "1/21/2018 11:15:20 PM",
    trigger = repeated(10, stage() == 3) && never(stage() != 3) && repeated(10, checkpoint() == 5) && 
              never(checkpoint() != 5) && repeated(10, boss_hp() == 255)
)

achievement(
    title = "Frozen Fritta", description = "Defeat Frozen Fritta", points = 10,
    id = 4821, badge = "05464", published = "2/8/2014 2:37:53 PM", modified = "1/21/2018 11:15:24 PM",
    trigger = repeated(10, stage() == 4) && never(stage() != 4) && repeated(10, checkpoint() == 4) && 
              never(checkpoint() != 4) && repeated(10, boss_hp() == 255)
)

achievement(
    title = "Ohdove - The Mad Chef", description = "Defeat Ohdove", points = 10,
    id = 4822, badge = "05466", published = "2/8/2014 2:37:57 PM", modified = "1/21/2018 11:15:27 PM",
    trigger = repeated(10, stage() == 5) && never(stage() != 5) && repeated(10, checkpoint() == 6) && 
              never(checkpoint() != 6) && repeated(10, boss_hp() == 255)
)

rich_presence_conditional_display(screen() == 1, "Titles")
rich_presence_conditional_display(screen() == 2, "Intro")
rich_presence_display("Stage {0}, {1} lives",
    rich_presence_value("Stage", stage()),
    rich_presence_value("Lives", lives())
)