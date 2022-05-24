// King's Quest II: Romancing the Throne
// #ID=17138

// apple2online
// MD5: 51fecf807b7369288714fa67492d0209 (side 1A) (AGI 1.10) [ver 1.0H]
// MD5: 654f982ff24269dedf646052ec469f94 (side 1B)
// MD5: 74571c7ecfa0f2f6686a8ff70029b595 (side 2A)
// MD5: 46ca9ce71dd984496684fc671fb18af1 (side 2B)
// MD5: 9998017630a30d635dff03bbd5515925 (side 3A)

// old apple2online
// http://web.archive.org/web/20210415015626/https://apple2online.com/?page_id=1953
// MD5: d8549ae7a488ab18289a02c13461d24b (side 1A) [Blade crack] (AGI 1.10) [ver 1.0H]
// MD5: 239f0238141ba3ecb100d015d543ac1f (side 1B)
// MD5: e077d01f89c5d87fdf1f85890f579ed4 (side 2A)
// MD5: da01ed6b55920013f63e2d79fbb15660 (side 2B)
// MD5: 0fe0171c101d92659530af44be9df553 (side 3A)

// MD5: 2e4c8761ca35df6a9b41a372036d2cc7 (side 1A) [Talisman crack] (AGI 1.08) [ver 1.0G]
// MD5: 72f8e2de4acdc479083d66025d3d309f (side 1B)
// MD5: bf61aba7f0628d721f5da644a0c4fa4d (side 2A)
// MD5: e41526b8db2571d041b5bbb860bf2583 (side 2B)

// ========================================================
// SEMI    UP    APOSTROPHE      1 Sound      Ctrl+E repeat
// LEFT    +     RIGHT           3 Save       Ctrl+C cancel
// PERIOD  DOWN  SLASH           5 Restore
//                               7 Restart
// EQUALS=swim
// ========================================================

// To create a save disk, once the game has started:
// * Click on the drive 2 icon. When it prompts you to select a disk, enter a name for the save disk - i.e. "Save Disk.dsk" (extension must match disk in drive 1) - and press Open
// * Type INIT DISK and press return.
// * Press 2 to select the second drive.
// * Press return - expect "The disk has been formatted"
// * Press return

// ITEMS
// -----
// 
// 50  Sword                      62  Empty Basket               74  Pillow
// 51  Trident                    63  Basket of Goodies          75  Fishing Net
// 52  Bouquet of Flowers         64  Bottle                     76  Carpet
// 53  Bracelet                   65  Empty Bottle               77  Bridle
// 54  Stake                      66  Ham                        78  Candle
// 55  Ruby Ring                  67  Chicken Soup               79  Sugar Cube
// 56  Tiara                      68  Black Cloak                80  Gasping Fish
// 57  Necklace                   69  Cross                      81  Amulet
// 58  Earrings                   70  Caged Nightingale          82  Clamshell
// 59  Brooch                     71  Empty Birdcage             83  Silver Key
// 60  Mallet                     72  Oil Lamp                   84  Dead Fish
// 61  Gold Key                   73  Cloth

function item_in_inventory(item_id) => byte(0xA135 + item_id * 3) == 0xF9
item_sword = 50
item_trident = 51
item_flowers = 52
item_bracelet = 53
item_stake = 54
item_ring = 55
item_tiara = 56
item_necklace = 57
item_earrings = 58
item_brooch = 59
item_mallet = 60
item_gold_key = 61
item_empty_basket = 62
item_goodies = 63
item_bottle = 64
item_empty_bottle = 65
item_ham = 66
item_soup = 67
item_cloak = 68
item_cross = 69
item_caged_bird = 70
item_empty_cage = 71
item_lamp = 72
item_cloth = 73
item_pillow = 74
item_net = 75
item_carpet = 76
item_bridle = 77
item_candle = 78
item_sugar_cube = 79
item_fish = 80
item_amulet = 81
item_clamshell = 82
item_silver_key = 83
item_dead_fish = 84

// LOCATIONS
// ---------
// 
// 1   Beach                                 48  Bridge over chasm
// 2   Little Red Riding Hood                49  Cliffs east from chasm bridge
// 3   Cottage                               50  Ocean west from the beach
// 4   East from cottage                     51  King Neptune
// 5   Monastery west side                   52  Ocean east from Neptune
// 6   Monastery entrance                    53  Two screens east from Neptune
// 7   Chasm south side                      54  Three screens east from Neptune
// 8   Beach                                 55  Mountain top
// 9   Lake south-west from cottage          56  Mountain top snake
// 10  Poisoned lake north-west corner       57  Mountain top cave entrance
// 11  Poisoned lake north side              58  Mountain top gold key cave
// 12  Poisoned lake north-east corner       59  Dracula's castle west tower
// 13  Brooch                                60  Dracula's castle spiral steps
// 14  Lake south from chasm                 61  Dracula's castle lobby
// 15  Beach mermaid rock                    62  Dracula's castle north tower
// 16  Field north from stake                63  Dracula's castle torch
// 17  Poisoned lake west side               64  Dracula's castle dining room
// 18  Dracula's castle entrance             65  Dracula's castle basement steps
// 19  Poisoned lake east side               66  Dracula's castle basement
// 20  Antique shop entrance                 67  Dracula's castle coffin room
// 21  Antique shop east side                68  Antique shop interior
// 22  Clamshell                             69  Hagatha's cave interior
// 23  Stake                                 70  Cottage interior
// 24  Poisoned lake west side               71  Monastery interior
// 25  Brambles outside Dracula's castle     72  Dwarf house ladder top
// 26  Poisoned lake east side               73  Dwarf house ladder bottom
// 27  Field south from antique shop         74  Dwarf house chest
// 28  Cliff south-east from antique shop    75  Enchanted land north beach
// 29  Beach                                 76  Enchanted land north ocean
// 30  Tree with sign                        77  Island north-west corner
// 31  Poisoned lake south-west corner       78  Island amulet
// 32  Poisoned lake south side              79  Island north-east corner
// 33  Poisoned lake south-east corner       80  Enchanted land middle beach
// 34  Lake north-east from mallet           81  Enchanted land middle ocean
// 35  Lake north from magic door            82  Island west side
// 36  Trident                               83  Island tower
// 37  Lake north from Hagatha's cave        84  Island east side
// 38  Necklace                              85  Enchanted land south beach
// 39  Field north from dwarf house          86  Enchanted land south ocean
// 40  Mallet                                87  Island south-west corner
// 41  Chasm east from magic door            88  Island south side
// 42  Magic door                            89  Island south-east corner
// 43  Beach west from Hagatha's cave        90  Island tower Valanice
// 44  Hagatha's cave entrance               91  Island tower lion
// 45  Field East from Hagatha's cave        92  Island tower spiral steps middle
// 46  Dwarf house entrance                  93  Island tower spiral steps bottom
// 47  Field west from chasm bridge

// Ctrl+D -> debug mode, TP <enter> [sceneid] <enter>
function is_debug_mode() => byte(0xFCCD) != 0

scene_beach_1 = 1
scene_little_red_riding_hood = 2
scene_grandmas_house = 3
scene_behind_three_bears_house = 4
scene_monastery_west = 5
scene_monastery_east = 6
scene_chasm_south = 7
scene_beach_2 = 8
scene_nw_lake = 9
scene_nw_poison_lake = 10
scene_n_poison_lake = 11
scene_ne_poison_lake = 12
scene_ne_lake = 13
scene_cliff_1 = 14
scene_mermaid_rock = 15
scene_field_1 = 16
scene_w_poison_lake_1 = 17
scene_castle_entrance = 18
scene_e_poison_lake_1 = 19
scene_antique_shop_west = 20
scene_antique_shop_east = 21
scene_shell_beach = 22
scene_stake_field = 23
scene_w_poison_lake_2 = 24
scene_castle_path = 25
scene_e_poison_lake_2 = 26
scene_forest_1 = 27
scene_cliff_2 = 28
scene_beach_3 = 29
scene_field_2 = 30
scene_sw_poison_lake = 31
scene_s_poison_lake = 32
scene_se_poison_lake = 33
scene_se_lake = 34
scene_chasm_north = 35
scene_trident_beach = 36
scene_sw_lake_west = 37
scene_sw_lake_east = 38
scene_forest_2 = 39
scene_forest_mallet = 40
scene_chasm_nw = 41
scene_door = 42
scene_rocky_beach = 43
scene_cave_entrance = 44
scene_field_3 = 45
scene_treehouse = 46
scene_forest_3 = 47
scene_chasm_bridge = 48
scene_chasm_east = 49
scene_ocean_1 = 50
scene_king_neptune = 51
scene_ocean_2 = 52
scene_ocean_3 = 53
scene_ocean_4 = 54
scene_mountain_top_1 = 55
scene_mountain_top_2 = 56
scene_mountain_top_3 = 57
scene_mountain_top_4 = 58
scene_castle_west_tower = 59
scene_castle_spiral_steps = 60
scene_castle_lobby = 61
scene_castle_north_tower = 62
scene_castle_torch = 63
scene_castle_dining_room = 64
scene_castle_basement_steps = 65
scene_castle_basement = 66
scene_castle_coffin = 67
scene_antique_shop_interior = 68
scene_cave_interior = 69
scene_cottage_interior = 70
scene_monastery_interior = 71
scene_treehouse_1 = 72
scene_treehouse_2 = 73
scene_treehouse_3 = 74
scene_enchanted_land_north_beach = 75
scene_enchanted_land_north_ocean = 76
scene_island_nw = 77
scene_island_n = 78
scene_island_ne = 79
scene_enchanted_land_middle_beach = 80
scene_enchanted_land_middle_ocean = 81
scene_island_w = 82
scene_island_tower = 83
scene_island_e = 84
scene_enchanted_land_south_beach = 85
scene_enchanted_land_south_ocean = 86
scene_island_sw = 87
scene_island_s = 88
scene_island_se = 89
scene_tower_valanice = 90
scene_tower_lion = 91
scene_tower_middle = 92
scene_tower_bottom = 93
scene_sky = 105

scene_none = 0
scene_intro_title = 97
scene_intro_credits = 98
scene_intro_castle = 104
scene_outro_outside_castle = 106

scenes = {
  scene_beach_1: "at the beach",
  scene_grandmas_house: "at a cottage",
  scene_monastery_west: "at a monastery",
  scene_monastery_east: "at a monastery",
  scene_beach_2: "at the beach",
  scene_mermaid_rock: "at the beach",
  scene_castle_entrance: "at the castle",
  scene_antique_shop_west: "at the antique shop",
  scene_shell_beach: "at the beach",
  scene_castle_path: "at the castle",
  scene_beach_3: "at the beach",
  scene_trident_beach: "at the beach",
  scene_door: "at the mysterious door",
  scene_rocky_beach: "at the beach",
  scene_cave_entrance: "outside the witch's cave",
  scene_treehouse: "outside the dwarf's house",
  scene_chasm_bridge: "at the rickety bridge",
  scene_ocean_1: "in the ocean",
  scene_king_neptune: "underwater",
  scene_ocean_2: "underwater",
  scene_ocean_3: "underwater",
  scene_ocean_4: "underwater",
  scene_mountain_top_1: "on the mountaintop",
  scene_mountain_top_2: "on the mountaintop",
  scene_mountain_top_3: "on the mountaintop",
  scene_mountain_top_4: "on the mountaintop",
  scene_sky: "on the mountaintop",
  scene_castle_west_tower: "in the castle",
  scene_castle_spiral_steps: "in the castle",
  scene_castle_lobby: "in the castle",
  scene_castle_north_tower: "in the castle",
  scene_castle_torch: "in the castle",
  scene_castle_dining_room: "in the castle",
  scene_castle_basement_steps: "in the castle",
  scene_castle_basement: "in the castle",
  scene_castle_coffin: "in the castle",
  scene_antique_shop_interior: "in the antique shop",
  scene_cave_interior: "in the witch's cave",
  scene_cottage_interior: "in the cottage",
  scene_monastery_interior: "in the monastery",
  scene_treehouse_1: "in the dwarf's house",
  scene_treehouse_2: "in the dwarf's house",
  scene_treehouse_3: "in the dwarf's house",
  scene_enchanted_land_north_beach: "in the enchanted land",
  scene_enchanted_land_north_ocean: "in the enchanted land",
  scene_island_nw: "in the enchanted land",
  scene_island_n: "in the enchanted land",
  scene_island_ne: "in the enchanted land",
  scene_enchanted_land_middle_beach: "in the enchanted land",
  scene_enchanted_land_middle_ocean: "in the enchanted land",
  scene_island_w: "in the enchanted land",
  scene_island_tower: "in the enchanted land",
  scene_island_e: "in the enchanted land",
  scene_enchanted_land_south_beach: "in the enchanted land",
  scene_enchanted_land_south_ocean: "in the enchanted land",
  scene_island_sw: "in the enchanted land",
  scene_island_s: "in the enchanted land",
  scene_island_se: "in the enchanted land",
  scene_tower_valanice: "in the crystal tower",
  scene_tower_lion: "in the crystal tower",
  scene_tower_middle: "in the crystal tower",
  scene_tower_bottom: "in the crystal tower",
  scene_intro_castle: "in Daventry",
  scene_outro_outside_castle: "victorious",
}

// FC02 changes first, then FF14 and FF68 as it loads and FFE5 once it finishes loading
function current_scene() => byte(0xFFE5)
function current_score() => byte(0xFC07)

rich_presence_conditional_display(current_scene() == 0, "Game not started")
rich_presence_conditional_display(current_scene() == scene_intro_title || current_scene() == scene_intro_credits, "Titles")

rich_presence_display("Graham is {0}, {1} of 185 points",
   rich_presence_lookup("Scene", current_scene(), scenes, "exploring Kolyma"),
   rich_presence_value("Score", current_score())
)

function trigger_flag(flag_address) => byte(flag_address) == 1 && prev(byte(flag_address)) == 0 && !is_debug_mode()

function flag_achievement(title, description, points, scene, flag_address)
{
    achievement(title, description, points,
        trigger = current_scene() == scene && trigger_flag(flag_address)
    )
}

// $FC05: ride fish
// $FC06: game complete
// $FC0A: say home
// $FC0C: game paused while waiting for user to acknowledge text so it can scroll
// $FC0E: scene transition
// $FC15: graham X
// $FC16: graham Y
// $FC17: get lamp (give bird or two treasures)
// $FC18: give flowers to mermaid
// $FC1A: cross bridge going west
// $FC1B: cross bridge going east
// $FC1D: valanice is waiting for graham to introduce himself (goes to 2 after introducing)
// $FC1E: is kneeling
// $FC1F: rode fish
// $FC20: dracula frightened away
// $FC21: amulet on ground
// $FC27: gold fish in water
// $FC28: gold fish on land (goes back to 0 when picked up, goes to 2 when ridden)
// $FC2F: drowning timer
// $FC30: red riding hood on screen
// $FC31: mailbox is open
// $FC32: pray, ride seahorse
// $FC33: open mailbox animation
// $FC34: goodies in inventory
// $FC35: close mailbox animation
// $FC36: give goodies to girl, get flowers
// $FC37: fairy on screen
// $FC39: open monestary door animation
// $FC3D: wolf status (1=in bed)
// $FC3F: get goodies
// $FC40: get brooch
// $FC41: read door first time (mermaid appears)
// $FC42: wear ring
// $FC43: wear cross
// $FC44: wear cloak
// $FC46: get lamp (trade treasures) - normal?
// $FC48: get shell
// $FC49: get bracelet
// $FC4A: get stake
// $FC4B: read third door first time (ferryman appears)
// $FC4C: give treasure to ferryman
// $FC4D: dwarf has stolen necklace
// $FC4E: dwarf has stolen earrings
// $FC4F: dwarf has stolen tiara
// $FC50: dwarf has stolen bracelet
// $FC51: dwarf has stolen brooch
// $FC52: get trident
// $FC54: get necklace
// $FC55: get mallet
// $FC56: open first door
// $FC57: open second door
// $FC58: open third door
// $FC59: number of times crossed bridge
// $FC60: animation active
// $FC61: animation active
// $FC62: animation delay timer
// $FC63: genie on screen
// $FC65: seahorse escort
// $FC66: seahorse escort
// $FC67: open clam (wave trident or give trident to king)
// $FC68: get key (from clam)
// $FC69: give trident to mermaid
// $FC6A: give soup to woman
// $FC6B: look under bed (get cloak and ring)
// $FC6C: get silver cross
// $FC6D: get lamp (give bird or two treasures)
// $FC6E: give first treasure to antique dealer
// $FC70: put cloth over cage (=2)
// $FC71: get cage
// $FC72: fished up a gold fish
// $FC73: light candle
// $FC76: kill snake
// $FC77: throw bridle at snake
// $FC78: talk to horse (get sugar cube)
// $FC79: get second key
// $FC7C: get pot
// $FC7D: get net
// $FC7F: set in scenes 9 and 10
// $FC80: mermaid present
// $FC81: ferryman present
// $FC8E: swim
// $FC98: ride seahorse
// $FC99: get amulet
// $FC9C: swim
// $FC9D: lion state (2=fed, 3=slain)
// $FC9F: ghosts present
// $FCA0: witch on screen
// $FCA1: dwarf on screen
// $FCA3: rub lamp (get carpet)
// $FCA5: gold fish on land (=1, =2 when thrown back into water)
// $FCA6: open mailbox (first time - points earned)
// $FCA7: look in hole (see brooch - points earned)
// $FCA8: eat sugar
// $FCAA: wear cross
// $FCAB: wear cloak and ring to trick ferryman
// $FCAC: flailing timer after drowning timer
// $FCAD: times lamp has been rubbed
// $FCB3: enchanter on screen
// $FCB4: pray
// $FCB5: get earrings
// $FCB6: read second door first time (shop opens)
// $FCBA: coffin open (=2)
// $FCBB: 0=coffin open, 1=dracula in coffin, 2=dracula dead, 3=dracula out, 4=dracula frightened away
// $FCBC: get pillow
// $FCBD: get g old key
// $FCBE: get silver key
// $FCBF: get meat
// $FCC0: get candle
// $FCC1: open drawer
// $FCC2: get tiara
// $FCC3: unlock trunk (=1, =2=open)
// $FCC7: get in boat (temporary)
// $FCCF: dwarf's trunk is open
// $FCD1: enter valanice's chamber
// $FCE9: enter valanice's chamber
// $FCF1: dwarf approaching
// $FCF2: witch on screen

function scene_loading() => byte(0xFC0E) == 1

function trigger_complete_game() => current_scene() == scene_outro_outside_castle && 
                                    prior(current_scene()) == scene_monastery_interior && // after wedding (no solo HOME)
                                    unless(scene_loading()) &&
                                    !is_debug_mode()

// MAX
achievement("Undelivered", "Give the Goodies back to Little Red Riding Hood", 5,
    trigger = trigger_flag(0xFC36) && (current_scene() == scene_little_red_riding_hood || current_scene() == scene_nw_lake)
)

// MAX
flag_achievement("The Better to Feed You With", "Help Grandma feel better", 5, scene_cottage_interior, 0xFC6A)

// MAX
achievement("Finders Keepers", "Collect the first key without returning a lost possession", 5,
    trigger = trigger_flag(0xFC68) && 
              byte(0xFC69) == 0 && // trident not returned
              current_scene() == scene_king_neptune
)

// MIN
achievement("From One King to Another", "Trade for the first key", 5,
    trigger = trigger_flag(0xFC68) && 
              byte(0xFC69) == 1 && // trident not returned
              current_scene() == scene_king_neptune
)

// BOTH
flag_achievement("A Door Within a Door", "Open the first door", 10, scene_door, 0xFC56)

// EITHER - dwarf
achievement("I Wasn't Done With That", "Retrieve a stolen treasure from the dwarf", 5,
    trigger = current_scene() == scene_treehouse_3 && !is_debug_mode() &&
              ((byte(0xFC4D) == 0 && prev(byte(0xFC4D)) == 1) || // necklace
               (byte(0xFC4E) == 0 && prev(byte(0xFC4E)) == 1) || // earrings
               (byte(0xFC4F) == 0 && prev(byte(0xFC4F)) == 1) || // tiara
               (byte(0xFC50) == 0 && prev(byte(0xFC50)) == 1) || // bracelet
               (byte(0xFC51) == 0 && prev(byte(0xFC51)) == 1))   // brooch
)

// BOTH
flag_achievement("Basic Bartering", "Get the magic lamp", 5, scene_antique_shop_interior, 0xFC6D)

// MIN
flag_achievement("Serpent Slayer", "Defeat the viper", 5, scene_mountain_top_2, 0xFC76)

// MAX
flag_achievement("A Horse of a Different Color", "Reveal the viper's true form", 10, scene_mountain_top_2, 0xFC77)

// BOTH
flag_achievement("What's Behind Door Number Two?", "Open the second door", 10, scene_door, 0xFC57)

// MIN
achievement("The Ferryman's Toll", "Pay for passage across the poisonous lake", 5,
    trigger = trigger_flag(0xFCC7) && 
              byte(0xFCAB) == 0 && // no wearing cloak and ring
              current_scene() == scene_s_poison_lake
)

// MAX
achievement("Daywalker", "Convince the ferryman that you're somebody else", 5,
    trigger = trigger_flag(0xFCC7) && 
              byte(0xFCAB) == 1 && // wearing cloak and ring
              current_scene() == scene_s_poison_lake
)

// MAX
achievement("Honorary Belmont", "Kill Dracula", 10,
    trigger = byte(0xFCBB) == 2 && prev(byte(0xFCBB)) == 1 && 
              current_scene() == scene_castle_coffin &&
              !is_debug_mode()
)

// MIN
achievement("It Burns", "Frighten Dracula away", 5,
    trigger = byte(0xFCBB) == 4 && prev(byte(0xFCBB)) == 3 &&
              !is_debug_mode()
)

// MIN
achievement("Through the Brambles", "Escape the island with the third key without eating the protective item", 10,
    trigger = current_scene() == scene_s_poison_lake &&
              unless(scene_loading()) &&
              byte(0xFCBD) == 1 && // has third key
              byte(0xFCA8) == 0 && // not eaten sugar
              !is_debug_mode()
)

// BOTH
flag_achievement("It's Bigger on the Inside", "Open the third door", 10, scene_door, 0xFC58)

// BOTH
function delayed_scene(scene) => repeated(150, current_scene() == scene) && unless(scene_loading())
achievement("Galloping Guppy", "Get a ride across the enchanted ocean", 5, id = 133925, badge="148356",
    trigger = !is_debug_mode() &&
              (delayed_scene(scene_enchanted_land_north_ocean) ||
               delayed_scene(scene_enchanted_land_middle_ocean) ||
               delayed_scene(scene_enchanted_land_south_ocean))
)

// BOTH
flag_achievement("The Guardian Subdued", "Find your way into the room at the top of the tower", 5, scene_tower_valanice, 0xFCD1)

// EITHER
achievement("Love at First Sight", "Show the woman you just met how much she means to you", 5, 
    trigger = current_scene() == scene_tower_valanice && 
              low4(0xCEB9) == 0x00 && // this seems to be flags about graham's sprite - when it's 0, he's offscreen?
              unless(scene_loading()) &&
              !is_debug_mode()
)

// EITHER
achievement("Blessed Union", "Make it all the way to the wedding with the fairy's protective spell", 5,
    trigger = byte(0xFC5B) > 0 &&
              current_scene() == scene_monastery_interior && 
              prior(current_scene()) == scene_tower_valanice && 
              unless(scene_loading()) &&
              !is_debug_mode()
)

// BOTH
achievement("Happily Ever After... For Now", "Get married and return home", 10,
    trigger = trigger_complete_game()
)

// MAX
achievement("The Royal Jewels", "Complete the quest with all five pieces of jewelry", 10,
    trigger = trigger_complete_game() &&
              byte(0xfc02) == scene_outro_outside_castle && // prevent loading different game after victory
              byte(0x0FC49) == 1 && item_in_inventory(item_bracelet) &&
              byte(0x0FC54) == 1 && item_in_inventory(item_necklace) &&
              byte(0x0FCB5) == 1 && item_in_inventory(item_earrings) &&
              byte(0x0FC40) == 1 && item_in_inventory(item_brooch) &&
              byte(0x0FCC2) == 1 && item_in_inventory(item_tiara)
)

// MAX
achievement("The Complete Quest", "Complete the quest with a perfect score.", 25,
    trigger = trigger_complete_game() && current_score() >= 185
)

// MIN
achievement("The Minimal Quest", "Get married and complete the quest with less than 105 points", 25,
    trigger = trigger_complete_game() && current_score() < 105 &&
              byte(0xfc02) == scene_outro_outside_castle // prevent loading different game after victory
)

// ============================================================
// Max score playthrough (~2 hours)
// ------------------------------------------------------------
// go north twice
//   GET TRIDENT [3>3]
// go north twice
//   GET SHELL
//   GET BRACELET [7>10]
// go east
//   GET STAKE [2>12]
// go south
//   bonus: LOOK SIGN for short descriptions of SQ1 and KQ3
//   nothing indicating there's a sign anywhere - ignore
// go south, then (swim) east
//   LOOK IN LOG
//   GET NECKLACE [7>19]
// go south, west, south, east
//   OPEN MAILBOX [1>20]
//   GET GOODIES [2>22]
// go west (SAVE A)
//   wait for little red riding hood (she also appears one scene south)
//   GIVE GOODIES TO GIRL [4>26] (get flowers)
//   ((Undelivered))
// go north, then east twice
//   go east an back until the dwarf shows up and let him steal a treasure [-7>19].
//   OPEN DOOR
// climb down the ladder, then go east
//   if you encounter the dwarf, leave and return
//   GET POT [2>21]
//   OPEN CHEST
//   GET EARRINGS [7>28]
//   GET NECKLACE (or whatever was stolen) [7>35]
//   ((I Wasn't Done With That))
// go west, climb the ladder and exit, then go north and east
//   walk behind the rock next to the tree and LOOK IN HOLE
//   GET MALLET [2>37]
// go south twice, then east
//   OPEN DOOR
//   approach the altar (SAVE C)
//   KNEEL, PRAY [2>39]
//   GRAHAM [2>41] (get cross)
// leave, go south
//   LOOK IN HOLE [1>42]
//   GET BROOCH [7>49]
// go west, north twice near the left side of the screen, and east near the middle of the screen
// go east again [1>50], and north
//   READ DOOR
// go south, west three times [1>51], south and west again
//   OPEN DOOR (SAVE D)
//   if the wolf is present, leave and re-enter
//   GIVE SOUP TO WOMAN [2>53]
//   ((The Better to Feed You With))
//   LOOK UNDER BED [4>57] (get ruby ring and black cloak)
// leave, go south twice and west twice
//   approach the mermaid (swim)
//   GIVE FLOWERS TO MERMAID [2>59]
//   RIDE SEAHORSE [2>61] (SAVE E)
//   GIVE TRIDENT TO KING [4>65]
//   GET KEY [5>70]
//   ((From One King to Another))
// go east (automatically back to beach)
// return to the magical door (east, north three times, east five times [1>71], north) (SAVE F)
//   UNLOCK DOOR [7>78]
//   ((A Door Within a Door))
//   READ DOOR
// go south, then west five times [1>79], enter the cave
//   you can actually get the birdcage while the witch is there
//   bonus: batmobile sometimes appears outside cave
//   LOOK BOTTLE
//   GET CLOTH [2>81]
//   PUT CLOTH OVER CAGE [2>83]
//   GET CAGE [2>85]
// leave, go south, east three times, south twice, and east
//   OPEN DOOR (SAVE G)
//   GIVE BIRD TO WOMAN [6>91] (get lamp)
//   ((Basic Bartering))
//   RUB LAMP [2>93]
//   wait for the genie to disappear
//   RUB LAMP [2>95] (get sword)
//   wait for the genie to disappear
//   RUB LAMP [2>97] (get bridle)
//   wait for the genie to disappear
//   RIDE CARPET [4>101]
// go east (SAVE H)
//   PUT BRIDLE ON SNAKE [5>106]
//   ((A Horse of a Different Color))
//   TALK TO HORSE [2>108]
// go east
//   bonus: LOOK IN HOLE near the middle rock to preview SQ [not in this version]
// go east
//   GET KEY [5>113]
// leave
//   RIDE CARPET
// go west, south four times, east twice [1>114], and north (SAVE I)
//   UNLOCK DOOR [7>121]
//   ((What's Behind Door Number Two?))
//   READ DOOR
// go south, west twice [1>122], north, west, and north (SAVE J)
//   WEAR RING
//   WEAR CLOAK [3>125]
//   GET IN BOAT
//   ((DAYWALKER))
//   GET OUT OF BOAT
//   EAT SUGAR [1>126]
//   WEAR CROSS [2>128]
// go north, approach the ghosts, then wait for them to disappear
//   OPEN DOOR
// go west and climb the stairs
//   OPEN DRAWER, GET CANDLE [2>130]
// go down the stairs and stop at the torch
//   LIGHT CANDLE [1>131]
// continue to the bottom and go east twice
//   GET MEAT [2>133]
// go east again and down the stairs, then west through the doorway
//   leave and return until the coffin in closed (SAVE K)
//   OPEN COFFIN
//   KILL VAMPIRE [7>140]
//   ((Honorary Belmont))
//   LOOK COFFIN
//   GET KEY [2>142]
//   GET CUSHION
//   GET KEY [5>147]
// go east, up the stairs, west, north, and up the stairs again
//   UNLOCK CHEST [1>148]
//   OPEN CHEST
//   GET TIARA [7>155]
// go back downstairs, west, south twice 
//   GET IN BOAT
// go east, south twice, east twice [1>156], and north (SAVE L)
//   UNLOCK DOOR [7>163]
// go north
//   GET NET [1>164]
// approach the water
//   FISH (repeat until successful) [2>166]
//   GET FISH
//   THROW FISH [3>169]
//   RIDE FISH [1>170]
//   ((Galloping Guppy))
// go east
//   GET AMULET [3>173]
//   can say HOME now to return back to Daventry without your bridge
// go south
//   OPEN DOOR
// climb (SAVE M)
//   GIVE MEAT TO LION [4>177]
//   OPEN DOOR [5>182]
//   ((Guardian Subdued))
//   TALK TO GIRL
//   GRAHAM
//   KISS GIRL
//   ((Love at First Sight))
//   HOME [3>185]
//   ((Blessed Union))
//   ((Happily Ever After... For Now))
//   ((The Royal Jewels))
//   ((The Complete Quest))

// ============================================================
// Min score playthrough (~70 minutes)
// ------------------------------------------------------------
// go east twice
//   OPEN MAILBOX [1>1]
//   GET GOODIES [2>3]
// go west
//   wait for little red riding hood (she also appears one scene south)
//   GIVE GOODIES TO GIRL [4>7] (get flowers)
//   ((Undelivered))
// go east four times
//   OPEN DOOR
//   KNEEL (SAVE N)
//   PRAY [2>9]
//   GRAHAM [2>11]
// leave, go south
//   GET BROOCH [7>18]
// go west, south five times, east twice [1>19], and north
//   READ DOOR
// go south, west four times [1>20], north, west twice
//   GET TRIDENT [3>23]
// go north twice
//   approach the mermaid (swim) (SAVE O)
//   GIVE FLOWERS TO MERMAID [2>25]
//   RIDE SEAHORSE [2>27]
//   WAVE TRIDENT [2>29]
//   GET KEY [5>34]
//   ((Finders Keepers))
// go east (automatically back to beach)
// go south
//   GET SHELL
//   GET BRACELET [7>41]
// go east twice, south twice
//   LOOK IN LOG
//   GET NECKLACE [7>48]
// go south, east four times [1>49], then north
//   UNLOCK DOOR [7>56]
//   ((A Door Within a Door))
//   READ DOOR
// go south, west twice [1>57], south three times, and east
//   OPEN DOOR
//   GIVE NECKLACE TO WOMAN [-7>50]
//   GIVE BRACELET TO WOMAN [-2>48] (get lamp)
//   ((Basic Bartering))
//   RUB LAMP [2>50] (get carpet)
//   wait for the genie to disappear
//   RUB LAMP [2>52] (get sword)
//   wait for the genie to disappear
//   RIDE CARPET [4>56]
// go east (SAVE P)
//   KILL SNAKE [2>58]
//   ((Serpent Slayer))
// go east twice
//   GET KEY [5>63]
// leave
//   RIDE CARPET
// go west, south four times, east twice [1>64], and north
//   UNLOCK DOOR [7>71]
//   ((What's Behind Door Number Two?))
//   READ DOOR
// go south, west twice [1>72], north, west, and north (SAVE Q)
//   GIVE BROOCH TO MAN [-7>65]
//   GET IN BOAT
//   ((The Ferryman's Toll))
//   GET OUT OF BOAT
//   WEAR CROSS [2>67]
// go north, approach the ghosts to make them disappear
//   OPEN DOOR
// go west and climb the stairs
//   OPEN DRAWER, GET CANDLE [2>69]
// go down the stairs and stop at the torch
//   LIGHT CANDLE [1>70]
// continue to the bottom and go east three times and down the stairs, then west through the doorway
//   save the game (SAVE R)
//     leave and return until the coffin in closed
//     OPEN COFFIN
//     wait for him to try to bite you, he will be scared off by the cross [3 points]
//     reload the game
//   leave and return until the coffin in open
//   LOOK COFFIN
//   GET PILLOW
//   GET KEY [5>75]
// go east, climb the stairs, west, and south twice (avoid running into dracula as it gives 3 points) (SAVE S)
//   GET IN BOAT
//   ((Through the Brambles))
// go east, south twice, east twice [1>76], and north
//   UNLOCK DOOR [7>83]
//   ((It's Bigger on the Inside))
// go north 
//   GET NET [1>84]
// go south twice
//   FISH (SAVE T)
//   GET FISH
//   THROW FISH [3>89]
//   RIDE FISH [1>90]
//   ((Galloping Guppy))
// go north twice, then east
//   GET AMULET [3>93]
// go up three times (SAVE U)
//   KILL LION [2>95]
//   OPEN DOOR [5>100]
//   ((The Guardian Subdued))
//   HOME [3>103]
//   ((Happily Ever After... For Now))
//   ((The Minimal Quest))
