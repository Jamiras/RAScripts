// King's Quest I
// #ID=14398
//
// These hashes are for the woz-a-day version
// MD5: 38027dd56819f2a03c5945179866332a (side A)
// MD5: ad6f0b49d6777a4baa9fa645be8f8c72 (side B)
// MD5: 3df2f894d07e22b18631053d7dd3d00a (side C)
//
// These hashes appear to be a non-cracked version, labeled "King Quest (1983)(Sierra)(Disk 1 of 3)[nib]"
// The set was developed using these hashes
// MD5: ebb389599debac2b554c431bfb0f919c (side A)
// MD5: 6a2bd8ce8b19436d2ce455b751aadb31 (side B)
// MD5: 1895ddb08c2068a66f9df3765a29f5bf (side C)
//
// These hashes are for the Apple II GS version on apple2online
// They match the blade cracked version for sides B and C
// MD5: 13a81608986755022e048338450afb1a (side A)
// MD5: c7d0d8e28da4c4ee93ef059230260c62 (side B)
// MD5: c5c91d02d70478080f376e280592db9d (side C)
//
// These hashes are for the blade cracked version:
// MD5: 34f8869a6f033195023d3b60ce814ecd (side A)
// MD5: c7d0d8e28da4c4ee93ef059230260c62 (side B)
// MD5: c5c91d02d70478080f376e280592db9d (side C)
//
// These hashes are for the 4am cracked version:
// MD5: 5ce474d9ee686f66ffff6e6f26a90418 (side A)
// MD5: 0abf79679eb7d33ccae220ab9229cb27 (side B)
// MD5: f4c6c8c11e3fab4fc22e44be3c535f67 (side C)
//
// The blade and 4am cracked versions share the data in the lower addresses (score, location), but have alternate
// addresses for the important stuff (event flags, inventory), so are currently not compatible.
// BOW TO KING: 4am, GS, blade: $6E88 and $6ECD. original $6E76 and $6EBB
// it appears that there are extra 0s in the region between $6E00 and $6E20. I believe th
// as such, we could detect the 0x15D at $6E16
function is_original() => word(0x6F42) == 0x0098
function is_cracked() => word(0x6F54) == 0x0098

// $003C seems to be a pointer to the transplanteddata ($06D64 in original, $6D76 in the cracked versions)
// but it occasionally changes to 0x9800 during scene transitions
function make_pointer(address) => word(0x003C) + (address - 0x6D64)
function pointed_at_byte(address) => byte(make_pointer(address))

// ========================================================

// SEMI    UP    APOSTROPHE      1 Save      Ctrl+E repeat
// LEFT    +     RIGHT           3 Restore   Ctrl+C cancel
// PERIOD  DOWN  SLASH           5 Restart
//
// LEFTALT=swim   RIGHTALT=jump  EQUAL=duck

// ========================================================

// ITEMS
// -----
// 1  Dagger         8   Fourleaf Clover     15  Pouch of Diamonds   21  Shield
// 2  Chest          9   Ceramic Bowl        16  Pouch               22  Fiddle
// 3  Carrot         10  Full Bowl           17  Sceptre             23  Walnut
// 4  Gold Walnut    11  Water Bucket        18  Cheese              24  Mushroom
// 5  Key            12  Full Bucket         19  Magic Mirror        25  Beans
// 6  Note           13  Pebbles             20  Gold Egg            26  Water
// 7  Magic Ring     14  Leather Slingshot   21  Shield
// 
// 
// LOCATIONS
// ---------
// 1   Castle exterior east side            41  Bridge north from the gnome
// 2   Castle exterior west side            42  Bridge south-west from the trunk
// 3   Dagger below the rock                43  Lake south from the stump
// 4   Lake west from the rock              44  Woodcutter's house exterior west
// 5   Lake east from the stump             45  Woodcutter's house exterior east
// 6   Pouch in the trunk                   46  Ogre
// 7   Lake west from the stump             47  Mushroom
// 8   Lake east from the castle            48  Leprechaun cave entrance
// 9   Fairy                                49  Cave above the well water
// 10  Goat pen west side                   50  Dragon cave west
// 11  Goat pen east side                   51  Dragon cave east
// 12  Well                                 52  In the well water
// 13  Wolf                                 53  Castle throne room
// 14  Base of tree with the gold egg       54  Castle hall north
// 15  Carrot garden west side              55  Castle hall south
// 16  Carrot garden east side              56  Land of the Clouds
// 17  Lake west from the clover            57  Land of the Clouds west
// 18  Elf                                  58  Land of the Clouds giant
// 19  Door to Land of the Clouds           59  Land of the Clouds east
// 20  Lake west from the door              60  Land of the Clouds south-west
// 21  Witch                                61  Land of the Clouds south
// 22  Dragon cave exit                     62  Land of the Clouds slingshot
// 23  Lake east from the clover            63  Top of the tree with the egg
// 24  Four-leaf clover                     64  Top of the beanstalk
// 25  Bridge south from the gnome          65  Witch's house interior
// 26  River north-east from the clover     66  Land of the Clouds cave steps
// 27  Field west from the witch's house    67  Land of the Clouds cave steps
// 28  Witch's house exterior               68  Land of the Clouds cave steps
// 29  Sorcerer                             69  Land of the Clouds cave steps
// 30  Walnut                               70  Beanstalk first screen
// 31  Bowl                                 71  Beanstalk second screen
// 32  River east from the bowl             72  Beanstalk top
// 33  River north-east from the bowl       73  Leprechaun cave below hole
// 34  Pebbles on the beach                 74  Leprechaun cave east from rat
// 35  Dwarf                                75  Leprechaun cave rat
// 36  Leprechaun cave exit                 76  Leprechaun cave with leprechauns
// 37  Lake east from the beanstalk soil    77  Leprechaun cave throne room
// 38  Beanstalk soil                       78  Leprechaun cave exit
// 39  Bridge east from the gnome           79  Woodcutter's house interior
// 40  Gnome                                80  Carried by the bird

scene_castle_east = 1
scene_castle_west = 2
scene_dagger_rock = 3
scene_lake1_east = 4
scene_lake1_west = 5
scene_pouch_trunk = 6
scene_lake2_east = 7
scene_lake2_west = 8
scene_fairy_grove = 9
scene_goat_west = 10
scene_goat_east = 11
scene_well = 12
scene_wolf_grove = 13
scene_giant_tree = 14
scene_garden_west = 15
scene_garden_east = 16
scene_lake3 = 17
scene_elf_grove = 18
scene_mountain_door = 19
scene_lake4 = 20
scene_witch_grove = 21
scene_cave = 22
scene_lake5 = 23
scene_clover_grove = 24
scene_troll_bridge_south = 25
scene_river_bend_southeast = 26
scene_empty_grove = 27
scene_witchs_house = 28
scene_wizard_grove = 29
scene_walnut_tree = 30
scene_bowl_grove = 31
scene_river_bend_southwest = 32
scene_river_fork = 33
scene_pebble_beach = 34
scene_dwarf_grove = 35
scene_tiny_cave = 36
scene_lake6 = 37
scene_beanstalk_dirt = 38
scene_troll_bridge_east = 39
scene_gnome = 40
scene_troll_bridge_north = 41
scene_stone_bridge = 42
scene_lake7 = 43
scene_woodcutters_house_west = 44
scene_woodcutters_house_east = 45
scene_ogre_grove = 46
scene_river_west = 47
scene_berry_bushes = 48
scene_inside_well_top = 49
scene_dragon_cave_west = 50
scene_dragon_cave_east = 51
scene_inside_well_bottom = 52
scene_castle_throne_room = 53
scene_castle_hall_north = 54
scene_castle_hall_south = 55
scene_clouds_x = 56
scene_clouds_northwest = 57
scene_clouds_north = 58
scene_clouds_northeast = 59
scene_clouds_southwest = 60
scene_clouds_south = 61
scene_clouds_southeast = 62
scene_giant_tree_top = 63
scene_beanstalk_top = 64
scene_inside_witchs_house = 65
scene_long_staircase1 = 66
scene_long_staircase2 = 67
scene_long_staircase3 = 68
scene_long_staircase4 = 69
scene_beanstalk1 = 70
scene_beanstalk2 = 71
scene_beanstalk3 = 72
scene_leprechaun_cave1 = 73
scene_leprechaun_cave2 = 74
scene_leprechaun_cave3 = 75
scene_leprechaun_cave4 = 76
scene_leprechaun_cave5 = 77
scene_leprechaun_cave6 = 78
scene_inside_woodcutters_house = 79
scene_sky = 80
scene_titles = 82

scenes = {
  scene_castle_east: "outside the castle",
  scene_castle_west: "outside the castle",
  scene_goat_west: "at the goat pen",
  scene_goat_east: "at the goat pen",
  scene_well: "at the well",
  scene_garden_west: "at the garden",
  scene_garden_east: "at the garden",
  scene_witchs_house: "at the witch's house",
  scene_gnome: "at the gnome's lean-to",
  scene_woodcutters_house_west: "at the woodcutter's house",
  scene_woodcutters_house_east: "at the woodcutter's house",
  scene_inside_well_top: "inside the well",
  scene_dragon_cave_west: "in a cave",
  scene_dragon_cave_east: "in a cave",
  scene_inside_well_bottom: "inside the well",
  scene_castle_throne_room: "inside the castle",
  scene_castle_hall_north: "inside the castle",
  scene_castle_hall_south: "inside the castle",
  scene_clouds_x: "in the cloud kingdom",
  scene_clouds_northwest: "in the cloud kingdom",
  scene_clouds_north: "in the cloud kingdom",
  scene_clouds_northeast: "in the cloud kingdom",
  scene_clouds_southwest: "in the cloud kingdom",
  scene_clouds_south: "in the cloud kingdom",
  scene_clouds_southeast: "in the cloud kingdom",
  scene_giant_tree_top: "climbing a tree",
  scene_beanstalk_top: "in the cloud kingdom",
  scene_inside_witchs_house: "inside the witch's house",
  scene_long_staircase1: "climbing some stairs",
  scene_long_staircase2: "climbing some stairs",
  scene_long_staircase3: "climbing some stairs",
  scene_long_staircase4: "climbing some stairs",
  scene_beanstalk1: "climbing a beanstalk",
  scene_beanstalk2: "climbing a beanstalk",
  scene_beanstalk3: "climbing a beanstalk",
  scene_leprechaun_cave1: "in the underground kingdom",
  scene_leprechaun_cave2: "in the underground kingdom",
  scene_leprechaun_cave3: "in the underground kingdom",
  scene_leprechaun_cave4: "in the underground kingdom",
  scene_leprechaun_cave5: "in the underground kingdom",
  scene_leprechaun_cave6: "in the underground kingdom",
  scene_inside_woodcutters_house: "in the woodcutter's house",
  scene_sky: "flying"
}

function current_scene() => byte(0x0100)
function current_score() => byte(0x00E3)

rich_presence_conditional_display(current_scene() == 0xFF, "Game not started")
rich_presence_conditional_display(current_scene() == scene_titles, "Titles")

rich_presence_display("Graham is {0}, {1} of 158 points",
    rich_presence_lookup("Scene", current_scene(), scenes, "exploring Daventry"),
    rich_presence_value("Score", current_score())
)

// ========================================================

// $6E26: become king [>2]
// $6E27: plant beans
// $6E29: plant beans
// $6E2A: CLIMB BEANSTALK
// $6E2E: goat travelling with Graham
// $6E31: RUB RING
// $6E32: EAT MUSHROOM
// $6E37: PUSH WITCH INTO OVEN
// $6E3C: guess gnome's name
// $6E3E: RUB RING [multiuse]
// $6E3F: TALK TO ELF (get ring)
// $6E41: RUB RING [>3] [TEMP]
// $6E42: GET BUCKET
// $6E43: JUMP INTO WELL WATER
// $6E44: GET CHEST
// $6E45: GET CHEST
// $6E46: GET MIRROR
// $6E47: GET SHIELD
// $6E48: OPEN DOOR [multiuse]
// $6E4A: leave dragon's lair via well
// $6E4D: GET SCEPTRE
// $6E4E: GET BOWL [>0 when given away]
// $6E4F: GET DAGGER
// $6E50: GET SLING
// $6E51: OPEN POUCH
// $6E52: GET POUCH
// $6E53: GET CARROT [>0 when eaten]
// $6E54: GET KEY
// $6E55: GET PEBBLES [>0 when slingshot used]
// $6E56: GET EGG
// $6E57: GET CHEESE [>0 when given away]
// $6E58: GET NOTE
// $6E59: GET FIDDLE
// $6E5A: GET MUSHROOM [>0 when eaten]
// $6E5B: GET BEANS [>0 when planted]
// $6E5C: guess gnome's name
// $6E5D: GET CLOVER
// $6E5E: GET WALNUT [>0 when opened]
// $6E5F: OPEN WALNUT
// $6E60: GET EGG [>2 when walnut opened] [>3 when pouch opened]
// $6E61: READ BOWL
// $6E62: FILL BOWL
// $6E65: READ NOTE
// $6E66: READ NOTE
// $6E67: JUMP INTO WELL WATER
// $6E68: GET MUSHROOM
// $6E6A: RUB RING
// $6E6B: OPEN WITCHES HUT DOOR [multiuse]
// $6E6F: plant beans
// $6E71: CLIMB BEANSTALK
// $6E74: some sort of timer/randomizer - values range from 0-6
// $6E75: EAT HOUSE [multiuse]
// $6E76: BOW TO KING [TEMP]
// $6E79: PUSH ROCK
// $6E7A: GET DAGGER
// $6E7B: GET POUCH
// $6E7C: LOOK IN STUMP
// $6E7D: LOOK IN STUMP
// $6E7E: SHOW CARROT [>2]
// $6E7F: OPEN GATE
// $6E80: troll leaves
// $6E81: SHOW CARROT*
// $6E82: OPEN GATE with goat
// $6E83: CLOSE GATE
// $6E84: OPEN CUPBOARD [multiuse]
// $6E87: CUT ROPE
// $6E88: LOWER ROPE
// $6E89: CLIMB ROPE
// $6E91: JUMP INTO WELL WATER
// $6E95: TALK TO ELF (get ring)
// $6E96: UNLOCK DOOR
// $6E97: UNLOCK DOOR
// $6E98: UNLOCK DOOR
// $6E9B: JUMP and grab bird
// $6E9C: GET CLOVER
// $6E9D: [>0] give treasure
// $6EA1: EAT HOUSE
// $6EA2: GET WALNUT
// $6EA3: GET BOWL
// $6EA4: GET PEBBLES
// $6EA7: fail to guess gnome's name
// $6EA8: guess gnome's name
// $6EA9: GET BEANS
// $6EAA: gnome leaves
// $6EAB: GET KEY
// $6EAE: dragon leaves cave
// $6EB0: THROW WATER at dragon
// $6EB1: GET MIRROR
// $6EB2: THROW DAGGER at dragon
// $6EBA: TALK TO KING [TEMP]
// $6EBB: BOW TO KING 
// $6EBC: BOW TO KING [end of game]
// $6EBE: USE SLINGSHOT
// $6EBF: GET CHEST
// $6EC0: giant falls asleep
// $6EC1: giant falls asleep [>0]
// $6EC4: GET SLING
// $6EC5: GET EGG
// $6ECA: witch arrives
// $6ECB: protective spell message (witch's house)
// $6ECC: OPEN CUPBOARD [TEMP]
// $6ECD: GET CHEESE
// $6ECE: OPEN CUPBOARD
// $6ECF: GET NOTE
// $6ED0: witch coming timer
// $6ED1: witch oven timer
// $6ED4: OPEN CUPBOARD [TEMP]
// $6ED7: OPEN UNDERGROUND DOOR
// $6ED9: PLAY FIDDLE
// $6EDA: GET SHIELD
// $6EDC: GET SCEPTRE
// $6EDD: EAT MUSHROOM
// $6EDE: GET FIDDLE
// $6EDF: GIVE BOWL
// $6EE2: FILL BOWL
// $6EF0: meet fairy [>0]
// $6EFA: PUSH ROCK [multiuse]
// $6EFB: PUSH ROCK [multiuse]
// $6EFD: SHOW CARROT
// $6EFE: enter witches hut (witch not present) [multiuse]
// $6EFF: SHOW CARROT

// ========================================================

// this is just the "restore game" prompt - the user can still cancel here, but its the best I could find
function load_game() => byte(0x00EC) == 3

function flag_achievement(points, title, description, scene, flag_address)
{
    achievement(title, description, points,
        trigger = current_scene() == scene &&
                  pointed_at_byte(flag_address) == 1 && prev(pointed_at_byte(flag_address)) == 0
    ) 
}

//flag_achievement(2, "Don't Cut Yourself", "Acquire the dagger", scene_dagger_rock, 0x6E7A)
//flag_achievement(3, "How Many Carats is That?", "Acquire the golden egg", scene_giant_tree_top, 0x6EC5)

// MAX
flag_achievement(2, "Show Some Respect", "Properly greet King Edward", scene_castle_throne_room, 0x6EBB)

// MAX
// give bowl and fill bowl can be done in either order. giving first is more points, but both let you get the fiddle.
achievement("Cook, Little Pot, Cook", "Help the woodcutter and his wife", 5,
    trigger = current_scene() == scene_inside_woodcutters_house &&
              pointed_at_byte(0x6E62) == 1 && // fill bowl
              pointed_at_byte(0x6E4E) == 0 && // give bowl
              (prev(pointed_at_byte(0x6E62)) == 0 || prev(pointed_at_byte(0x6E4E)) != 0)
)

// MIN
achievement("Sneaky Little Mouse", "Use a protective spell to get the cheese", 5,
    trigger = current_scene() == scene_witchs_house &&              // trigger on leaving house
              never(current_scene() != scene_witchs_house &&        // reset if not at or in the witch's house
                    current_scene() != scene_inside_witchs_house) &&
              pointed_at_byte(0x6E57) == 1 &&                       // cheese collected
              once(pointed_at_byte(0x6E57) == 0) &&                 // cheese wasn't previously collected
              once(pointed_at_byte(0x6ECB) == 1)                    // protective spell message when approaching house
)

// MAX / TYRANT
flag_achievement(10, "Is It Hot Enough For You?", "Eliminate the witch", scene_inside_witchs_house, 0x6E37)

// MAX / MIN
flag_achievement(3, "Fly the Friendly Skies", "Hitch a ride with the condor", scene_cave, 0x6E9B)

// MAX
flag_achievement(10, "What Was Left Behind is Now Mine", "Acquire the sceptre", scene_leprechaun_cave5, 0x6EDC)

// MAX / MIN
flag_achievement(5, "The Royal Buckler", "Acquire the magic shield", scene_leprechaun_cave5, 0x6EDA)

// MAX
flag_achievement(10, "Just a Big Lizard", "Make the dragon leave", scene_dragon_cave_east, 0x6EAE)

// MIN / TYRANT
flag_achievement(5, "Dragonslayer", "Kill the dragon", scene_dragon_cave_east, 0x6EB2)

// MAX / TYRANT
achievement("Out of My Way", "Knock the troll off his bridge", 10,
    trigger = (current_scene() == scene_troll_bridge_south ||
               current_scene() == scene_troll_bridge_east ||
               current_scene() == scene_troll_bridge_north) &&
               pointed_at_byte(0x6E80) == 1 && prev(pointed_at_byte(0x6E80)) == 0 &&
               pointed_at_byte(0x6E81) == 1 // goat was led  
)

// MIN
achievement("Paid the Toll", "Bribe the troll", 5,
    trigger = (current_scene() == scene_troll_bridge_south ||
               current_scene() == scene_troll_bridge_east ||
               current_scene() == scene_troll_bridge_north) &&
               pointed_at_byte(0x6E80) == 1 && prev(pointed_at_byte(0x6E80)) == 0 &&
               pointed_at_byte(0x6E81) == 0 // goat was not led          
)

// MAX
flag_achievement(10, "The Hint Line is Only 95 Cents per Minute", "Figure out the gnome's true name", scene_gnome, 0x6EA8)

// MAX
// the beans can be planted in any of the following: 
// * 38 - "the bed of wildflowers"
// * 35 - the room where the dwarf attacks with the mesa in the distance
// * 31 - the room where the magic bowl was found
// *  6 - the room with the rotten stump and log
// * 22 - the room with the cave and condor.
// by limiting the start room to < 49, we allow all of the main map
// 0x6E71 + 0x12 = 0x6E83 (unknown), -0x12 = 0x6E5F (gold walnut in inventory)
// 0x6E6B + 0x12 = 0x6E7D (unknown), -0x12 = 0x6E6E (unknown)
achievement("Expert Free Climbing", "Climb the beanstalk without falling or reloading", 10,
    trigger = once(current_scene() < 49) &&                 // the beans can be planted in several locations
              once(current_scene() == scene_beanstalk1) &&
              once(current_scene() == scene_beanstalk2) &&
              current_scene() == scene_beanstalk3 &&
              never(load_game()) && 
              prev(pointed_at_byte(0x6E71)) != 1 &&         // dismount at top (1=climbing beanstalk)
                                                            // use prev because falling change happens one frame later
              never(byte(0x010F) == 0x0D)                   // falling
)

// MAX
achievement("Let Sleeping Giants Lie", "Acquire the treasure chest without killing the giant", 10,
    trigger = current_scene() == scene_clouds_north && 
              pointed_at_byte(0x6EC0) == 1 &&                                     // giant sleeping
              pointed_at_byte(0x6EBF) == 1 && prev(pointed_at_byte(0x6EBF)) == 0  // get chest
)

// MIN / TYRANT
flag_achievement( 5, "Goliath Has Fallen", "Kill the giant", scene_clouds_north, 0x6EBE)

function trigger_complete_game() => current_scene() == scene_castle_throne_room && 
                                         pointed_at_byte(0x6EBC) == 1 && pointed_at_byte(0x6E26) == 2
// MAX / MIN
achievement("It's Good to Be the King", "Complete the quest", 10, 
            trigger_complete_game())

// MAX
achievement("Restocked the Treasury", "Complete the quest with all of the optional treasures", 10,
    trigger = trigger_complete_game() &&
              pointed_at_byte(0x6E3F) == 1 && // magic ring
              pointed_at_byte(0x6E4D) == 1 && // sceptre
              pointed_at_byte(0x6E51) == 1 && // pouch of diamonds
              pointed_at_byte(0x6E56) == 1 && // gold egg
              pointed_at_byte(0x6E5F) == 1    // gold walnut
)

// MAX
achievement("The Complete Quest", "Complete the quest with a perfect score", 25,
    trigger = trigger_complete_game() && current_score() >= 158
)

// MIN
achievement("The Minimal Quest", "Complete the quest with less than 70 points", 25,
    trigger = trigger_complete_game() && current_score() < 70
)

// TYRANT
achievement("Ruthless Tyrant", "Kill the dragon, witch, giant, and troll in the same playthrough", 25,
    trigger = pointed_at_byte(0x6EB2) == 1 && // dragon
              pointed_at_byte(0x6E37) == 1 && // witch
              pointed_at_byte(0x6E80) == 1 && pointed_at_byte(0x6E81) == 1 && // troll
              pointed_at_byte(0x6EBE) == 1 && // giant
              ((prev(pointed_at_byte(0x6EB2)) == 0 && current_scene() == scene_dragon_cave_east) ||
               (prev(pointed_at_byte(0x6E37)) == 0 && current_scene() == scene_inside_witchs_house) ||
               (prev(pointed_at_byte(0x6EBE)) == 0 && current_scene() == scene_clouds_north) ||
               (prev(pointed_at_byte(0x6E80)) == 0 && 
                (current_scene() == scene_troll_bridge_south ||
                 current_scene() == scene_troll_bridge_east ||
                 current_scene() == scene_troll_bridge_north
                )
               )
              )
)

// ========================================================
// Maximum points walkthrough (~75 minutes) - https://www.sierragamers.com/kq1-agi-text-walkthrough

// Go west
//   OPEN DOOR [1>1]
// Enter Castle, walk to throne room
//   BOW TO KING [3>4], TALK TO KING
// Leave castle, walk left
//   Stand behind rock, PUSH ROCK [2>6], LOOK IN HOLE, GET DAGGER [5>11]
// Go north, CLIMB TREE [2>13], walk across branches
//   GET EGG [6>19]
// Climb back down, go east
//   GET CARROT [2>21]
// Walk north, leave and return until you find the elf
//   TALK TO ELF (get ring) [3>24]
// Walk east twice
//   GET FOURLEAF CLOVER [2>26]
// Walk west twice, then north
//   GET BOWL [3>29], READ BOWL [1>30]
// Walk north
//   GET PEBBLES [1>31]
// Walk south, then west
//   GET WALNUT [3>34], OPEN WALNUT [3>37]
// Walk south, west twice, then north to the gingerbread house
//   EAT HOUSE [2>39]. 
//     If you get a rhyme about a mouse, leave and come back and try again. if it's yummy, go inside
// Head towards the bedroom
//   If you don't get a message about the witch returning, leave and try again. When you do finally 
//   see the message, wait in the room until she's near the oven, then approach her to push her in [7>46].
//   [TECHNICAL]: I'm not sure what causes this to happen. There's a countdown timer at $6ED0, but it doesn't always start.
//   OPEN CUPBOARD [2>48], GET CHEESE [2>50]
//   GET NOTE (on the nightstand) [2>52], READ NOTE [1>53]
// Exit the house and walk north twice to the woodsman's house and enter it.
//   GIVE BOWL [3>56], FILL BOWL [2>58], GET FIDDLE [3>61]
// Leave house, walk one west and one north
//   LOOK IN STUMP [1>62], GET POUCH [3>65], OPEN POUCH [3>68]
// Go north to goat pen
//   OPEN GATE, go in, CLOSE GATE, SHOW CARROT [5>73], OPEN GATE
// Go south, west, then south twice to the bridge
//   Goat will take care of troll [4>77]
// Go west
//   TALK TO GNOME
//   IFNKOVHGROGHPRM [5>82] (don't SAY it, just type it - must be first try for 5 points)
//   GET BEANS [4>86]
// Go east twice
//   PLANT BEANS [2>88] (SAVE A)
//   CLIMB BEANSTALK
// Go up three times
// Go east twice, south, and east twice to the southeast corner of the cloud land
//   LOOK IN HOLE, GET SLING [2>90]
// Go west twice, north, then east near the top of the screen and hide behind the 
//   northwest-most tree until the giant sleeps [7>97], then GET CHEST [8>105]
// Go east twice, through the cave and down the stairs
// Go west twice, and south to the well
//   Make sure the bucket is up and CUT ROPE [2>107] (get bucket)
//   LOWER ROPE, CLIMB ROPE [1>108]
//   When you reach the bottom, SWIM [2>110] and DIVE [2>112]
// Swim left [1>113]. Walk left in front of the pillar so you're just out of the dragon's range.
//   THROW WATER [5>118]
//   GET MIRROR [8>126]
// Go east, automatically refill bucket [2>128]
// Go west three times to exit the cave
//   If the bird is not present, leave north and come back
//   Wait for the bird to fly overhead, then JUMP [3>131]
// Go west
//   GET MUSHROOM [1>132]
// Go east, fall in the hole. Go south, then west.
//   GIVE CHEESE [2>134]
//   OPEN DOOR
// Go left.
//   PLAY FIDDLE [3>137]
// Go south.
//   GET SCEPTRE [6>143] (have to wait until king leaves)
//   GET SHIELD [8>151]
// Go left
//   EAT MUSHROOM [2>153]
// Exit through hole [1>154]
// Go north twice, and east twice to the castle.
//   OPEN DOOR [1>155]
// Walk to throne room
//   BOW TO KING [3>158]
//   Walk to throne

// ========================================================
// Minimum points walkthrough (~43 minutes)

// Walk north, then east
//   if fairy is not here, leave and return until she is
// Walk north
//   GET CLOVER [2>2]
// Walk north, then east three times to witch's house
//   OPEN DOOR
//   OPEN CUPBOARD [2>4], GET CHEESE [2>6]
// Leave, walk west, then south to the cave
//   JUMP to grab the bird [3>9]
// Go west
//   GET MUSHROOM [1>10]
// Go east, fall in the hole. Go south, then west. [SAVE O]
//   GIVE CHEESE [2>12]
//   OPEN DOOR
// Go left, then south
//   GET SHIELD [8>20]
// Go left
//   EAT MUSHROOM [2>22]
// Exit through hole [1>23], go north twice, then east
//   Stand behind rock, PUSH ROCK [2>25], GET DAGGER [5>30]
// Go west twice, then north to the well [SAVE P]
//   Make sure the bucket is up and CUT ROPE [2>32] (get bucket)
//   LOWER ROPE, CLIMB ROPE [1>33]
//   When you reach the bottom, SWIM [2>35] and DIVE [2>37]
// Swim left [1>38]
//   THROW DAGGER [-5 for losing dagger, +3 for killing dragon > 36]
//   GET MIRROR [8>44]
// Go right and up
//   CLIMB ROPE
// Go up [-1>43 (why?)]
// Go west, north twice, then west four times to the bowl, but don't pick it up
// Go north
//   GET PEBBLES [1>44]
// Walk south, then west
//   GET WALNUT [3>47], OPEN WALNUT [3>50]
// Walk east three times to the troll bridge [SAVE Q]
//   GIVE WALNUT to troll [-6>44]
// Walk north
//   TALK TO GNOME
//   guess incorrectly
//   GET KEY [3>47]
// Go south twice and west three times to the door
//   UNLOCK DOOR [2>49], OPEN DOOR
// Climb the staircase, at the top go south
//   GET SLING [2>51]
// Go north, then west [SAVE R]
//   USE SLING [2>53]
//   GET CHEST [8>61]
// Go east twice, through the cave and down the stairs
// Go south twice and east once to return to the castle
//   OPEN DOOR [1>62]
// Walk to throne room [SAVE S]
//   BOW TO KING [3>65]
//   Note: DROP BUCKET (and water)[-4], DROP KEY[-3], DROP CLOVER[-2], DROP SLING[-2] >> 57!
//   Walk to throne

// ========================================================
// Ruthless Tyrant points walkthrough (~30 minutes)

// Go west twice
//   Stand behind rock, PUSH ROCK [2>2], GET DAGGER [5>7]
// Go north, then east
//   GET CARROT [2>9]
// Walk east four more times
//   OPEN GATE, go in, CLOSE GATE, SHOW CARROT [5>14], OPEN GATE
// Walk north two screens, then west two screens [SAVE T], and approach bridge
//   Goat will take care of troll [4>18]
// Go north
//   TALK GNOME
//   guess wrong
//   GET KEY [3>21]
// Go south, west, north, west
//   GET PEBBLES [1>22]
// Go east, south, then east four screens to the witch's hut
//   EAT HOUSE [2>24] 
//     If you get a rhyme about a mouse, leave and come back and try again. if it's yummy, go inside
// Head towards the bedroom
//   If you don't get a message about the witch returning, leave and try again. When you do finally 
//   see the message, wait in the room until she's near the oven [SAVE U], then approach her to push her in [7>31].
// Leave house, walk south twice to the well.
//   Make sure the bucket is up and CUT ROPE [2>33] (get bucket)
//   LOWER ROPE, CLIMB ROPE
//   When you reach the bottom [1>34], SWIM [2>36] and DIVE [2>38]
// Swim left [1>39] [SAVE V]
//   THROW DAGGER [-2>37]
// Go right, then up
//   CLIMB ROPE [-1>36]
// Go east twice (re-enter if the wolf is present), then north
//   UNLOCK DOOR [2>38]
// Climb the staircase, at the top go south
//   GET SLING [2>40]
// Go north, then west [SAVE W]
//   USE SLINGSHOT [2>42]
