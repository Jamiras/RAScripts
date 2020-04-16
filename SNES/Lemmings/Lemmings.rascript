// Lemmings
// #ID = 993

// passwords: http://www.deinonych.com/lemmings/snes_codes.shtml (MGQZMGG = tricky 1)

// $006B: Number of currently saved Lemmings
function lemmings_saved() => byte(0x00006B)

// $00C2: difficulty
function difficulty() => byte(0x0000C2)

function mode() => byte(0x0000AE)
mode_titles = 0
mode_level_intro = 0x20
mode_level_start = 0x10
mode_level = 0x01

// $00EE: level code
function level() => byte(0x0000EE)

// $0176: Screen Register (*Mod2 Timer during gameplay)
//        07 = Results /w password or a loading level
//        06 = Level Menu
function screen() => byte(0x000176)

// $0290: Level Register
function level2() => byte(0x000290)

// $02D0: Level Register
function level3() => byte(0x0002D0)

// all achievements used this syntax before
//function trigger_complete_level(id, lemmings_needed) => 
//    trigger_complete_level(id) && never(level() < id) && never(level() > id) && 
//    once(lemmings_saved() == lemmings_needed) && never(lemmings_saved() < lemmings_needed) && never(lemmings_saved() > lemmings_needed)

function trigger_complete_level(id, lemmings_needed) => once(lemmings_saved() == 0) && lemmings_saved() >= lemmings_needed 
                                                     && never(level() != id) && screen() == 7

achievement(
    title = "Steel Works", description = "Complete level 1 on Mayhem difficulty and save 98% lemmings ", points = 4,
    id = 9755, badge = "09405", published = "7/2/2014 6:24:47 PM", modified = "7/3/2014 9:26:27 AM",
    trigger = trigger_complete_level(90, 98)
)

achievement(
    title = "The Other Side", description = "Complete level 12 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9766, badge = "09438", published = "7/2/2014 6:49:48 PM", modified = "7/3/2014 9:27:08 AM",
    trigger = trigger_complete_level(101, 75)
)

achievement(
    title = "We all fall down", description = "Complete level 11 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9765, badge = "09437", published = "7/2/2014 6:49:44 PM", modified = "7/3/2014 9:27:04 AM",
    trigger = trigger_complete_level(100, 80)
)

achievement(
    title = "Pillars of Hercules", description = "Complete level 10 on Mayhem difficulty and save 85% lemmings ", points = 4,
    id = 9764, badge = "09436", published = "7/2/2014 6:49:41 PM", modified = "7/3/2014 9:27:01 AM",
    trigger = trigger_complete_level(99, 64)
)

achievement(
    title = "Curse of the Pharoahs", description = "Complete level 9 on Mayhem difficulty and save 99% lemmings ", points = 4,
    id = 9763, badge = "09435", published = "7/2/2014 6:49:38 PM", modified = "9/23/2019 12:52:01 PM",
    trigger = trigger_complete_level(98, 99)
)

achievement(
    title = "Last one out is a rottern Egg!", description = "Complete level 8 on Mayhem difficulty and save 98% lemmings ", points = 4,
    id = 9762, badge = "09434", published = "7/2/2014 6:49:35 PM", modified = "7/3/2014 9:26:53 AM",
    trigger = trigger_complete_level(97, 98)
)

achievement(
    title = "Poles Apart", description = "Complete level 7 on Mayhem difficulty and save 96% lemmings ", points = 4,
    id = 9761, badge = "09411", published = "7/2/2014 6:25:07 PM", modified = "7/3/2014 9:26:48 AM",
    trigger = trigger_complete_level(96, 48)
)

achievement(
    title = "One way or another", description = "Complete level 6 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9760, badge = "09410", published = "7/2/2014 6:25:04 PM", modified = "7/3/2014 9:26:45 AM",
    trigger = trigger_complete_level(95, 75)
)

achievement(
    title = "Down, along, up. In that order", description = "Complete level 5 on Mayhem difficulty and save 90% lemmings ", points = 4,
    id = 9759, badge = "09409", published = "7/2/2014 6:24:59 PM", modified = "7/3/2014 9:26:42 AM",
    trigger = trigger_complete_level(94, 72)
)

achievement(
    title = "The Crossroads", description = "Complete level 4 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9758, badge = "09408", published = "7/2/2014 6:24:56 PM", modified = "7/3/2014 9:26:38 AM",
    trigger = trigger_complete_level(93, 100)
)

achievement(
    title = "It's hero time!", description = "Complete level 3 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9757, badge = "09407", published = "7/2/2014 6:24:53 PM", modified = "7/3/2014 9:26:34 AM",
    trigger = trigger_complete_level(92, 30)
)

achievement(
    title = "The Boiler Room", description = "Complete level 2 on Mayhem difficulty and save 97% lemmings ", points = 4,
    id = 9756, badge = "09406", published = "7/2/2014 6:24:50 PM", modified = "7/3/2014 9:26:30 AM",
    trigger = trigger_complete_level(91, 97)
)

achievement(
    title = "The Great Lemming Caper", description = "Complete level 13 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9795, badge = "09468", published = "7/3/2014 9:18:08 AM", modified = "7/3/2014 9:27:33 AM",
    trigger = trigger_complete_level(102, 2)
)

achievement(
    title = "We all fall down", description = "Complete level 30 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9754, badge = "09403", published = "7/2/2014 6:24:44 PM", modified = "7/3/2014 9:26:22 AM",
    trigger = trigger_complete_level(89, 60)
)

achievement(
    title = "How do I dig up the way?", description = "Complete level 29 on Taxing difficulty and save 98% lemmings ", points = 4,
    id = 9753, badge = "09402", published = "7/2/2014 6:24:41 PM", modified = "11/7/2014 5:29:31 AM",
    trigger = trigger_complete_level(88, 98)
    // && once(level2() == 213) && never(level2() < 213) && never(level2() > 213)
)

achievement(
    title = "POOR WEE CREATURES!", description = "Complete level 28 on Taxing difficulty and save 77% lemmings ", points = 4,
    id = 9752, badge = "09400", published = "7/2/2014 6:24:38 PM", modified = "7/3/2014 9:26:11 AM",
    trigger = trigger_complete_level(87, 77)
)

achievement(
    title = "Call in the bomb squad", description = "Complete level 27 on Taxing difficulty and save 92% lemmings ", points = 4,
    id = 9751, badge = "09399", published = "7/2/2014 6:24:35 PM", modified = "7/3/2014 9:26:07 AM",
    trigger = trigger_complete_level(86, 92)
)

achievement(
    title = "Triple Trouble", description = "Complete level 26 on Taxing difficulty and save 99% lemmings ", points = 4,
    id = 9750, badge = "09397", published = "7/2/2014 6:24:32 PM", modified = "12/23/2014 3:42:13 AM",
    trigger = trigger_complete_level(85, 99)
    // && once(level2() == 96) && never(level2() < 96) && never(level2() > 96)
)

achievement(
    title = "Follow the leader...", description = "Complete level 25 on Taxing difficulty and save 97% lemmings ", points = 4,
    id = 9749, badge = "09396", published = "7/2/2014 6:24:29 PM", modified = "7/3/2014 9:25:59 AM",
    trigger = trigger_complete_level(84, 97)
)

achievement(
    title = "Take a running jump.....", description = "Complete level 24 on Taxing difficulty and save 99% lemmings ", points = 4,
    id = 9748, badge = "09395", published = "7/2/2014 6:24:26 PM", modified = "7/3/2014 9:25:55 AM",
    trigger = trigger_complete_level(83, 99)
)

achievement(
    title = "King of the castle", description = "Complete level 23 on Taxing difficulty and save 97% lemmings ", points = 4,
    id = 9747, badge = "09394", published = "7/2/2014 6:24:22 PM", modified = "7/3/2014 9:25:51 AM",
    trigger = trigger_complete_level(82, 97)
)

achievement(
    title = "Come on over to my place", description = "Complete level 22 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9746, badge = "09393", published = "7/2/2014 6:24:19 PM", modified = "7/3/2014 9:25:47 AM",
    trigger = trigger_complete_level(81, 50)
)

achievement(
    title = "Feel the heat!", description = "Complete level 21 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9745, badge = "09391", published = "7/2/2014 6:24:16 PM", modified = "7/3/2014 9:25:43 AM",
    trigger = trigger_complete_level(80, 20)
)

achievement(
    title = "Walk the web rope", description = "Complete level 20 on Taxing difficulty and save 98% lemmings ", points = 4,
    id = 9744, badge = "09390", published = "7/2/2014 6:24:12 PM", modified = "7/3/2014 9:25:39 AM",
    trigger = trigger_complete_level(79, 89)
)

achievement(
    title = "All or Nothing", description = "Complete level 24 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9806, badge = "09480", published = "7/3/2014 9:18:56 AM", modified = "7/3/2014 9:28:11 AM",
    trigger = trigger_complete_level(113, 50)
)

achievement(
    title = "SUNSOFT SPECIAL 5", description = "Complete level 5 on Sunsoft difficulty and save 100% lemmings ", points = 10,
    id = 9817, badge = "09491", published = "7/3/2014 9:19:37 AM", modified = "12/23/2014 3:40:28 AM",
    trigger = trigger_complete_level(124, 50)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "SUNSOFT SPECIAL 4", description = "Complete level 4 on Sunsoft difficulty and save 100% lemmings ", points = 10,
    id = 9816, badge = "09490", published = "7/3/2014 9:19:34 AM", modified = "12/23/2014 3:39:59 AM",
    trigger = trigger_complete_level(123, 100)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "SUNSOFT SPECIAL 3", description = "Complete level 3 on Sunsoft difficulty and save 100% lemmings ", points = 10,
    id = 9815, badge = "09489", published = "7/3/2014 9:19:30 AM", modified = "12/23/2014 3:39:30 AM",
    trigger = trigger_complete_level(122, 20) 
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "SUNSOFT SPECIAL 2", description = "Complete level 2 on Sunsoft difficulty and save 82% lemmings ", points = 10,
    id = 9814, badge = "09488", published = "7/3/2014 9:19:26 AM", modified = "12/23/2014 3:38:45 AM",
    trigger = trigger_complete_level(121, 82)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "SUNSOFT SPECIAL 1", description = "Complete level 1 on Sunsoft difficulty and save 25% lemmings ", points = 10,
    id = 9813, badge = "09487", published = "7/3/2014 9:19:23 AM", modified = "12/23/2014 3:38:11 AM",
    trigger = trigger_complete_level(120, 1)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "Rendezvous at the Mountain", description = "Complete level 30 on Mayhem difficulty and save 87% lemmings ", points = 4,
    id = 9812, badge = "09486", published = "7/3/2014 9:19:19 AM", modified = "7/3/2014 9:28:32 AM",
    trigger = trigger_complete_level(119, 70)
)

achievement(
    title = "Save Me", description = "Complete level 29 on Mayhem difficulty and save 94% lemmings ", points = 4,
    id = 9811, badge = "09485", published = "7/3/2014 9:19:15 AM", modified = "7/3/2014 9:28:28 AM",
    trigger = trigger_complete_level(118, 94)
)

achievement(
    title = "Mind the step.....", description = "Complete level 28 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9810, badge = "09484", published = "7/3/2014 9:19:11 AM", modified = "7/3/2014 9:28:25 AM",
    trigger = trigger_complete_level(117, 1)
)

achievement(
    title = "Just a Minute (Part Two)", description = "Complete level 27 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9809, badge = "09483", published = "7/3/2014 9:19:08 AM", modified = "7/3/2014 9:28:21 AM",
    trigger = trigger_complete_level(116, 50)
)

achievement(
    title = "The Steel Mines of Kessel", description = "Complete level 26 on Mayhem difficulty and save 91% lemmings ", points = 4,
    id = 9808, badge = "09482", published = "7/3/2014 9:19:03 AM", modified = "7/3/2014 9:28:18 AM",
    trigger = trigger_complete_level(115, 91)
)

achievement(
    title = "Have a nice day!", description = "Complete level 25 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9807, badge = "09481", published = "7/3/2014 9:19:00 AM", modified = "7/3/2014 9:28:15 AM",
    trigger = trigger_complete_level(114, 100)
)

achievement(
    title = "Bomboozal", description = "Complete level 19 on Taxing difficulty and save 91% lemmings ", points = 4,
    id = 9743, badge = "09389", published = "7/2/2014 6:24:09 PM", modified = "7/3/2014 9:25:35 AM",
    trigger = trigger_complete_level(78, 64)
)

achievement(
    title = "Going up.......", description = "Complete level 23 on Mayhem difficulty and save 94% lemmings ", points = 4,
    id = 9805, badge = "09479", published = "7/3/2014 9:18:53 AM", modified = "12/23/2014 3:36:57 AM",
    trigger = trigger_complete_level(112, 94)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "A BeatII of a level", description = "Complete level 22 on Mayhem difficulty and save 98% lemmings ", points = 4,
    id = 9804, badge = "09478", published = "7/3/2014 9:18:49 AM", modified = "7/3/2014 9:28:04 AM",
    trigger = trigger_complete_level(111, 98)
)

achievement(
    title = "With a twist of lemming please", description = "Complete level 21 on Mayhem difficulty and save 98% lemmings ", points = 4,
    id = 9803, badge = "09477", published = "7/3/2014 9:18:45 AM", modified = "12/23/2014 3:31:13 AM",
    trigger = trigger_complete_level(110, 49)
)

achievement(
    title = "No added colors or Lemmings", description = "Complete level 20 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9802, badge = "09476", published = "7/3/2014 9:18:40 AM", modified = "7/3/2014 9:27:57 AM",
    trigger = trigger_complete_level(109, 50)
)

achievement(
    title = "Time to get up!", description = "Complete level 19 on Mayhem difficulty and save 94% lemmings ", points = 4,
    id = 9801, badge = "09474", published = "7/3/2014 9:18:36 AM", modified = "7/3/2014 9:27:54 AM",
    trigger = trigger_complete_level(108, 47)
)

achievement(
    title = "And then there were four....", description = "Complete level 18 on Mayhem difficulty and save 93% lemmings ", points = 4,
    id = 9800, badge = "09473", published = "7/3/2014 9:18:32 AM", modified = "7/3/2014 9:27:51 AM",
    trigger = trigger_complete_level(107, 93)
)

achievement(
    title = "Stepping Stones", description = "Complete level 17 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9799, badge = "09472", published = "7/3/2014 9:18:28 AM", modified = "7/3/2014 9:27:48 AM",
    trigger = trigger_complete_level(106, 80)
)

achievement(
    title = "Just a Minute...", description = "Complete level 16 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9798, badge = "09471", published = "7/3/2014 9:18:21 AM", modified = "7/3/2014 9:27:44 AM",
    trigger = trigger_complete_level(105, 50)
)

achievement(
    title = "The Fast Food Kitchen...", description = "Complete level 15 on Mayhem difficulty and save 96% lemmings ", points = 4,
    id = 9797, badge = "09470", published = "7/3/2014 9:18:17 AM", modified = "7/3/2014 9:27:41 AM",
    trigger = trigger_complete_level(104, 96)
)

achievement(
    title = "Pee Soup", description = "Complete level 14 on Mayhem difficulty and save 100% lemmings ", points = 4,
    id = 9796, badge = "09469", published = "7/3/2014 9:18:13 AM", modified = "7/3/2014 9:27:37 AM",
    trigger = trigger_complete_level(103, 80)
)

achievement(
    title = "MENACING!!", description = "Complete level 14 on tricky difficulty and save 96% lemmings", points = 4,
    id = 9659, badge = "09314", published = "7/1/2014 10:19:53 AM", modified = "10/13/2014 2:35:08 AM",
    trigger = trigger_complete_level(43, 77)
)

achievement(
    title = "Cascade", description = "Complete level 25 on tricky difficulty and save 10% lemmings", points = 4,
    id = 9670, badge = "09347", published = "7/1/2014 10:20:32 AM", modified = "7/3/2014 9:23:32 AM",
    trigger = trigger_complete_level(54, 10)
)

achievement(
    title = "Tightrope City", description = "Complete level 24 on tricky difficulty and save 97% lemmings", points = 4,
    id = 9669, badge = "09346", published = "7/1/2014 10:20:29 AM", modified = "7/3/2014 9:23:28 AM",
    trigger = trigger_complete_level(53, 78)
)

achievement(
    title = "From the boundary Line", description = "Complete level 23 on tricky difficulty and save 70% lemmings", points = 4,
    id = 9668, badge = "09344", published = "7/1/2014 10:20:25 AM", modified = "7/3/2014 9:23:22 AM",
    trigger = trigger_complete_level(52, 70)
)

achievement(
    title = "Turn around young lemmings!", description = "Complete level 22 on tricky difficulty and save 98% lemmings", points = 4,
    id = 9667, badge = "09342", published = "7/1/2014 10:20:22 AM", modified = "7/3/2014 9:23:18 AM",
    trigger = trigger_complete_level(51, 98)
)

achievement(
    title = "Ohayo Lemming san!", description = "Complete level 21 on tricky difficulty and save 98% or more lemmings", points = 4,
    id = 9666, badge = "09340", published = "7/1/2014 10:20:18 AM", modified = "9/22/2019 10:38:47 AM",
    trigger = trigger_complete_level(50, 79)
)

achievement(
    title = "One way digging to freedom", description = "Complete level 20 on tricky difficulty and save 98% lemmings", points = 4,
    id = 9665, badge = "09338", published = "7/1/2014 10:20:15 AM", modified = "9/22/2019 10:43:15 AM",
    trigger = trigger_complete_level(49, 98)
)

achievement(
    title = "Postcard From Lemmingland", description = "Complete level 19 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9664, badge = "09336", published = "7/1/2014 10:20:11 AM", modified = "7/3/2014 9:23:05 AM",
    trigger = trigger_complete_level(48, 50)
)

achievement(
    title = "It's Lemmingentry Watson", description = "Complete level 18 on tricky difficulty and save 90% lemmings", points = 4,
    id = 9663, badge = "09331", published = "7/1/2014 10:20:08 AM", modified = "7/3/2014 9:23:00 AM",
    trigger = trigger_complete_level(47, 9)
)

achievement(
    title = "Diet Lemmingaid", description = "Complete level 17 on tricky difficulty and save 96% lemmings", points = 4,
    id = 9662, badge = "09317", published = "7/1/2014 10:20:04 AM", modified = "7/3/2014 9:22:56 AM",
    trigger = trigger_complete_level(46, 48)
)

achievement(
    title = "Lovely Jubilee", description = "Complete level 16 on tricky difficulty and save 88% lemmings", points = 4,
    id = 9661, badge = "09316", published = "7/1/2014 10:20:00 AM", modified = "7/3/2014 9:22:52 AM",
    trigger = trigger_complete_level(45, 44)
)

achievement(
    title = "Ozone friendly Lemmings", description = "Complete level 15 on tricky difficulty and save 60% lemmings", points = 4,
    id = 9660, badge = "09315", published = "7/1/2014 10:19:56 AM", modified = "7/3/2014 9:22:47 AM",
    trigger = trigger_complete_level(44, 6)
)

achievement(
    title = "I have a cunning plan", description = "Complete level 26 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9671, badge = "09348", published = "7/1/2014 10:20:36 AM", modified = "7/3/2014 9:23:36 AM",
    trigger = trigger_complete_level(55, 100)
)

achievement(
    title = "Lemming Drops", description = "Complete level 13 on tricky difficulty and save 95% lemmings", points = 4,
    id = 9638, badge = "09302", published = "6/30/2014 5:19:13 PM", modified = "12/23/2014 3:46:57 AM",
    trigger = trigger_complete_level(42, 76)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "Bitter Lemmings", description = "Complete level 12 on tricky difficulty and save 98% lemmings", points = 4,
    id = 9637, badge = "09301", published = "6/30/2014 5:19:10 PM", modified = "7/3/2014 9:30:57 AM",
    trigger = trigger_complete_level(41, 49)
)

achievement(
    title = "Lemmings in the attic", description = "Complete level 11 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9636, badge = "09300", published = "6/30/2014 5:19:06 PM", modified = "7/3/2014 9:22:30 AM",
    trigger = trigger_complete_level(40, 50)
)

achievement(
    title = "They just keep on coming", description = "Complete level 9 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9635, badge = "09299", published = "6/30/2014 4:50:10 PM", modified = "7/3/2014 9:22:24 AM",
    trigger = trigger_complete_level(38, 75)
)

achievement(
    title = "Lemming sanctuary in sight", description = "Complete level 8 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9634, badge = "09298", published = "6/30/2014 4:50:01 PM", modified = "7/3/2014 9:22:20 AM",
    trigger = trigger_complete_level(37, 100)
)

achievement(
    title = "Lemmingology", description = "Complete level 6 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9633, badge = "09297", published = "6/30/2014 4:49:58 PM", modified = "7/3/2014 9:21:54 AM",
    trigger = trigger_complete_level(35, 5)
)

// 24771: I finished 99% on tricky difficulty level 4 and tricky difficulty level 5 achievement unlocked for some reason.
//        MD5: ecf0db12f88db32c4a129ff11af7f73d
achievement(
    title = "Careless clicking costs lives", description = "Complete level 5 on tricky difficulty and save 99% lemmings", points = 4,
    id = 9632, badge = "09296", published = "6/30/2014 4:49:54 PM", modified = "7/3/2014 9:30:25 AM",
    trigger = trigger_complete_level(34, 99)
)

achievement(
    title = "Here's one I prepared Earlier", description = "Complete level 4 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9631, badge = "09295", published = "6/30/2014 4:49:51 PM", modified = "9/22/2019 10:44:11 AM",
    trigger = trigger_complete_level(33, 100)
)

achievement(
    title = "A ladder would be handy", description = "Complete level 3 on tricky difficulty and save 99% lemmings", points = 2,
    id = 9630, badge = "09294", published = "6/30/2014 4:49:47 PM", modified = "7/3/2014 9:30:06 AM",
    trigger = trigger_complete_level(32, 99)
)

achievement(
    title = "This should be a doddle!", description = "Complete level 1 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9629, badge = "09292", published = "6/30/2014 4:49:44 PM", modified = "7/3/2014 9:21:38 AM",
    trigger = trigger_complete_level(30, 100)
)

achievement(
    title = "Every Lemming for himself!!!", description = "Complete level 7 on Taxing difficulty and save 99% lemmings", points = 4,
    id = 9682, badge = "09359", published = "7/1/2014 10:21:13 AM", modified = "7/3/2014 9:24:20 AM",
    trigger = trigger_complete_level(66, 99)
)

achievement(
    title = "Tribute to M.c.Escher", description = "Complete level 18 on Taxing difficulty and save 90% or more lemmings ", points = 4,
    id = 9742, badge = "09387", published = "7/2/2014 6:24:06 PM", modified = "7/26/2018 1:40:24 AM",
    trigger = trigger_complete_level(77, 68)
)

achievement(
    title = "X marks the spot", description = "Complete level 17 on Taxing difficulty and save 98% lemmings ", points = 4,
    id = 9741, badge = "09388", published = "7/2/2014 6:24:03 PM", modified = "7/3/2014 9:25:27 AM",
    trigger = trigger_complete_level(76, 98)
)

achievement(
    title = "Umbrella land", description = "Complete level 16 on Taxing difficulty and save 96% lemmings ", points = 4,
    id = 9740, badge = "09385", published = "7/2/2014 6:23:51 PM", modified = "12/23/2014 3:45:24 AM",
    trigger = trigger_complete_level(75, 96)
    // && once(level3() == 96) && never(level3() < 96) && never(level3() > 96)
)

achievement(
    title = "What an AWESOME level", description = "Complete level 15 on Taxing difficulty and save 97% lemmings ", points = 4,
    id = 9739, badge = "09384", published = "7/2/2014 6:23:46 PM", modified = "11/7/2014 5:12:56 AM",
    trigger = trigger_complete_level(74, 97)
    // && once(level2() == 213) && never(level2() < 213) && never(level2() > 213)
)

achievement(
    title = "Hunt the Nessy....", description = "Complete level 14 on Taxing difficulty and save 98% lemmings ", points = 4,
    id = 9738, badge = "09383", published = "7/2/2014 6:23:41 PM", modified = "12/23/2014 3:22:07 AM",
    trigger = trigger_complete_level(73, 98)
    // && once(level2() == 96) && never(level2() < 96) && never(level2() > 96)
)

achievement(
    title = "Upsidedown World", description = "Complete level 13 on Taxing difficulty and save 99% lemmings ", points = 4,
    id = 9737, badge = "09382", published = "7/2/2014 6:23:37 PM", modified = "7/3/2014 9:25:12 AM",
    trigger = trigger_complete_level(72, 99)
)

achievement(
    title = "Livin' On The Edge", description = "Complete level 12 on Taxing difficulty and save 80% lemmings ", points = 4,
    id = 9736, badge = "09381", published = "7/2/2014 6:23:34 PM", modified = "7/3/2014 9:25:09 AM",
    trigger = trigger_complete_level(71, 8)
)

achievement(
    title = "The ascending pillar scenario", description = "Complete level 11 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9735, badge = "09380", published = "7/2/2014 6:23:31 PM", modified = "7/3/2014 9:25:05 AM",
    trigger = trigger_complete_level(70, 50)
)

achievement(
    title = "Izzie Wizzie lemmings get busy", description = "Complete level 10 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9685, badge = "09362", published = "7/1/2014 10:21:24 AM", modified = "7/3/2014 9:24:32 AM",
    trigger = trigger_complete_level(69, 5)
)

achievement(
    title = "Perseverance", description = "Complete level 9 on Taxing difficulty and save 100% lemmings ", points = 4,
    id = 9684, badge = "09361", published = "7/1/2014 10:21:20 AM", modified = "7/3/2014 9:24:28 AM",
    trigger = trigger_complete_level(68, 20)
)

achievement(
    title = "The Art Gallery", description = "Complete level 8 on Taxing difficulty and save 100% lemmings", points = 4,
    id = 9683, badge = "09360", published = "7/1/2014 10:21:17 AM", modified = "7/3/2014 9:24:24 AM",
    trigger = trigger_complete_level(67, 100)
)

achievement(
    title = "Lock up your Lemmings", description = "Complete Fun difficulty and save all lemmings on level 30", points = 4,
    id = 9628, badge = "09293", published = "6/30/2014 4:49:40 PM", modified = "7/3/2014 9:32:25 AM",
    trigger = trigger_complete_level(29, 60)
)

achievement(
    title = "Compression Method 1", description = "Complete level 6 on Taxing difficulty and save 90% lemmings", points = 4,
    id = 9681, badge = "09358", published = "7/1/2014 10:21:10 AM", modified = "7/3/2014 9:24:17 AM",
    trigger = trigger_complete_level(65, 45)
)

achievement(
    title = "The Prison!", description = "Complete level 5 on Taxing difficulty and save 98% lemmings", points = 4,
    id = 9680, badge = "09357", published = "7/1/2014 10:21:06 AM", modified = "7/3/2014 9:24:13 AM",
    trigger = trigger_complete_level(64, 59)
)

achievement(
    title = "Lend a helping hand....", description = "Complete level 4 on Taxing difficulty and save 87% lemmings", points = 4,
    id = 9679, badge = "09356", published = "7/1/2014 10:21:02 AM", modified = "7/3/2014 9:24:09 AM",
    trigger = trigger_complete_level(63, 35)
)

achievement(
    title = "Paradise can wait (we hope!!!)", description = "Complete level 3 on Taxing difficulty and save 100% lemmings", points = 4,
    id = 9678, badge = "09355", published = "7/1/2014 10:20:59 AM", modified = "7/3/2014 9:24:05 AM",
    trigger = trigger_complete_level(62, 100)
)

achievement(
    title = "Watch out, there's traps about", description = "Complete level 2 on Taxing difficulty and save 94% lemmings", points = 4,
    id = 9677, badge = "09354", published = "7/1/2014 10:20:56 AM", modified = "12/23/2014 3:24:07 AM",
    trigger = trigger_complete_level(61, 94)
    // && once(level2() == 96) && never(level2() < 96) && never(level2() > 96)
)

// 23446: I got the cheevo after press select to change the difficult in level selection, after beat the "This should be a dooddle!"
//        MD5: 283c2e794c1eae82a31dfac608e76222
//        Emulator: RetroArch (1.8.1 - Snes9x (1.60 bd9246d))
achievement(
    title = "If at first you don't succeed..", description = "Complete level 1 on Taxing difficulty and save 99% lemmings", points = 4,
    id = 9676, badge = "09353", published = "7/1/2014 10:20:52 AM", modified = "7/26/2018 1:42:47 AM",
    trigger = trigger_complete_level(60, 99)
)

achievement(
    title = "The Crankshaft", description = "Complete level 30 on tricky difficulty and save 99% lemmings", points = 4,
    id = 9675, badge = "09352", published = "7/1/2014 10:20:49 AM", modified = "7/3/2014 9:23:53 AM",
    trigger = trigger_complete_level(59, 99)
)

achievement(
    title = "Rainbow Island", description = "Complete level 29 on tricky difficulty and save 100% lemmings", points = 4,
    id = 9674, badge = "09351", published = "7/1/2014 10:20:46 AM", modified = "11/7/2014 5:13:48 AM",
    trigger = trigger_complete_level(58, 100)
    // && once(level2() == 213) && never(level2() < 213) && never(level2() > 213)
)

achievement(
    title = "Exit in the ground", description = "Complete level 28 on tricky difficulty and save 99% lemmings", points = 4,
    id = 9673, badge = "09350", published = "7/1/2014 10:20:43 AM", modified = "7/3/2014 9:23:44 AM",
    trigger = trigger_complete_level(57, 99)
)

achievement(
    title = "The Island of the Wicker people", description = "Complete level 27 on tricky difficulty and save 95% lemmings", points = 4,
    id = 9672, badge = "09349", published = "7/1/2014 10:20:39 AM", modified = "7/3/2014 9:23:40 AM",
    trigger = trigger_complete_level(56, 95)
)

difficulties = {
    0: "Fun",
    1: "Tricky",
    2: "Taxing",
    3: "Mayhem"
}

levels = {
    120: "Sunsoft Special 1",
    121: "Sunsoft Special 2",
    122: "Sunsoft Special 3",
    123: "Sunsoft Special 4",
    124: "Sunsoft Special 5",
}

for i in range(0, 3)
{
    for j in range(1, 30)
        levels[i*30+j-1] = format("Level {0} {1}", j, difficulties[i])
}

rich_presence_conditional_display(mode() == 0 || level() == 0xFF, "Titles")

rich_presence_display("Guiding the Lemmings to the exit on {0}",
    rich_presence_lookup("Level", level(), levels),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)
