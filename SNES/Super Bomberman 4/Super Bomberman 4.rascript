// Super Bomberman 4
// #ID = 1374
// MD5: df33e261104efee409de8f294d80ad6e (J)

// $0013: in game = FF
function in_game() => byte(0x0013) == 0xFF

// $0092: Stage
function current_stage() => byte(0x000092)

// $009A: in demo
function in_demo() => byte(0x009A) != 0

// $00C2: Steps?
// $00C4: Steps?
// $00CA: Stage Complete 1
// $00CB: Stage Complete 2
// $00EB: help for time death
// $017A: Screen status display

// $01A8: Lifes
function current_lives() => byte(0x0001A8)

// $021A: World 5 Boss

// $0340: Item Speed Boots
function boots() => byte(0x000340)

// $0341: Bombs
function bombs() => byte(0x000341)

// $0342: Max Bombs
function max_bombs() => byte(0x000342)

// $0343: Tipe of Bomb[00 = normal] [01 = remote]
//        [02 = spike] [03 = D] [04 = S] [05 = H]
function type_of_bomb() => byte(0x000343)

// $0344: Fire
function fire() => byte(0x000344)

// $0347: Item Heart
function heart() => byte(0x000347)

// $0348: Item Punch
function punch() => byte(0x000348)

// $0349: Item Hand
function hand() => byte(0x000349)

// $034A: Kick Bomb
function kick_bomb() => byte(0x00034A)

// $034B: Wall

// $034C: Item Walk on bombs
function walk_on_bombs() => byte(0x00034C)

// $034D: Skull
function skull() => byte(0x00034D)

// $0394: Time death

// $0397: invencible
function invincible() => byte(0x000397)

// $03D8: Item P
// $0440: Speed boots player 2
// $0740: help
// $07B0: help 2
// $07D2: Sub Boss Health
// $07DC: [Help Value to make cheevs]
// $1539: Boss Health / Last world 5 boss 4 ball 1
function boss_hp() => byte(0x1539)

// $1592: World Selection [X-1/2/3/4/5/6/7/8]
function sub_world() => byte(0x001592)

// $1598: World selection [1/2/3/4/5-X]
function world() => byte(0x001598)

// $1599: Last World 5 Boss 4 ball 4
// $15E0: help
// $15F9: Boss 4 ball 1 / Last World Boss 2
// $1659: Boss 4 ball 2
// $16B9: Boss 4 ball 3 / Last World 5 Boss 1 /
//        Last World 5 Boss 4 Ball 3
// $1719: Boss 4 ball 4
// $172C: Boss 1 explosion
// $172D: Boss 1 explosion 2
// $1779: Boss 4 ball 5
// $17D9: Last World 5 Boss 4 Ball 6
// $1839: Last Boss Brain HP
// $1959: Last World 5 Boss 4 Head / Last World 5 Boss 2
// $1A19: World 5 Boss 3
// $1A79: Last World 5 Boss 4 Ball 2
// $1B99: Last World 5 Boss 4 Ball 5 / Last Boss HP
// $1BF9: Last World boss 2 / Last World boss 3
// $1EBA: Number of Mosnters
// $1EC7: Push Start screen player 1
// $1EC8: push start screen player 2

// $1ED0: Seconds
function seconds() => byte(0x001ED0)

// $1ED2: Minutes
function minutes() => byte(0x001ED2)

// $1ED8: Boss help

// $1F0E: mode
function mode() => byte(0x1F0E)
mode_battle = 0
mode_titles = 1
mode_normal = 2

achievement(
    title = "Hammer Bomber", description = "Defeat Hammer bomber", points = 10,
    id = 5674, badge = "06195", published = "2/27/2014 5:55:31 AM", modified = "2/27/2014 5:56:41 AM",
    trigger = current_stage() == 6 && byte(0x0007D2) == 0 && byte(0x0007B0) == 233
)

achievement(
    title = "Jet Bomber", description = "Defeat Jet Bomber", points = 10,
    id = 5675, badge = "06196", published = "2/27/2014 5:55:36 AM", modified = "2/27/2014 5:56:46 AM",
    trigger = current_stage() == 14 && byte(0x0007D2) == 0 && byte(0x0007B0) == 233
)

achievement(
    title = "Lady Bomber", description = "Defeat Lady Bomber", points = 10,
    id = 5676, badge = "06197", published = "2/27/2014 5:55:42 AM", modified = "2/27/2014 5:56:49 AM",
    trigger = current_stage() == 22 && byte(0x0007D2) == 0 && byte(0x0007B0) == 233
)

achievement(
    title = "Bazooka Bomber", description = "Defeat Bazooka Bomber", points = 10,
    id = 5677, badge = "06198", published = "2/27/2014 5:55:47 AM", modified = "2/27/2014 5:56:52 AM",
    trigger = current_stage() == 30 && byte(0x0007D2) == 0 && byte(0x0007B0) == 233
)

// Ticket 1110: these triggered when reaching respective bosses stage rather than when beating them
function trigger_mini_boss(stage) => never(current_stage() != stage) && byte(0x07D2) == 0 && once(byte(0x07D2) != 0) && byte(0x07B0) == 233
achievement(
    title = "Morning Star", description = "Defeat Hammer bomber on Stage 5", points = 20,
    id = 5678, badge = "06199", published = "2/27/2014 5:55:52 AM", modified = "2/27/2014 5:56:54 AM",
    trigger = trigger_mini_boss(32)
)

// Ticket 13422: Achievement triggered when the battle started (Before defeating Jet Bomber)
//               //               Items - Maxed out Fire/Bombs, Bomb Control, Walk Through Walls, Kick Bombs (idk the name sorry lol),
//               Glove for throwing bombs (same) and Glove for punching bombs (same).
//               MD5: df33e261104efee409de8f294d80ad6e
achievement(
    title = "Jet-Pack", description = "Defeat Jet bomber on Stage 5", points = 20,
    id = 5679, badge = "06200", published = "2/27/2014 5:55:57 AM", modified = "2/27/2014 5:56:57 AM",
    trigger = trigger_mini_boss(33)
)

// Ticket 1111: these triggered when reaching respective bosses stage rather than when beating them
achievement(
    title = "Fire Lasers", description = "Defeat Lady bomber on Stage 5", points = 20,
    id = 5680, badge = "06201", published = "2/27/2014 5:56:00 AM", modified = "2/27/2014 5:56:59 AM",
    trigger = trigger_mini_boss(34)
)

// Ticket 1112: these triggered when reaching respective bosses stage rather than when beating them
achievement(
    title = "Flame Thrower", description = "Defeat Bazooka bomber on Stage 5", points = 20,
    id = 5681, badge = "06202", published = "2/27/2014 5:56:04 AM", modified = "2/27/2014 5:57:02 AM",
    trigger = trigger_mini_boss(35)
)

// Ticket 1113: these triggered when reaching respective bosses stage rather than when beating them
achievement(
    title = "Great Bomber", description = "Defeat Great bomber", points = 30,
    id = 5682, badge = "06203", published = "2/27/2014 5:56:07 AM", modified = "2/27/2014 5:57:05 AM",
    trigger = trigger_mini_boss(36)
)

// triggers during demo
function trigger_boss(stage) => never(current_stage() != stage) && byte(0x07B0) == 233 && byte(0x1539) == 0 && 
                                in_game() && mode() == mode_normal && once(boss_hp() != 0)
achievement(
    title = "BOSS 1", description = "Meet with Machine No.1 in World 1", points = 10,
    id = 6042, badge = "06493", published = "3/10/2014 11:01:19 PM", modified = "4/1/2014 1:28:09 PM",
    trigger = trigger_boss(7)
)

achievement(
    title = "BOSS 2", description = "Defeat Boss on World 2", points = 10,
    id = 6043, badge = "06494", published = "3/10/2014 11:01:23 PM", modified = "3/10/2014 11:06:22 PM",
    trigger = trigger_boss(15)
)

achievement(
    title = "BOSS 3", description = "Defeat Boss on World 3", points = 10,
    id = 6044, badge = "06495", published = "3/10/2014 11:01:28 PM", modified = "3/10/2014 11:06:26 PM",
    trigger = trigger_boss(23)
)

achievement(
    title = "BOSS 4", description = "Defeat Boss on World 4", points = 15,
    id = 6045, badge = "06496", published = "3/10/2014 11:01:32 PM", modified = "3/11/2014 8:56:01 PM",
    trigger = trigger_boss(31) && byte(0x001659) == 0 && 
              byte(0x0016B9) == 0 && byte(0x001719) == 0 && byte(0x001779) == 0 && byte(0x001599) == 0
)

achievement(
    title = "Super Challenge Bomber [1]", description = "Defeat Boss 1 on World 5 - 6", points = 10,
    id = 6046, badge = "06493", published = "3/10/2014 11:02:50 PM", modified = "3/10/2014 11:06:35 PM",
    trigger = current_stage() == 37 && byte(0x00021A) == 2
)

achievement(
    title = "Super Challenge Bomber [2]", description = "Defeat Boss 2 on World 5 - 6", points = 10,
    id = 6047, badge = "06494", published = "3/10/2014 11:02:54 PM", modified = "3/10/2014 11:06:39 PM",
    trigger = current_stage() == 37 && byte(0x00021A) == 3
)

achievement(
    title = "Super Challenge Bomber [3]", description = "Defeat Boss 3 on World 5 - 6", points = 10,
    id = 6048, badge = "06495", published = "3/10/2014 11:02:59 PM", modified = "3/10/2014 11:06:44 PM",
    trigger = current_stage() == 37 && byte(0x00021A) == 4
)

achievement(
    title = "Super Challenge Bomber [4]", description = "Defeat Boss 4 on World 5 - 6", points = 15,
    id = 6049, badge = "06496", published = "3/10/2014 11:03:04 PM", modified = "3/10/2014 11:06:48 PM",
    trigger = current_stage() == 37 && byte(0x00021A) == 5
)

// Ticket 1114: these trigger on the the second to last phase of the final boss
achievement(
    title = "Bagular Head", description = "Defeat Bagular Head on World 5", points = 15,
    id = 6050, badge = "06499", published = "3/10/2014 11:04:05 PM", modified = "3/10/2014 11:06:53 PM",
    trigger = current_stage() == 37 && never(byte(0x00021A) != 5) && byte(0x001B99) == 0 && byte(0x00CC) == 1
)

achievement(
    title = "Full of Life", description = "Have 9 Lifes", points = 5,
    id = 5539, badge = "06072", published = "2/22/2014 5:57:15 PM", modified = "2/22/2014 10:38:08 PM",
    trigger = current_lives() == 9
)

// Ticket 4359: Triggered while Bagular Head is beginning his fight.
function complete_game() => current_stage() == 37 &&   // 5-6
                            byte(0x00021A) == 5 &&     // bagular head
                            byte(0x00C1) == 255        // ending cinematic
achievement(
    title = "THE END", description = "Beat The Game", points = 15,
    id = 6051, badge = "06492", published = "3/10/2014 11:04:09 PM", modified = "3/11/2014 10:44:17 PM",
    trigger = complete_game()
)

achievement(
    title = "Remote Bomb", description = "Take Remote Bomb", points = 5,
    id = 5540, badge = "06073", published = "2/22/2014 6:55:40 PM", modified = "2/22/2014 10:38:27 PM",
    trigger = type_of_bomb() == 1
)

// Ticket 10426: It seems that this is related to the first mount of the game that has the ability to drop spike bomb
//               ...
//               When I got the thorn bomb while riding the creature the achievemnt did not unlock ...
//               After that I tried to get the spike bomb in other ways and nothing ...I reseted the achievements of
//               the game on the site, I took the spike bomb without the mount and then it worked.
//               MD5: aec3e80ae5bc8928d7e758a9e289e01e
achievement(
    title = "Spike Bomb", description = "Take Spike Bomb", points = 5,
    id = 5541, badge = "06074", published = "2/22/2014 6:55:45 PM", modified = "2/22/2014 10:38:22 PM",
    trigger = type_of_bomb() == 2
)

achievement(
    title = "Max Fire", description = "Reach on Max Fire Power", points = 5,
    id = 5543, badge = "06085", published = "2/22/2014 9:39:26 PM", modified = "2/23/2014 10:22:26 PM",
    trigger = fire() == 7
)

achievement(
    title = "Max Bomb", description = "Reach on Max number of bombs that you can carry", points = 5,
    id = 5544, badge = "06086", published = "2/22/2014 9:39:31 PM", modified = "2/23/2014 10:22:47 PM",
    trigger = max_bombs() == 8
)

achievement(
    title = "Max Speed", description = "Reach on Max Speed", points = 5,
    id = 5545, badge = "06087", published = "2/22/2014 9:39:35 PM", modified = "2/23/2014 10:23:05 PM",
    trigger = boots() == 5
)

achievement(
    title = "Second Chance", description = "Take a Heart", points = 5,
    id = 5546, badge = "06089", published = "2/22/2014 9:39:44 PM", modified = "2/23/2014 10:38:36 PM",
    trigger = heart() == 255
)

achievement(
    title = "walk on walls", description = "Take Wall Item", points = 5,
    id = 5547, badge = "06091", published = "2/22/2014 9:39:48 PM", modified = "2/23/2014 10:45:40 PM",
    trigger = byte(0x00034B) == 255
)

achievement(
    title = "Let's give some Punches", description = "Take Punch Item", points = 5,
    id = 5548, badge = "06093", published = "2/22/2014 9:39:51 PM", modified = "2/23/2014 11:01:30 PM",
    trigger = punch() == 255
)

achievement(
    title = "Let's Throw Some Bombs", description = "Take Hand Item", points = 5,
    id = 5549, badge = "06094", published = "2/22/2014 9:39:54 PM", modified = "2/23/2014 11:06:19 PM",
    trigger = hand() == 255
)

achievement(
    title = "Goal!!!", description = "Take Kick Bomb Item", points = 5,
    id = 5550, badge = "06095", published = "2/22/2014 9:39:57 PM", modified = "2/23/2014 11:01:39 PM",
    trigger = kick_bomb() == 255
)

achievement(
    title = "Walk on Bombs", description = "Take Pass Bombs Item", points = 5,
    id = 5551, badge = "06097", published = "2/22/2014 9:40:01 PM", modified = "2/23/2014 11:06:44 PM",
    trigger = walk_on_bombs() == 255
)

achievement(
    title = "World 2", description = "Reach on World 2", points = 10,
    id = 5554, badge = "06068", published = "2/22/2014 10:30:09 PM", modified = "2/22/2014 10:39:13 PM",
    trigger = world() == 1 && sub_world() == 0 && byte(0x001596) == 1
)

achievement(
    title = "World 3", description = "Reach on World 3", points = 10,
    id = 5555, badge = "06069", published = "2/22/2014 10:30:14 PM", modified = "2/22/2014 10:39:16 PM",
    trigger = world() == 2 && sub_world() == 0 && byte(0x001596) == 2
)

achievement(
    title = "World 4", description = "Reach on World 4", points = 10,
    id = 5556, badge = "06070", published = "2/22/2014 10:30:19 PM", modified = "2/22/2014 10:39:18 PM",
    trigger = world() == 3 && sub_world() == 0 && byte(0x001596) == 3
)

achievement(
    title = "World 5", description = "Reach on World 5", points = 10,
    id = 5557, badge = "06071", published = "2/22/2014 10:30:37 PM", modified = "2/22/2014 10:39:21 PM",
    trigger = world() == 4 && sub_world() == 0 && byte(0x001596) == 4
)

// Ticket 4361: Triggered when the first form of Bagular Head was finished, but second phase yet to begin.
achievement(
    title = "THE SPIKE END", description = "Beat The Game using spike bomb", points = 10,
    id = 6130, badge = "06492", published = "3/11/2014 10:37:16 PM", modified = "3/11/2014 10:44:21 PM",
    trigger = complete_game() && type_of_bomb() == 2
)

// Ticket 4363: Triggered when Bagular Head began fighting.
// Ticket 1115: these trigger on the the second to last phase of the final boss
achievement(
    title = "THE REMOTE END", description = "Beat The Game using remote bomb", points = 10,
    id = 6131, badge = "06492", published = "3/11/2014 10:37:22 PM", modified = "3/11/2014 10:44:26 PM",
    trigger = complete_game() && type_of_bomb() == 1
)

// Ticket 4360: Triggered while Bagular Head is beginning his fight.
achievement(
    title = "THE BOMB HEART END", description = "Beat The Game using normal bomb and with 9 lifes", points = 10,
    id = 6132, badge = "06492", published = "3/11/2014 10:37:28 PM", modified = "3/11/2014 10:51:54 PM",
    trigger = complete_game() && type_of_bomb() == 0 && current_lives() == 9
)


rich_presence_conditional_display(in_demo(), "Demo")
rich_presence_conditional_display(mode() == mode_titles, "Titles")
rich_presence_conditional_display(mode() == mode_battle, "Battle Mode")

rich_presence_display("Area {0}-{1}, {2} lives",
    rich_presence_value("World", bit3(0x0092) + high4(0x0092) * 2 + 1),
    rich_presence_value("Stage", bit0(0x0092) + bit1(0x0092)*2 + bit2(0x0092)*4 + 1),
    rich_presence_value("Lives", byte(0x01A8))
)
