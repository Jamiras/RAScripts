// Fish Files
// #ID = 4302
// MD5: edf021b521a496fe7afc5e15949f5c80 (Europe) (En,Fr,De,Es,It)

// A = action, B = examine, D-Pad to move, Start to open inventory, Select to save from inventory

// C000-C08B = inventory foreground tiles
// C15A-C2C1 = inventory background sprites (includes text for selected item)
// C7C2-C7DF = music?
// C800-C8FF = inventory item image pixels

// C5A6=D2EF
// C5BE=inventory offset...? 

function current_scene() => byte(0xC535)
scene_univ_dantes_room = 0 // room 3
scene_univ_hall_3F_E = 1 // WC and 5 doors
scene_univ_hall_3F_W = 2 // 3 and 4 doors
scene_univ_hall_2F_E = 3
scene_univ_hall_1F_W = 4 // outside book room
scene_univ_hall_1F_ent = 5 // entrance hall
scene_univ_hall_1F_E = 6 // outside chemistry room
scene_univ_chem_lab = 7
scene_univ_gym = 8
scene_univ_kitchen = 9 
scene_univ_bathroom = 10 // WC
scene_univ_fritzs_room = 11 // room 4
scene_univ_korsellos_room = 12 // room 5
scene_univ_book_room = 13
scene_univ_outside = 14
scene_univ_fountain = 15
scene_city_pole = 16 // where the man is stuck
scene_city_outside_fish_store = 17
scene_city_outside_police_station = 18
scene_city_outside_beppos = 19
scene_city_inside_fish_store = 20
scene_city_inside_police_station = 21
scene_city_inside_beppos = 22
scene_city_outside_trailer = 24
scene_city_inside_trailer = 25
scene_univ_marys_room = 26
scene_city_sewer = 27
scene_univ_girls_room2 = 28
scene_univ_hall_2F_W = 29
scene_city_outside_beppos_night = 30
scene_city_outside_military_base_night = 31
scene_city_outside_xavoc_night = 32
scene_city_inside_xavoc_2 = 33
scene_city_inside_xavoc_mary = 34
scene_city_inside_xavoc = 36
scene_city_outside_fish_store_night = 37
scene_univ_statue_night = 38
scene_city_military_laboratory = 40
scene_city_inside_military_base = 41
scene_city_outside_trailer_night = 42
scene_univ_fraus_room = 43
scene_univ_principals_office = 44
scene_univ_hall_2F_E_no_frau = 45
scene_alt1_major_gaids_office = 47
scene_alt1_hall_3F_W = 48
scene_alt1_hall_3F_E = 49
scene_alt3_colloseum_W_champion = 50
scene_alt1_kitchen = 51
scene_alt1_green_flag = 52
scene_alt1_blue_flag = 53
scene_alt1_red_flag = 54
scene_alt1_fountain = 55
scene_alt1_beppos_office = 56
scene_alt1_hall_1F_W = 57
scene_alt1_dantes_room = 58
scene_alt1_behind_kitchen = 59
scene_alt1_warehouse = 60
scene_alt1_shooting_range = 61
scene_alt1_hall_1F_ent = 62
scene_alt3_bathroom = 64
scene_alt3_puses_room = 65
scene_alt3_dantes_room = 66
scene_alt3_hall_3F_W = 67
scene_alt3_hall_3F_E = 68
scene_alt3_girls_room_W = 69
scene_alt3_girls_room_before = 70
scene_alt3_girls_room = 71
scene_alt3_hall_2F_W = 72
scene_alt3_basement = 73
scene_alt3_hall_1F_ent = 74
scene_alt3_hall_1F_W = 75
scene_alt3_hall_1F_E = 77
scene_alt3_outside = 78
scene_alt3_outside_pottery = 79
scene_alt3_fountain = 80
scene_alt3_amplitheatre_W = 81
scene_alt3_amplitheatre_E = 82
scene_alt3_outside_beppos = 83
scene_alt3_inside_beppos = 84
scene_alt3_colloseum_E = 85
scene_alt3_colloseum_W = 86
scene_alt3_storage_room = 87
scene_alt3_storage_room_basement = 88
scene_alt3_storage_room_cleaned = 89
scene_alt2_dantes_room = 90
scene_alt2_hall_3F_W = 91
scene_alt2_hall_3F_E = 92
scene_alt2_fabropolus_room = 93
scene_alt2_hall_1F_W = 94
scene_alt2_trailer = 95
scene_alt2_hall_1F_ent = 96
scene_alt2_outside = 97
scene_alt2_gym = 98
scene_alt2_office = 99
scene_alt2_fountain = 100
scene_alt2_flowershop_outside = 101
scene_alt2_flowershop = 102
scene_alt2_alley = 103
scene_alt2_abandoned_factory_E = 104
scene_alt2_abandoned_factory_W = 105
scene_alt2_beppos_outside = 106
scene_alt2_beppos = 107
scene_home_beppos = 110
scene_home_outside_beppos = 111
scene_home_outside_fish_store = 112
scene_home_fountain = 113
scene_home_hall_1F_ent = 114
scene_home_hall_1F_E = 115
scene_home_chem_lab = 116
scene_home_kitchen = 117
scene_home_hall_1F_W = 118
scene_home_hall_2F_E = 119
scene_home_hall_3F_W = 120
scene_home_hall_3F_E = 121
scene_home_pole = 122
scene_home_principals_office = 123
scene_home_gym = 124
scene_home_sewer1 = 125
scene_home_sewer2 = 126
scene_home_sewer3 = 127
scene_home_sewer4 = 128
scene_home_sewer5 = 129
scene_home_sewer6 = 130
scene_home_sewer7 = 131
scene_home_lake = 132
scene_home_fisherman = 133
scene_home_barn = 134
scene_home_bull = 135
scene_home_outside_xavoc = 136
scene_home_xavoc_W = 137
scene_home_xavoc_E = 138
scene_home_outside_trailer = 139
scene_home_inside_trailer = 140
scene_home_barn_open = 141
scene_home_bull_gone = 142
scene_home_inside_barn = 143
scene_ship_entrance = 144
scene_ship_cockpit = 145
scene_ship_room1 = 146
scene_ship_guard = 147
scene_ship_prison = 148
scene_ship_ventilation_controls = 149
scene_home_lake_projector = 150
scene_home_barn_celebration = 151
scene_home_lake_frauzilla = 152
scene_home_bathroom = 153
scene_alt3_girls_room2 = 156
scene_alt3_outside_mummy = 159
scene_alt3_amplitheatre_depart = 161
scene_home_inside_trailer_later = 162
scene_7th_sense_W = 173
scene_7th_sense_E = 174
scene_credits1 = 175
scene_credits2 = 176
scene_credits3 = 177
scene_credits4 = 178
scene_credits5 = 179
scene_credits6 = 180
scene_credits7 = 186

// set when an item is picked up, and when one is selected in the inventory
function current_item() => word(0xC545)
item_bowl = 0x00D6
item_multiuse = 0x00D7
item_pictures = 0x00D8 // pictures of self
item_boots = 0x00D9
item_toilet_paper = 0x00DA
item_glass_jar = 0x00DB
item_frauzilla = 0x00DE
item_mug = 0x01D7
item_strong_rope = 0x01D6
item_fbi_badge = 0x02D8
item_ink = 0x03D6
item_monocle = 0x03DA
item_trap = 0x03DB
item_rag = 0x04D7 // mop head
item_gas_mask = 0x04D9
item_pretzel = 0x04DB
item_sheet = 0x05D6
item_wig = 0x07D7
item_wanted_poster = 0x07DA
item_letter2 = 0x08DB // Franz's letter for Beppo
item_droolmon = 0x09D7
item_insect = 0x09D8
item_sauerkraut_cream = 0x0AD7
item_topzilla = 0x0BD8
item_spring = 0x0BD9
item_clean_mug = 0x0CD6
item_mush = 0x0CD7
item_track_suit = 0x0CD8
item_open_sauerkraut = 0x0DD7
item_bottle = 0x0ED6
item_principals_key = 0x0ED8
item_antenna = 0x0FD7
item_tunic = 0x0FD9
item_sauerkraut = 0x10D6
item_stinky_topzilla = 0x10D8
item_shower_cap = 0x10DA
item_test_tubes = 0x10DD
item_wrapping = 0x11D7
item_sheet2 = 0x11D6 // Fritz's sheet
item_reading = 0x11D9
item_broken_vacuum = 0x11DA
item_detergent = 0x11DD
item_fish_essence = 0x12D8
item_bottle_of_water = 0x12D9
item_lance = 0x13DA
item_bicarbonate = 0x13DD
item_blanket = 0x14D6 // Frabropolus's blanket
item_blue_flag = 0x14D9
item_sugar = 0x15D6
item_pipe = 0x15DA
item_clean_apron = 0x15DD
item_green_flag = 0x16D9
item_blender = 0x16DB
item_washed_apron = 0x16DD
item_red_flag = 0x18D9
item_suspenders = 0x18DB
item_empty_bottle = 0x1BD9
item_letter3 = 0x18DA // Dante's letter for Beppo
item_solution1 = 0x18DD
item_two_balls = 0x1AD6
item_vacuum = 0x1ADA
item_wood = 0x1ADB
item_apron = 0x1ADC
item_solution2 = 0x1ADD
item_solution3 = 0x1BDD
item_flashlight = 0x1CDB
item_lighter = 0x22D6
item_bottle_of_mud = 0x1DD9
item_insect = 0x1DDA
item_pills = 0x1EDB
item_record = 0x1FDA
item_mayonnaise = 0x1FDC
item_updated_document = 0x20D8
item_pliers = 0x20DB
item_corroded_record = 0x21DA
item_weak_ants = 0x21DB
item_rope = 0x22D7
item_mannequin = 0x22DA
item_tunic_with_wig = 0x22E0
item_acetone = 0x23D9
item_train_starter = 0x23DB
item_video_tape = 0x23DC
item_mummy = 0x24DA
item_baster = 0x25D6
item_book = 0x25D8
item_gym_key = 0x25DB
item_baseball_bat = 0x26DA
item_data_sheet = 0x26DC
item_tunic = 0x26D7
item_fish = 0x26D6
item_powerful_blender = 0x26DB // blender + starter
item_costume = 0x27D7
item_pass = 0x27D8
item_ultra_powerful_blender = 0x28DB // blender + starter + suspenders
item_document = 0x28D6
item_anabolic_ants = 0x29DB
item_mug_with_water = 0x2AD6
item_makeup_kit = 0x2AD7
item_palomo = 0x2BDD
item_adhesive = 0x2CD6
item_balloon = 0x2CD8
item_horn = 0x2CDC
item_bra = 0x2DD7
item_tickets = 0x2ED8
item_ball_of_wool = 0x2EDA
item_sleeping_powder = 0x2EDD
item_mug_with_sugar_water = 0x2FD6
item_gameboy = 0x2FD7
item_sleeping_pills = 0x2FDC
item_videotape = 0x30D7
item_diskette = 0x30D8
item_sherry = 0x31DC
item_photographs = 0x31DD
item_film = 0x32D7
item_balloon_inflated = 0x32D8
item_rope2 = 0x32DA
item_pictures = 0x34D7
item_food_processor = 0x33D8
item_acid = 0x35D7
item_pacifist_pin = 0x34DA
item_liquor = 0x34DC
item_pan = 0x34DD
item_seeds = 0x37DA
item_projector = 0x37DD
item_camera = 0x39DD
item_calculator = 0x39DF
item_mousemon = 0x38D7
item_dye = 0x3ADC
item_curtain = 0x3BD8
item_sunflower_oil = 0x3BDA
item_super_calculator = 0x3BDF
item_frau_pictures = 0x3CDD
item_knife = 0x3DD8
item_point = 0x3DDC

function current_dialog_message() => word(0xCB02)
function is_dialog_visible() => byte(0xC5C0)

function dialog_achievement(scene, message, points, title, description)
{
    achievement(title = title, description = description, points = points, 
        trigger = current_scene() == scene && current_dialog_message() == message && 
                  is_dialog_visible() == 0 && prev(is_dialog_visible()) == 1
    )
}

function current_character() => byte(0xC5D0)
character_dante = 0
character_fabropolus = 1
character_fritz = 2

characters = {
    character_dante: "Dante",
    character_fabropolus: "Fabropolus",
    character_fritz: "Fritz"
}

scenes = {
    scene_univ_dantes_room: "in Dante's room",
    scene_univ_hall_3F_E: "in the university hallway",
    scene_univ_hall_3F_W: "in the university hallway",
    scene_univ_hall_2F_E: "in the university hallway",
    scene_univ_hall_1F_W: "in the university hallway",
    scene_univ_hall_1F_ent: "in the university hallway",
    scene_univ_hall_1F_E: "in the university hallway",
    scene_univ_chem_lab: "in the chemistry lab",
    scene_univ_gym: "in the gymnasium",
    scene_univ_kitchen: "in the kitchen",
    scene_univ_bathroom: "in the bathroom",
    scene_univ_fritzs_room: "in Fritz's room",
    scene_univ_korsellos_room: "in Fabropolus's room",
    scene_univ_book_room: "in the library",
    scene_univ_outside: "outside the university",
    scene_univ_fountain: "at the fountain",
    scene_city_pole: "on the street",
    scene_city_outside_fish_store: "outside the fish store",
    scene_city_outside_police_station: "outside the police station",
    scene_city_outside_beppos: "outside Beppo's",
    scene_city_inside_fish_store: "in the fish store",
    scene_city_inside_police_station: "in the police station",
    scene_city_inside_beppos: "inside Beppo's",
    scene_city_outside_trailer: "outside the trailer",
    scene_city_inside_trailer: "inside the trailer",
    scene_univ_marys_room: "in Mary's room",
    scene_city_sewer: "in the sewer",
    scene_univ_girls_room2: "in a girl's room",
    scene_univ_hall_2F_W: "in the university hallway",
    scene_city_outside_beppos_night: "on the street",
    scene_city_outside_military_base_night: "outside the military base",
    scene_city_outside_xavoc_night: "outside Xavoc",
    scene_city_inside_xavoc_2: "inside Xavoc",
    scene_city_inside_xavoc_mary: "inside Xavoc",
    scene_city_inside_xavoc: "inside Xavoc",
    scene_city_outside_fish_store_night: "outside the fish store",
    scene_univ_statue_night: "at the fountain",
    scene_city_military_laboratory: "inside the military base",
    scene_city_inside_military_base: "inside the military base",
    scene_city_outside_trailer_night: "outside the trailer",
    scene_univ_fraus_room: "in Frau Kruger's room",
    scene_univ_principals_office: "in the principal's office",
    scene_univ_hall_2F_E_no_frau: "in the university hallway",
    scene_alt1_major_gaids_office: "in Major Gaid's office",
    scene_alt1_hall_3F_W: "in the university hallway",
    scene_alt1_hall_3F_E: "in the university hallway",
    scene_alt3_colloseum_W_champion: "in the coliseum",
    scene_alt1_kitchen: "in the kitchen",
    scene_alt1_green_flag: "at the obstacle course",
    scene_alt1_blue_flag: "at the obstacle course",
    scene_alt1_red_flag: "at the obstacle course",
    scene_alt1_fountain: "at the fountain",
    scene_alt1_beppos_office: "in Beppo's office",
    scene_alt1_hall_1F_W: "in the university hallway",
    scene_alt1_dantes_room: "in Dante's room",
    scene_alt1_behind_kitchen: "behind the kitchen",
    scene_alt1_warehouse: "in the storeroom",
    scene_alt1_shooting_range: "at the shooting range",
    scene_alt1_hall_1F_ent: "in the university hallway",
    scene_alt3_bathroom: "in the bathroom",
    scene_alt3_puses_room: "in Puse's room",
    scene_alt3_dantes_room: "in Dante's room",
    scene_alt3_hall_3F_W: "in the university hallway",
    scene_alt3_hall_3F_E: "in the university hallway",
    scene_alt3_girls_room_W: "in the girls' room",
    scene_alt3_girls_room_before: "in the girls' room",
    scene_alt3_girls_room: "in the girls' room",
    scene_alt3_hall_2F_W: "in the university hallway",
    scene_alt3_basement: "in the basement",
    scene_alt3_hall_1F_ent: "in the university hallway",
    scene_alt3_hall_1F_W: "in the university hallway",
    scene_alt3_hall_1F_E: "in the university hallway",
    scene_alt3_outside: "outside the university",
    scene_alt3_outside_pottery: "outside the pottery store",
    scene_alt3_fountain: "at the fountain",
    scene_alt3_amplitheatre_W: "at the amphitheater",
    scene_alt3_amplitheatre_E: "at the amphitheater",
    scene_alt3_outside_beppos: "outside Beppo's",
    scene_alt3_inside_beppos: "inside Beppo's",
    scene_alt3_colloseum_E: "in the coliseum",
    scene_alt3_colloseum_W: "in the coliseum",
    scene_alt3_storage_room: "in the storeroom",
    scene_alt3_storage_room_basement: "in the basement",
    scene_alt3_storage_room_cleaned: "in the storeroom",
    scene_alt2_dantes_room: "in Dante's room",
    scene_alt2_hall_3F_W: "in the university hallway",
    scene_alt2_hall_3F_E: "in the university hallway",
    scene_alt2_fabropolus_room: "in Fabropolus's room",
    scene_alt2_hall_1F_W: "in the university hallway",
    scene_alt2_trailer: "outside the trailer",
    scene_alt2_hall_1F_ent: "in the university hallway",
    scene_alt2_outside: "outside the university",
    scene_alt2_gym: "in the gymnasium",
    scene_alt2_office: "in the office",
    scene_alt2_fountain: "at the fountain",
    scene_alt2_flowershop_outside: "outside the flower shop",
    scene_alt2_flowershop: "in the flower shop",
    scene_alt2_alley: "in the alley",
    scene_alt2_abandoned_factory_E: "in the abandoned factory",
    scene_alt2_abandoned_factory_W: "in the abandoned factory",
    scene_alt2_beppos_outside: "outside Beppo's",
    scene_alt2_beppos: "inside Beppo's",
    scene_home_beppos: "inside Beppo's",
    scene_home_outside_beppos: "outside Beppo's",
    scene_home_outside_fish_store: "outside the fish store",
    scene_home_fountain: "at the fountain",
    scene_home_hall_1F_ent: "in the university hallway",
    scene_home_hall_1F_E: "in the university hallway",
    scene_home_chem_lab: "in the chemisty lab",
    scene_home_kitchen: "in the kitchen",
    scene_home_hall_1F_W: "in the university hallway",
    scene_home_hall_2F_E: "in the university hallway",
    scene_home_hall_3F_W: "in the university hallway",
    scene_home_hall_3F_E: "in the university hallway",
    scene_home_pole: "on the street",
    scene_home_principals_office: "in the prinpical's office",
    scene_home_gym: "in the gymnasium",
    scene_home_sewer1: "in the sewer",
    scene_home_sewer2: "in the sewer",
    scene_home_sewer3: "in the sewer",
    scene_home_sewer4: "in the sewer",
    scene_home_sewer5: "in the sewer",
    scene_home_sewer6: "in the sewer",
    scene_home_sewer7: "in the sewer",
    scene_home_lake: "at the lake",
    scene_home_fisherman: "at the lake",
    scene_home_barn: "at the farm",
    scene_home_bull: "at the farm",
    scene_home_outside_xavoc: "outside Xavoc",
    scene_home_xavoc_W: "inside Xavoc",
    scene_home_xavoc_E: "inside Xavoc",
    scene_home_outside_trailer: "outside the trailer",
    scene_home_inside_trailer: "inside the trailer",
    scene_home_barn_open: "at the farm",
    scene_home_bull_gone: "at the farm",
    scene_home_inside_barn: "at the farm",
    scene_ship_entrance: "inside the spaceship",
    scene_ship_cockpit: "inside the spaceship",
    scene_ship_room1: "inside the spaceship",
    scene_ship_guard: "inside the spaceship",
    scene_ship_ventilation_controls: "inside the spaceship",
    scene_ship_prison: "inside the spaceship",
    scene_home_lake_projector: "at the lake",
    scene_home_barn_celebration: "at the farm",
    scene_home_lake_frauzilla: "at the lake",
    scene_home_bathroom: "in the bathroom",
    scene_alt3_girls_room2: "in the girls' room",
    scene_alt3_outside_mummy: "outside the university",
    scene_alt3_amplitheatre_depart: "at the amphitheater",
    scene_home_inside_trailer_later: "in the trailer",
    scene_credits1: "exploring the credits",
    scene_credits2: "exploring the credits",
    scene_credits3: "exploring the credits",
    scene_credits4: "exploring the credits",
    scene_credits5: "exploring the credits",
    scene_credits6: "exploring the credits",
    scene_credits7: "exploring the credits",
    scene_7th_sense_W: "in the development studio",
    scene_7th_sense_E: "in the development studio"
}

rich_presence_conditional_display(word(0xC52A) == 0, "Titles")
rich_presence_display("{0} is {1}",
    rich_presence_lookup("Who", current_character(), characters),
    rich_presence_lookup("Where", current_scene(), scenes)
)

// ===== Start =====

// - Dante automatically takes the fish tank [bowl].

achievement(title = "Adventure Game Basics", description = "Examine everything in Dante's room before picking anything up", points = 2, 
    trigger = current_scene() == scene_univ_dantes_room && 
              once(current_dialog_message() == 0x000A) &&  // ink
              once(current_dialog_message() == 0x000B) &&  // sheet
              once(current_dialog_message() == 0x000C) &&  // dresser
              once(current_dialog_message() == 0x000D) &&  // window
              once(current_dialog_message() == 0x000E) &&  // door
              is_dialog_visible() == 0 && prev(is_dialog_visible()) == 1
)

// - Take the [sheet].
// - Take the [ink].
// - Leave the room and enter room number 4, talk to Fritz. [1-any-any]
// - Take a can of [sauerkraut].
// - Use the [ink] with the mug.

dialog_achievement(scene_univ_fritzs_room, 0x0027, 4, "Look What You've Done", "Ruin Fritz's mug")

// - Take the [mug].
// - Go to the bathroom (WC). Examine the mirror.

dialog_achievement(scene_univ_bathroom, 0x0245, 3, "Smashing Good Looks", "Break a Mirror")

// - Use the [mug] with the wash basin.
// - Enter room 5.
// - Take the fish tank [bottle] [2].
// - Go down to the first floor. Enter the gym. (door to the right of the entrance)
// - Take the two tennis balls [two balls]
// - Enter the kitchen (go right from the entrance twice).
// - Talk to the chef [any-1].
// - Take the [sugar] from the shelf.
// - Take the [baster] next to the pot.
// - Exit the University and continue to the left. You'll be interrupted by a conversation coming from the sewers.
// - Continue to the left and reach the Beppo store.

// ===== 01 - Beppos =====

// - Give Cleo's bowl [Bottle] to Beppo. Receive [multi-use].

dialog_achievement(scene_city_inside_beppos, 0x0395, 5, "The Ultimate Tool", "Get the Multi-use")

// - Take the [adhesive].
// - Go to the police station, to the right of the fish market.
// - Talk to the child.
// - Go inside. Talk to the policeman.
// - Return to the man stuck on the pole.
// - Use the [sugar] with the [mug] full of water.
// - Use the [mug] full of sugar and water with the man stuck to the post to free him. 

dialog_achievement(scene_city_pole, 0x093C, 5, "Free At Last", "Help the Electrician")

// - Use the [multi-use] with the sewer.
// - Talk to the agents. Get [badge] and [film].

dialog_achievement(scene_city_sewer, 0x02C5, 3, "The Truth is Down There", "Get the FBI badge")

// - Fill the [mug] with water from the fountain.
// - Go to Beppo's. Use the [mug] filled with water with the dog's plate.
// - Go fill the [mug] with water from the fountain and return and put it in the dog's plate again.
// - Use the [baster] with the dog's [drool].
// - Give Beppo the [film].

// ===== 02 - Bonkemon =====

// - Talk to the child at the police station for a Bonkemon fight.
// - To win, use the third attack (Drool Blast). Receive [Mousemon]

dialog_achievement(scene_city_outside_police_station, 0x0255, 5, "Gotta Slobber 'em All", "Win at Bonkemon")

// - Give Beppo the [Mousemon].
// - Near the fountain there is a brick. Behind, a [lighter].
// - Refill the [mug] with water.
// - Go inside the school. 
// - Use the [adhesive] in George's bucket.
// - Pick up the package and get George's breakfast [milk].
// - Go into the library. Read the yellow and green books.
// - Return to the entrance. Use the [sugar] with the [mug].
// - Use the [mug] of sugar water with the mop head. Get the [rag].
// - Go right and use the [lighter] with the smoke detector (upper left corner).
// - Enter the chemistry lab. Mix the acids (green, white, red) [4,1,2]. Receive [acid].

dialog_achievement(scene_univ_chem_lab, 0x02E8, 10, "Breaking Not-So-Bad", "Make the acid")

// - Go to the kitchen. Use the [multi-use] on the [sauerkraut].
// - Mix the [sauerkraut] with the [milk]. You get the [mush].
// - Beat the [mush] with the [multi-use]. You get the [cream].
// - Give the [cream] to the chef.

dialog_achievement(scene_univ_kitchen, 0x00C3, 5, "Sous-chef", "Complete the Chef's request")

// - Go to the trailer (road to the right of the fountain).
// - Collect the [antenna].
// - Use the [antenna] with the trash can to get the [wrapping].
// - Use [wrapping] with the trailer door to get inside.
// - Talk to the hackers [any-2-2-3].
// - Go with Beppos and give the [acid] to Beppo.
// - Go to Fritz's room (4) and take the [sheet].
// - Go to Fabropolus's room (5) and take the [blanket].

// ===== 03 - Dress-up =====

// - Talk with Frabropolus [3], get the [tunic]
// - Use the [ink] with the [rag] to get a [wig].
// - Use the [wig] with the [tunic].
// - Use the [two balls] with the [tunic] to obtain the [costume].
// - Give the [costume] to Frabropolus.
// - Go back to your room. Combine the [sheet] and the [blanket] to make a [rope].
// - Combine the [rope] with the [blanket] to make a stronger [rope].
// - Use the [rope] with the window.
// - Use the window rope to go down.

dialog_achievement(scene_univ_dantes_room, 0x01ED, 10, "Playing Dress-Up", "Distract Frau Kruger")

// - Once in the women's area, get the makeup [kit].
// - Enter Mary Angel's room (1). Get the [bra].
// - Exit again through the window of room 2.
// - Take the [bra] to the hackers. Get [videotape] and [GameBoy].
// - Give Beppo the [GameBoy] and the [antenna], get [topzilla].
// - Talk to the fish store owner [1-1-2-3]. 
// - Get the [fish] from the pile in the lower right corner.
// - Give the [fish] to the chef. Get [essence].
// - Use [essence] with [topzilla].
// - Use [topzilla] with Frau Kruger.
// - Enter Frau Kruger's room and take the [tracksuit].
// - Give the [tracksuit] to the trainer (gym) [1-1-2-any-any-any]. Get [key]
// - Use the [key] in the door of the principal's office.
// - Use the [videotape] in the VCR.

dialog_achievement(scene_univ_principals_office, 0x0335, 10, "Be Kind, Rewind", "Watch the videotape")

// - Talk to the owner of the fish store to shut him up.
// - Talk with Beppo. Get [pictures].
// - Give the [pictures] to the police. 
// - Take the [document] from the filing cabinet.

// ===== 04 - Night =====

// - Talk to Beppo. Leave. It becomes night.

dialog_achievement(scene_city_outside_beppos_night, 0x0974, 2, "Time Flies When You're Solving a Mystery", "Night has arrived")

// - Go to Xavoc. Talk to the club guard [3].
// - Go back to the school library and use the [multi-use] with the red book to get the [pictures].
// - Talk to the hackers [1].
// - Give them the [pictures]. Get updated [document].
// - Go to Xavoc. Talk to the club guard [3].

dialog_achievement(scene_city_outside_xavoc_night, 0x03AA, 5, "Papers Please", "Gain access to Xavoc")

// - Inside the club, talk to the army man [1].
// - On the right, take a deflated [balloon].
// - Go to the chemistry room. Inflate the [balloon] with helium.
// - Talk to Fritz, who participates in the drinking contest. Get the military uniform and the [pass].
// - Go to the barracks (left of Xavoc). Talk to the army man.

dialog_achievement(scene_city_outside_military_base_night, 0x0334, 5, "Attention!", "Gain access to the military base")

// - Inside, examine the red phone on the right to find the number 906090.
// - Talk to the soldier [2].
// - Use the telephone outside Xavoc, option 4 (call 906090).
// - Return to the barracks. Enter through the door that was previously being guarded.
// - Talk to the scientist to get the [diskette].
// - Take an [insect] from the wooden box.
// - Talk to Beppo.
// - Go to the trailer. Read the note.
// - In the university library, use the [insect] with the safe.

dialog_achievement(scene_univ_book_room, 0x0366, 5, "Not-so-safe", "Break into the safe in the library")

// - Get the [book] from the safe.
// - Talk with Fabropulos. Trade the [book] for the [tickets].
// - Talk to Beppo.
// - Go to Xavoc. Talk to Mary Angel and she takes the [tickets].
// - Give the helium-filled [balloon] to Frabropolus. He'll also take the make-up [kit]. Get the [multi-use] food processor.

// ===== 05 - Dimensions =====

// - Give Beppo the [multi-use] food processor.
// - Beppo sends Fabropulos, Fritz and Dante to who knows where.

dialog_achievement(scene_alt1_dantes_room, 0x09A6, 10, "Witchery!", "Arrive in another dimension")

// - Take the [curtain].
// - Go out and talk to Baron General Kruger.
// - Go down to the room analogous to the library.
// - Give the [reading] to Beppo.
// - Go to the fountain and talk to Sergeant Alex. Receive the [knife].
// - In what would be the gymnasium take the gas [mask] off the second ledge.
// - Use the [knife] on the [curtain] to get the [tunic].
// - Take the [boots] to put them on (and the tunic).

dialog_achievement(scene_alt1_warehouse, 0x09A9, 5, "Proper Attire", "Find a military uniform for Fabropulos")

// - Go to the kitchen. Talk to the chef.
// - Use the [mask] with the garbage bag to the left of the door.
// - Get a [bottle] of water.
// - Talk to Sergeant Alex
// - Go left, then left again. Examine the tires at the green flag.
// - Go right, then down. Examine the wall at the blue flag.
// - Use the [bottle] with the blue flag to get the blue [flag].
// - Go right, then up. Examine the mud at the red flag.
// - Fill the empty [bottle] with mud.
// - Go through the exit of the kitchen and take the [spring] from the mattress.
// - Talk to Baron General Kruger
// - Use the [bottle] of mud on his wheelchair.
// - Return to the northern training field. Get the red [flag].
// - Go down, then left. Use the [spring] with the tires. Receive the green [flag].
// - Return to the fountain and give Sergeant Alex the flags in order (blue, red, green).
// - Talk to Beppo.

// ===== 06 - Major =====

// - Talk to Major Gaid, in what would be the principal's office.

dialog_achievement(scene_alt1_major_gaids_office, 0x09F7, 10, "Major Help", "Return with Major Gaid")

// - Take the baseball [bat].
// - In room 5, take the [suspenders].
// - Go down to what would be the principal's office.
// - Take the gym [key] from the shelf and the [starter] from the electric train.
// - In the gym, take some [pills] from the emergency kit, and also the [flashlight].
// - Take a [ball] of wool from the skirt of the woman who is speaking at the fountain.
// - Talk to guru Mark Happiness at the trailer.
// - Use the [bat] with Mark.
// - Take the [pin] off his chest.
// - Take the [rope] from the flagpole.
// - Combine the [pin] with the [rope].
// - Go to the florist's shop (where the fish shop would normally be). Talk to Beppo.
// - Give him the [letter].
// - Try to take the upper right flower, get some [seeds].
// - Use the [seeds] with the mortar and pestle that is on the edge of the fountain to make some [oil].
// - Get a piece of [wood] from the boarded-up Beppos shop.
// - Give the [ball] of wool to the cat where the police station would have been.
// - Use the [oil] with the rusted gate.

dialog_achievement(scene_alt2_alley, 0x067C, 5, "Beware of Cat", "Gain access to the abandoned factory")

// - Inside the abandoned factory, take the glass [jar].
// - Use the [rope] with the left end of the chain.
// - Pull the right end of the chain, so that a box falls.
// - Inside the box there is a [blender].
// - Use the [starter] with the [blender].
// - Use the [suspenders] with the [blender].
// - Give Beppo the [blender].

dialog_achievement(scene_alt2_flowershop, 0x0740, 10, "Does it Blend?", "Give Beppo the ultra-powerful blender")

// - Use the [wood] with the carnivorous plant.
// - Use the [flashlight] with the carnivorous plant. Find the [pliers].
// - Go to room 5.
// - Use the [pliers] with a biscuit that is near the mirror to get a [pretzel].
// - Combine the [pretzel] and the glass [jar] to build a [trap].
// - Go to the anthill near the trailer.
// - Use the [trap] with the anthill, to catch the weak ants.
// - Give the [trap] to Beppo.
// - Use the [trap] with the [pills] (vice versa does not work). You get ants anabolic [ants].

// ===== 07 - Hippie =====

// - Give the [ants] to Beppo.

dialog_achievement(scene_alt2_beppos, 0x06A1, 10, "Far Out, Man", "Return with Mark")

// - Take the [acetone].
// - Go out and talk with Folder [any-3-2-any].
// - Speak again with Folder. [2-4-4]. You now have access to Puse's room.
// - Inside the room, look in the closet for more attire according to that universe.

dialog_achievement(scene_alt3_puses_room, 0x05C8, 4, "Toga, Toga, Toga", "Help Dante blend in")

// - Take the [monocle] from a table.
// - In what would be the bathroom, take the toilet [paper] and shower [cap].
// - Outside what was the chemistry room, take [a drawing] of "Wanted".
// - Go to Beppo's store and talk to him through the door.
// - Show him [a drawing] through the door.
// - Give the [letter] to Beppo.
// - Take the [lance], the [pipe] and the broken hand vacuum cleaner [tool].
// - Go to the left of the Beppo store, to the stadium.
// - Talk to the athlete [2].
// - Use the [lance] with the athlete's cloak.
// - Go to the screen on the left and take the vinyl [record]. Go out to the left.
// - Go to the second floor of the university, which would be the room of Mary Angel.
// - Go to the left, to kill a cockroach.
// - Go back to the left and pick up the dead [insect].
// - Take a [mannequin] from the box in the lower left corner.
// - Use the toilet [paper] on the [mannequin] to create a [mummy].
// - Use the [acetone] on the [record].
// - Go back to the right and use the [record] with the phonograph.
// - Use the [pipe] with the phonograph.
// - Put the [mummy] on the stairs at the entrance of the university to scare the guard.

dialog_achievement(scene_alt3_outside_mummy, 0x0A59, 10, "The Haunting", "Scare away the Roman guard")

// - Continue to the right and talk to Puse.
// - Talk to Beppo.
// - Use the [insect] with the door of Frau Kruger's room (second floor, door on the right).
// - Go to the library. Use the shower [cap] with the [tool].
// - Use the [tool] with the carpet.
// - Open the trap door. Go down and take the calculator [gadget].
// - Use the [monocle] with the [gadget].

// ===== 08 - Philospher =====

// - Go to the theater where we found Puse and give the new [gadget] to Beppo.

dialog_achievement(scene_alt3_amplitheatre_depart, 0x0A75, 10, "A Great Performance", "Return with Puse")

// - Back in the original universe, Beppo gives you a [pan] and a [projector].
// - Talk to principal Fisher in his office.
// - Take the [video] cassette, the [data sheet] and the [apron].
// - In the gym, take the sleeping [pills] from the first-aid kit.
// - Use the [multi-use] on the [pills] to make sleeping [powder].
// - From the chemistry room, take the hand-washing [detergent].
// - Use the [detergent] on the [apron].
// - Wash the [apron] in the sink.
// - Take the [test tubes] and the sodium [bicarbonate].
// - Use the [bicarbonate] with the [test tubes] to form three [solution]s.
// - Go to the kitchen and show the [apron] to the chef.
// - Take the [mayonnaise] and the [Sherry].
// - Use the [mayonnaise] with the pot of whatever is cooking.
// - Go to Beppo's and ask for the [dye].
// - Combine the [mayonnaise] and the [dye] to create [point] (paint?).
// - Go to Xavoc and switch the [Sherry] for the bottle of [liquor] on the counter.
// - Go down to the sewers. Look at the papers at the top of the screen. Go in the direction of the 
//   symbol you recognize from the apron [left, left, center, right].

dialog_achievement(scene_home_lake, 0x0747, 4, "A-Maze-ing", "Find your way through the sewer maze")

// - Go with the fisherman and give him the [liquor].
// - Take the [horn] that is in the boat.
// - Go left and use the [point] on the barn door.
// - Continue down, use the [multi-use] with the bull's padlock.
// - Talk to the bull.
// - Ring the bell of the bicycle.
// - Use the [horn] on the bull.

achievement(title = "Big Gray Door Opener", description = "Break into the barn", points = 5, 
    trigger = current_scene() == scene_home_barn && is_dialog_visible() == 0 && prev(is_dialog_visible()) == 1 &&
              (current_dialog_message() == 0x0854 || // horn last
               current_dialog_message() == 0x07C8)   // bike last
)

// - Try to enter the spaceship - find out about the cameras.
// - Go to the trailer and talk to the hackers.
// - Give the [video] to the hackers.

// ===== 09 - Spaceship =====

// - Give the [data sheet] to the hackers.

dialog_achievement(scene_home_inside_trailer, 0x0834, 5, "Your Job Here is Done", "Send the alternate hackers home")

// - Return to the barn. Enter the spaceship.
// - Go in the first door. Pick up the fish bowl containing Mary's fish [palomo]

dialog_achievement(scene_ship_room1, 0x08EE, 3, "Still Trying to Get the Girl", "Find Mary's fish")

// - In the second door, use the sleeping [powder] with the ventilation system.
// - Pull the lever to activate the ventilation system.
// - Go to the right. Use the controls to open the door.
// - Enter the prison. Use the [solution] with the pods to free the prisoners. Receive the [photographs]

dialog_achievement(scene_ship_prison, 0x0877, 5, "Pod People", "Free the prisoners")

// - Go back to the entrance, and go through the rightmost door.
// - Examine the glass sphere.
// - Go back to the cliff near the lake. Use the [pan] on the stone.
// - Use the [projector] on the lawn.
// - Return to the cockpit.

// * Here you have the option to pull the lever. There is no apparent effect.

dialog_achievement(scene_ship_cockpit, 0x0895, 2, "I Wonder What This Does", "Pull the lever in the spaceship cockpit")

// - Talk to the lead fish.

dialog_achievement(scene_ship_cockpit, 0x089A, 10, "So Long, and Thanks for All the Fish", "Convince the aliens to leave")

// - Give the [pictures] to the man with the camera. Receive the [camera].
// - Go back to the university and take a use the [camera] on Frau Kruger to get new [pictures].
// - Go to the trailer and talk to the hackers. They change the [pictures] into [frauzilla].
// - Go back to the lake and put [frauzilla] on the stone.

dialog_achievement(scene_home_lake_frauzilla, 0x0AE0, 10, "It Came From the Dorms", "Prevent an all-out war")

// - After walking to the right through the credits seven times, there is something strange

dialog_achievement(scene_7th_sense_W, 0xAEF, 3, "Breaking the Fourth Wall", "Discover the development studio")


