// Indiana Jones' Greatest Adventures
// #ID = 308
// md5: 77c5cb84c9768756c13fa8f956bfb11e (U)

function difficulty() => byte(0x1E7C)
difficulty_easy = 0
difficulty_normal = 1
difficulty_hard = 2

difficulties = {
    difficulty_easy: "Easy",
    difficulty_normal: "Normal",
    difficulty_hard: "Hard",
}

function lives() => byte(0x01A3)

map_peru_temple = 0
map_peru_boulder = 1
map_nepal = 2
map_nepal_bar = 3
map_cairo_streets = 4
map_cairo_cart = 5
map_cairo_night = 6
map_cairo_dig_site = 7
map_well_of_souls = 8
map_well_of_souls_dark = 9
map_nazi_island = 10
map_nazi_island_boss = 11
map_shanghai_club = 12
map_shanghai_streets = 13
map_india_raft = 14
map_india_palace = 15
map_pankot_caves = 16
map_pankot_caves2 = 17
map_pankot_mine_cart = 18
map_pankot_boss = 19
map_venice_catacombs = 20
map_salzburg_castle = 21
map_salzburg_outside = 22
map_berlin_zeppelin = 23
map_berlin_dogfight = 24
map_alexandretta_desert = 25
map_alexandretta_tomb = 26
map_alexandretta_boss = 27
map_titles = 28

function current_map() => byte(0x003F)
maps = {
    map_peru_temple: "in Peru",
    map_peru_boulder: "in Peru",
    map_nepal: "in Nepal",
    map_nepal_bar: "in Nepal",
    map_cairo_streets: "in Cairo",
    map_cairo_cart: "in Cairo",
    map_cairo_night: "in Cairo",
    map_cairo_dig_site: "in Cairo",
    map_well_of_souls: "in Cairo",
    map_well_of_souls_dark: "in Cairo",
    map_nazi_island: "on the remote island",
    map_nazi_island_boss: "on the remote island",
    map_shanghai_club: "in Shanghai",
    map_shanghai_streets: "in Shanghai", 
    map_india_raft: "in India",
    map_india_palace: "in India",
    map_pankot_caves: "in Pankot",
    map_pankot_caves2: "in Pankot",
    map_pankot_mine_cart: "in Pankot",
    map_pankot_boss: "in Pankot",
    map_venice_catacombs: "in Venice",
    map_salzburg_castle: "in Salzburg",
    map_salzburg_outside: "in Salzburg",
    map_berlin_zeppelin: "in Berlin",
    map_berlin_dogfight: "in Berlin",
    map_alexandretta_desert: "in Alexandretta",
    map_alexandretta_tomb: "in Alexandretta",
    map_alexandretta_boss: "in Alexandretta",
    map_titles: "about to start adventuring",
}

function demo_state() => byte(0x1E80)
demo_states = {
    0: "[Demo] ",
    3: "", // normal/hard
    5: "", // easy
}

rich_presence_display("{0}Indy is {1} with {2} lives on {3}",
    rich_presence_lookup("Demo", demo_state(), demo_states),
    rich_presence_lookup("Location", current_map(), maps),
    rich_presence_value("Lives", lives()),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)

function complete_level(map) => current_map() == map && byte(0x016C) == 2

achievement(
    title = "Peru", description = "Complete Peru", points = 10,
    id = 678, badge = "58761", published = "5/10/2013 2:40:44 AM", modified = "5/10/2013 4:42:48 AM",
    trigger = complete_level(map_peru_boulder)
)

achievement(
    title = "Nepal", description = "Complete Nepal", points = 10,
    id = 679, badge = "00928", published = "5/10/2013 2:40:48 AM", modified = "5/10/2013 4:42:52 AM",
    trigger = complete_level(map_nepal_bar)
)

achievement(
    title = "Cairo", description = "Complete Cairo", points = 10,
    id = 680, badge = "00929", published = "5/10/2013 2:41:03 AM", modified = "5/10/2013 4:42:57 AM",
    trigger = complete_level(map_well_of_souls_dark) 
)

// 10789: <br/>MD5: 77c5cb84c9768756c13fa8f956bfb11e
// 10360: Tried everything. All difficulties, passwords, game over screen, etc....
//        Didn't trigger at all<br/>MD5: 77c5cb84c9768756c13fa8f956bfb11e
// 10012: DIDNT TRIGGERED<br/>MD5: 77c5cb84c9768756c13fa8f956bfb11e
// 9966: <br/>MD5: 77c5cb84c9768756c13fa8f956bfb11e
// 8690: Don't work.<br/>MD5: 77c5cb84c9768756c13fa8f956bfb11e
// 3626: These 2 achievements triggered when I died on the Bellock battle and the streets of Shanghai stages respectively (the stages you need to beat to trigger them).
achievement(
    title = "The Island", description = "Complete the Island", points = 10,
    id = 681, badge = "00930", published = "5/10/2013 2:41:15 AM", modified = "4/11/2017 12:15:17 AM",
    trigger = complete_level(map_nazi_island_boss)
)

// 3627: These 2 achievements triggered when I died on the Bellock battle and the streets of Shanghai stages respectively (the stages you need to beat to trigger them).
achievement(
    title = "Shanghai", description = "Complete Shanghai", points = 10,
    id = 682, badge = "00931", published = "5/10/2013 2:41:26 AM", modified = "5/10/2013 4:43:07 AM",
    trigger = complete_level(map_shanghai_streets)
)

achievement(
    title = "India", description = "Complete India", points = 10,
    id = 683, badge = "00932", published = "5/10/2013 2:41:35 AM", modified = "5/10/2013 4:43:22 AM",
    trigger = complete_level(map_india_palace)
)

achievement(
    title = "Pankot", description = "Complete Pankot", points = 10,
    id = 684, badge = "00933", published = "5/10/2013 2:41:49 AM", modified = "5/10/2013 4:43:26 AM",
    trigger = complete_level(map_pankot_boss)
)

achievement(
    title = "Venice", description = "Complete Venice", points = 10,
    id = 685, badge = "00934", published = "5/10/2013 2:42:00 AM", modified = "5/10/2013 4:43:50 AM",
    trigger = complete_level(map_venice_catacombs)
)

achievement(
    title = "Salzburg", description = "Complete Salzburg", points = 10,
    id = 690, badge = "00952", published = "5/10/2013 2:48:03 AM", modified = "5/10/2013 4:51:17 AM",
    trigger =  complete_level(map_salzburg_outside)
)

achievement(
    title = "Berlin", description = "Complete Berlin", points = 10,
    id = 691, badge = "00955", published = "5/10/2013 2:51:59 AM", modified = "5/10/2013 4:51:32 AM",
    trigger = complete_level(map_berlin_dogfight)
)

achievement(
    title = "A Long Way Home", description = "Finish the Game", points = 20,
    id = 715, badge = "00972", published = "5/10/2013 4:34:46 AM", modified = "5/10/2013 4:52:31 AM",
    trigger = byte(0x1E82) == 27 && byte(0x001E9C) == 2 && byte(0x001E9E) == 115 && 
              byte(0x001EA4) == 127 && byte(0x001E93) == 32 && byte(0x001EAA) == 90
)

achievement(
    title = "A Long Way Home II", description = "Finish the Game on Hard Mode", points = 20,
    id = 716, badge = "00972", published = "5/10/2013 4:38:48 AM", modified = "5/10/2013 5:13:05 AM",
    trigger = byte(0x1E82) == 27 && byte(0x001E9C) == 2 && byte(0x001E9E) == 115 && 
              byte(0x001EA4) == 127 && byte(0x001E93) == 32 && byte(0x001EAA) == 90 && 
              difficulty() == difficulty_hard
)

