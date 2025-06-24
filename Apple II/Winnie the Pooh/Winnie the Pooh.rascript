// Winnie the Pooh in the Hundred Acre Wood
// #ID = 32905

// MD5: 48d5a95911742c869ce8a93086f87072 - Winnie the Pooh in the Hundred Acre Wood disk 1.woz
// MD5: eac803c863cd1fc78f21b666b30f618d - Winnie the Pooh in the Hundred Acre Wood disk 2.woz

function current_scene() => byte(0x090b)
scene_hill = 0x01
scene_picnic_table = 0x02
scene_north_pole = 0x03
scene_bee_tree = 0x04
scene_rocks = 0x05
scene_kanga_outside = 0x06
scene_roo = 0x07
scene_rabbit_garden = 0x08
scene_rabbit_outside = 0x09
scene_rabbit_back_door = 0x0a
scene_thoughtful_spot = 0x0b
scene_six_pines = 0x0c
scene_dead_tree = 0x0d
scene_trees = 0x0e
scene_christopher_robin_outside = 0x0f
scene_pooh_outside = 0x10
scene_heffalump_outside = 0x11
scene_log = 0x12
scene_owl_below = 0x13
scene_lunch_break = 0x14
scene_piglet_outside = 0x15
scene_woozle_bush = 0x16
scene_forest = 0x17
scene_lovely_spot = 0x18
scene_galleons_lap = 0x19
scene_floody_place = 0x1a
scene_bridge = 0x1b
scene_playroom = 0x1c
scene_nothing = 0x1d
scene_eeyore_outside = 0x1e
scene_bee_tree_top = 0x1f
scene_kanga_inside = 0x20
scene_rabbit_inside = 0x21
scene_rabbit_kitchen = 0x22
scene_rabbit_hole_left = 0x23
scene_rabbit_hole_right = 0x24
scene_rabbit_tunnel = 0x25
scene_christopher_robin_inside = 0x26
scene_pooh_inside = 0x27
scene_pooh_bedroom = 0x28
scene_pooh_kitchen = 0x29
scene_pooh_stairs = 0x2a
scene_pooh_hiding_place = 0x2b
scene_owl_door = 0x2c
scene_owl_inside = 0x2d
scene_owl_dining_room = 0x2e
scene_piglet_door = 0x2f
scene_piglet_inside = 0x30
scene_eeyore_inside = 0x31
scene_kanga_dresser = 0x32
scene_heffalump_inside = 0x33
scene_heffalump_inside_lit = 0x34
scene_owl_ladder = 0x35
scene_bridge_below = 0x36
scene_bridge_above = 0x37
scene_playroom_chest = 0x38
scene_dead_tree_top = 0x39
scene_party = 0x3a
scene_mist = 0x3b
scene_rabbit_hole_right_lit = 0x3c
scene_tigger = 0x3d
scene_bridge_above_repaired = 0x3e

scenes = {
    scene_bee_tree: "Climbing the bee tree",
    scene_bee_tree_top: "Climbing the bee tree",
    scene_bridge: "At the bridge",
    scene_bridge_above: "At the bridge",
    scene_bridge_above_repaired: "At the bridge",
    scene_bridge_below: "At the bridge",
    scene_christopher_robin_inside: "At Christopher Robin's tree house",
    scene_christopher_robin_outside: "At Christopher Robin's tree house",
    scene_dead_tree: "At a dead tree",
    scene_dead_tree_top: "Climbing a tree",
    scene_eeyore_inside: "At Eeyore's house",
    scene_eeyore_outside: "At Eeyore's house",
    scene_floody_place: "At the floody place",
    scene_forest: "In a forest",
    scene_galleons_lap: "At Galleon's Lap",
    scene_heffalump_inside: "At the heffalump pit",
    scene_heffalump_inside_lit: "At the heffalump pit",
    scene_heffalump_outside: "At the heffalump pit",
    scene_hill: "On a hill",
    scene_kanga_dresser: "At Kanga's house",
    scene_kanga_inside: "At Kanga's house",
    scene_kanga_outside: "At Kanga's house",
    scene_log: "At a log",
    scene_lovely_spot: "At a lovely spot",
    scene_lunch_break: "In a clearing",
    scene_mist: "Lost in the mist",
    scene_north_pole: "At the north pole",
    scene_nothing: "At a lake",
    scene_owl_below: "At Owl's house",
    scene_owl_dining_room: "At Owl's house",
    scene_owl_door: "At Owl's house",
    scene_owl_inside: "At Owl's house",
    scene_owl_ladder: "At Owl's house",
    scene_party: "Celebrating with friends",
    scene_picnic_table: "At the picnic table",
    scene_piglet_outside: "At Piglet's house",
    scene_piglet_door: "At Piglet's house",
    scene_piglet_inside: "At Piglet's house",
    scene_playroom: "In the playroom",
    scene_playroom_chest: "In the playroom",
    scene_pooh_bedroom: "At Pooh's house",
    scene_pooh_hiding_place: "At Pooh's house",
    scene_pooh_inside: "At Pooh's house",
    scene_pooh_kitchen: "At Pooh's house",
    scene_pooh_outside: "At Pooh's house",
    scene_pooh_stairs: "At Pooh's house",
    scene_rabbit_back_door: "At Rabbit's house",
    scene_rabbit_garden: "At Rabbit's garden",
    scene_rabbit_hole_left: "At Rabbit's garden",
    scene_rabbit_hole_right: "At Rabbit's garden",
    scene_rabbit_hole_right_lit: "At Rabbit's garden",
    scene_rabbit_inside: "At Rabbit's house",
    scene_rabbit_kitchen: "At Rabbit's house",
    scene_rabbit_outside: "At Rabbit's house",
    scene_rabbit_tunnel: "At Rabbit's garden",
    scene_rocks: "At a bunch of rocks",
    scene_roo: "At Roo's sandy pit",
    scene_six_pines: "At a clump of pine trees",
    scene_thoughtful_spot: "At Pooh's thoughtful spot",
    scene_tigger: "Bouncing with Tigger",
    scene_trees: "Among some trees",
    scene_woozle_bush: "At the woozle bush",
}

function items_returned() => byte(0x0a28)

function item_held() => byte(0x0a2c)
item_broom          = 0x02
item_mop            = 0x03
item_knitting       = 0x04
item_toy_shovel     = 0x05
item_toy_pail       = 0x06
item_baby_scarf     = 0x07
item_carrots        = 0x08
item_turnips        = 0x09
item_hoe            = 0x0a
item_rake           = 0x0b
item_umbrella       = 0x0c
item_toy_drum       = 0x0d
item_blue_crayon    = 0x0e
item_honeypot       = 0x0f
item_fluff          = 0x10
item_flowers        = 0x11
item_lantern        = 0x12
item_books          = 0x13
item_sticks         = 0x14
item_board          = 0x15
item_basket         = 0x16
item_tail           = 0x17
item_rain_cloud     = 0x18
item_popped_balloon = 0x19
item_small_scarf    = 0x1a
item_green_balloon  = 0x1b
item_tiny_mittens   = 0x1c
item_carrot_sign    = 0x1d
item_tablecloth     = 0x1e
item_coat           = 0x1f
item_rain_boots     = 0x20
item_blue_balloon   = 0x21
item_orange_balloon = 0x22
item_apron          = 0x23
item_mirror         = 0x24
item_pine_cones     = 0x25
item_thistle        = 0x26
item_pooh_coo_clock = 0x27
item_turnips_sign   = 0x28

item_names = {
    item_apron:          "an apron",               // => kanga (a2)
    item_baby_scarf:     "a scarf",                // => roo (b2)
    item_basket:         "a basket",               // => picnic table (b1)
    item_blue_crayon:    "a blue crayon",          // => christopher robin (e3)
    item_blue_balloon:   "a blue balloon",         // => christopher robin (e3)
    item_board:          "a board",                // => bridge (b6)
    item_books:          "some books",             // => owl (d4)
    item_broom:          "a broom",                // => kanga (a2)
    item_carrot_sign:    "a carrot sign",          // => rabbit (d2)
    item_carrots:        "some carrots",           // => rabbit (d2)
    item_coat:           "a coat",                 // => christopher robin (e3)
    item_flowers:        "a bunch of flowers",     // => pooh (a4)
    item_fluff:          "a piece of fluff",       // => pooh (a4)
    item_green_balloon:  "a green balloon",        // => piglet (a5)
    item_honeypot:       "a honeypot",             // => pooh (a4)
    item_hoe:            "a hoe",                  // => rabbit (d2)
    item_lantern:        "a lantern",              // => owl (d4)
    item_knitting:       "someone's knitting",     // => kanga (a2)
    item_mirror:         "a mirror",               // => pooh (a4)
    item_mop:            "a mop",                  // => kanga (a2)
    item_orange_balloon: "an orange balloon",      // => pooh (a4)
    item_pine_cones:     "some pine cones",        // => bridge (b6)
    item_pooh_coo_clock: "a Pooh-Coo clock",       // => pooh (a4)
    item_popped_balloon: "a popped balloon",       // => eeyore (e6)
    item_rain_boots:     "rain boots",             // => christopher robin (e3)
    item_rain_cloud:     "a rain cloud",           // => eeyore (e6)
    item_rake:           "a rake",                 // => rabbit (d2)
    item_small_scarf:    "a scarf",                // => piglet (a5)
    item_sticks:         "some sticks",            // => bridge (b6)
    item_tablecloth:     "a tablecloth",           // => picnic table (b1)
    item_tail:           "Eeyore's tail",          // => eeyore (e6)
    item_thistle:        "a thistle",              // => eeyore (e6)
    item_tiny_mittens:   "a tiny pair of mittens", // => roo (b2)
    item_toy_drum:       "a toy drum",             // => christopher robin (e3)
    item_toy_pail:       "a toy pail",             // => roo (b2)
    item_toy_shovel:     "a toy shovel",           // => roo (b2)
    item_turnips:        "several turnips",        // => rabbit (d2)
    item_turnips_sign:   "a turnips sign",         // => rabbit (d2)
    item_umbrella:       "an umbrella",            // => christopher robin (e3)
}

// christopher robin has 6 items
// rabbit has 6 items
// pooh has 6 items
// kanga has 4 items
// roo has 4 items
// eeyore has 4 items
// bridge has 3 items
// picnic table has 2 items
// owl has 2 items
// piglet has 2 items

function scene_loaded() => byte(0xaa52) == 2

plural_lookup = {
    1: "",
}

rich_presence_conditional_display(current_scene() > 0x40, "Loading")

rich_presence_conditional_display(item_held() == 0, "{0}. {1} item{2} returned.",
    rich_presence_lookup("Scene", current_scene(), scenes, fallback="In the hundred-acre woods"),
    rich_presence_value("Number", items_returned()),
    rich_presence_lookup("Plural", items_returned(), plural_lookup, fallback="s")
)

rich_presence_display("{0}, carrying {1}. {2} item{3} returned.",
    rich_presence_lookup("Scene", current_scene(), scenes, fallback="In the hundred-acre woods"),
    rich_presence_lookup("Item", item_held(), item_names),
    rich_presence_value("Number", items_returned()),
    rich_presence_lookup("Plural", items_returned(), plural_lookup, fallback="s")
)

// these achievement titles all come from the "Blustery Day" transcript, except the tree climbing one,
// which is from "The Honey Tree", which came out two years earlier.

achievement("Oh, Bother", "Return an item to Winnie the Pooh", 3,
    trigger = current_scene() == scene_pooh_inside &&
              items_returned() > prev(items_returned())
)

achievement("That's a Very Good Idea", "Return an item to Christopher Robin", 3,
    trigger = current_scene() == scene_christopher_robin_inside &&
              items_returned() > prev(items_returned())
)

achievement("Right Through My Rutabaga Patch", "Return an item to Rabbit", 3,
    trigger = current_scene() == scene_rabbit_inside &&
              items_returned() > prev(items_returned())
)

achievement("Oh My Goodness!", "Return an item to Kanga", 3,
    trigger = current_scene() == scene_kanga_inside &&
              items_returned() > prev(items_returned())
)

achievement("Look, Mama!", "Return an item to Roo", 3,
    trigger = current_scene() == scene_roo &&
              items_returned() > prev(items_returned())
)

// one of eeyores items (popped balloon) sets 0x0a36 (piglet flag). 
// most set 0x0a35. as a result, both eeyore and piglet can only watch
// for items being returned in their location
achievement("Thanks For Noticin' Me", "Return an item to Eeyore", 3,
    trigger = current_scene() == scene_eeyore_inside &&
              items_returned() > prev(items_returned())
)

achievement("Oh Dear. Oh Dear, Dear!", "Return an item to Piglet", 4,
    trigger = current_scene() == scene_piglet_inside &&
              items_returned() > prev(items_returned())
)

achievement("Just a Mild Spring Zephyr", "Return an item to Owl", 4,
    trigger = current_scene() == scene_owl_inside &&
              items_returned() > prev(items_returned())
)

achievement("As He Climbed, He Hummed a Little Hum", "Climb four different trees in one playthrough", 4,
    trigger = scene_loaded() && 
              measured(tally(4, 
                  once(current_scene() == scene_bee_tree_top),
                  once(current_scene() == scene_dead_tree_top),
                  once(current_scene() == scene_owl_door),
                  once(current_scene() == scene_bridge_above || current_scene() == scene_bridge_above_repaired)
              )) && never(current_scene() > 0x40)
)

// talk to Pooh a couple times to get into his kitchen, then go up the stairs.
achievement("I Must Rescue My Supper", "Find Pooh's secret honey-hiding place", 5,
    trigger = current_scene() == scene_pooh_hiding_place &&
              scene_loaded()
)

achievement("I'd Think About Skedaddling Out of Here", "Take the lantern into one of the dark holes", 5, type="missable",
    trigger = item_held() == item_lantern && 
              scene_loaded() && (
                  current_scene() == scene_rabbit_hole_right_lit ||
                  current_scene() == scene_heffalump_inside_lit
              )
)

achievement("This Party is a Hero Party", "Celebrate returning all the lost items", 10, type="win_condition",
    trigger = current_scene() == scene_party &&
              scene_loaded() &&
              items_returned() == 10
)


