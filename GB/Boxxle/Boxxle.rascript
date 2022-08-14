// Boxxle
// #ID = 6442

// $C002: Character Sprite:
//        0x7b=win pose on small sized level
//        0x7f=win pose on a large sized level
function character_sprite() => byte(0x00C002)

// $C0D0: Orientation: 0=Right, 1=Left, 2=Up, 3=Down
function orientation() => byte(0x00C0D0)

// $C0EF: Idle timer (frames)
function idle_timer() => byte(0x00C0EF)

// $C0FA: 01=Pause
function pause() => byte(0x00C0FA)

// $C0FC: Menu Option (0 based)
function menu_option() => byte(0x00C0FC)

// $C11F: Passkey - 1st Character; When playing equals world (0 based)
function world() => byte(0x00C11F)

// $C122: Passkey - 4th Character
function password4() => byte(0x00C122)

// $C2D6: [2 Byte] Steps (Up to 0x1388 or 5000, loops back to 1 afterwards)
//        Write to 0xcd2--4 as BCD also writes to 0xc2d8
function steps_taken() => word(0x00C2D6)

// $C2ED: Mode: 0=Play, 1=Create/hidden level 2,
//        2=hidden levels 1?
function mode() => byte(0x00C2ED)
mode_play = 0

// $C2EE: Level (0 based)
function level() => byte(0x00C2EE)

// $C2F7: Sound Test - Music ID
function music() => byte(0x00C2F7)

// $C300: Stage Complete indicator
//        42 (72,9e,42,b2,9e,72,27,42) etc
//        has seqence for pause
//        9e seems stable for stage complete
function stage_complete() => byte(0x00C300)

// $FF11: if c0 = password or main menu or cutscene
function screen() => byte(0x00FF11)

function level_challenge(name, world_num, level_num, steps, points, id, badge)  
{
    description = "Beat " + world_num + "-"
    if (level_num < 10)
        description = description + "0"
    description = description + level_num + " with " + steps + " steps or less"
    
    achievement(name, description, points, id = id, badge = badge,
        trigger = once(steps_taken() == 0) &&
                  never(steps_taken() > steps) &&
                  mode() == mode_play && 
                  world() == world_num - 1 &&
                  level() == level_num - 1 &&
                  trigger_when(character_sprite() == 127)
    )
}

function level_challenge_sm(name, world_num, level_num, steps, points, id, badge)  
{
    description = "Beat " + world_num + "-"
    if (level_num < 10)
        description = description + "0"
    description = description + level_num + " with " + steps + " steps or less"
    
    achievement(name, description, points, id = id, badge = badge,
        trigger = once(steps_taken() == 0) &&
                  never(steps_taken() > steps) &&
                  mode() == mode_play && 
                  world() == world_num - 1 &&
                  level() == level_num - 1 &&
                  trigger_when(character_sprite() == 123)
    )
}

level_challenge_sm("Precocious",               1, 1,   93,  1, 45264, "46070")
level_challenge_sm("Zeal",                     1, 1,   89,  2, 45269, "46071")
level_challenge   ("Last Crusade",             1, 6,  145,  5, 45098, "46070")
level_challenge   ("What a Mess",              2, 6,  870,  5, 45657, "46070")
level_challenge_sm("One Annoying Block",       2, 9,   70,  5, 45659, "46070")
level_challenge   ("Faucet",                   3, 2,  453,  5, 45663, "46070")
level_challenge   ("The Church of Boxes",      3, 6,  524,  5, 45661, "46070")
level_challenge   ("Stairs",                   4, 2,  694,  5, 45667, "46070")
level_challenge   ("Worn Out Shoes",           4, 7, 1152, 10, 45665, "46071")
level_challenge   ("The Number of the Beast",  5, 2,  666, 10, 45707, "46071")
level_challenge   ("Uzi",                      5, 8,  740, 10, 45709, "46070")
level_challenge   ("Two Annoying Blocks",      5, 9,  125, 10, 45710, "46070")
level_challenge   ("Main Room",                6, 5,  650, 10, 45713, "46070")
level_challenge   ("East Coast",               6, 6, 1407, 25, 45714, "46071")
level_challenge   ("Cornered",                 6, 8,  850, 10, 45715, "46070")
level_challenge   ("Castle",                   7, 2,  600, 10, 45716, "46070")
level_challenge   ("Tomahawk",                 7, 5,  746, 25, 45717, "46071")
level_challenge   ("Parallels",                7, 8,  500, 10, 45718, "46070")
level_challenge   ("Surrounded",               8, 1,  630, 10, 45719, "46070")
level_challenge   ("Hold the Line",            8, 3, 1122, 25, 45720, "46071")
level_challenge   ("Diamond",                  8, 6,  165, 10, 45721, "46070")
level_challenge   ("Lift",                     9, 3,  832, 10, 45722, "46071")
level_challenge   ("D-Pad",                    9, 4,  180,  5, 45723, "46070")
level_challenge   ("Mill",                     9, 5,  400, 10, 45724, "46070")
level_challenge   ("Corridor",                10, 1,  520,  5, 45725, "46070")
level_challenge   ("Pickaxe",                 10, 4,  430,  5, 45726, "46070")
level_challenge   ("Labyrinth",               10, 7, 1036, 10, 45727, "46071")
level_challenge   ("Checkered",               11, 1,  460, 10, 45728, "46070")
level_challenge   ("Train",                   11, 2, 1301, 25, 45729, "46071")
level_challenge   ("Turtle",                  11, 3, 1193, 10, 45730, "46070")
level_challenge   ("X-Rated",                 11, 7,  935, 10, 45731, "46070")

// Ticket 43916: Achievement triggers when solving CREA-3. Q Spade M Y
//               MD5: 239fd20f424ee53d2f11018dbd942df4
//               Emulator: RetroArch (Gambatte)
//               Emulator Version: 1.9.14
achievement(
    title = "Hyperactive (2)", description = "Beat hidden level 2 without pausing or letting the guy sleep", points = 10,
    id = 45743, badge = "46341", published = "3/1/2017 11:26:26 PM", modified = "10/21/2019 11:02:01 PM",
    trigger = never(mode() != 1) && never(menu_option() != 1) && word(0x00C002) == 123 && once(byte(0x00C2D6)
               == 0) && never(pause() == 1) && never(word(0x00C002) == 188)
)

// Ticket 36477: Entered Password Q, Spade, X, 4. Finished Level withous pause or letting guy sleep. Doesn't Triggered
//               MD5: 239fd20f424ee53d2f11018dbd942df4
//               Emulator: RetroArch (Gambatte v.0.5.0-netlink)
achievement(
    title = "Hyperactive (1)", description = "Beat hidden level 1 without pausing or letting the guy sleep", points = 10,
    id = 45742, badge = "46341", published = "3/1/2017 11:26:23 PM", modified = "10/21/2019 11:02:01 PM",
    trigger = never(mode() != 2) && never(menu_option() != 1) && word(0x00C002) == 127 && once(byte(0x00C2D6)
               == 0) && never(pause() == 1) && never(word(0x00C002) == 196)
)

// Ticket 43917: Achievement triggers when solving CREA-3.
//               MD5: 239fd20f424ee53d2f11018dbd942df4
//               Emulator: RetroArch (Gambatte)
//               Emulator Version: 1.9.14
achievement(
    title = "Final countdown (2)", description = "Beat hidden level 2", points = 5,
    id = 45741, badge = "46339", published = "3/1/2017 11:26:20 PM", modified = "10/3/2019 6:27:01 PM",
    trigger = mode() == 1 && menu_option() == 1 && word(0x00C002) == 123
)

// Ticket 36476: Entered Password Q, Spade, X, 4. Finished Level. Doesn't Triggered
//               MD5: 239fd20f424ee53d2f11018dbd942df4
//               Emulator: RetroArch (Gambatte v.0.5.0-netlink)
achievement(
    title = "Final countdown (1)", description = "Beat hidden level 1", points = 5,
    id = 45740, badge = "46339", published = "3/1/2017 11:26:16 PM", modified = "10/21/2019 11:02:01 PM",
    trigger = mode() == 2 && menu_option() == 1 && word(0x00C002) == 127
)



achievement(
    title = "It's Heavy!", description = "Beat Level 1-10 and reach Level 2", points = 3,
    id = 45188, badge = "45999", published = "2/15/2017 4:24:04 PM", modified = "6/1/2020 6:00:48 AM",
    trigger = word(0x00C11E) == 256 && prev(word(0x00C11E)) == 0 && screen() != 192 && prev(character_sprite()) == 123 && 
              prev(level()) == 9 && level() == 0
)

achievement(
    title = "Pay-Day", description = "Beat Level 2-10 and reach Level 3", points = 5,
    id = 45189, badge = "46000", published = "2/15/2017 4:24:07 PM", modified = "5/28/2020 5:28:27 AM",
    trigger = word(0x00C11E) == 512 && prev(word(0x00C11E)) == 256 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 123
)

achievement(
    title = "Oh No!", description = "Beat Level 3-10 and reach Level 4", points = 5,
    id = 45190, badge = "46001", published = "2/15/2017 4:24:10 PM", modified = "5/28/2020 5:28:25 AM",
    trigger = word(0x00C11E) == 768 && prev(word(0x00C11E)) == 512 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "I'll Try Again", description = "Beat Level 4-10 and reach level 5", points = 10,
    id = 45191, badge = "45997", published = "2/15/2017 4:24:13 PM", modified = "6/1/2020 6:00:44 AM",
    trigger = word(0x00C11E) == 1024 && prev(word(0x00C11E)) == 768 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "I Can't Give Up", description = "Beat Level 5-10 and reach Level 6", points = 10,
    id = 45192, badge = "46002", published = "2/15/2017 4:24:17 PM", modified = "6/1/2020 6:00:42 AM",
    trigger = word(0x00C11E) == 1280 && prev(word(0x00C11E)) == 1024 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "I'll Succeed Soon", description = "Beat Level 6-10 and reach Level 7", points = 10,
    id = 45193, badge = "46003", published = "2/15/2017 4:24:23 PM", modified = "6/1/2020 6:00:39 AM",
    trigger = word(0x00C11E) == 1536 && prev(word(0x00C11E)) == 1280 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "What?", description = "Beat Level 7-10 and reach Level 8", points = 10,
    id = 45194, badge = "46004", published = "2/15/2017 4:24:26 PM", modified = "6/1/2020 6:00:37 AM",
    trigger = word(0x00C11E) == 1792 && prev(word(0x00C11E)) == 1536 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "Who's That?", description = "Beat Level 8-10 and reach Level 9", points = 10,
    id = 45195, badge = "46005", published = "2/15/2017 4:24:29 PM", modified = "6/1/2020 6:00:35 AM",
    trigger = word(0x00C11E) == 2048 && prev(word(0x00C11E)) == 1792 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "Is That Her?", description = "Beat Level 9-10 and reach Level 10", points = 10,
    id = 45196, badge = "46006", published = "2/15/2017 4:24:31 PM", modified = "5/28/2020 5:28:16 AM",
    trigger = word(0x00C11E) == 2304 && prev(word(0x00C11E)) == 2048 && prev(level()) == 9 && level() == 0 && 
              prev(character_sprite()) == 127
)

achievement(
    title = "That's Her", description = "Beat Level 10-10 and reach Level 11", points = 10,
    id = 45197, badge = "46007", published = "2/15/2017 4:24:34 PM", modified = "5/28/2020 5:28:14 AM",
    trigger = word(0x00C11E) == 2560 && prev(word(0x00C11E)) == 2304 && prev(character_sprite()) == 127 && 
              prev(level()) == 9 && level() == 0
)

achievement(
    title = "Storekeeper of my Heart", description = "Beat 11-08 and reach the end of the game", points = 25,
    id = 45198, badge = "45998", published = "2/15/2017 4:24:59 PM", modified = "5/28/2020 5:26:35 AM",
    trigger = word(0x00C11E) == 2816 && prev(word(0x00C11E)) == 2560 && prev(character_sprite()) == 123 && 
              prev(level()) == 7 && level() == 0
)

achievement(
    title = "Music Lover", description = "Enter sound test", points = 1,
    id = 45266, badge = "46108", published = "2/17/2017 10:54:53 PM", modified = "5/28/2020 5:26:34 AM",
    trigger = music() >= 1 && music() <= 7
)

achievement(
    title = "Badaboum !", description = "Let him get a rest (inactive for 60 seconds)", points = 1,
    id = 45265, badge = "45996", published = "2/17/2017 10:22:18 PM", modified = "5/28/2020 5:26:32 AM",
    trigger = orientation() == 0 &&
              ((once(word(0x00C002) == 188) && once(word(0x00C002) == 192)) ||
               (once(word(0x00C002) == 196) && once(word(0x00C002) == 197)))
)

achievement(
    title = "DIY", description = "Play a level you created", points = 1,
    id = 45267, badge = "46107", published = "2/17/2017 10:56:21 PM", modified = "12/12/2021 10:29:02 PM",
    trigger = once(mode() == 1) && screen() != 192 && idle_timer() != 0 && menu_option() == 0 && 
              (character_sprite() == 123 || character_sprite() == 127)
)

rich_presence_conditional_display(byte(0xc2ef) == 6, "Titles")

rich_presence_display("Playing on level {0}-{1}. {2} steps walked.",
    rich_presence_value("Digit", world() + 1),
    rich_presence_value("Digit", level() + 1),
    rich_presence_value("Digit", steps_taken())
)
