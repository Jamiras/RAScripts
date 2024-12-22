// Gauntlet Legends
// #ID = 10268

// $045CA4: Actual Difficulty [8-bit]
//          0x00: Normal
//          0x01: Advanced
//          0x02: Expert
function difficulty() => byte(0x045CA4)
difficulties = {
    0: "",
    1: " (Advanced)",
    2: " (Expert)",
}

// $04EFC0: Last Entered Level ID [8-bit]
// $04EFC1: Last Entered Zone ID [8-bit]
function level_zone_id() => word(0x04EFC0)
levels = {
    0x0201: "Mountain Valley (I)",
    0x0202: "Mountain Peak (II)",
    0x0203: "Mountain Cliff (III)",
    0x1304: "Mountain Treasure Room",
    0x0204: "Mountain Cave (IV)",
    0x0205: "Mountain Cavern (V)",
    0x0206: "Mountain Dragon (VI)",
    0x0101: "Castle Courtyard (I)",
    0x0106: "Castle Dungeon (II)",
    0x0103: "Castle Armory (III)",
    0x0104: "Castle Treasury (IV)",
    0x1303: "Castle Treasure Room",
    0x0105: "Castle Chimera (V)",
    0x0701: "Town Fields (I)",
    0x1302: "Town Treasure Room",
    0x0702: "Town Cemetary (II)",
    0x0703: "Town Spire (III)",
    0x0704: "Town Air Ship (IV)",
    0x0705: "Town Plague (V)",
    0x0901: "Ice Fields (I)",
    0x0902: "Ice Camp (II)",
    0x1306: "Ice Treasure Room",
    0x0903: "Ice Mine (III)",
    0x0904: "Ice Fissure (IV)",
    0x0905: "Ice Yeti (V)",
    //0x0000: "Desecrated Temple",
    0x0f02: "The Altar of Skorne",
    0x1101: "Battle Trenches (I)",
    0x1305: "Battle Treasure Room",
    0x1102: "Battle Towers (II)",
    0x1103: "Battle Fortress (III)",
    0x0801: "Gates of the Underworld",
    0x0802: "Throne of Skorne"
}


// $0FD30F: P1 Class
//          0-warrior
//          1-Valkyrie
//          2-Wizard
//          3-Archer
//          5-Minotaur
//          6-Falconess
//          7-Jackal
//          9-Sumner
function p1_class() => byte(0x0FD30F)
classes = {
    0x00: "Warrior",
    0x01: "Valkyrie",
    0x02: "Wizard",
    0x03: "Archer",
    0x05: "Minotaur",
    0x06: "Falconess",
    0x07: "Jackal",
    0x08: "Tigress",
    0x09: "Sumner",
}

// $0FD31B: Players Current Character Level
function p1_level() => byte(0x0FD31B)

rich_presence_conditional_display(p1_level() == 0, "Titles")

rich_presence_display("Lv{0} {1} in {2}{3}",
    rich_presence_value("Level", p1_level()),
    rich_presence_lookup("Class", p1_class(), classes),
    rich_presence_lookup("Zone", level_zone_id(), levels, fallback="between levels"),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)
