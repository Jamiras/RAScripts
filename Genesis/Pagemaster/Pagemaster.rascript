// Pagemaster, The
// #ID = 4381
// Hash: aafa1208e6c1f0850d091d6b20ede002 (U)
// Hash: 46b265c3ea4e739656363e5232c8c56b (E)

// video: https://youtu.be/d_H6_cNSYDU?t=42

function current_level() => word(0xFAF2)
level_torture_chamber = 0x550E          // horror, leftmost (*)
level_thats_the_spirit = 0xBDA4         // horror, first branch, upper 1
level_thats_the_spirit_portal = 0xE418
level_driving_you_batty = 0xA020        // horror, first branch, upper 2
level_a_fistful_of_horrors = 0xADDE     // horror, left side inner
level_a_fistful_of_horrors_portal = 0xE0CA
level_ghost_of_a_chance = 0x4944        // horror, first branch, lower 1 (*)
level_looking_grave = 0xD45C            // horror, first branch, lower 2
level_looking_grave_portal = 0xE478
level_haunted_house = 0x8824            // horror, left of bridge (*)
level_haunted_house_portal = 0xF5A6
level_library_phantom = 0xD4B0          // horror, right of bridge
level_expectre_the_worst = 0x68FA       // horror, second branch, upper
level_terror_in_the_tower = 0x9206      // horror, second branch, lower 1
level_terror_in_the_tower_portal = 0xDA68
level_living_read = 0xE64E              // horror, second branch, lower 2
level_spook_too_soon = 0x0E4E           // horror, right side inner
level_dread_and_gutters = 0xA0BC        // horror, right side upper right
level_dread_and_gutters_portal = 0x2062
level_horror_exit = 0x7E2E              // horror, right side right middle
level_marine_malarrey = 0x174A          // adventure, first
level_marine_malarrey_portal = 0xC03E
level_all_aboard_for_fun = 0x3118       // adventure, second
level_all_aboard_for_fun_portal = 0xC8B4
level_out_of_maritime = 0x3E5A          // adventure, third
level_irate_pirates = 0x01F2            // adventure, first branch, right (*)
level_desert_island_risks = 0xBFB4      // adventure, first branch, down 1
level_stormy_sea = 0xA2EC               // adventure, first branch, down 2
level_good_ship_donkey = 0x4E6C         // adventure, first branch, down 3
level_good_ship_donkey_portal = 0x6A76
level_naughtycal_fun = 0x9ACC           // adventure, second branch, up
level_high_seas_hijinx = 0x245A         // adventure, second branch, right
level_high_seas_hijinx_portal = 0x6E74
level_pirate_ship = 0x0EDA              // adventure, right side, upper (*)
level_pirate_ship_portal = 0x70BE
level_jewel_be_lucky = 0x5D16           // adventure, right side, upperleft
level_golden_brick_road = 0x7198        // fantasy, first
level_golden_brick_road_portal = 0x5AB4
level_pools_of_goo = 0x0946             // fantasy, second (*)
level_pools_of_goo_portal = 0xC6B2
level_beanstalk = 0x31A2                // fantasy, third
level_dragons_spleen = 0x2516           // fantasy, fourth (*)
level_belly_of_laughs = 0x2D2C          // fantasy, fifth
level_leaf_it_out = 0x3F14              // fantasy, first branch, right
level_leaf_it_out_portal = 0x54A8
level_gut_to_escape = 0x4464            // fantasy, first branch, down (*)
level_just_in_slime = 0x374A            // fantasy, right side, lower left
level_just_in_slime_portal = 0xCDC2
level_boweled_over = 0x3DA4             // fantasy, left side, lower right
level_dragons_stomach = 0x1C08          // fantasy, second branch, up
level_dragons_stomach_portal = 0x88E0
level_stalking_around = 0x4C5A          // fantasy, second branch, left 1
level_dragons_intestine = 0x4D3E        // fantasy, second branch, left 2
level_dragons_intestine_portal = 0x9030
level_end_of_the_road = 0x8030          // fantasy, second branch, left 3
level_end_of_the_road_portal = 0x8C74

level_horror_map = 0xD622
level_adventure_map = 0x9A5A
level_fantasy_map = 0xD3E0

function current_world() => byte(0xF526)
world_adventure = 5
world_horror = 6
world_fantasy = 8

level_data = {
    // ===== Horror =====
    level_torture_chamber:                  // leftmost [HAS LIBRARY CARD]
    {
        "name": "The Torture Chamber",
        "subname": "Horror 1",
        "world": world_horror, 
        "subworld": 0,
    },
    level_thats_the_spirit:                 // first branch upper
    {
        "name": "That's the Spirit",
        "subname": "Horror 2A",
        "world": world_horror, 
        "subworld": 3,
    },
    level_thats_the_spirit_portal:
    {
        "name": "That's the Spirit",
        "subname": "Horror 2A",
        "world": world_horror, 
        "subworld": 14,
    },
    level_driving_you_batty:                // first branch, upper 2
    {
        "name": "Driving You Batty",
        "subname": "Horror 3A",
        "world": world_horror, 
        "subworld": 4,
    },
    level_a_fistful_of_horrors:             // left side inner
    {
        "name": "A Fistful of Horrors",
        "subname": "Horror X",
        "world": world_horror, 
        "subworld": 2,
    },
    level_a_fistful_of_horrors_portal:
    {
        "name": "A Fistful of Horrors",
        "subname": "Horror X",
        "world": world_horror, 
        "subworld": 14,
    },
    level_ghost_of_a_chance:                // first branch, lower 1 [HAS LIBRARY CARD]
    {
        "name": "Ghost of a Chance",
        "subname": "Horror 2B",
        "world": world_horror, 
        "subworld": 1,
    },
    level_looking_grave:                    // first branch, lower 2
    {
        "name": "Looking Grave",
        "subname": "Horror 3B",
        "world": world_horror, 
        "subworld": 13,
    },
    level_looking_grave_portal:             // above coins at start of level
    {
        "name": "Looking Grave",
        "subname": "Horror 3B",
        "world": world_horror,
        "subworld": 14,
    },
    level_haunted_house:                    // left of bridge [HAS LIBRARY CARD]
    {
        "name": "The Haunted House",
        "subname": "Horror 4",
        "world": world_horror, 
        "subworld": 5,
    },
    level_haunted_house_portal:
    {
        "name": "The Haunted House",
        "subname": "Horror 4",
        "world": world_horror, 
        "subworld": 14,
    },
    level_library_phantom:                  // right of bridge
    {
        "name": "The Library Phantom",
        "subname": "Horror 5",
        "world": world_horror, 
        "subworld": 6,
    },
    level_expectre_the_worst:               // second branch, upper
    {
        "name": "Expectre the Worst",
        "subname": "Horror 6A",
        "world": world_horror, 
        "subworld": 12,
    },
    level_terror_in_the_tower:              // second branch, lower 1
    {
        "name": "Terror in the Tower",
        "subname": "Horror 6B",
        "world": world_horror, 
        "subworld": 7,
    },
    level_terror_in_the_tower_portal:
    {
        "name": "Terror in the Tower",
        "subname": "Horror 6B",
        "world": world_horror, 
        "subworld": 14,
    },
    level_living_read:                      // second branch, lower 2
    {
        "name": "The Living Read",
        "subname": "Horror 7",
        "world": world_horror, 
        "subworld": 8,
    },
    level_spook_too_soon:                   // right side inner
    {
        "name": "Spook Too Soon",
        "subname": "Horror 8",
        "world": world_horror, 
        "subworld": 9,
    },
    level_dread_and_gutters:                // right side upper right
    {
        "name": "Dread and Gutters",
        "subname": "Horror 9A",
        "world": world_horror, 
        "subworld": 11,
    },
    level_dread_and_gutters_portal:                // right side upper right
    {
        "name": "Dread and Gutters",
        "subname": "Horror 9A",
        "world": world_horror, 
        "subworld": 14,
    },
    level_horror_exit:                      // right side right middle
    {
        "name": "Final Horror", // unnamed in SNES version
        "subname": "Horror 9B",
        "world": world_horror, 
        "subworld": 10,
    },
    // ===== Adventure =====
    level_marine_malarrey:                  // first
    {
        "name": "Marine Malarrey",
        "subname": "Adventure 1",
        "world": world_adventure, 
        "subworld": 0,
    },
    level_marine_malarrey_portal:           // above stack of coins around second mast
    {
        "name": "Marine Malarrey",
        "subname": "Adventure 1",
        "world": world_adventure, 
        "subworld": 14,
    },
    level_all_aboard_for_fun:               // second
    {
        "name": "All Aboard for Fun",
        "subname": "Adventure 2",
        "world": world_adventure, 
        "subworld": 1,
    },
    level_all_aboard_for_fun_portal:
    {
        "name": "All Aboard for Fun",
        "subname": "Adventure 2",
        "world": world_adventure, 
        "subworld": 14,
    },
    level_out_of_maritime:                  // third
    {
        "name": "Out of Maritime",
        "subname": "Adventure 3",
        "world": world_adventure, 
        "subworld": 2,
    },
    level_irate_pirates:                    // first branch, right [HAS LIBRARY CARD]
    {
        "name": "Irate Pirates",
        "subname": "Adventure 4A",
        "world": world_adventure, 
        "subworld": 3,
    },
    level_desert_island_risks:              // first branch, down 1
    {
        "name": "Desert Island Risks",
        "subname": "Adventure 4B",
        "world": world_adventure, 
        "subworld": 4,
    },
    level_stormy_sea:                       // first branch, down 2
    {
        "name": "Stormy Sea",
        "subname": "Adventure 5",
        "world": world_adventure, 
        "subworld": 5,
    },
    level_good_ship_donkey:                 // first branch, down 3
    {
        "name": "Good Ship Donkey",
        "subname": "Adventure 6",
        "world": world_adventure, 
        "subworld": 6,
    },
    level_good_ship_donkey_portal:
    {
        "name": "Good Ship Donkey",
        "subname": "Adventure 6",
        "world": world_adventure, 
        "subworld": 14,
    },
    level_naughtycal_fun:                   // second branch, up
    {
        "name": "Naughtycal Fun",
        "subname": "Adventure 7A",
        "world": world_adventure, 
        "subworld": 10,
    },
    level_high_seas_hijinx:                 // second branch, right
    {
        "name": "High Seas Hijinx",
        "subname": "Adventure 7B",
        "world": world_adventure, 
        "subworld": 7,
    },
    level_high_seas_hijinx_portal:
    {
        "name": "High Seas Hijinx",
        "subname": "Adventure 7B",
        "world": world_adventure, 
        "subworld": 14,
    },
    level_pirate_ship:                      // right side, upper [HAS LIBRARY CARD]
    {
        "name": "Pirate Ship",
        "subname": "Adventure 8",
        "world": world_adventure, 
        "subworld": 8,
    },
    level_pirate_ship_portal:
    {
        "name": "Pirate Ship",
        "subname": "Adventure 8",
        "world": world_adventure, 
        "subworld": 14,
    },
    level_jewel_be_lucky:                   // right side, upperleft
    {
        "name": "Jewel Be Lucky",
        "subname": "Adventure 9",
        "world": world_adventure, 
        "subworld": 9,
    },
    // ===== Fantasy =====
    level_golden_brick_road:                // first
    {
        "name": "Golden Brick Road",
        "subname": "Fantasy 1",
        "world": world_fantasy, 
        "subworld": 0,
    },
    level_golden_brick_road_portal:
    {
        "name": "Golden Brick Road",
        "subname": "Fantasy 1",
        "world": world_fantasy, 
        "subworld": 14,
    },
    level_pools_of_goo:                     // second [HAS LIBRARY CARD]
    {
        "name": "Pools of Goo",
        "subname": "Fantasy 2",
        "world": world_fantasy, 
        "subworld": 1,
    },
    level_pools_of_goo_portal:
    {
        "name": "Pools of Goo",
        "subname": "Fantasy 2",
        "world": world_fantasy, 
        "subworld": 14,
    },
    level_beanstalk:                        // third
    {
        "name": "The Beanstalk",
        "subname": "Fantasy 3",
        "world": world_fantasy, 
        "subworld": 2,
    },
    level_dragons_spleen:                   // fourth [HAS LIBRARY CARD]
    {
        "name": "Dragon's Spleen",
        "subname": "Fantasy 4",
        "world": world_fantasy, 
        "subworld": 3,
    },
    level_belly_of_laughs:                  // fifth
    {
        "name": "Belly of Laughs",
        "subname": "Fantasy 5",
        "world": world_fantasy, 
        "subworld": 4,
    },
    level_leaf_it_out:                      // first branch, right
    {
        "name": "Leaf It Out",
        "subname": "Fantasy 6B",
        "world": world_fantasy, 
        "subworld": 5,
    },
    level_leaf_it_out_portal:
    {
        "name": "Leaf It Out",
        "subname": "Fantasy 6B",
        "world": world_fantasy, 
        "subworld": 14,
    },
    level_gut_to_escape:                    // first branch, down [HAS LIBRARY CARD]
    {
        "name": "Gut to Escape",
        "subname": "Fantasy 6A",
        "world": world_fantasy, 
        "subworld": 7,
    },
    level_just_in_slime:                    // right side, lower left
    {
        "name": "Just in Slime",
        "subname": "Fantasy 7",
        "world": world_fantasy, 
        "subworld": 6,
    },
    level_just_in_slime_portal:
    {
        "name": "Just in Slime",
        "subname": "Fantasy 7",
        "world": world_fantasy, 
        "subworld": 6,
    },
    level_boweled_over:                     // left side, lower right
    {
        "name": "Boweled Over",
        "subname": "Fantasy 8",
        "world": world_fantasy, 
        "subworld": 9,
    },
    level_dragons_stomach:                  // second branch, up
    {
        "name": "Dragon's Stomach",
        "subname": "Fantasy 9A",
        "world": world_fantasy, 
        "subworld": 8,
    },
    level_dragons_stomach_portal:
    {
        "name": "Dragon's Stomach",
        "subname": "Fantasy 9A",
        "world": world_fantasy, 
        "subworld": 8,
    },
    level_stalking_around:                  // second branch, left 1
    {
        "name": "Stalking Around",
        "subname": "Fantasy 9B",
        "world": world_fantasy, 
        "subworld": 10,
    },
    level_dragons_intestine:                // second branch, left 2
    {
        "name": "Dragon's Intestine",
        "subname": "Fantasy 10",
        "world": world_fantasy, 
        "subworld": 12,
    },
    level_dragons_intestine_portal:
    {
        "name": "Dragon's Intestine",
        "subname": "Fantasy 10",
        "world": world_fantasy, 
        "subworld": 12,
    },
    level_end_of_the_road:                  // second branch, left 3
    {
        "name": "End of the Road",
        "subname": "Fantasy 11",
        "world": world_fantasy, 
        "subworld": 11,
    },
    level_end_of_the_road_portal:
    {
        "name": "End of the Road",
        "subname": "Fantasy 11",
        "world": world_fantasy, 
        "subworld": 11,
    },
    // ===== Maps ====    
    level_horror_map:
    {
        "name": "the Horror Book",
        "subname": "",
        "world": world_horror, 
    },
    level_adventure_map:
    {
        "name": "the Adventure Book",
        "subname": "",
        "world": world_adventure,
    },
    level_fantasy_map:
    {
        "name": "the Fantasy Book",
        "subname": "",
        "world": world_fantasy, 
    }
}

has_library_card = [
    level_torture_chamber,   // horror, leftmost
    level_ghost_of_a_chance, // horror, first branch, lower 1
    level_haunted_house,     // horror, left of bridge
    level_irate_pirates,     // adventure, first branch, right
    level_jewel_be_lucky,    // adventure, right side, upper
    level_pools_of_goo,      // fantasy, second
    level_dragons_spleen,    // fantasy, fourth
    level_gut_to_escape,     // fantasy, first branch, down
]

levels = {}

for id in level_data
{
    if (length(level_data[id]["subname"]) == 0)
        levels[id] = level_data[id]["name"]
    else
        levels[id] = format("{0} ({1})", level_data[id]["name"], level_data[id]["subname"])
}

worlds = {
    world_horror: "Horror",
    world_adventure: "Adventure",
    world_fantasy: "Fantasy",
}

function current_lives() => byte(0xFAF6) + 1

function current_keys() => byte(0xFAFA)

function current_world_library_cards() => byte(0xFAFC)
function previous_world_library_cards() => byte(0xFAFE)
function current_library_cards() => current_world_library_cards() + previous_world_library_cards()

//function attract_mode() => byte(0xB818) != 0xFF
function attract_mode() => byte(0xFFFE) == 0x2C

rich_presence_conditional_display(!attract_mode(), "Richard is in {0}. {1} lives, {2} library cards",
    rich_presence_lookup("Level", current_level(), levels),
    rich_presence_value("Lives", current_lives()),
    rich_presence_value("Cards", current_library_cards())
)

rich_presence_display("Titles")

// ----------------------------------------------------------------------------

// Xbox30 controller mapping: X=A, A=B, B=C

// After entering a level, press Left, Up, Left, Up, Start, B, Right, A to enable cheats.
// In cheat mode, you can walk past any level on the world map.
//   On the map, press A to advance to the next world, or C to go back to the previous world
// When in a level, press Start, then:
//   A to get the shoes, B to get slime or C to get a sword, eyeballs, or bubbles

function without_cheating() => never(byte(0xFADC) == 1)

function current_screen() => byte(0xFB10)
screen_fixed = 2 // title cards, also world intro, continue screen and library card at end of game
screen_level = 3
screen_map = 5
screen_sublevel = 6 // in portal book
screen_bonuslevel = 8

function current_subworld() => byte(0xF528)

//                                          [   CONTINUE  CHECKPOINTS   ] [COMPLETE] [SUBWORLD]
// continue checkpoints: Torture Chamber    $FB32=0119 $FB38=382A $FB40=1 $FB46=FFFF     00
//             b1        Ghost of a Chance                                $FB5C=FFFF     01
//             u1        That's the Spirit  $FB74=01D9 $FB7A=3F00 $FB82=1 $FB88=FFFF     03
//             u2        Driving You Batty  $FB8A=0179 $FB90=5E9A $FB98=1 $FB9E=FFFF     04
//                       Horror House       $FBA0=0379 $FBA6=4534 $FBAE=1                05
function subworld_complete(subworld) => word(0xFB46 + subworld * 0x16) == 0xFFFF
function subworld_bonus_found(subworld) => word(0xFB44 + subworld * 0x16) != 0
function subworld_library_card_found(subworld) => word(0xFB42 + subworld * 0x16) != 0

function game_state() => byte(0xE084)
state_level_complete = 5
state_dying = 7
state_paused = 11

function in_a_level() => current_screen() != screen_map
function in_level(level) => current_level() == level && without_cheating()
function without_dying() => once(!in_a_level()) && never(current_lives() < prev(current_lives()))
function have_shoes() => byte(0xF532) != 0
function have_sticky_hands() => byte(0xF534) != 0
function have_weapon() => byte(0xF536) != 0
function has_item() => (have_shoes() || have_sticky_hands() || have_weapon())
function without_items() => never(has_item())
function player_x() => word(0xEFFE)

function level_complete(level) => in_level(level) && game_state() == state_level_complete
function level_complete_challenge(level) => in_level(level) && trigger_when(game_state() == state_level_complete)

function no_items_challenge(level, name, points)
{
    achievement(name, 
        "Complete '" + level_data[level]["name"] + "' without items (at start or picked up) or dying", 
        points,
        trigger = level_complete_challenge(level) && 
                  without_dying() && 
                  without_items()
    )    
}

function loot_challenge(level, target, name, points)
{
    loot = {
        world_horror: "keys",
        world_adventure: "coins",
        world_fantasy: "eggs",
    }
    
    // NOTE: current_keys() is BCD-encoded, so when it goes from 9 to 10, it goes from 0x09 (9) to 0x10 (16) [+7!]
    // so, in order to catch increments of 2, 3, or 4 in a single frame, we have to check 2/3/4 and 8/9/10.
    achievement(name, 
        format("Collect {0} {1} in '{2}'", target, loot[level_data[level]["world"]], level_data[level]["name"]),
        points,
        trigger = in_level(level) &&
                  never(game_state() == state_dying) &&        // prevent counting the reset to 0 keys when dying 
                  never(!in_a_level()) &&                      // demo protection
                  trigger_when(tally(target, 
                    current_keys() != prev(current_keys()),
                    high4(0xFAFA) == prev(high4(0xFAFA)) &&    // no carry, increment of 2 or more
                      low4(0xFAFA) - prev(low4(0xFAFA)) >= 2,
                    high4(0xFAFA) == prev(high4(0xFAFA)) &&    // no carry, increment of 3 or more
                      low4(0xFAFA) - prev(low4(0xFAFA)) >= 3,
                    high4(0xFAFA) == prev(high4(0xFAFA)) &&    // no carry, increment of 4 or more
                      low4(0xFAFA) - prev(low4(0xFAFA)) >= 4,
                    current_keys() - prev(current_keys()) >= 8, // carry, increment of 2 or more
                    current_keys() - prev(current_keys()) >= 9, // carry, increment of 3 or more
                    current_keys() - prev(current_keys()) >= 10 // carry, increment of 4 or more
                  ))
    )
}

function complete_level(level, name, points)
{
    achievement(name, 
        "Complete '" + level_data[level]["name"] + "'", 
        points,
        trigger = level_complete(level)
    )
}

// ========================================================

// "Torture Chamber" [first level]
no_items_challenge(level_torture_chamber, "Pure Torture", 5)
loot_challenge(level_torture_chamber, 70, "Torturous Keys", 5)
// has library card - jump up shaft just after the test tube shelf
// has bonus level - use sticky hands along ceiling above exit book

// "That's the Spirit" [upper 1]
// has portal - in "hidden" room in middle of map

// "Driving You Batty" [upper 2]
achievement("Flight of Fantasy", 
    "Complete 'Driving You Batty' without being dropped by Fantasy after leaving the first room", 5,
    level_complete_challenge(level_driving_you_batty) &&
    never(prev(word(0xB41E)) != 0xFFFF) && // B41E=0xFFFF when being carried.
                                           // changes to 0 on level completion frame, so have to use prev
    once(player_x() < 0x19F)               // capture player being in the first room
)

// "A Fistful of Horrors" [middle from upper 2]
// has portal - in "hidden" room below final platforms before exit
// has library card - right below exit

// "Ghost of a Chance" [lower 1]
// has library card - bottom left - near end of level drop to lowest level and traverse spikes - sticky hands help a lot

// "Looking Grave" [lower 2]
// has portal - above coins at start of level, need skull to reach it

// "Haunted House" [left of bridge]
complete_level(level_haunted_house, "Haunted House", 5)
// has library card - just before checkpoint, below far-right landing
// has portal - just after checkpoint, go all the way left, then down a bit. jump up at the edge of the cliff

// "The Library Phantom" [right side of bridge]
// has bonus level - fall through the gravestone bridge near the beginning of the level and go left

// "Expectre the Worst" [right side upper 1]
// has bonus level - go all the way across the top of the level, then drop left

// "Terror in the Tower" [right side lower 1]
// has portal - below the staircase of books at the start of the level

// "The Living Read" [right side lower 2]
loot_challenge(level_living_read, 40, "Living Keys", 5)

// "Spook Too Soon" [right side middle right]
complete_level(level_spook_too_soon, "Hyde and Seek", 5)

// "Dread and Gutters" [right side right top]
// has portal - in small room just above exit

// "Final Horror" [far right]

// ========================================================

// "Marine Malarrey" [first level]
// has portal - just past the first rope up the mast by the coins
// has bonus level: after sliding down the pole, use the pirate to wall
//                  jump to the ceiling, then work left

// "All Aboard for Fun" [second level]
// has portal book - climb up the left side of the level and jump just after the horizontal rope

// "Out of Maritime" [third level]
// has bonus level - climb all the way up the rope in the middle of the level and jump left
// upper exit for access to "Irate Pirates"
loot_challenge(level_out_of_maritime, 90, "Ninety Pieces o' Eight", 5)

// "Irate Pirates" [right from third level]
// has library card - https://youtu.be/erypdO3gT_8?t=1025

// "Castaway" [down from third level]
complete_level(level_desert_island_risks, "Castaway", 5)
// has bonus level - jump over the exit and head right

// "Stormy Sea" [across lower bridge]

// "Good Ship Donkey" [bottom middle]"
// has portal book - run right past the first rope and drop at the second. jump along the right wall

// "Nuaghtycal Fun" [up from Good Ship Donkey]

// "High Seas Hijinx" [right from Good Ship Donkey]
// has portal book - jump against left wall after sliding down the pole

// "Pirate Ship" [top middle on right side]
// has portal book - top left, jump up from horizontal rope

// "Jewel Be Lucky" [final level]
// has library card - top of the third from right mast
complete_level(level_jewel_be_lucky, "Pirate Takedown", 5)

// ========================================================

// "Golden Brick Road" [first level]
// has portal book - near the top of the level just pasty humpty dumpty

// "Pools of Goo" [second level]
// has library card - after horizontal elevator at top of level
// has portal book - climb up and left once you reach the exit

// "The Beanstalk" [third level]

// "Dragon's Spleen" [fourth level]
// has bonus level - after the first elevator, jump up the blocks to the left
// has library card - jump over the exit and sticky hands to the right

// "Belly of Laughs" [fifth level]
complete_level(level_belly_of_laughs, "More then Four Dozen", 5)

// "Leaf it Out" [right fork]
// has portal - jump up the leaves on the right side of the level

// "Gut to Escape" [left fork]
// has library card - use sticky hands to cross over to the right under the books (follow the eggs)

// "Just in Slime" [after forks merge, seventh level]
// has portal - fall off first elevator, jump at egg arrow

// "Boweled Over" [eighth level]
// for access to "Dragon's Stomach" jump over first exit, then up to elevator

// "Dragon's Stomach" [second fork upper]
// has portal - use bubbles to get to upper platforms, then drop off the leftmost one
// has bonus level - go under exit, then jump on platforms to right

// "Stalking Around" [just left of lower bridge]
// has bonus level - at first chance go up and right

// "Dragon's Intestine" [second to last level]
// has portal - drop at first elevator

// "End of the Road" [last level]
// has portal - on ledge above the big bad wolf

complete_level(level_end_of_the_road, "A Happy Ending", 10)

achievement("Bibliophile", "Complete the game with at least 8 library cards", 25,
    once(level_complete(level_end_of_the_road)) &&
    never(attract_mode()) && // reset at title screens
    // this seems to a stack variable pointing into whatever script is executing during a
    // cutscene. it increments for each line in the scrolling message, and goes to 0xA496
    // just after "YOU HAVE COMPLETED THE PAGEMASTER" reaches the middle of the screen.
    word(0xFFF0) == 0xA496 
)

function library_card_achievement(points, level)
{
    achievement("Library Card - " + level_data[level]["name"], 
        "Find the library card in '" + level_data[level]["name"] + "'", points,
        in_level(level) &&
        current_world_library_cards() > prev(current_world_library_cards())
    )    
}

library_card_achievement(5, level_torture_chamber)
library_card_achievement(5, level_a_fistful_of_horrors)
library_card_achievement(5, level_ghost_of_a_chance)
library_card_achievement(5, level_haunted_house)
library_card_achievement(5, level_irate_pirates)
library_card_achievement(5, level_jewel_be_lucky)
library_card_achievement(5, level_pools_of_goo)
library_card_achievement(5, level_dragons_spleen)
library_card_achievement(5, level_gut_to_escape)

// screen changes to bonus for 2-3 frames at the end of each level. add a delay to avoid this,
// and so we can let the player get into the level before popping the achievement
function in_bonus_level() => once(current_screen() == screen_level) &&
                             repeated(150, current_screen() == screen_bonuslevel) && 
                             never(current_screen() == screen_map)

function bonus_level_keys() => byte(0x15CC)

achievement("Horror Bonus", "Find a bonus level in the Horror world", 5,
    in_bonus_level() && current_world() == world_horror
)

achievement("Adventure Bonus", "Find a bonus level in the Adventure world", 5,
    in_bonus_level() && current_world() == world_adventure
)

achievement("Fantasy Bonus", "Find a bonus level in the Fantasy world", 5,
    in_bonus_level() && current_world() == world_fantasy
)

achievement("A Safe Flight", "Reach the end of a bonus level to earn an extra life", 5,
    prev(current_screen()) == screen_bonuslevel && // lives increment in the frame where this changes from 8 -> 2
    current_lives() > prev(current_lives())
)

achievement("Bonus Collector", "Collect at least 20 keys/coins/eggs in a bonus level", 5,
    in_bonus_level() && measured(bonus_level_keys() >= 20, when=current_screen() == screen_bonuslevel)
)


function find_portal_book(world) => current_world() == world &&
                                    without_cheating() &&
                                    in_a_level() &&
                                    byte(0xE085) == 4
    
achievement("Horror Appendix", "Find and enter a portal book in the Horror world", 5,
    find_portal_book(world_horror)
)

achievement("Adventure Appendix", "Find and enter a portal book in the Adventure world", 5,
    find_portal_book(world_adventure)
)

achievement("Fantasy Appendix", "Find and enter a portal book in the Fantasy world", 5,
    find_portal_book(world_fantasy)
)

achievement("Extra Reserved", "Have more than 9 extra lives", 5,
    in_a_level() && current_lives() > 9 && prev(current_lives()) <= 9 && current_lives() < 20
)

function start_world(world) => current_world() == world && !subworld_complete(0)
function without_continuing() => never(word(0xFAF6) == 0xFFFF) // out of lives

achievement("Horror Page-Turner", "Complete the Horror world without continuing", 5,
    once(start_world(world_horror)) &&
    without_continuing() &&
    level_complete(level_horror_exit)
)

achievement("Adventure Page-Turner", "Complete the Adventure world without continuing", 10,
    once(start_world(world_adventure)) &&
    without_continuing() &&
    level_complete(level_jewel_be_lucky)
)

achievement("Fantasy Page-Turner", "Complete the Fantasy world without continuing", 10,
    once(start_world(world_fantasy)) &&
    without_continuing() &&
    level_complete(level_end_of_the_road)
)

achievement("Cover to Cover", "Complete all three worlds without continuing", 25,
    once(start_world(world_horror)) &&
    without_continuing() &&
    level_complete(level_end_of_the_road)
)
