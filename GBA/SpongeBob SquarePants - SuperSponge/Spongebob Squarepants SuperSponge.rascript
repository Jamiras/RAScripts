// Spongebob Squarepants: SuperSponge
// #ID = 5501

// $000F30: Levels
function level() => byte(0x000F30)

// $000F32: Spatules
function spatulas() => byte(0x000F32)

// $000F33: Lifes
function lives() => byte(0x000F33)

// $0012E4: Spongebob Faces
function faces() => byte(0x0012E4)

// $0012F4: Sub Weapons
function subweapon() => byte(0x0012F4)

// $001470: Jellyfish Shooter Weapon
function jellyfish_weapon() => byte(0x001470)

// $003C38: Boss 3 Hits
function boss_3_hits() => byte(0x003C38)

achievement(
    title = "Sponge faces", description = "Wait for Spongebob show all your faces", points = 2,
    id = 50199, badge = "51031", published = "6/30/2017 5:46:56 PM", modified = "7/3/2017 10:18:12 PM",
    trigger = once(faces() == 62) && once(faces() == 69) && once(faces() == 61) && 
              once(faces() == 77) && once(faces() == 70) && once(faces() == 71) && once(faces() == 65) && 
              level() >= 0
)

achievement(
    title = "Reef Blower", description = "Grab the Vacuum Weapon", points = 2,
    id = 50248, badge = "51123", published = "7/1/2017 3:10:34 PM", modified = "7/3/2017 10:18:19 PM",
    trigger = subweapon() == 4
)

achievement(
    title = "Glove Ballon ", description = "Grab the Glove Ballon", points = 2,
    id = 50249, badge = "51135", published = "7/1/2017 4:43:21 PM", modified = "7/3/2017 10:18:24 PM",
    trigger = subweapon() == 3
)

achievement(
    title = "Soap bubble", description = "Get the soap bubble weapon", points = 2,
    id = 50257, badge = "51226", published = "7/3/2017 4:30:51 AM", modified = "7/3/2017 10:18:27 PM",
    trigger = subweapon() == 5
)

achievement(
    title = "Jellyfish Shooter", description = "Grab the Jellyfish Shooter", points = 2,
    id = 50258, badge = "51227", published = "7/3/2017 4:37:58 AM", modified = "7/3/2017 10:18:30 PM",
    trigger = jellyfish_weapon() == 6
)

achievement(
    title = "Collection of Spatules", description = "Catch a total of 500 spatules in the game (allow to travel into levels)", points = 10,
    id = 50259, badge = "51238", published = "7/3/2017 5:51:23 PM", modified = "7/3/2017 10:18:34 PM",
    trigger = repeated(500, spatulas() > prev(spatulas()))
)

achievement(
    title = "King Jellyfish", description = "Complete Area 1", points = 5,
    id = 50260, badge = "51228", published = "7/3/2017 5:56:53 PM", modified = "7/3/2017 10:18:38 PM",
    trigger = once(byte(0x000F3F) == 4) && never(byte(0x006EDE) == 4) && once(byte(0x000F0E) == 20) && 
              repeated(12, byte(0x002561) < prev(byte(0x002561))) && once(byte(0x000F3F) == 1) && once(byte(0x000F3F) == 2) && once(byte(0x000F3F) == 3)
)

achievement(
    title = "Robot Shark in a Sea", description = "Complete area 2", points = 5,
    id = 50261, badge = "51241", published = "7/3/2017 6:12:44 PM", modified = "7/3/2017 10:18:41 PM",
    trigger = once(byte(0x000F3F) == 5) && never(byte(0x000F0E) == 21) && once(byte(0x000F0E) == 20) && 
              once(byte(0x000F3F) == 6) && once(byte(0x000F3F) == 7) && once(byte(0x000F3F) == 8) && 
              repeated(7, boss_3_hits() > prev(byte(0x000000)))
)

achievement(
    title = "The sea snake", description = "Complete area 3", points = 5,
    id = 50262, badge = "51242", published = "7/3/2017 6:30:05 PM", modified = "7/3/2017 10:18:45 PM",
    trigger = once(byte(0x000F3F) == 9) && never(byte(0x006EDE) == 4) && once(byte(0x000F0E) == 20) && 
              once(byte(0x000F3F) == 10) && once(byte(0x000F3F) == 11) && once(byte(0x000F3F) == 12) && 
              repeated(8, byte(0x002859) < prev(byte(0x002859)))
)

achievement(
    title = "Flying Dutchman", description = "Complete area 4", points = 5,
    id = 50263, badge = "51225", published = "7/3/2017 6:36:13 PM", modified = "7/3/2017 10:18:49 PM",
    trigger = once(byte(0x000F3F) == 13) && never(byte(0x006EDE) == 4) && once(byte(0x000F0E) == 20) && 
              once(byte(0x000F3F) == 14) && once(byte(0x000F3F) == 15) && once(byte(0x000F3F) == 16) && 
              repeated(11, boss_3_hits() > prev(boss_3_hits()))
)

// Ticket 22546: I beat the game two times and i don,t get this achievement
//               MD5: Unknown
//               Emulator: RAVBA
// Ticket 17037: Achievements didn't trigger, possibly because i used passwords?
//               MD5: c2bfa5c822f33eaed02ad2f94a0414b4
achievement(
    title = "The easiest boss", description = "Complete area 5 and finish the game", points = 5,
    id = 50265, badge = "51283", published = "7/3/2017 9:57:03 PM", modified = "7/3/2017 10:18:51 PM",
    trigger = once(byte(0x000F3F) == 17) && never(byte(0x006EDE) == 4) && once(byte(0x000F0E) == 20) && 
              once(byte(0x000F3F) == 18) && once(byte(0x000F3F) == 19) && once(level() == 255) && once(boss_3_hits() == 11)
)

achievement(
    title = "Much underpants", description = "Collect a total of 10 lifes", points = 3,
    id = 50266, badge = "51284", published = "7/3/2017 10:01:02 PM", modified = "7/3/2017 10:18:54 PM",
    trigger = lives() == 10
)

levels = {
    0: "1-1: Jellyfish Fields", // 1-1
    1: "1-2: Sandy's Tree Dome", // 1-2
    2: "1-3: Fish Hooks Park", // 1-3
    3: "1-4: Downtown Bikini Bottom", // 1-4

    4: "2-1: Cavernous Canyons", // 2-1
    5: "2-2: Thermal Tunnels", // 2-2
    6: "2-3: Acrid Air Pockets", // 2-3
    7: "2-4: Lava Fields", // 2-4

    8: "3-1: Precipice Canyon", // 3-1
    9: "3-2: Desert Wasteland", // 3-2
    10: "3-3: Kelpazoic Jungle", // 3-3
    11: "3-4: Inside The Whale", // 3-4

    12: "4-1: Road To Rock Bottom", // 4-1
    13: "4-2: Lonely Souls", // 4-2
    14: "4-3: Graveyard", // 4-3
    15: "4-4: The Last Stop", // 4-4

    16: "5-1: Jelly Fields", // 5-1
    17: "5-2: Man Ray's Lair", // 5-2
    18: "5-3: The Oil Rig", // 5-3
    19: "5-4: The Tuna Canning Factory", // 5-4
    
    255: "Victory"
}

rich_presence_conditional_display(byte(0x6ed0) == 0, "Titles")

rich_presence_display("{0}, {1} Lives",
    rich_presence_lookup("Level", level(), levels),
    rich_presence_value("Lives", lives())
)