// Dragon Quest VI
// #ID = 6013
// MD5: 6a081ae0acae2fae2fb2bdb77bb82c21 (0.90 NoPrgress patch)

// HERO    > Merchant > Thief   > Beastmaster  > Ranger  > Hero
// HASSAN  > Soldier > Fighter  > Battlemaster > Priest  > Paladin
// MURIEL  > Wizard  > Priest   > Sage         > Soldier > Fighter-Mage
// BARBARA > Dancer  > Goof-Off > Superstar    > Wizard  > Priest        > Sage
// CHAMORO > Priest  > Wizard   > Sage         > Fighter > Paladin
// AMOS    > Thief   > Merchant > Beastmaster  > Fighter

// $003EA7: Casino Tokens (16-bit)
function casino_tokens() => word(0x003EA7)

// $003EAA: Small Medals turned in?
function small_medals_turned_in() => byte(0x003EAA)

// $005998: Speech ID 1/2 (16 bit)
function text_id_small() => byte(0x005998)

// $005998: Speech ID 1/2 (16 bit)
function text_id() => word(0x005998)

// $006059: Location/Tileset ID 1/x (using 3)
function location1() => byte(0x006059)

// $00605B: Location/Tileset ID 2/x (using 3)
function location2() => byte(0x00605B)

// $00605D: Location/Tileset ID 3/x (using 3)
function location3() => byte(0x00605D)

// $006065: Location 7/x
function location7() => byte(0x006065)

// when the game is first loaded, or when the console is reset, the memory is "wiped" by initializing everything
// to sequential values, starting with 0x40, 0x41, 0x42, 0x43, 0x44... This takes several frames, so it's entirely
// possible for some memory values to change while others are still correct. A good example of this is
// https://retroachievements.org/ticketmanager.php?i=48673. The "word(0x000000) != 0x4140" ensures we've managed
// to get past fully initializing the memory and can start processing the other logic.
function in_game() => word(0x000000) != 0x4140
                      

locations = {
    0x0092: "Title",
    0x000C: "a grove", // intro
    0x0022: "Mudo's Castle", // intro
    0x000D: "Lifecod", 
    0x0001: "the world", // dream world
    0x0030: "the Lifecod Mountain Pass",
    0x000F: "Shiena",
    0x0005: "a giant hole", // near Shiena, where crownmaker fell
    0x0002: "the world", // real world
    0x0010: "Torukka",
    0x0045: "the Well of Dreams",
    0x004A: "the Well of Dreams", // dream world side
    0x0023: "Reidock", // dream world
    0x0072: "the Tower of Trials",
    0x0008: "a field", // where the wild horse is
    0x0046: "the northern gate",
    0x0052: "the Frontier Church",
    0x0048: "a house", // where Hassan builds a cabin
    0x0032: "a tunnel",
    0x0006: "a giant hole", // where Dhama is supposed to be
    0x0026: "the Ruins of Dhama",
    0x0012: "San Marino",
    0x0049: "Granmaz's House",
    0x0033: "the Dream-Seeing Cave",
    0x0053: "the cape near Reidock",
    0x0024: "Reidock", // real world
    0x0035: "the cave near Amoru", // real world
    0x0014: "Amoru", // real world
    0x0054: "the northern gate",
    0x0013: "Amoru", // dream world
    0x0034: "the cave near Amoru", // dream world
    0x0073: "the Mirror Tower",
    0x0047: "the southern gate",
    0x0037: "the Island Cave",
    0x0015: "Gent", // real world
    0x0009: "the Divine Ship", // docked at Mudo's island
    0x000A: "a rotting ship",
    0x0036: "the Cave to Mudo's Castle",
    0x0025: "Dhama Shrine", // dream world
    0x0066: "a church", // real world
    0x0058: "a guardpost", // real world
    0x0016: "Monstoru",
    0x0041: "the mountain north of Monstoru",
    0x002D: "Arcbolt",
    0x0040: "the tunnel near Arcbolt",
    0x0063: "the Northern Lands settlement", // inn
    0x0064: "the Northern Lands settlement", // farm
    0x0065: "the Northern Lands settlement", // house
    0x0042: "the cave near Calcado",
    0x001B: "Calcado",
    0x0051: "a floating island",
    0x003C: "the Land of Happiness",
    0x004C: "the Medal King's Castle",
    0x0069: "a remote cabin",
    0x006E: "the cave east of Clear Vale",
    0x0071: "a house", // south of Dhama
    0x0084: "a well", // southwest of house south of Dhama
    0x0011: "Holcotta",
    0x0028: "Holstock Castle",
    0x003E: "the Baptismal Cave",
    0x005E: "a house", // southwest of Holstock Castle
    0x0085: "a well", // northwest of Clear Vale
    0x0018: "Clear Vale", // dream world
    0x0019: "Clear Vale", // real world
    0x003A: "the Wall of Destiny",
    0x0068: "a small temple",
    0x006C: "a fortune-telling hut", // west of Calberona
    0x006D: "a church", // southeast of fortune-telling hut
    0x001C: "Longadeseo",
    0x004F: "an empty graveyard", // north of Longadeseo
    0x006B: "a fortune-telling hut", // southwest of Medal King
    0x0060: "an empty house", // well west of Land of Happiness
    0x0061: "a shrine", // north of Zaxon
    0x0020: "Zaxon",
    0x0086: "a well", // southwest of the Tower of Trials
    0x005D: "a house", // northwest of Foan Castle
    0x0027: "Foan",
    0x0081: "a well", // north of Foan
    0x0074: "Miralgo's Tower",
    0x0082: "the Stylish Smith's well",
    0x0017: "Pescani", // also the cave north of Pescani
    0x004B: "the mermaids' reef",
    0x0003: "under the sea",
    0x0087: "the mermaids' reef", // below water
    0x0090: "Rubiss's shrine",
    0x008F: "an underwater castle",
    0x0088: "the temple of the naming god",
    0x0080: "a well", // east of San Marino
    0x008A: "an underwater shrine",  // south of Holstock
    0x008C: "an underwater inn", // north of style shop
    0x0089: "a sunken ship",
    0x008D: "an underwater shrine", // northwest of suken ship
    0x0091: "an underwater church", // southwest of Grace Castle
    0x008E: "an underwater shrine", // north of Clear Vale
    0x005F: "a well", // south of style contest
    0x0083: "a well", // west of slime arena
    0x006A: "a shrine", // southwest of slime arena
    0x004E: "the Slime Arena",
    0x0062: "the home of Calvin Jean-Porte",
    0x008B: "Poseidon's castle",
    0x0039: "Glacos's Palace",
    0x001A: "Calberona",
    0x004D: "an inn", // south of Mt. Snow
    0x001D: "Mt. Snow",
    0x0050: "the cave of the Snow Queen",
    0x003B: "the Ice Cave",
    0x002C: "Gandino",
    0x003D: "the Magical Cave",
    0x0059: "a house", // south of Lifecod
    0x0031: "the Lifecod Mountain Pass", // real world
    0x000E: "Lifecod", // real world
    0x002A: "Castle Grace", // real world
    0x0029: "Castle Grace", // dream world
    0x0067: "a shrine", // west of Gandino
    0x005A: "a shrine", // Cloud Castle puzzle
    0x002F: "Cloud Castle", // floating
    0x002E: "Cloud Castle",
    0x0057: "a shrine", // near Pegasus Tower
    0x0075: "the Pegasus Tower",
    0x0004: "the dark world",
    0x001F: "Despair Town",
    0x0055: "the Herbal Spring",
    0x001E: "Greed Town",
    0x003F: "the Greed Town mine",
    0x0056: "a lake", // northwest of Greed Town
    0x0043: "a cave", // below the lake
    0x005C: "a well", // south of Prison Town
    0x0021: "Prison Town",
    0x005B: "Sorrow Prison", // south of Deathtamoor's castle
    0x002B: "Deathtamoor's Castle",
    0x0044: "the Bonus Dungeon",
}
function current_location() => word(0x005ED7)

classes = {
    0x01: "young boy",
    0x02: "soldier",
    0x03: "fighter",
    0x04: "wizard",
    0x05: "priest",
    0x06: "dancer",
    0x07: "thief",
    0x08: "beastmaster",
    0x09: "merchant",
    0x0a: "goof-off",
    0x0b: "battlemaster", // soldier + fighter
    0x0c: "magic knight", // soldier + wizard
    0x0d: "paladin",      // fighter + priest
    0x0e: "sage",         // wizard  + priest
    0x0f: "ranger",       // thief   + merchant + beastmaster
    0x10: "superstar",    // dancer  + goof-off
    0x11: "hero",         // battlemaster + sage + ranger + superstar
    0x12: "dragon",       // book
    0x13: "metal babble", // book
}
function current_class() => low4(0x00402D) + bit4(0x00402D) * 16 // lower 5 bits are class, upper 3 are rank within class

rich_presence_conditional_display(current_location() == 0x0092, "Titles")

// this game does something wacky with tracking the hero's level.
// - real level = byte(0x004025) ^ 0x41
// - since the toolkit doesn't support XOR, use logic to derive the level appropriately

rich_presence_conditional_display(bit6(0x004025) == 1 && bit0(0x4025) == 1, "A level {0} {1} is exploring {2}",
    rich_presence_value("Level", byte(0x004025) - 0x40 - 1),
    rich_presence_lookup("Class", current_class(), classes),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_conditional_display(bit6(0x004025) == 1 && bit0(0x4025) == 0, "A level {0} {1} is exploring {2}",
    rich_presence_value("Level", byte(0x004025) - 0x40 + 1),
    rich_presence_lookup("Class", current_class(), classes),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_conditional_display(bit0(0x4025) == 1, "A level {0} {1} is exploring {2}",
    rich_presence_value("Level", byte(0x004025) + 0x40 - 1),
    rich_presence_lookup("Class", current_class(), classes),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_display("A level {0} {1} is exploring {2}",
    rich_presence_value("Level", byte(0x004025) + 0x40 + 1),
    rich_presence_lookup("Class", current_class(), classes),
    rich_presence_lookup("Location", current_location(), locations)
)


// ================================================================
// New Game

achievement(
    title = "Only You...", description = "...can prevent forest fires.", points = 1,
    id = 56418, badge = "58403", published = "12/20/2017 4:44:24 AM", modified = "9/27/2019 3:13:01 PM",
    trigger = location1() == 5 && location2() == 167 && location3() == 157 && 
              byte(0x004BE0) == 1 &&  // fire extinguished
              //text_id() == 0x006d     // would you like to put out the fire?
              byte(0x5998) == 0x006d  // should be word(0x5998) i.e. text_id()
)

achievement(
    title = "Is This Real Life?", description = "Wake up from the strangest of dreams.", points = 1,
    id = 56419, badge = "58899", published = "12/20/2017 4:44:31 AM", modified = "12/20/2017 5:07:56 AM",
    trigger = text_id() == 2427
)

//achievement(
//    title = "Shiena", description = "Find and enter the town of Shiena.", points = 1,
//    id = 56420, badge = "58884", published = "12/20/2017 4:44:39 AM", modified = "12/20/2017 5:07:58 AM",
//    trigger = location1() == 4 && location2() == 30 && location3() == 31
//)

// ================================================================
// A1 - Jamiras Lv3 - Shiena
// ----------------------------------------------------------------

// MISSABLE - sell the crown for 480g
achievement(
    title = "One Shrewd Businessman [m]", description = "Get offered the maximum amount of money for your village's goods.", points = 2,
    id = 56421, badge = "58885", published = "12/20/2017 4:44:47 AM", modified = "12/20/2017 5:08:00 AM",
    trigger = location1() == 4 && location2() == 30 && location3() == 31 && byte(0x003D46) == 252
)

achievement(
    title = "Oh, The Places You'll Go", description = "Purchase a map of the world.", points = 1,
    id = 56422, badge = "58893", published = "12/20/2017 4:45:00 AM", modified = "12/20/2017 5:08:02 AM",
    trigger = text_id() == 2961
)

achievement(
    title = "A Whole New World", description = "Fall through a giant hole.", points = 2,
    id = 56423, badge = "58900", published = "12/20/2017 4:45:08 AM", modified = "12/20/2017 5:08:04 AM",
    trigger = location1() == 0 && location2() == 1 && location3() == 2
)

achievement(
    title = "Well, Well, Well...", description = "Traverse through the first of many wells.", points = 2,
    id = 56424, badge = "58901", published = "12/20/2017 4:45:12 AM", modified = "12/20/2017 9:27:02 PM",
    trigger = location1() == 226 && location2() == 227 && location3() == 228 && location7() == 6 && 
              byte(0x00605A) == 1
)

achievement(
    title = "Unfinished Business", description = "Claim the crown from Bilte.", points = 3,
    id = 56425, badge = "58902", published = "12/20/2017 4:45:17 AM", modified = "12/20/2017 5:08:07 AM",
    trigger = text_id() == 3003
)

// ================================================================
// A2 - Jamiras Lv5 - Lifecod
// ----------------------------------------------------------------

achievement(
    title = "Party Crasher", description = "Watch a mysterious voice harsh Lifecod's mellow.", points = 3,
    id = 56426, badge = "58903", published = "12/20/2017 4:45:22 AM", modified = "12/20/2017 5:08:09 AM",
    trigger = text_id() == 2508
)

//achievement(
//    title = "Reidock", description = "Use your pass to enter the castle town of Reidock.", points = 4,
//    id = 56427, badge = "58904", published = "12/20/2017 4:45:27 AM", modified = "12/20/2017 5:08:10 AM",
//    trigger = text_id() == 4065
//)

// ================================================================
// A3 - Jamiras Lv8 - Reidock
// ----------------------------------------------------------------

achievement(
    title = "Picking up the Pieces", description = "Open the chest on the top floor of the Tower of Trials.", points = 5,
    id = 56428, badge = "58905", published = "12/20/2017 4:45:33 AM", modified = "12/20/2017 10:17:06 PM",
    trigger = location1() == 29 && location2() == 16 && location3() == 17 && byte(0x010062) == 53
)

achievement(
    title = "And Then There Were Two", description = "Hassan has joined the group!", points = 2,
    id = 56429, badge = "58906", published = "12/20/2017 4:45:38 AM", modified = "12/20/2017 5:08:14 AM",
    trigger = text_id() == 4177
)

achievement(
    title = "Neigh!!", description = "Catch the wild horse.", points = 2,
    id = 56430, badge = "58907", published = "12/20/2017 4:45:42 AM", modified = "12/20/2017 5:08:16 AM",
    trigger = text_id() == 2211
)

// ================================================================
// B1 - Jamiras Lv8 - Reidock
// ----------------------------------------------------------------

achievement(
    title = "He's a Natural", description = "Watch Hassan discover his love of carpentry.", points = 4,
    id = 56431, badge = "58908", published = "12/20/2017 4:45:48 AM", modified = "12/20/2017 4:08:24 PM",
    trigger = text_id() == 1578
)

//achievement(
//    title = "San Marino", description = "Find and enter the port town of San Marino.", points = 4,
//    id = 56432, badge = "58909", published = "12/20/2017 4:45:55 AM", modified = "12/20/2017 5:08:19 AM",
//    trigger = location1() == 6 && location2() == 56 && location3() == 57
//)

// $3D8D:80 - Iron Claw, Barrel, Hidden Area, San Marino
achievement(
   title = "Hidden Treasure: San Marino", description = "Find the Iron Claw hidden in San Marino", points = 3,
   id = 56432, // replaces "San Marino"
   trigger = current_location() == 0x0012 && bit7(0x3D8D) == 1 && prev(bit7(0x3D8D)) == 0
)

achievement(
    title = "Cogito Ergo Sum", description = "Bring the Dream-Seeing Drops to Grandmaz. Muriel has joined the group!", points = 5,
    id = 56433, badge = "58910", published = "12/20/2017 4:46:18 AM", modified = "12/20/2017 5:08:21 AM",
    trigger = text_id() == 1634
)

// ================================================================
// B2 - Jamiras Lv10 - San Marino
// ----------------------------------------------------------------

// Slots machine has location 0!
achievement(
    title = "It's Not a Problem If You Win", description = "Acquire over 10,000 casino coins.", points = 4,
    id = 56434, badge = "58911", published = "12/20/2017 4:46:24 AM", modified = "12/20/2017 9:51:13 PM",
    trigger = in_game() && word(0x000000) != 47272 &&
              ((casino_tokens() >= 10000) ||
               (byte(0x003EA9) >= 1))
)

achievement(
    title = "Going Incognito", description = "Purchase and equip the Royal Clothes.", points = 3,
    id = 56435, badge = "58913", published = "12/20/2017 4:46:30 AM", modified = "12/20/2017 4:09:20 PM",
    trigger = byte(0x00403A) >= 1 && byte(0x00403A) <= 5 && byte(0x004043) == 109
)

//achievement(
//    title = "Amoru", description = "Find and enter the waterfall town, Amoru.", points = 4,
//    id = 56436, badge = "58914", published = "12/20/2017 4:46:34 AM", modified = "12/24/2017 2:50:12 AM",
//    trigger = location1() == 90 && location2() == 91 && location3() == 92 && location7() == 192
//)

// ================================================================
// B3 - Jamiras Lv11 - Amoru
// ----------------------------------------------------------------

achievement(
    title = "Not Dead Yet", description = "Reunite Gina with Iria.", points = 5,
    id = 56437, badge = "58915", published = "12/20/2017 4:46:40 AM", modified = "12/21/2017 1:58:46 AM",
    trigger = text_id() == 1210
)

achievement(
    title = "Still Not Dead", description = "Reunite Gina with Iria... again.", points = 3,
    id = 56438, badge = "58916", published = "12/20/2017 4:46:46 AM", modified = "12/20/2017 5:08:29 AM",
    trigger = text_id() == 3666
)

// ================================================================
// C1 - Jamiras Lv11 - Torukka
// ----------------------------------------------------------------

achievement(
    title = "All in a Day's Work", description = "Save Eliza after defeating her kidnappers, Smok and Biggs.", points = 5,
    id = 56439, badge = "58917", published = "12/20/2017 4:46:50 AM", modified = "12/20/2017 5:08:31 AM",
    trigger = text_id() == 1528
)

achievement(
    title = "Bar-Boo-RA! Bar-Boo-RA!", description = "Meet the mysterious woman without a reflection.", points = 3,
    id = 56440, badge = "58918", published = "12/20/2017 4:46:59 AM", modified = "10/3/2019 4:22:01 PM",
    trigger = text_id() == 2294
)

achievement(
    title = "Bringing Down the House", description = "Destroy all four orbs in the Tower of Mirrors.", points = 3,
    id = 56441, badge = "58919", published = "12/20/2017 4:47:05 AM", modified = "12/21/2017 2:57:52 PM",
    trigger = location1() == 138 && location2() == 139 && location3() == 140 && location7() == 144 && 
              byte(0x01E6B4) == 160 && byte(0x003C3C) == 3
)

// ================================================================
// C2 - Jamiras Lv14 - Reidock
// ----------------------------------------------------------------

achievement(
    title = "Mirror, Mirror, on the Floor", 
    description = "Pick up the Mirror of Ra after using the Dream-Seeing Drops on Barbara.", points = 3,
    id = 56442, badge = "58920", published = "12/20/2017 4:47:09 AM", modified = "12/23/2017 11:21:32 PM",
    trigger = location1() == 60 && location2() == 139 && location3() == 140 && bit7(0x003D35) == 1
)

// ================================================================
// C3 - Jamiras Lv16 - Southern Gate
// ----------------------------------------------------------------

// vulnerable to sap. keep everyone's HP above 40
achievement(
    title = "King Mudo", description = "Use the Mirror of Ra on Mudo after defeating him in battle.", points = 5,
    id = 56443, badge = "58921", published = "12/20/2017 4:47:18 AM", modified = "12/20/2017 5:08:37 AM",
    trigger = text_id() == 1239
)

// ================================================================
// D1 - Jamiras Lv17 - Reidock
// ----------------------------------------------------------------

//achievement(
//    title = "Gent", description = "Find and enter the holy village of Gent.", points = 5,
//    id = 56444, badge = "58922", published = "12/20/2017 4:47:21 AM", modified = "10/3/2019 4:22:01 PM",
//    trigger = location1() == 100 && location2() == 101 && location3() == 102
//)

achievement(
    title = "Divine Intervention", description = "Chamoro has joined the group!", points = 3,
    id = 56445, badge = "58923", published = "12/20/2017 4:47:24 AM", modified = "12/20/2017 5:08:40 AM",
    trigger = text_id() == 3800
)

// ================================================================
// D2 - Jamiras Lv20 - Gent
// ----------------------------------------------------------------

achievement(
    title = "Deja Vu", description = "Things are looking eerily similar...", points = 3,
    id = 56446, badge = "58924", published = "12/20/2017 4:47:31 AM", modified = "1/18/2019 11:20:45 AM",
    trigger = location1() == 5 && location2() == 167 && location3() == 149 && location7() == 6 &&
              ((text_id_small() == 110) ||
               (text_id_small() == 118))
)

// Raiders of the Demon King's Castle (3)
// $3D9A:80 - Fire Claw, Chest, Mudo's Castle 3F

achievement(
    title = "Utter Disbelief", description = "Defeat Mudo for the third and final time.", points = 10,
    id = 56447, badge = "58925", published = "12/20/2017 4:47:35 AM", modified = "12/20/2017 5:08:43 AM",
    trigger = text_id() == 4057
)

// ================================================================
// D3 - Jamiras Lv21 - Lifecod
// ----------------------------------------------------------------

// I've Got Spirit, Yes I Do! (3)
// $3D3F:02 - Purchase the Spirit Armor, Lifecod

//achievement(
//    title = "Dhama Shrine", description = "Find and enter dream version of the Shrine at Dhama.", points = 4,
//    id = 56448, badge = "58926", published = "12/20/2017 4:47:53 AM", modified = "12/20/2017 5:08:44 AM",
//    trigger = location1() == 21 && location2() == 22 && location3() == 23
//)

achievement(
    title = "So Classy", description = "Change a character's class.", points = 2,
    id = 56449, badge = "58927", published = "12/20/2017 4:47:57 AM", modified = "12/20/2017 5:08:46 AM",
    trigger = text_id() == 6416
)

//achievement(
//    title = "Monstoru", description = "Find and enter the town of Monstoru.", points = 4,
//    id = 56450, badge = "58928", published = "12/20/2017 4:47:59 AM", modified = "12/20/2017 5:08:47 AM",
//    trigger = location1() == 22 && location2() == 114 && location3() == 115
//)

// ================================================================
// E1 - Jamiras Lv22 - Monstoru
// ----------------------------------------------------------------

achievement(
    title = "Purple People Eater", description = "Save Monstoru from a monstoru... er, monster.", points = 5,
    id = 56451, badge = "58929", published = "12/20/2017 4:48:03 AM", modified = "12/22/2017 6:51:28 PM",
    trigger = text_id() == 3894 && location1() == 22 && location2() == 114 && location3() == 115 && 
              location7() == 200
)

//achievement(
//    title = "Short Supply", description = "Obtain the Seed of Reasoning.", points = 4,
//    id = 56452, badge = "58930", published = "12/20/2017 4:48:06 AM", modified = "12/24/2017 10:06:16 PM",
//    trigger = location1() == 199 && location2() == 200 && location3() == 201 && bit1(0x003D36) == 1
//)

achievement(
    title = "Amos Formidable Ally [m]", description = "Amos has joined the group!", points = 5,
    id = 56453, badge = "58931", published = "12/20/2017 4:48:09 AM", modified = "10/18/2019 8:03:01 PM",
    trigger = text_id() == 3929
)

// ================================================================
// E2 - Jamiras Lv23 - Arcbolt
// ----------------------------------------------------------------

achievement(
    title = "Brast Him Good", description = "Defeat Brast to earn the right to battle the tunnel monster.", points = 5,
    id = 56454, badge = "58932", published = "12/20/2017 4:48:12 AM", modified = "10/3/2019 4:22:01 PM",
    trigger = text_id() == 5441
)

achievement(
    title = "Show Off", description = "Watch Terry steal your thunder.", points = 4,
    id = 56455, badge = "58933", published = "12/20/2017 4:48:16 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 1421
)

//achievement(
//    title = "Calcado", description = "Find and enter the town of Calcado.", points = 4,
//    id = 56456, badge = "58935", published = "12/20/2017 4:48:20 AM", modified = "12/20/2017 5:08:56 AM",
//    trigger = location1() == 52 && location2() == 170 && location3() == 171
//)

// ================================================================
// E3 - Jamiras Lv23 - Calcado
// ----------------------------------------------------------------

achievement(
    title = "What Could Possibly Go Wrong?", description = "Depart for The Land of Happiness.", points = 4,
    id = 56457, badge = "58937", published = "12/20/2017 4:48:22 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 1932
)

achievement(
    title = "Underestimated", description = "Defeat Jamiras and put an end to his horrible ruse.", points = 10,
    id = 56458, badge = "58939", published = "12/20/2017 4:48:38 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 1343
)

//achievement(
//    title = "The Medal King's Castle", description = "Find and enter the Medal King's castle.", points = 4,
//    id = 56459, badge = "58965", published = "12/20/2017 4:48:42 AM", modified = "12/20/2017 5:09:00 AM",
//    trigger = location1() == 101 && location2() == 102 && location3() == 244
//)

//achievement(
//    title = "Holcotta", description = "Find and enter the village of Holcotta.", points = 4,
//    id = 56460, badge = "58942", published = "12/20/2017 4:48:45 AM", modified = "12/20/2017 5:09:01 AM",
//    trigger = location1() == 44 && location2() == 45 && location3() == 46
//)

//achievement(
//    title = "Holstock Castle", description = "Find and enter Holstock Castle.", points = 4,
//    id = 56461, badge = "58943", published = "12/20/2017 4:48:47 AM", modified = "12/20/2017 5:09:02 AM",
//    trigger = location1() == 133 && location2() == 41 && location3() == 42
//)

// ================================================================
// F1 - Jamiras Lv24 - Holcotta
// ----------------------------------------------------------------

achievement(
    title = "I'm Glad It's Cold", description = "Watch the cowardly prince get baptized.", points = 5,
    id = 56462, badge = "58944", published = "12/20/2017 4:48:50 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 1382
)

achievement(
    title = "Oh, Oh, It's Magic", description = "Receive the Magic Key from King Holten.", points = 2,
    id = 56463, badge = "58945", published = "12/20/2017 4:48:52 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 5183
)

// can get "Novice Collector" (20 medals) now

//achievement(
//    title = "Clear Vale", description = "Find and enter the town of Clear Vale.", points = 4,
//    id = 56464, badge = "58946", published = "12/20/2017 4:48:54 AM", modified = "12/20/2017 5:09:07 AM",
//    trigger = location1() == 138 && location2() == 139 && location3() == 140 && location7() == 210
//)

//achievement(
//    title = "Real Clear Vale", description = "Find and enter the real town of Clear Vale.", points = 3,
//    id = 56465, badge = "58947", published = "12/20/2017 4:48:57 AM", modified = "12/20/2017 5:09:09 AM",
//    trigger = location1() == 150 && location2() == 151 && location3() == 152 && location7() == 213
//)

// ================================================================
// F2 - Jamiras Lv25 - Clear Vale
// ----------------------------------------------------------------

achievement(
    title = "A Swinging Good Time", description = "Obtain the Fragment of Courage using the Golden Pickaxe.", points = 5,
    id = 56466, badge = "58948", published = "12/20/2017 4:48:59 AM", modified = "12/25/2017 1:05:32 AM",
    trigger = word(0x000000) != 0 &&
              ((location1() == 172 && location2() == 158 && location3() == 159 && location7() == 163 && 
                bit3(0x003D36) == 1) ||
               (text_id() == 4894))
)

achievement(
    title = "Nemo Would Be Proud", description = "Receive the Flying Bed.", points = 2,
    id = 56467, badge = "58949", published = "12/20/2017 4:49:03 AM", modified = "12/20/2017 5:09:12 AM",
    trigger = text_id() == 233
)

// ================================================================
// F3 - Jamiras Lv26 - Clear Vale
// ----------------------------------------------------------------

// Ticket 21274: Got the item but does not trigger. I have a save right before seeing the kids hide it and tried doing
//               things differently but no such luck.
//               MD5: 6a081ae0acae2fae2fb2bdb77bb82c21
//               Emulator: RASnes9x
// Ticket 21052: found the meteorite bracelet and it didnt pop, maybe i grabbed it at the wrong time, i left town once
//               MD5: Unknown
//               Emulator: RASnes9x
achievement(
    title = "Keep an Eye on the Kids", description = "Search for and obtain the Meteorite Armband.", points = 5,
    id = 56470, badge = "58952", published = "12/20/2017 4:49:16 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = location1() == 90 && location2() == 91 && location3() == 92 && location7() == 192 && 
              bit2(0x003D4D) == 1
    //  was   byte(0x003D4D) == 245
)

//achievement(
//    title = "Zaxon", description = "Find and enter the small farming village, Zaxon.", points = 4,
//    id = 56468, badge = "58950", published = "12/20/2017 4:49:11 AM", modified = "10/6/2019 5:01:01 PM",
//    trigger = location1() == 214 && location2() == 215 && location3() == 216 && location7() == 253
//)

// ================================================================
// G1 - Jamiras Lv26 - Dhama Shrine
// ----------------------------------------------------------------

//achievement(
//    title = "Foan", description = "Find and enter Foan Castle.", points = 4,
//    id = 56469, badge = "58951", published = "12/20/2017 4:49:14 AM", modified = "12/20/2017 5:09:15 AM",
//    trigger = location1() == 29 && location2() == 30 && location3() == 31 && location7() == 6
//)

// ================================================================
// G2 - Jamiras Lv28 - Reidock
// ----------------------------------------------------------------

achievement(
    title = "No Means No", description = "Defeat Miralgo.", points = 10,
    id = 56471, badge = "58953", published = "12/20/2017 4:49:19 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = text_id() == 2324
)

// ================================================================
// G3 - Jamiras Lv28 - San Marino
// ----------------------------------------------------------------

achievement(
    title = "Break on Through", description = "Make use of the Watergate Key.", points = 3,
    id = 56472, badge = "58954", published = "12/20/2017 4:49:22 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = location1() == 0 && location2() == 1 && location3() == 2 && byte(0x003D3C) == 27
)

//achievement(
//    title = "Pescani", description = "Find and enter Pescani village.", points = 4,
//    id = 56473, badge = "58955", published = "12/20/2017 4:49:24 AM", modified = "10/12/2019 6:27:01 PM",
//    trigger = location1() == 124 && location2() == 125 && location3() == 126 && location7() == 130
//)

// ================================================================
// H1 - Jamiras Lv28 - Pescani
// ----------------------------------------------------------------

achievement(
    title = "Something's Fishy", description = "Successfully trail Rob to uncover his secret.", points = 2,
    id = 56474, badge = "58958", published = "12/20/2017 4:49:28 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = text_id() == 1261
)

achievement(
    title = "Time to Blow Bubbles", description = "Bring Denae safely home and obtain the Mermaid Harp.", points = 3,
    id = 56475, badge = "58959", published = "12/20/2017 4:49:31 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = text_id() == 1680
)

achievement(
    title = "Guardian of the World", description = "Meet Rubiss, the woman behind the voice.", points = 2,
    id = 56476, badge = "58960", published = "12/20/2017 4:49:34 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = text_id() == 2413
)

achievement(
    title = "Identity Crisis", description = "Change a character's name.", points = 2,
    id = 56477, badge = "58961", published = "12/20/2017 4:49:36 AM", modified = "12/20/2017 5:09:29 AM",
    trigger = text_id() == 6519
)

achievement(
    title = "One Key to Rule Them All", description = "Obtain the Final Key in the sunken ship.", points = 5,
    id = 56478, badge = "58962", published = "12/20/2017 4:49:49 AM", modified = "12/20/2017 5:09:31 AM",
    trigger = location1() == 215 && location2() == 59 && location3() == 123 && location7() == 136 && 
              byte(0x010070) == 171
)

//achievement(
//    title = "Slime Arena", description = "Find and enter the Slime Arena.", points = 3,
//    id = 56479, badge = "58963", published = "12/20/2017 4:49:52 AM", modified = "10/15/2019 7:12:01 PM",
//    trigger = location1() == 105 && location2() == 106 && location3() == 238 && location7() == 72
//)

//achievement(
//    title = "Best Dresser Contest", description = "Find the Best Dresser Contest in the home of Calvin Jean-Porte.", points = 3,
//    id = 56480, badge = "58964", published = "12/20/2017 4:49:55 AM", modified = "10/21/2019 8:56:01 PM",
//    trigger = location1() == 106 && location2() == 230 && location3() == 231 && location7() == 6
//)

// ================================================================
// H2 - Jamiras Lv30 - Dhama
// ----------------------------------------------------------------

// can get "Apprentice Collector" (40 medals) now

achievement(
    title = "For Poseiden!", description = "Defeat Glacos and break the seal.", points = 10,
    id = 56481, badge = "58966", published = "12/20/2017 4:49:58 AM", modified = "10/15/2019 7:12:01 PM",
    trigger = text_id() == 1299
)

//achievement(
//    title = "Calberona", description = "Find and enter the Calberona, the city of magic.", points = 4,
//    id = 56482, badge = "58967", published = "12/20/2017 4:50:16 AM", modified = "10/21/2019 8:56:01 PM",
//    trigger = location1() == 36 && location2() == 37 && location3() == 38 && location7() == 165 && 
//              byte(0x00605A) == 0 && byte(0x00605F) == 162 && byte(0x006067) == 216
//)

//achievement(
//    title = "Mt. Snow", description = "Find and enter Mt. Snow.", points = 3,
//    id = 56483, badge = "58969", published = "12/20/2017 4:50:19 AM", modified = "12/20/2017 5:09:41 AM",
//    trigger = location1() == 194 && location2() == 195 && location3() == 196 && location7() == 239
//)

// ================================================================
// H3 - Jamiras Lv30 - Mt. Snow
// ----------------------------------------------------------------

achievement(
    title = "Cold as Ice", description = "Ignore Goran's warnings and watch Yurina lift the village's curse.", points = 2,
    id = 56484, badge = "58968", published = "12/20/2017 4:50:24 AM", modified = "10/15/2019 7:12:01 PM",
    trigger = text_id() == 1922
)

achievement(
    title = "Answer Me These Questions Three",
    description = "Make sense of what Zam said to correctly answer the door's questions.", points = 3,
    id = 56485, badge = "58970", published = "12/20/2017 4:50:27 AM", modified = "10/15/2019 7:12:01 PM",
    trigger = text_id() == 1328
)

achievement(
    title = "Legendary Sword of... Tetanus?", description = "Watch Terry deny the authenticity of the rusty sword.", points = 2,
    id = 56486, badge = "58972", published = "12/20/2017 4:50:30 AM", modified = "10/15/2019 7:12:01 PM",
    trigger = text_id() == 1332
)

//achievement(
//    title = "Longadeseo", description = "Show your pass to the guard to enter the ruffian town of Longadeseo.", points = 4,
//    id = 56487, badge = "58973", published = "12/20/2017 4:50:33 AM", modified = "12/20/2017 5:09:48 AM",
//    trigger = text_id() == 568
//)

// ================================================================
// I1 - Jamiras Lv30 - Longadeseo
// ----------------------------------------------------------------

// Hidden Treasure: Longadeseo (3) - take outside stairs (SE) and walk through two walls
// $3D95:08 - Wisdom Seed, Chest, Longadeseo
// $3D95:04 - 2500g, Chest, Longadeseo
achievement(
   title = "Hidden Treasure: Longadeseo", description = "Collect the items from the two chests hidden in Longadeseo", points = 3,
   id = 56487, // replaces "Longadeseo"
   trigger = current_location() == 0x001C && bit3(0x3D95) == 1 && bit2(0x3D95) == 1 &&
             (prev(bit3(0x3D95)) == 0 || prev(bit2(0x3D95)) == 0)
)

achievement(
    title = "Puff Puff!", description = "Even heroes have needs.", points = 3,
    id = 56488, badge = "58974", published = "12/20/2017 4:50:41 AM", modified = "1/15/2018 9:07:00 PM",
    trigger = text_id() == 445 && location1() == 67 && location2() == 191 && location3() == 235
)

achievement(
    title = "Hawk's Test", description = "A priest, a showgirl and a bartender walk into a bar...", points = 4,
    id = 56489, badge = "58975", published = "12/20/2017 4:50:44 AM", modified = "12/22/2017 7:24:21 PM",
    trigger = text_id() == 513
)

achievement(
    title = "Don't Look Back in Anger", 
    description = "Sally saw the good in your eyes and agreed to reforge the legendary blade.", points = 3,
    id = 56490, badge = "58977", published = "12/20/2017 4:50:46 AM", modified = "12/20/2017 5:09:52 AM",
    trigger = text_id() == 540
)

//achievement(
//    title = "Gandino", description = "Find and enter the castle town of Gandino.", points = 4,
//    id = 56491, badge = "58980", published = "12/20/2017 4:50:48 AM", modified = "10/15/2019 7:12:01 PM",
//    trigger = location1() == 169 && location2() == 170 && location3() == 65 && location7() == 69
//)

// ================================================================
// I2 - Jamiras Lv31 - Gandino
// ----------------------------------------------------------------

// POINTS -> 5
achievement(
    title = "Legendary Shield", description = "Obtain the Shield of Sufrida.", points = 5,
    id = 56492, badge = "58983", published = "12/20/2017 4:50:51 AM", modified = "10/6/2019 5:01:01 PM",
    trigger = location1() == 48 && location2() == 196 && location3() == 2 && location7() == 6 && 
              bit2(0x003D37) == 1
)

// ================================================================
// I3 - Jamiras Lv31 - Dhama
// ----------------------------------------------------------------

//achievement(
//    title = "Wait, What?", description = "Hey, that's me. But I'm right here!", points = 4,
//    id = 56493, badge = "58986", published = "12/20/2017 4:50:53 AM", modified = "12/20/2017 5:09:57 AM",
//    trigger = text_id() == 1177
//)

achievement(
    title = "Save Yourself", description = "...with some good ol' fashioned mind melding.", points = 4,
    id = 56494, badge = "58988", published = "12/20/2017 4:50:56 AM", modified = "12/20/2017 5:09:59 AM",
    trigger = text_id() == 2836
)

achievement(
    title = "Filling in the Gaps", description = "Regain all your memories and receive the Helm of Cevas.", points = 5,
    id = 56495, badge = "58989", published = "12/20/2017 4:50:58 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = text_id() == 4813
)

// ================================================================
// J1 - Jamiras Lv32 - Calberona
// ----------------------------------------------------------------

// old man in NW house
achievement(
    title = "I Can Show You the World", description = "Reenergize the Magic Carpet you won from the style contest.", points = 4,
    id = 56496, badge = "58990", published = "12/20/2017 4:51:00 AM", modified = "12/22/2017 1:30:07 PM",
    trigger = text_id() == 379 && location1() == 168 && location2() == 37 && location3() == 38 && 
              location7() == 165 && byte(0x006067) == 216
)

// can get "Adept Collector" (60 medals) now

achievement(
    title = "Legendary Armor", 
    description = "Obtain the Armor of Orgo after watching the king of Grace Castle doom his people.", points = 5,
    id = 56497, badge = "58991", published = "12/20/2017 4:51:03 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = location1() == 160 && location2() == 159 && location3() == 157 && location7() == 6 && 
              bit0(0x003D37) == 1
)

// Hidden Treasure: Grace Castle (3) - return to dream world and use pickaxe
// $3D9F:02 - Strength Seed, Chest, Grace Castle (dream)
// $3D9F:01 - Aeolus's Shield, Chest, Grace Castle (dream)
// $3D9E:80 - Small Medal, Chest, Grace Castle (dream)

achievement(
   title = "Hidden Treasure: Grace Castle", description = "Collect the items from the three chests hidden in Grace Castle", points = 3,
   id = 56493, // replaces "Wait, What?"
   trigger = current_location() == 0x0029 && bit7(0x3D9E) == 1 && bit0(0x3D9F) == 1 && bit1(0x3D9F) == 1 &&
             (prev(bit7(0x3D9E)) == 0 || prev(bit0(0x3D9F)) == 0 || prev(bit1(0x3D9F)) == 0)
)

// ================================================================
// J2 - Jamiras Lv32 - Longadeseo
// ----------------------------------------------------------------

// downstairs NE house
achievement(
    title = "Legendary Sword", description = "Obtain the Sword of Ramias.", points = 5,
    id = 56498, badge = "58993", published = "12/20/2017 4:57:35 AM", modified = "9/30/2019 3:43:01 PM",
    trigger = text_id() == 564
)

achievement(
    title = "Duran Duran", 
    description = "Solve the shrine's puzzle, defeat Hell Cloud, and then enter Duran's castle.", points = 3,
    id = 56499, badge = "58994", published = "12/20/2017 4:58:38 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = location1() == 111 && location2() == 112 && location3() == 113 && location7() == 86
)

achievement(
    title = "Forgive and Forget", description = "Defeat Terry and Duran. Terry has joined the group!", points = 5,
    id = 56500, badge = "58995", published = "12/20/2017 4:58:46 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = text_id() == 5674
)

// ================================================================
// J3 - Jamiras Lv32 - Arcbolt
// ----------------------------------------------------------------

// MISSABLE (optional)
// have to leave town and swap Terry into the party
achievement(
    title = "Where's Rocky When You Need Him?", description = "Drago joined the group!", points = 5,
    id = 56501, badge = "58996", published = "12/20/2017 4:59:06 AM", modified = "12/20/2017 5:10:09 AM",
    trigger = text_id() == 5541
)

//achievement(
//    title = "Cloud Castle", description = "Find and enter Cloud Castle.", points = 4,
//    id = 56502, badge = "58997", published = "12/20/2017 4:59:41 AM", modified = "12/20/2017 5:10:11 AM",
//    trigger = location1() == 97 && location2() == 98 && location3() == 99 && location7() == 81//
//)

// Hidden Treasure: Pegasus Tower (3) - (G): https://gamefaqs.gamespot.com/snes/588293-dragon-quest-vi-maboroshi-no-daichi/map/4491-pegasus-tower-map
// $3DB0:08 - Small Medal, Chest, Pegasus Tower 2F
// $3DB0:04 - Nut of Life, Chest, Pegasus Tower 2F
// $3DB0:02 - Dragon Killer, Chest, Pegasus Tower 2F
achievement(
   title = "Hidden Treasure: Pegasus Tower", description = "Collect the items from the three chests hidden in Pegasus Tower", points = 3,
   id = 56502, // replaces "Cloud Castle"
   trigger = current_location() == 0x0075 && bit3(0x3DB0) == 1 && bit2(0x3DB0) == 1 && bit1(0x3DB0) == 1 &&
             (prev(bit3(0x3DB0)) == 0 || prev(bit2(0x3DB0)) == 0 || prev(bit1(0x3DB0)) == 0)
)

achievement(
    title = "We Have Liftoff!", description = "Obtain the Reigns of Pegasus.", points = 5,
    id = 56503, badge = "58998", published = "12/20/2017 4:59:45 AM", modified = "12/22/2017 7:22:02 PM",
    trigger = text_id() == 2341 && location1() == 204 && location2() == 46 && location3() == 47 && 
              location7() == 6
)

// ================================================================
// K1 - Jamiras Lv37 - Dhama Shrine
// ----------------------------------------------------------------

// can get "Expert Collector" (80 medals) now

//achievement(
//    title = "Despair Town", 
//    description = "Energize the Reigns of Pegasus, travel to the dark world, and enter Despair Town.", points = 4,
//    id = 56504, badge = "58999", published = "12/20/2017 4:59:51 AM", modified = "12/20/2017 4:16:47 PM",
//    trigger = location1() == 80 && location2() == 81 && location3() == 82 && location7() == 249
//)

achievement(
    title = "So Wrinkly", description = "Enter the cave in the hot springs.", points = 3,
    id = 56505, badge = "59000", published = "12/20/2017 4:59:56 AM", modified = "12/20/2017 5:10:16 AM",
    trigger = location1() == 15 && location2() == 253 && location3() == 254 && location7() == 249
)

achievement(
    title = "Despair to Hope", description = "Find and return Ende's tools.", points = 5,
    id = 56506, badge = "59001", published = "12/20/2017 5:00:00 AM", modified = "12/22/2017 7:19:56 PM",
    trigger = text_id() == 776 && location1() == 87 && location2() == 81 && location3() == 82 && 
              location7() == 249
)

// ================================================================
// K2 - Jamiras Lv37 - Despair Town
// ----------------------------------------------------------------

//achievement(
//    title = "Greed Town", description = "Find and enter Greed Town.", points = 4,
//    id = 56507, badge = "59002", published = "12/20/2017 5:00:08 AM", modified = "12/20/2017 4:16:07 PM",
//    trigger = location1() == 204 && location2() == 205 && location3() == 206 && location7() == 244
//)

// MISSABLE
// when the townsfolk begin to fight over the sage's treasure, go down the left side so the man starts killing
// everyone. after talking to the monsters at the bottom, fight and defeat the last one standing and time restarts
achievement(
    title = "Senseless Slaughter [m]", description = "Enough! This isn't how it's supposed to be...", points = 5,
    id = 56508, badge = "59003", published = "12/20/2017 5:00:21 AM", modified = "10/12/2019 6:27:01 PM",
    trigger = text_id() == 2076
)

// ================================================================
// K3 - Jamiras Lv37 - Well Bottom
// ----------------------------------------------------------------

achievement(
    title = "Prison Town", description = "Defeat the Sorrow Giant, receive the Prison Key, and enter Prison Town.", points = 5,
    id = 56509, badge = "59004", published = "12/20/2017 5:00:24 AM", modified = "9/30/2019 3:43:01 PM",
    trigger = location1() == 90 && location2() == 91 && location3() == 92 && location7() == 254
)

achievement(
    title = "Fulfilling the Prophecy", description = "Join the rebellion and put and end to Akbar.", points = 10,
    id = 56510, badge = "59005", published = "12/20/2017 5:00:26 AM", modified = "10/12/2019 6:27:01 PM",
    trigger = text_id() == 1079
)

// ================================================================
// L1 - Jamiras Lv39 - Well Bottom
// ----------------------------------------------------------------

achievement(
    title = "Brotherly Love", 
    description = "Defeat Zuikaku and Shoukaku, reunite the brothers, and collapse a mountain.", points = 5,
    id = 56511, badge = "59006", published = "12/20/2017 5:00:30 AM", modified = "10/12/2019 6:27:01 PM",
    trigger = text_id() == 2197 && location1() == 114 && location2() == 7 && location3() == 16 && 
              location7() == 147
)

// ================================================================
// L2 - Jamiras Lv46 - Dhama
// ----------------------------------------------------------------

// Do "The Champion of Champions" now - take Kings to slime arena, give him the full Metal King set from Hassan

// ================================================================
// L3 - Jamiras Lv47 - Well Bottom
// ----------------------------------------------------------------

// First form (2000HP): have hero use GigaSlash every round
//                      have Hassan use Vacuum Blade every round
//                      have Muriel cast Barrier, and provide extra healing as needed
//                      have Barbara Hustle Dance every round
// Second form (3000HP): have hero use GigaSlash every round
//                       have Hassan cast Increase, then SwordLine
//                       have Muriel cast Bikill on Hassan, and provide extra healing as needed, or Explodet otherwise
//                       have Barbara Hustle Dance every round
// Third form (2500HP head, 2000HP each hand): have hero use GigaSpark until he's out of mana, then swap out for Chamoro for Explodet
//                       have Hassan use RockSlide until the hands are dead, then SwordLine
//                       have Muriel cast Bikill on Hassan, and provide extra healing as needed, or Explodet otherwise
//                       have Barbara use Madante, then Hustle Dance every round
//                       swap characters out as they die. kill left hand first - it knows Revive

achievement(
    title = "Next Time Have Four Forms", description = "Defeat all three forms of Deathtamoor.", points = 25,
    id = 56512, badge = "59007", published = "12/20/2017 5:00:33 AM", modified = "10/9/2019 5:43:02 PM",
    trigger = text_id() == 5280 && location1() == 68 && location2() == 66 && location3() == 61 && 
              location7() == 65
)

// Sit through the ending and credits
achievement(
    title = "Spoiler Alert", description = "Never find out what hatched.", points = 5,
    id = 56513, badge = "59008", published = "12/20/2017 5:00:36 AM", modified = "10/9/2019 5:43:02 PM",
    trigger = text_id() == 6925 && word(0x000000) == 47689
)

achievement(
    title = "Good Ol' Terry", description = "Pay attention to Terry during the credits to find something important.", points = 5,
    id = 56514, badge = "59009", published = "12/20/2017 5:00:39 AM", modified = "9/27/2019 3:13:01 PM",
    trigger = location1() == 233 && location2() == 234 && location3() == 235 && location7() == 72 && 
              bit5(0x003D37) == 1
)

achievement(
    title = "It Keeps Going, and Going, and Going...", 
    description = "Raise each class to a minimum of 5 stars to access the bonus dungeon.", points = 10,
    id = 56515, badge = "59010", published = "12/20/2017 5:00:42 AM", modified = "10/9/2019 5:43:02 PM",
    trigger = text_id() == 4880
)

// ================================================================
// M1 - Jamiras Lv48 - Calcado
// ----------------------------------------------------------------

// $3D94:80 - Orichalcum Fang, ground, Calcado
// in the little notch in the grass three spaces left and three north of the well
achievement(
   title = "Hidden Treasure: Calcado", description = "Find the Orichalcum Fang hidden in Calcado", points = 3,
   id = 56504, // replaces "Despair Town"
   trigger = in_game() && current_location() == 0x001B && bit7(0x3D94) == 1 && prev(bit7(0x3D94)) == 0
)

// can get "Master Collector" (100 medals) now

// can get "The Most Stylish of the Stylish" now too - using Barbara

// ================================================================
// M2 - Jamiras Lv66 - Dhama
// ----------------------------------------------------------------

// Amos, Barbara, Kings, and Chamoro are Sages, Hero, Hassan, Terry, and Muriel are Heros
// 13000HP: 
//          Round 1: have hero cast increase, Hassan cast Bikill on himself, Kings cast Explodet, Barbara cast Madante
//          Round 2: swap Barbara out for Amos. have hero cast Gigaslash, Hassan use PowerUp, Kings use HealUs, Amos use Madante
//          Round 3: swap Amos out for Muriel. hero cast Gigaslash, Hassan use Spirit Punch, Muriel cast Explodet, Kings uses HealUs
//          Rest of fight. have hero use Gigaslash, Hassan use PowerUp/Spirit Punch, and Kings heal. Use Muriel for extra healing
//          or renewing Bikill on Hassan or Increase on everyone. If none of that is necessary, cast Explodet

achievement(
    title = "The Boss of Bosses", 
    description = "Defeat Dark Dream in 20 or less turns to watch him slap around Deathtamoor.", points = 50,
    id = 56516, badge = "59011", published = "12/20/2017 5:00:46 AM", modified = "10/12/2019 6:27:01 PM",
    trigger = text_id() == 1502 && location1() == 68 && location2() == 234 && location3() == 93 && 
              location7() == 221
)

achievement(
    title = "The Champion of Champions", 
    description = "Recruit and level a slime and use it to defeat Champ in the Slime Arena.", points = 25,
    id = 56517, badge = "59012", published = "12/20/2017 5:00:50 AM", modified = "10/9/2019 5:43:02 PM",
    trigger = text_id() == 1798
)

achievement(
    title = "The Most Stylish of the Stylish",
    description = "Win the Rank 8 Style competition", points = 25,
    id = 56507, // replaces "Greed Town"
    trigger = current_location() == 0x0062 && 
              byte(0x3d29) == 8 && // completed rank 8
              text_id() == 6699
)

// -----------------------------------------------

achievement(
    title = "Novice Collector", description = "Give the Medal King 20 Small Medals.", points = 5,
    id = 56382, badge = "57556", published = "12/19/2017 1:39:25 AM", modified = "10/12/2019 6:27:01 PM",
    trigger = small_medals_turned_in() >= 20 && small_medals_turned_in() <= 105 && in_game()
)

achievement(
    title = "Apprentice Collector", description = "Give the Medal King 40 Small Medals.", points = 10,
    id = 56383, badge = "57557", published = "12/19/2017 1:39:30 AM", modified = "12/20/2017 3:33:34 PM",
    trigger = small_medals_turned_in() >= 40 && small_medals_turned_in() <= 105 && in_game()
)

achievement(
    title = "Adept Collector", description = "Give the Medal King 60 Small Medals.", points = 10,
    id = 56384, badge = "57558", published = "12/19/2017 1:39:33 AM", modified = "10/21/2019 8:56:01 PM",
    trigger = small_medals_turned_in() >= 60 && small_medals_turned_in() <= 105 && in_game()
)

// POINTS -> 10
achievement(
    title = "Expert Collector", description = "Give the Medal King 80 Small Medals.", points = 10,
    id = 56385, badge = "57559", published = "12/19/2017 1:39:37 AM", modified = "12/20/2017 3:33:27 PM",
    trigger = small_medals_turned_in() >= 80 && small_medals_turned_in() <= 105 && in_game()
)

// POINTS -> 25
achievement(
    title = "Master Collector", description = "Give the Medal King 100 Small Medals.", points = 25,
    id = 56386, badge = "57560", published = "12/19/2017 1:39:41 AM", modified = "10/9/2019 5:43:02 PM",
    trigger = small_medals_turned_in() >= 100 && small_medals_turned_in() <= 109 && in_game()
)

// ----------------------------------------------------------------------------

// $3D03:01 - Capture Falshion, field [temporary]

// $3D04:01 - Give Falshion to old man, Reidock [multi-use]

// $3D06:FF - Find the tunnel to Dhama

// $3D08:01 - Find the tunnel to Dhama

// $3D2A:10 - Get Bag of Goods, Elder's house, Lifecod [multiuse]
// $3D2A:04 - Talk to man upstairs in bar, Lifecod
// $3D2A:01 - Day after festival, Lifecod

// $3D2B:03 - Return to dream world, Well of Dreams [temporary]

// $3D2D:80 - Meet with King, Reidock 
// $3D2D:40 - Get Bag of Goods, Elder's house, Lifecod
// $3D2D:08 - Give Falshion to old man, Reidock [temporary]
// $3D2D:01 - See Hassan in Church, Reidock [temporary]

// $3D2E:80 - Barbara joins the party, Mirror Tower
// $3D2E:40 - Muriel joins the party, Granmaz's House
// $3D2E:20 - Hassan joins the party, Reidock
// $3D2E:10 - Get Flying Bed, Clear Vale
// $3D2E:08 - Get Magic Carpet, Claberona
// $3D2E:01 - Get Staff of Thunder, Reidock

// $3D2F:20 - Capture Falshion, field [temporary]
// $3D2F:10 - Drago joins the party, Arcbolt
// $3D2F:04 - Amos joins the party, Monstoru
// $3D2F:01 - Terry joins the party, Cloud Castle

// $3D30:40 - Use Dream-seeing Drops on Barbara, Mirror Tower
// $3D30:20 - Become Visible, Granmaz's House
// $3D30:10 - Danae is in the party
// $3D30:04 - Prince Holse is in the party
// $3D30:01 - Barbara stays with the ship, Mudo's island

// $3D31:80 - Get Magic Key, Holstock Castle
// $3D31:40 - Arrive on Floating Island after defeating Jamiras, Floating Island [multiuse]

// $3D32:80 - Enter Mudo's chambers, Mudo's Castle 4F
// $3D32:04 - Hassan plans to trap the horse
// $3D32:01 - Final Key, Chest, Sunken Ship B2

// $3D33:40 - Get Bag of Goods, Elder's house, Lifecod [temporary]
// $3D33:08 - ??? [temporary]
// $3D33:07 - Enter Mudo's chambers, Mudo's Castle 4F

// $3D34:08 - Shera and King leave, Island Cave [multi-use]
// $3D34:01 - After the ceremony, Festival Night, Lifecod [temporary]

// $3D35:80 - Get Mirror of Ra, Mirror Tower
// $3D35:40 - Get Mirror Key, Amoru
// $3D35:20 - Get Dream-Seeing Liquid, Dream-Seeing Cave B4
// $3D35:10 - Get Magic Mirror, Ruins of Dhama

// $3D36:80 - Get Rusted Sword, Ice Cave B2
// $3D36:40 - Get Sand Container, Glacos's Palace B1
// $3D36:20 - Get Mermaid's Harp, Mermaids' Reef
// $3D36:10 - Get Watergate Key, Foan 2F
// $3D36:08 - Fragment of Courage, Wall of Destiny
// $3D36:04 - Golden Pickaxe, Chest, Wall of Destiny
// $3D36:02 - Find the Seed of Reasoning, mountain north of Monstoru
// $3D36:01 - King decrees northern gate to open, Reidock

// $3D37:20 - Book of Babbles, Amoru Cave B3
// $3D37:04 - Shield of Sufida, Magical Cave B3
// $3D37:02 - Helm of Cevas, Reidock
// $3D37:01 - Armor of Orgo, Grace Castle

// $3D38:80 - Falshion approaches Pegasus, Pegasus Tower
// $3D38:08 - Terry joins the party, Cloud Castle
// $3D38:04 - Defeat Glacos, Glacos's Palace B2
// $3D38:02 - Defeat Miralgo, Miralgo's Tower 5F
// $3D38:01 - Medal King released, Land of Happiness

// $3D39:80 - Return to Zenithia after defeat Deathtamoor, Zenithia
// $3D39:10 - Get Pegasus Reigns, Pegasus Tower 4F
// $3D39:04 - Hassan Remembers, Mudo's Castle 2F
// $3D39:02 - Shera and King leave, Island Cave
// $3D39:01 - Queen joins the party, Reidock

// $3D3A:80 - There's noone here, Lifecod, epilogue
// $3D3A:40 - Arrive in Lifecod, epilogue
// $3D3A:20 - Chamoro leaves, Gent, epilogue
// $3D3A:10 - Talk to Tania, Lifecod, epilogue
// $3D3A:08 - Talk to Elder, Lifecod, epilogue
// $3D3A:04 - Talk to Soldi, Reidock, epilogue
// $3D3A:02 - Guard steps aside, Reidock, epilogue
// $3D3A:01 - Muriel and Terry return to the wagon, epilogue

// $3D3A:20 - after credits, Reidock, epilogue
// $3D3A:08 - Talk to Barbara, Reidock, epilogue
// $3D3A:04 - regain control, Reidock, epilogue
// $3D3A:02 - Talk to Father, Reidock, epilogue
// $3D3A:01 - Talk to Elder, Lifecod, epilogue

// $3D3B:20 - Can collect Metal Babble Book (postgame)

// $3D3C:10 - Open Watergate

// $3D3D:80 - Muriel, Hassan, and Chamoro leave the campsite, Intro redux
// $3D3D:20 - Muriel and Hassan leave the campsite, Intro
// $3D3D:10 - Put out the fire, Intro or Intro redux
// $3D3D:08 - Capture Falshion, field
// $3D3D:04 - Fall into giant hole, Giant Hole
// $3D3D:02 - Approach crown maker, Giant Hole
// $3D3D:01 - Enter Deathtamoor's Castle, Deathtamoor's Castle

// $3D3E:80 - After the ceremony, Festival Night, Lifecod [temporary]
// $3D3E:20 - Wake up for Festival Night, Lifecod [temporary]
// $3D3E:10 - Get spirit crown from Bilte, NE house, Shiena
// $3D3E:08 - Hassan comments about abandoned ship, Mudo's island
// $3D3E:04 - Arrive at Mudo's island, real world
// $3D3E:02 - Return to Mudo's Castle, intro redux
// $3D3E:01 - Arrive at Mudo's castle, Intro

// $3D3F:80 - Give spirit crown to elder, Lifecod
// $3D3F:20 - Get Bag of Goods, Elder's house, Lifecod
// $3D3F:10 - Scare boy writing grafitti outside bar, Lifecod
// $3D3F:04 - Get control of Hero, Lifecod
// $3D3F:02 - Purchase the Spirit Armor, Lifecod
// $3D3F:01 - Wake up for Festival Night, Lifecod [temporary]

// $3D40:30 - Get Pass from Elder, Festival Night, Lifecod
// $3D40:08 - See Rand Propose, Festival Night, Lifecod
// $3D40:04 - After the fireworks, Festival Night, Lifecod
// $3D40:02 - After the ceremony, Festival Night, Lifecod
// $3D40:01 - Wake up for Festival Night, Lifecod

// $3D41:01 - See Rand after the festival, Lifecod Mountain Pass

// $3D42:80 - See clone at Elder's, Lifecod (real)
// $3D42:40 - Talk to Tania, Lifecod (real)
// $3D42:20 - Talk to Elder, Lifecod (real)

// $3D43:80 - Defeat monsters inside Weapon Shop, Lifecod (real)
// $3D43:40 - Defeat monsters fighting with Rand, Lifecod (real)
// $3D43:20 - Defeat monsters outside Weapon Shop, Lifecod (real)
// $3D43:10 - Defeat monsters at well, Lifecod (real)
// $3D43:08 - Defeat Demon General in Tania's house, Lifecod (real)
// $3D43:04 - Merge with self before fighting Demon General, Tania's house, Lifecode (real)
// $3D43:01 - Talk to clone, Elder's house, Lifecod (real)

// $3D44:40 - Defeat all monsters in Elder's house, Lifecod (real)
// $3D44:10 - Defeat monsters in Elder's house, Lifecod (real)
// $3D44:08 - Defeat monsters in Elder's house, Lifecod (real)
// $3D44:04 - Defeat monsters in Farmer's house, Lifecod (real)
// $3D44:02 - Defeat monsters in silk shop, Lifecod (real)
// $3D44:01 - Defeat monsters in Bar 2F, Lifecod (real)

// $3D45:80 - Get spirit crown from Bilte, NE house, Shiena
// $3D45:40 - Talk to girl in NE house, Shiena
// $3D45:20 - Purchase Map, Shiena
// $3D45:10 - Sell goods, Shiena
// $3D45:08 - Enter Shiena, Shiena
// $3D45:02 - Allow Tonia to call you Brother, Lifecod (Real)
// $3D45:01 - Talk to Elder, Lifecod (real)

// $3D46:80 - Doga offers 480g, Shiena
// $3D46:40 - Boga offers 450g, Shiena
// $3D46:20 - Doga offers 420g, Shiena
// $3D46:10 - Boga offers 390g, Shiena
// $3D46:08 - Doga offers 360g, Shiena
// $3D46:04 - Boga offers 330g, Shiena
// $3D46:01 - Get spirit crown from Bilte, NE house, Shiena

// $3D47:80 - Find Prince Holse in the stable, Holcotta
// $3D47:40 - Get Nut of Life from Mayor, Mayor's House, Torukka
// $3D47:20 - Talk to Eliza, Mayor's house, Torukka
// $3D47:10 - Find out about ransom note, Mayor's House, Torukka
// $3D47:08 - Enter Mayor's House after becoming visible, Mayor's House, Torukka

// $3D48:80 - Amanda poisons the dogfood, Mayor's House, San Marino
// $3D48:40 - Talk to Maid, Mayor's House 2F, San Marino
// $3D48:20 - Talk to Maid, Mayor's House 1F, San Marino 
// $3D48:10 - Talk to Joseph at docks, San Marino
// $3D48:08 - Witness Joseph and Sandy near the docks, San Marino
// $3D48:04 - Talk to Hassan's parents, Woodworking shop, San Marino

// $3D49:80 - Tell Joseph about Sandy's innocence, San Marino
// $3D49:40 - Tell Mayor about Sandy's innocence, San Marino
// $3D49:08 - Talk to Muriel, Ferry shop, San Marino
// $3D49:04 - Day after poisoning, San Marino
// $3D49:02 - Read Ferry sign, Docks, San Marino

// $3D4A:01 - Talk to Hassan's parents after becoming visible, San Marino

// $3D4B:80 - Talk to boy inside church, Amoru
// $3D4B:40 - Talk to priest, church, Amoru
// $3D4B:20 - Apprach child inside church, Amoru
// $3D4B:10 - Watch children, Amoru
// $3D4B:08 - Talk to man, Bar B1, Amoru
// $3D4B:04 - Talk to man, Church B1, Amoru
// $3D4B:02 - Water runs red, Amoru
// $3D4B:01 - Sleep in church, Amoru

// $3D4C:80 - Priest is no longer blocking church, Amoru
// $3D4C:40 - Talk to Scholar, NE House, Amoru
// $3D4C:20 - Talk to man in house by well, Amoru
// $3D4C:10 - Talk to innkeeper, Inn, Amoru
// $3D4C:08 - Talk to warrior in armor shop, Amoru
// $3D4C:04 - Sleep in church, Amoru
// $3D4C:02 - Talk to scholar, Amoru
// $3D4C:01 - Talk to man church basement, Amoru

// $3D4D:80 - Talk to Chamoro on the Divine Ship, Gent
// $3D4D:40 - Get access to the Divine Ship, Gent
// $3D4D:20 - Chamoro gets permission, Elder's House, Gent
// $3D4D:10 - Show Royal Letter to Elder, Gent
// $3D4D:08 - Divine Ship is lowered, Gent
// $3D4D:04 - Find Meteorite Armband, Amoru
// $3D4D:01 - Priest offers bed in basement, Church, Amoru

// $3D4E:01 - Divine Ship is lowered, Gent

// $3D4F:80 - Get Flying Bed, Clear Vale (dream)
// $3D4F:40 - Enter Pescani
// $3D4F:20 - Tell Amos about the monster, Monstoru
// $3D4F:10 - Next morning, Monstoru
// $3D4F:08 - Find out Monstora's origin, Monstoru
// $3D4F:04 - Defeat Monstora, Monstoru
// $3D4F:03 - Spend night at Monstoru Inn, Monstoru

// $3D50:80 - Enter Elder's House, Calberona
// $3D50:10 - Agree to stay the night, Clear Vale (real)
// $3D50:08 - Give Fragment of Courage to John's dad, Clear Vale (real)
// $3D50:04 - Surprise man in Inn, Clear Vale (real)
// $3D50:02 - See John's Parents, Church, Clear Vale (real)
// $3D50:01 - Get Flying Bed, Clear Vale (dream)

// $3D51:20 - See man float into NE house, Calberona
// $3D51:02 - See girl heal boy, Calberona

// $3D52:40 - Talk to nun, church, Calcado
// $3D52:02 - Show Beautiful Carpet to Mr. Calbe, Claberona
// $3D52:01 - Learn Madante, Calberona

// $3D53:80 - Convince Hawk to help, Longadeseo
// $3D53:20 - Get PuffPuff, Longadeseo
// $3D53:10 - Weaponshop owner escort, Longadeseo
// $3D53:08 - Show Longadeseo pass to guard, Longadeseo
// $3D53:04 - Talk to man in well, Calcado
// $3D53:02 - Talk to old man, W house, Calcado
// $3D53:01 - Talk to sick girl, room behind item shop, Calcado

// $3D54:80 - Listen to conversation about Coble, Longadeseo
// $3D54:40 - Talk to Hawk at the bar, Longadeseo
// $3D54:20 - Hawk leaves theatre, Longadeseo
// $3D54:10 - Talk to Hawk in theatre, Longadeseo
// $3D54:08 - Hawk leaves church, Longadeseo
// $3D54:04 - Talk to Hawk in church, Longadeseo
// $3D54:02 - Agree to find Hawk, Longadeseo

// $3D55:40 - Defeat Well Mimic, well, Longadeseo
// $3D55:20 - Sally mentions the writing, Longadeseo
// $3D55:10 - Get Sword of Ramias, Longadeseo
// $3D55:08 - Sally calls from downstairs, Longadeseo
// $3D55:04 - Sally agrees to repair the sword, Longadeseo
// $3D55:01 - Pay Hawk, Longadeseo

// $3D56:80 - Get Longadeseo Pass, Mt. Snow
// $3D56:40 - Talk to Zam about the sword, Mt. Snow
// $3D56:20 - Talk to Goran after unfreezing town, Mt. Snow
// $3D56:02 - Terry talks to Goran, Mt. Snow
// $3D56:01 - Talk to Goran, Mt. Snow

// $3D57:40 - Get the Dragon Robe, Greed Town
// $3D57:20 - Get permission to take the Dragon Robe, Greed Town
// $3D57:10 - Old man says to "sleep below the treasure", Greed Town

// $3D58:20 - Ask Ende to make an item, Hot Springs
// $3D58:08 - Enter hoy springs, Hot Springs
// $3D58:04 - Get Rusted Pipe, Despair Town

// $3D59:08 - Regain health, Despair Town

// $3D5A:40 - Get soldier uniforms, Prison Town
// $3D5A:20 - Get put in prison, Prison Town
// $3D5A:10 - Get Prison Key, Prison Town
// $3D5A:08 - Defeat Sorrow Giant, Prison Town
// $3D5A:04 - Get Ende's Tools, Zaxon

// $3D5B:80 - Next day, Prison Town
// $3D5B:40 - Lose to Zozogel and Dogma, Prison Town
// $3D5B:20 - Talk to shopkeeper again, Prison Town
// $3D5B:10 - Talk to Gon, Prison Town
// $3D5B:08 - Talk to shopkeeper, Prison Town
// $3D5B:04 - Tell barkeeper about Anna's fate, Prison Town
// $3D5B:02 - Find out about Anna's fate, Prison Town

// $3D5C:80 - Townsfolk carry off Anna, Prison Town
// $3D5C:40 - Defeat Akbar, Prison Town
// $3D5C:04 - Rebellion begins, Prison Town
// $3D5C:01 - Get rescured, Prison Town

// $3D5D:80 - Town turned to stone, Prison Town
// $3D5D:40 - Soldi leaves, Prison Town
// $3D5D:20 - Release Krimut, Prison Town

// $3D5E:80 - Get expelled from Mudo's castle, Intro
// $3D5E:40 - Muriel thinks it's too easy to enter the castle, Intro
// $3D5E:20 - Return to Mudo's Castle, intro redux
// $3D5E:08 - Tell Krimut about Masarl, Prison Town
// $3D5E:01 - Town turned to stone, Prison Town

// $3D5F:80 - Defeat Mudo, Mudo's Castle 4F
// $3D5F:40 - Engage Mudo, Mudo's Castle 4F
// $3D5F:20 - Banished to Lifecod, again, Mudo's Castle 4F
// $3D5F:10 - Muriel talks about Demon King, Mudo's Castle 3F
// $3D5F:08 - Defeat Hell Guard, Mudo's Castle 4F
// $3D5F:04 - Open NE door, Mudo's Castle 1F
// $3D5F:02 - Talk to Chamoro (get Return for Mudo Castle), intro redux
// $3D5F:01 - Return to Mudo's Castle, intro redux

// $3D60:80 - Engage Mudo, Mudo's Castle 4F
// $3D60:40 - Defeat S HellBeast, Mudo's Castle 3F
// $3D60:20 - Defeat W HellBeast, Mudo's Castle 3F
// $3D60:10 - Defeat SE HellBeast, Mudo's Castle 2F
// $3D60:08 - Defeat NE HellBeast, Mudo's Castle 2F
// $3D60:04 - Defeat SW HellBeast, Mudo's Castle 2F
// $3D60:02 - Defeat NW HellBeast, Mudo's Castle 2F
// $3D60:01 - Defeat Mudo again, Mudo's Castle 2F

// $3D61:80 - Soldier moves aside so you can enter castle, Reidock
// $3D61:40 - Enter Castle, Reidock
// $3D61:20 - Bell Rings, Reidock
// $3D61:18 - See Hassan in Church, Reidock
// $3D61:04 - Get Strength Seed for returning Ring, Reidock
// $3D61:02 - Defeat Dark Hobbit, Well, Reidock
// $3D61:01 - Show pass to guard, Reidock

// $3D62:80 - Talk to old man after getting permission to take the wagon, Reidock
// $3D62:40 - Get permission to take wagon from King, Reidock
// $3D62:20 - Meet with King, Reidock
// $3D62:10 - Soldi escorts Hero and Hassan to King, Reidock
// $3D62:04 - Give Broken Heart to Soldi, Reidock
// $3D62:01 - Soldi sends the recruits to the Tower of Trials, Reidock

// $3D63:80 - Show Mirror of Ra to Soldi, Reidock
// $3D63:68 - Give Broken Heart to Soldi, Reidock
// $3D63:04 - Guard blocking throne room moves, Reidock
// $3D63:02 - Meet with King, Reidock
// $3D63:01 - Soldi escorts Hero and Hassan to King, Reidock

// $3D64:80 - Next day after defeating fake Mudo, Reidock
// $3D64:40 - Return to Reidock after defeating fake Mudo, Reidock
// $3D64:20 - Queen joins the party, Reidock
// $3D64:10 - The King is a Queen, Reidock
// $3D64:08 - King appears sick, Reidock
// $3D64:04 - At Night, Reidock
// $3D64:02 - Show Mirror of Ra to king, Reidock
// $3D64:01 - Show Mirror of Ra to Soldi, Reidock

// $3D65:02 - Enter Castle, Reidock

// $3D66:80 - Get escorted out of castle, Reidock
// $3D66:40 - Guess sister's name, Reidock
// $3D66:20 - Talk to handmaid in throne room, Reidock
// $3D66:10 - Gain entraince to throne room, Reidock
// $3D66:08 - Talk to prisoner, Reidock7
// $3D66:04 - Meet general Tom, Reidock
// $3D66:02 - Enter castle, Reidock
// $3D66:01 - Gain entrance to castle, Reidock

// $3D67:80 - Reunite with parents, Reidock
// $3D67:20 - Rejoin party, Reidock
// $3D67:10 - Queen tells Hero to find himself, Reidock
// $3D67:08 - Talk to King on balcony, Reidock
// $3D67:04 - Talk to Queen, Reidock
// $3D67:02 - King asks you to follow him, Reidock
// $3D67:01 - Watch cutscene abuot King's disappearance, Reidock

// $3D68:80 - See all flashbacks, Reidock
// $3D68:40 - See flashback in kitchen, Reidock
// $3D68:20 - See flashback in library, Reidock
// $3D68:10 - See flashback in courtyard, Reidock
// $3D68:08 - See flashback on west wall, Reidock
// $3D68:04 - See flashback on east wall, Reidock
// $3D68:02 - See flashback at soldier's table, Reidock
// $3D68:01 - Granmaz wakes you up, Reidock

// $3D69:80 - Ask to see the King, Foan 2F
// $3D69:40 - Scare looter, Ruins of Dhama
// $3D69:20 - Gain access to bonus dungeon, Dhama
// $3D69:02 - Day after flashbacks Reidock
// $3D69:01 - See flashback in throne room, Reidock

// $3D6A:80 - Talk to Princess, Foan 2F
// $3D6A:40 - Release Princess from Mirror, Foan 2F
// $3D6A:20 - Agree to defeat Miralgo, Foan 2F
// $3D6A:10 - Try to use Mirror of Ra on Princess, Foan B1
// $3D6A:08 - King asks about Mirror of Ra, Foan 2F
// $3D6A:04 - King says to meet him upstairs, Foan B1
// $3D6A:01 - Guard moves to allow access to basement, Foan 1F

// $3D6B:80 - Holse "forgot" something, Holstock Castle
// $3D6B:40 - Holse agrees to go with hero, Holstock Castle
// $3D6B:20 - Find Prince Holse in Barrel, Holstock Castle
// $3D6B:10 - Talk to boy, Prince Holse's Room, Holstock Castle
// $3D6B:08 - Talk to King, Holstock Castle
// $3D6B:02 - Celebration of Holse's baptism, Holstock Castle [temporary]

// $3D6C:40 - Defeat Deathtamoor, Deathtamoor's Castle
// $3D6C:20 - Complete Grace Castle intermission, Grace Castle
// $3D6C:10 - Get Magic Key, Holstock Castle
// $3D6C:04 - Next day, Holstock Castle
// $3D6C:02 - Celebration of Holse's baptism, Holstock Castle
// $3D6C:01 - Find Prince Holse on the ledge, Holstock Castle

// $3D6D:80 - Enter empress's chamber, Gandino castle
// $3D6D:30 - Talk to king, Ganindo castle
// $3D6D:08 - Old man leaves couple's house, Gandino
// $3D6D:04 - Witness old man talking to couple, eastern house, Gandino
// $3D6D:02 - Talk to old man, church, Gandino
// $3D6D:01 - Dark Dream defeats Deathtamoor, Deathtamoor's Castle

// $3D6E:08 - Terry leaves, Arcbolt
// $3D6E:04 - Enter Arcbolt, Arcbolt
// $3D6E:02 - Guards allow entry, Arcbolt
// $3D6E:01 - Defeat Well Mimic, Gandino

// $3D6F:80 - Defeat Brast, Arcbolt
// $3D6F:20 - Engage Brast in battle, Arcbolt
// $3D6F:10 - Brast goes to training room, Arcbolt
// $3D6F:04 - Brast moves out of the way, Arcbolt
// $3D6F:02 - Garcia moves out of the way, Arcbolt
// $3D6F:01 - Defeat Garcia, Arcbolt

// $3D70:80 - King boasts about Sword of Thunder, Arcbolt
// $3D70:40 - King describes the Sword of Thunder, Arcbolt
// $3D70:20 - King admits giving the Sword of Thunder to Terry, Arcbolt
// $3D70:10 - Terry boasts about the Sword of Thunder, Arcbolt
// $3D70:08 - Get Coffin, Arcbolt
// $3D70:04 - Talk to King after defeating Brast, Arcbolt
// $3D70:02 - Brast and company leave training room, Arcbolt

// $3D71:80 - Defeat Hell Cloud, Cloud Castle
// $3D71:20 - King Zenith gives Pegasus ability to access Dark World, Cloud Castle
// $3D71:10 - Gain access to the well, Cloud Castle
// $3D71:08 - Get Sap of the World Tree, Cloud Castle
// $3D71:06 - Talk to King Zenith, Cloud Castle

// $3D72:10 - Defeat Duran, Cloud Castle
// $3D72:08 - Defeat Terry, Cloud Castle
// $3D72:04 - Defeat Killing Machine and Land Armor, Cloud Castle
// $3D72:02 - Duran grants passage, Cloud Castle
// $3D72:01 - Defeat Hell Cloud, Cloud Castle

// $3D73:80 - Leave through graveyard, Lifecod Mountain Pass
// $3D73:40 - Wake Rand from his nap, Lifecod Mountain Pass

// $3D74:80 - Agree to escort Iria, cave near Amoru B5
// $3D74:40 - Defeat Horror Beast, cave near Amoru B5
// $3D74:08 - Defeat Bloody Paw, Dream-Seeing Cave B4
// $3D74:04 - Confront your double, Lifecod Mountain Pass cave
// $3D74:02 - Your double leaves, Lifecod Mountain Pass

// $3D75:C0 - Discover Rob's secret, Pescani Cave
// $3D75:20 - Shera and King leave, Island Cave
// $3D75:10 - Mudo tries to escape, Island Cave
// $3D75:08 - Defeat Mudo, Island Cave
// $3D75:02 - Return to Amoru after reuiniting Iria and Gina, Amoru
// $3D75:01 - Defeat Horror Beast, cave near Amoru B5

// $3D76:80 - Break third wall on right side cave, Wall of Destiny
// $3D76:40 - Break wall on right side cave, Wall of Destiny
// $3D76:20 - Break wall near Small Medal chest, Wall of Destiny
// $3D76:06 - Danae joins the party, Pescani Cave
// $3D76:01 - Agree to escort Danae home, Pescani Cave

// $3D77:80 - Hassan realizes Holse ran off again, Baptismal Cave
// $3D77:40 - Prince Holse runs off again, Baptismal Cave
// $3D77:10 - Defeat Jamiras, Land of Happiness
// $3D77:08 - Answer the door's riddles, Ice Cave
// $3D77:04 - Terry declines to take the Sword of Ramias
// $3D77:02 - Break wall in upper cave, Wall of Destiny
// $3D77:01 - Break second wall on right side cave, Wall of Destiny

// $3D78:80 - Holse approached waterfall, Baptismal Cave B3
// $3D78:20 - Holse hides north of the stairs, Baptismal Cave B2 [temporary]
// $3D78:10 - Holse hides by the chest, Baptismal Cave B1 [temporary]
// $3D78:08 - Third Trial disappears, Baptismal Cave
// $3D78:04 - Second Trial disappears, Baptismal Cave
// $3D78:02 - First Trial disappears, Baptismal Cave
// $3D78:01 - Holse gets baptised, Baptismal Cave

// $3D79:80 - Talk to wounded monster, tunner near Arcbolt B1
// $3D79:40 - Guard moves aside, tunnel near Arcbolt B1 outside
// $3D79:10 - Note, Chest, Greed Town Mine B3
// $3D79:08 - Holse asks for escort back to castle, Baptismal Cave B3
// $3D79:02 - Open door, Baptismal Cave B2
// $3D79:01 - Open door, Baptismal Cave B1

// $3D7A:80 - Defeat Hellviper, tunnel near Arcbolt B3 west (lower)
// $3D7A:40 - Defeat Hellviper, tunnel near Arcbolt B3 center
// $3D7A:20 - Defeat Hellviper, tunnel near Arcbolt B3 SW
// $3D7A:10 - Wake man after losing coffin, tunnel near Arcbolt B1
// $3D7A:08 - Guard takes coffin, tunnel near Arcbolt B1 outside
// $3D7A:04 - Terry leaves, tunnel near Arcbolt B3
// $3D7A:02 - Watch Terry defeat the monster, tunnel near Arcbolt B3
// $3D7A:01 - Approach Terry, tunnel near Arcbolt B3

// $3D7B:40 - True city revealed, Deathcod
// $3D7B:20 - Elder greeting, Deathcod
// $3D7B:10 - Talk to girl in Tania's house, Deathcod
// $3D7B:08 - Attempt to uproot plant, mountain north of Monstoru
// $3D7B:04 - Defeat Hellviper, tunnel near Arcbolt B3 north
// $3D7B:02 - Defeat Hellviper, tunnel near Arcbolt B3 east
// $3D7B:01 - Defeat Hellviper, tunnel near Arcbolt B3 west (upper)

// $3D7C:10 - Eliza and Mayor return home, Well of Dreams
// $3D7C:08 - Biggs and Smok run off, Well of Dreams
// $3D7C:04 - Defeat Biggs and Smok, Well of Dreams
// $3D7C:02 - Return to dream world, Well of Dreams
// $3D7C:01 - Defeat Dark Dream, Bonus Dungeon

// $3D7D:60 - Muriel agrees to go to the Dream-Seeing Cave, Grandmaz's House
// $3D7D:10 - Stay at Granmaz's, Grandmaz's House
// $3D7D:08 - Find out about the Shrine of Dhama, Dwarf's house
// $3D7D:04 - Hassan builds the cabin, Dwarf's house
// $3D7D:02 - Agree to help build the cabin, Dwarf's house
// $3D7D:01 - Find out about the Shrine of Dhama, Dwarf's house

// $3D7E:04 - Return Danae to Mermaids' Reef
// $3D7E:01 - Defeat Well Demon, Well, Granmaz's House

// $3D7F:80 - Floating island departs, Floating Island
// $3D7F:40 - Yurina uncurses Mt. Snow
// $3D7F:10 - Sally runs back to town, graveyard
// $3D7F:08 - See Sally a the graveyard

// $3D80:80 - Return to Calcado, Calcado
// $3D80:04 - Take island back to Calcado, Floating Island
// $3D80:02 - Escorted off Floating Island, Floating Island
// $3D80:01 - Floating island arrives, Floating Island

// $3D81:80 - Defeat Death Hole, Well, shrine near Pegasus Tower
// $3D81:20 - Find cave below treasure chest, lake northwest of Greed Town
// $3D81:18 - Open the empty chest, lake northwest of Greed Town

// $3D82:80 - Mountain crumbles, shrine
// $3D82:40 - Masarl is unchained, shrine
// $3D82:10 - Defeat Zuikaku and Shoukaku, shrine
// $3D82:08 - See Masarl's flashback, shrine
// $3D82:01 - Defeat Hell Cloud, Cloud Castle

// $3D83:40 - Win Style Contest 3
// $3D83:20 - Win Style Contest 7
// $3D83:08 - Win Style Contest 1
// $3D83:02 - Defeat Well Mimic, house southwest of Holstock Castle

// $3D84:80 - Defeat Tower Guard, Tower of Trials 3F
// $3D84:10 - Return to Reidock with Broken Heart, Reidock
// $3D84:08 - Open middle door, Tower of Trials 6F
// $3D84:01 - Defeat Well Mimic, well southwest of Tower of Trials

// $3D85:20 - Talk to Nelson after defeating him, Tower of Trials 9F
// $3D85:10 - Get Gold Ring, Tower of Trials 7F
// $3D85:08 - Talk to Hassan, Tower of Trials 5F
// $3D85:02 - Defeat Nelson, Tower of Trials 9F

// $3D86:80 - Use Dream-seeing Drops on Barbara, Mirror Tower
// $3D86:10 - Get Gold Ring, Tower of Trials 7F

// $3D87:10 - Enter room with Mirror of Ra, Mirror Tower
// $3D87:05 - Barbara (Ghost) joins the party, Mirror Tower 5F
// $3D87:02 - Barbara tells party her name, Mirror Tower 5F

// $3D88:80 - Release Pegasus, Pegasus Tower 4F
// $3D88:40 - Defeat Pegasus's guards, Pegasus Tower 4F
// $3D88:20 - Floating room falls, Mirror Tower 6F
// $3D88:10 - Destroy SE Orb, Mirror Tower 6F
// $3D88:08 - Destroy NE Orb, Mirror Tower 6F
// $3D88:04 - Destroy SW Orb, Mirror Tower 6F
// $3D88:02 - Destroy NW Orb, Mirror Tower 6F
// $3D88:01 - Defeat Poison Zombies, Mirror Tower 1F

// $3D89:80 - Medical Herb, Pot, West of Item Shop, Lifecod
// $3D89:40 - Medical Herb, Pot, Outside Elder's house, Lifecod
// $3D89:20 - Talk to Rubiss again, Rubiss's Shrine
// $3D89:10 - Talk to Rubiss, Rubiss's Shrine
// $3D89:08 - Defeat east guardians, Underwater Castle
// $3D89:04 - Defeat west guardians, Underwater Castle

// $3D8A:40 - Defense Seed, Barrel, SW house, Lifecod
// $3D8A:20 - Antidote Herb, Pot, Elder's house, Lifecod
// $3D8A:10 - Leather Cap, Dresser, Hero's house, Lifecod
// $3D8A:08 - Agility Seed, Barrel, Hero's house, Lifecod
// $3D8A:04 - 10g, Pot, Hero's house, Lifecod
// $3D8A:02 - 10g, Barrel, outside sewing shop, Lifecod
// $3D8A:01 - 3g, Barrel, Bar, Lifecod

// $3D8B:80 - Medical Herb, outside Inn, Shiena
// $3DB8:40 - Stylish Bandana, Dresser, Mayor's House, Lifecod (real)
// $3DB8:20 - Royal Clothes, Dresser, Tania's House, Lifecod (real)
// $3DB8:10 - Medical Herb, Pot, Tania's House, Lifecod (real)
// $3D8B:08 - Defense Seel, Dresser, Bar 2F, Lifecod (real)
// $3D8B:04 - 10g, barrel, outside silk shop, Lifecod (real)
// $3D8B:02 - Pot Lid, Barrel, Bar, Lifecod (real)
// $3DB8:01 - Small Medal, Pot, outside mayor's house, Lifecod (real)

// $3D8C:80 - Wooden Hat, Dresser, NW house, Torukka
// $3D8C:40 - 20g, Pot, Item Shop, Torukka
// $3D8C:20 - Nut of Life, Pot, Inn, Torukka
// $3D8C:10 - 250g, Chest, Bank, Shiena
// $3D8C:08 - Wing of the Wyvern, Pot, Bank, Shiena
// $3D8C:04 - Scale Shield, dresser, Inn, Shiena
// $3D8C:02 - 5g, Barrel, outside NE building, Shiena
// $3D8C:01 - Agility Seed, Barrel, near Doga, Shiena

// $3D8D:80 - Iron Claw, Barrel, Hidden Area, San Marino
// $3D8D:40 - Small Medal, Pot, NW house, Holcotta
// $3D8D:20 - Full Moon Herb, Dresser, SE house, Holcotta
// $3D8D:10 - Small Medal, Barrel, Outside Inn, Holcotta
// $3D8D:08 - Small Medal, Dresser, Inside Well, Torukka
// $3D8D:04 - Beauty Plant, Dresser, NE house, Torukka
// $3D8D:02 - Medical Herb, Pot, NE house, Torukka
// $3D8D:01 - Tunic, Closet, N house, Torukka

// $3D8E:80 - 50g, Dresser, W House, Amoru
// $3D8E:40 - Fur Hood, Barrel, Middle Storage Room, Docks, San Marino
// $3D8E:20 - Medical Herb, Pot, Inn, San Marino
// $3D8E:10 - Small Medal, Pot, Amanda's room, Inn, San Marino
// $3D8E:08 - Beauty Plant, Closet, Amanda's room, Inn, San Marino
// $3D8E:04 - 1500g, Chest, Prison B1, San Marino
// $3D8E:02 - Small Medal, Chest, Prison B1, San Marino
// $3D8E:01 - Bamboo Spear, Dresser, Mayor's House 1F, San Marino

// $3D8F:80 - Water of Amoru, Barrel, Bar B1, Amoru
// $3D8F:40 - Wing of the Wyvern, Dresser, Bar, Amoru
// $3D8F:20 - Small Medal, Dresser, W House, Amoru
// $3D8F:04 - Water of Amoru, Barrel, Bar B1, Amoru
// $3D8F:02 - Usamimi Band, Dresser, Bar, Amoru
// $3D8F:01 - Small Medal, Pot, Church B1, Amoru

// $3D90:80 - 15g, Pot, Roof Inn, Monstoru
// $3D90:40 - Small Medal, SW patch of dirt, center of town, Monstoru
// $3D90:20 - Nut of Magic, Pot, Elder's House, Gent
// $3D90:10 - Pointed Hat, Dresser, Elder's House, Gent
// $3D90:08 - Tunic, Dresser, Inn, Gent
// $3D90:04 - Defense Seed, Pot, SW House, Gent
// $3D90:02 - Water of Amoru, Pot, Church, Amoru
// $3D90:01 - Fairy Water, Pot, Church, Amoru

// $3D91:80 - Small Medal, Barrel, Fish Shop, Pescanitemporary
// $3D91:40 - Defense Seed, Barrel, central house, Pescani
// $3D91:20 - Boxer Shorts, Dresser, NW house, Pescani
// $3D91:10 - Scale Shield, Dresser, NW House, Monstoru
// $3D91:08 - Small Medal, Dresser, W House, Monstoru
// $3D91:04 - 3g, Pot, W House, Monstoru
// $3D91:02 - Piece of Cloth, Dresser, S House, Monstoru
// $3D91:01 - Antidote Herb, Pot, Roof Inn, Monstoru

// $3D92:80 - Small Medal, Dresser, John's room, NE House, Clear Vale (dream)
// $3D92:40 - Small Medal, Dresser, SW House, Clear Vale (dream)
// $3D92:20 - Dancer's Clothes, Inn 2F, Clear Vale (dream)
// $3D92:10 - Piece of Cloth, Closet, Inn, Clear Vale (dream)
// $3D92:08 - Fairy Water, Dresser, Church, Clear Vale (dream)
// $3D92:04 - Full Moon Herb, Barrel, SW house, Pescani
// $3D92:02 - 60g, Pot, Southmost house, Pescani
// $3D92:01 - 7g, Barrel, Rob's house, Pescani

// $3D93:80 - Wizard's Ring, Chest, Well, Calberona
// $3D93:20 - Strength Seed, Pot, NE House, Clear Vale (real)
// $3D93:10 - Small Medal, Dresser, SW House, Clear Vale (real)
// $3D93:08 - 50g, Closet, above weaponshop, Clear Vale (real)
// $3D93:04 - Wayfarer's Clothes, Dresser, Inn 2F, Clear Vale (real)
// $3D93:02 - Piece of Cloth, Closet, Inn, Clear Vale (real)
// $3D93:01 - Wing of Wyvern, Dresser, Church, Clear Vale (real)

// $3D94:80 - Orichalcum Fang, ground, Calcado
// $3D94:40 - Wayfarer's Clothes, Dresser, room behind item shop, Calcado
// $3D94:20 - Small Medal, Pot, NW house, Calcado
// $3D94:10 - Fairy Water, Pot, W house, Calcado
// $3D94:08 - Magic Potion, Pot, NW house, Calberona
// $3D94:02 - Small Medal, Barrel, Central building B1, Calberona
// $3D94:01 - Nut of Magic, Dresser, Central building B1, Calberona

// $3D95:40 - Beauty Plant, Dresser, dressing room, theatre B1, Longadeseo
// $3D95:20 - Fishnet Stockings, Dresser, dressing room, theatre B1, Longadeseo
// $3D95:10 - Small Medal, Barrel, behind bar, Longadeseo
// $3D95:08 - Wisdom Seed, Chest, Longadeseo
// $3D95:04 - 2500g, Chest, Longadeseo
// $3D95:02 - Nut of Life, Chest, Longadeseo
// $3D95:01 - Wisdom Seed, Chest, Longadeseo

// $3D96:80 - Nut of Life, gravestone, Greed Town
// $3D96:40 - Small Medal, ground, west of NW building, Greed Town
// $3D96:20 - Mimic, Morgan's Mansion 2F, Greed Town
// $3D96:08 - Small Medal, Dresser, NE building B1, Mt. Snow
// $3D96:04 - Fur Hood, Dresser, building north of inn, Mt. Snow
// $3D96:02 - Small Medal, Dresser, NW corner of town, Longadeseo
// $3D96:01 - Thief's Key, Dresser, house inside well, Longadeseo

// $3D97:80 - Defense Seed, Pot, Ende's room, Despair Town
// $3D97:40 - Small Medal, Pot, Inn, Despair Town
// $3D97:20 - Small Medal, Gravestone, Despair Town
// $3D97:10 - Wing of the Wyvern, Pot, NW part of Despair Town
// $3D97:08 - Nut of Life, Barrel, near item shop, Despair Town
// $3D97:04 - Armband of Sacrifice, Barrel, Morgan's Mansion, Greed Town
// $3D97:02 - Beauty Plant, Pot, House, Greed Town
// $3D97:01 - 600g, Barrel, Greed Town

// $3D98:80 - 4800g, Chest, Prison Town
// $3D98:40 - Small Medal, Chest, Prison Town
// $3D98:20 - Beauty Plant, Jar, NW house, Zaxon
// $3D98:10 - 58g, Pot, Ende's house, Zaxon
// $3D98:08 - Demon Pot, Pot, outside southern house, Zaxon
// $3D98:04 - Wisdom Seed, Pot, outside southern house, Zaxon
// $3D98:02 - Small Medal, Barrel, outside east house, Zaxon
// $3D98:01 - Defense Seed, Barrel, outside east house, Zaxon

// $3D99:40 - Small Medal, Barrel, Prison Town
// $3D99:20 - Chain Sickle, Barrel, Prison Town
// $3D99:10 - Agility Seed, Pot, Prison Town
// $3D99:04 - Nut of Magic, Dresser, Prison Town
// $3D99:01 - Shield of Ruin, Chest, Parion Town

// $3D9A:80 - Fire Claw, Chest, Mudo's Castle 3F
// $3D9A:40 - Iron Mask, Chest, Mudo's Castle 2F
// $3D9A:20 - 1800g, Chest, Mudo's Castle 2F
// $3D9A:10 - Demon Pot, Pot, Mudo's Castle 3F
// $3D9A:08 - Man Eater Chest, Chest, Mudo's Castle 2F
// $3D9A:02 - Small Medal, Pot, Prison Town

// $3D9B:80 - Small Medal, Chest, Reidock B1
// $3D9B:40 - Boxer Shorts, Chest, Reidock B1
// $3D9B:20 - Silver Tiara, Dresser, Throne Room, Reidock
// $3D98:10 - Small Medal, Pot, Kitchen, Reidock
// $3D9B:08 - Antidote Herb, NW house, Reidock
// $3D9B:04 - Medical Herb, Church, Reidock
// $3D9B:02 - Tunic, Closet, W house, Reidock
// $3D9B:01 - Antique Ring, Chest, Well, Reidock

// $3D9C:80 - Silk Robe, Dresser, Throne Room, Reidock
// $3D9C:40 - Small Medal, Pot, NW House, Reidock
// $3D9C:20 - Fairy Water, Dresser, Church, Reidock
// $3D9C:10 - Medical Herb, Pot, W House, Reidock
// $3D9C:04 - 530g, Chest, underwater cave, Reidock
// $3D9C:02 - Shield of Strength, underwater cave, Reidock
// $3D9C:01 - Small Medal, Chest, underwater cave, Reidock

// $3D9D:80 - Small Medal, Dresser, Foan 2F
// $3D9D:40 - Beauty Plant, Chest, Bank, Foan B1
// $3D9D:20 - 150g, Chest, Bank, Foan B1
// $3D9D:10 - Small Medal, Dhama Shrine B1
// $3D9D:08 - Nut of Magic, Dhama Shrine B2
// $3D9D:04 - Nut of Life, Dhama Shrine B2
// $3D9D:02 - Platinum Shield, Chest, Reidock B1
// $3D9D:01 - Small Medal, Chest, Reidock B1

// $3D9E:80 - Small Medal, Chest, Grace Castle (dream)
// $3D9E:40 - Wisdom Seed, Barrel, Holstock Castle B1
// $3D9E:20 - Small Medal, Pot, Kitchen, Holstock Castle
// $3D9E:10 - Small Medal, Ground near western wall outside prince's room, Holstock Castle
// $3D9E:08 - Platinum Mail, Chest, Holstock Castle
// $3D9E:04 - Small Medal, Chest, Holstock Castle
// $3D9E:02 - Small Medal, Dresser, Foan Castle 3F
// $3D9E:01 - Nut of Magic, Barrel, Kitchen, Foan Castle 2F

// $3D9F:80 - Golden Tiara, Chest, Deathtamoor's Castle 3F
// $3D9F:40 - Small Medal, Chest, Deathtamoor's Castle 1F
// $3D9F:20 - Demon Spear, Chest, Deathtamoor's Castle 2F
// $3D9F:10 - Beauty Plant, Dresser, room above Kitchen, Castle Grace
// $3D9F:08 - Agility Seed, Pot, Kitchen, Castle Grace
// $3D9F:04 - Small Medal, Dresser, Queen's Chambers, Castle Grace
// $3D9F:02 - Strength Seed, Chest, Grace Castle (dream)
// $3D9F:01 - Aeolus's Shield, Chest, Grace Castle (dream)

// $3DA0:80 - Wayfarer's Clothes, Dresser, Southern house, Gandino
// $3DA0:20 - Wizard's Ring, Chest, well, Gandino
// $3DA0:10 - Metal King Sword, Chest, Deathtamoor's Castle 4F
// $3DA0:08 - Princess' Robe, Chest, Deathtamoor's Castle 4F
// $3DA0:04 - Mimic, Chest, Deathtamoor's Castle 4F
// $3DA0:02 - Small Medal, Chest, Deathtamoor's Castle 4F
// $3DA0:01 - Mimic, Chest, Deathtamoor's Castle 3F

// $3DA1:80 - Fairy Water, pot, Gandino castle 2F
// $3DA1:40 - Wisdom Seed, Barrel, kitchen, Gandino castle
// $3DA1:20 - Small Medal, ground, garden, Gandino castle
// $3DA1:10 - Agility Seed, Barrel, well, Gandino
// $3DA1:08 - Small Medal, Barrel, well, Gandino
// $3DA1:04 - Small Medal, Barrel, E House B1, Gandino
// $3DA1:02 - 70g, Dresser, E House B1, Gandino
// $3DA1:01 - Beauty Plant, Pot, SE house, Gandino

// $3DA2:80 - Small Medal, Pot, Kitchen, Arcbolt
// $3DA2:40 - Slime Clothes, Chest, armor shop, Arcbolt
// $3DA2:20 - Defeat Pott, Pot, prison, Gandino castle
// $3DA2:10 - Small Medal, Pot, prison, Gandino castle
// $3DA2:08 - Silver Bracelet, Dresser, Gandino castle west tower 1F
// $3DA2:04 - Small Medal, Barrel, Gandino castle west tower 2F
// $3DA2:02 - Beauty Plant, Dresser, Gandino castle 3F
// $3DA2:01 - Nut of Life, Dresser, Gandino castle 2F

// $3DA3:80 - Small Medal, behind throne, Cloud Castle
// $3DA3:40 - Leaf of the World Tree, Dresser, Cloud Castle
// $3DA3:20 - Small Medal, Dresser, Cloud Castle
// $3DA3:10 - Silk Robe, Dresser, royal bedroom, Arcbolt
// $3DA3:08 - Small Medal, Pot, prison, Arcbolt
// $3DA3:04 - Poison Needle, Chest, NE tower, Arcbolt
// $3DA3:02 - Small Medal, Barrel, NE tower, Arcbolt
// $3DA3:01 - Small Medal, Pot, training room, Arcbolt

// $3DA4:80 - 880g, Chest, Lifecod Mountain Pass (real world)
// $3DA4:40 - Small Medal, Chest, Lifecod Mountain Pass (real world)
// $3DA4:20 - Medical Herb, Chest, Lifecod Mountain Pass
// $3DA4:10 - Club, Chest, Lifecod Mountain Pass
// $3DA4:08 - 20g, Chest, Lifecod Mountain Pass
// $3DA4:04 - Wayfarer's Clothes, Chest, Lifecod Mountain Pass
// $3DA4:02 - Leaf of the World Tree, Dresser, Cloud Castle
// $3DA4:01 - Nut of Life, Dresser, Cloud Castle

// $3DA5:80 - Bronze Knife, Chest, Dream-Seeing Cave B3
// $3DA5:40 - Defense Seed, Chest, Dream-Seeing Cave B2
// $3DA5:20 - 230g, Chest, Dream-Seeing Cave B2
// $3DA5:10 - Wing of the Wyvern, Chest, Dream-Seeing Cave B1
// $3DA5:08 - Bronze Shield, Chest, tunnel to Dhama
// $3DA5:04 - 270g, Chest, tunnel to Dhama
// $3DA5:02 - Small Medal, Chest, Lifecod Mountain Pass (real world)
// $3DA5:01 - Beauty Plant, Chest, Lifecod Mountain Pass (real world)

// $3DA6:80 - Iron Claw, Chest, Cave near Amoru B4
// $3DA6:40 - Nut of Magic, Chest, Cave near Amoru B3
// $3DA6:20 - Small Medal, Chest, Cave near Amoru B3
// $3DA6:10 - Bladed Boomerang, Chest, Cave near Amoru B3
// $3DA6:08 - 410g, Chest, Cave near Amoru B2
// $3DA6:04 - Beauty Plant, Chest, Cave near Amoru B2
// $3DA6:02 - Nut of Life, Chest, Cave near Amoru B1
// $3DA6:01 - Fur Mantle, Chest, Dream-Seeing Cave B3

// $3DA7:80 - Man-eater Chest, Cave to Mudo's Castle B3
// $3DA7:40 - Magic Potion, Cave to Mudo's Castle B3
// $3DA7:20 - Man-eater Chest, Cave to Mudo's Castle B2
// $3DA7:10 - Nut of Life - Cave to Mudo's Castle B2
// $3DA7:08 - Chain Cross - Cave to Mudo's Castle B1
// $3DA7:04 - 1150g, Chest, Cave to Mudo's Castle 1F
// $3DA7:02 - Full Plate, Chest, Cave to Mudo's Castle 1F
// $3DA7:01 - Magic Potion, Chest, Cave near Amoru B4

// $3DA8:80 - Wisdom Seed, Glacos's Palace 1F
// $3DA8:40 - 270g, Chest, Glacos's Palace 1F
// $3DA8:20 - Small Medal, Chest, Glacos's Palace 1F
// $3DA8:10 - Iron Helm, Chest, Island Cave Outside
// $3DA8:08 - Dancer's Clothes, Chest, Mudo's Castle B1
// $3DA8:04 - Nut of Magic, Chest, Island Cave B2
// $3DA8:02 - Magic Potion, Chest, Island Cave Outside
// $3DA8:01 - Man-eater Chest, Cave to Mudo's Castle B2a

// $3DA9:80 - Small Medal, Wall of Destiny
// $3DA9:40 - 350g, Chest, Wall of Destiny
// $3DA9:20 - Nut of Life, Wall of Destiny
// $3DA9:08 - Mimic, Chest, Glacos's Palace B1
// $3DA9:04 - Magical Skirt, Chest, Glacos's Palace B1
// $3DA9:02 - Beauty Plant, Chest, Glacos's Palace B1
// $3DA9:01 - Pink Pearl, Chest, Glacos's Palace B1

// $3DAA:80 - Small Medal, Chest, Magical Cave B3
// $3DAA:40 - Swordedge Armor, Chest, Magical Cave B2
// $3DAA:20 - Small Medal, Chest, Magical Cave B2
// $3DAA:10 - Small Medal, Chest, Magical Cave B1
// $3DAA:08 - 1900g, Chest, Magical Cave B1
// $3DAA:04 - Defense Seed, Chest, Magical Cave B1
// $3DAA:02 - Small Medal, Chest, Ice Cave B1
// $3DAA:01 - 1900g, Chest, Ice Cave 1F

// $3DAB:80 - 480g, Chest, tunnel near Arcbolt B1
// $3DAB:40 - Mimic, Greed Town Mine B2
// $3DAB:20 - Strength Seed, Chest, Greed Town Mine B1
// $3DAB:10 - Half Plate, Chest, Baptismal Cave B3
// $3DAB:08 - Small Medal, Chest, Baptismal Cave B3
// $3DAB:04 - Man-eater Chest, Chest, Baptismal Cave B3
// $3DAB:02 - Small Medal, Chest, Baptismal Cave B2
// $3DAB:01 - Chain Cross, Chest, Baptismal Cave B1

// $3DAC:80 - Defense Seed, Chest, Bonus Dungeon B2
// $3DAC:40 - Strength Seed, Chest, Bonus Dungeon B2
// $3DAC:20 - Small Medal, Chest, Bonus Dungeon B1
// $3DAC:10 - Medical Herb, Chest, cave below lake
// $3DAC:08 - Small Medal, Chest, cave near Calcado
// $3DAC:04 - Morning Star, Chest, mountain north of Monstoru 2F
// $3DAC:02 - Battle Axe, Chest, tunnel near Arcbolt B2
// $3DAC:01 - Defense Seed, Chest, tunnel near Arcbolt B1

// $3DAD:80 - Echoing Hat, Dresser, Tania's House, Deathcod
// $3DAD:40 - Small Medal, Pot, Tania's House, Deathcod
// $3DAD:20 - 4g, Barrel, Tavern, Deathcod
// $3DAD:10 - Small Medal, Pot, Item Shop, Deathcod
// $3DAD:08 - Angel's Leotard, Chest, Bonus Dungeon
// $3DAD:04 - Mimic, Chest, Bonus Dungeon Lava floor
// $3DAD:02 - Shield of Strength, Chest, Bonus Dungeon Lava floor
// $3DAD:01 - Mystic Armor, Chest, Bonus Dungeon B4

// $3DAE:80 - 200g, Chest, Mirror Tower 1F
// $3DAE:40 - Small Medal, Dresser, Tower of Trials 7F
// $3DAE:20 - Medical Herb, Chest, Tower of Trials 7F
// $3DAE:10 - 130h, Chest, Tower of Trials 3F
// $3DAE:08 - Wing of the Wyvern, Chest, Tower of Trials 2F
// $3DAE:04 - Broken Heart, Tower of Trials 9F
// $3DAE:02 - Small Medal, Skeleton, Bonus Dungeon
// $3DAE:01 - Ruby of Power, Gravestone, Bonus Dungeon

// $3DAF:80 - Leaf of the World Tree, Chest, Pegasus Tower 2F
// $3DAF:40 - Small Medal, Chest, Pegaus Tower 1F
// $3DAF:20 - Magic Potion, Pot, Miralgo's Tower 5F
// $3DAF:10 - 1300g, Chest, Miralgo's Tower 2F
// $3DAF:08 - Small Medal, Chest, Miralgo's Tower 2F
// $3DAF:04 - Half Plate, Chest, Mirror Tower B1
// $3DAF:02 - Agility Seed, Chest, Mirror Tower 3F
// $3DAF:01 - Strength Seed, Chest, Mirror Tower 3F

// $3DB0:80 - Pott, Pot, Pegasus Tower 1F
// $3DB0:40 - Strength Seed, Pot, Pegasus Tower 1F
// $3DB0:20 - Fire Claw, Pegasus Tower 3F
// $3DB0:10 - Mimic, Pegasus Tower 3F
// $3DB0:08 - Small Medal, Chest, Pegasus Tower 2F
// $3DB0:04 - Nut of Life, Chest, Pegasus Tower 2F
// $3DB0:02 - Dragon Killer, Chest, Pegasus Tower 2F
// $3DB0:01 - Strength Seed, Chest, Pegaust Tower 3F

// $3DB1:80 - Slime Clothes, Dresser, Slime Arena
// $3DB1:40 - Small Medal, Dresser, Slime Arena
// $3DB1:20 - Slime Armor, Chest, Well, Player's Quarters, Slime Arena
// $3DB1:10 - Small Medal, Barrel, Inn south of Mt. Snow
// $3DB1:08 - Star Fragment, Closet, Granmaz's House
// $3DB1:04 - Nut of Magic, Pot, Granmaz's House
// $3DB1:02 - Wooden Hat, Dresser, Dwarf's house
// $3DB1:01 - Antidote Herb, Pot, Dwarf's house

// $3DB2:80 - Small Medal, skeleton, Herbal Spring Cave
// $3DB2:40 - Wing of the Wyvern, Dresser, Herbal Spring
// $3DB2:20 - Piece of Cloth, Dresser, Herbal Spring
// $3DB2:10 - Fairy Water, Pot, Frontier Church
// $3DB2:08 - Beauty Plant, Dresser, Frontier Church
// $3DB2:04 - Small Medal, empty graveyard north of Longadeseo
// $3DB2:02 - Small Medal, Pot, NE house, Player's Quarters, Slime Arena
// $3DB2:01 - Small Medal, Pot, NE house, Player's Quarters, Slime Arena

// $3DB3:80 - Beauty Plant, Dresser, well south of Prison Town
// $3DB3:40 - Small Medal, Dresser, house south of Lifecod
// $3DB3:20 - Small Medal, Pot, Guardpost north of Holcotta
// $3DB3:08 - Small Medal, Barrel, Floating Island
// $3DB3:04 - Magic Potion, Chest, Floating Island
// $3DB3:02 - Demon Armor, Chest, Floating Island
// $3DB3:01 - Small Medal, Chest, Floating Island

// $3DB4:80 - Fairy Water, Pot, Northern Lands House
// $3DB4:40 - Small Medal, Dresser, Northern Lands farm
// $3DB4:20 - 7g, Pot, Northern Lands farm
// $3DB4:10 - Medical Herb, Closet, Northern Lands Inn
// $3DB4:08 - Small Medal, Dresser, dressing room, House of Calvin Jean-Porte
// $3DB4:04 - Headband, Dresser, dressing room, House of Calvin Jean-Porte
// $3DB4:02 - Beauty Plant, Dresser, dressing room, House of Calvin Jean-Porte
// $3DB4:01 - Slime Earrings, Dresser, dressing room, House of Calvin Jean-Porte

// $3DB5:80 - Medical Herb, Gravestone, Cave east of Clear Vale
// $3DB5:40 - Defense Seed, Dresser, Church southeast of Fortune-telling hut
// $3DB5:20 - Small Medal, Dresser, Church southeast of Fortune-telling hut
// $3DB5:10 - Small Medal, Pot, Remote Cabin
// $3DB5:08 - Small Medal, Barrel, Small Temple south of Slime Arena
// $3DB5:04 - Magma Staff, Chest, Small Temple south of Slime Arena
// $3DB5:02 - Full Moon Herb, Dresser, Lonely Church
// $3DB5:01 - Gold Ring, Closet, Northern Lands House

// $3DB6:80 - GiveLife Armband, Chest, Poseidon's Castle
// $3DB6:40 - Poison Dagger, Pot, underwater shrine south of Holstock
// $3DB6:20 - Small Medal, Barrel, Sunken Ship
// $3DB6:10 - Agility Seed, Barrel, Sunken Ship
// $3DB6:08 - Thick Armor, Dresser, Sunken Ship B2
// $3DB6:04 - Glass Shoes, Chest, Sunken Ship B2
// $3DB6:02 - Small Medal, Barrel, House south of Dhama
// $3DB6:01 - Small Medal, Gravestone, Cave east of Clear Vale

// $3DB7:80 - Small Medal, Chest, Underwater Castle
// $3DB7:40 - Nut of Magic, base of tree, underwater shrine north of Clear Vale
// $3DB7:20 - Small Medal, base of tree, underwater shrine northwest of sunken ship
// $3DB7:10 - Small Medal, floor, NE of inn, underwater Inn north of Style Shop
// $3DB7:08 - Small Medal, dresser, princess's room, Posiedon's Castle
// $3DB7:04 - Staff of Echoing, Chest, Poseidon's Castle
// $3DB7:02 - Silver Tray, Chest, Poseidon's Castle
// $3DB7:01 - Small Medal, Chest, Poseidon's Castle

// $3DB8:80 - Small Medal, Dresser, Well southwest of Tower of Trials
// $3DB8:40 - Small Medal, Chest, Well south of Dhama
// $3DB8:20 - 3700g, Chest, Well south of Dhama
// $3DB8:10 - Small Medal, Dresser, Well north of Foan
// $3DB8:08 - Small Medal, Floor, NE of item shop, well east of San Marino
// $3DB8:01 - Small Medal, Chest, Underwater Castle
// $3DB8:02 - Gringham Whip, Chest, Underwater Castle
// $3DB8:01 - Aeolus's Shield, Chest, Underwater Castle

// $3DB9:80 - Approach Mountain Pass before talking to Elder, Lifecod Mountain Pass
// $3DB9:40 - Enter main part of Holstock Castle
// $3DB9:20 - Enter Calcado
// $3DB9:10 - Use Sand Container, Calberona
// $3DB9:08 - Enter Clear Vale (real)
// $3DB9:04 - Find Meteorite Armband, Amoru
// $3DB9:02 - Amoru water runs red, Amoru
// $3DB9:01 - Leave, Lifecod

// $3DBA:80 - SW button, Mudo's Castle 1F
// $3DBA:40 - NE button, Mudo's Castle 1F
// $3DBA:20 - NW button, Mudo's Castle 1F
// $3DBA:04 - Enter mountain north of Monstoru [goes to 0 when trying to uproot plant]
// $3DBA:02 - Talk to fish merchant, Pescani

// $3DBB:80 - Book of Dragons, Deathtamoor's Castle 4F
// $3DBB:40 - Open door, Mirror Tower 1F
// $3DBB:20 - Defeat Poison Zombies, Mirror Tower 1F (reset by pulling lever west tower)
// $3DBB:10 - Pull lever, east tower, Mirror Tower 6F
// $3DBB:08 - Eastern button, Mudo's Castle B2
// $3DBB:04 - Western button, Mudo's Castle B2
// $3DBB:02 - center button, Mudo's Castle 1F
// $3DBB:01 - SE button, Mudo's Castle 1F

// $3DBC:01 - Fish merchant leaves store, Pescani

// $3E08:01 - Open middle door, Tower of Trials 6F

// $3E12:03 - Collect Platinum Sword (30 medals), Medal King's Castle
// $3E12:02 - Collect Ruby of Power (25 medals), Medal King's Castle
// $3E12:01 - Collect Staff of Punishment (15 medals), Medal King's Castle

// $3E18:01 - Muriel summons the dragon, Intro [temporary]
// $3E28:02 - Return to dream world, Well of Dreams
// $3E28:01 - Return to Reidock after defeating real Mudo
// $3E29:01 - Enter Mudo's room, Intro [temporary]
// $3E2A:02 - Talk to armorshop owner, Lifecod [temporary]temporary

// $3E2B:02 - See Rob with the Mermaid
// $3E2B:01 - Witness Rob push the button

// $3E43:10 - Enter mountain north of Monstoru 
// $3E44:04 - Fall into Giant Hole, Giant Hole (Torukka)

// $3E45:40 - Enter Northern Lands Inn
// $3E45:20 - Enter the cave near Calcado
// $3E45:10 - Enter mountain north of Monstoru 

// $3E47:50 - Enter Northern Lands Inn

// $3E4D:20 - Fall into Giant Hole, Giant Hole (Dhama)

// $3E4F:40 - Enter shrine north of Longadeseo

// $3E53:08 - Return to Granmaz's with the Dream-Seeing Drops

// $3E55:01 - Enter Holstock Castle

// $3E57:01 - Enter house SW of Holstock Castle

// $3E59:02 - Enter baptismal cave

// $3E60:80 - Enter Clear Vale (dream)
// $3E60:40 - Enter Medal King's Castle
// $3E60:20 - Enter Calcado
// $3E60:08 - Enter Island Cave
// $3E60:04 - Enter Reidock
// $3E60:02 - Enter Shiena
// $3E60:01 - Wake up in Lifecod, Intro

// $3E61:80 - Enter San Marino
// $3E61:40 - Enter Ruins of Dhama
// $3E61:10 - Enter Cloud Castle

// $3E62:80 - Enter Arcbolt
// $3E62:40 - Enter Monstoru
// $3E62:01 - Enter Gent

// $3E63:80 - Enter Longadeseo
// $3E63:02 - Enter Clear Vale (real)
// $3E63:01 - Enter Holstock Castle

// $3E80 - slime arean wins

// Slime Arena (as slime): Grab a Slime Armor from a chest in the well, as well as 2 Small Medals from the pots in Champs house. 