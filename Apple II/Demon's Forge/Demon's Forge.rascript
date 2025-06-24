// The Demon's Forge
// #ID=32722
// MD5: d1e28255dcaa07d4f8291639bec84d2b (woz-a-day) [1983 re-release]

// Original 1981 manual: https://www.mocagh.org/firstera/demonforgesaber.pdf (Saber Software, different boxart)
// Boone 1983 re-release manual: https://www.mocagh.org/firstera/demonforgeboone-manual.pdf
// LaunchBox says the original release was Jan 24 1981 

function game_state() => byte(0x0051)
state_input = 0
state_save_load = 0x2e
state_victorious = 0x37
state_title = 0xc0

function saving() => game_state() == state_save_load


function current_scene() => byte(0x92e3)
scene_title = 0
scene_entrance = 1
scene_entryway = 2
scene_long_cave = 3
scene_chest_interior = 4
scene_sleeping_quarters = 5
scene_armory = 6
scene_alchemist = 7
scene_junction_route_doorway = 8
scene_skinny_man = 9
scene_junction_route = 10
scene_bird_head = 11
scene_great_hall = 13
scene_old_well = 14
scene_laboratory = 15
scene_brazier = 16
scene_oaken_doors = 18
scene_assassin = 19
scene_well_bottom = 20
scene_trick_room = 21
scene_trick_room2 = 22
scene_sleeping_quarters_open_chest = 23
scene_trick_room3 = 24
scene_trick_room4 = 25
scene_assassin_dead = 26
scene_trick_room_stop = 27
scene_magician = 28
scene_east_hallway = 29
scene_east_hallway2 = 30
scene_waterfall = 31
scene_rubber_door = 32
scene_smithy = 33
scene_beautiful_view = 34
scene_mirrors = 35
scene_oaken_doors_open = 36
scene_rubber_door_melted = 37
scene_altar_moved = 38
scene_antechamber_door_closed = 39
scene_crypt_door_open = 40
scene_garden = 41
scene_guardroom = 42
scene_guard_sleeping_quarters = 43
scene_den = 44
scene_training_room = 45
scene_intersection = 46
scene_north_passage = 47
scene_floor_door_open = 48
scene_archway = 49
scene_evil_bridge_broken = 51
scene_broken_mirrors = 52
scene_old_man = 53
scene_library = 54
scene_robing_room = 55
scene_floor_door = 56
scene_staves = 57
scene_intersection_elements = 58
scene_ore_hopper = 59
scene_torch = 60
scene_glass_room = 61
scene_old_fountain = 62
scene_dropoff = 63
scene_ice = 64
scene_evil_bridge = 65
scene_spheres = 66
scene_torture_chamber = 67
scene_altar = 68
scene_antechamber = 69
scene_jail = 70
scene_ledge = 71
scene_pillars = 72
scene_river = 73
scene_crypt = 74
scene_anarakull = 75

// MBF32 comparison with an integer will compare to a really high positive integer.
// force this to explicitly be a float.
scene_inventory = -1.0 

scenes = {
    scene_entrance: "At the entrance of the cave",
    scene_entryway: "In the entryway",
    scene_long_cave: "In a long cave",
    scene_sleeping_quarters: "In someone's sleeping quarters",
    scene_sleeping_quarters_open_chest: "In someone's sleeping quarters",
    scene_chest_interior: "In someone's sleeping quarters",
    scene_armory: "In an armory",
    scene_junction_route: "At a junction route",
    scene_junction_route_doorway: "At a junction route",
    scene_skinny_man: "In the skinny man's room",
    scene_bird_head: "At the bird head statue",
    scene_alchemist: "In the alchemist's room",
    scene_great_hall: "In the great hall",
    scene_old_well: "At the old well",
    scene_brazier: "At the brazier",
    scene_oaken_doors: "At the old well",
    scene_laboratory: "In the laboratory",
    scene_assassin: "In the assassin's room",
    scene_assassin_dead: "In the assassin's room",
    scene_oaken_doors_open: "At the old well",
    scene_well_bottom: "In the old well",
    scene_trick_room: "In the trick room",
    scene_trick_room2: "In the trick room",
    scene_trick_room3: "In the trick room",
    scene_trick_room4: "In the trick room",
    scene_trick_room_stop: "In the trick room",
    scene_magician: "In the magician's room",
    scene_east_hallway: "In a passageway",
    scene_east_hallway2: "In a passageway",
    scene_waterfall: "At a waterfall",
    scene_rubber_door: "At the rubber door",
    scene_rubber_door_melted: "At the rubber door",
    scene_smithy: "In the smithy",
    scene_beautiful_view: "At a beautiful view",
    scene_mirrors: "In a mirrored room",
    scene_broken_mirrors: "In a mirrored room",
    scene_guardroom: " In the guardroom",
    scene_garden: "In the garden",
    scene_guard_sleeping_quarters: " In the guard's sleeping quarters",
    scene_den: "In the den",
    scene_training_room: "In the training room",
    scene_intersection: "At an intersection",
    scene_library: "In the library",
    scene_archway: "At an archway",
    scene_north_passage: "In a passageway",
    scene_old_man: "In the old man's room",
    scene_robing_room: "In the robing room",
    scene_staves: "In the room of staves",
    scene_floor_door: "At a wooden door",
    scene_floor_door_open: "At a wooden door",
    scene_intersection_elements: "At an intersection",
    scene_ore_hopper: "At an ore hopper",
    scene_torch: "In the torch room",
    scene_glass_room: "In the glass room",
    scene_old_fountain: "At the old fountain",
    scene_dropoff: "At a dropoff",
    scene_ice: "In an ice room",
    scene_evil_bridge: "At the evil bridge",
    scene_spheres: "In the room of spheres",
    scene_evil_bridge_broken: "At the evil bridge",
    scene_torture_chamber: "In the torture chamber",
    scene_altar: "At an altar",
    scene_altar_moved: "At an altar",
    scene_antechamber: "In the antechamber",
    scene_antechamber_door_closed: "In the antechamber",
    scene_jail: "In the jail",
    scene_ledge: "On a ledge",
    scene_pillars: "In the chamber of pillars",
    scene_river: "In the room with a river running through it",
    scene_crypt: "In an ancient crypt",
    scene_crypt_door_open: "In an ancient crypt",
    scene_anarakull: "Confronting Anarakull",
}

rich_presence_conditional_display(game_state() == state_title, "Titles")

rich_presence_display("{0}",
    rich_presence_lookup("Scene", current_scene(), scenes, fallback="In places unknown")
)

// pointers found:
// 006B: +0x0065 -> inventory
// 006D: -0x0129 -> inventory
// 0094: +0x0000 -> inventory
// each inventory item is an MBF40 indicating the room where the item is at, or -1 if the item is in the inventory.

// The game won't let you hold more than seven items at a time (eight if you count the birthday suit)
function item_location(index) => mbf32(word(0x0094) + index * 5)
item_wand = 1             // magician's room
item_costume = 2          // entryway
item_rod = 3              // skinny man's room (trade for rations)
item_vial = 4             // entryway (in costume)
item_gem = 6              // bird statue (insert rod)
item_ashes = 7            // sleeping quarters (behind trunk)
item_blanket = 8          // sleeping quarters (in trunk)
item_pillow = 9           // sleeping quarters (in trunk)
item_axe = 10             // smithy
item_rations = 11         // start with (trade for rod)
item_key = 12             // jail
item_carrot = 13          // garden (buried)
item_hat = 14             // magician's room (must give water to rabbit first)
item_platinum_sphere = 15 // sphere room
item_silver_sphere = 16   // sphere room
item_gold_sphere = 17     // sphere room
item_boots = 18           // den
item_pendant = 19         // den
item_first_stave = 20     // staves room
item_second_stave = 21    // staves room
item_third_stave = 22     // staves room
item_fourth_stave = 23    // staves room
item_elemental = 24       // brazer (burn ashes)
item_t = 25               // [??]
item_bottle = 26          // glass room
item_mound_of_dirt = 27   // staves room (dug from ceiling)
item_shovel = 28          // staves room (first staff transformed)

function item_achievement(title, description, points, scene, item, type="progression")
{
    achievement(title, description, points, type=type,
        trigger = current_scene() == scene && !saving() &&
                  item_location(item) == scene_inventory &&
                  prev(item_location(item)) != scene_inventory    
    ) 
}


function scene_achievement(title, description, points, previous_scene, new_scene, type="progression")
{
    achievement(title, description, points, type=type,
        trigger = current_scene() == new_scene && !saving() &&
                  prev(current_scene()) == previous_scene    
    ) 
}

// > NORTH
// > LOOK COSTUME
// > GET VIAL [poison antidote for assassin]

// > WEST, WEST
// > PUSH CHEST
// > GET BAG [summons fire elemental]
// > OPEN CHEST
// > LOOK CHEST
// > GET PILLOW [softens jump]
// > GET BLANKET [extinguishes fire]

// > EAST, EAST, EAST, EAST
// > FOLLOW MAN
// > EAST
//   {SAVE 1}
// > GIVE RATION (get rod) [to pry gem]

item_achievement("Feeding the Hungry", "Trade for the Rod", 5, scene_skinny_man, item_rod)

// > WEST, NORTH
// > INSERT ROD
// > GET GEM [control fire elemental]

// > SOUTH, SOUTH, WEST, WEST, NORTH, NORTH, EAST
// > BURN BAG (get fire elemental) [evaporates water]

// > WEST, NORTH
// > OPEN DOOR (element burns door)
//   {SAVE 2}
// > KILL ASSASSIN (with what - must just try to strangle him)
// > DRINK VIAL
// > KILL ASSASSIN

scene_achievement("Second Time's the Charm", "Defeat the assassin", 5, scene_assassin, scene_assassin_dead)

// > SEARCH ASSASSIN
// > GET CHIME [opens door in bottom of well]

// > SOUTH
// > SOUTH
// > GET WATER (fills now-empty vial)
//   {SAVE 3}
// > ENTER WELL (elemental evaporates water - you have 3 turns to get the door open!)
// > RING CHIME

scene_achievement("Going Deeper", "Make it to the second part of the dungeon", 5, scene_well_bottom, scene_trick_room)

// > GO LEFT
// > GO RIGHT
// > GO RIGHT
// > GO RIGHT
// > GO RIGHT
// > GO RIGHT

scene_achievement("Following Directions", "Make it through the trick room", 2, scene_trick_room3, scene_trick_room_stop)

// > NORTH
// > GIVE WATER, RABBIT (the rabbit will bite you after a couple commands - including moving commands)
// > GET WAND [casts fireball]
//   - The hat is not needed

// > EAST, EAST, NORTH
// > USE WAND [to melt door] (sets carpet on fire)
//   - after a couple commands [including movement] the flames will engulf you
// > SMOTHER FIRE [with blanket]

// > NORTH
// > GET AXE [to break mirrors]

// > SOUTH, SOUTH, WEST, WEST, NORTH, NORTH
//   - moving any direction in the mirrored room teleports you to another one of the mirrored rooms, but you
//     can never get out without breaking the mirrors.
//   {SAVE 4}
// > BREAK MIRRORS [with axe]
// > DROP WAND (done with it)
// > DROP VIAL (done with it)
// > DROP CHIME (done with it)
// > DROP GEM (done with it)
// > DROP AXE (done with it)
//   - if you check your inventory (I), you should only have the pillow and your birthday suit.
//   - now you can wander around the mirrored rooms without being teleported, but you still have to find your way
//     out. just keep trying to go NORTH, and if you can't, go do east or west and try again. If you haven't already
//     wandered around the maze, you can just go:
// > EAST, NORTH, WEST, NORTH

scene_achievement("Shattered", "Make it through the mirror maze", 5, scene_broken_mirrors, scene_guardroom)

// > WEST
// > DIG (apparently you just claw about with your hands)
// > GET CARROT

// > EAST, EAST
// > CLIMB LADDER
// > GET BOOTS
// > GET PENDANT

// > CLIMB DOWN
// > EAST, EAST
//   - There's a library east of here with 78 books. The only one of interest is #51, which is a story of a man
//     who wasted his life reading books in the library.
//   - Down the west hall (and I mean WAY down the west hall) is an old man. All he has to say is "read any good
//     book lately?"
// > NORTH, NORTH
//   {SAVE 5}
// > LOOK PENDANT (gives clue about what to do in this room)
// > GET FIRST STAFF (becomes shovel)
// > WEAR BOOTS (float to ceiling)
// > DIG ROOF
// > GET DIRT

// > WEST, WEST
// > OPEN DOOR

// > D (why doesn't 'down', 'climb down', or 'enter hole' work?), NORTH
// > FILL HOPPER (get teleported back to staff room)
// > GET SECOND STAFF

// > WEST, WEST, D, WEST
// > BURN SECOND STAFF (get teleported back to staff room)
// > GET THIRD STAFF

// > WEST, WEST, D, SOUTH
// > GET BOTTLE

// > NORTH, EAST
// > THROW THIRD STAFF (into the fountain)
// > READ BOTTOM (of fountain) (get teleported back to staff room)

//   {SAVE 6}
// > FILL BOTTLE, AIR (if you try to get the staff first, you get hit with lightning)
// > GET FOURTH STAFF
// > DROP FOURTH STAFF
// > DROP PENDANT (done with it)
// > DROP BOOTS (done with them)
// > DROP SHOVEL (done with it)

// > EAST

// - for some reason, going east from the staves room briefly touches the spheres room before actually loading
//   the dropoff room.
scene_achievement("The Elemental Staves", "Make it past the staff guardian", 5, scene_staves, scene_spheres)

// > THROW PILLOW
// > NORTH

// > NORTH, EAST
// > MOVE ALTAR

// > EAST
// > CLOSE DOOR

// > NORTH
// > GET KEY

// > SOUTH, SOUTH
//   {SAVE 7}
// > EAT CARROT (automatically read sign)

achievement("Instant Eyesight Improvement", "Read the writing on the cliff wall", 3, type="missable",
    trigger = current_scene() == scene_ledge && !saving() &&
              item_location(item_carrot) == 0 &&
              prev(item_location(item_carrot)) == scene_inventory    
) 
    
// > NORTH, WEST, WEST, SOUTH

// Drop everything from your inventory (type I to view inventory)
// > DROP BOTTLE (done with it)
// > DROP KEY (will retrieve it later)

// > WEST, WEST
// > GET PLATINUM SPHERE
// > GET GOLD SPHERE
// > GET SILVER SPHERE
//   {SAVE 8}
// > JUGGLE SPHERES

// > EAST, EAST
// - If you haven't dropped everything but the spheres, or aren't juggling them, the bridge will collapse 
//   and kill the player. Otherwise, it just collapses behind you.

// - the transition to the broken bridge goes through the normal bridge room after leaving the sphere room.
scene_achievement("Light on Your Feet", "Make it out of the sphere room alive", 5, 
                  scene_evil_bridge, scene_evil_bridge_broken)

// > GET KEY

// > NORTH, NORTH, NORTH
// > THROW KEY
// > SWIM
// > GET KEY
//   {SAVE 9}
// > UNLOCK DOOR

scene_achievement("The Final Door", "Unlock the door to Anarakull's chamber", 5, scene_crypt, scene_crypt_door_open)

// > EAST
// - You only get three actions. Make them count! (And, yes, saving counts as one of them)
// > THROW SILVER SPHERE
// > THROW GOLD SPHERE
// > THROW PLATINUM SPHERE

// 49d45e00 -> throw silver
// 51318100 -> throw gold
// 51318200 -> throw platinum
// 51318240

achievement("Well Done, Champion", "Defeat Anarakull", 10, type="win_condition",
    trigger = current_scene() == scene_anarakull && !saving() &&
              byte(0x0033) == 0x00 && prev(byte(0x0033)) == 0x06
) 
