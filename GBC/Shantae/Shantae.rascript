// Shantae
// #ID = 728
// MD5: 028c4262dbb49f4fc462a6eb3e514d72

// $C011: dancing values start here
// $C28B: 3e = Risky Boots text
//        2c = When battle starts
//        48 = Beat Boss
//        
//        12, 46, 52, (1a) = Before
// $C328: Risky fix
// $CA7E: m
// $CA8A: Warp Squids

// Ticket 13240: Doesn't work, no achievement after boss battle prior to Scuttle Town.
//               MD5: Unknown
//               Emulator: RetroArch ()
// Ticket 12192: i have beat the boss twice on a second save file to get this to trigger (Because both of my first save
//               slots were made on emulators that dont support cheevos) and it has not triggered, both times i went to
//               the point where it gives the arrive at scuttle town cheevo
//               MD5: 028c4262dbb49f4fc462a6eb3e514d72
//               Emulator: RetroArch (Gamebatte)
// Ticket 11617: Does not unlock after the first boss.
//               MD5: 028c4262dbb49f4fc462a6eb3e514d72
// Ticket 9015: I didn't get this achievement until I was collecitng my second warp squid in my second dungeon.
//               MD5: 028c4262dbb49f4fc462a6eb3e514d72
// Ticket 8555: 
//               MD5: 028c4262dbb49f4fc462a6eb3e514d72
// Ticket 4753: It triggered randomly as I was playing the game.
//               Several days passed before I play the game again and the achievement trigger.
// Ticket 2586: As many have noted, this achievement doesn't pop consistently after the first boss fight; however, for
//               some reason it did trigger when I paused the game during the second boss fight. I would reset the
//               achievement and experiment more, but I'd hate to lose a notoriously touchy achievement.
achievement(
    title = "Risky Business", description = "First Boss Encounter.", points = 5,
    id = 15554, badge = "15165", published = "10/16/2014 12:35:17 AM", modified = "10/16/2014 5:53:18 AM",
//  trigger_before = byte(0x00C2B3) == 44 // no idea what this was trying to do...
    trigger = byte(0xC28B) == 0x3E && // risky's dialog
              never(word(0xCB74) != 0x1A40) && // first boss area
              once(dword(0xC049) == 0x040404)  // second phase begins
)

// Ticket 13231: Triggers upon starting the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
// Ticket 2571: these cheevos triggered before i enter in the first dungeon of the game
achievement(
    title = "Claw", description = "Collect the optional Monkey weapon.", points = 10,
    id = 15573, badge = "15222", published = "10/16/2014 5:41:08 AM", modified = "10/21/2014 7:38:22 AM",
    trigger = bit4(0x00CB39) == 1 && byte(0x00CA8A) < 26 && byte(0x00CA7D) != 244
)

// Ticket 13232: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
// Ticket 2572: these cheevos triggered before i enter in the first dungeon of the game
achievement(
    title = "Tote", description = "Collect the optional Elephant weapon.", points = 10,
    id = 15574, badge = "15223", published = "10/16/2014 5:41:09 AM", modified = "10/21/2014 7:38:25 AM",
    trigger = bit5(0x00CB39) == 1 && byte(0x00CA8A) < 26 && byte(0x00CA7D) != 244
)

// Ticket 13233: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Venom", description = "Collect the optional Spider weapon.", points = 10,
    id = 15575, badge = "15224", published = "10/16/2014 5:41:11 AM", modified = "10/21/2014 7:38:26 AM",
    trigger = bit6(0x00CB39) == 1 && byte(0x00CA8A) < 26 && byte(0x00CA7D) != 244
)

// Ticket 13234: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Talon", description = "Collect the optional Harpy weapon.", points = 10,
    id = 15576, badge = "15225", published = "10/16/2014 5:41:12 AM", modified = "12/27/2016 5:24:09 PM",
    trigger = bit7(0x00CB39) == 1 && byte(0x00CA8A) < 26 && byte(0x00CA7D) != 244
)

// Ticket 13235: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Gem Sacrifice", description = "Give 12 Fireflies for the Heart Dance.", points = 5,
    id = 15561, badge = "15194", published = "10/16/2014 3:50:49 AM", modified = "8/27/2015 11:28:59 AM",
    trigger = bit4(0x00CB3A) == 1 && byte(0x00CA8A) < 26 && byte(0x00CA7D) != 244
)

// Ticket 13236: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Dribble Stone", description = "Defeat the Boss of Dribble Fountain.", points = 20,
    id = 15568, badge = "15215", published = "10/16/2014 5:20:08 AM", modified = "10/21/2014 7:38:41 AM",
    trigger = byte(0x00CA8A) < 26 && bit4(0x00CB38) == 1 && byte(0x00CA7D) != 244
)

// Ticket 13237: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Golem Stone", description = "Defeat the Boss of Golem Mine.", points = 20,
    id = 15569, badge = "15216", published = "10/16/2014 5:20:10 AM", modified = "10/21/2014 7:38:43 AM",
    trigger = byte(0x00CA8A) < 26 && bit5(0x00CB38) == 1 && byte(0x00CA7D) != 244
)

// Ticket 13238: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Simmer Stone", description = "Defeat the Boss of Cackle Mound.", points = 20,
    id = 15570, badge = "15217", published = "10/16/2014 5:20:12 AM", modified = "10/21/2014 7:38:45 AM",
    trigger = byte(0x00CA8A) < 26 && bit6(0x00CB38) == 1 && byte(0x00CA7D) != 244
)

// Ticket 13239: Triggers at start of the game.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Twinkle Stone", description = "Defeat the Boss of Twinkle Palace.", points = 20,
    id = 15571, badge = "15219", published = "10/16/2014 5:20:13 AM", modified = "10/21/2014 7:38:47 AM",
    trigger = byte(0x00CA8A) < 26 && bit7(0x00CB38) == 1 && byte(0x00CA7D) != 244
)

locations = {
    0x000000: "Titles",
    0x001C65: "Titles",
    0x000740: "Prologue",
    0x010740: "Prologue", // meet Risky
    0x041D40: "Prologue", // level
    0x041A40: "Prologue", // Risky's Boat
    0x011F58: "Scuttle Town", // Mimic's Dock
    0x01186E: "Scuttle Town", // Bath House
    0x011F4E: "Scuttle Town", // Save Room
    0x011F40: "Scuttle Town", // Item Shop
    0x001840: "Scuttle Town", // Town Gates
    0x011242: "Scuttle Town", // Dance Parlor
    0x021F69: "Scuttle Town", // Warp Squid Hut
    0x00185C: "Scuttle Town", // Town Center
    0x000B40: "Scarecrow Field",
    0x021941: "Spider Forest",
    0x000C54: "Dribble Fountain",
    0x032140: "Waterfall",
    0x011159: "Cave",
    0x001846: "Water Town", // Town Gates
    0x031860: "Water Town", // Town Center
    0x031F69: "Water Town", // Warp Squid Hut
    0x031F74: "Water Town", // Bolo's Gazebo
    0x031F40: "Water Town", // Item Shop
    0x032459: "Water Town", // Firefly shrine
    0x03186E: "Water Town", // Bath House
    0x031F4E: "Water Town", // Save Room
    0x040940: "Dribble Fountain Labyrinth",
    0x000940: "Dribble Fountain Labyrinth",
    0x1B40: "Dribble Fountain Labyrinth", // boss fight [TODO: what is C9ED for this?]
    0x012344: "Naga Wasteland",
    0x051541: "Ladies Desert",
    0x00184B: "Oasis Town", // Town Gates
    0x041863: "Oasis Town", // Town Center
    0x051F69: "Oasis Town", // Warp Squid Hut
    0x051F40: "Oasis Town", // Item Shop
    0x041863: "Oasis Town", // Sky's Hatchery
    0x052440: "Oasis Town", // Gecko Chamber
    0x05186E: "Oasis Town", // Bath House
    0x051F4E: "Oasis Town", // Save Room
    0x011541: "Mens Desert",
    0x001E40: "Golem Mine Labyrinth",
    0x012540: "Golem Mine Labyrinth", // boss fight
    0x091941: "Spider Forest", // secret passage
    0x031159: "Cave",
    0x0A1941: "Spider Forest",
    0x002157: "Rain Storm River",
    0x052344: "Snail Wasteland",
    0x010B63: "Zombie Swamp",
    0x0B1941: "Ghost Forest",
    0x001851: "Zombie Caravan", // Town Gates
    0x051867: "Zombie Caravan", // Town Center
    0x071F69: "Zombie Caravan", // Warp Squid Wagon
    0x071F40: "Zombie Caravan", // Item Shop
    0x071F4E: "Zombie Caravan", // Save Cart
    0x07186E: "Zombie Caravan", // Bathing Wagon
    0x070772: "Zombie Caravan", // RottyTops Wagon
    0x042040: "Zombie Caravan", // RottyTops Race
    0x002240: "Cackle Mound Labyrinth",
    0x012560: "Cackle Mound Labyrinth", // boss fight
    0x062140: "Waterfall", // secret
    0x002161: "Mud Bog",
    0x092344: "Eagle Wasteland",
    0x001857: "Bandit Town", // Town Gates
    0x06186B: "Bandit Town", // Town Center
    0x090A66: "Bandit Town", // Rusty Gullet
    0x09246A: "Bandit Town", // Advanced Genies
    0x091F4E: "Bandit Town", // Save Room
    0x091F69: "Bandit Town", // Warp Squid Hut
    0x091F40: "Bandit Town", // Item Shop
    0x09186E: "Bandit Town", // Bath House
    0x011140: "Mounty Point",
    0x002640: "Twinkle Palace Labyrinth",
    0x141941: "Archer Forest",
    0x001640: "Tinkerbat Factory",
    0x011640: "Tinkerbat Factory", // risky dialog
    0x011B65: "Tinkerbat Factory", // tinkertank
    0x021740: "Tinkerbat Factory", // risky battle
    0x001773: "Tinkerbat Factory", // harpy escape
    0x08157A: "Epilogue", // volcano
    0x00157A: "Epilogue", // genie realm
    0x011C6A: "Epilogue", // Mimic's dock
    0x021C72: "Epilogue", // shantae's house
    0x001C72: "Epilogue", // credits
}

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Location", word(0xCB74) + byte(0xC9ED) * 65536, locations),
    rich_presence_value("Lives", byte(0xCA7F))
)

