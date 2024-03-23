// Gold Rush!
// #ID = 18959

// apple2online [nib] = 1.0M - 16 Nov 1989
// * Disk1 Front: 80b6deabbb5b5247ee0b6f8789c13a5f
// * Disk1 Back : a6562555bccda8ec0d922116f0f8a2f3
// * Disk2 Front: 37b1ca220dd416bef7c7c121042e4bc8
// * Disk2 Back : 0b100145851fd28e2cd47883046efd41
// * Disk3 Front: 231f53e8de4e704124bbccc16a792706
// * Disk3 Back : 527f782b50acbc0d38798fd6f71684d3 <!-- game does not recognize
// * Disk4 Front: 4038b55240a5d0e9799ed915040a1314
// * Disk4 Back : 6fbe3b1a817601be379c87095a167500
// * Disk5 Front: 86416611968327ad88bec8d175225d59
// * Disk5 Back : 7651e9866864fde3f30f1dfbdda75804
// * Disk6 Front: 8e56688b6712e63081be06a902a3917f
// * Disk6 Back : 50e869698dd97358251fe703a3bc949a
// * Disk7 Front: bb2a19b596970a84ca77603ccf62e752
// * Disk7 Back : d3d5066993ce708b36034b5950884147
// * Disk8 Front: fc4f32c78698c560c450aa3358d8a39f
// * Disk8 Back : bd945a914bcef89d4c8785d25f62d3bd

// woz-a-day = 1.0M - 16 Nov 1989
// * Disk1 Front: 0c21eeed49f7eaa4ad68948626639b03
// * Disk1 Back : d09912eede9424eafc4ad463fee93eba
// * Disk2 Front: bdcfed7a8d7d3146cf061a45fa2c84d8
// * Disk2 Back : 53ce40c404777fb07d6797b27a13d81b
// * Disk3 Front: cc578760f16cf582da130725016c4244
// * Disk3 Back : c0f155abf5cab2b5f3d3258d69f63547
// * Disk4 Front: 7b523fd100e14f721c9cdc548ebd48bb
// * Disk4 Back : 5afa32799f94e53cb3825d49adff8a45
// * Disk5 Front: 434a9d62a1577e21d362ba56d6445f9f
// * Disk5 Back : e7f0f9f6f27fe2ee535a8a187fa5994b
// * Disk6 Front: af9f48002cf9412fb346912669a55de6
// * Disk6 Back : ca650f407d3bd06d400c10342d3853bb
// * Disk7 Front: bb76158b741ed7d5e9c403858149ecbe
// * Disk7 Back : 0ed1ef9c085aca863340ea948449e847
// * Disk8 Front: 18df775193b32eab624b8bf1cbc39e61
// * Disk8 Back : 9b9a67399b2cb7ff3dd4e9d2270a2321

// Copy protection:
// * https://apple2online.com/wp-content/uploads/Gold-Rush-California-Gold.pdf
//
// PAGE PARAGRAPH  ANSWER
//   2       1     CARPENTER
//   2       6     CALIFORNIA
//   2    LAST     POLK
//   3       3     OVERLAND
//   8       2     ELEPHANT
//   9       2     HORACE
//  10       5     CHOLERA
//  11    LAST     BANANAS
//  13       2     CHAGRES
//  13    LAST     IGUANA
//  15       5     ALVARADO
//  15    LAST     INDIANS
//  16       2     SAWMILL
//  16       5     APOTHECARY
//  17       8     BRANNAN
//  18       2     SACRAMENTO
//  20       4     EAGLE
//  23       1     CRIME
//  24       1     BRONZE
//  24    LAST     AMERICAN
//  25    LAST     HANGTOWN
//  27       5     ARMOUR
//  27       6     STUDEBAKER
//  27    LAST     SNOWSHOE
//  28       1     SILVER
//  28    LAST     PLACERVILLE
//  29       4     CLAUDE
//  29       6     NEWYORK
//  30       1     JENKINS
//  30    LAST     PANCAKES
//  31    LAST     RATTLESNAKE
//  33       5     PHIPPS
//  33    LAST     LUMBER
//  34       3     FOLSOM
//  34       5     HOTEL
//  34       6     MAY
//  36    LAST     JACKSON
//  38       7     BOLTON
//  41       2     RASPBERRY
//  41    LAST     TWAIN
//  46       3     HOOSEGOW
//  48       1     MOKELUMNE
//  53       2     KENNEDY
//  56    LAST     HAYWARD
//  58       2     FOUNDRY
//  60       4     KEYSTONE
//  62    LAST     SCURVY
//  63       2     BEAR
//  68       1     SCHOOLHOUSE
//  72       3     YOSEMITE
//  76       4     MALAKOFF
//  79       2     STANFORD

// To create a save disk, once the game has started:
// * Click on the drive 2 icon. When it prompts you to select a disk, enter a name for the save disk - 
//   i.e. "Save Disk.nib" (extension must match disk in drive 1) - and press Open
// * Type INIT DISK and press return.
// * Press 2 to select the second drive.
// * Press return - expect "The disk has been initialized"
// * Press return

// * HOTKEYS (shown in help)
//   1: Help
//   2: Toggle sound
//   3: Repeat previous command
//   4: Toggle score bar
//   5: Save Game
//   6: Show timer
//   7: Restore Game
//   8: Toggle trek messages
//   9: Restart
//   0: Go to next trek screen
// TAB: Inventory

// type BIRD MAN to bring up the version information and enable cheats
// * GET OBJECT <enter> [room#] <enter> : teleport to room

function item_location(item_id) => byte(0x14A4 + item_id * 3)

item_pipe = 1
item_house_key = 2
item_nails = 3
item_manure = 4
item_shovel = 5
item_cash_15 = 6
item_cash_165 = 7
item_cash_215 = 8
item_cash_415 = 9
item_cash_665 = 10
item_cash_765 = 11
item_cash_865 = 12
item_cash_965 = 13
item_cash_1065 = 14
item_bank_statement = 15
item_gold_flake = 16
item_message_for_room_11 = 18
item_family_photo = 19
item_gold_coin = 20
item_flowers = 21
item_cape_horn_ticket = 22
item_panama_ticket = 23
item_stage_coach_ticket = 24
item_letter = 25
item_bible = 26
item_stick = 27
item_string = 28
item_metal_scraps = 29
item_paperclip = 30
item_piece_of_ham = 31
item_fish = 33
item_gold_disk = 34
item_lumber = 35
item_rope = 36
item_bucket = 37
item_chain = 38
item_mosquito_net = 39
item_lantern = 40
item_citrus_fruit = 41
item_flour = 42
item_peas = 43
item_beans = 44
item_vegetables = 45
item_pick = 46
item_gold_pan = 47
item_mule = 48
item_branding_iron = 49
item_envelope = 50
item_steel_key = 51
item_james_mule = 52
item_magnet = 53
item_note_from_jake = 55
item_mule2 = 56
item_matches = 57
item_aerogram = 58
item_goldmine_expert_bonus = 59
item_gold_37 = 60
item_gold_98 = 61
item_gold_156 = 62
item_gold_207 = 63
item_gold_243 = 64
item_gold_298 = 65
item_gold_337 = 66
item_gold_395 = 67
item_gold_427 = 68
item_gold_484 = 69
item_gold_532 = 70
item_gold_577 = 71
item_gold_621 = 72
item_gold_679 = 73
item_gold_747 = 74
item_gold_793 = 75
item_gold_849 = 76
item_gold_898 = 77
item_gold_937 = 78
item_gold_982 = 79
item_gold_1040 = 80
item_gold_1099 = 81
item_gold_1147 = 82
item_gold_1255 = 84
item_gold_1302 = 85
item_gold_1364 = 86
item_gold_1421 = 87
item_gold_1482 = 88
item_gold_1529 = 89
item_gold_1587 = 90
item_gold_1633 = 91
item_gold_1679 = 92
item_gold_1762 = 93
item_gold_1849 = 94
item_gold_1890 = 95
item_gold_1941 = 96
item_gold_1994 = 97
item_gold_2023 = 98
item_gold_2076 = 99
item_gold_2142 = 100
item_gold_2208 = 101
item_gold_2265 = 102
item_gold_2327 = 103
item_gold_2478 = 105
item_gold_2506 = 104
item_gold_2526 = 106
item_gold_2587 = 107
item_gold_2643 = 108
item_gold_2698 = 109
item_gold_2783 = 110
item_gold_2874 = 111
item_gold_2988 = 112
item_gold_3123 = 113
item_gold_3247 = 114
item_gold_3375 = 115
item_gold_3516 = 116
item_gold_3632 = 117
item_gold_3751 = 119
item_gold_3869 = 120
item_gold_3994 = 121
item_gold_4137 = 122
item_gold_4309 = 123
item_gold_4464 = 124
item_gold_4695 = 125
item_gold_4821 = 126
item_gold_4978 = 127
item_gold_5083 = 128
item_gold_5232 = 129
item_gold_5387 = 130

// type BIRD MAN to bring up the version information and enable cheats
// * TP <enter> [room#] <enter> : teleport to room

// also 03af, 1d30, 1d32, fed3, ff00, and ffd6
function current_scene() => byte(0xFED3)

scene_none = 0x00
scene_brooklyn_path_top_middle = 0x01
scene_brooklyn_path_top_right = 0x02
scene_brooklyn_path_bottom_right = 0x03
scene_brooklyn_path_bottom_middle = 0x04
scene_brooklyn_gazebo = 0x05
scene_brooklyn_park = 0x06
scene_brooklyn_dock = 0x07
scene_brooklyn_bank_exterior = 0x08
scene_brooklyn_post_office_exterior = 0x09
scene_brooklyn_boardwalk = 0x0A
scene_coloma_green_pastures_room_11 = 0x0B
scene_coloma_green_pastures_room_12 = 0x0C
scene_brooklyn_grocer_exterior = 0x0D
scene_brooklyn_ferry_dock = 0x0E
scene_brooklyn_travel_exterior = 0x0F
scene_brooklyn_livery_exterior = 0x10
scene_brooklyn_evening_star_exterior = 0x11
scene_brooklyn_graveyard_left = 0x12
scene_brooklyn_graveyard_center = 0x13
scene_brooklyn_graveyard_overlook = 0x14
scene_brooklyn_ferry_crossing = 0x15
scene_brooklyn_bank_interior = 0x16
scene_brooklyn_storehouse = 0x17
scene_brooklyn_post_office_interior = 0x18
scene_brooklyn_jarrods_house_interior = 0x19
scene_brooklyn_storehouse_poster = 0x1A
scene_brooklyn_evening_star_interior = 0x1B
scene_brooklyn_hardware_store = 0x1C
scene_brooklyn_dock_empty = 0x1D
scene_brooklyn_ferry_dock_docked = 0x1E
scene_brooklyn_travel_interior = 0x1F
scene_brooklyn_grocer_interior = 0x20
// 0x21 is Exodus 20

scene_welcome_to_chagres_river = 0x22
scene_map_north_america = 0x23
scene_map_atlantic_ocean = 0x24
scene_map_south_america = 0x25
scene_map_south_america_south = 0x26
scene_map_central_america = 0x27
scene_map_panama = 0x28
scene_map_chagres_river = 0x29
// 0x2A doesn't exist

scene_steamboat_middle = 0x2B
// 0x2C doesn't exist
scene_steamboat_left = 0x2D
scene_steamboat_left_half_coal = 0x2E
scene_steamboat_left_no_coal = 0x2F
scene_steamboat_right = 0x30
scene_steamboat_right_half_rations = 0x31
scene_steamboat_right_no_rations = 0x32

scene_panama_river_mouth = 0x33
scene_panama_river_natives = 0x34

scene_steamboat_deck = 0x35
// 0x36 doesn't exist
scene_steamboat_middle_storm = 0x37
// 0x38 doesn't exist
// 0x39 doesn't exist
// 0x3A doesn't exist
// 0x3B doesn't exist

scene_map_us = 0x3C
// 0x3D doesn't exist
scene_map_kansas = 0x3E
// 0x3F doesn't exist
scene_map_nebraska = 0x40
// 0x41 triggers the Cholera ending
scene_map_wyoming = 0x42
// 0x43 doesn't exist
scene_map_wyoming2 = 0x44
// 0x45 doesn't exist
// 0x46 doesn't exist
scene_rio_de_janeiro = 0x47

scene_sacramento_city = 0x48
scene_intro_logo = 0x49
scene_boat_sinking = 0x4A
scene_map_san_francisco = 0x4B
scene_sutters_fort = 0x4C
scene_sutters_fort_behind = 0x4D
scene_sutters_fort_entrance = 0x4E
scene_sutters_fort_blacksmith = 0x4F
scene_sutters_fort_doors = 0x50
scene_sutters_fort_mules = 0x51
scene_sutters_fort_doorway = 0x52
scene_sutters_fort_stairs = 0x53
scene_sutters_fort_doors2 = 0x54
scene_sutters_fort_graveyard_doorway = 0x55
scene_sutters_fort_sign = 0x56
scene_sutters_fort_courtyard = 0x57
scene_sutters_fort_stable = 0x58
scene_sutters_fort_stable2 = 0x59
scene_sutters_fort_cemetary = 0x5A
scene_sutters_fort_gravestone = 0x5B

scene_panama_river_huts = 0x5C
scene_panama_tree = 0x5D
scene_panama_bush = 0x5E
scene_panama_swamp = 0x5F
scene_panama_city = 0x60

// 0x61 death by dysentary (no image)
// 0x62 doesn't exist (98)
// 0x63 doesn't exist
// 0x64 doesn't exist
// 0x65 brings up the help screen
// 0x66 doesn't exist
// 0x67 doesn't exist
// 0x68 doesn't exist
// 0x69 doesn't exist
// 0x6A doesn't exist
// 0x6B doesn't exist
// 0x6C doesn't exist
// 0x6D is Genesis 1
// 0x6E doesn't exist

scene_map_nevada = 0x6F
// 0x70 is death by snake (no image)
scene_map_northern_california = 0x71
scene_independence_camp = 0x72
scene_independence_camp_east = 0x73
scene_independence_stables = 0x74
scene_independence_grasslands = 0x75
scene_steep_hill = 0x76
scene_steep_hill2 = 0x77
scene_desert = 0x78

scene_california_loading = 0x79
scene_california_loading2 = 0x7A
scene_california_loading3 = 0x7B
scene_california_loading4 = 0x7C
scene_california_loading5 = 0x7D
scene_california_loading6 = 0x7E
scene_california_loading7 = 0x7F
scene_california_loading8 = 0x80
scene_california_loadingX = 0x81
scene_california_loadingX2 = 0x82
scene_california_loadingX3 = 0x83
scene_california_loadingX4 = 0x84

scene_coloma_green_pastures_exterior = 0x88
scene_coloma_green_pastures_lobby = 0x89
scene_coloma_green_pastures_hallway_10 = 0x8A
scene_coloma_green_pastures_hallway_13 = 0x8B
scene_coloma_green_pastures_hallway_23 = 0x8D

scene_jakes_cabin_interior = 0x91
scene_jakes_cabin_outhouse = 0x92
scene_jakes_mine_entrance = 0x93
scene_jakes_mine_door = 0x94
scene_jakes_mine_shaft_middle = 0x95
scene_jakes_mine_shaft_top = 0x96
scene_jakes_mine_shaft_bottom = 0x97
scene_jakes_mine_right_deadend = 0x98
scene_jakes_mine_right_pit = 0x99
scene_jakes_mine_shaft2_top = 0x9A
scene_jakes_mine_shaft2_middle = 0x9B
scene_jakes_mine_shaft2_bottom = 0x9C
scene_jakes_mine_tunnel = 0x9D
scene_jakes_mine_shaft3_top = 0x9E
scene_jakes_mine_left_deadend = 0x9F
scene_jakes_mine_shaft3_middle = 0xA0
scene_jakes_mine_shaft3_bottom = 0xA1
scene_jakes_mine_jake = 0xA2
// 0xA3 doesn't exist

scene_california_loading9 = 0xA4
scene_california_loading10 = 0xA5
scene_california_loading11 = 0xA6
scene_california_loading12 = 0xA7
scene_california_loading13 = 0xA8
scene_california_loading14 = 0xA9
scene_california_loading15 = 0xAA
scene_california_wilderness = 0xAB
scene_california_wilderness2 = 0xAC
scene_california_wilderness3 = 0xAD
scene_california_wilderness4 = 0xAE
scene_california_wilderness5 = 0xAF
scene_california_wilderness6 = 0xB0
scene_california_wilderness7 = 0xB1
scene_california_wilderness8 = 0xB2
scene_california_wilderness9 = 0xB3
scene_california_wilderness10 = 0xB4

scene_sutters_sawmill_tailrace = 0xB5
scene_sutters_sawmill = 0xB6
scene_sutters_sawmill_logs = 0xB7

scene_coloma_northwest = 0xB8
scene_coloma_north = 0xB9
scene_coloma_northeast = 0xBA
scene_coloma_west = 0xBB
scene_coloma_east = 0xBC
scene_coloma_south = 0xBD
scene_coloma_southeast = 0xBE

scene_copy_protection = 0xBF
scene_hanging = 0xC0
scene_jakes_mine_river = 0xC1
scene_jakes_mine_door_closeup = 0xC2
scene_intro_jerrod_frame = 0xC3
scene_intro_black_circle = 0xC4
// 0xC5 doesn't exist
scene_intro_four_frames = 0xC6
scene_intro_four_frames_zoomed = 0xC7
scene_intro_title = 0xC8
// 0xC9 doesn't exist
// 0xCA doesn't exist
// 0xCB doesn't exist
scene_leaving_brooklyn = 0xCC
// 0xCD doesn't exist

scene_steamboat_middle_cape_horn = 0xCE
// 0xCF doesn't exist
scene_map_south_america_west = 0xD0
// 0xD1 doesn't exist
// 0xD2 doesn't exist

scene_jakes_mine_entrance_dark = 0xD3
scene_jakes_mine_door_dark = 0xD4
scene_jakes_mine_shaft_middle_dark = 0xD5
scene_jakes_mine_shaft_top_dark = 0xD6
scene_jakes_mine_shaft_bottom_dark = 0xD7
scene_jakes_mine_right_deadend_dark = 0xD8
scene_jakes_mine_right_pit_dark = 0xD9
scene_jakes_mine_shaft2_top_dark = 0xDA
scene_jakes_mine_shaft2_middle_dark = 0xDB
scene_jakes_mine_shaft2_bottom_dark = 0xDC
scene_jakes_mine_tunnel_dark = 0xDD
scene_jakes_mine_shaft3_top_dark = 0xDE
scene_jakes_mine_left_deadend_dark = 0xDF
scene_jakes_mine_shaft3_middle_dark = 0xE0
scene_jakes_mine_shaft3_bottom_dark = 0xE1
// 0xE2 doesn't exist
scene_jakes_mine_river_logo = 0xE3
// 0xE4-0xF1 don't exist

scene_coloma_green_pastures_ledge = 0xF2
scene_coloma_green_pastures_ledge2 = 0xF3
scene_jakes_cabin_exterior = 0xF4

scene_inventory = 0xFF

scenes = {
    scene_none: "waiting to be loaded",
    scene_copy_protection: "answering trivia",
    scene_hanging: "being hanged",

    scene_intro_logo: "watching the intro",
    scene_intro_jerrod_frame: "watching the intro",
    scene_intro_black_circle: "watching the intro",
    scene_intro_four_frames: "watching the intro",
    scene_intro_four_frames_zoomed: "watching the intro",
    scene_intro_title: "watching the intro",
    
    scene_brooklyn_path_top_middle: "wandering around Brooklyn",
    scene_brooklyn_path_top_right: "wandering around Brooklyn",
    scene_brooklyn_path_bottom_middle: "wandering around Brooklyn",
    scene_brooklyn_path_bottom_right: "wandering around Brooklyn",
    scene_brooklyn_gazebo: "wandering around Brooklyn",
    scene_brooklyn_park: "wandering around Brooklyn",
    scene_brooklyn_dock: "wandering around Brooklyn",
    scene_brooklyn_dock_empty: "wandering around Brooklyn",
    scene_brooklyn_bank_exterior: "wandering around Brooklyn",
    scene_brooklyn_post_office_exterior: "wandering around Brooklyn",
    scene_brooklyn_evening_star_exterior: "wandering around Brooklyn",
    scene_brooklyn_livery_exterior: "wandering around Brooklyn",
    scene_brooklyn_travel_exterior: "wandering around Brooklyn",
    scene_brooklyn_ferry_dock: "wandering around Brooklyn",
    scene_brooklyn_ferry_crossing: "leaving Brooklyn",
    scene_brooklyn_ferry_dock_docked: "leaving Brooklyn",
    scene_brooklyn_grocer_exterior: "wandering around Brooklyn",
    scene_brooklyn_boardwalk: "wandering around Brooklyn",
    scene_brooklyn_graveyard_left: "wandering around Brooklyn",
    scene_brooklyn_graveyard_center: "wandering around Brooklyn",
    scene_brooklyn_graveyard_overlook: "wandering around Brooklyn",
    
    scene_brooklyn_jarrods_house_interior: "in his house",
    scene_brooklyn_hardware_store: "in the hardware store",
    scene_brooklyn_travel_interior: "in the travel office",
    scene_brooklyn_post_office_interior: "in the post office",
    scene_brooklyn_evening_star_interior: "in the business office",
    scene_brooklyn_bank_interior: "in the bank",
    scene_brooklyn_storehouse: "in the storehouse",
    scene_brooklyn_storehouse_poster: "in the storehouse",
    scene_brooklyn_grocer_interior: "in the grocery store",
    
    scene_leaving_brooklyn: "leaving Brooklyn",
    scene_map_north_america: "on a boat",

    scene_map_panama: "traversing the jungles of Panama",
    scene_welcome_to_chagres_river: "traversing the jungles of Panama",   
    scene_panama_river_mouth: "traversing the jungles of Panama",
    scene_panama_river_natives: "traversing the jungles of Panama",
    scene_panama_river_huts: "traversing the jungles of Panama",
    scene_panama_tree: "traversing the jungles of Panama",
    scene_panama_bush: "traversing the jungles of Panama",
    scene_panama_swamp: "traversing the jungles of Panama",
    scene_panama_city: "traversing the jungles of Panama",

    scene_steamboat_deck: "on a boat",
    scene_steamboat_left: "on a boat",
    scene_steamboat_middle: "on a boat",
    scene_steamboat_right: "on a boat",
    scene_map_atlantic_ocean: "on a boat",
    scene_steamboat_left_half_coal: "on a boat",
    scene_steamboat_right_half_rations: "on a boat",
    scene_map_south_america: "on a boat",
    scene_rio_de_janeiro: "on a boat",
    scene_map_south_america_south: "on a boat",
    scene_steamboat_middle_cape_horn: "on a boat",
    scene_steamboat_middle_storm: "on a boat",
    scene_map_south_america_west: "on a boat",
    scene_map_central_america: "on a boat",
    scene_steamboat_right_no_rations: "on a boat",
    scene_steamboat_left_no_coal: "on a boat",
    scene_boat_sinking: "on a boat",
    
    scene_map_us: "taking a wagon west",
    scene_independence_camp: "at the Independence camp",
    scene_independence_camp_east: "at the Independence camp",
    scene_independence_stables: "at the Independence camp",
    scene_independence_grasslands: "at the Independence camp",
    scene_map_kansas: "taking a wagon west",
    scene_map_nebraska: "taking a wagon west",
    scene_map_wyoming: "taking a wagon west",
    scene_map_wyoming2: "taking a wagon west",
    scene_steep_hill: "taking a wagon west",
    scene_steep_hill2: "taking a wagon west",
    scene_map_nevada: "taking a wagon west",
    scene_map_northern_california: "taking a wagon west",
    scene_desert: "taking a wagon west",

    scene_map_chagres_river: "arriving in California",
    scene_sacramento_city: "in California",
    scene_map_san_francisco: "in California",
    
    scene_sutters_fort: "wandering around Sutter's Fort",
    scene_sutters_fort_entrance: "wandering around Sutter's Fort",
    scene_sutters_fort_behind: "wandering around Sutter's Fort",
    scene_sutters_fort_blacksmith: "wandering around Sutter's Fort",
    scene_sutters_fort_doors: "wandering around Sutter's Fort",
    scene_sutters_fort_mules: "wandering around Sutter's Fort",
    scene_sutters_fort_doorway: "wandering around Sutter's Fort",
    scene_sutters_fort_graveyard_doorway: "wandering around Sutter's Fort",
    scene_sutters_fort_doors2: "wandering around Sutter's Fort",
    scene_sutters_fort_sign: "wandering around Sutter's Fort",
    scene_sutters_fort_courtyard: "wandering around Sutter's Fort",
    scene_sutters_fort_stairs: "wandering around Sutter's Fort",
    scene_sutters_fort_cemetary: "wandering around Sutter's Fort",
    scene_sutters_fort_gravestone: "wandering around Sutter's Fort",
    scene_sutters_fort_stable: "wandering around Sutter's Fort",
    scene_sutters_fort_stable2: "wandering around Sutter's Fort",
    
    scene_california_loading: "exploring the California Wilderness",
    scene_california_loading2: "exploring the California Wilderness",
    scene_california_loading3: "exploring the California Wilderness",
    scene_california_loading4: "exploring the California Wilderness",
    scene_california_loading5: "exploring the California Wilderness",
    scene_california_loading6: "exploring the California Wilderness",
    scene_california_loading7: "exploring the California Wilderness",
    scene_california_loading8: "exploring the California Wilderness",
    scene_california_loading9: "exploring the California Wilderness",
    scene_california_loading10: "exploring the California Wilderness",
    scene_california_loading11: "exploring the California Wilderness",
    scene_california_loading12: "exploring the California Wilderness",
    scene_california_loading13: "exploring the California Wilderness",
    scene_california_loading14: "exploring the California Wilderness",
    scene_california_loading15: "exploring the California Wilderness",
    scene_california_loadingX: "exploring the California Wilderness",
    scene_california_loadingX2: "exploring the California Wilderness",
    scene_california_loadingX3: "exploring the California Wilderness",
    scene_california_loadingX4: "exploring the California Wilderness",
    scene_california_wilderness: "exploring the California Wilderness",
    scene_california_wilderness2: "exploring the California Wilderness",
    scene_california_wilderness3: "exploring the California Wilderness",
    scene_california_wilderness4: "exploring the California Wilderness",
    scene_california_wilderness5: "exploring the California Wilderness",
    scene_california_wilderness6: "exploring the California Wilderness",
    scene_california_wilderness7: "exploring the California Wilderness",
    scene_california_wilderness8: "exploring the California Wilderness",
    scene_california_wilderness9: "exploring the California Wilderness",
    scene_california_wilderness10: "exploring the California Wilderness",
    
    scene_sutters_sawmill_tailrace: "wandering around Sutter's Sawmill",
    scene_sutters_sawmill: "wandering around Sutter's Sawmill",
    scene_sutters_sawmill_logs: "wandering around Sutter's Sawmill",
    
    scene_coloma_northwest: "wandering around Coloma",
    scene_coloma_north: "wandering around Coloma",
    scene_coloma_northeast: "wandering around Coloma",
    scene_coloma_west: "wandering around Coloma",
    scene_coloma_south: "wandering around Coloma",
    scene_coloma_southeast: "wandering around Coloma",
    scene_coloma_east: "wandering around Coloma",
    scene_coloma_green_pastures_exterior: "wandering around Coloma",
    scene_coloma_green_pastures_lobby: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_hallway_23: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_hallway_13: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_hallway_10: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_room_11: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_room_12: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_ledge: "in the Green Pastures Hotel",
    scene_coloma_green_pastures_ledge2: "in the Green Pastures Hotel",
    
    scene_jakes_cabin_exterior: "exploring Jake's cabin",
    scene_jakes_cabin_interior: "exploring Jake's cabin",
    scene_jakes_cabin_outhouse: "exploring Jake's cabin",

    scene_jakes_mine_entrance: "exploring Jake's mine",
    scene_jakes_mine_door: "exploring Jake's mine",
    scene_jakes_mine_door_closeup: "exploring Jake's mine",
    scene_jakes_mine_shaft_middle: "exploring Jake's mine",
    scene_jakes_mine_shaft_top: "exploring Jake's mine",
    scene_jakes_mine_shaft_bottom: "exploring Jake's mine",
    scene_jakes_mine_right_deadend: "exploring Jake's mine",
    scene_jakes_mine_right_pit: "exploring Jake's mine",
    scene_jakes_mine_shaft2_top: "exploring Jake's mine",
    scene_jakes_mine_shaft2_middle: "exploring Jake's mine",
    scene_jakes_mine_shaft2_bottom: "exploring Jake's mine",
    scene_jakes_mine_tunnel: "exploring Jake's mine",
    scene_jakes_mine_shaft3_top: "exploring Jake's mine",
    scene_jakes_mine_left_deadend: "exploring Jake's mine",
    scene_jakes_mine_shaft3_middle: "exploring Jake's mine",
    scene_jakes_mine_shaft3_bottom: "exploring Jake's mine",
    scene_jakes_mine_jake: "exploring Jake's mine",
    scene_jakes_mine_river: "exploring Jake's mine",
    scene_jakes_mine_river_logo: "exploring Jake's mine",
        
    scene_jakes_mine_entrance_dark: "exploring Jake's mine",
    scene_jakes_mine_door_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft_middle_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft_top_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft_bottom_dark: "exploring Jake's mine",
    scene_jakes_mine_right_deadend_dark: "exploring Jake's mine",
    scene_jakes_mine_right_pit_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft2_top_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft2_middle_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft2_bottom_dark: "exploring Jake's mine",
    scene_jakes_mine_tunnel_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft3_top_dark: "exploring Jake's mine",
    scene_jakes_mine_left_deadend_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft3_middle_dark: "exploring Jake's mine",
    scene_jakes_mine_shaft3_bottom_dark: "exploring Jake's mine",
}

function current_score() => byte(0xFF03)
function max_score() => byte(0xFF07)

rich_presence_display("Jerrod is {0}, {1} of {2} points",
    rich_presence_lookup("Scene", current_scene(), scenes),
    rich_presence_value("Score", current_score()),
    rich_presence_value("Score", max_score())
)

function complete_game() => current_scene() == 0xFF
function needed_disk() => byte(0xB7EB)

function timer_seconds() => byte(0xFF98)
function timer_minutes() => byte(0xFF99)
function timer_hours() => byte(0xFF9A)

leaderboard("Fastest Completion", "Complete the game as fast as possible",
   start = needed_disk() > 1 && needed_disk() < 0x1F &&
           word(0xFF32) != 0 && // Jerrod has a location
           byte(0xFED8) != 0,   // user can type
   cancel = always_false(),
   submit = complete_game(),
   value = timer_hours() * 3600 + timer_minutes() * 60 + timer_seconds(),
   format = "SECS"
)

function is_debug_mode() => bit7(0xFEFA) == 1
function in_game_general() => current_scene() != scene_none && 
                              needed_disk() != 0x1F && // not loading save game
                              !is_debug_mode()
function in_game() => in_game_general() &&
                      byte(0xB7EB) != 0 // zero when resetting, and during screen transitions

function trigger_get_item_general(item) => in_game() &&
                                           item_location(item) == scene_inventory && 
                                           prev(item_location(item)) != scene_inventory
function trigger_get_item(item, scene) => in_game() &&
                                          current_scene() == scene && 
                                          item_location(item) == scene_inventory && 
                                          prev(item_location(item)) != scene_inventory

function bit_changed(flag) => flag == 1 && prev(flag) != 1
function trigger_flag(flag) => in_game() && bit_changed(flag)
function trigger_scene_flag(scene, flag) => in_game() && current_scene() == scene && trigger_flag(flag)

function dialog_on_screen() => byte(0x8895) == 1

// ====================================
// Note: the Panama route gives five more points than the other routes, so it's required for getting the
// maximum score. However, the boat may leave without you, so it's also the most time-sensitive. There's
// a lot of things you have to do to get the maximum points.

// ===== COMMON ROUTE =====
// Go south. Walk to the gate.
//   UNLOCK GATE
// Walk to the door.
//   UNLOCK DOOR
// Walk around to the table.
//   LOOK ALBUM [0 > 2]
//   GET PHOTOGRAPH [2 > 6]

achievement("Family", "Get the family photograph", 3,
    trigger = trigger_get_item(item_family_photo, scene_brooklyn_jarrods_house_interior)
)

// Walk over to the desk.
//   CLOSE DESK
//   GET STATEMENT [2 > 8]
// Leave. Walk through the gate
//   SELL HOUSE
// The real estate agent won't show up until 3:00 in-game time. We'll be back later.
// Walk west. Walk into the gazebo, making sure not to step on the grass. (You lose one point each time you
//   step on the grass. If you do it three times, the constable comes. If he catches you, you lose another
//   four points. You can repeat this until you have a score of zero).
//   GET FLOWERS [2 > 10]
//   LOOK CRACK. If you don't see the coin, move a bit and look again.
//   {{ SAVE A }}
//   GET COIN [4 > 14]

achievement("Finders Keepers", "Find the gold coin in Brooklyn Park", 5, 
    trigger_scene_flag(scene_brooklyn_gazebo, bit1(0xFEF4))
)

// Walk west, then north and enter the bank.
// Stand by the left teller window and the teller will approach you.
//   READ STATEMENT [2 > 16] - note the account number. You'll need it in a second.
//   GET MONEY, (account number) [3 > 19]
// Leave the bank. Go north and enter the storehouse. Walk to the nearest post on the right.
//   LOOK POSTER [2 > 21]
// Leave the storehouse. Go south twice and east twice (leave the Post Office screen near the bottom
//   to avoid stepping on the grass). Walk up to the man with the wad of cash in his hand.
//   YES [9 > 30]

function sold_house() => bit4(0xff31)
function emptied_bank_account() => bit6(0xfee4)
achievement("Complete Liquidation", "Sell your house and empty your bank account", 5,
    trigger = in_game() && sold_house() == 1 && emptied_bank_account() == 1 &&
              ((
                  current_scene() == scene_brooklyn_bank_interior && 
                  prev(emptied_bank_account()) != 1
              ) || (
                  current_scene() == scene_brooklyn_path_bottom_middle && 
                  prev(sold_house()) != 1
              ))
               
)

// We'll branch to the different routes here.
//   {{ SAVE B }}

// ===== PANAMA ROUTE =====
// Go east and approach the gate (near the #12 sign) and wait for Leonard.
//   BUY TICKET
//   YES
//   PANAMA
//   YES
//   PAY ($900) [9 > 39]
// Walk west three times. Enter the Post Office. Approach the counter.
//   RING BELL
//   GET MAIL
//   GET LETTER [5 > 44]
//   {{ SAVE C }}
//   LOOK POSTMARK [1 > 45]
//   REMOVE STAMP [1 > 46]

achievement("A Gift from Jake", "Find the gold flake", 4,
    trigger_get_item_general(item_gold_flake)
)

//   OPEN LETTER
//   READ LETTER - allcaps words read "great find in the american rivier"
// Leave the Post Office. Go south twice, and east to the middle of the graveyard.
// Go to the two gravestones together in the upper right.
//   READ GRAVE [1 > 47]
//   READ GRAVE [1 > 48] - you get one point for reading your mother's grave, and one for your father's
//   PUT FLOWERS [3 > 51]

achievement("A Parting Gift", "Leave something with your parents before you go", 3,
    trigger_scene_flag(scene_brooklyn_graveyard_center, bit6(0xFEEA))
)

// Leave the graveyard (west, north). Enter the big white building.
// Walk to the man in the lower left.
//   {{ SAVE D }}
//   QUIT JOB [2 > 53]
// Go upstairs to the empty office in the front right.
//   LOOK BLOTTER
//   LOOK CLIPPINGS [3 > 56]
// Leave the building. Go west twice, and north. Enter the hardware store. If the man walks into the back
// room, leave and come back in. Approach the counter. When he asks you want you want:
//   BUY NET [4 > 60]
// Leave the hardware store. Go east twice and north. Board the boat.
// You can talk to the man with the beard to find out how long you have to wait. It leaves at 18:00.
// To make it leave early:
//   SHOW TICKET

achievement("Rushing the Gold Rush", "Leave Brooklyn before the announcement from President Polk", 10,
    trigger = in_game() && 
              timer_hours() == 0 && timer_minutes() < 14 && //announcement happens at 14 minutes
              (trigger_scene_flag(scene_brooklyn_dock, bit3(0xFEF1)) || // Panama route
               trigger_scene_flag(scene_brooklyn_ferry_dock_docked, bit7(0xfee4))) // overland route
)

achievement("Brooklyn Bonanza", "Leave Brooklyn with 60 points", 10,
    trigger = in_game() &&
              current_score() >= 60 &&
              (current_scene() == scene_brooklyn_dock && bit3(0xFEF1) == 1) // Panama route
)

// Note: after the boat leaves Brooklyn, you have to switch to disk 3 back. The game fails to
// recognize this disk from the asmiov set.

// Watch the travel montage until you reach the second river scene.
//   {{ SAVE E }}
// You'll get attacked by natives.
//   YES [4 > 64]
// When you reach the scene with the man sitting at the large tree, wait to appear on screen (the rest
// of the group will have passed behind the tree). Step off the trail and approach the rocks near the man.
//   TALK TO MAN [7 > 71]
// Follow the rest of the party around the tree. When you get near the bottom, a swarm of ants will appear.
//   JUMP VINE [4 > 75]
// Wait for the ants to leave.
//   LET GO
// Head east. Though nearly impossible to tell, there are four paths. The bottom goes through the pink
// bush that will cut you to threads. The middle has a snake drop on you. The top two go around everything.
// From the very left edge of the screen, go up. When you reach the first brown tree in the background, go
// up to the fourth path and head right. You'll stub your toe on something.
//   GET DISK [10 > 85]

achievement("Spanish Gold", "Find the gold disk", 5,
    trigger_get_item(item_gold_disk, scene_panama_bush)
)

// Proceed to the next scene [5 > 90].
// Here, you just need to make it across without finding the deep areas. There's also an 
// alligator that randomly appears, so save your game!
//   {{ SAVE F }}
// Just head straight in at the start. About a third of the way in (about where the tree and rock are in
// the background), head up and right so you're in line with the third green "finger" on the right. When
// you pass the other rock in the background, start heading down and right, then walk out into the next
// scene. [10 > 100]

achievement("Panama City", "Reach Panama City", 10,
    in_game() && repeated(300, current_scene() == scene_panama_city)
)

// ===== CALIFORNIA =====
// Head into the white building just right of the middle of the screen. (There is a time limit on this.)
//   LOOK SCHEDULE
//   GET ON STAGECOACH [1 > 101]
// When the stagecoach drops you off, walk into the fort.
//   {{ SAVE G }}
// Go left twice, and out to the cemetary. Approach the middle grave in the back
//   READ GRAVE [2 > 103].
//   READ PSALM [5 > 108]
//   USE LETTER
// Move it so the "O" of mourned is in the left circle. The other cirles will have R, 2, 1, O, and M.
// The game will tell you when it's in the right place: "Hold it right there!" [5 > 113]

achievement("Daily Jumble", "Find the message revealed by the holes in the letter from your brother", 5,
    type="progression",
    trigger = trigger_scene_flag(scene_sutters_fort_gravestone, bit7(0xFEE7))
)

// Press "8" to return to the cemetary, then go south and walk left twice and enter the door on the right.
//   BUY PAN
//   GIVE COIN [1 > 114]
// Leave the store, walk west, then right, then north to leave the fort.

// Go left, leave the fort, and walk down until the overhead map appears. Then head east.
// Keep going east until you're at least 10 units away from the fort.
// Find a screen where there isn't anyone already panning the river.
//   {{ SAVE H }}
//   PAN [1 > 115] (repeat until you've gained 50 points! [49 > 164])
// Turn off sound (2) to not have to listen to the music every time you find one.
// If you're not finding anything, move to the next screen. You can go back and forth between two
// screens to keep finding stuff without wandering too far away. Always make sure there isn't anyone
// else in your screen, or you'll be hung! (consider saving frequently as you can't always see the
// other people behind trees)

achievement("There's Gold in Them Thar Hills!", "Pan (or dig up) 50 pieces of gold", 10,
    in_game() &&
    current_scene() >= scene_california_wilderness &&
    current_scene() <= scene_california_wilderness10 &&
    measured(byte(0xFF7E) == 50) && prev(byte(0xFF7E)) == 49
)  

// After successfully collecting 50 pieces of gold, head back to Fort Sutter. Go to the store.
//   {{ SAVE I }}
//   BUY SHOVEL
//   GIVE GOLD [1 > 165]
//   BUY LANTERN
//   GIVE GOLD [1 > 166]
// Leave the store. Go down, then right three screens and enter the building where the man is hammering 
// behind the window.
//   TALK
//   YEA
//   YEA
//   WILSON
//   JERROD
//   JAKE [2 > 168] (gets the branding iron)
    
achievement("Uh, Uh...", "Correctly answer the blacksmith's questions", 5, type="progression",
    trigger = trigger_get_item(item_branding_iron, scene_sutters_fort_blacksmith)
)   

// Go right two more screens.
//   BUY MULE
//   GIVE GOLD
// Walk up to the mule.
//   GET MULE [3 > 171]
// Walk left two screens to the blacksmith. Enter the building.
//   HEAT IRON
//   BRAND MULE [3 > 174]
// Leave the fort via the main entrance (left, up), then enter the smallish door to the right of the
// main entrance. After the man inspects your mule, go south into the second part of the stable.
//   LEAVE MULE
// Walk around and LOOK BRAND the other mules until you find the "trusty, high-spirited" mule.
//   GET MULE
// Leave the pen and LOOK BRAND to make sure you grabbed the right one. Then leave the stables. [7 > 181]

achievement("That's Not Yours", "Borrow your brother's mule", 10, type="progression",
    trigger = trigger_scene_flag(scene_sutters_fort_stable, bit5(0xFEEC))
)

// Fully leave the fort and head east again. Keep following the river, past the sawmill, until you reach a
// village. Make sure not to get the mule stuck on the bushes (walking right at the edge of the river works
// well - at 16E, leave closer to the bottom on the screen to not get stuck on the rock at the sawmill).
//   {{ SAVE J }}
// Go south and east and stand near the railing.
//   TIE MULE
// Go inside and approach the man.
//   BOOK ROOM ELEVEN
//   YES
// Go upstairs and left to room 11.
//   KNOCK DOOR
//   GIVE MESSAGE [3 > 184]
// Walk into the room and up to the fireplace.
//   TURN WHEEL [5 > 189]
//   ENTER FIREPLACE

achievement("The Missing Room", "Find your way into room 12", 5, type="progression",
    trigger = in_game() && current_scene() == scene_coloma_green_pastures_room_12 &&
              once(current_scene() == scene_coloma_green_pastures_room_11 || 
                   current_scene() == scene_coloma_green_pastures_ledge)
)

// Approach the table.
//   GET MAGNET [1 > 190]
//   GET NOTE [1 > 191]
//   READ NOTE
// Walk to the white ball in the corner.
//   GET STRING [1 > 192]
// Walk to the window.
//   {{ SAVE K }}
//   UNLOCK WINDOW
//   OPEN WINDOW
// Wait for the bird to arrive. 
// Walk to the birdcage.
//   LOOK CAPSULE
//   PUT PHOTOGRAPH IN CAPSULE [3 > 195]
// Wait for the bird to fly away and return.
//   LOOK CAPSULE
//   TAKE AEROGRAM [1 > 196]
//   READ AEROGRAM

achievement("Carrier Correspondence", "Let your brother know that you're coming", 5,
    trigger = trigger_get_item(item_aerogram, scene_coloma_green_pastures_room_12)
)

// Walk to the window.
//   CLIMB WINDOW
// Creep left to the main balcony. Go in the door, back downstairs, and outside.
//   GET MULE
// Head left several screens so so you're about 15 units from Sutter's Fort again.
//   FOLLOW MULE [7 > 203]
// Then do so until you arrive at the cabin.

achievement("A Stubborn Guide", "Find your brother's cabin", 5, type="progression",
    trigger = (trigger_scene_flag(scene_jakes_cabin_exterior, bit2(0xFEF2)) ||
               trigger_scene_flag(scene_jakes_cabin_exterior, bit5(0xFEF2)))              
)

//   {{ SAVE L }}
// Enter the cabin. Walk over to the table.
//   GET MATCHES [1 > 204]
// Leave the cabin. Go behind the large bush in the middle-right. Then head left. You should switch to
// the larger sprites. Continue left past the darker green foliage and then down and right in front of
// the darker green foliage. Enter the outhouse.
//   ENTER HOLE
//   YES [3 > 207]
//   {{ SAVE M }}
//   LIGHT LANTERN
// The lantern only lasts for so long. Head west and approach the door.
//   TIE STRING TO MAGNET [2 > 209]
//   PUT MAGNET IN HOLE [2 > 211]
//   LOWER MAGNET [2 > 213]
//   PULL STRING [2 > 215]

achievement("A Key-Shaped Hole", "Retrieve the key in the mine", 5, type="progression",
    trigger = trigger_get_item(item_steel_key, scene_jakes_mine_door) ||
              trigger_get_item(item_steel_key, scene_jakes_mine_door_dark)
)

//   UNLOCK DOOR [1 > 216]
// Go down, left, and down twice.
//   GET PICK [1 > 217]
// Walk behind the rock where the pick was.
//   USE PICK [1 > 218]
//   GET GOLD [1 > 219]
// Go up two screens, and step off the ladder to the right. Step into the first "window"
//   USE PICK [1 > 220]
//   GET GOLD [1 > 221]
// Walk right one screen. Stand in the grey "bar" left of the first archway and face left.
//   USE PICK [1 > 222]
//   GET GOLD [1 > 223]
// Go right another screen. Go just past the archway, so you're still left of the shaft.
//   USE PICK [1 > 224]
//   GET GOLD [1 > 225]
// Go left two screens. Climb to the top of the ladder, and inch right.
//   GET GOLD [1 > 226] 
// Go left again. Stand between the middle two archways.
//   GET GOLD [1 > 227] 
// Stand between the left archway and the shadowy column.
//   USE PICK [1 > 228]
//   GET GOLD [1 > 229]
// Go left again. Stand behind the shadowy column and face right.
//   USE PICK [1 > 230]
//   GET GOLD [1 > 231]
// Go left again. The gold is already visible. Just walk up to it.
//   GET GOLD [1 > 232] 
// Go right and down the ladder.
//   GET GOLD [1 > 233]
//   - stepping past the ladder is a bit tricky - if you touch the ladder, you can fall off it.
//     I found it easiest to get on the ladder, then off again, before trying to cross right.
//   {{ SAVE N }}
// Walk to the middle of the room (just barely over the lower shaft).
//   USE PICK [1 > 234]
//   GET GOLD [1 > 235]
// Go down the ladder. Walk up and right near the upper ladder.
//   GET GOLD [1 > 236]
// Stand behind the right pillar of the archway.
//   USE PICK [1 > 237]
//   GET GOLD [1 > 238]
// Stand on the water rivulet.
//   GET GOLD [1 > 239]
// Stand in front of the large rock on the left side of the screen.
//   USE PICK [1 > 240]
//   {{ SAVE O }}
//   GET GOLD [1 > 241]

nuggets = [
    bit1(0xff84), // second shaft bottom
    bit1(0xff85), // second shaft top
    bit1(0xff83), // first shaft bottom
    bit1(0xff82), // right dead end
    bit5(0xfef0), // second shaft top (in the open)
    bit4(0xfef0), // corridor (in the open)
    bit1(0xff86), // corridor
    bit1(0xff87), // third shaft top
    bit3(0xfef0), // left dead end (in the open)
    bit2(0xfef0), // third shaft middle (in the open)
    bit1(0xff88), // third shaft middle
    bit1(0xfef0), // third shaft bottom (in the open)
    bit1(0xff89), // third shaft bottom (right)
    bit0(0xfef0), // third shaft bottom (in the open)
    bit1(0xff8a), // third shaft bottom (left)
]

achievement("You Load Sixteen Tons", "Find and collect all the nuggets in Jake's mine", 10,
    in_game() && current_scene() >= scene_jakes_mine_entrance &&
                 current_scene() <= scene_jakes_mine_shaft3_bottom_dark &&
                 measured(sum_of(nuggets, a => a) == length(nuggets)) &&
                 sum_of(nuggets, a => prev(a)) == length(nuggets) - 1
)

// Go left.
// Approach the back wall, just left of the lantern.
//   USE PICK [2 > 243]
//   USE PICK [1 > 244]
//   GET GOLD [1 > 245]
//   GET GOLD [1 > 246]
//   GET GOLD [1 > 247]
//   GET GOLD [1 > 248]
//   GET GOLD [1 > 249]
// Walk back to the right so you're standing behind the lantern and face left.
//   USE PICK
//   USE PICK
//   {{ SAVE P }}
//   CLIMB THROUGH HOLE [6 > 255]

achievement("Break On Through To The Other Side", "Find the mother lode", 10, type="win_condition",
    trigger = in_game() && current_scene() == scene_jakes_mine_river_logo &&
              prev(current_scene()) == scene_jakes_mine_river
)

achievement("All That Glitters", "Finish the game with 255 points", 25,
    trigger = in_game() && current_scene() == scene_jakes_mine_river_logo &&
              prev(current_scene()) == scene_jakes_mine_river &&
              current_score() == 255
)

// BONUS for making it through mine without the lantern!
// * Game suggests this when you reach Jake's cave after having used the lantern:
//    "Try it without lightin' the lantern sometime!"
//   If you manage to do it, all that happens is the game acknowledges it:
//    "You've just accomplished an incredible feat! Congratulations!!"
//   Then the script continues as if it didn't happen:
//    "Your eyes, unaccustomed to the bright light of the lanterns, take a moment to adjust."...
// * This is functional, but as there's absolutely no feedback for running into walls, you basically
//   just have to save scum your way through. Turn on the lantern, plan your steps, reload save, do
//   steps, save. Repeat. You can also light the matches to get a quick view of where you are, but
//   the overall process is basically the same.

// achievement("That Was Pointless", "Earn 0 points for traversing Jake's cave without lighting the lantern",
//     points = 25, trigger = in_game() &&
//                            current_scene() >= scene_jakes_mine_entrance_dark &&
//                            current_scene() <= scene_jakes_mine_shaft3_bottom_dark &&
//                            trigger_when(bit5(0xfeee) == 1) && // arrive at jake's cave
//                            prev(bit5(0xfeee)) == 0 && 
//                            bit4(0xfeee) == 0 // without lighting lantern
// )

// ===== CAPE HORN ROUTE =====
// [[ LOAD SAVE B ]]
// Go east and approach the gate (near the #12 sign) and wait for Leonard.
//   BUY TICKET
//   YES
//   CAPE
//   YES
//   PAY ($650) [9 > 39]
// Walk west three times. Enter the Post Office. Approach the counter.
//   RING BELL
//   GET MAIL
//   GET LETTER [5 > 44]
//   LOOK POSTMARK [1 > 45]
//   REMOVE STAMP [1 > 46]
//   OPEN LETTER
//   READ LETTER - allcaps words read "great find in the american rivier"
// Leave the Post Office. Go south twice, and east to the middle of the graveyard.
// Go to the two gravestones together in the upper right.
//   READ GRAVE [1 > 47]
//   READ GRAVE [1 > 48] - you get one point for reading your mother's grave, and one for your father's
//   PUT FLOWERS [3 > 51]
// Leave the graveyard (west, north). Enter the big white building.
// Walk to the man in the lower left.
//   QUIT JOB [2 > 53]
// Go upstairs to the empty office in the front right.
//   LOOK BLOTTER
//   LOOK CLIPPINGS [3 > 56]
// Leave the building. Go west twice, and north. Enter the groery store and approach the counter.
// When he asks you want you want:
//   BUY FRUIT [4 > 60]
// Leave the hardware store. Go east twice and north. Board the boat.
// You can talk to the man with the beard to find out how long you have to wait. It leaves at 18:00.
// To make it leave early:
//   SHOW TICKET
// Note: after the boat leaves Brooklyn, you have to switch to disk 3 back. The game fails to
// recognize this disk from the asmiov set.

// Walk to the right. Approach the man leaning on the mast reading a book.
//   TALK TO MAN [7 > 67]
//   {{ SAVE Q }}
// Press 0 to advance the story. When you cross the equator, things will cut back to the boat.
// If you appear hunched over, you've managed to contract Cholera (it's a random thing you have no control
// over), and there's no cure. If that happens, you'll die shortly. Just restore your game immediately.
// Otherwise, just press 0 to advance the story again.
// When you reach cape horn, things will cut back to the boat again. Just press 0 to advance the story.
// Things will cut back to the ship in the middle of a storm.
// If you hit a rock, the ship will sink (it's a random thing you have no control over).
//   GET STRING [3 > 70]
// Go left into the engine room.
//   GET SCRAPS [3 > 73]
// Press 0 to advance the story.
// Press 0 to advance the story.
// The next time things cut back to the ship, food is running out.
//   {{ SAVE R }} (needed)
// Go left and down the stairs into the captain's quarters.
//   GET PAPER CLIP [3 > 76]
// Go right, and enter the kitchen.
//   GET HAM [3 > 79]
// Go down the ladder into the boiler room.
//   GET STICK [3 > 82]
// Go left, then up to the top of the ship and left to the stern railing.
//   FISH [8 > 90], [5 > 95] when you catch one.

achievement("Catch of the Day", "Provide a meal for the people on the boat", 10,
    trigger = trigger_scene_flag(scene_steamboat_left_no_coal, bit7(0xFEE9))
)

// After more exposition, you'll finally arrive in California. You can proceed with the
// CALIFORNIA section above (but with 5 fewer points).
//   {{ SAVE S }}

// ===== OVERLAND ROUTE =====
//   {{ START A NEW GAME }}
// Go west twice, making sure not to step on the grass.
// Enter the bank. Walk up to the teller. When he asks how he can help:
//   GET MONEY
// When it asks for the account number, just press ENTER [3 > 3]
// Leave the bank and go south. Wait until 4:00 in game time (press 6)
// Enter the Post Office. Approach the counter.
//   RING BELL
//   GET MAIL
//   GET LETTER [5 > 8]
// Leave the post ofice and go south, then west twice. 
// Enter the travel office and approach the counter.
//   BUY TICKET
//   YES
//   PAY [9 > 17]
// Leave the travel office and go east. Approach the livery, but do not enter.
//   TALK
// Wait for the small man to approach you.
//   SHOW TICKET [2 > 19]
// Walk down below the stagecoach
//   {{ SAVE T }}
//   OPEN DOOR [2 > 21]

achievement("Penniless Prospector I",
    "Leave Brooklyn with less than 25 points and not having stepped on the grass", 10,
    trigger = trigger_scene_flag(scene_brooklyn_ferry_dock_docked, bit7(0xfee4)) &&
              byte(0xff21) == 0 && // times stepped on grass
              current_score() < 25
)

// Walk to the group of men on the right side of the screen.
//   TALK TO CAPTAIN
//   GIVE MONEY [2 > 23]
// Go south. Approach the man.
//   TALK
//   BUY ANIMALS
//   MATURE OXEN [5 > 28]
// Go south. Approach the group of men.
//   TALK TO CAPTAIN
// Go east, then north between the tent and stagecoach.
//   {{ SAVE U }}
//   LOOK GRASS
//   (repeat until you notice "the mud is beginning to dry") - it takes about 2 minutes of in game time.
// Go back to camp.
//   TALK TO CAPTAIN [7 > 35]
//   (if you leave too early, you only get 5 points, but it doesn't seem to affect anything else)
//   (not sure what happens if you leave too late)
// When the wagon stops at the top of a steep hill, approach the oxen.
//   {{ SAVE V }}
//   UNHITCH TEAM [4 > 39]
//   LOCK WHEELS [4 > 43]
// When the wagon stops at the desert, approach the abandoned wagon.
//   OPEN BARREL
//   DRINK WATER [4 > 47]
//   GET MEAT [4 > 51]
// Go west

achievement("The Bottom of the Barrel", "Survive the overland trek to California", 10,
    trigger = once(current_scene() == scene_desert) &&
              never(needed_disk() == 0x1F) &&
              trigger_scene_flag(scene_map_northern_california, bit7(0xFEE9))
)

// ==== SUTTER'S FORT ====
// When the stagecoach drops you off, walk into the fort.
//   {{ SAVE W }}
// Go left twice, and out to the cemetary. Approach the grave in the middle back.
//   READ GRAVE [2 > 53]
//   OPEN LETTER
//   USE LETTER
// Move it so the "O" of mourned is in the left circle. The other cirles will have R, 2, 1, O, and M.
// The game will tell you when it's in the right place: "Hold it right there!" [5 > 58]

// Walk north to leave Sutter's Fort and walk east sixteen screens to the sawmill. Continue east three
// more screens into Coloma, then go south and east. Enter Green Pastures. Approach the desk
//   BOOK ROOM ELEVEN
//   NO
// Go upstairs and out the door on the right. Go to the right side of the balcony.
//   CLIMB OVER RAILING
// Walk to the second window
//   BREAK WINDOW [-2 > 56]
//   UNLOCK WINDOW
//   OPEN WINDOW
//   CLIMB IN WINDOW
// Walk to the table
//   GET COIN [1 > 57]
//   GET MAGNET [1 > 58]
// Walk to the white ball in the corner.
//   GET STRING [1 > 59]
// Walk to the window
//   CLIMB OUT WINDOW
// Return through the hotel and back to the sawmill, then all the way back to Sutter's Fort.
// From the main entrance: Walk left twice, then down. Enter the door on the right.
//   BUY SHOVEL
//   GIVE GOLD COIN [1 > 60]
// Leave the store, walk down, east twice, and leave the fort. Walk down until the overhead map appears.
// Then head east. Keep going east until you're at least 10 units away from the fort. Then go south once.
// Find a screen where there isn't anyone already digging.
//   DIG [1 > 61] (repeat until you've gained 2 more points! [2 > 63])
// Return to Sutter's Fort and go back to the store.
//   BUY LANTERN
//   GIVE GOLD [1 > 64]
// Leave the store, walk left, then right two screens and enter the building where the man is hammering 
// behind the window.
//   TALK MAN
//   YEA
//   YEA
//   WILSON
//   JERROD
//   JAKE [2 > 66] (gets the branding iron)
// Walk right two more screens.
//   {{ SAVE X }}
//   BUY MULE
//   GIVE GOLD
// Walk up to the mule.
//   GET MULE [3 > 69]
// Walk left two screens to the blacksmith. Enter the building.
//   HEAT IRON
//   BRAND MULE [3 > 72]
// Leave the fort via the main entrance (left, up), then enter the smallish door to the right of the
// main entrance. After the man inspects your mule, go south into the second part of the stable.
//   LEAVE MULE
// Walk around and LOOK BRAND the other mules until you find the "trusty, high-spirited" mule.
//   GET MULE
// Leave the pen and LOOK BRAND to make sure you grabbed the right one. Then leave the stables. [7 > 79]
// Walk south to get back to the overhead map, then east. Go east another couple screens.
//   FOLLOW MULE (then do so until you arrive at the cabin) [7 > 86]

achievement("Penniless Prospector II",
    "Arrive at Jake's cabin with less than 100 points and not having stepped on the grass", 10,
    trigger = (trigger_scene_flag(scene_jakes_cabin_exterior, bit2(0xFEF2)) ||
               trigger_scene_flag(scene_jakes_cabin_exterior, bit5(0xFEF2))) &&
              byte(0xff21) == 0 && // times stepped on grass
              current_score() < 100
)

//   {{ SAVE Y }}
// Enter the cabin. Walk over to the table.
//   GET MATCHES [1 > 87]
// Leave the cabin. Go behind the large bush in the middle-right. Then head left. You should switch to
// the larger sprites. Continue left past the darker green foliage and then down and right in front of
// the darker green foliage. Enter the outhouse.
//   ENTER HOLE
//   YES [3 > 90]
//   LIGHT LANTERN
// The lantern only lasts for so long. Head west and approach the door.
//   TIE STRING TO MAGNET [2 > 92]
//   PUT MAGNET IN HOLE [2 > 94]
//   LOWER MAGNET [2 > 96]
//   PULL STRING [2 > 98]
//   UNLOCK DOOR [1 > 99]
// Go down, left, and down twice.
//   GET PICK [1 > 100]
// Go up twice, left twice, down twice and left.
//   {{ SAVE Z }}
// Approach the back wall, just left of the lantern.
//   USE PICK [2 > 102]
//   USE PICK [1 > 103]
//   GET GOLD [1 > 104]
//   GET GOLD [1 > 105]
//   GET GOLD [1 > 106]
//   GET GOLD [1 > 107]
//   GET GOLD [1 > 108]
//   USE PICK
//   USE PICK
//   CLIMB THROUGH HOLE [7 > 115]

achievement("Penniless Prospector III",
    "Finish the game with less than 130 points and not having stepped on the grass", 10,
    trigger = in_game() && current_scene() == scene_jakes_mine_river_logo &&
              prev(current_scene()) == scene_jakes_mine_river &&
              byte(0xff21) == 0 && // times stepped on grass
              current_score() < 130
)

// Eureka!
// My Precious
// El Dorado
// Pay Dirt

// Around the Horn - complete the southern route
