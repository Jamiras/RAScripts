// The Legend of the Mystical Ninja
// #ID = 990

// $0064: [2 Byte] Intro Reset frame counter
// $0096: [2 Byte] Time (BCD)

// $00C8: Map ID?
function current_map() => byte(0x0000C8)

// $0568: [2 Byte] Goemon's X coord
// $056C: [2 Byte] Goemon's Y coord
// $0592: [2 Byte] P1 - Invincibility frames
// $05F2: [2 Byte] P2 - Invincibility frames
// $09F0: NPC character ID?

// $09FA: Enemy 01 - HP
function enemy_hp() => byte(0x0009FA)

// $16E0: Ramen bowl purchased
function purchase_ramen() => byte(0x0016E0)

// $16E8: Sandals purchased
function purchase_sandals() => byte(0x0016E8)

// $16EA: Pizza purchased
function purchase_pizza() => byte(0x0016EA)

// $16EC: Bombs Purchased
function purchase_bombs() => byte(0x0016EC)

// $18F0: Golbin count
function goblin_count() => byte(0x0018F0)

// $1914: (Mole Game) Yellow moles
// $1918: (Mole Game) Red moles
// $191C: (Mole Game) Blue moles
// $1A9C: [2 Byte] Sets to 0560 when Yin (Goemon) is playing

// $1AA8: P1 - Total HP
function player_max_hp() => byte(0x001AA8)

// $1AAA: P1 - Pow Level (BCD)
function power_level() => byte(0x001AAA)

// $1AAC: P1 - Money: 00,0XX
function money() => byte(0x001AAC)

// $1AAD: P1 - Money: 0X,X00
function money_hundreds() => byte(0x001AAD)

// $1AAE: P1 - Money: X0,000
function money_ten_thousands() => byte(0x001AAE)

// $1AB0: P1 - Lives
function player_lives() => byte(0x001AB0)

// $1AB2: P1 - Current HP
function player_hp() => byte(0x001AB2)

// $1AB4: P1 - Scrolls (BCD)
function player_scrolls() => byte(0x001AB4)

// $1AB6: P1- Weapon Equipped: 0=Pipe, 1=Gold Pipe, 2=bladewhip, 3=Gil Toss
function player_weapon() => byte(0x001AB6)

// $1AB8: P1 - Weapon level
function player_weapon_level() => byte(0x001AB8)

// $1ABA: P1 - Bombs (quantity, BCD)
function player_bombs() => byte(0x001ABA)

// $1AC2: P1 - Walking Speed: 0=Normal, 1=Fast, 2=Fastest
function player_speed() => byte(0x001AC2)

// $1AD4: 01 as soon as game start
// $1AD6: P1 - Judo Attack 1 learned (flag)
// $1AD8: P1 - Judo Attack 2 learned (flag)
// $1ADA: P1 - Judo Attack 3 learned (flag)
// $1ADC: P1 - Judo Attack 4 learned (flag)
// $1AE4: straw hat
// $1AF4: Straw coat
// $1B00: P1 - Straw Sandals (quantity)
// $1B12: P1 - Pizza (quantity)
// $1B20: pass
// $1B24: P1 - Elephant
// $1B58: P2 - Total HP
// $1B5A: P2 - Power Level (BCD)
// $1B5C: P2 - Money: 00,0XX
// $1B5D: P2 - Money: 0X,X00
// $1B5E: P2 - Money: X0,000
// $1B60: P2 - Lives
// $1B62: P2 - Current HP
// $1B64: P2 - Scrolls (BCD)
// $1B66: P2- Weapon Equipped: 0=Stick, 1=Gold Stick, 2=Party Horn, 3=Shuriken
// $1B68: P2 - Weapon level
// $1B6A: P2 - Bombs (quantity, BCD)
// $1B72: P2 - Walking Speed: 0=Normal, 1=Fast, 2=Fastest
// $1B86: P2 - Judo Attack 1 learned (flag)
// $1B88: P2 - Judo Attack 2 learned (flag)
// $1B8A: P2 - Judo Attack 3 learned (flag)
// $1B8C: P2 - Judo Attack 4 learned (flag)
// $1BB0: P2 - Straw Sandals (quantity)
// $1BC2: P2 - Pizza (quantity)
// $1C40: Room ID?
// $1DAC: Game Menu Option ?!
// $1DAE: Game Menu Option ?!
// $1DB7: Game Menu Option ?!
// $1DDC: Game Menu Option ?!

// Ticket 9336: This achievement triggered when playing the secret maze mini game.
//               MD5: bf6da6f13729c8925d8725d7dd25b420
achievement(
    title = "Golden", description = "Upgrade Your Pipe.", points = 5,
    id = 11688, badge = "11471", published = "8/18/2014 10:54:07 PM", modified = "8/19/2014 4:55:11 AM",
    trigger = player_weapon() == 1 && player_weapon_level() == 1
)

achievement(
    title = "Sharp", description = "Upgrade Your Golden Pipe.", points = 5,
    id = 11689, badge = "11472", published = "8/18/2014 10:54:09 PM", modified = "8/19/2014 4:55:13 AM",
    trigger = player_weapon() == 2 && player_weapon_level() == 2
)

achievement(
    title = "Speed Increase!", description = "Buy [Sandals].", points = 5,
    id = 11690, badge = "11473", published = "8/18/2014 10:54:11 PM", modified = "8/19/2014 4:55:15 AM",
    trigger = byte(0x001B00) == 2
)

achievement(
    title = "Speed Maximum!", description = "Buy 10 [Sandals].", points = 10,
    id = 11691, badge = "11474", published = "8/18/2014 10:54:14 PM", modified = "8/19/2014 4:55:17 AM",
    trigger = byte(0x001B00) == 10
)

achievement(
    title = "The Bomba!", description = "Buy 15 [Bombs].", points = 5,
    id = 11693, badge = "11476", published = "8/18/2014 10:54:20 PM", modified = "8/19/2014 4:55:20 AM",
    trigger = player_bombs() == 21
)

achievement(
    title = "Explosive Pockets", description = "Buy 30 [Bombs].", points = 10,
    id = 11687, badge = "11477", published = "8/18/2014 9:28:13 PM", modified = "8/19/2014 4:55:04 AM",
    trigger = player_bombs() == 48
)

achievement(
    title = "Pizza Pockets", description = "Buy 3 [Pizza].", points = 5,
    id = 11692, badge = "11475", published = "8/18/2014 10:54:17 PM", modified = "8/19/2014 4:55:18 AM",
    trigger = byte(0x001B12) == 3
)

achievement(
    title = "Power Up!", description = "Assault the townsfolk or ghosts, Collect 10 [Scrolls].", points = 5,
    id = 11694, badge = "11478", published = "8/18/2014 10:54:22 PM", modified = "8/19/2014 4:55:21 AM",
    trigger = power_level() == 1
)

achievement(
    title = "Super Power!", description = "Torment the townsfolk or ghosts, Collect 50 [Scrolls].", points = 10,
    id = 11695, badge = "11479", published = "8/18/2014 10:54:25 PM", modified = "8/19/2014 4:55:23 AM",
    trigger = power_level() == 5
)

achievement(
    title = "Neighbour Revisited", description = "\"It's Dangerous To Go Outside.... Take Nothing.\"", points = 5,
    id = 11697, badge = "11481", published = "8/18/2014 10:54:30 PM", modified = "8/19/2014 4:55:26 AM",
    trigger = byte(0x00CBE6) == 46 && byte(0x00CBE4) == 69 && byte(0x00CBE2) == 68 && byte(0x00CBE0) == 73 && 
              byte(0x00CBDE) == 83 && byte(0x00CBDC) == 84 && byte(0x00CBDA) == 85 && byte(0x00CBD8) == 79 && 
              byte(0x00CBD6) == 32 && byte(0x00CBD4) == 79 && byte(0x00CBD2) == 71 && byte(0x00CBD0) == 0
)

achievement(
    title = "Checkpoint", description = "Collect the [Elephant1].", points = 5,
    id = 11698, badge = "11482", published = "8/18/2014 10:54:33 PM", modified = "8/19/2014 4:55:27 AM",
    trigger = byte(0x001B24) == 1
)

// Ticket 2734: Both of these triggered at arbitrary points during their respective mini games about 10-15 seconds
//               before I actually should have achieved them.
achievement(
    title = "Hammer-Time", description = "Hit 20 Yellow Moles in the [Mole] minigame.", points = 5,
    id = 11699, badge = "11486", published = "8/18/2014 10:54:36 PM", modified = "8/19/2014 4:55:29 AM",
    trigger = byte(0x001914) == 20 && byte(0x00C8) == 0x90
)

// Ticket 4198: Hello
//               I don't really understand the description so it may be normal but I got this one just by entering the
//               maze game for the fist time. Is it normal?
//               Seb
// Ticket 2735: Both of these triggered at arbitrary points during their respective mini games about 10-15 seconds
//               before I actually should have achieved them.
// Ticket 1152: Triggered when I entered the maze in the first town
achievement(
    title = "Goblin", description = "Sunk a ball in the [Goblin] minigame.", points = 5,
    id = 11700, badge = "11487", published = "8/18/2014 10:54:38 PM", modified = "8/19/2014 4:55:30 AM",
    trigger = goblin_count() == 1 && byte(0x1C44) == 9
)

// Ticket 7539: // Ticket 2733: This triggered during the opening cutscene. I finished the maze afterwards when I realized.
achievement(
    title = "Treasure Maze", description = "Find one of each type of prize in a single maze.", points = 10,
    id = 11701, badge = "11488", published = "8/18/2014 10:54:42 PM", modified = "8/19/2014 4:55:31 AM",
    trigger = byte(0x001910) > 0 && byte(0x001910) < 7 && byte(0x001912) > 0 && byte(0x001912) < 7 && byte(0x001914) > 0 && 
              byte(0x001914) < 7 && byte(0x001916) > 0 && byte(0x001916) < 7 && byte(0x001918) > 0 && byte(0x001918) < 7 &&
              byte(0x1C44) == 0 && byte(0x00C8) == 0x24
)

achievement(
    title = "Straw Coat", description = "Buy a [Straw Coat].", points = 5,
    id = 11703, badge = "11492", published = "8/19/2014 2:57:20 AM", modified = "8/19/2014 4:55:33 AM",
    trigger = byte(0x001AF4) == 4
)

achievement(
    title = "Straw Hat", description = "Buy a [Straw Hat].", points = 5,
    id = 11704, badge = "11493", published = "8/19/2014 2:57:23 AM", modified = "8/19/2014 4:55:34 AM",
    trigger = byte(0x001AE4) == 4
)

achievement(
    title = "Chain Armor", description = "Buy [Chain Armor].", points = 5,
    id = 11712, badge = "11504", published = "8/19/2014 3:50:49 AM", modified = "8/19/2014 4:55:43 AM",
    trigger = byte(0x001AF2) == 6
)

achievement(
    title = "Iron Helmet", description = "Buy the [Iron Helmet].", points = 5,
    id = 11719, badge = "11512", published = "8/19/2014 4:33:11 AM", modified = "8/19/2014 4:55:47 AM",
    trigger = byte(0x001AE2) == 6
)

achievement(
    title = "Maximum Up", description = "Increase your maximum health!", points = 10,
    id = 11713, badge = "11506", published = "8/19/2014 4:11:22 AM", modified = "8/19/2014 4:55:44 AM",
    trigger = player_max_hp() == 10
)

achievement(
    title = "Vitality", description = "Have 4 [Lives] total. (2 more than initial)", points = 5,
    id = 11711, badge = "11503", published = "8/19/2014 3:37:18 AM", modified = "11/25/2015 10:24:15 AM",
    trigger = player_lives() == 4
)

// Ticket 4199: Hello, I just had this achievement by entering the "High Low" minigame and not the Gradius one.
// Ticket 1154: Triggered when I did my first dice game.
achievement(
    title = "Game Within A Game", description = "Save up 6 power-up items in the Gradius arcade game.", points = 10,
    id = 11710, badge = "11502", published = "8/19/2014 3:23:29 AM", modified = "8/19/2014 4:55:41 AM",
    trigger = byte(0x00193C) == 6 && byte(0x1C44) == 1
)

achievement(
    title = "Kobun Tiger!", description = "Learn [Judo Attack 1].", points = 15,
    id = 11705, badge = "11494", published = "8/19/2014 2:57:27 AM", modified = "8/19/2014 4:55:35 AM",
    trigger = byte(0x001AD6) == 1
)

achievement(
    title = "Lightning Blaster!", description = "Learn [Judo Attack 2].", points = 15,
    id = 11706, badge = "11495", published = "8/19/2014 2:57:29 AM", modified = "8/19/2014 4:55:36 AM",
    trigger = byte(0x001AD8) == 1
)

achievement(
    title = "Super Yin!", description = "Learn [Judo Attack 3].", points = 15,
    id = 11707, badge = "11496", published = "8/19/2014 2:57:32 AM", modified = "8/19/2014 4:55:37 AM",
    trigger = byte(0x001ADA) == 1
)

achievement(
    title = "Kabuki Quantum Yin!", description = "Learn [Judo Attack 4].", points = 15,
    id = 11708, badge = "11497", published = "8/19/2014 2:57:34 AM", modified = "8/19/2014 4:55:40 AM",
    trigger = byte(0x001ADC) == 1
)

achievement(
    title = "Level 1", description = "Complete Warlock Zone 1.", points = 20,
    id = 11702, badge = "11484", published = "8/18/2014 10:54:44 PM", modified = "8/19/2014 4:55:32 AM",
    trigger = byte(0x00CB70) == 79 && byte(0x00CB72) == 72 && byte(0x00CB74) == 32 && byte(0x00CB76) == 77 && 
              byte(0x00CB78) == 89 && byte(0x00CB7A) == 44 && byte(0x00CB7C) == 32 && byte(0x00CB7E) == 89 && 
              byte(0x00CB80) == 79 && byte(0x00CB82) == 85 && byte(0x00CB88) == 69 && byte(0x00CBB0) == 83
)

achievement(
    title = "Level 2", description = "Complete Warlock Zone 2.", points = 20,
    id = 11709, badge = "11499", published = "8/19/2014 3:08:50 AM", modified = "8/19/2014 4:55:38 AM",
    trigger = byte(0x00CC0C) == 75 && byte(0x00CC0E) == 79 && byte(0x00CC10) == 66 && byte(0x00CC12) == 65 && 
              byte(0x00CC14) == 78 && byte(0x00CC16) == 32 && byte(0x00CC18) == 67 && byte(0x00CC1A) == 65 && 
              byte(0x00CC1C) == 84
)

achievement(
    title = "Level 3", description = "Clear Warlock Zone 4.", points = 20,
    id = 11714, badge = "11505", published = "8/19/2014 4:11:24 AM", modified = "8/19/2014 4:55:46 AM",
    trigger = byte(0x00CBBA) == 44 && byte(0x00CBBC) == 32 && byte(0x00CBBE) == 89 && byte(0x00CBC0) == 65 && 
              byte(0x00CBC2) == 69 && byte(0x00CBC4) == 46
)

achievement(
    title = "Level 4", description = "Clear Warlock Zone 5.", points = 20,
    id = 11720, badge = "11513", published = "8/19/2014 4:33:13 AM", modified = "8/19/2014 4:55:48 AM",
    trigger = byte(0x00CB70) == 65 && byte(0x00CB72) == 72 && byte(0x00CB74) == 72 && byte(0x00CB76) == 72 && 
              byte(0x00CB78) == 72 && byte(0x00CB7A) == 46 && byte(0x00CB7C) == 46 && byte(0x00CB7E) == 46
)

// Ticket 4222: Shouldn't this achievement trigger when the town in the first level gets invaded by ghosts ? In that
//               case, everyone should have it, shouldn't they?
//               Seb
// Ticket 2736: Did not trigger when the ghosts invaded the town, nor when I finished the ghost town level.
// Ticket 1496: I'm not sure how this achievement works.  Is it supposed to pop when Home-Town turns to Ghost-Town, or
//               am I supposed to do something else.  If it is the sooner, then it is not poping.
// Ticket 1151: My town is definitely a ghost town
achievement(
    title = "Spooky", description = "Your Home-Town is now a Ghost-Town.", points = 5,
    id = 11696, badge = "11480", published = "8/18/2014 10:54:28 PM", modified = "8/19/2014 4:55:24 AM",
    trigger = byte(0x00CBE0) == 77 && byte(0x00CBE2) == 32 && byte(0x00CBE4) == 83 && byte(0x00CBE6) == 67 && 
              byte(0x00CBE8) == 65 && byte(0x00CBEA) == 82 && byte(0x00CBEC) == 69 && byte(0x00CBEE) == 68
)

stages = {
    0x03: "Warlock Zone I", // town
    0x15: "Warlock Zone I", // travel agency
    0x36: "Warlock Zone I", // northern town
    0x3F: "Warlock Zone I", // dice game
    0x6C: "Warlock Zone I", // fortune teller
    0x75: "Warlock Zone I", // shop
    0x78: "Warlock Zone I", // building
    0x7B: "Warlock Zone I", // building
    0x7E: "Warlock Zone I", // building

    0x09: "Warlock Zone II", // town
    0x1B: "Warlock Zone II", // arcade
}

chapters = {
    0: "Warlock Zone I",
    1: "Warlock Zone II",
    2: "Warlock Zone III",
    3: "Warlock Zone IV",
    4: "Warlock Zone V",
    5: "Warlock Zone VI",
    6: "Warlock Zone VII",
    7: "Warlock Zone VIII",
    9: "Warlock Zone IX",
}

rich_presence_conditional_display(byte(0x1AD4) == 0, "Titles")
rich_presence_display("{0}, {1} Lives",
    rich_presence_lookup("Stage", byte(0x0082), chapters),
    rich_presence_value("Lives", byte(0x1AB0))
)

