// Dragon Quest V
// #ID=2148
// MD5: d8e95e744e66e7ec30d9591f71dafd0a (J) [unpatched]
// MD5: 5651c58a1c87c42f6b91519969658a88 (DeJap) [no header] (matches one found online)
// MD5: 4e0f3fff55fc08063f5dd0c74ae87689 (DeJap) [header]

function current_window() => byte(0x000B04)
window_none = 0
window_menu = 1
window_idle = 2
window_status_hp = 3
window_status_stats = 6
window_status = 11
window_status_attack = 13
window_items = 15
window_status_stats_spells = 41
window_equip_weapon = 62
window_equip_armor = 63
window_equip_shield = 64
window_equip_helmet = 65
window_equip_weapon = 62
window_tactics = 90

// hero is always index 0, other indices vary as the story progresses
function character_sprite(index) => byte(0x2040 + index * 42)
sprite_hero = 0x00
sprite_son = 0x01
sprite_daughter = 0x02
sprite_bianca = 0x03
sprite_bianca_child = 0x04
sprite_sancho = 0x05
sprite_pipin = 0x06
sprite_flora = 0x07
sprite_papas = 0x08
sprite_henry = 0x09
sprite_bella = 0x0A
sprite_baby_panther = 0x80
sprite_killer_panther = 0x81
sprite_slime = 0x82            // $29EC
sprite_drakee = 0x83
sprite_magician = 0x84         // $29EE
sprite_healer = 0x85
sprite_dancing_needle = 0x86
sprite_slime_knight = 0x87     // $29F1
sprite_brownie = 0x88          // $29F2
sprite_bomb_baby = 0x89
sprite_hork = 0x8A             // $29F4
sprite_yeta = 0x8B             // $29F5
sprite_dragon_pup = 0x8C       // $29F6
sprite_kukkle = 0x8D
sprite_big_eye = 0x8E
sprite_metal_battle = 0x8F
sprite_puppet_man = 0x90       // $29FA
sprite_wyvern = 0x91           // $29FB
sprite_bomb_crag = 0x92        // $29FC
sprite_dancing_jewel = 0x93
sprite_curer = 0x94            // $29FE
sprite_king_slime = 0x95
sprite_mad_dragon = 0x96       // $2A00
sprite_minidemon = 0x97        // $2A01
sprite_messala = 0x98          // $2A02
sprite_orc_king = 0x99         // $2A03
sprite_leaonar = 0x9A
sprite_eliminator = 0x9B       // $2A05
sprite_golem = 0x9C            // $2A06
sprite_centaurus = 0x9D        // $2A07
sprite_king_healer = 0x9E      // $2A08
sprite_soldier_bull = 0x9F
sprite_farewell_crag = 0xA0
sprite_eigerhorn = 0xA1        // $2A0B
sprite_blizzard_hawk = 0xA2    // $2A0C
sprite_springer = 0xA3
sprite_great_dragon = 0xA4
sprite_attack_bot = 0xA5
sprite_lionex = 0xA6
sprite_gigantes = 0xA7
sprite_hell_battler = 0xA8
sprite_nereus = 0xA9           // $2A13

function character_status(index) => word(0x2041 + index * 42)
function character_hp(index) => word(0x2042 + index * 42)
function character_mp(index) => word(0x2044 + index * 42)
function character_agi(index) => byte(0x2046 + index * 42)
function character_agi(index) => byte(0x2047 + index * 42)
function character_str(index) => byte(0x2048 + index * 42)
function character_vit(index) => byte(0x2049 + index * 42)
function character_int(index) => byte(0x204A + index * 42)
// xp = 24 bits @ 0x204B + character * 42
function character_max_hp(index) => word(0x204E + index * 42)
function character_max_mp(index) => word(0x2050 + index * 42)
function character_level(index) => byte(0x2052 + index * 42)
function character_battle_status(index) => byte(0x0765 + index * 12)

function current_medals() => byte(0x203F)

function enemy_type(index) => byte(0x07C0 + index * 16)
function enemy_hp(index) => word(0x07C2 + index * 16)
function enemy_status(index) => byte(0x07CA + index * 16)
status_alive = 0x80
status_numb = 0x40
status_poisoned = 0x20
status_envenomed = 0x10
status_cursed = 0x08

function enemy_battle_status(index) => byte(0x07CB + index * 16)
battle_status_asleep = 0x80
battle_status_confused = 0x20
battle_status_mute = 0x10
battle_status_surrounded = 0x08
battle_status_mp_sap = 0x01

function enemy_group_type(index) => byte(0x1001 + index)
function enemy_group_count(index) => byte(0x1005 + index)
function trigger_in_battle() => byte(0x00A0) == 0
function trigger_battle_over() => dword(0x1005) == 0

function trigger_in_game() => byte(0x182F) != 0

function trigger_dialog_window_open() => byte(0x0B06) == 2

function current_location() => byte(0x21C7)
location_any = -1
location_intro = 0x02
location_boat = 0x17
location_vista_harbor = 0x17
location_vista_harbor_2 = 0x27
location_santa_rosa = 0x21
location_alcapa = 0x1A
location_castle_lenoire = 0x04
location_faerie_village = 0x22
location_dwarves_cave = 0x09
location_ice_mansion = 0x08
location_tunnel_to_reinhart = 0x28
location_reinhart = 0x01
location_thieves_cave = 0x07
location_great_temple = 0x03
location_nunnery = 0x29
location_oracleberry = 0x19
location_santa_rosa_secret_cave = 0x0E
location_shrine_south_of_oracleberry = 0x2A
location_southern_tower = 0x33
location_port_selmi = 0x20
location_kabochi = 0x1B
location_western_cave = 0x0B
location_ruraphin = 0x1D
location_rumor_shrine = 0x2C
location_cave_to_salabona = 0x13
location_salabona = 0x1F
location_volcano = 0x0C
location_mountain_village = 0x23
location_waterfall_cave_entrance = 0x12
location_waterfall_cave = 0x53
location_oasis = 0x2E
location_telepador = 0x00
location_medal_kings_castle = 0x26
location_neds_inn = 0x2D
location_mountain_pass = 0x0D
location_chizod = 0x1E
location_mountain_pass_east = 0x0A
location_granvania = 0x02
location_cave_of_trials = 0x10
location_northern_church = 0x24
location_demons_tower = 0x31
location_gigos_house = 0x2B
location_water_shrine = 0x0F
location_el_heven = 0x18
location_shrine_west_of_mountain_village = 0x2F
location_salabona_tower = 0x35
location_emblem_cave = 0x14
location_sky_tower = 0x34
location_cave_to_underwater_castle = 0x51
location_zenithia_castle = 0x06
location_forest_of_illusions = 0x11
location_mysterious_lake = 0x50
location_faerie_palace = 0x05
location_tower_of_boble = 0x32
location_farthest_shrine = 0x25
location_water_shrine_2 = 0x52
location_dark_world_portal = 0x30
location_shahanna = 0x1C
location_evil_mountain = 0x15
location_evil_mountain_2 = 0x54
location_bonus_dungeon = 0x16

locations = {
//    location_boat: "a boat",
    location_santa_rosa: "Santa Rosa",
    location_vista_harbor: "Vista Harbor",
    location_vista_harbor_2: "Vista Harbor",
    location_alcapa: "Alcapa",
    location_castle_lenoire: "Castle Lenoire",
    location_faerie_village: "the Faerie Village",
    location_dwarves_cave: "the Dwarves' Cave",
    location_ice_mansion: "the Ice Mansion",
    location_tunnel_to_reinhart: "the tunnel to Reinhart",
    location_reinhart: "Reinhart",
    location_thieves_cave: "the Ancient Ruins",
    location_great_temple: "the Great Temple",
    location_nunnery: "the Nunnery",
    location_oracleberry: "Oracleberry",
    location_santa_rosa_secret_cave: "Santa Rosa",
    location_shrine_south_of_oracleberry: "the Shrine south of Oracleberry",
    location_southern_tower: "the Southern Tower",
    location_port_selmi: "Port Selmi",
    location_kabochi: "Kabochi",
    location_western_cave: "the Western Cave",
    location_ruraphin: "Ruraphin",
    location_rumor_shrine: "the Shrine of Rumor",
    location_cave_to_salabona: "the Cave to Salabona",
    location_salabona: "Salabona",
    location_volcano: "the Volcano",
    location_mountain_village: "the Mountain Village",
    location_waterfall_cave_entrance: "the Waterfall Cave",
    location_waterfall_cave: "the Waterfall Cave",
    location_oasis: "the Oasis",
    location_telepador: "Telepador",
    location_medal_kings_castle: "the Medal King's Castle",
    location_neds_inn: "Ned's Inn",
    location_mountain_pass: "the Mountain Pass",
    location_chizod: "Chizod",
    location_mountain_pass_east: "the Mountain Pass",
    location_granvania: "Granvania",
    location_cave_of_trials: "the Cave of Trials",
    location_northern_church: "the Northern Church",
    location_demons_tower: "the Demon's Tower",
    location_gigos_house: "Gigo's house",
    location_water_shrine: "the Water Shrine",
    location_el_heven: "El Heven",
    location_shrine_west_of_mountain_village: "the Shrine west of the Mountain Village",
    location_salabona_tower: "Salabona",
    location_emblem_cave: "Emblem Cave",
    location_sky_tower: "Sky Tower",
    location_cave_to_underwater_castle: "the Trolley Cave",
    location_zenithia_castle: "Zenithia Castle",
    location_forest_of_illusions: "the Forest of Illusions",
    location_mysterious_lake: "the Mysterious Lake",
    location_faerie_palace: "the Palace of Fairies",
    location_tower_of_boble: "the Tower of Boble",
    location_farthest_shrine: "Farthest Shrine",
    location_water_shrine_2: "the Water Shrine",
    location_dark_world_portal: "the Dark World Portal",
    location_shahanna: "Shahanna",
    location_evil_mountain: "Evil Mountain",
    location_evil_mountain_2: "Evil Mountain",
    location_bonus_dungeon: "Esturk's Labyrinth",
}

function current_age() => bit2(0x21BA) + bit3(0x21AD) + bit0(0x21E1)
ages = {
    0: "child",
    1: "young man",
    2: "king",
    3: "hero",
}

rich_presence_conditional_display(!trigger_in_game(), "The journey has not yet begun") // menus
rich_presence_conditional_display(bit5(0x2192) == 0, "The journey has just begun")  // before docking in intro

rich_presence_conditional_display(byte(0x00BE) == 0, "A level {0} {1} is exploring the world",
    rich_presence_value("Level", character_level(0)),
    rich_presence_lookup("Age", current_age(), ages)
)

rich_presence_display("A level {0} {1} is exploring {2}",
    rich_presence_value("Level", character_level(0)),
    rich_presence_lookup("Age", current_age(), ages),
    rich_presence_lookup("Location", current_location(), locations)
)

function story_achievement(location, bit, points, title, description)
{
    trigger = trigger_in_game() && bit == 1 && prev(bit) == 0
    if (location != location_any)
        trigger = trigger && current_location() == location
        
    achievement(title = title, points = points, description = description, trigger = trigger)
}

function trigger_win_battle(location, monster_id)
{
    trigger = trigger_in_game() && trigger_in_battle() && trigger_battle_over() && enemy_type(0) == monster_id
    if (location != location_any)
        trigger = trigger && current_location() == location

    return trigger
}

function battle_achievement(location, monster_id, points, title, description)
{
    achievement(title = title, points = points, description = description, trigger = trigger_win_battle(location, monster_id))    
}

function trigger_battle_text(pointer)
{
    trigger = word(0x00F0) == (pointer % 65536) && byte(0x00F2) == (pointer / 65536)
    return trigger_in_battle() && trigger
}

function trigger_dialog_text(pointer)
{
    trigger = word(0x00F0) == (pointer % 65536) && byte(0x00F2) == (pointer / 65536)
    return trigger_dialog_window_open() && trigger
}

function dialog_trigger(location, en_pointer, jp_pointer)
{
    return current_location() == location && (trigger_dialog_text(en_pointer) || trigger_dialog_text(jp_pointer))
}

function dialog_achievement(location, en_pointer, jp_pointer, points, title, description)
{
    achievement(title = title, points = points, description = description,
                trigger = dialog_trigger(location, en_pointer, jp_pointer))        
}

function trigger_married_bianca() => bit3(0x21B3) == 1
function trigger_married_flora() => bit1(0x21B3) == 1

// recruiting cheat: $2054: 00 00 00 0A 91 02 3C 64 FF FF FF FF FF FF
function trigger_not_cheating() => (byte(0x2054) != 0 || dword(0x2056) != 0x02910A00 || word(0x205A) != 0x643C || word(0x205C) != 0xFFFF)

// === New Game =======================

story_achievement(location_santa_rosa, bit7(0x2191), 4, "The Lost Herbologist", "Free the trapped herbologist")

// === 01 - Alcapa ====================

story_achievement(location_castle_lenoire, bit1(0x219D), 3, "The Stalker", "Defeat the Walking Statue in Lenoire Castle") // missable?
story_achievement(location_castle_lenoire, bit6(0x2198), 5, "The Haunted Housekeeper", "Defeat the Boss Ghost in Lenoire Castle")

// read note on wall - it thanks the hero and bianca

// === 02 - Return to Santa Rosa ======

achievement(
    title = "Reward for the Rescue", points = 2,
    description = "Acquire the Handwoven Cape",
    trigger = trigger_in_game() && current_location() == location_santa_rosa &&
              ((bit0(0x2234) == 1 && prev(bit0(0x2234)) == 0) || // child
               (bit6(0x2235) == 1 && prev(bit6(0x2235)) == 0))   // teen or later
)

story_achievement(location_dwarves_cave, bit1(0x2199), 3, "Secret of the Key", "Learn how to unlock wooden doors")
story_achievement(location_ice_mansion, bit4(0x2213), 5, "The Sound of Birds", "Retrieve the Flute of Spring")

// talk to innkeeper in santa rosa, there's a thank you note from Bella

// === 03 - Reinhart ==================

story_achievement(location_thieves_cave, bit4(0x219C), 6, "The Missing Prince", "Rescue Prince Henry")

// === 04 - Slavery ===================

story_achievement(location_great_temple, bit2(0x21BA), 3, "Ten Years Later", "Become a teenager")
dialog_achievement(location_great_temple, 0x338517, 0x08A563, 2,  "What Did You Expect to Find?", 
                   "Examine the pot in the sleeping quarters at the slavery camp.") // [missable]
story_achievement(location_great_temple, bit5(0x21BE), 5, "Flushed", "Escape from the slavery camp") // TODO: trigger before Oracleberry?

// === 05 - Oracleberry ===============

story_achievement(location_oracleberry, bit7(0x201C), 2, "Party Wagon", "Purchase the caravan")

achievement(
    title = "A Father's Legacy", points = 5,
    description = "Collect the sword and the letter from Papas",
    trigger = trigger_in_game() && current_location() == location_santa_rosa_secret_cave && 
              bit3(0x223C) == 1 && bit2(0x223C) == 1 && 
              (prev(bit3(0x223C)) == 0 || prev(bit2(0x223C)) == 0)
)

// === 06 - Return to Alcapa ==========

story_achievement(location_reinhart, bit4(0x21AA), 3, "Key to the Kingdom", "Obtain the Reinhart's Key")
story_achievement(location_reinhart, bit4(0x21BC), 5, "A Tale of Two Empresses", "Defeat the impostor Empress")

// === 07 - Kabochi ===================

story_achievement(location_western_cave, bit7(0x21B2), 4, "Beware of Kitty", "Stop the beast terrorizing Kabochi")

achievement(
    title = "I Don't Want Your Help", points = 10, // The Untrusting
    description = "Reunite with your kitty before recruiting any monsters",
    trigger = trigger_in_game() && current_location() == location_western_cave && 
              bit6(0x21B2) == 1 && prev(bit6(0x21B2)) == 0 && bit7(0x21B1) == 0
)

story_achievement(location_ruraphin, bit1(0x21BE), 3, "I'm Outta Here!", "Demonstrate your skill with the Return spell")

dialog_achievement(location_reinhart, 0x35B208, 0x09D8CA, 3, "A Pretty Little Thing", "Inquire about puff puff") // [missable]

// === 08 - Salabona ==================

story_achievement(location_volcano, bit3(0x21AB), 5, "From the Heart of the Volcano", "Collect the Ring of Flames")
story_achievement(location_waterfall_cave_entrance, bit1(0x223C), 3, "The Second Ring", "Collect the Ring of Water")

story_achievement(location_oracleberry, bit5(0x21B6), 2, "You Are Here", "Purchase the Wayfarer's Map")

dialog_achievement(location_salabona, 0x37A873, 0x0AE299, 2,  "I'm Flattered, But...", "Declare your love for another") // [missable]
story_achievement(location_salabona, bit4(0x21AC), 5, "'Til Death Do Us Part", "Get married")

// === 09 - Telepador ==================

story_achievement(location_alcapa, bit2(0x21B7), 3, "Let's Cuddle", "Have a romantic getaway with Bianca") // [missable]

story_achievement(location_telepador, bit1(0x21D3), 3, "Not the Hero", "Try on the Zenithian Helm") // [missable?]

achievement(
    title = "Special Delivery", points = 3,
    description = "Collect both presents sent by Ludman for marrying Flora",
    trigger = trigger_in_game() && bit7(0x2210) == 1 && bit7(0x2218) == 1 &&
              (prev(bit7(0x2210)) == 0 || prev(bit7(0x2218)) == 0)             
)

story_achievement(location_mountain_pass, bit0(0x21B2), 2, "What's That Sound?", "Spend the night deep under the mountain pass") // [missable?]

achievement(
    title = "The Mimics of Mountain Pass", points = 5,
    description = "Defeat all three mimics, both man-eater chests, and the demon jar in the mountain pass",
    trigger = trigger_in_game() && bit0(0x222E) == 1 && bit3(0x2215) == 1 && bit7(0x2216) == 1 && bit4(0x2216) == 1 && 
              bit3(0x2216) == 1 && bit7(0x2215) == 1 && 
             ((current_location() == location_mountain_pass && prev(bit0(0x222E)) == 0) ||
              (current_location() == location_mountain_pass_east && prev(bit3(0x2215)) == 0) ||
              (current_location() == location_mountain_pass_east && prev(bit7(0x2216)) == 0) ||
              (current_location() == location_mountain_pass_east && prev(bit4(0x2216)) == 0) ||
              (current_location() == location_mountain_pass_east && prev(bit3(0x2216)) == 0) ||
              (current_location() == location_mountain_pass_east && prev(bit7(0x2215)) == 0))
)

// Work your way to point U on this map: http://shrines.rpgclassics.com/snes/dq5/pathfromchizod.shtml
// Then walk east or south into the blackness. The chest contains a Staff of Punishment
story_achievement(location_mountain_pass_east, bit6(0x2216), 5, "Hidden Treasure - Mountain Pass", "Find the hidden treasure in Mountain Pass")

achievement(
    title = "Hidden Treasure - Granvania", points = 5,
    description = "Find the hidden treasure in Granvania",
    trigger = trigger_in_game() && current_location() == location_granvania && bit5(0x2211) == 1 && bit4(0x2211) == 1 && bit3(0x2211) == 1 &&
              (prev(bit5(0x2211)) == 0 || prev(bit4(0x2211)) == 0 || prev(bit3(0x2211)) == 0)    
)

story_achievement(location_granvania, bit3(0x21AD), 5, "A Kingdom of Your Own", "Be crowned king")
story_achievement(location_demons_tower, bit7(0x21C1), 10, "Guardian of the Tower", "Defeat Jahmi")

// === 10 - Eight Years Later =========

story_achievement(location_reinhart, bit4(0x21D2), 4, "Just Like His Father", "Acquire the Hat of Wind")
story_achievement(location_telepador, bit7(0x21D4), 3, "Bloodlines", "Acquire the Zenithian Helm")

achievement(
    title = "After All These Years", points = 2,
    description = "Check in on the woman that you didn't marry", // missable? do Buorn without talking to her?
    trigger = trigger_in_game() &&
             ((current_location() == location_salabona && trigger_married_bianca() && trigger_dialog_text(0x34AB37)) || // english before buorn
              (current_location() == location_salabona && trigger_married_bianca() && trigger_dialog_text(0x098A03)) || // japanese before buorn
              (current_location() == location_salabona && trigger_married_bianca() && trigger_dialog_text(0x38BDBF)) || // english after buorn
              (current_location() == location_salabona && trigger_married_bianca() && trigger_dialog_text(0x0BB958)) || // japanese after buorn
              (current_location() == location_mountain_village && trigger_married_flora() && trigger_dialog_text(0x399B0C)) || // english
              (current_location() == location_mountain_village && trigger_married_flora() && trigger_dialog_text(0x0BED7C)))   // japanese
)

//achievement(
//    title = "Hey Gramps!", points = 2,
//    description = "Introduce Duncan to his grandchildren", 
//    trigger = trigger_in_game() &&
//             (current_location() == location_mountain_village && trigger_married_bianca() && bit4(0x21E2) == 1 && prev(bit4(0x21E2)) == 0)
//)

//story_achievement(location_el_heven, bit5(0x221E), 5, "Red Doors Beware", "Acquire the Magic Key")
story_achievement(location_el_heven, bit4(0x221E), 3, "A Whole New World", "Acquire the Magic Carpet")

// === 12 - Sky Tower ===========

story_achievement(location_zenithia_castle, bit1(0x21AD), 5, "The Sunken City", "Find out why there's a palace under the water")

// === 13 - Faerie Palace =======

story_achievement(location_santa_rosa, bit1(0x21AF), 5, "Sleight of Hand", "Trick a boy out of his teasure")

story_achievement(location_salabona_tower, bit3(0x21C0), 5, "Rude Awakening", "Defeat Buorn") // Joy Cookies?

item_king_metal_shield = 0x84
achievement(
    title = "King Metal Shield", points = 4,
    description = "Purchase the King Metal Shield", // 43 small medals
    trigger = trigger_in_game() && current_location() == location_medal_kings_castle && 
              current_medals() < prev(current_medals()) && byte(0x0F22) == item_king_metal_shield
)

// === 11 - Emblem Cave =========

achievement(
    title = "Monsters, Begone!", points = 4,
    description = "Banish all monsters from the Emblem Cave",
    trigger = trigger_in_game() && current_location() == location_emblem_cave &&
              bit0(0x219F) == 1 && // B1
              bit1(0x219F) == 1 && // B2
              bit2(0x219F) == 1 && // B3
              bit3(0x219F) == 1 && // B4
              (prev(bit0(0x219F)) == 0 || prev(bit1(0x219F)) == 0 || prev(bit2(0x219F)) == 0 || prev(bit3(0x219F)) == 0)
)

story_achievement(location_emblem_cave, bit6(0x223D), 4, "Sealed Away", "Acquire the Royal Cloak")

story_achievement(location_castle_lenoire, bit2(0x21B6), 2, "A Warm Welcome", "Talk to the new inhabitants of the haunted castle")

story_achievement(location_ruraphin, bit0(0x21BD), 4, "Another Ancient Spell", "Learn the Chance spell")

// === 14 - Tower of Boble =======

story_achievement(location_tower_of_boble, bit3(0x21D5), 10, "Avenged", "Avenge your father's death")
story_achievement(location_zenithia_castle, bit4(0x21B5), 4, "The Master Revealed", "Restore Master Dragon to his true form")


// === 15 - Great Temple =======

story_achievement(location_great_temple, bit3(0x223D), 3, "Power Armor", "Acquire the Zenithian Armor")

achievement(
    title = "A Stronger Curse", points = 2,
    description = "Attempt to free your wife as you were freed",
    trigger = byte(0x21C8) == 0x02 && // great temple "stage"
              dialog_trigger(location_great_temple, 0x34E073, 0x09A8C3)
)

// skeleton in room with shield of ruin left a message on the wall - he's Joshua (Maria's brother from earlier that helped you escape slave camp)
achievement(
    title = "The Price of Freedom", points = 2,
    description = "Find out what happened to the guard that helped you escape",
    trigger = byte(0x21C8) == 0x0E && // room with skeleton - prevents triggering when talking to guard just before Ivol
              dialog_trigger(location_great_temple, 0x38C358, 0x0BBC8F)
)

//story_achievement(location_ruraphin, bit7(0x21BE), 4, "Ivol's Book", "Purchase Ivol's Book")

enemy_ivol = 0xE6
item_ivols_book = 0xD3
achievement(
    title = "Can I Have Your Autograph?", points = 4,
    description = "Use Ivol's Book in the battle with Ivol",
    trigger = trigger_in_game() && trigger_in_battle() && enemy_type(0) == enemy_ivol && 
              ((trigger_battle_text(0x3ADDDB) && byte(0x1073) == item_ivols_book) || // en
               (trigger_battle_text(0x3ADDDB) && byte(0x1074) == item_ivols_book) || // en
               (trigger_battle_text(0x3ADDDB) && byte(0x1075) == item_ivols_book) || // en
               (trigger_battle_text(0x078AB8) && byte(0x1073) == item_ivols_book) || // jp
               (trigger_battle_text(0x078AB8) && byte(0x1074) == item_ivols_book) || // jp
               (trigger_battle_text(0x078AB8) && byte(0x1075) == item_ivols_book))   // jp
)

story_achievement(location_great_temple, bit3(0x21BC), 10, "End of the Cult", "Defeat Ivol")

// make sure to rebuild your party at Ruida's, grab the Ring of Life, Ring of Water, Ring of Flames, and Final Key from the depository

item_king_metal_sword = 0x19
function current_casino_coins() => dword(0x203C) // actually only 24-bit, but the last byte won't matter for comparative purposes
achievement(
    title = "King Metal Sword", points = 5,
    description = "Purchase the King Metal Sword", // 50000 casino coins
    trigger = trigger_in_game() && current_location() == location_oracleberry && 
              byte(0x0F19) == 0x0C && // last spoke to the prize vendor
              byte(0x00c1) < 0x0A &&  // near the prize vendor
              current_casino_coins() < prev(current_casino_coins()) && byte(0x0F22) == item_king_metal_sword
)

// === 16 - Demon World =======

achievement(
    title = "Kandar's Henchmen", points = 5,
    description = "Find and defeat all three of Kandar's Henchmen",
    trigger = trigger_in_game() && bit7(0x21E0) == 1 && bit1(0x21D1) == 1 && bit5(0x21E0) == 1 &&
             ((current_location() == location_mountain_village && prev(bit7(0x21E0)) == 0) || // behind Duncan's house, NW Mountain Village
              (current_location() == location_reinhart && prev(bit1(0x21D1)) == 0) ||         // left side of Reinhart castle, outside
              (current_location() == location_shahanna && prev(bit5(0x21E0)) == 0))           // east side of Shahanna
)

story_achievement(location_evil_mountain_2, bit1(0x21E0), 4, "A Mother's Love", "Reunite with your mother")

enemy_king_metal = 0xA2
achievement(
    title = "Quicker than Quicksilver", points = 5,
    description = "Defeat a King Metal",
    trigger = trigger_in_game() && trigger_win_battle(location_any, enemy_king_metal) && 
              (word(0x10FC) >= 30000 || byte(0x010FE) > 0)
)

achievement(
    title = "Sliding Puzzle", points = 3,
    description = "Solve the sliding puzzle",
    trigger = trigger_in_game() && word(0x21C7) == 0x115 && // sliding puzzle room
              dword(0x00C0) == 0x01451E78                   // hero X/Y within room    
)

story_achievement(location_evil_mountain_2, bit0(0x21E1), 10, "Demon Lord No More", "Defeat Mildrath")

function trigger_no_non_monsters_in_party(slot)
{
    // fancy logic - the "never" disables the achievement if the specified party member is not
    // a recruitable monster, but the "unless" prevents the "never" from triggering if the party
    // member is not in the specified slot.
    return (unless(byte(0x2020 + slot) != 0) && never(character_sprite(0) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 1) && never(character_sprite(1) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 2) && never(character_sprite(2) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 3) && never(character_sprite(3) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 4) && never(character_sprite(4) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 5) && never(character_sprite(5) < 0x80)) ||
           (unless(byte(0x2020 + slot) != 6) && never(character_sprite(6) < 0x80))
}

function trigger_non_family_in_slot(slot, index)
{
    // more fancy logic - the "never" disables the achievement if the specified party member is not
    // the hero, son, daughter, or bianca, but the "unless" prevents the "never" from triggering if
    // the party member is not in the specified slot. the second "unless" prevents the never from
    // triggering if the party member is flora, which falls outside the easy to examine range.
    return (unless(byte(0x2020 + slot) != index) && 
            never(character_sprite(index) > 3) && // hero=0,son=1,daughter=2,bianca=3
            unless(character_sprite(index) == sprite_flora))
}

function trigger_no_non_family_in_party(slot)
{
    // index 0 is always the hero, don't have to check it
    return trigger_non_family_in_slot(slot, 1) ||
           trigger_non_family_in_slot(slot, 2) ||
           trigger_non_family_in_slot(slot, 3) ||
           trigger_non_family_in_slot(slot, 4) ||
           trigger_non_family_in_slot(slot, 5) ||
           trigger_non_family_in_slot(slot, 6)
}

enemy_mildrath = 0xE7  // HP      AGI ATK
enemy_mildrath2 = 0xE8 // 9411 FF 4B 4B01   Mildrath actually has four different sets of stats for his second form.
enemy_mildrath3 = 0xE9 // 9411 FF 0F 3B01   I don't know how the game picks which one. It seems to be random.
enemy_mildrath4 = 0xEA // 9411 FF 78 1D00   
enemy_mildrath5 = 0xEB // ????              I haven't ever actually seen this form.
achievement(
    title = "A Family Matter", points = 10,
    description = "Defeat Mildrath using only members of your family",
    trigger = trigger_in_game() && trigger_in_battle() && trigger_battle_over() && current_location() == location_evil_mountain_2 &&
              enemy_type(0) >= enemy_mildrath2 && enemy_type(0) <= enemy_mildrath5 && 
              once(!trigger_in_battle()) &&          // before battle
              unless(dword(0x07C0) == 0x000080E7) && // attempt to prevent resetting 'before battle' flag between forms
              byte(0x001D) > 0 && byte(0x001D) < 16 && // prevent resurrection after battle
              (trigger_no_non_family_in_party(0) || trigger_no_non_family_in_party(1) || trigger_no_non_family_in_party(2) || 
               (byte(0) == byte(0))) // dummy alt to ensure at least one alt is true - actually "1 == 1" in published achievement
)

achievement(
    title = "Heroic Trainer", points = 25,
    description = "Defeat Mildrath using only recruited monsters",
    trigger = trigger_in_game() && trigger_in_battle() && trigger_battle_over() && current_location() == location_evil_mountain_2 &&
              enemy_type(0) >= enemy_mildrath2 && enemy_type(0) <= enemy_mildrath5 && 
              once(!trigger_in_battle()) &&          // before battle
              unless(dword(0x07C0) == 0x000080E7) && // attempt to prevent resetting 'before battle' flag between forms
              byte(0x001D) > 0 && byte(0x001D) < 16 && // prevent resurrection after battle
              (trigger_no_non_monsters_in_party(0) || trigger_no_non_monsters_in_party(1) || trigger_no_non_monsters_in_party(2) ||
               (byte(0) == byte(0))) // dummy alt to ensure at least one alt is true - actually "1 == 1" in published achievement
)


// === 17 - Bonus Dungeon =============
// $2000:80 - indicates bonus dungeon available

enemy_esturk = 0xE5
battle_achievement(location_bonus_dungeon, enemy_esturk, 25, "Until Next Time", "Defeat Esturk")

achievement(
    title = "Underworld Challenge", points = 25, 
    description = "Defeat Esturk in 25 turns or less (no cheating)", 
    trigger = trigger_win_battle(location_bonus_dungeon, enemy_esturk) && byte(0x101A) <= 24 && trigger_not_cheating()
)    

// === Other =============

achievement(
    title = "That's Got To Hurt", points = 5,
    description = "Do at least 500 damage to one enemy with a single attack (no cheating)",
    trigger = trigger_in_game() && trigger_in_battle() &&
              high4(0x10F5) == 0 &&   // party member attacking
              high4(0x10F6) != 0 &&   // attacking non-party member
              byte(0x10F6) != 0x8F && // not really sure what this means, but it's not a valid target and the damage is very high when its true
              word(0x10EC) >= 500 &&  // last damage done
              word(0x10EC) <= 9999 && // last damage done (value is sometimes 0xFFFF)
              trigger_not_cheating()
)

// equipment order is not guaranteed - need to check for all 24 combinations (4x3x2x1)
function trigger_equipped1(index, item1, item2, item3, item4)
{
    equipment1 = item1 + (item2 * 256)
    equipment2 = item3 + (item4 * 256)
    
    if (item4 < 0x80)
        return (low4(0x2054 + index * 42) == 0x0F && dword(0x2056 + index * 42) == (equipment1 + equipment2 * 65536))
    
    return (low4(0x2054 + index * 42) == 0x0F && // four items equipped
            word(0x2056 + index * 42) == equipment1 && word(0x2058 + index* 42) == equipment2)
}

function trigger_equipped2(index, item1, item2, item3, item4)
{
    return trigger_equipped1(index, item1, item2, item3, item4) ||
           trigger_equipped1(index, item1, item2, item4, item3)
}

function trigger_equipped3(index, item1, item2, item3, item4)
{
    return trigger_equipped2(index, item1, item2, item3, item4) ||
           trigger_equipped2(index, item1, item3, item2, item4) ||
           trigger_equipped2(index, item1, item4, item2, item3)
}

function trigger_equipped(index, item1, item2, item3, item4)
{
    return trigger_equipped3(index, item1, item2, item3, item4) ||
           trigger_equipped3(index, item2, item1, item3, item4) ||
           trigger_equipped3(index, item3, item1, item2, item4) ||
           trigger_equipped3(index, item4, item1, item2, item3)
}

// these items can only be equipped by the hero.
item_sun_crown = 0x98
item_dragon_staff = 0x2D
item_royal_cloak = 0x60
item_shield_of_radiance = 0x83
achievement(
    title = "The Sacred Raiment", points = 5,
    description = "Equip the main character with the Sun Crown, Dragon Staff, Royal Cloak, and Shield of Radiance (and no accessories)",
    trigger = trigger_in_game() && 
              trigger_equipped(0, item_sun_crown, item_dragon_staff, item_royal_cloak, item_shield_of_radiance)
)

// order is not guaranteed, and generating all 24 combinations for each of the seven slots the son may be in is too complex

//item_zenithian_helm = 0x95
//item_zenithian_shield = 0x82
//item_zenithian_sword = 0x1B
//item_zenithian_armor = 0x5F
//achievement(
//    title = "The Zenithian Raiment", points = 5,
//    description = "Equip the son with the Zenithian Helm, Sword, Shield, and Armor",
//    trigger = trigger_in_game() && low4(0x2054) == 0x0F && // four items equipped
//              trigger_equipment(item_zenithian_helm, item_zenithian_sword, item_zenithian_shield, item_zenithian_armor)
//)

// === Story Flags ====================

hex = {
    0: "0",
    1: "1",
    2: "2",
    3: "3",
    4: "4",
    5: "5",
    6: "6",
    7: "7",
    8: "8",
    9: "9",
    10: "A",
    11: "B",
    12: "C",
    13: "D",
    14: "E",
    15: "F",
}

function missing_bit(addr, bit)
{
   if (bit == 80)
       trigger = bit7(addr)
   else if (bit == 40)
       trigger = bit6(addr)
   else if (bit == 20)
       trigger = bit5(addr)
   else if (bit == 10)
       trigger = bit4(addr)
   else if (bit == 8)
       trigger = bit3(addr)
   else if (bit == 4)
       trigger = bit2(addr)
   else if (bit == 2)
       trigger = bit1(addr)
   else
       trigger = bit0(addr)
                     
   title =  "DEBUG " + hex[addr / 0x1000] + hex[(addr / 256) % 16] + hex[(addr / 16) % 16] + hex[addr % 16] + "-" 
   if (bit < 10)
       title = title + "0"
   title = title + bit
                     
   achievement(title = title, points = 0,
               description = "DEBUG bit triggered",
               trigger = trigger == 1 && prev(trigger) == 0)
}

function missing_bit(addr, bit) {}

// $2190:80 - return to Master Dragon after defeating Mildrath [resets during credits]
// $2190:40 - end of child phase (child)
// $2190:20 - hero's statue taken (teen)
// $2190:10 - return to Master Dragon after defeating Mildrath
// $2190:08 - end of intro, boat (child)
// $2190:04 - end of boat cinematic, boat (child) [resets to 0]
// $2190:04 - boat arrives at Vista Harbor (teen)
// $2190:02 - begin game, also end game
// $2190:01 - end of child phase (child)

// $2191:80 - talk to injured man after freeing him, Santa Rosa cave (child)
missing_bit(0x2191, 40)
// $2191:20 - wife has given birth announcement, castle (intro)
// $2191:10 - end of intro, boat (child)
missing_bit(0x2191, 08)
// $2191:04 - talk to captain, boat (child)
// $2191:02 - talk to crewman 2, basement 2, boat (child)
// $2191:01 - boat cinematic begins, boat (child)

// $2192:80 - talk to father after docking, boat (child) [resets when getting on boat at Vista harbor]
missing_bit(0x2192, 40)
// $2192:20 - gain control at port, Vista port (child)
// $2192:10 - talk to woman upstairs, Vista port (child)
// $2192:08 - defeat first battle, overworld (child)
missing_bit(0x2192, 04)
missing_bit(0x2192, 02)
// $2192:01 - Bianca leaves you in her room, Santa Rosa (child)

// $2194:80 - Bianca leaves you in her room, Santa Rosa (child)
missing_bit(0x2194, 40)
// $2194:20 - push rock off injured man, Santa Rosa cave (child)
missing_bit(0x2194, 10)
// $2194:08 - spend the night at Sancho's after Castle Lenoire, Santa Rosa (child)
// $2194:04 - talk to queen Powan, Faerie Village (child)
missing_bit(0x2194, 02)
// $2194:01 - follow Prince Henry into his secret tunnel, Reinhart (child)

// $2195:80 - die in Santa Rosa cave, Santa Rosa (child) [changes what guard outside cave says when you talk to him] [resets when sleep]
// $2195:40 - spend night at Sancho's after freeing injured man, Santa Rosa (child)
// $2195:20 - agree to escort Bianca and her mother back to Alcapa, Santa Rosa (child)
// $2195:10 - finish escorting Bianca and her mother [also resets 20 bit], Alcapa (child)
// $2195:08 - Bianca follows hero around Alcapa, Alcapa (child)
// $2195:04 - talk to punks torturing cat, Alcapa (child)
// $2195:02 - spend night in Alcapa, Alcapa (child)
// $2195:01 - Bianca joins the party again, Alcapa (child)

missing_bit(0x2196, 80)
// $2196:40 - Bianca kidnapped by skeletons, Castle Lenoire (child)
// $2196:20 - Bianca kidnapped by skeletons, Castle Lenoire (child)
// $2196:10 - Bianca found, Castle Lenoire (child)
// $2196:08 - talk to ghost, Castle Lenoire (child)
// $2196:04 - talk to ghost, Castle Lenoire (child)
// $2196:02 - talk to ghost in bed, Castle Lenoire (child)
// $2196:01 - see king's ghost, Castle Lenoire (child)

// $2197:80 - see king's ghost, Castle Lenoire (child)
// $2197:40 - see king's ghost, Castle Lenoire (child)
// $2197:20 - agree to help king's ghost, Castle Lenoire (child)
// $2197:10 - arrive in Alcapa with Bianca and her mother, Alcapa (child)
// $2197:08 - leave Santa Rosa for Reinhart (child)
// $2197:04 - talk to king's ghost past the walking statue, Castle Lenoire (child)
// $2197:02 - talk to boss ghost, Castle Lenoire (child)
// $2197:01 - watch boss ghost leave throne room, Castle Lenoire (child)

// $2198:80 - watch boss ghost leave throne room, Castle Lenoire (child)
// $2198:40 - defeat boss ghost, Castle Lenoire (child)
// $2198:20 - Bianca wants to name the kitty, Alcapa (child)
// $2198:10 - name the kitty, Alcapa (child)
missing_bit(0x2198, 08)
missing_bit(0x2198, 04)
// $2198:02 - return to Santa Rosa after retrieving the Flute of Spring (child)
// $2198:01 - show golden orb to man outside church, Santa Rosa (child)

// $2199:80 - talk to ghost at bar in inn, Santa Rosa (child)
// $2199:40 - talk to dwarf you resuced earlier, Santa Rosa (child)
// $2199:20 - talk to ghost in basement, Santa Rosa (child)
// $2199:10 - talk to Powan, Faerie village (child)
// $2199:08 - Bella joins the party (child)
// $2199:04 - learn secret of the flute from dwarf, Dwarves' Cave (child)
// $2199:02 - learn secret of the key, Dwarves' Cave (child)
missing_bit(0x2199, 01)

// $219A:80 - defeat Zaile, Ice Mansion (child)
// $219A:40 - defeat Snow Queen, Ice Mansion (child)
// $219A:20 - get the flute of spring, Ice Mansion (child)
// $219A:10 - return to Santa Rosa after retrieving the Flute of Spring (child)
// $219A:08 - find out Papas went to Reinhart, Santa Rosa (child)
// $219A:04 - talk to Papas at the church, Santa Rosa (child)
// $219A:02 - leave Papas with the King of Reinhart, Reinhart (child)
// $219A:01 - talk to queen of Reinhart about Dale, Reinhart (child)

// $219B:80 - talk to guard on second floor of castle, Reinhart (child)
// $219B:40 - tell Prince Henry that you want to be his royal goon, Reinhart (child)
// $219B:20 - find out what the king wanted with Papas, Reinhart (child)
// $219B:10 - talk to Prince Henry again, Reinhart (child)
// $219B:08 - open empty chest for Prince Henry, Reinhart (child)
// $219B:04 - talk to Papas after Prince Henry escapes, Reinhart (child)
// $219B:02 - Prince Henry is kidnapped, Reinhart (child)
// $2198:01 - bring Papas after Prince Henry's kidnappers, Reinhart (child)

// $219C:80 - approach Papas, Thieves' Cave (child)
// $219C:40 - talk to Papas, Thieves' Cave (child)
// $219C:20 - Papas joins the party, Thieves' Cave (child)
// $219C:10 - rescue Prince Henry, Thieves' Cave (child)
// $219C:08 - Papas leaves the party, Thieves' Cave (child)
// $219C:04 - defeated by Gema, Thieves' Cave (child)
// $219C:02 - Papas fights Jahmi and Gonz, Thieves' Cave (child)
// $219C:01 - Papas fights Jahmi and Gonz again, Thieves' Cave (child)

// $219D:C0 - father leaves you at Sancho's, Santa Rosa (child) [resets to 0 on sleep when father returns]
// $219D:20 - talk to injured man, Santa Rosa cave (child)
// $219D:20 - defeat walking statue, Castle Lenoire (child)
// $219D:10 - follow ghost king outside, Castle Lenoire (child)
// $219D:08 - stay at the inn in Castle Lenoire (child)
// $219D:04 - talk to Zaile after defeating Snow Queen, Ice mansion (child)
// $219D:02 - defeat the walking statue, Castle Lenoire (child)
missing_bit(0x219D, 01)

// $219E:84 - go upstairs (intro) -> 84 (open door)
// $219E:40 - door to wife's room (into) [1=closed]
// $219E:20 - talk to wife (intro)
// $219E:10 - boat cinematic, boat (child)
missing_bit(0x219E, 08)
// $219E:04 - boat cinematic, boat (child)
// $219E:02 - follow Prince Henry into the secret room, Reinhart (child)
// $219E:01 - get woken up by Bianca, Alcapa (child) [resets when she leaves party after Castle Lenoire]

// $219F:XX - temporary flags (resets to 0 frequently) [not temporary??]

// $21A0:80 - talk to Henry, Nunnery (teen)
// $21A0:40 - Henry brings out the nuns, Nunnery (teen)
// $21A0:20 - Sancho escorts hero to Ojiron, Granvania (teen)
// $21A0:10 - conference after wife is kidnapped, Granvania (teen)
// $21A0:08 - talk to Ludman (married Flora), Salabona (epilogue)
// $21A0:04 - talk to Bianca (married Flora), Mountain Village (epilogue)
missing_bit(0x21A0, 02)
// $21A0:08 - talk to lady blocking access to fiancee (teen)

// $21A1-$21A5:XX - temporary flags (resets to 0 frequently)

// $21A6:80 - end of intro, boat (child) [0=after intro]
// $21A6:40 - talk to man at port, Vista port (child)
// $21A6:20 - give the flute of spring to Powan, Faerie Village (child)
// $21A6:20 - boat arrives at Vista harbor (teen)
// $21A6:10 - arrive at Faerie Village (child)
missing_bit(0x21A6, 08)
// $21A6:04 - find torch, Castle Lenoire (child)
// $21A6:02 - spend the night at Sancho's after Castle Lenoire, Santa Rosa (child)
// $21A6:01 - tell Papas about Prince Henry being kidnapped, Reinhart (child)

// $21A7:80 - bring Papas after Prince Henry's kidnappers, Reinhart (child)
// $21A7:40 - talk to Prince Henry after following him, Reinhart (child)
// $21A7:20 - Prince Henry is kidnapped, Reinhart (child)
// $21A7:10 - briefly set to true when returning to Alcapa inn without completing Castle Lenoire (child)
// $21A7:08 - let boss ghost go free, Castle Lenoire (child)
// $21A7:04 - return to Alcapa after completing Castle Lenoire (child)
// $21A7:02 - sleep at Sancho's after completing Castle Lenoire (child)
// $21A7:01 - briefly true when resting at Sancho's house (child)

// $21A8:80 - follow Sancho to throne room, Granvania (teen)
// $21A8:40 - get tasked with the Cave of Trials, Granvania (teen)
// $21A8:20 - return Symbol of Royalty to king, Granvania (teen)
// $21A8:10 - birth announcement, Granvania (teen)
// $21A8:08 - name children, Granvania (teen)
// $21A8:04 - night after ceremony, Granvania (teen)
// $21A8:02 - next day, Granvania (teen)
// $21A8:01 - end of conference, Granvania (teen)

// $21A9:80 - return to Granvania after un-statued (later)
// $21A9:40 - a new day in Reinhart (teen)
// $21A9:20 - go back in time, Palace of Aeries (later) [resets on return]
// $21A9:10 - enter tunnel to Reinhart (teen)
// $21A9:08 - enter Salabona (teen)
missing_bit(0x21A9, 04)
// $21A9:02 - get Mirror of Ra, Southern Tower (teen)
// $21A9:01 - arrive in Ruraphin (teen)

// $21AA:80 - talk to all the Slaves in the morning, Slavery (teen)
// $21AA:40 - defeat the Whip Men, Slavery (teen)
// $21AA:20 - defeat the Whip Men, Slavery (teen)
// $21AA:10 - get Reinhart's Key, Reinhart (teen)
// $21AA:08 - leave nunnery, Nunnery (teen)
// $21AA:04 - defeat bandit wolves, inn, Port Selmi (teen)
// $21AA:02 - accept proposition to visit Kabochi, Port Selmi (teen)
// $21AA:01 - get instructions to RuraHerb from Bennet, Ruraphin (teen)

// $21AB:80 - give RuraMoon herb to magician, Ruraphin (teen)
// $21AB:40 - potion explodes, Ruraphin (teen)
// $21AB:20 - find out how to win Flora's hand in marriage, Salabona (teen)
// $21AB:10 - enter volcano (teen)
// $21AB:08 - collect ring of flame, volcano (teen)
// $21AB:04 - ? (between fire ring and water ring)
// $21AB:02 - give water ring to Ludman, Salabona (teen)
// $21AB:01 - sleep at inn after midnight walk, Salabona (teen)

// $21AC:80 - choose bride, Salabona (teen)
// $21AC:40 - leave Salabona after choosing bride (teen)
// $21AC:20 - pick up Silk Veil, Mountain Village (teen)
// $21AC:10 - get married, Salabona (teen)
// $21AC:08 - spend night with Duncan, Mountain Village (teen)
// $21AC:04 - spend night in Chizod after wife faints, Chizod (teen)
// $21AC:02 - collect Dragon Orb, Tower of Boble (later)
// $21AC:01 - collect Symbol of Royalty, Cave of Trials (teen)

// $21AD:80 - time advances as statue (statue)
// $21AD:40 - time advances as statue (statue)
// $21AD:20 - Gigo is kidnapped (statue)
// $21AD:10 - rescued by daughter (statue)
// $21AD:08 - become king, Granvania (teen)
// $21AD:04 - birth announcement, Granvania (teen)
// $21AD:02 - finish watching Pusan meditate, Zenithia (later)
// $21AD:01 - get Faerie Horn, Faerie Village (later)

// $21AE:80 - talk to Pippin, Granvania (later)
// $21AE:40 - Pippin joins the party
// $21AE:20 - son joins party, Granvania (later)
// $21AE:10 - daughter joins party, Granvania (later)
// $21AE:08 - talk to Sancho, Granvania (later)
// $21AE:04 - Sancho joins the party (later)
// $21AE:02 - return to Granvania after rescuing wife from cult (later)
// $21AE:01 - Flora joins the party (later)

// $21AF:80 - Pippin joins the party, Granvania (later)
// $21AF:40 - convince Tom to let you enter the tunnel to Reinhart (teen)
missing_bit(0x21AF, 20)
// $21AF:10 - read Papas' letter (teen)
missing_bit(0x21AF, 08)
// $21AF:04 - talk to old man, Santa Rosa (teen)
// $21AF:02 - swap glowing orb for golden orb, flashback (later)
// $21AF:01 - talk to Dale, Reinhart (teen)

missing_bit(0x21B0, 80)
missing_bit(0x21B0, 40)
// $21B0:20 - talk to Henry, Slavery (teen)
// $21B0:10 - Maria comes to help, Slavery (teen)
// $21B0:08 - listen to escape plan, Slavery (teen)
// $21B0:04 - Maria joins the party (teen)
// $21B0:02 - Henry joins the party, nunnery (teen)
// $21B0:01 - talk to nun outside Nunnery (teen)

// $21B1:80 - recruit your first capturable monster, outside Oracleberry (teen)
// $21B1:40 - able to recruit (wagon + visit monster gramps) (teen)
missing_bit(0x21B1, 20)
// $21B1:10 - get access to Ludman's boat, Port Selmi (teen)
missing_bit(0x21B1, 08)
// $21B1:04 - talk to dwarf in lighthouse, Port Selmi (teen)
// $21B1:02 - watch man jump into pit, cave west of Kabochi (teen)
// $21B1:01 - talk to man after jumping in pit, cave west of Kabochi (teen)

// $21B2:80 - reunite with kitty, cave west of Kabochi (teen)
// $21B2:40 - kitty joins the party, cave west of Kabochi (teen)
// $21B2:20 - tell boy in Kabochi about kitty, Kabochi (teen)
// $21B2:10 - talk to man at meeting, Kabochi (teen)
// $21B2:08 - collect remaining reward from elder, Kabochi (teen)
// $21B2:04 - talk to man wading in Waterfall Cave (teen)
// $21B2:02 - find out about Gravania from queen Isis, basement, Telepador (teen)
// $21B2:01 - stay with the old lady, Mountain Pass (teen)

// $21B3:80 - spend the night at the Chizod inn (teen)
// $21B3:40 - have to decide who to propose to, Salabona (teen)
// $21B3:20 - talk to magician about spell, Ruraphin (teen)
// $21B3:10 - collect RuraHerb (teen)
// $21B3:08 - choose Bianca, Salabona (teen) **
// $21B3:04 - give veil to bride (Bianca)
// $21B3:02 - choose Flora, Salabona (teen) **
missing_bit(0x21B3, 01)

// $21B4:80 - enter Ludman's mansion, Salabona (teen)
// $21B4:40 - talk to Andy, Salabona (teen)
// $21B4:20 - talk to second suitor, Salabona (teen)
// $21B4:10 - talk to third suitor, Salabona (teen)
missing_bit(0x21B4, 08)
missing_bit(0x21B4, 04)
// $21B4:02 - take boat from Vista Harbor to Port Selmi (teen)
// $21B4:01 - talk to Ludman after marriage, Salabona (teen)

// $21B5:80 - give ring of flames to Ludman, Salabona (teen)
// $21B5:40 - arrive at Faerie Village (later)
// $21B5:20 - get glowing orb from queen, Palace of Faeries (later)
// $21B5:10 - restor Master Dragon, Zenithia (later)
// $21B5:08 - get Zenithian Bells, Zenithia (later)
// $21B5:04 - finish watching Pusan meditate, Zenithia (later)
// $21B5:02 - talk to Henry about his bride, Reinhart (teen)
missing_bit(0x21B5, 01)

// $21B6:80 - dragon opens mouth, Tower of Boble (later)
// $21B6:40 - leave alpaca after completing Castle Lenoire (child) [resets as teen]
// $21B6:20 - buy wayfarer's map, Oracleberry (teen)
// $21B6:10 - boat cinematic begins, boat (child)
// $21B6:08 - see elopers go to balcony, Castle Lenoire (later)
// $21B6:04 - talk to elopers, Castle Lenoire (later)
// $21B6:02 - free prisoner, Oracleberry (later)
// $21B6:01 - watch Pusan meditate, Zenithia (later) [resets when done], watch credits

missing_bit(0x21B7, 80)
missing_bit(0x21B7, 40)
// $21B7:20 - reunite with wife, Great Temple (later)
// $21B7:10 - talk to child, Kabochi (teen)
// $21B7:08 - walk in on meeting, Kabochi (teen)
// $21B7:04 - spend the night with Bianca, Alcapa (teen)
missing_bit(0x21B7, 02)
// $21B7:01 - Bianca wakes hero up to go to castle Lenoire, Alcapa (child)

// $21B8:80 - Bianca offers to help, Mountain Village (teen)
missing_bit(0x21B8, 40)
// $21B8:20 - meet Bianca in Mountain Village (teen) [she mentions kitty, try without?]
// $21B8:10 - enter waterfall cave with Bianca (teen)
// $21B8:08 - Bianca admires the view, Waterfall Cave (teen)
// $21B8:04 - Bianca complains about man, Waterfall Cave (teen)
// $21B8:02 - Bianca admires the view again, Waterfall Cave (teen)
// $21B8:01 - Biance wonders about the underwater chest, Waterfall cave (teen)

// $21B9:80 - Bianca wonders about the elven medicine, Waterfall Cave (teen)
// $21B9:40 - Bianca congradulates the hero, Waterfall Cave (teen)
missing_bit(0x21B9, 20)
missing_bit(0x21B9, 10)
// $21B9:08 - step on left eagle, Cave of Trials (teen)
// $21B9:04 - step on bridge eagle, Cave of Trials (teen)
// $21B9:02 - defeat Kandar, Cave of Trials (teen)
// $21B9:01 - talk to guard, 2F Reinhart castle (child)

// $21BA:80 - pull lever for corridor 1, 9F Demon's Tower (teen)
// $21BA:40 - pull second lever, 3F Demon's Tower (teen)
// $21BA:20 - reveal faerie castle, Mysterious Lake (later)
// $21BA:10 - Ivol turns into ring, Great Temple (later)
// $21BA:08 - message from mother, Great Temple (later)
// $21BA:04 - gain control of hero, Slavery (teen)
// $21BA:02 - open the water gate, near Mountain Village (teen)
// $21BA:01 - use the holy chamberpot, 6F Evil Mountain (later)

// $21BB:80 - captain tells protagonist to fetch father, boat cinematic (child)
// $21BB:40 - talk to all the other slaves, Slavery (teen)
// $21BB:20 - Maria comes to help, Slavery (teen)
// $21BB:10 - defeat guards inside Great Temple (later)
// $21BB:08 - defeat guard in front of armor, Great Temple (later)
// $21BB:04 - defeat Ramada, Great Temple (later)
// $21BB:02 - defeat guard inside cave, Great Temple (later) **
// $21BB:01 - defeat second guard inside cave, Great Temple (later) **

// $21BC:80 - talk to lady in kitchen, Reinhart (teen)
// $21BC:40 - defeat both dragon pups, Reinhart (teen)
missing_bit(0x21BC, 20)
// $21BC:10 - defeat Imposter queen, Reinhart (teen)
// $21BC:08 - defeat Ivol, Great Temple (later)
// $21BC:04 - Ramada's corpse disappears, Great Temple (later)
// $21BC:02 - talk to guard about destroyed village, Reinhart (teen)
// $21BC:01 - Henry remembers the secret passage, Reinhart (teen)

// $21BD:80 - Henry doesn't want anyone to know who he is, Reinhart (teen)
missing_bit(0x21BD, 40)
// $21BD:20 - push switch on column, Cave of Trials (teen)
// $21BD:10 - follow magician upstairs, Ruraphin (teen)
// $21BD:08 - magician goes to sleep, Ruraphin (teen)
// $21BD:04 - follow magician downstairs, Ruraphin (teen)
// $21BD:02 - talk to magician after potion explodes, Ruraphin (teen)
// $21BD:01 - learn Chance, Ruraphin (later)

// $21BE:80 - purchase Ivol's Book, lady having picnic with man, 3000g, Ruraphin (later)
// $21BE:40 - talk to guard outside Henry's room, Reinhart (teen)
// $21BE:20 - awaken, Oracleberry (teen)
// $21BE:10 - Ludman sends you to Mountain Village, Salabona (teen)
// $21BE:08 - step out of cell, Slavery (teen)
// $21BE:04 - stand up after potion explodes, Ruraphin (teen)
// $21BE:02 - cast return, Ruraphin (teen)
missing_bit(0x21BE, 01)

// $21BF:80 - get out of bed, Oracleberry (teen)
// $21BF:80 - a new day in Reinhart (teen)
// $21Bf:40 - Maria joins the party, Nunnery (teen)
// $21BF:20 - magician showing you where the RuraHerb grows, Ruraphin (teen) [resets when map closes]
// $21BF:20 - monster approaches Salabona tower (later) [resets when battle starts]
// $21BF:10 - boat leaves Vista Harbor (teen)
// $21BF:08 - arrive in Port Selmi (teen)
// $21BF:04 - see mother's birthplace on map, Granvania (later) [resets after seeing map]
// $21BF:02 - defeat monster battlers, Evil Mountain (later)
// $21BF:01 - boat arrives in Vista Harbor (teen)

// $21C0:80 - stand up after marriage, Salabona (teen)
// $21C0:40 - defeat Lava Savages, Volcano (teen)
// $21C0:20 - examine the demon jar with Flora, Shrine west of Mountain Village (teen)
// $21C0:10 - tell Ludman results of examining jar with Flora, Salabona (teen)
// $21C0:08 - defeat Buorn, Salabona Tower (later)
// $21C0:04 - talk to chancellor, 10F Demon's Tower (teen)
// $21C0:02 - give veil to bride (bianca) (teen) [resets when enter church]
missing_bit(0x21C0, 01)

// $21C1:80 - defeat Jahmi, 11F Demon's Tower (teen)
// $21C1:40 - turned to stone, 11F Demon's Tower (teen)
// $21C1:20 - listen to Ludman's plea, Salabona (later)
// $21C1:10 - talk to lady on way out of Ludman's, Salabona (later)
// $21C1:08 - talk to Andy, Salabona (later)
// $21C1:04 - leave Ludman's house (after defeating Buorn), Salabona (later)
// $21C1:02 - witness Ludman send guard to watch pot, Salabona (later)
// $21C1:01 - examine jar, shrine west of mountain village (later)

// $21C2-$21C4:XX - door flags

// $21C6:80 - begin second day, Slavery (teen)
// $21C6:40 - open dungeon door, Reinhart (teen)
// $21C6:20 - follow Isis to basement, Telepador (teen) [resets after Isis talks]
missing_bit(0x21C6, 10)
missing_bit(0x21C6, 08)
missing_bit(0x21C6, 04)
missing_bit(0x21C6, 02)
missing_bit(0x21C6, 01)

// $21C7-$21C8 - map code [0206=intro castle, 0207=intro castle upstairs,1700=boat,1702=next room,boat]

// $21CA:01 - ?? (child) [resets to 0 after escape slavery]
// $21CA:01 - enter passage under drawbridge, Reinhart (teen) [resets on arrival in the throne room]
// $21CA:01 - enter Faerie Castle (later) [resets on arrival in the throne room]

// $21CB-$21CC - (-1)

// $21CD-$21F0 - volatile

// $21D1:80 - enter Salabona tower (later)
// $21D1:40 - briefly set when restoring Zenithia (later)
// $21D1:20 - open floodgate in Cave of Trials (teen) [resets after flood stops]
// $21D1:10 - hero hits rock in Cave of Trials (teen) [resets after flood stops]
// $21D1:08 - kids leave with Collins, Reinhart (later) [resets when Collins is returned to parents]
// $21D1:04 - Collins has disappeared, Reinhart (later)
// $21D1:02 - defeat Kandar's Henchman, Reinhart (later)
// $21D1:01 - talk to guard in Edgar's room, Reinhart (later)

missing_bit(0x21D2, 80)
// $21D2:40 - spend night at Chizod after wife collapses (teen)
// $21D2:20 - find Collins, Reinhart (later)
// $21D2:10 - get Hat of the Winds, Reinhart (later)
// $21D2:08 - talk to King Dale, Reinhart (later)
// $21D2:04 - son goes on tour with Henry's son, Reinhart (later) [reset when rejoin]
// $21D2:02 - daughter goes on tour with Henry's son, Reinhart (later) [reset when rejoin]
// $21D2:01 - meet Henry's son, Reinhart (later)

// $21D3:80 - talk to Henry, Reinhart (later)
// $21D3:40 - spend night with old woman, Mountain Pass (teen)
// $21D3:20 - after spending night with old woman, Mountain Pass (teen)
// $21D3:10 - talk to Sancho, Granvania (teen)
// $21D3:08 - follow queen Isis, Telepador (teen)
// $21D3:04 - follow queen Isis, Telepador (teen)
// $21D3:02 - try on Zenethian helm, Telepador (before later)
// $21D3:01 - take son to Queen Isis, Telepador (later)

// $21D4:80 - collect the Zenithian Helm, Telepador (later)
// $21D4:40 - collect the Zenithian Sword, Santa Rosa secret cave (teen)
// $21D4:20 - collect the Final Key, Salabona Tower (later)
// $21D4:10 - enter throne room, Zenithia (later)
// $21D4:08 - find staircase behind throne, Zenithia (later)
// $21D4:04 - raise Zenithia (later)
// $21D4:02 - find out about missing orb, Zenithia (later)
// $21D4:01 - Pusan leaves after raising Zenithia (later)

// $21D5:80 - enter throne room with Dragon's Orb, Zenithia (later)
// $21D5:40 - wife recovers after pregnancy announcement (teen)
// $21D5:20 - talk to dying nun in Tower of Boble (later)
// $21D5:10 - defeat Gonz, Tower of Boble (later)
// $21D5:08 - defeat Gema, Tower of Boble (later)
// $21D5:04 - Gema evaporates, Tower of Boble (later)
// $21D5:02 - Pusan joins the party
// $21D5:01 - Pusan joins the party [resets when he leaves]

// $21D6:80 - children join party, Granvania (later)
// $21D6:40 - talk to Ojiron, Granvania (later)
// $21D6:20 - Ojiron requests audience after rescuing wife, Granvania (later)
// $21D6:10 - talk with Ojiron after he requests audience, Granvania (later)
// $21D6:08 - message from mother, Dark World Portal (later)
// $21D6:04 - pick up sages stone, Dark World Portal (later)
// $21D6:02 - place right eye in dragon, Tower of Boble (later)
// $21D6:01 - place left eye in dragon, Tower of Boble (later)

// $21D7:80 - man launched from runaway cart, underwater cave (later)
// $21D7:40 - chance spell - time reversed
missing_bit(0x21D7, 20)
// $21D7:10 - runaway cart gets out of loop, underwater cave (later)
// $21D7:08 - runaway cart crashes, underwater cave (later)
missing_bit(0x21D7, 04)
missing_bit(0x21D7, 02)
missing_bit(0x21D7, 01)

// $21D8:80 - place ring on SW statue, underwater cave (later)
// $21D8:XX - which ring was placed on SW statue, underwater cave (later)

// $21D9:80 - place ring on SE statue, underwater cave (later)
// $21D9:XX - which ring was placed on SW statue, underwater cave (later)

// $21DA:80 - place ring on SE statue, underwater cave (later)
// $21DA:XX - which ring was placed on SW statue, underwater cave (later)

// $21DB-DD - set to 0xE301B9 when raising Zenithia, then 0xE300B9 after (later)

// $21DF:XX - goes from 00 to 8B during statue scene, then back when statue turned back into human
// $21DF:XX - goes from 00 to 80 to B0 to 92 during Pusan meditation scene (later)

// $21E0:80 - defeat Kandar's Henchman, Mountain Village (later)
missing_bit(0x21E0, 40)
// $21E0:20 - defeat Kandar's Henchman, Shahanna (later)
// $21E0:10 - talk to guard with Ludman's dowry, Telepador (teen)
// $21E0:08 - talk to guard with Ludman's dowry, Mountain Pass (teen)
// $21E0:04 - defeat guardians in front of Martha, Evil Mountain (later)
// $21E0:02 - Martha leaves, Evil Mountain (later)
// $21E0:01 - defeat first form Mildrath, Evil Mountain (later)

// $21E1:80 - Bianca joins the party, Mountain Village (teen)
// $21E1:40 - Kandar's Henchman leaves, Mountain Village (later)
// $21E1:20 - Kandar's Henchman leaves, Shahanna (later)
// $21E1:10 - introduce Duncan to his grandchildren, Mountain Village (later)
// $21E1:08 - meet with Duncan, Mountain Village (later)
// $21E1:04 - fight Mammoo and Balloon, 10F Demon Tower (teen)
// $21E1:02 - cast chance - shattering sound
// $21E1:01 - defeat second form Mildrath, Evil Mountain (later)

// $21E2:80 - man launched from runaway cart, underwater cave (later)
// $21E2:40 - use magma staff to access cave (later)
// $21E2:20 - flip rusted switch, B3 underwater cave (later)
// $21E2:10 - handwoven cape, Santa Rosa (child) [see also $2234:01]
missing_bit(0x21E2, 08)
// $21E2:04 - intelligence seed, dresser, Salabona (teen)
missing_bit(0x21E2, 02)
// $21E2:01 - activate switch on pedestal under Reinhart bridge (teen)

// $21E3:XX - 00 -> 0F - enter water shrine -> 00 leave water shrine ??
// $21E3:XX - 00 -> 50 -> 05 - enter faerie castle ??

// $21E4:80 - ?? (before later)
missing_bit(0x21E4, 80)
// $21E4:40 - return to wife for birth (teen)
// $21E4:20 - next day after birth (teen)
// $21E4:10 - get Ring of Life, Great Temple (later)
// $21E4:08 - talk to lady blocking access to fiancee (teen)
missing_bit(0x21E4, 04)
missing_bit(0x21E4, 02)
missing_bit(0x21E4, 01)

// $21E5:80 - henry's pre-wedding speech (before later)
// $21E5:40 - defeat hell battlers, Evil Mountain (later)
// $21E5:20 - defeat hell battlers, Evil Mountain (later)
// $21E5:10 - get the boat from Port Selmi (teen)
// $21E5:08 - talk to Sancho after rescuing wife from cult, Granvania (later)
missing_bit(0x21E5, 04)
// $21E5:02 - get 1000g from Maria, Nunnery
missing_bit(0x21E5, 01)

// $21E6:80 - stay night at Flora's house, Salabona (teen) [resets next morning]
// $21E6:40 - get control in "later", Granvania (later)
// $21E6:20 - collect ring of flames (teen)
// $21E6:10 - unlock front door of Castle Lenoire (before later)
// $21E6:08 - flip lever in 1F Tower of Boble (later)
// $21E6:04 - young self appears in flashback (later)
// $21E6:02 - nun leaves Sancho's hut, Granvania (teen)
// $21E6:01 - defeat hell battlers, Evil Mountain (later)

missing_bit(0x21E7, 80)
missing_bit(0x21E7, 40)
missing_bit(0x21E7, 20)
missing_bit(0x21E7, 10)
// $21E7:08 - collect royal cloak?, Emblem Cave
missing_bit(0x21E7, 04)
missing_bit(0x21E7, 02)
missing_bit(0x21E7, 01)

// $21E8:80 - leave queen's chambers before birth (teen)
// $21E8:20 - arrive at Tower of Boble (later)
// $21E8:80 - leave throne room after rescuing wife (later)
// $21E8:40 - spend night with Sancho, Granvania (teen) [resets when leaving Sancho's house]
// $21E8:10 - defeat shamans guarding Martha, Evil Mountain (later)
// $21E8:08 - go downstairs after rescuing wife from cult, Granvania (later)
missing_bit(0x21E8, 04)
missing_bit(0x21E8, 02)
missing_bit(0x21E8, 01)

// $21E9:XX - changes periodically when changing maps

// $21EA:80 - during credits

// $21EB:02 - kitty joins party (before later)
// $21EB:01 - kitty joins party (before later)
missing_bit(0x21EB, 80)
missing_bit(0x21EB, 40)
missing_bit(0x21EB, 20)
missing_bit(0x21EB, 10)
missing_bit(0x21EB, 08)
missing_bit(0x21EB, 04)

// $21EC:80 - flip second switch in underwater cave (later)
// $21EC:40 - flip first switch in underwater cave (later)
// $21EC:20 - flip fifth switch in underwater cave (later)
// $21EC:10 - flip fourth switch in underwater cave (later)
// $21EC:08 - flip third switch in underwater cave (later)
// $21EC:04 - flip eighth switch in underwater cave (later)
// $21EC:02 - flip seventh switch in underwater cave (later)
// $21EC:01 - flip sixth switch in underwater cave (later)

// $21ED:80 - flip rusted switch in underwater cave (later)
missing_bit(0x21ED, 40)
missing_bit(0x21ED, 20)
missing_bit(0x21ED, 10)
missing_bit(0x21ED, 08)
missing_bit(0x21ED, 04)
missing_bit(0x21ED, 02)
missing_bit(0x21ED, 01)

// $21EE-$21F7:XX - sliding puzzle, evil mountain (later)

// $21F8:80 - defeat Hawk Men guards, 2F Demon Tower (teen)
// $21F8:40 - defeat Loenar and Orc King, 2F Demon Tower (teen)
// $21F8:20 - defeat Leonar guard, 2F Demon Tower (teen)
// $21F8:10 - defeat Lv.20 Orc, 10F Demon Tower (teen)
// $21F8:08 - defeat Lv.35 Wyvern, 10F Demon Tower (teen)
// $21F8:01 - set when completing "child" act
missing_bit(0x21F8, 04)
missing_bit(0x21F8, 02)

// $21F9:80 - push boulder into hole, Demon Tower
// $21F9:40 - set when completing "child" act
// $21F9:20 - push boulder into hole, Demon Tower
// $21F9:10 - set when completing "child" act
// $21F9:08 - push boulder into hole, Demon Tower
// $21F9:04 - complete generation one
missing_bit(0x21F9, 02)
// $21F9:01 - complete generation one

// $21FA:08 - reach 7F of Demon Tower (teen)
// $21FA:02 - reach 7F of Demon Tower (teen)
// $21FA:01 - set when completing "child" act
missing_bit(0x21FA, 40)
missing_bit(0x21FA, 10)
missing_bit(0x21FA, 04)

// $21FB:80 - set when completing "child" act
// $21FB:10 - reach 7F of Demon Tower (teen)
// $21FB:08 - set when completing "child" act
// $21FB:04 - reach 7F of Demon Tower (teen)
// $21FB:02 - reach 7F of Demon Tower (teen)
// $21FB:01 - set when completing "child" act
missing_bit(0x21FB, 40)
missing_bit(0x21FB, 20)

// $21FC:10 - reach 7F of Demon Tower (teen)
// $21FC:01 - set when completing "child" act
missing_bit(0x21FC, 80)
missing_bit(0x21FC, 40)
missing_bit(0x21FC, 20)
missing_bit(0x21FC, 08)
missing_bit(0x21FC, 04)
missing_bit(0x21FC, 02)

// $21FD:80 - set when completing "child" act
// $21FD:20 - reach 7F of Demon Tower (teen)
// $21FD:04 - set when completing "child" act
// $21FD:02 - set when completing "child" act
// $21FD:01 - set when completing "child" act
missing_bit(0x21FD, 40)
missing_bit(0x21FD, 10)
missing_bit(0x21FD, 08)

// $21FE:20 - reach 7F of Demon Tower (teen)
// $21FE:10 - reach 7F of Demon Tower (teen)
// $21FE:08 - reach 8F of Demon Tower (teen)
// $21FE:04 - reach 7F of Demon Tower (teen)
// $21FE:02 - reach 7F of Demon Tower (teen)
missing_bit(0x21FE, 80)
missing_bit(0x21FE, 40)
missing_bit(0x21FE, 08)
missing_bit(0x21FE, 01)

// $21FF:80 - set when completing "child" act
// $21FF:40 - set when completing "child" act
// $21FF:20 - reach 7F of Demon Tower (teen)
// $21FF:04 - set when completing "child" act
// $21FF:02 - reach 7F of Demon Tower (teen)
// $21FF:01 - set when completing "child" act
missing_bit(0x21FF, 10)
missing_bit(0x21FF, 08)

// $2200-$220F are boulder locations in Slavery Camp and Demon Tower

// $2210:80 - 2000 gold, dowry, Telepador (teen)
// $2210:40 - demon armor, kandar's henchman, Reinhart (later)
// $2210:20 - steel fang, dungeon, Reinhart (teen)
// $2210:10 - shell hat, dungeon, Reinhart (teen)
// $2210:08 - 1200 gold, barrier room, Reinhart (teen)
// $2210:04 - half plate armor, barrier room, Reinhart (teen)
// $2210:02 - acorns of life, barrier room, Reinhart (teen)
missing_bit(0x2210, 01) // seems like it's probably the goon badge chest

// $2211:80 - 3000 gold, behind magic door, Granvania (later)
// $2211:40 - meteorite armband, behind magic door, Granvania (later)
// $2211:20 - ring of prayer, hidden room, Granvania (teen)
// $2211:10 - naughty underwear, hidden room, Granvania (teen)
// $2211:08 - hat of happiness, hidden room, Granvania (teen)
// $2211:04 - demon claw, Great Temple (later)
// $2211:02 - shield of ruin, Great Temple (later) [cursed]
// $2211:01 - slave clothes, Great Temple (later)

// $2212:80 - wing of wyvern, Castle Lenoire (child)
// $2212:40 - empty, Castle Lenoire (child)
// $2212:20 - staff of thunder, palace of faeries (later)
// $2212:10 - princess robe, palace of faeries (later)
// $2212:08 - 180g, Thieves' Cave (child)
// $2212:04 - antidote herb, Thieves' Cave (child)
// $2212:02 - strength seed, Thieves' Cave (child)
// $2212:01 - elven medicine, Thieves' Cave (child)

// $2213:80 - monster lure, Thieves' Cave (child)
// $2213:40 - intelligence seed, Ice Mansion (child)
// $2213:20 - boomerang, Ice Mansion (child)
// $2213:10 - flute of spring, Ice Mansion (child)
// $2213:08 - 5 gold, Ice Mansion (child)
// $2213:04 - empty, Ice Mansion (child)
// $2213:02 - wing of wyvern, Ice Mansion (child)
// $2213:01 - 25 gold, Dwarves' Cave (child)

// $2214:80 - 100 gold, Dwarves' Cave (child)
// $2214:40 - secrets of the key, Dwarves' Cave (child)
// $2214:20 - 120 gold, Dwarves' Cave (child)
// $2214:10 - acorns of life, Dwarves' Cave (child)
// $2214:08 - agility seed, Dwarves' Cave (child)
// $2214:04 - rogue armor, east Mountain Pass (teen) [cursed]
// $2214:02 - small medal, chest, east Mountain Pass (teen)
// $2214:01 - stone of life, east Mountain Pass (teen)

// $2215:80 - man-eater chest, east Mountain Pass (teen)
// $2215:40 - agility seed, east Mountain Pass (teen)
// $2215:20 - bomb stone, east Mountain Pass (teen)
// $2215:10 - 270 gold, east Mountain Pass (teen)
// $2215:08 - mimic, east Mountain Pass (teen) [always drops small medal]
// $2215:04 - small medal, chest, east Mountain Pass (teen)
// $2215:02 - leaf of the world tree, east Mountain Pass (teen)
// $2215:01 - 1600 gold, east Mountain Pass (teen)

// $2216:80 - mimic, east Mountain Pass (teen) [always drops small medal]
// $2216:40 - staff of punishment, east Mountain Pass (teen)
// $2216:20 - 1500 gold, east Mountain Pass (teen)
// $2216:10 - mimic, east Mountain Pass (teen) [always drops small medal]
// $2216:08 - man-eater chest, east Mountain Pass (teen)
// $2216:04 - wing of wyvern, east Mountain Pass (teen)
// $2216:02 - small medal, chest, east Mountain Pass (teen)
// $2216:01 - stone axe, cave west of Kabochi (teen)

// $2217:80 - man-eater chest, cave west of Kabochi (teen)
// $2217:40 - iron helm, cave west of Kabochi (teen)
// $2217:20 - 450 gold, volcano (teen)
// $2217:10 - man-eater chest, volcano (teen)
// $2217:08 - staff of antimagic, volcano (teen)
// $2217:04 - iron helm, volcano (teen)
// $2217:02 - defense seed, volcano (teen)
// $2217:01 - 1500 gold, volcano (teen)

// $2218:80 - water flying clothes, dowry, Mountain Pass (teen)
// $2218:40 - ring of prayer, Mountain Pass (teen)
// $2218:20 - 550 gold, Mountain Pass (teen)
// $2218:10 - small medal, chest, Mountain Pass (teen)
// $2218:08 - small medal, chest, Mountain Pass (teen)
// $2218:04 - agility seed, Santa Rosa secret cave (teen)
// $2218:02 - breast plate, Santa Rosa secret cave (teen)
// $2218:01 - lamp of darkness, Santa Rosa secret cave (teen)

// $2219:80 - 850 gold, Santa Rosa secret cave (teen)
// $2219:40 - small medal, chest, River Shrine (later)
// $2219:20 - satan helm, River Shrine (later)
// $2219:10 - small medal, Cave of Trials (teen)
// $2219:08 - swordedge armor, Cave of Trials (teen)
// $2219:04 - faerie sword, Forest of Illusions (later)
// $2219:02 - 1500 gold, Forest of Illusions (later)
// $2219:01 - elven medicine, Waterfall Cave (teen)

// $221A:80 - small medal, cave to Salabona (teen)
// $221A:40 - elven amulet, B3 Emblem cave (later)
// $221A:20 - small medal, B3 Emblem cave (later)
// $221A:10 - demon hammer, B4 Emblem cave (later)
// $221A:08 - robe of darkness, 5F Evil Mountain
// $221A:04 - small medal, 5F evil mountain (later)
// $221A:02 - echoing hat, 5F evil mountain (later)
// $221A:01 - small medal, 5F evil mountain (later)

// $221B:80 - mimic, 5F evil mountain (later) [always drops small medal?]
// $221B:40 - king metal helm, 5F evil mountain (later)
// $221B:20 - 3300 gold, 5F evil mountain (later)
// $221B:10 - mimic, 1B Esturk's Labyrinth (later)
// $221B:08 - shield of radaiance, 1B Esturk's Labryinth (later)
// $221B:04 - restoration orb, 1B Esturk's Labyrinth (later)
// $221B:02 - small medal, 1B Esturk's Labyrinth (later)
// $221B:01 - empty, 3B Esturk's Labyrinth (later)

// $221C:80 - empty, 3B Esturk's Labyrinth (later)
// $221C:40 - empty, 3B Esturk's Labyrinth (later)
// $221C:20 - king metal armor, 3B Esturk's Labyrinth (later)
// $221C:10 - iron ball of devestation, 4B Esturk's Labyrinth (later)
// $221C:08 - hell sabre, 2B Esturk's Labyrinth (later)
// $221C:04 - drum of war, 2B Esturk's Labyrinth (later)
// $221C:02 - sword of decimation, 2B Esturk's Labyrinth (later)
// $221C:01 - elven medicine, 2B Esturk's Labyrinth (later)

// $221D:80 - mimic, 2B Esturk's Labyrinth (later)
missing_bit(0x221D, 40)
missing_bit(0x221D, 20)
missing_bit(0x221D, 10)
missing_bit(0x221D, 08)
missing_bit(0x221D, 04)
missing_bit(0x221D, 02)
missing_bit(0x221D, 01)

missing_bit(0x221E, 80)
// $221E:40 - demon armor, kandar henchman, Reinhart (later)
// $221E:20 - magic key, El Heven (later)
// $221E:10 - magic carpet, El Heven (later)
// $221E:08 - stone fang, behind magic door, Alcapa (later)
// $221E:04 - 15 gold, behind magic door, Alcapa (later)
// $221E:02 - armband of sacrifice, Kabochi (teen)
// $221E:01 - sands of time, kandar henchman, Shahanna (later)

// $221F:80 - 2000 gold, Ludman's house, Salabona (teen)
// $221F:40 - Zenithian Shield, Ludman's house, Salabona (teen)
// $221F:20 - thorn whip, behind magic door, dressing room, Port Selmi (later)
// $221F:10 - acorns of life, behind magic door, dressing room, Port Selmi (later)
// $221F:08 - leather shield, Santa Rosa Cave (child)
// $221F:04 - 50 gold, Santa Rosa Cave (child)
// $221F:02 - medical herb, Santa Rosa Cave (child)
// $221F:01 - wayfarer's clothes, Santa Rosa Cave (child)

// $2220:80 - silk bisuche, Kandar's Henchman, Mountain Village (later)
// $2220:40 - stone of life, basement, Farthest Shrine (later)
// $2220:20 - iron mask, outside, Medal King's Castle (later)
// $2220:10 - small medal, behind jail door, Medal King's Castle (later)
// $2220:08 - golden tiara, behind jail door, Medal King's Castle (later)
// $2220:04 - small medal, behind jail door, Medal King's Castle (later)
// $2220:02 - zombie mail, outside 5F Demon Tower (teen)
// $2220:01 - wizard's robe, 2F Demon Tower (teen)

// $2221:80 - strength seed, 2F Demon's Tower (teen)
// $2221:40 - armband of sacrifice, 3F Demon's Tower (teen)
// $2221:20 - wing of wyvern, 3F Demon's Tower (teen)
// $2221:10 - mimic, 3F Demon's Tower (teen)
// $2221:08 - magic water, 4F Demon's Tower (teen)
// $2221:04 - 880 gold, 4F Demon's Tower (teen)
// $2221:02 - mimic, 4F Demon's Tower (teen)
// $2221:01 - small medal, 8F Demon's Tower (teen)

// $2222:80 - leaf of the world tree, 8F Demon's Tower (teen)
// $2222:40 - devil's armor, 2F Tower of Boble (later)
// $2222:20 - dragon's left eye, B2 Tower of Boble (later)
// $2222:10 - elven medicine, B2 Tower of Boble (later)
// $2222:08 - 2700 gold, 2F Tower of Boble (later)
// $2222:04 - mimic, B3 Tower of Boble (later)
// $2222:02 - small medal, B3 Tower of Boble (later)
// $2222:01 - small medal, 5F Tower of Boble (later)

// $2223:80 - shield of darkness, B3 Tower of Boble (later)
// $2223:40 - dragon's right eye, Tower of Boble (later)
// $2223:20 - 650 gold, Southern Tower (teen)
// $2223:10 - scale shield, Southern Tower (teen)
// $2223:08 - acorns of magic, Southern Tower (teen)
// $2223:04 - magma staff, 8F Sky Tower (later)
// $2223:02 - small medal, 4F Sky Tower (later)
// $2223:01 - leaf of the world tree, 2F Sky Tower (later)

// $2224:80 - final key, Salabona Tower (later)
missing_bit(0x2224, 40)
missing_bit(0x2224, 20)
missing_bit(0x2224, 10)
missing_bit(0x2224, 08)
missing_bit(0x2224, 04)
missing_bit(0x2224, 02)
missing_bit(0x2224, 01)

missing_bit(0x2225, 80)
missing_bit(0x2225, 40)
missing_bit(0x2225, 20)
missing_bit(0x2225, 10)
missing_bit(0x2225, 08)
missing_bit(0x2225, 04)
missing_bit(0x2225, 02)
missing_bit(0x2225, 01)

missing_bit(0x2226, 80)
missing_bit(0x2226, 40)
missing_bit(0x2226, 20)
missing_bit(0x2226, 10)
missing_bit(0x2226, 08)
missing_bit(0x2226, 04)
missing_bit(0x2226, 02)
missing_bit(0x2226, 01)

missing_bit(0x2227, 80)
missing_bit(0x2227, 40)
missing_bit(0x2227, 20)
missing_bit(0x2227, 10)
missing_bit(0x2227, 08)
missing_bit(0x2227, 04)
missing_bit(0x2227, 02)
missing_bit(0x2227, 01)

// $2228:80 - 750 gold, underwater cave (later)
// $2228:40 - magic water, underwater cave (later)
// $2228:20 - 900 gold, underwater cave (later)
// $2228:10 - small medal, underwater cave (later)
// $2228:08 - acorns of life, underwater cave (later)
// $2228:04 - 1200 gold, Waterfall Cave (teen)
// $2228:02 - robe of serenity, Waterfall Cave (teen)
// $2228:01 - Orihalcon Fang, Evil Mountain (later)

missing_bit(0x2229, 80)
missing_bit(0x2229, 40)
missing_bit(0x2229, 20)
missing_bit(0x2229, 10)
missing_bit(0x2229, 08)
// $2229:04 - ogre shield, evil mountain (later)
// $2229:02 - multi-edge sword, midway, evil mountain (later)
// $2229:01 - staff of benediction, underwater cave (later)

// $222C:80 - defense seed, pot, kitchen, castle, Telepador (teen)
// $222C:40 - demon jar, kitchen, castle, Telepador (teen)
// $222C:20 - wing of wyvern, weapon shop basement, Telepador (teen)
// $222C:10 - acorns of magic, Reinhart (child)
// $222C:08 - small medal, Reinhart (teen)
// $222C:04 - small medal, pot, Granvania (teen)
// $222C:02 - strength seed, pot, Granvania (teen)
// $222C:01 - intelligence seed, item shop, Granvania (teen)

// $222D:80 - flying shoes, dresser, Chancellor's room, 2F Granvania (teen)
// $222D:40 - small medal, dresser, 2F Granvania (teen)
// $222D:20 - defense seed, dresser, 4F Granvania (teen)
// $222D:10 - stone of life, dresser, 4F Granvania (teen)
// $222D:08 - lace bisuche, dresser, 4F Granvania (teen)
// $222D:04 - boxer shorts, dresser, Sancho's house, Granvania (teen)
// $222D:02 - acorns of life, pot, Sancho's house, Granvania (teen)
missing_bit(0x222D, 01)

// $222E:80 - torch, Castle Lenoire (child)
// $222E:40 - medical herb, Castle Lenoire (child)
// $222E:20 - medical herb, Castle Lenoire (child)
missing_bit(0x222E, 10)
missing_bit(0x222E, 08)
// $222E:04 - small medal, dresser, Zenithia Castle (later)
// $222E:02 - grappling hook, dresser, Zenithia Castle (later)
// $222E:01 - demon jar, Mountain Pass (teen)

// $222F:80 - small medal, pot, Mountain Pass (teen)
// $222F:40 - leather loincloth, Santa Rosa secret cave (teen)
// $222F:20 - strength seed, Santa Rosa secret cave (teen)
// $222F:10 - small medal, pot, Forest of Illusions (later)
// $222F:08 - elven medicine, dresser, Forest of Illusions (later)
// $222F:04 - urnite, 2F Evil Mountain (later)
// $222F:02 - urnite, 2F Evil Mountain (later)
// $222F:01 - medical herb, boat (child)

// $2230:80 - small medal, pot, El Heven (later)
// $2230:40 - defense seed, pot, El Heven (later)
// $2230:20 - defense seed, upstairs armor shop, Oracleberry (teen)
// $2230:10 - silver barrette, Casino, Oracleberry (teen)
// $2230:08 - silk robe, Casino, Oracleberry (teen)
// $2230:04 - pot cover, Monster Gramps, Oracleberry (teen)
// $2230:02 - monster lure, Monster Gramps, Oracleberry (teen)
// $2230:01 - small medal, pot, behind bar, Alcapa (teen)

// $2231:80 - defense seed, third floor, inn, Alcapa (child)
// $2231:40 - wing of wyvern, third floor, inn, Alcapa (child)
// $2231:20 - strength seed, pot, inside house, Kabochi (teen)
// $2231:10 - leather hat, inside barn, Kabochi (teen)
// $2231:08 - magic water, upstairs meeting room, Kabochi (teen)
// $2231:04 - small medal, upstairs meeting room, Kabochi (teen)
// $2231:02 - small medal, barrel, east side of Shahanna (later)
// $2231:01 - defense seed, barrel, Shahanna (later)

// $2232:80 - elven medicine, drawer, inn, Shahanna (later)
// $2232:40 - agility seed, pot, pit, Ruraphin (teen)
// $2232:20 - small medal, pot, pit, Ruraphin (teen)
// $2232:10 - small medal, upstairs inn, Ruraphin (teen)
// $2232:08 - wing of wyvern, barrel behind bar, Ruraphin (teen)
// $2232:04 - acorns of magic, upstairs bar, Ruraphin (teen)
// $2232:02 - magic water, barrel, magician's house, Ruraphin (teen)
// $2232:01 - medical herb, pot, magician's house, Ruraphin (teen)

// $2233:80 - monster lure, inn, Chizod (teen)
// $2233:40 - small medal, barrel, under porch, Chizod (teen)
// $2233:20 - fighter's hair, pot, under porch, Chizod (teen)
// $2233:10 - iron shield, dresser, inn, Salabona (teen)
// $2233:08 - intelligence seed, dresser, house, Salabona (teen)
// $2233:04 - small medal, dresser, house, Salabona (teen)
// $2233:02 - silver barrette, dresser, Flora's room, Salabona (teen)
missing_bit(0x2233, 01)

// $2234:80 - silk apron, inn back room, Port Selmi (teen)
// $2234:40 - 50 gold, pot, upstairs inn, Port Selmi (teen)
// $2234:20 - small medal, lighthouse, Port Selmi (teen)
// $2234:10 - medical herb, Sancho's bedroom, Santa Rosa (child)
// $2234:08 - intelligence seed, old man's house, Santa Rosa (teen)
// $2234:04 - strength seed, pot, Sancho's basement, Santa Rosa (child)
// $2234:02 - leather hat, dresser, Bianca's room, Santa Rosa (child)
// $2234:01 - handwoven cape, Santa Rosa (child) [see also $21E2:10]

// $2235:80 - medical herb, upstairs weapon shop, Santa Rosa (child)
// $2235:40 - handwoven cape, dresser, Santa Rosa (adult)
// $2235:20 - holy water, near the inn, Faerie Village (child)
// $2235:10 - small medal, inn basement, Mountain Village (child)
// $2235:08 - medical herb, dresser, upstairs inn, Mountain Village (teen)
// $2235:04 - demon jar, cave, Mountain Village (teen)
// $2235:02 - strength seed, cave, Mountain Village (teen)
// $2235:01 - intelligence seed, Farthest Shrine (later)

// $2236:80 - small medal, dresser, Gigo's House (later)
// $2236:40 - small medal, pot, Oasis (teen)
// $2236:20 - small medal, 2F Demon's Tower (teen)
// $2236:10 - demon pot, 2F Demon's Tower (teen)
// $2236:08 - small medal, 3F Demon's Tower (teen)
// $2236:04 - magic water, 4F, Southern Tower (teen)
missing_bit(0x2236, 02)
missing_bit(0x2236, 01)

// $223C:80 - collect Symbol of Royalty, Cave of Trials (teen)
// $223C:40 - collect Zenethian helm, Telepador (later)
// $223C:20 - collect ring of flames (teen)
// $223C:10 - collect Papas's Sword, cave west of Kobuchi (teen)
// $223C:08 - collect Zenethian Sword, Santa Rosa secret cave (teen)
// $223C:04 - collect Papas's letter, Santa Rosa secret cave (teen)
// $223C:02 - collect ring of water, Waterfall Cave (teen)
// $223C:01 - collect Mirror of Ra, Southern Tower (teen)

// $223D:80 - Holy Chamberpot, 6F Evil Mountain (later)
// $223D:40 - Royal Cloak, B4 Emblem Cave (later)
// $223D:20 - Ring of Life, Great Temple (later)
// $223D:10 - Dragon Staff, inside statue, Tower of Boble (later)
// $223D:08 - Zenithian Armor, side room, entrance, Great Temple (later)
// $223D:04 - Sage's Stone, Dark World Portal (later)
missing_bit(0x223D, 02)
// $223D:01 - Dragon Orb, inside status, Tower of Boble (later)

missing_bit(0x223E, 80)
missing_bit(0x223E, 40)
missing_bit(0x223E, 20)
missing_bit(0x223E, 10)
missing_bit(0x223E, 08)
missing_bit(0x223E, 04)
missing_bit(0x223E, 02)
// $223E:01 - Sun Crown, 6F Evil Mountain (later)

// $2240:80 - small medal, well, basement, castle, Telepador (teen)
missing_bit(0x2240, 40)
missing_bit(0x2240, 20)
missing_bit(0x2240, 10)
// $2240:08 - small medal, NE corner of balcony, Granvania 4F (teen)
missing_bit(0x2240, 04)
missing_bit(0x2240, 02)
missing_bit(0x2240, 01)

missing_bit(0x2241, 80)
// $2241:40 - small medal, skeleton, cave west of Kabochi (teen)
// $2241:20 - small medal, prison, Oracleberry (later)
// $2241:10 - small medal, NW corner church, Kabochi (teen)
// $2241:08 - small medal, flowers outside church, Port Selmi (teen)
// $2241:04 - 100 gold, flowers outside church, Port Selmi (teen)
missing_bit(0x2241, 02)
// $2241:01 - small medal, grave, Mountain Village (teen)

// $2242:80 - small medal, water bucket, Farthest Shrine (later)
// $2242:40 - small medal, well, Rumor Shrine (teen)

// === Recruiting =====================

story_achievement(location_any, bit7(0x21B1), 2, "Monster Tamer", "Recruit your first wild monster")

// sprite_slime (0x82) => $29EC
// sprite_nereus (0xA9) => $2A13
function monster_capture(sprite) => byte(0x296A + sprite) // 1 = first, 3 = second, 7 = third

function trigger_recruit_unique(count)
{
    return trigger_in_game() && byte(0x182F) != 0x55 && // everything = 0x55 on initial load
           (bit0(0x29EC) + bit0(0x29ED) + bit0(0x29EE) + bit0(0x29EF) +
            bit0(0x29F0) + bit0(0x29F1) + bit0(0x29F2) + bit0(0x29F3) +
            bit0(0x29F4) + bit0(0x29F5) + bit0(0x29F6) + bit0(0x29F7) +
            bit0(0x29F8) + bit0(0x29F9) + bit0(0x29FA) + bit0(0x29FB) +
            bit0(0x29FC) + bit0(0x29FD) + bit0(0x29FE) + bit0(0x29FF) +
            bit0(0x2A00) + bit0(0x2A01) + bit0(0x2A02) + bit0(0x2A03) +
            bit0(0x2A04) + bit0(0x2A05) + bit0(0x2A06) + bit0(0x2A07) +
            bit0(0x2A08) + bit0(0x2A09) + bit0(0x2A0A) + bit0(0x2A0B) +
            bit0(0x2A0C) + bit0(0x2A0D) + bit0(0x2A0E) + bit0(0x2A0F) +
            bit0(0x2A10) + bit0(0x2A11) + bit0(0x2A12) + bit0(0x2A13)) >= count
}

achievement(
    title = "Monster Recruiter", points = 3,
    description = "Recruit five unique monsters",
    trigger = trigger_recruit_unique(5)
)

achievement(
    title = "Monster Hunter", points = 5,
    description = "Recruit ten unique monsters",
    trigger = trigger_recruit_unique(10)
)

achievement(
    title = "Monster Collector", points = 10,
    description = "Recruit sixteen unique monsters",
    trigger = trigger_recruit_unique(16)
)

// === Return Locations ===============

// $2030:80 - Ned's Inn
// $2030:40 - Salabona
// $2030:20 - Kabochi
// $2030:10 - Ruraphin
// $2030:08 - Port Selmi
// $2030:04 - Nunnery
// $2030:02 - Oracleberry
// $2030:01 - Reinhart

// $2031:80 - Shahanna
// $2031:40 - Zenithia
// $2031:20 - Faerie Village
// $2031:10 - Alcapa
// $2031:08 - Santa Rosa
// $2031:04 - El Heven
// $2031:02 - Northern Church
// $2031:01 - Granvania

// $2032:80 - N/A
// $2032:40 - N/A
// $2032:20 - Faerie Castle    // how?
// $2032:10 - Shrine of Rumor  // how?
// $2032:08 - Mountain Village // how?
// $2032:04 - Chizod           // how?
// $2032:02 - Telepador        // how?
// $2032:01 - Evil Mountain

achievement(
    title = "There and Back Again", points = 2,
    description = "Unlock all 17 return locations",
    trigger = trigger_in_game() && word(0x2030) == 0xFFFF && byte(0x2032) == 1
)

// === Small Medals ===================

// Man-eater Chests can sometimes drop small medals
// Mimics often drop small medals
chest_small_medals = {
    1: bit7(0x221A), // chest, cave to Salabona (teen)
    2: bit4(0x2218), // chest, Mountain Pass (teen)
    3: bit3(0x2218), // chest, Mountain Pass (teen)
    4: bit1(0x2216), // chest, East Mountain Pass (teen)
    5: bit2(0x2215), // chest, East Mountain Pass (teen)
    6: bit1(0x2214), // chest, East Mountain Pass (teen)
    7: bit4(0x2219), // chest, Cave of Trials (teen)
    8: bit0(0x2221), // chest, 8F Demon's Tower (teen)
    9: bit6(0x2219), // chest, River shrine (later)
    10: bit1(0x2223), // chest, 4F Sky Tower (later)
    11: bit4(0x2228), // chest, B2 underwater cave (later)
    12: bit4(0x2220), // chest, behind jail door, Medal King's Castle (later)
    13: bit2(0x2220), // chest, behind jail door, Medal King's Castle (later)
    14: bit5(0x221A), // chest, B3 Emblem Cave (later)
    15: bit0(0x2222), // chest, 5F Tower of Boble (later)
    16: bit1(0x2222), // chest, B3 Tower of Boble (later)
    17: bit2(0x221A), // chest, 5F Evil Mountain (later)
    18: bit0(0x221A), // chest, 5F Evil Mountain (later)
    19: bit1(0x221B), // chest, B1 bonus dungeon (later)
}

other_small_medals = {
    1: bit0(0x2230), // pot in room behind bar, Alcapa (teen) [tell bunny lady "no"]
    2: bit3(0x222C), // pot in room across hallway after two dragon pups (teen)
    3: bit5(0x2234), // dresser in lighthouse, Port Selmi (teen)
    4: bit3(0x2241), // flowers outside church, Port Selmi (teen)
    5: bit4(0x2241), // NW corner church, Kabochi (teen)
    6: bit2(0x2231), // pot, upstairs meeting room, Kabochi (teen)
    7: bit6(0x2241), // central skeleton, cave west of Kabochi (teen)
    8: bit4(0x2232), // upstairs inn, Ruraphin (teen)
    9: bit5(0x2232), // pot, pit, Ruraphin (teen)
    10: bit6(0x2242), // well, Rumor Shrine (teen)
    11: bit2(0x2233), // dresser, house, Salabona (teen)
    12: bit0(0x2241), // grave, Mountain Village (teen)
    13: bit4(0x2235), // barrel, inn basement, Mountain Village (teen)
    14: bit6(0x2236), // pot, Oasis (teen)
    15: bit7(0x2240), // well, basement, castle, Telepador (teen)
    16: bit7(0x222F), // pot, Mountain Pass (teen)
    17: bit6(0x2233), // barrel, under porch, Chizod (teen)
    18: bit3(0x2240), // NE corner, balcony outside wife's room, Granvania 4F (teen)
    19: bit6(0x222D), // dresser, Granvania 2F (teen)
    20: bit2(0x222C), // pot, Granvania (teen)
    21: bit5(0x2236), // pot, 2F Demon's Tower (teen)
    22: bit3(0x2236), // pot, 3F Demon's Tower (teen)
    23: bit7(0x2236), // dresser, Gigo's House (later)
    24: bit7(0x2242), // water bucket, Farthest Shrine (later)
    25: bit7(0x2230), // pot, El Heven (later)
    26: bit4(0x222F), // pot, Forest of Illusions (later)
    27: bit2(0x222E), // dresser, Zenithia Castle (later)
    28: bit5(0x2241), // floor, prison, Oracleberry (later)
    29: bit1(0x2231), // barrel, east side of Shahanna (later)
}

function trigger_small_medals(small_medals)
{
    trigger = trigger_in_game()
    trigger_or = (byte(1) == prev(byte(1)))
    
    for index in small_medals
    {
        bit = small_medals[index]
        trigger = trigger && bit == 1
        trigger_or = trigger_or || prev(bit) == 0
    }
    
    return trigger && trigger_or
}

achievement(
    title = "Small Medal Collector", points = 25, id = 61421,
    description = "Collect 19 small medals from treasure chests",
    trigger = trigger_small_medals(chest_small_medals)
)

achievement(
    title = "Small Medal Hunter", points = 25,
    description = "Find 29 small medals hidden in pots, barrels, dressers, and other places",
    trigger = trigger_small_medals(other_small_medals)
)

// === Possibly hidden chests ===
// $2210:01 - Reinhart or Granvania - probably reserved for Goon Badge chest
// $222D:01 - Granvania or Castle Lenoire (great tmple?)
// $222E:10 - Castle Lenoire or Zenithia Castle (palace of fairies?)
// $222E:08 - Castle Lenoire or Zenithia Castle
// $2233:01 - Salabona or Port Selmi
// $2235:40 - Santa Rosa or Faerie Village
// $2236:02 - Southern Tower or Cave of Trials
// $2236:01 - Southern Tower or Cave of Trials
// $223D:02 - Dark World Portal or Tower of Boble
// $2240:40 - Telepador or Granvania (Reinhart?)
// $2240:20 - Telepador or Granvania
// $2240:10 - Telepador or Granvania
// $2240:04 - Granvania or cave west of Kabochi
// $2240:02 - Granvania or cave west of Kabochi
// $2240:01 - Granvania or cave west of Kabochi
// $2241:80 - Granvania or cave west of Kabochi
// $2241:02 - Port Selmi or Mountain Village (santa rosa/fairie village?)

// Recruitable monsters with useful skills:
// * Centaurus (50) [Ruined Tower]: Bikill (20), Healall (23), Barrier (27)
// * Kukkle (20) [South of Nunnery]: Surround (5), Increase (17), Curseoff (18), Bikill (20)
// * Soldier Bull (30) [Mining Cave]: Upper (5), Bikill (10), Decrease (15)
// * King Healer (20) [Ruined Tower]: Barrier (7), Revive (10), Bedragon (20)
