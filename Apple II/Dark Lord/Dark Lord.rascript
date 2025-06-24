// Dark Lord
// #ID = 32644
// 
// woz-a-day
// MD5: dceb7f41c35891323a35a2ed81a55b45 - side A
// MD5: 41673ba6275bb4665e22616e33799d47 - side B
//
// Manual: https://mocagh.org/datasoft/darklord-manual.pdf
// Walkthrough (easy): https://www.solutionarchive.com/file/id%2C172/
//
// NOTE: woz-a-day save files:
// 1/8: at lava - ready to jump and kill dragon
// 2/3: at scarab door
// 4: at cat
// 5: started new game
// 6: at evil one (easy)
// 7: outside evil one's room (easy)

// The only difference between easy and normal is the location of six items. The thing that makes it harder is that
// two of the items are no longer just laying around in the open.
//
// The rope is:
// [spoiler]attached to the dock[/spoiler]
//
// The amulet is:
// [spoiler]in the unlit room beyond the burial chamber[/spoiler]
//
// In many cases, this makes random easier than normal until you know where the items are in normal.
//
// Random moves eight items to random locations, some of which are not immediately accessible, but in all the random
// playthroughs that I did, the inaccessible items weren't needed until after you were able to get to them.
// Unfortunately, there isn't any indicator that the player is playing on random other than the location of the items,
// so the achievement logic for the random playthrough must be done in a single session so I can determine the items
// aren't starting in the normal locations.


function in_game() => byte(0x00b0) == 1 // demo protection

function mode() => byte(0x1e61)
mode_mini_adventure = 1
mode_normal = 0x5f

function difficulty() => byte(0x1e52)
difficulty_easy = 0xFA
difficulty_normal = 0xFF

difficulties = {
    difficulty_easy: " (easy)",
}

function current_scene() => byte(0x1e60)
scene_nowhere = 0xFF
scene_split_redwood = 1
scene_edge_of_forest = 2
scene_redwood_forest = 3
scene_outside_temple = 4
scene_slime_pool = 5
scene_inside_tree = 6
scene_tunnel_worm = 7
scene_temple_hallway = 8
scene_temple_stairs = 9
scene_temple_altar = 10
scene_facing_volcano = 12

mini_adventure_scenes = {
    scene_nowhere: "Titles",
    scene_facing_volcano: "In a forest",
    scene_edge_of_forest: "In a forest",
    scene_redwood_forest: "In a forest",
    scene_slime_pool: "In a clearing",
    scene_outside_temple: "Outside a temple",
    scene_split_redwood: "In a forest",
    scene_inside_tree: "In a cave",
    scene_tunnel_worm: "In a cave",
    scene_temple_hallway: "In a temple",
    scene_temple_stairs: "In a temple",
    scene_temple_altar: "In a temple",
}

scene_inventory = 0
scene_hidden_room = 1
scene_stone_house_mirror = 2
scene_stone_house_bed = 3
scene_stone_house_man = 5
scene_village_center = 6
scene_underground_building = 8
scene_underground_corridor = 9
scene_ancient_structure = 10
scene_island_highest_point = 11
scene_island_hike = 12
scene_island_shore = 13
scene_flying_beach = 14
scene_flying = 15
scene_castle_north = 16
scene_castle_entrance = 17
scene_castle_outside = 18
scene_castle_dock = 21
scene_castle_eerie_hall = 22
scene_castle_stairs = 23
scene_castle_top_of_stairs = 24
scene_castle_overlook = 25
scene_castle_guard = 26
scene_fishing_village_seagull = 27
scene_fishing_village_dock = 28
scene_fishing_village_storehouse = 29
scene_fishing_village = 30
scene_fishing_village_beach = 31
scene_approaching_fishing_village = 32
scene_fishing_village_boat = 33
scene_castle_dock2 = 34
scene_stream_on_bridge = 35
scene_stream_bridge = 36
scene_rock_passage_entrance = 37
scene_rock_passage = 38
scene_rock_passage_steps = 39
scene_village_west = 40
scene_winged_monster = 41
scene_castle_cell = 42
scene_castle_dark_corridor = 43
scene_castle_massive_stone = 44
scene_castle_lattice = 45
scene_castle_hallway = 46
scene_castle_crystal = 47
scene_stream_flask = 48
scene_stream_fish = 49
scene_village_east = 50
scene_great_chasm = 51
scene_chasm_bridge = 52
scene_narrow_strip_of_forest = 53
scene_sparse_forest = 54
scene_trench = 55
scene_lava_plants = 56
scene_lava_ledge = 57
scene_treacherous_path = 58
scene_darkness_near_winged_monster = 59
scene_evil_one = 60
scene_burial_chamber = 61
scene_trench2 = 62
scene_trench_message = 63
scene_trench3 = 64
scene_trench4 = 65
scene_trench5 = 66
scene_trench_end = 67
scene_trench6 = 68
scene_trench7 = 69
scene_trench8 = 70
scene_trench_tree = 71
scene_trench9 = 72
scene_trench_bush = 73
scene_damp_tunnel = 74
scene_lava_stream = 75
scene_edge_of_cliff = 76
scene_rocky_ledge = 77
scene_canyon_floor = 78
sceen_wooden_corridor = 79
scene_home_of_krin = 80
scene_forest_edge = 81
scene_mountain_path = 82
scene_village_fire = 83
scene_side_of_canyon = 84
scene_flying_return = 85
scene_dark_passage = 86
scene_rocky_point = 87
scene_victory_beach = 90
scene_shallow_cave = 91

scenes = {
    scene_nowhere: "Titles",
    scene_hidden_room: "Beneath your house",
    scene_stone_house_mirror: "In a house",
    scene_stone_house_bed: "In a house",
    scene_stone_house_man: "In a house",
    scene_village_center: "In a village",
    scene_village_east: "In a village",
    scene_village_west: "In a village",
    scene_village_fire: "In a village",
    scene_stream_flask: "At a stream",
    scene_stream_fish: "At a stream",
    scene_stream_bridge: "At a stream",
    scene_stream_on_bridge: "At a stream",
    scene_approaching_fishing_village: "In a rock passage",
    scene_fishing_village: "In a fishing village",
    scene_fishing_village_beach: "In a fishing village",
    scene_fishing_village_seagull: "In a fishing village",
    scene_fishing_village_boat: "In a fishing village",
    scene_fishing_village_dock: "In a fishing village",
    scene_fishing_village_storehouse: "In a fishing village",
    scene_rock_passage_entrance: "In a rock passage",
    scene_rock_passage: "In a rock passage",
    scene_rock_passage_steps: "In a rock passage",
    scene_edge_of_cliff: "At a canyon",
    scene_great_chasm: "At a canyon",
    scene_side_of_canyon: "At a canyon",
    scene_chasm_bridge: "At a canyon",
    scene_sparse_forest: "In a forest",
    scene_narrow_strip_of_forest: "In a forest",
    scene_forest_edge: "In a forest",
    scene_mountain_path: "Climbing a mountain",
    scene_rocky_ledge: "In a canyon",
    scene_canyon_floor: "In a canyon",
    sceen_wooden_corridor: "In a canyon",
    scene_home_of_krin: "In a canyon",
    scene_flying: "Flying",
    scene_flying_beach: "Flying",
    scene_flying_return: "Flying",
    scene_island_shore: "On an island",
    scene_rocky_point: "On an island",
    scene_island_hike: "On an island",
    scene_island_highest_point: "On an island",
    scene_ancient_structure: "Underground",
    scene_underground_corridor: "Underground",
    scene_underground_building: "Underground",
    scene_burial_chamber: "Underground",
    scene_dark_passage: "Underground",
    scene_shallow_cave: "In a cave",
    scene_trench: "In a rocky trench",
    scene_trench2: "In a rocky trench",
    scene_trench_message: "In a rocky trench",
    scene_trench3: "In a rocky trench",
    scene_trench4: "In a rocky trench",
    scene_trench5: "In a rocky trench",
    scene_trench_end: "In a rocky trench",
    scene_trench6: "In a rocky trench",
    scene_trench7: "In a rocky trench",
    scene_trench8: "In a rocky trench",
    scene_trench_tree: "In a rocky trench",
    scene_trench9: "In a rocky trench",
    scene_trench_bush: "In a rocky trench",
    scene_damp_tunnel: "In a cave",
    scene_lava_stream: "In the volcano",
    scene_lava_plants: "In the volcano",
    scene_lava_ledge: "In the volcano",
    scene_treacherous_path: "In the volcano",
    scene_darkness_near_winged_monster: "In the volcano",
    scene_winged_monster: "In the volcano",
    scene_castle_entrance: "Outside the castle",
    scene_castle_outside: "Outside the castle",
    scene_castle_north: "Outside the castle",
    scene_castle_dock: "Outside the castle",
    scene_castle_dock2: "Outside the castle",
    scene_castle_eerie_hall: "In the castle",
    scene_castle_stairs: "In the castle",
    scene_castle_top_of_stairs: "In the castle",
    scene_castle_overlook: "In the castle",
    scene_castle_guard: "In the castle",
    scene_castle_cell: "In the castle",
    scene_castle_dark_corridor: "In the castle",
    scene_castle_massive_stone: "In the castle",
    scene_castle_lattice: "In the castle",
    scene_castle_hallway: "In the castle",
    scene_castle_crystal: "In the castle",
    scene_evil_one: "In the castle",
    scene_victory_beach: "Victorious",
}

function item_location(id) => byte(0x1e40 + id)
item_scarab = 0
item_axe = 1
item_stick = 2
item_blossom = 3
item_leaf = 4
item_flask = 5
item_flask_of_water= 6
item_rope = 7
item_fish = 8
item_skull = 9
item_amulet = 11
item_key = 12
item_rat = 13
item_oil_lamp = 14
item_scroll = 15

function is_random() => mode() == mode_normal && never(current_scene() == scene_nowhere) &&
                        once(current_scene() == scene_hidden_room && // prevent enabling "random" mode by dropping axe
                             item_location(item_axe) > 1 && item_location(item_axe) < scene_shallow_cave)

// ====================================

rich_presence_conditional_display(!in_game(), "Watching the demo")

rich_presence_conditional_display(mode() == mode_mini_adventure, "{0} (mini adventure)",
    rich_presence_lookup("MiniAdventureScene", current_scene(), mini_adventure_scenes, fallback="??")
)

rich_presence_conditional_display(is_random(), "{0} (random)",
    rich_presence_lookup("Scene", current_scene(), scenes, fallback="??")
)

rich_presence_display("{0}{1}",
    rich_presence_lookup("Scene", current_scene(), scenes, fallback="??"),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)

// ====================================
// Mini Adventure
// ------------------------------------
// * N
// * E
// * N
// * GET BOWL
// * S
// * FILL BOWL WITH SLIME
// * S
// * S
// * ENTER TREE
// * N
// * GET TORCH
// * THROW SLIME AT WORM
// * N
// * N
// * N
// * LIGHT ALTAR WITH TORCH

achievement("A Simple Journey", "Complete the Mini Adventure", 5,
    trigger = mode() == mode_mini_adventure &&
              current_scene() == scene_temple_altar &&
              byte(0x1f04) == 1 && prev(byte(0x1f04)) == 0 &&
              in_game() // demo protection
)

// ====================================
// Easy
// ------------------------------------
// * ENTER MIRROR
// * GET SCARAB
// * N
// * SAY YES
// * GET STICK
// * W, E, N, W
// * GET FISH
// * W, N, N, N, N, N, N, E 
// * SAY HELLO
// * GIVE FISH TO MAN

achievement("He Eats for a Day", "Feed the fisherman", 5,
    trigger = mode() == mode_normal &&
              current_scene() == scene_fishing_village_boat &&
              byte(0x1f0f) == 1 && prev(byte(0x1f0f)) == 0
)

// * GET SCROLL
// * E, E, S
// * GET RAT
// * GET ROPE
// * W, S, S, S, S, S, S, S (bridge), W, W, W
// * GET BLOSSOM
// * E, E, E, N
// * TIE ROPE TO TREE
// * CLIMB ROPE
// * W, W, N
// * SAY HELLO
// * SHOW STICK
// * EAT BLOSSOM

achievement("A Strange Energy", "Follow Krin's instructions", 5, type="progression",
    trigger = mode() == mode_normal &&
              current_scene() > 0 && current_scene() < 90 &&
              byte(0x1f08) == 1 && prev(byte(0x1f08)) == 0
)

// * GET STICK
// * ASK ENERGY
// * S, E, E, U, N, N, E
// * GET FISH
// * W, N, N, N, N, E, N
// * FLY
// * N, N, D
// * INSERT SCARAB IN HOLE
// * (quickly!) N
// * N
// * GIVE FISH TO CAT
// * GET SKULL

achievement("That's Not a Cat Toy", "Get the skull", 5, type="progression",
    trigger = mode() == mode_normal &&
              current_scene() == scene_underground_building &&
              item_location(item_skull) == scene_inventory &&
              prev(item_location(item_skull)) == scene_underground_building
)

// * W
// * GET AMULET
// * WEAR AMULET
// * MOVE DEBRIS
// * W, U
// * FLY
// * S, S, S, S, S, S, E, E
// * GET FLASK
// * FILL FLASK WITH WATER
// * S, W, S
// * GET OIL LAMP
// * W, S, W, W, N, N
// * FLY
// * GET AXE
// * FLY
// * E, E, S, S, S, S, S, S, S, S (bridge), W, W, W, W, W (message), S, W, S, W, N (bush)
// * BURN BUSH WITH LAMP
// * ENTER HOLE
// * W, N
// * GET LEAF
// * N
// * RUB LEAF ON FEET
// * POUR WATER ON LAVA
// * (quickly!) JUMP

achievement("Hot Feet", "Cross the lava", 5, type="progression",
    trigger = mode() == mode_normal &&
              current_scene() == scene_treacherous_path && prev(current_scene()) == scene_lava_ledge
)

// * W, W
// * KILL MONSTER WITH AXE

achievement("Dragon Slayer", "Kill the winged monster", 5, type="progression",
    trigger = mode() == mode_normal &&
              current_scene() == scene_winged_monster &&
              byte(0x1f05) == 1 && prev(byte(0x1f05)) == 0
)

// * E, E, E, S, S, E, E (outside), N, N, E, E, S (message), E, E, E, E, E (bridge), N, N, N, N, N (rocky walls)
// * W, W, W (door), S
// * ENTER HOLE
// * W, W, W, W, N, N, N (guard)
// * RUB AMULET

achievement("Where's My Wishes?", "Defeat the guard", 5, type="progression",
    trigger = mode() == mode_normal &&
              current_scene() == scene_castle_guard &&
              byte(0x1f01) == 0 && prev(byte(0x1f01)) == 1 &&
              item_location(item_key) == scene_castle_guard // save protection (1f01 also goes to 0 when opening door)
)

// * GET KEY
// * UNLOCK DOOR
// * MOVE TORCH
// * W, W
// * PRY STONE WITH STICK
// * N
// * PUT RAT IN LATTICE
// * S, E, N, W
// * GET CRYSTAL
// * E, E, N, N, N (where guard was)
// * OPEN DOOR
// * THROW SKULL

achievement("Is This Yours?", "Defeat the evil one", 10, type="win_condition",
    trigger = mode() == mode_normal &&
              current_scene() == scene_evil_one &&
              item_location(item_skull) == scene_nowhere && prev(item_location(item_skull)) == scene_inventory
)

// ====================================
// Normal
// ------------------------------------
// Changes: 
// - Rat south of village (instead of oil lamp)
// - Oil lamp in boathouse (instead of rat and rope)
// - Flask in Kirn's house (instead of near river)
// - Leaf is one room north
// - Rope must be taken from the docks (not lying anywhere)
// - Amulet in dark passage (instead of burial chamber)
// ------------------------------------
// * ENTER MIRROR
// * GET SCARAB
// * N
// * SAY HELLO
// * SAY YES
// * GET STICK
// * W, W, N, E
// * GET FISH
// * W, N, N, N, N, N, N, E 
// * SAY HELLO
// * GIVE FISH TO MAN
// * GET SCROLL
// * E, E
// * GET ROPE
// * S
// * GET LAMP
// * W, S, S, S, S, E
// * GET FISH
// * W, S, S, E
// * GET RAT
// * W, S, W, W, W
// * GET BLOSSOM
// * E, E, E, N
// * TIE ROPE TO TREE
// * D, W, W, N
// * GET FLASK
// * SHOW STICK
// * EAT BLOSSOM
// * GET STICK
// * S, E, E, U, S, W, W, N, N
// * FLY
// * GET AXE
// * FLY
// * FLY
// * N, N, N, N, D
// * INSERT SCARAB IN HOLE
// * (quickly!) N
// * N
// * GIVE FISH TO CAT
// * GET SKULL
// * W
// * MOVE DEBRIS
// * W
// * GET AMULET (how are you supposed to know it's here? [LOOK GROUND finds it])
// * U
// * FLY
// * S, S, S, S, S, S
// * FILL FLASK WITH WATER
// * S, S, S, W, W, W, W, W (message), S, W, S, W, N
// * BURN BUSH WITH LAMP
// * ENTER HOLE
// * W, N, N
// * GET LEAF
// * RUB LEAF ON FEET
// * POUR WATER ON LAVA
// * (quickly!) JUMP
// * W, W
// * KILL MONSTER WITH AXE
// * E, E, E, S, S, E, E (outside), N, N, E, E, S (message), E, E, E, E, E (bridge), N, N, N, N, N (rocky walls)
// * W, W, W (door), S
// * ENTER HOLE
// * W, W, W, W, N, N, N (guard)
// * RUB AMULET
// * GET KEY
// * UNLOCK DOOR
// * MOVE TORCH
// * W, W
// * PRY STONE WITH STICK
// * N
// * PUT RAT IN LATTICE
// * S, E, N, W
// * GET CRYSTAL
// * E
// * OPEN DOOR
// * E, N, N, N (where guard was)
// * OPEN DOOR
// * THROW SKULL

achievement("Still Found Everything", "Defeat the evil one on normal or random", 10,
    trigger = mode() == mode_normal && difficulty() == difficulty_normal &&
              current_scene() == scene_evil_one &&
              item_location(item_skull) == scene_nowhere && prev(item_location(item_skull)) == scene_inventory
)

// Personal best (on normal): 172 [skipping fisherman]
achievement("A Quicker Quest", "Complete the game in under 300 commands", 5,
    trigger = mode() == mode_normal &&
              current_scene() == scene_evil_one &&
              item_location(item_skull) == scene_nowhere && prev(item_location(item_skull)) == scene_inventory &&
              byte(0x1e73) == 0 && byte(0x1e72) < 3
)

// ====================================
// Random
// ------------------------------------
// Get the scarab and stick normally.
// Wander around until you find the blossom and rope, then go talk to Krin to get the flight spell.
// [NOTE: you can east the blossom without ever visiting Krim, so you don't need the rope unless an item spawns there]
// Get the fish and fly to the island to get the skull. Make sure to LOOK GROUND in the dark room.
// Continue exploring until you have the flask, axe, leaf, and lamp. Then fill the flask and go kill the dragon.
// Find the rat and the amulet, then go to the castle and finish the game normally.
// - I've had the amulet appear in the castle, and the axe on the island. You may need to do certain things
//   like kill the dragon or learn to fly before you can find everything for the next step, but I have yet to
//   encounter a random seed where it has been impossible to complete.

achievement("Who Put That There?", "Complete the game on random (no loading)", 10,
    trigger = mode() == mode_normal && is_random() &&
              current_scene() == scene_evil_one &&
              item_location(item_skull) == scene_nowhere && prev(item_location(item_skull)) == scene_inventory
)
