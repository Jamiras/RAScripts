// Magic Knight Rayearth
// #ID = 3206
// MD5: c8fd6fb87f202db2b3dbbccfe1fdaa24 (J)
// MD5: 78357f96b8c13089732b4306ff5eafe3 (T+Eng1.01_RPGe) [https://www.romhacking.net/translations/387/]

character_hikaru = 1
character_umi = 2
character_fuu = 3
character_ferio = 4
character_ascot = 5
character_lafarga = 6
character_caldina = 7

characters = {
    character_hikaru: "Hikaru",
    character_umi: "Umi",
    character_fuu: "Fuu",
    character_ferio: "Ferio",
    character_ascot: "Ascot",
    character_lafarga: "Lafarga",
    character_caldina: "Caldina",
}

function selected_character(index) => byte(0x0DCE + index)
function character_base(character) => 0x0D8D + character * 69
function character_id(character) => byte(character_base(character) + 0)
function character_hp(character) => word(character_base(character) + 1)
function character_max_hp(character) => word(character_base(character) + 3)
function character_mp(character) => word(character_base(character) + 5)
function character_max_mp(character) => word(character_base(character) + 7)
function character_lv(character) => byte(character_base(character) + 9)
function character_xp_needed(character) => word(character_base(character) + 10)
function character_attack(character) => word(character_base(character) + 12)
function character_defense(character) => word(character_base(character) + 14)
function character_power(character) => byte(character_base(character) + 16)
function character_stamina(character) => byte(character_base(character) + 17)
function character_agility(character) => byte(character_base(character) + 18)
function character_wisdom(character) => byte(character_base(character) + 19)
function character_will(character) => byte(character_base(character) + 20)

function current_map() => byte(0x07E5) // also 0x7FC
map_overworld = 0x01
map_southern_seashore = 0x02
map_mokonas_tent = 0x03
map_nw_village_ne_house = 0x04
map_nw_village_sw_house = 0x05
map_nw_village_nw_house = 0x06
map_sw_village_e_house2 = 0x07
map_temple_of_water = 0x0A
map_temple_of_wind = 0x0B
map_temple_of_fire = 0x0C
map_temple_of_fire2 = 0x0D
map_nw_village = 0x0E
map_se_village = 0x0F
map_preseas_house_inside = 0x08
map_emeraudes_castle = 0x09 
map_sw_village = 0x10
map_preseas_house_outside = 0x11
map_start_clearing = 0x12
map_mountain_of_no_return = 0x13
map_volcano = 0x14
map_maze_of_wind = 0x17
map_maze_of_wind2 = 0x18
map_maze_of_wind3 = 0x19
map_under_the_sea = 0x1A
map_under_the_sea2 = 0x1B
map_volcano_interior1 = 0x1C
map_volcano_interior2 = 0x1D
map_volcano_interior3 = 0x1E
map_zagato_cave1 = 0x1F
map_mountain_of_no_return_entrance = 0x21
map_forest_of_elel_south = 0x22
map_forest_of_elel_north = 0x23
map_forest_of_silence = 0x24
map_spring_of_eterna_outside = 0x25
map_zagato_island = 0x26
map_spring_of_eterna_hikaru = 0x27
map_spring_of_eterna_umi = 0x28
map_spring_of_eterna_fuu = 0x29
map_zagato_cutscene = 0x2A
map_emeraude_cutscene = 0x2B
map_mirror_maze = 0x2C
map_mirror_maze2 = 0x2D
map_zagato_castle = 0x2E
map_zagato_castle2 = 0x2F
map_zagato_castle3 = 0x30
map_temple_of_water_entrance = 0x31
map_temple_of_wind_entrance = 0x32
map_temple_of_fire_entrance = 0x33
map_zagato_castle_entrance = 0x34
map_emeraudes_castle_entrance = 0x35 
map_se_village_sw_house = 0x36
map_se_village_nw_house = 0x37
map_se_village_ne_house = 0x38
map_sw_village_sw_house1 = 0x39
map_sw_village_sw_house2 = 0x3A
map_sw_village_sw_house3 = 0x3B
map_sw_village_w_house1 = 0x3C
map_sw_village_w_house2 = 0x3D
map_sw_village_nw_house = 0x3E
map_sw_village_n_house = 0x3F
map_sw_village_ne_house = 0x40
map_sw_village_e_house1 = 0x41
map_sw_village_se_house = 0x42
map_on_griffin = 0x43
map_after_forest_of_silence = 0x44
map_mountain_of_no_return_cave_se = 0x45
map_mountain_of_no_return_cave_e = 0x46
map_mountain_of_no_return_cave_ne = 0x47
map_mountain_of_no_return_cave_sw = 0x48
map_mountain_of_no_return_cave_n = 0x49
map_mountain_of_no_return_cave_nw = 0x4A
map_volcano_se_cave = 0x4B
map_volcano_ne_cave = 0x4C
map_volcano_s_cave = 0x4D
map_volcano_nw_cave = 0x4E
map_volcano_n_cave = 0x4F
map_tokyo_tower = 0x50
map_volcano_interior1_nw_cave = 0x51
map_volcano_interior1_n_cave = 0x52
map_volcano_interior2_cave2 = 0x53
map_volcano_interior2_cave3 = 0x54
map_volcano_interior2_cave4 = 0x55

maps = {
    map_start_clearing: "a clearing",
    map_overworld: "the world",
    map_zagato_cutscene: "Zagato's Castle",
    map_forest_of_elel_south: "the Forest of Elel",
    map_forest_of_elel_north: "the Forest of Elel",
    map_on_griffin: "the sky",
    map_nw_village: "a village",
    map_nw_village_ne_house: "a village",
    map_nw_village_sw_house: "a village",
    map_nw_village_nw_house: "a village",
    map_preseas_house_outside: "Presea's house",
    map_preseas_house_inside: "Presea's house",
    map_mokonas_tent: "Mokona's tent",
    map_forest_of_silence: "the Forest of Silence",
    map_after_forest_of_silence: "the Forest of Silence",
    map_spring_of_eterna_outside: "the Spring of Eterna",
    map_spring_of_eterna_hikaru: "the Spring of Eterna",
    map_spring_of_eterna_umi: "the Spring of Eterna",
    map_spring_of_eterna_fuu: "the Spring of Eterna",
    map_se_village: "a village",
    map_se_village_sw_house: "a village",
    map_se_village_nw_house: "a village",
    map_se_village_ne_house: "a village",
    map_southern_seashore: "the southern seashore",
    map_under_the_sea: "under the sea",
    map_under_the_sea2: "under the sea",
    map_temple_of_water_entrance: "the Temple of Water",
    map_temple_of_water: "the Temple of Water",
    map_mountain_of_no_return_entrance: "the Mountain of No Return",
    map_mountain_of_no_return: "the Mountain of No Return",
    map_mountain_of_no_return_cave_sw: "the Mountain of No Return",
    map_mountain_of_no_return_cave_se: "the Mountain of No Return",
    map_mountain_of_no_return_cave_e: "the Mountain of No Return",
    map_mountain_of_no_return_cave_ne: "the Mountain of No Return",
    map_mountain_of_no_return_cave_n: "the Mountain of No Return",
    map_mountain_of_no_return_cave_nw: "the Mountain of No Return",
    map_maze_of_wind: "the Maze of Wind",
    map_maze_of_wind2: "the Maze of Wind",
    map_maze_of_wind3: "the Maze of Wind",
    map_temple_of_wind_entrance: "the Temple of Wind",
    map_temple_of_wind: "the Temple of Wind",
    map_volcano: "a volcano",
    map_volcano_s_cave: "a volcano",
    map_volcano_nw_cave: "a volcano",
    map_volcano_se_cave: "a volcano",
    map_volcano_n_cave: "a volcano",
    map_volcano_ne_cave: "a volcano",
    map_volcano_interior1: "a volcano",
    map_volcano_interior1_nw_cave: "a volcano",
    map_volcano_interior1_n_cave: "a volcano",
    map_volcano_interior2: "a volcano",
    map_volcano_interior2_cave2: "a volcano",
    map_volcano_interior2_cave3: "a volcano",
    map_volcano_interior2_cave4: "a volcano",
    map_volcano_interior3: "a volcano",
    map_temple_of_fire_entrance: "the Temple of Fire",
    map_temple_of_fire: "the Temple of Fire",
    map_temple_of_fire2: "the Temple of Fire",
    map_zagato_island: "the Deep Cave",
    map_zagato_cave1: "the Deep Cave",
    map_mirror_maze: "the Mirror Maze",
    map_mirror_maze2: "the Mirror Maze",
    map_zagato_castle_entrance: "Zagato's Castle",
    map_emeraude_cutscene: "Zagato's Castle",
    map_zagato_castle: "Zagato's Castle",
    map_zagato_castle2: "Zagato's Castle",
    map_zagato_castle3: "Zagato's Castle",
    map_tokyo_tower: "the epilogue",
    
    map_sw_village: "a village",
    map_sw_village_sw_house1: "a village",
    map_sw_village_sw_house2: "a village",
    map_sw_village_sw_house3: "a village",
    map_sw_village_w_house1: "a village",
    map_sw_village_w_house2: "a village",
    map_sw_village_nw_house: "a village",
    map_sw_village_n_house: "a village",
    map_sw_village_ne_house: "a village",
    map_sw_village_e_house1: "a village",
    map_sw_village_e_house2: "a village",
    map_sw_village_se_house: "a village",
    map_emeraudes_castle_entrance: "Emeraude's Castle",
    map_emeraudes_castle: "Emeraude's Castle",
}

// ----------------------------------------------------------------------------

rich_presence_conditional_display(selected_character(3) != 0, 
    "{0} (Lv{1}), {2} (Lv{3}), {4} (Lv{5}) and {6} (Lv{7}) are exploring {8}",
    rich_presence_lookup("Character", selected_character(0), characters),
    rich_presence_value("Level", character_lv(selected_character(0))),
    rich_presence_lookup("Character", selected_character(1), characters),
    rich_presence_value("Level", character_lv(selected_character(1))),
    rich_presence_lookup("Character", selected_character(2), characters),
    rich_presence_value("Level", character_lv(selected_character(2))),
    rich_presence_lookup("Character", selected_character(3), characters),
    rich_presence_value("Level", character_lv(selected_character(3))),
    rich_presence_lookup("Map", current_map(), maps)
)


rich_presence_conditional_display(selected_character(2) != 0,
    "{0} (Lv{1}), {2} (Lv{3}), and {4} (Lv{5}) are exploring {6}",
    rich_presence_lookup("Character", selected_character(0), characters),
    rich_presence_value("Level", character_lv(selected_character(0))),
    rich_presence_lookup("Character", selected_character(1), characters),
    rich_presence_value("Level", character_lv(selected_character(1))),
    rich_presence_lookup("Character", selected_character(2), characters),
    rich_presence_value("Level", character_lv(selected_character(2))),
    rich_presence_lookup("Map", current_map(), maps)
)

rich_presence_conditional_display(selected_character(1) != 0,
    "{0} (Lv{1}) and {2} (Lv{3}) are exploring {4}",
    rich_presence_lookup("Character", selected_character(0), characters),
    rich_presence_value("Level", character_lv(selected_character(0))),
    rich_presence_lookup("Character", selected_character(1), characters),
    rich_presence_value("Level", character_lv(selected_character(1))),
    rich_presence_lookup("Map", current_map(), maps)
)

rich_presence_conditional_display(selected_character(0) != 0, 
    "{0} (Lv{1}) is exploring {2}",
    rich_presence_lookup("Character", selected_character(0), characters),
    rich_presence_value("Level", character_lv(selected_character(0))),
    rich_presence_lookup("Map", current_map(), maps)
)

rich_presence_display("Titles")

// ----------------------------------------------------------------------------

function current_monster(index) => byte(0x134D + index)
function current_monster_hp(index) => word(0x1373 + index * 69)
monster_frog = 0x01             //    50 HP
monster_black_toad = 0x02       //    80 HP
monster_mold = 0x03             //   120 HP
monster_growmold = 0x04         //   200 HP
monster_bee = 0x05              //    40 HP
monster_wasp = 0x06             //   320 HP
monster_hornet = 0x07           //  1000 HP
monster_giant_wasp = 0x08       //  2000 HP
monster_slime = 0x09            //    50 HP
monster_black_purin = 0x0A      //   100 HP
monster_blood_jerry = 0x0B      //  1500 HP
monster_grey_ooze = 0x0C        //  2000 HP
monster_hikaru = 0x0D           //  4000 HP
monster_umi = 0x0E              //  3800 HP
monster_fuu = 0x0F              //  2000 HP
monster_hikari = 0x10           //  2000 HP
monster_black_purin = 0x0A      //   100 HP
monster_umis_dad = 0x11         //  1500 HP
monster_umis_mom = 0x12         //  1200 HP
monster_makanoid = 0x13         //   100 HP
monster_mash = 0x14             //   400 HP
monster_brain_ash = 0x15        //   600 HP
monster_shrieker = 0x16         //  2500 HP
monster_cocatrice = 0x17        //   200 HP
monster_cockadoo = 0x18         //  2500 HP
monster_ramian = 0x19           //   600 HP
monster_red_sneaker = 0x1A      //  1700 HP
monster_mandrake = 0x1B         //   400 HP
monster_war_plant = 0x1C        //  2500 HP
monster_satirus = 0x1D          //  3000 HP
monster_bic_hone = 0x1E         //  5000 HP
monster_floren = 0x20           //  3000 HP
monster_florence = 0x21         //  2500 HP
monster_lizardman = 0x22        //  2000 HP
monster_dragon_newt = 0x23      //  2900 HP
monster_weretiger = 0x24        //  2500 HP
monster_bengal_jack = 0x25      //  5000 HP
monster_harpy = 0x26            //  2000 HP
monster_harpy_queen = 0x27      //  4800 HP
monster_scorpion_man = 0x28     //  1500 HP
monster_scorpion_king = 0x29    //  4000 HP
monster_zagato = 0x2A           // 24000 HP
monster_alcione2 = 0x2B         //  1000 HP
monster_caldina = 0x2C          //  7000 HP [outside Temple of Wind]
monster_inouva = 0x2D           // 30000 HP
monster_lafarga = 0x2E          // 18000 HP [outside Temple of Fire]
monster_black_dragon = 0x30     //  7000 HP
monster_chimera = 0x31          //  6000 HP
monster_power_chimera = 0x32    //  6500 HP
monster_clay_golem = 0x33       //  5000 HP
monster_iron_golem = 0x34       //  5000 HP
monster_roc = 0x35              //  3000 HP
monster_kick_roc = 0x36         //  6000 HP
monster_behemoth = 0x37         //  3200 HP
monster_mad_mad = 0x38          //  8000 HP
monster_alcione = 0x39          //    20 HP [griffon fight]
monster_kelviroth = 0x3A        // 28000 HP
monster_fazier = 0x3B           //  4000 HP
monster_blizea = 0x3C           //  6000 HP
monster_winzia = 0x3D           //  8000 HP
monster_zagato_mashin = 0x3E    // 40000 HP
monster_emeraude_mashin = 0x3F  // 65535 HP
monster_alcione3 = 0x40         //  7000 HP [Forest of Silence]
monster_alcione4 = 0x41         // 34000 HP [Zagato's Castle]
monster_caldina2 = 0x42         //  3000 HP [in Temple of Wind]
monster_emeraude_mashin2 = 0x43 // 65000 HP
monster_flower1 = 0x44          //  1000 HP
monster_flower2 = 0x45          //  4000 HP
monster_death_flower = 0x46     //  4000 HP
monster_lafarga2 = 0x47         // 17000 HP [after meeting Rayearth]

item_smoke = 1
item_soulcore = 2
item_softseed = 3
item_poisseed = 4
item_pasaseed = 5
item_lifecube = 6
item_lifefull = 7
item_starcube = 8
item_starfull = 9
item_rootcube = 10
item_windcore = 11
item_firecore = 12
item_wavecore = 13
item_fusecore = 14
item_earring = 15
item_maxorb = 16
item_elelbox = 17
item_earring = 18
item_gatekey = 19
item_candy = 20

function current_dialog_portrait() => byte(0x06C2)
portrait_none = 0x00
portrait_hikaru = 0x01
portrait_umi = 0x02
portrait_fuu = 0x03
portrait_mokona = 0x04
portrait_clef = 0x05
portrait_emeraude = 0x06
portrait_presea = 0x07
portrait_ferio = 0x08
portrait_zagato = 0x09
portrait_inouva = 0x0A
portrait_alcione = 0x0B
portrait_ascot = 0x0C
portrait_caldina = 0x0D
portrait_lafarga = 0x0E
portrait_hikaru_happy = 0x0F
portrait_hikaru_angry = 0x10
portrait_umi_happy = 0x11
portrait_umi_angry = 0x12
portrait_fuu_happy = 0x13
portrait_fuu_angry = 0x14
portrait_emeraude_angry = 0x15
portrait_water_dragon = 0x16
portrait_wind_mashin = 0x17
portrait_fire_mashin = 0x18

// ----------------------------------------------------------------------------

// 0C88:40 - see Zagato cutscene before entering Forest of Elel
// 0C88:20 - talk to fairy in Forest of Elel
// 0C88:10 - find hidden path in tree in Forest of Elel
// 0C88:08 - collect chest in Forest of Elel
// 0C88:04 - defeat Alcione after delivering the chest to Clef
// 0C88:02 - get temporary weapons from Presea
// 0C88:01 - Ferio joined the party

// 0C89:80 - arrived at Presea's house
// 0C89:40 - defeat Alcione again and Ferio leaves the party
// 0C89:20 - figure out the illusionary walls as Umi
// 0C89:02 - complete all three paths at Spring of Eterna
// 0C89:01 - get the Escudo weapons

// 0C8A:80 - acquire the flying cup
// 0C8A:20 - open door to Mountain of No Return
// 0C8A:10 - save old woman from Death Flowers
// 0C8A:08 - get Gate Key
// 0C8A:02 - Ascot leaves the party
// 0C8A:01 - find the door at the Mountain of No Return is locked

// 0C8B:80 - defeat Caldina at the Temple of Wind
// 0C8B:40 - watch Zagato take control of Lafarga
// 0C8B:10 - hire Caldina
// 0C8B:08 - eliminate red crystal south of Spring of Eterna
// 0C8B:04 - examine lake near Zagato's Castle before meeting Lafarga
// 0C8B:02 - arrive at Zagato's Island
// 0C8B:01 - arrive at the Mirror Maze

// 0C8C:40 - defeat Inouva and Kelviroth
// 0C8C:20 - Lafarga leaves the party
// 0C8C:10 - ???
// 0C8C:08 - ???
// 0C8C:04 - defeat Zagato Mashin

// 0C8D:80 - [temporary] fly from Mountain of No Return to Maze of Wind
// 0C8D:40 - figure out the illusionary walls as Fuu
// 0C8D:04 - push rightmost button in Volcano
// 0C8D:02 - push center button in Volcano
// 0C8D:01 - push leftmost button in Volcano

// 0C8E:80 - Lafarge joins the party
// 0C8E:20 - decline to hire Caldina
// 0C8E:10 - hire Caldina
// 0C8E:02 - introduction to Mokona's tent (outside Forest of Silence)
// 0C8E:01 - introduction to Cerula's money (se village shop)

// 0C8F:80 - get Orb of Maxima
// 0C8F:60 - ???

// 0CC8:80 - WindCore x1 [Emeraude's Castle]
// 0CC8:40 - LifeCube x4 [Forest of Silence]
// 0CC8:20 - LifeCube x3 [Spring of Eternia - Hikaru]
// 0CC8:10 - StarCube x3 [Spring of Eternia - Hikaru]
// 0CC8:08 - LifeFull x1 [Spring of Eternia - Umi]
// 0CC8:04 - StarCube x2 [Spring of Eternia - Umi]
// 0CC8:02 - WindCore x5 [Spring of Eternia - Fuu]
// 0CC8:01 - StarCube x3 [Spring of Eternia - Fuu]

// 0CC9:80 - FuseCore x3 [Temple of Water]
// 0CC9:40 - PoisSeed x2 [Temple of Water]
// 0CC9:20 - StarCube x2 [Temple of Water]
// 0CC9:10 - StarCube x3 [under the sea].
// 0CC9:08 - ???
// 0CC9:04 - FuseCore x3 [under the sea].
// 0CC9:02 - Smoke    x3 [under the sea].
// 0CC9:01 - FuseCore x3 [under the sea].

// 0CCA:80 - ???
// 0CCA:40 - ???
// 0CCA:20 - ???
// 0CCA:10 - RootCube x1 [under the sea]
// 0CCA:08 - FuseCore x5 [Mountain of No Return]
// 0CCA:04 - StarCube x3 [Mountain of No Return]
// 0CCA:02 - LifeFull x3 [Mountain of No Return]
// 0CCA:01 - FireCore x2 [Mountain of No Return]

// 0CCB:80 - WindCore x3 [Maze of Wind]
// 0CCB:40 - StarCube x2 [Maze of Wind]
// 0CCB:20 - LifeCube x3 [Maze of Wind]
// 0CCB:10 - StarCube x2 [Maze of Wind]
// 0CCB:08 - SoftSeed x3 [Maze of Wind]
// 0CCB:04 - LifeFull x1 [Temple of Wind]
// 0CCB:02 - StarFull x1 [Temple of Wind]
// 0CCB:01 - RootCube x1 [Temple of Wind]

// 0CCC:80 - Smoke    x1 [Volcano]
// 0CCC:40 - SoulCore x2 [Volcano]
// 0CCC:20 - RootCube x2 [Volcano]
// 0CCC:10 - FuseCore x2 [Volcano]
// 0CCC:08 - RootCube x1 [Temple of Fire]
// 0CCC:04 - LifeCube x1 [Temple of Fire]
// 0CCC:02 - SoulCore x1 [Temple of Fire]
// 0CCC:01 - PasaSeed x2 [Temple of Fire]

// 0CCD:80 - FuseCore x1 [Temple of Fire]
// 0CCD:40 - FuseCore x1 [Temple of Fire]
// 0CCD:20 - SoulCore x1 [Temple of Fire]
// 0CCD:10 - SoftSeed x1 [Temple of Fire]
// 0CCD:08 - PoisSeed x1 [Temple of Fire]
// 0CCD:04 - FuseCore x1 [Temple of Fire]
// 0CCD:02 - StarFull x1 [Mirror Maze]
// 0CCD:01 - LifeFull x1 [Mirror Maze]

// 0CCE:80 - WaveCore x1 [Mirror Maze]
// 0CCE:40 - StarFull x2 [Mirror Maze]
// 0CCE:20 - LifeFull x2 [Mirror Maze]
// 0CCE:10 - StarFull x2 [Mirror Maze]
// 0CCE:08 - LifeFull x2 [Mirror Maze]
// 0CCE:04 - SoulCore x2 [Mirror Maze]
// 0CCE:02 - LifeFull x1 [Deep Cave]
// 0CCE:01 - LifeCube x1 [Deep Cave]

// 0CCF:80 - StarCube x1 [Deep Cave]
// 0CCF:40 - PoisSeed x1 [Deep Cave]
// 0CCF:20 - LifeCube x1 [Maze of Wind]
// 0CCF:10 - LifeCube x1 [Maze of Wind]
// 0CCF:08 - LifeCube x1 [Maze of Wind]
// 0CCF:04 - LifeCube x1 [Maze of Wind]
// 0CCF:02 - RootCube x3 [Zagato's Castle]
// 0CCF:01 - LifeCube x3 [Zagato's Castle]

// 0CD0:80 - LifeFull x3 [Zagato's Castle]
// 0CD0:40 - StarCube x5 [Zagato's Castle]
// 0CD0:20 - StarFull x3 [Zagato's Castle]
// 0CD0:10 - StarCube x3 [Zagato's Castle]
// 0CD0:08 - LifeCube x2 [Zagato's Castle]
// 0CD0:04 - FireCore x1 [Emeraude's Castle]
// 0CD0:02 - WindCore x1 [Emeraude's Castle]
// 0CD0:01 - FuseCore x1 [Emeraude's Castle]

// 0CD1:80 - WaveCore x1 [Emeraude's Castle]
// 0CD1:40 - FireCore x1 [Emeraude's Castle]
// 0CD1:20 - RootCube x1 [Volcano]
// 0CD1:10 - WindCore x2 [Volcano]
// 0CD1:08 - StarCube x3 [Volcano]
// 0CD1:04 - WaveCore x2 [Volcano]
// 0CD1:02 - WaveCore x2 [Volcano]
// 0CD1:01 - PasaSeed x2 [Volcano]

// 0CD2:80 - StarFull x1 [Volcano]
// 0CD2:40 - FireCore x2 [Volcano]
// 0CD2:20 - FuseCore x2 [Mirror Maze]
// 0CD2:10 - StarFull x2 [Mirror Maze]

function flag_achievement(title, description, points, map, flag)
{
    achievement(title, description, points,
        trigger = current_map() == map &&
                  flag == 1 && prev(flag) == 0
    )
}

// [Lv1-4] #A1#
flag_achievement("The Magics Have Chosen You", "Defeat Alcione", 5, map_on_griffin, bit2(0x0C88))

// [Lv7-10] #A2#
flag_achievement("I'm Gonna Let the Real Magic Knights Handle It", 
                 "Receive a parting gift from Ferio", 5, map_after_forest_of_silence, bit6(0x0C89))

function eterna_achievement(title, description, points, map)
{
    achievement(title, description, points,
        trigger = (current_map() == map &&
                   byte(0x0C5F) == 1 && prev(byte(0x0C5F)) == 0) || // return to selection screen from map
                  (prior(current_map()) == map &&
                   bit1(0x0C89) == 1 && prev(bit1(0x0C89)) == 0)    // complete last path
    )
}

// [Lv12] #A3#
eterna_achievement("We Were Always Friends", "Complete Hikari's path in the Spring of Eterna", 5, map_spring_of_eterna_hikaru)

// [Lv12]
eterna_achievement("For Raising Me", "Complete Umi's path in the Spring of Eterna", 5, map_spring_of_eterna_umi)

// [Lv12]
eterna_achievement("Is That Me?", "Complete Fuu's path in the Spring of Eterna", 5, map_spring_of_eterna_fuu)

// the mashin achievements don't seem to have a bit flag - even after getting all the way back to the player
// having control after a couple of cutscenes. instead, capture the mashin talking after defeating the boss.
// also useful for other achievements where the achievement should occur ealier than the bit flag is updated.
function boss_achievement(title, description, points, map, portrait, monster)
{
    achievement(title, description, points, 
        trigger = never(current_map() != map) &&
                  never(current_monster_hp(0) != 0) &&
                  once(current_dialog_portrait() == portrait && current_monster(0) == monster) &&
                  current_dialog_portrait() == portrait_none
    )
}

// [Lv15-20] #B1#
boss_achievement("Happiness for Your Friends", "Prove yourself to the water mashin", 5, 
    map_temple_of_water, portrait_water_dragon, monster_fazier)

// [Lv21-27] #B2#
boss_achievement("I Would Give My Life for My Friends", "Prove yourself to the wind mashin", 5, 
    map_temple_of_wind, portrait_wind_mashin, monster_caldina2)

// [Lv29-35] #B3#
boss_achievement("We're Going Back Together", "Prove yourself to the fire mashin", 5, 
    map_temple_of_fire_entrance, portrait_fire_mashin, monster_lafarga2)

// [Lv36-44] #C1#
flag_achievement("His True Form", "Defeat Inouva and Kelviroth", 5, map_mirror_maze2, bit6(0x0C8C))

// [Lv45-51] #C2#C3?#
boss_achievement("For the Peace of Cephiro", "Defeat Zagato and his mashin", 10,
    map_zagato_castle3, portrait_zagato, monster_zagato_mashin)

// [Lv52] #D1#
boss_achievement("Reunited", "Defeat Emeraude's mashin", 10,
    map_zagato_cutscene, portrait_emeraude_angry, monster_emeraude_mashin2)

// GOOD ENDING:
// After finishing the Wind Maze, go back to the 3rd village, enter the old lady's house, talk to Ascot and
// he'll give you the Maxima Orb. With this orb in your possession, you'll get the good ending once you beat
// the game. If you don't get the orb, then once you beat the last boss, you are transported back to Tokyo 
// Tower and Hikaru says she wants to go back to save Cephiro and the credits will roll.
boss_achievement("Piece of Cake [m]", "Say your goodbyes", 10,
    map_emeraudes_castle, portrait_umi, monster_emeraude_mashin2)

// ----------------------------------------------------------------------------

function treasure_achievement(title, description, points, bits)
{
    achievement(title, description, points,
        trigger = measured(sum_of(bits, b => b) == length(bits)) &&
                  sum_of(bits, b => prev(b)) == length(bits) - 1        
    )
}

// #B1#
treasure_achievement("Treasure Hunter: Water [m]", "Collect all 8 treasures under the sea and in the Temple of Water", 5,
    [
        bit7(0x0CC9), // 0CC9:80 - FuseCore x3 [Temple of Water]
        bit6(0x0CC9), // 0CC9:40 - PoisSeed x2 [Temple of Water]
        bit5(0x0CC9), // 0CC9:20 - StarCube x2 [Temple of Water]
        bit4(0x0CC9), // 0CC9:10 - StarCube x3 [under the sea]
        bit2(0x0CC9), // 0CC9:04 - FuseCore x3 [under the sea]
        bit1(0x0CC9), // 0CC9:02 - Smoke    x3 [under the sea]
        bit0(0x0CC9), // 0CC9:01 - FuseCore x3 [under the sea]

        bit4(0x0CCA), // 0CCA:10 - RootCube x1 [under the sea]
    ]
)

// #B2#
treasure_achievement("Treasure Hunter: Wind [m]", 
    "Collect all 16 treasures in the Mountain of No Return, Maze of Wind, and Temple of Wind", 5,
    [
        bit3(0x0CCA), // 0CCA:08 - FuseCore x5 [Mountain of No Return]
        bit2(0x0CCA), // 0CCA:04 - StarCube x3 [Mountain of No Return]
        bit1(0x0CCA), // 0CCA:02 - LifeFull x3 [Mountain of No Return]
        bit0(0x0CCA), // 0CCA:01 - FireCore x2 [Mountain of No Return]

        bit7(0x0CCB), // 0CCB:80 - WindCore x3 [Maze of Wind]
        bit6(0x0CCB), // 0CCB:40 - StarCube x2 [Maze of Wind]
        bit5(0x0CCB), // 0CCB:20 - LifeCube x3 [Maze of Wind]
        bit4(0x0CCB), // 0CCB:10 - StarCube x2 [Maze of Wind]
        bit3(0x0CCB), // 0CCB:08 - SoftSeed x3 [Maze of Wind]
        bit2(0x0CCB), // 0CCB:04 - LifeFull x1 [Temple of Wind]
        bit1(0x0CCB), // 0CCB:02 - StarFull x1 [Temple of Wind]
        bit0(0x0CCB), // 0CCB:01 - RootCube x1 [Temple of Wind]

        bit5(0x0CCF), // 0CCF:20 - LifeCube x1 [Maze of Wind]
        bit4(0x0CCF), // 0CCF:10 - LifeCube x1 [Maze of Wind]
        bit3(0x0CCF), // 0CCF:08 - LifeCube x1 [Maze of Wind]
        bit2(0x0CCF), // 0CCF:04 - LifeCube x1 [Maze of Wind]
    ]
)

// #B3#
treasure_achievement("Treasure Hunter: Fire [m]", "Collect all 22 treasures in the Volcano and Temple of Fire", 5,
    [
        bit7(0x0CCC), // 0CCC:80 - Smoke    x1 [Volcano]
        bit6(0x0CCC), // 0CCC:40 - SoulCore x2 [Volcano]
        bit5(0x0CCC), // 0CCC:20 - RootCube x2 [Volcano]
        bit4(0x0CCC), // 0CCC:10 - FuseCore x2 [Volcano]
        bit3(0x0CCC), // 0CCC:08 - RootCube x1 [Temple of Fire]
        bit2(0x0CCC), // 0CCC:04 - LifeCube x1 [Temple of Fire]
        bit1(0x0CCC), // 0CCC:02 - SoulCore x1 [Temple of Fire]
        bit0(0x0CCC), // 0CCC:01 - PasaSeed x2 [Temple of Fire]

        bit7(0x0CCD), // 0CCD:80 - FuseCore x1 [Temple of Fire]
        bit6(0x0CCD), // 0CCD:40 - FuseCore x1 [Temple of Fire]
        bit5(0x0CCD), // 0CCD:20 - SoulCore x1 [Temple of Fire]
        bit4(0x0CCD), // 0CCD:10 - SoftSeed x1 [Temple of Fire]
        bit3(0x0CCD), // 0CCD:08 - PoisSeed x1 [Temple of Fire]
        bit2(0x0CCD), // 0CCD:04 - FuseCore x1 [Temple of Fire]

        bit5(0x0CD1), // 0CD1:20 - RootCube x1 [Volcano]
        bit4(0x0CD1), // 0CD1:10 - WindCore x2 [Volcano]
        bit3(0x0CD1), // 0CD1:08 - StarCube x3 [Volcano]
        bit2(0x0CD1), // 0CD1:04 - WaveCore x2 [Volcano]
        bit1(0x0CD1), // 0CD1:02 - WaveCore x2 [Volcano]
        bit0(0x0CD1), // 0CD1:01 - PasaSeed x2 [Volcano]

        bit7(0x0CD2), // 0CD2:80 - StarFull x1 [Volcano]
        bit6(0x0CD2), // 0CD2:40 - FireCore x2 [Volcano]
    ]
)

// #C1#
treasure_achievement("Treasure Hunter: Earth", "Collect all 14 treasures in the Deep Cave and the Mirror Maze", 5,
    [
        bit1(0x0CCD), // 0CCD:02 - StarFull x1 [Mirror Maze]
        bit0(0x0CCD), // 0CCD:01 - LifeFull x1 [Mirror Maze]

        bit7(0x0CCE), // 0CCE:80 - WaveCore x1 [Mirror Maze]
        bit6(0x0CCE), // 0CCE:40 - StarFull x2 [Mirror Maze]
        bit5(0x0CCE), // 0CCE:20 - LifeFull x2 [Mirror Maze]
        bit4(0x0CCE), // 0CCE:10 - StarFull x2 [Mirror Maze]
        bit3(0x0CCE), // 0CCE:08 - LifeFull x2 [Mirror Maze]
        bit2(0x0CCE), // 0CCE:04 - SoulCore x2 [Mirror Maze]
        bit1(0x0CCE), // 0CCE:02 - LifeFull x1 [Deep Cave]
        bit0(0x0CCE), // 0CCE:01 - LifeCube x1 [Deep Cave]

        bit7(0x0CCF), // 0CCF:80 - StarCube x1 [Deep Cave]
        bit6(0x0CCF), // 0CCF:40 - PoisSeed x1 [Deep Cave]

        bit5(0x0CD2), // 0CD2:20 - FuseCore x2 [Mirror Maze]
        bit4(0x0CD2), // 0CD2:10 - StarFull x2 [Mirror Maze]
    ]
)

// #C3#
treasure_achievement("Treasure Hunter: Pillar [m]", "Collect all 13 treasures in Emeraude's Castle and Zagato's Castle", 5,
    [
        bit7(0x0CC8), // 0CC8:80 - WindCore x1 [Emeraude's Castle]
        
        bit1(0x0CCF), // 0CCF:02 - RootCube x3 [Zagato's Castle]
        bit0(0x0CCF), // 0CCF:01 - LifeCube x3 [Zagato's Castle]

        bit7(0x0CD0), // 0CD0:80 - LifeFull x3 [Zagato's Castle]
        bit6(0x0CD0), // 0CD0:40 - StarCube x5 [Zagato's Castle]
        bit5(0x0CD0), // 0CD0:20 - StarFull x3 [Zagato's Castle]
        bit4(0x0CD0), // 0CD0:10 - StarCube x3 [Zagato's Castle]
        bit3(0x0CD0), // 0CD0:08 - LifeCube x2 [Zagato's Castle]
        bit2(0x0CD0), // 0CD0:04 - FireCore x1 [Emeraude's Castle]
        bit1(0x0CD0), // 0CD0:02 - WindCore x1 [Emeraude's Castle]
        bit0(0x0CD0), // 0CD0:01 - FuseCore x1 [Emeraude's Castle]

        bit7(0x0CD1), // 0CD1:80 - WaveCore x1 [Emeraude's Castle]
        bit6(0x0CD1), // 0CD1:40 - FireCore x1 [Emeraude's Castle]
    ]
)