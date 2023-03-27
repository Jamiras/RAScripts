// Dragon Quest Monsters: Joker
// #ID = 16655
// https://news.retroachievements.org/issues/2022-12/most-wanted.html#handhelds

// 150h16m at publish time
// 210h25m at mastery (60h09m)

// There is an in-game reward for unlocking all 210 monster library entries, but it's not possible to do so. One
// of the required entries is Robbin' Hood, which is a reward for completing both the monster library and the
// skills library. Additionally, Trode is a reward for completing both libraries, and Empyrea is a reward for
// completing the monster library. Similarly, Leopold is a reward for completing the skills library, which cannot
// be done without all the monsters. There are also two syntheses that can only be made using Empyrea and Leopold,
// but one of them can be encountered in the game, so the maximum number of library entries that are actually
// achievable is 205. There's an in-game recognition for 200, so I've stopped at that.
// Leopold, Empyrea, and Trode could be acquired through wi-fi tournaments which are no longer available, but
// Robbin' Hood was never available any other way. As a result, it was never actually possible to fully complete
// the monster library without cheating.

// Similarly, there is an in-game rewards for unlocking all 192 skills. A handful of those are associated to the
// monsters which cannot be acquired legitimately. The next in-game recognition is at 150 skills. This gives
// plenty of leeway when collecting skills, but there are still a surprisingly large number of skills that have
// prerequisites to unlock, which leads to additional grinding.

// The counter for unlocked skills is displayed in the skills library.

// Note that the game tracks whether you've encountered a monster or befriended (scouted/synthesized) it separately.
// An encountered monster shows where it can be found in the monster library, whereas a scouted/synthesized
// monster shows the monster's skills/traits in the library. The monster library proficiency achievements count
// unlocked entries, so either an encountered or a befriended monster will count.

// The monster library family achievements _only count befriended monsters_. The counter displayed in the monster
// library includes encountered monsters (not just befriended monsters). If you think you've unlocked all the
// monsters for a family, check their/ individual pages for skills/traits. If the skill/traits aren't present, then
// you haven't befriended them yet. I've itemized the expected monsters for each achievement in their respective pages.


function current_island() => byte(0x16f440)

island_infant_isle = 1
island_domus_isle = 2
island_xeroph_isle = 3
island_celeste_isle = 4
island_palaish_isle = 5
island_fert_isle = 6 // also Cell HQ
island_infern_isle = 7
island_uncharted = 8

islands = {
    island_infant_isle: "Infant Isle",
    island_domus_isle: "Domus Isle",
    island_xeroph_isle: "Xeroph Isle",
    island_celeste_isle: "Celeste Isle",
    island_palaish_isle: "Palaish Isle",
    island_fert_isle: "Fert Isle",
    island_infern_isle: "Infern Isle",
    island_uncharted: "an uncharted island",
}

function current_location() => byte(0x16f562)

location_infant_isle_outside = 0x00
location_infant_isle_cave = 0x16
location_infant_isle_scoutmaster_shuffles_tent = 0x34
location_infant_isle_scout_post = 0x40

location_domus_isle_main = 0x03
location_domus_isle_docks = 0x05
location_domus_isle_mess_hall = 0x38
location_domus_isle_scout_hq = 0x35
location_domus_isle_scout_hq_battlements = 0x04
location_domus_isle_scout_post = 0x40
location_domus_isle_private_house = 0x37
location_domus_isle_item_shop = 0x36
location_domus_isle_sewers = 0x1b
location_domus_isle_sewers2 = 0x1c
location_domus_isle_sewers_tent = 0x39
location_domus_isle_scout_hq_belfry_cutscene = 0x3b
location_domus_isle_secret_lab = 0x3a

location_xeroph_isle_scout_post = 0x00
location_xeroph_isle_outside = 0x02
location_xeroph_isle_hidden_cave = 0x1a
location_xeroph_isle_scouts_den = 0x41
location_xeroph_isle_shrine_entrance = 0x43
location_xeroph_isle_shrine_A = 0x17
location_xeroph_isle_shrine_B = 0x19
location_xeroph_isle_shrine_C = 0x18
location_xeroph_isle_shrine_temple = 0x44
location_xeroph_isle_shrine_temple2 = 0x45
location_xeroph_isle_battle_arena_tent = 0x34

location_palaish_isle_outside = 0x06
location_palaish_isle_scout_post = 0x40
location_palaish_isle_rummy_inside = 0x3e
location_palaish_isle_rummy_garden = 0x07
location_palaish_isle_rummy_garden2 = 0x08
location_palaish_isle_rummy_drawbridges = 0x09
location_palaish_isle_rummy_garden3 = 0x0a
location_palaish_isle_shrine_entrance = 0x43
location_palaish_isle_shrine_floor1 = 0x1d
location_palaish_isle_shrine_floor2 = 0x1e
location_palaish_isle_shrine_floor3 = 0x1f
location_palaish_isle_shrine_floor4 = 0x20
location_palaish_isle_shrine_temple = 0x44 // nexus chamber
location_palaish_isle_shrine_temple2 = 0x45 // nexus chamber
location_palaish_isle_metal_menagerie = 0x3f

location_infern_isle_south = 0x12
location_infern_isle_north = 0x13
location_infern_isle_in_house = 0x3c // all three houses
location_infern_isle_mysterious_door = 0x3d
location_infern_isle_south_darkened_sky = 0x14
location_infern_isle_mountain_outside = 0x15
location_infern_isle_mountain_lava = 0x2c
location_infern_isle_mountain_outside2 = 0x33
location_infern_isle_mountain_purple_cave = 0x2e
location_infern_isle_mountain_brain = 0x2d
location_infern_isle_mountain_throbbing = 0x2f
location_infern_isle_mountain_5f = 0x30
location_infern_isle_mountain_6f = 0x31
location_infern_isle_mountain_top = 0x32

location_celeste_isle_outside = 0x0b
location_celeste_isle_scout_post = 0x40
location_celeste_isle_scouts_den = 0x41
location_celeste_isle_shrine_entrance = 0x43
location_celeste_isle_shrine_1 = 0x21
location_celeste_isle_shrine_2 = 0x22
location_celeste_isle_shrine_3 = 0x23
location_celeste_isle_shrine_4 = 0x24
location_celeste_isle_shrine_5 = 0x25
location_celeste_isle_shrine_6 = 0x26
location_celeste_isle_shrine_roof = 0x0c
location_celeste_isle_north = 0x0d
location_celeste_isle_small_island = 0x0e
location_celeste_isle_shrine_temple = 0x44 // nexus chamber
location_celeste_isle_shrine_temple2 = 0x45 // nexus chamber

location_fert_isle_outside = 0x0f
location_fert_isle_scout_post = 0x40
location_fert_isle_scouts_den = 0x41
location_fert_isle_treehole = 0x2b
location_fert_isle_outside_upper = 0x11
location_fert_isle_shrine_entrance = 0x43
location_fert_isle_shrine_temple = 0x44 // nexus chamber
location_fert_isle_shrine_temple2 = 0x45 // nexus chamber
location_fert_isle_cell_hq_jetty = 0x05
location_fert_isle_cell_hq_jetty2 = 0x29
location_fert_isle_cell_hq = 0x27
location_fert_isle_cell_hq_office = 0x28
location_fert_isle_cell_hq_cells = 0x2a
location_fert_isle_cell_hq_outside = 0x10

location_uncharted_pirate_ship = 0x48
location_uncharted_outside_slime = 0x4d           // 1 brown chest
location_uncharted_outside_stump_chump = 0x4f     // 1 brown chest
location_uncharted_outside_she_slime = 0x53       // 0 brown chests + behemoth slime
location_uncharted_outside_drakee = 0x54          // 2 brown chests + great draky
location_uncharted_outside_argon_lizard = 0x55    // frou-frou

locations = {
    location_infant_isle_outside: "outside on",
    location_infant_isle_cave: "in a Cave on",
    location_infant_isle_scoutmaster_shuffles_tent: "in a Tent on",
    location_infant_isle_scout_post: "in the Scout Post on",

    location_domus_isle_main: "outside on",
    location_domus_isle_docks: "at the docks on",
    location_domus_isle_mess_hall: "in the mess hall on",
    location_domus_isle_scout_hq: "at scout HQ on",
    location_domus_isle_scout_hq_battlements: "outside on",
    location_domus_isle_private_house: "in a house on",
    location_domus_isle_item_shop: "in the item shop on",
    location_domus_isle_sewers: "in the sewers on",
    location_domus_isle_sewers2: "in the sewers on",
    location_domus_isle_sewers_tent: "in the sewers on",
    location_domus_isle_scout_hq_belfry_cutscene: "outside on",
    location_domus_isle_secret_lab: "in the sewers on",
    
    location_xeroph_isle_outside: "outside on",
    location_xeroph_isle_hidden_cave: "in a cave on",
    location_xeroph_isle_scouts_den: "at the scout's den on",
    location_xeroph_isle_shrine_entrance: "in a shrine on",
    location_xeroph_isle_shrine_A: "in a shrine on",
    location_xeroph_isle_shrine_B: "in a shrine on",
    location_xeroph_isle_shrine_C: "in a shrine on",
    location_xeroph_isle_shrine_temple: "in a shrine on",
    location_xeroph_isle_shrine_temple2: "in a shrine on",

    location_palaish_isle_outside: "outside on",
    location_palaish_isle_rummy_inside: "in Madame Rummy's castle on",
    location_palaish_isle_rummy_garden: "outside on",
    location_palaish_isle_rummy_garden2: "outside on",
    location_palaish_isle_rummy_drawbridges: "outside on",
    location_palaish_isle_rummy_garden3: "outside on",
    location_palaish_isle_shrine_floor1: "in a shrine on",
    location_palaish_isle_shrine_floor2: "in a shrine on",
    location_palaish_isle_shrine_floor3: "in a shrine on",
    location_palaish_isle_shrine_floor4: "in a shrine on",
    location_palaish_isle_metal_menagerie: "in the metal menagerie on",

    location_infern_isle_south: "outside on",
    location_infern_isle_north: "outside on",
    location_infern_isle_in_house: "in a house on",
    location_infern_isle_mysterious_door: "in a building on",
    location_infern_isle_south_darkened_sky: "outside on",
    location_infern_isle_mountain_outside: "outside on",
    location_infern_isle_mountain_lava: "in the volcano on",
    location_infern_isle_mountain_outside2: "outside on",
    location_infern_isle_mountain_purple_cave: "in the volcano on",
    location_infern_isle_mountain_brain: "in the volcano on",
    location_infern_isle_mountain_throbbing: "in the volcano on",
    location_infern_isle_mountain_5f: "in the volcano on",
    location_infern_isle_mountain_6f: "in the volcano on",
    location_infern_isle_mountain_top: "outside on",

    location_celeste_isle_outside: "outside on",
    location_celeste_isle_shrine_1: "in a shrine on",
    location_celeste_isle_shrine_2: "in a shrine on",
    location_celeste_isle_shrine_3: "in a shrine on",
    location_celeste_isle_shrine_4: "in a shrine on",
    location_celeste_isle_shrine_5: "in a shrine on",
    location_celeste_isle_shrine_6: "in a shrine on",
    location_celeste_isle_shrine_roof: "outside on",
    location_celeste_isle_north: "outside on",
    location_celeste_isle_small_island: "outside on",
    
    location_fert_isle_outside: "outside on",
    location_fert_isle_treehole: "in a tree on",
    location_fert_isle_outside_upper: "outside on",
    //location_fert_isle_cell_hq_jetty: "outside on",
    location_fert_isle_cell_hq_jetty2: "at the docks on",
    location_fert_isle_cell_hq_outside: "outside on",
    location_fert_isle_cell_hq: "in CELL HQ on",
    location_fert_isle_cell_hq_office: "in CELL HQ on",
    location_fert_isle_cell_hq_cells: "in CELL HQ on",
    
    location_uncharted_pirate_ship: "were ambushed on the way to",
    location_uncharted_outside_slime: "outside on",
    location_uncharted_outside_stump_chump: "outside on",
    location_uncharted_outside_she_slime: "outside on",
    location_uncharted_outside_drakee: "outside on",
    location_uncharted_outside_argon_lizard: "outside on",
}

skill_frizz_bang = 0x01
skill_frizz_bang2 = 0x02
skill_frizz_bang3 = 0x03
skill_frizz_woosh = 0x04
skill_frizz_woosh2 = 0x05
skill_frizz_woosh3 = 0x06
skill_frizz_zap = 0x07
skill_frizz_zap2 = 0x08
skill_frizz_zap3 = 0x09
skill_frizz_zam = 0x0a
skill_frizz_zam2 = 0x0b
skill_frizz_zam3 = 0x0c
skill_bang_woosh = 0x0d
skill_bang_woosh2 = 0x0e
skill_bang_woosh3 = 0x0f
skill_bang_crack = 0x10
skill_bang_crack2 = 0x11
skill_bang_crack3 = 0x12
skill_bang_zap = 0x13
skill_bang_zap2 = 0x14
skill_bang_zap3 = 0x15
skill_bang_zam = 0x16
skill_bang_zam2 = 0x17
skill_bang_zam3 = 0x18
skill_woosh_crack = 0x19
skill_woosh_crack2 = 0x1a
skill_woosh_crack3 = 0x1b
skill_woosh_zap = 0x1c
skill_woosh_zap2 = 0x1d
skill_woosh_zap3 = 0x1e
skill_woosh_zam = 0x1f
skill_woosh_zam2 = 0x20
skill_woosh_zam3 = 0x21
skill_crack_zap = 0x22
skill_crack_zap2 = 0x23
skill_crack_zap3 = 0x24
skill_crack_zam = 0x25
skill_crack_zam2 = 0x26
skill_crack_zam3 = 0x27
skill_fire = 0x28
skill_fire2 = 0x29
skill_fire3 = 0x2a
skill_ice = 0x2b
skill_ice2 = 0x2c
skill_ice3 = 0x2d
skill_breath = 0x2e
skill_breath2 = 0x2f
skill_breath3 = 0x30
skill_firewind_slashes = 0x31
skill_thunderwind_slashes = 0x32
skill_iceplosion_slashes = 0x33
skill_fire_fighter = 0x35
skill_boom_boxer = 0x36
skill_wind_blower = 0x37
skill_icemeister = 0x38
skill_white_knight = 0x39
skill_dark_knight = 0x3a
skill_healer = 0x3b
skill_cura_all = 0x3c
skill_cleanser = 0x3d
skill_champion = 0x3e
skill_defender = 0x3f
skill_speedster = 0x40
skill_mage_aid = 0x41
skill_fortifier = 0x42
skill_enfeebler = 0x43
skill_saboteur = 0x44
skill_antimagic = 0x45
skill_antimagic2 = 0x46
skill_antidragon = 0x47
skill_antimetal = 0x48
skill_bolsterer = 0x49
skill_barricade = 0x4a
skill_seal = 0x4b
skill_hypnotist = 0x4c
skill_toxifier = 0x4d
skill_fear_monger = 0x4e
skill_bad_breath = 0x4f
skill_diminisher = 0x50
skill_guerrilla = 0x51
skill_assassin = 0x52
skill_huntsman = 0x53
skill_bounty_hunter = 0x54
skill_crusader = 0x55
skill_cursader = 0x56
skill_muspell = 0x57
skill_niflheim = 0x58
skill_dancer = 0x59
skill_bombardier = 0x5a
skill_toughie = 0x5b
skill_berserker = 0x5c
skill_martyr = 0x5d
skill_reaper = 0x5e
skill_nightmare = 0x5f
skill_cold_sleep = 0x60
skill_cleric = 0x61
skill_aquapthcary = 0x62
skill_all_rounder = 0x63
skill_mime = 0x64
skill_trickster = 0x65
skill_slimer = 0x66
skill_naturalist = 0x67
skill_graveheart = 0x68
skill_diabolist = 0x69
skill_dragon_lore = 0x6a
skill_bird_brain = 0x6b
skill_green_finger = 0x6c
skill_hive_mind = 0x6d
skill_materialist = 0x6e
skill_wulfspade = 0x6f
skill_wulfspade2 = 0x70
skill_hawkhart = 0x71
skill_hawkhart2 = 0x72
skill_diamagon = 0x73
skill_diamagon2 = 0x74
skill_cluboon = 0x75
skill_cluboon2 = 0x76
skill_dragonlord = 0x77
skill_dragovianlord = 0x78
skill_leopold = 0x79
skill_dhoulmagus = 0x7a
skill_rhapthorne = 0x7b
skill_rhapthorne2 = 0x7c
skill_estark = 0x7d
skill_nimzo = 0x7e
skill_mortamor = 0x7f
skill_captain_crow = 0x80
skill_uber_dark_dyn = 0x81
skill_uber_bliss_blizzard = 0x82
skill_uber_mage = 0x83
skill_uber_breath = 0x84
skill_uber_knight = 0x85
skill_uber_healer = 0x86
skill_uber_helpful = 0x87
skill_uber_charming = 0x88
skill_wulfspade3 = 0x89
skill_diamagon3 = 0x8a
skill_hawkhart3 = 0x8b
skill_cluboon3 = 0x8c
skill_dr_snapped = 0x8d
skill_atk_boost = 0x8e
skill_atk_boost2 = 0x8f
skill_atk_boost3 = 0x90
skill_def_boost = 0x91
skill_def_boost2 = 0x92
skill_def_boost3 = 0x93
skill_agi_boost = 0x94
skill_agi_boost2 = 0x95
skill_agi_boost3 = 0x96
skill_wis_boost = 0x97
skill_wis_boost2 = 0x98
skill_wis_boost3 = 0x99
skill_frizz_ward = 0x9a
skill_bang_ward = 0x9b
skill_woosh_ward = 0x9c
skill_crack_ward = 0x9d
skill_zap_ward = 0x9e
skill_zam_ward = 0x9f
skill_water_ward = 0xa0
skill_thunder_ward = 0xa1
skill_fire_ward = 0xa2
skill_earth_ward = 0xa3
skill_fire_breath_ward = 0xa4
skill_ice_breath_ward = 0xa5
skill_whack_ward = 0xa6
skill_dazzle_ward = 0xa7
skill_poison_ward = 0xa8
skill_drain_magic_ward = 0xa9
skill_antimagic_ward = 0xaa
skill_gobstop_ward = 0xab
skill_ban_dance_wrd = 0xac
skill_confusion_ward = 0xad
skill_inact_ward = 0xae
skill_paral_ward = 0xaf
skill_sleep_ward = 0xb0
skill_uber_hp_boost = 0xb1
skill_uber_mp_boost = 0xb2
skill_uber_atk_boost = 0xb3
skill_uber_def_boost = 0xb4
skill_uber_agi_boost = 0xb5
skill_uber_wis_boost = 0xb6
skill_uber_heat_ward = 0xb7
skill_uber_cold_ward = 0xb8
skill_uber_wdbl_ward = 0xb9
skill_uber_drkli_ward = 0xba
// 0xbb-0xc0 are classes (warrior, mage, priest, martial artist, sage, thief)
// 0xc1-?? are monster names (slimer, slimer, slimo, mr. slim, bubber, ...)

uber_skills = [
    skill_uber_dark_dyn,
    skill_uber_bliss_blizzard,
    skill_uber_mage,
    skill_uber_breath,
    skill_uber_knight,
    skill_uber_healer,
    skill_uber_helpful,
    skill_uber_charming,
    skill_uber_hp_boost,
    skill_uber_mp_boost,
    skill_uber_atk_boost,
    skill_uber_def_boost,
    skill_uber_agi_boost,
    skill_uber_wis_boost,
    skill_uber_heat_ward,
    skill_uber_cold_ward,
    skill_uber_wdbl_ward,
    skill_uber_drkli_ward,
]

rank3_skills = [
    skill_frizz_bang3,
    skill_frizz_woosh3,
    skill_frizz_zap3,
    skill_frizz_zam3,
    skill_bang_woosh3,
    skill_bang_crack3,
    skill_bang_zap3,
    skill_bang_zam3,
    skill_woosh_crack3,
    skill_woosh_zap3,
    skill_woosh_zam3,
    skill_crack_zap3,
    skill_crack_zam3,
    skill_fire3,
    skill_ice3,
    skill_breath3,
    skill_atk_boost3,
    skill_def_boost3,
    skill_agi_boost3,
    skill_wis_boost3,
]

monster_slime = 0x01
monster_bubble_slime = 0x02
monster_shell_slime = 0x03
monster_healslime = 0x04
monster_drake_slime = 0x05
monster_metal_slime = 0x06
monster_slime_knight = 0x07
monster_wild_slime = 0x08
monster_liquid_metal_slime = 0x09
monster_angel_slime = 0x0a
monster_king_slime = 0x0b
monster_king_bubble_slime = 0x0c
monster_metal_king_slime = 0x0d
monster_grandpa_slime = 0x0e
monster_gem_slime = 0x0f
monster_trode = 0x10
monster_she_slime = 0x11
monster_snail_slime = 0x12
monster_cure_slime = 0x13
monster_behemoth_slime = 0x14
monster_beshemoth_slime = 0x15
monster_dragon_slime = 0x16
monster_metal_slime_knight = 0x17
monster_kaiser_slime = 0x18
monster_dark_slime_knight = 0x19
monster_dark_slime = 0x1a
monster_king_cureslime = 0x1b
monster_darkonium_slime = 0x1c
monster_komodo = 0x31
monster_argon_lizard = 0x33
monster_green_dragon = 0x35
monster_jargon = 0x37
monster_metal_dragon = 0x38
monster_hacksaurus = 0x3a
monster_red_dragon = 0x3b
monster_dragurn = 0x3c
monster_great_argon_lizard = 0x3d
monster_mechan_o_wyrm = 0x3f
monster_great_dragon = 0x40
monster_drakulard = 0x41
monster_dragonlord = 0x42
monster_dragovian_lord = 0x44
monster_skelegon = 0x46
monster_dragonthorn = 0x47
monster_nardragon = 0x48
monster_frou_fry = 0x49
monster_sea_dragon = 0x4a
monster_seasaur = 0x4b
monster_snapdragon = 0x4c
monster_drakularge = 0x4d
monster_tyrantosaurus = 0x4e
monster_black_dragon = 0x4f
monster_frou_frou = 0x50
monster_abyss_diver = 0x51
monster_megalodon = 0x52
monster_alabast_dragon = 0x53
monster_great_dragon2 = 0x54
monster_platypunk = 0x60
monster_great_sabrecub = 0x61
monster_scissor_beatle = 0x62
monster_stark_raven = 0x63
monster_jailcat = 0x64
monster_khalamari_kid = 0x65
monster_capsichum = 0x66
monster_hell_hornet = 0x67
monster_chimaera = 0x68
monster_hades_condor = 0x69
monster_frogface = 0x6a
monster_crabid = 0x6b
monster_bullfinch = 0x6c
monster_giant_moth = 0x6e
monster_treeface = 0x6f
monster_yabby = 0x70
monster_gorerilla = 0x71
monster_scorpion = 0x72
monster_heligator = 0x73
monster_great_sabrecat = 0x74
monster_garuda = 0x75
monster_king_squid = 0x79
monster_khalamari = 0x7a
monster_leopold = 0x7b
monster_empyrea = 0x7c
monster_spiked_hare = 0x7d
monster_wild_boarfish = 0x7f
monster_eveel = 0x80
monster_riptide = 0x81
monster_beetlebully = 0x82
monster_mischievous_mole = 0x90
monster_bodkin_archer = 0x91
monster_hammerhood = 0x92
monster_satyr = 0x93
monster_jumping_jackal = 0x94
monster_chainine = 0x96
monster_puppeteer = 0x97
monster_beetleboy = 0x98
monster_orc = 0x99
monster_headhunter = 0x9a
monster_fallen_priest = 0x9b
monster_fencing_fox = 0x9c
monster_pan_piper = 0x9d
monster_gargoyle = 0x9f
monster_weartiger = 0xa0
monster_gigantes = 0xa2
monster_cockateer = 0xa3
monster_notso_macho = 0xa5
monster_boss_troll = 0xa7
monster_atlas = 0xa8
monster_don_mole = 0xa9
monster_robbin_hood = 0xaa
monster_dhoulmagus = 0xab
monster_rhapthorne = 0xac
monster_rhapthorne2 = 0xad
monster_ace_of_spades = 0xae
monster_brownie = 0xaf
monster_orc2 = 0xb0
monster_ace_of_spades2 = 0xb1
monster_bag_o_laughs = 0xc0
monster_wax_murderer = 0xc1
monster_firespirit = 0xc2
monster_mecha_mynah = 0xc3
monster_mud_mannequin = 0xc4
monster_dingaling = 0xc5
monster_goodybag = 0xc6
monster_shadow = 0xc7
monster_cannibox = 0xc8
monster_spitnik = 0xc9
monster_hunter_mech = 0xca
monster_rockbomb = 0xcb
monster_mum = 0xcc
monster_golem = 0xcd
monster_boh = 0xce
monster_dancing_flame = 0xcf
monster_jum = 0xd0
monster_frostburn = 0xd1
monster_boe = 0xd2
monster_king_kelp = 0xd3
monster_mimic = 0xd4
monster_diemon = 0xd5
monster_gold_golem = 0xd7
monster_living_statue = 0xd8
monster_trap_box = 0xd9
monster_killing_machine = 0xda
monster_mumboh_jumboe = 0xdb
monster_ruin = 0xdc
monster_psaro = 0xdd
monster_estark = 0xde
monster_anchorman = 0xdf
monster_golem2 = 0xe0
monster_estark2 = 0xe1
monster_dracky = 0xf0
monster_lips = 0xf1
monster_winky = 0xf2
monster_imp = 0xf3
monster_lump_wizard = 0xf4
monster_night_emporer = 0xf5
monster_dancing_devil = 0xf6
monster_merman = 0xf8
monster_lesser_demon = 0xf9
monster_gryphon = 0xfa
monster_octavian_sentry = 0xfc
monster_silvapithecus = 0xfd
monster_archdemon = 0xff
monster_moosifer = 0x100
monster_buffalogre = 0x101
monster_jamirus = 0x102
monster_mohawker = 0x103
monster_pazuzu = 0x104
monster_gracos = 0x105
monster_belial = 0x106
monster_night_clubber = 0x107
monster_malroth = 0x108
monster_zoma = 0x109
monster_nimzo = 0x10a
monster_mortamor = 0x10b
monster_orgodemir = 0x10c
monster_see_urchin = 0x10d
monster_dessert_demon = 0x10e
monster_lethal_armour = 0x10f
monster_great_dracky = 0x110
monster_wrecktor = 0x111
monster_demon_at_arms = 0x112
monster_moosifer2 = 0x113
monster_buffalogre2 = 0x114
monster_mohawker2 = 0x115
monster_gracos2 = 0x116
monster_belial2 = 0x117
monster_demon_at_arms2 = 0x118
monster_ghost = 0x121
monster_stump_chump = 0x122
monster_muddy_hand = 0x124
monster_funghoul = 0x126
monster_walking_corpse = 0x128
monster_demonrider = 0x129
monster_skeleton = 0x12a
monster_restless_armour = 0x12b
monster_grim_rider = 0x12c
monster_mummy_boy = 0x12d
monster_soulspawn = 0x12e
monster_wailin_weed = 0x12f
monster_phantom_fencer = 0x130
monster_roseguardin = 0x131
monster_bone_baron = 0x132
monster_dullahan = 0x133
monster_tortured_soul = 0x134
monster_captain_crow = 0x135
monster_dr_snapped = 0x136
monster_skipper = 0x137
monster_flyguy = 0x138
monster_hellhound = 0x139
monster_skeleton_soldier = 0x13a
monster_phantom_swordsman = 0x13b
monster_wight_king = 0x13c
monster_captain_crow2 = 0x13d
monster_dr_snapped2 = 0x13e
monster_wulfspade = 0x150
monster_hawkhart = 0x151
monster_cluboon = 0x152
monster_diamagon = 0x153
monster_wulfspade_ace = 0x154
monster_hawkhart_ace = 0x155
monster_cluboon_ace = 0x156
monster_diamagon_ace = 0x157
monster_wildcard = 0x158

monster_names = {
    monster_slime: "Slime",
    monster_bubble_slime: "Bubble Slime",
    monster_shell_slime: "Shell Slime",
    monster_healslime: "Healslime",
    monster_drake_slime: "Drake Slime",
    monster_metal_slime: "Metal Slime",
    monster_slime_knight: "Slime Knight",
    monster_wild_slime: "Wild Slime",
    monster_liquid_metal_slime: "Liquid Metal Slime",
    monster_angel_slime: "Angel Slime",
    monster_king_slime: "King Slime",
    monster_king_bubble_slime: "King Bubble Slime",
    monster_metal_king_slime: "Metal King Slime",
    monster_grandpa_slime: "Grandpa Slime",
    monster_gem_slime: "Gem Slime",
    monster_trode: "Trode",
    monster_she_slime: "She Slime",
    monster_snail_slime: "Snail Slime",
    monster_cure_slime: "Cureslime",
    monster_behemoth_slime: "Behemoth Slime",
    monster_beshemoth_slime: "Beshemoth Slime",
    monster_dragon_slime: "Dragon Slime",
    monster_metal_slime_knight: "Metal Slime Knight",
    monster_kaiser_slime: "Kaiser Slime",
    monster_dark_slime_knight: "Dark Slime Knight",
    monster_dark_slime: "Dark Slime",
    monster_king_cureslime: "King Cureslime",
    monster_darkonium_slime: "Darkonium Slime",
    monster_komodo: "Komodo",
    monster_argon_lizard: "Argon Lizard",
    monster_green_dragon: "Green Dragon",
    monster_jargon: "Jargon",
    monster_metal_dragon: "Metal Dragon",
    monster_hacksaurus: "Hackasuarus",
    monster_red_dragon: "Red Dragon",
    monster_dragurn: "Dragurn",
    monster_great_argon_lizard: "Great Argon Lizard",
    monster_mechan_o_wyrm: "Mechan-o-wyrm",
    monster_great_dragon: "Great Dragon",
    monster_drakulard: "Drakulard",
    monster_dragonlord: "Dragonlord",
    monster_dragovian_lord: "Dragovian Lord",
    monster_skelegon: "Skelegon",
    monster_dragonthorn: "Dragonthorn",
    monster_nardragon: "Nardragon",
    monster_frou_fry: "Frou-fry",
    monster_sea_dragon: "Sea Dragon",
    monster_seasaur: "Seasaur",
    monster_snapdragon: "Snapdragon",
    monster_drakularge: "Drakularge",
    monster_tyrantosaurus: "Tyrantosaurus",
    monster_black_dragon: "Black Dragon",
    monster_frou_frou: "Frou-frou",
    monster_abyss_diver: "Abyss Diver",
    monster_megalodon: "Megalodon",
    monster_alabast_dragon: "Alabast Dragon",
    monster_great_dragon2: "Great Dragon2",
    monster_platypunk: "Platypunk",
    monster_great_sabrecub: "Great Sabrecub",
    monster_scissor_beatle: "Scissor Beatle",
    monster_stark_raven: "Stark Raven",
    monster_jailcat: "Jailcat",
    monster_khalamari_kid: "Khalamari Kid",
    monster_capsichum: "Capsichum",
    monster_hell_hornet: "Hell Hornet",
    monster_chimaera: "Chimaera",
    monster_hades_condor: "Hades Condor",
    monster_frogface: "Frogface",
    monster_crabid: "Crabid",
    monster_bullfinch: "Bullfinch",
    monster_giant_moth: "Giant Moth",
    monster_treeface: "Treeface",
    monster_yabby: "Yabby",
    monster_gorerilla: "Gorerilla",
    monster_scorpion: "Scorpion",
    monster_heligator: "Heligator",
    monster_great_sabrecat: "Great Sabrecat",
    monster_garuda: "Garuda",
    monster_king_squid: "King Squid",
    monster_khalamari: "Khalamari",
    monster_leopold: "Leopold",
    monster_empyrea: "Empyrea",
    monster_spiked_hare: "Spiked Hare",
    monster_wild_boarfish: "Wild Boarfish",
    monster_eveel: "Eveel",
    monster_riptide: "Riptide",
    monster_beetlebully: "Beetlebully",
    monster_mischievous_mole: "Mischievous Mole",
    monster_bodkin_archer: "Bodkin Archer",
    monster_hammerhood: "Hammerhood",
    monster_satyr: "Satyr",
    monster_jumping_jackal: "Jumping Jackal",
    monster_chainine: "Chainine",
    monster_puppeteer: "Puppeteer",
    monster_beetleboy: "Beetleboy",
    monster_orc: "Orc",
    monster_headhunter: "Headhunter",
    monster_fallen_priest: "Fallen Priest",
    monster_fencing_fox: "Fencing Fox",
    monster_pan_piper: "Pan Piper",
    monster_gargoyle: "Gargoyle",
    monster_weartiger: "Weretiger",
    monster_gigantes: "Gigantes",
    monster_cockateer: "Cockateer",
    monster_notso_macho: "Notso Macho",
    monster_boss_troll: "Boss Troll",
    monster_atlas: "Atlas",
    monster_don_mole: "Don Mole",
    monster_robbin_hood: "Robbin' Hood",
    monster_dhoulmagus: "Dhoulmagus",
    monster_rhapthorne: "Rhapthorne",
    monster_rhapthorne2: "Rhapthorne2",
    monster_ace_of_spades: "Ace of Spades",
    monster_brownie: "Brownie",
    monster_orc2: "Orc2",
    monster_ace_of_spades2: "Ace of Spades2",
    monster_bag_o_laughs: "Bag o' Laughs",
    monster_wax_murderer: "Wax Murderer",
    monster_firespirit: "Firespirit",
    monster_mecha_mynah: "Mecha-mynah",
    monster_mud_mannequin: "Mud Mannequin",
    monster_dingaling: "Dingaling",
    monster_goodybag: "Goodybag",
    monster_shadow: "Shadow",
    monster_cannibox: "Cannibox",
    monster_spitnik: "Spitnik",
    monster_hunter_mech: "Hunter Mech",
    monster_rockbomb: "Rockbomb",
    monster_mum: "Mum",
    monster_golem: "Golem",
    monster_boh: "Boh",
    monster_dancing_flame: "Dancing Flame",
    monster_jum: "Jum",
    monster_frostburn: "Frostburn",
    monster_boe: "Boe",
    monster_king_kelp: "King Kelp",
    monster_mimic: "Mimic",
    monster_diemon: "Diemon",
    monster_gold_golem: "Gold Golem",
    monster_living_statue: "Living Statue",
    monster_trap_box: "Trap Box",
    monster_killing_machine: "Killing Machine",
    monster_mumboh_jumboe: "Mumboh-Jumboe",
    monster_ruin: "Ruin",
    monster_psaro: "Psaro",
    monster_estark: "Estark",
    monster_anchorman: "Anchorman",
    monster_golem2: "Golem2",
    monster_estark2: "Estark2",
    monster_dracky: "Dracky",
    monster_lips: "Lips",
    monster_winky: "Winky",
    monster_imp: "Imp",
    monster_lump_wizard: "Lump Wizard",
    monster_night_emporer: "Night Emporer",
    monster_dancing_devil: "Dancing Devil",
    monster_merman: "Merman",
    monster_lesser_demon: "Lesser Demon",
    monster_gryphon: "Gryphon",
    monster_octavian_sentry: "Octavian Sentry",
    monster_silvapithecus: "Silvapithecus",
    monster_archdemon: "Archdemon",
    monster_moosifer: "Moosifer",
    monster_buffalogre: "Buffalogre",
    monster_jamirus: "Jamirus",
    monster_mohawker: "Mohawker",
    monster_pazuzu: "Pazuzu",
    monster_gracos: "Gracos",
    monster_belial: "Belial",
    monster_night_clubber: "Clubber",
    monster_malroth: "Malroth",
    monster_zoma: "Zoma",
    monster_nimzo: "Nimzo",
    monster_mortamor: "Mortamor",
    monster_orgodemir: "Orgodemir",
    monster_see_urchin: "See Urchin",
    monster_dessert_demon: "Dessert Demon",
    monster_lethal_armour: "Lethal Armor",
    monster_great_dracky: "Great Dracky",
    monster_wrecktor: "Wrecktor",
    monster_demon_at_arms: "Demon at Arms",
    monster_moosifer2: "Moosifer2",
    monster_buffalogre2: "Buffalogre2",
    monster_mohawker2: "Mohawker",
    monster_gracos2: "Gracos2",
    monster_belial2: "Belial2",
    monster_demon_at_arms2: "Demon at Arms2",
    monster_ghost: "Ghost",
    monster_stump_chump: "Stump Chump",
    monster_muddy_hand: "Muddy Hand",
    monster_funghoul: "Funghoul",
    monster_walking_corpse: "Walking Corpse",
    monster_demonrider: "Demonrider",
    monster_skeleton: "Skeleton",
    monster_restless_armour: "Restless Armour",
    monster_grim_rider: "Grim Rider",
    monster_mummy_boy: "Mummy Boy",
    monster_soulspawn: "Soulspawn",
    monster_wailin_weed: "Wailin' Weed",
    monster_phantom_fencer: "Phantom Fencer",
    monster_roseguardin: "Roseguardin",
    monster_bone_baron: "Bone Baron",
    monster_dullahan: "Dullahan",
    monster_tortured_soul: "Tortured Soul",
    monster_captain_crow: "Captain Crow",
    monster_dr_snapped: "Dr. Snapped",
    monster_skipper: "Skipper",
    monster_flyguy: "Flyguy",
    monster_hellhound: "Hellhound",
    monster_skeleton_soldier: "Skeleton Soldier",
    monster_phantom_swordsman: "Phantom Swordsman",
    monster_wight_king: "Wight King",
    monster_captain_crow2: "Captain Crow2",
    monster_dr_snapped2: "Dr. Snapped2",
    monster_wulfspade: "Wulfspade",
    monster_hawkhart: "Hawkhart",
    monster_cluboon: "Cluboon",
    monster_diamagon: "Diamagon",
    monster_wulfspade_ace: "Wulfspade ace",
    monster_hawkhart_ace: "Hawkhart ace",
    monster_cluboon_ace: "Cluboon ace",
    monster_diamagon_ace: "Diamagon ace",
    monster_wildcard: "Wildcard",             
}

rank_x_monsters = [
    monster_dragonlord,
    monster_ruin,
    monster_zoma,
    monster_psaro,
    monster_leopold,               // cannot be bred
    monster_gem_slime,
    monster_estark,
    monster_mortamor,
    monster_orgodemir,
    monster_empyrea,               // cannot be bred
    monster_rhapthorne,
    monster_rhapthorne2,
    monster_dr_snapped,
    monster_dragovian_lord,
    monster_trode,                 // cannot be bred
]

rank_s_monsters = [
    monster_alabast_dragon,
    monster_atlas,
    monster_beetlebully,
    monster_black_dragon,
    monster_captain_crow,          // cannot be bred
    monster_darkonium_slime,
    monster_dhoulmagus,
    monster_don_mole,
    monster_drakulard,
    monster_dullahan,
    monster_grandpa_slime,
    monster_khalamari,
    monster_killing_machine,
    monster_king_squid,
    monster_malroth,
    monster_metal_king_slime,
    monster_mumboh_jumboe,
    monster_night_clubber,
    monster_nimzo,
    monster_robbin_hood,          // cannot be bred
    monster_trap_box,
    monster_wight_king,
]

unsynthesizable_monsters = [
    monster_trode,                 // X: complete monster and skills library
    monster_leopold,               // X: 192 entries in skills library
    monster_empyrea,               // X: 210 entries in monster library
    monster_robbin_hood,           // S: complete monster and skills library
    monster_captain_crow,          // S: pirate ship
]

family_slime = [
    monster_slime,
    monster_bubble_slime,
    monster_shell_slime,
    monster_healslime,
    monster_she_slime,
    monster_drake_slime,
    monster_snail_slime,
    monster_wild_slime,
    monster_slime_knight,
    monster_metal_slime,
    monster_metal_slime_knight,
    monster_angel_slime,
    monster_behemoth_slime,
    monster_beshemoth_slime,
    monster_dragon_slime,
    monster_king_slime,
    monster_cure_slime,
    monster_liquid_metal_slime,    // 100 entries in monster library
    monster_dark_slime,
    monster_dark_slime_knight,
    monster_king_cureslime,
    monster_king_bubble_slime,
    monster_kaiser_slime,          // A: (Metal Slime + Metal Slime) + (Liquid Metal Slime + Metal Slime Knight)
                                   //    (King Slime + Metal King Slime) + (Liquid Metal Slime + Metal Slime Knight)
                                   //    150 entries in skills library
    monster_metal_king_slime,      // S: (Liquid Metal Slime x4)
                                   //    100 entries in skills library
    monster_darkonium_slime,       // S: (Beshemoth Slime + Beshemoth Slime) + (King CureSlime + Metal King Slime)
    monster_grandpa_slime,         // S: (King Slime + Metal King Slime) + (King Bubble Slime + Metal Kaiser Slime)
                                   //    200 entries in monster library
    monster_gem_slime,             // X: (Grandpa Slime + Grandpa Slime) + (Gold Golem + Gold Golem)
    monster_trode,                 // X: promotional
]

family_dragon = [
    monster_komodo,
    monster_frou_fry,
    monster_dragonthorn,
    monster_argon_lizard,
    monster_nardragon,
    monster_snapdragon,
    monster_jargon,
    monster_green_dragon,
    monster_skelegon,
    monster_dragurn,
    monster_seasaur,
    monster_red_dragon,
    monster_hacksaurus,
    monster_sea_dragon,
    monster_tyrantosaurus,
    monster_metal_dragon,
    monster_great_argon_lizard,
    monster_abyss_diver,
    monster_megalodon,
    monster_frou_frou,
    monster_drakularge,
    monster_great_dragon,          // A: [Dragon] + [Rank A]
    monster_mechan_o_wyrm,         // A: Metal Dragon + Great Dragon
    monster_black_dragon,          // S: Great Dragon + Bone Baron
    monster_drakulard,             // S: Drakularge + (Atlas/Pazuzu)
    monster_alabast_dragon,        // S: Mechan-o-wyrm + Drakulard
    monster_dragonlord,            // X: (Alabast Dragon + Gem Slime) + (Alabast Dragon + Captain Crow)
    monster_dragovian_lord,        // X: Rhapthorne2 + Dragonlord
]

family_nature = [
    monster_capsichum,
    monster_wild_boarfish,
    monster_scorpion,
    monster_crabid,
    monster_chimaera,
    monster_spiked_hare,
    monster_khalamari_kid,
    monster_jailcat,
    monster_great_sabrecub,
    monster_hell_hornet,
    monster_eveel,
    monster_bullfinch,
    monster_hades_condor,
    monster_great_sabrecat,
    monster_treeface,
    monster_scissor_beatle,
    monster_beetleboy,
    monster_giant_moth,
    monster_gorerilla,
    monster_heligator,             // A: King Squid + Gracos
    monster_yabby,                 // A: Wailin' Weed + (Jamirus/Hell Hornet)
    monster_riptide,               // A: Juming Jackal + Heligator
    monster_garuda,                // A: Hades Condor + Jamirus
    monster_beetlebully,           // S: Beetleboy + Metal King Slime
    monster_king_squid,            // S: Khalamari Kid + Night Clubber / Yabby + Gracos
    monster_khalamari,             // S: (Kahalamari Kid + Khalamari Kid) + (King Squid + King Squid)
    monster_leopold,               // X: 192 entries in skills library
    monster_empyrea,               // X: 210 entries in monster library
]

family_beast = [
    monster_platypunk,
    monster_mischievous_mole,
    monster_satyr,
    monster_hammerhood,
    monster_fencing_fox,
    monster_chainine,
    monster_orc,
    monster_pan_piper,
    monster_jumping_jackal,
    monster_night_emporer,
    monster_weartiger,
    monster_brownie,
    monster_bodkin_archer,
    monster_gargoyle,
    monster_merman,
    monster_diemon,
    monster_notso_macho,
    monster_cockateer,
    monster_silvapithecus,
    monster_gigantes,              // A: Silvapithecus + Drakularge
    monster_moosifer,              // A: Buffalogre + (Pan Piper/Satyr)
    monster_mohawker,              // A: Buffalogre + (Wild Slime/Great Sabrecat/Bone Baron)
    monster_buffalogre,            // A: Gigantes/Soulspawn
    monster_pazuzu,                // A: Silvapithecus + (Jamirus/Gigantes/Golem/King Squid)
    monster_atlas,                 // S: Gigantes + (Moosifer/Garuda/Boss Troll)
    monster_don_mole,              // S: (Mischevious Mole + Mischievous Mole) + (Night Clubber + Night Clubber)
    monster_nimzo,                 // S: (Drakulard + Malroth)
    monster_dhoulmagus,            // S: (Alabast Dragon/Dragonlord) + (Psaro/Estark)
    monster_rhapthorne,            // X: Dhoulmagus + Nimzo
    monster_rhapthorne2,           // X: Rhapthorne + (Zoma/Orgodemir)
]

family_material = [
    monster_bag_o_laughs,
    monster_shadow,
    monster_dancing_flame,
    monster_frostburn,
    monster_spitnik,
    monster_goodybag,
    monster_king_kelp,
    monster_wax_murderer,
    monster_cannibox,
    monster_rockbomb,
    monster_anchorman,
    monster_gold_golem,
    monster_mecha_mynah,
    monster_mud_mannequin,
    monster_dingaling,
    monster_hunter_mech,
    monster_puppeteer,
    monster_jum,
    monster_mimic,
    monster_golem,                 // A: Rockbomb + Gigantes
    monster_living_statue,         // A: Golem + (Buffalogre/Metal Slime Knight)
    monster_boe,                   // A: (Jum/Mum/Boh) + [Nature]
    monster_mum,                   // A: (Jum/Boe/Boh) + [Nature]
    monster_boh,                   // A: (Jum/Mum/Boe) + [Nature]
    monster_trap_box,              // S: (Mimic + Mimic) + (Cannibox + Metal Kaiser Slime)
                                   //    Single spawn in Tartarus
    monster_killing_machine,       // S: Hunter Mech + (Mechan-o-wyrm/Phantom Swordsman)
    monster_mumboh_jumboe,         // S: (Mum + Boh) + (Jum + Boe)
    monster_ruin,                  // X: Mumboh-jumboe + (Gold Golem/Living Statue)
    monster_psaro,                 // X: Roseguardin + Ruin
    monster_estark,                // X: Psaro + Beetlebully
]

family_demon = [
    monster_dracky,
    monster_lips,
    monster_winky,
    monster_see_urchin,
    monster_imp,
    monster_lump_wizard,
    monster_frogface,
    monster_dessert_demon,
    monster_dancing_devil,
    monster_headhunter,
    monster_lesser_demon,
    monster_gryphon,
    monster_great_dracky,
    monster_octavian_sentry,
    monster_wrecktor,
    monster_lethal_armour,
    monster_fallen_priest,
    monster_archdemon,
    monster_boss_troll,
    monster_jamirus,               // A: (Golem/King Cureslime) + [Demon] / Gigantes + Dracky
    monster_gracos,                // A: Archdemon + (Merman/Octavian Sentry)
    monster_demon_at_arms,         // A: Jamirus + (Living Statue/Dingaling) / Roseguardin + [Demon]
    monster_belial,                // A: Archdemon + (Gold Golem/Dessert Demon/Great Dragon/Atlas)
    monster_robbin_hood,           // S: complete monster and skills library
    monster_night_clubber,         // S: Boss Troll + (Frou-frou/Pazuzu/Drakularge)
    monster_malroth,               // S: Demon-at-arms + (Living Statue/Buffalogre)
    monster_zoma,                  // X: Malroth + (Wight King/Dullahan/Bone Baron)
    monster_mortamor,              // X: Nimzo + Estark
]

family_undead = [
    monster_ghost,
    monster_firespirit,
    monster_stump_chump,
    monster_funghoul,
    monster_muddy_hand,
    monster_demonrider,
    monster_mummy_boy,
    monster_skipper,
    monster_phantom_fencer,
    monster_flyguy,
    monster_skeleton,
    monster_walking_corpse,
    monster_restless_armour,
    monster_hellhound,
    monster_phantom_swordsman,
    monster_skeleton_soldier,
    monster_grim_rider,
    monster_soulspawn,
    monster_stark_raven,
    monster_wailin_weed,           // A: Fert Isle
    monster_tortured_soul,         // A: Living Statue + Stark Raven / Mum + Skeleton / [Zombie] + [Rank A]
    monster_roseguardin,           // A: Lethal Armor + (Bone Baron/Riptide)
    monster_bone_baron,            // A: Grim Rider + (Mohawker/Dark Slime Knight)
    monster_dullahan,              // S: Bone Baron + (Phantom Fencer/Tortured Soul)
    monster_wight_king,            // S: Tortured Soul + (King Slime/King Bubble Slime)
    monster_captain_crow,          // S: pirate ship
    monster_orgodemir,             // X: Mortamor + (Alabast Dragon/Dragonlord)
    monster_dr_snapped,            // X: (Rhapthorne2 + Orgodemir) + (Captain Crow + Darkonium Slime)
]

family_incarni = [
    monster_wulfspade,
    monster_hawkhart,
    monster_cluboon,
    monster_diamagon,
    monster_wulfspade_ace,         // Incarnus + Rank A or higher nature
    monster_hawkhart_ace,          // Incarnus + Rank A or higher demon
    monster_cluboon_ace,           // Incarnus + Rank A or higher material
    monster_diamagon_ace,          // Incarnus + Rank A or higher beast
    monster_ace_of_spades,         // Wulfspade ace + Leopold
    monster_wildcard,              // Wulfspade ace + Empyrea
]

// struct monster 0x8f850 (404 bytes each)
// {
//     char name[12];   // + 0x00
//     word type;       // + 0x0C
//     byte rank;       // + 0x0E (1=F,2=E,3=D,4=C,5=B,6=A,7=S)
//     byte charge;     // + 0x10 (0=plus,1=minus,2=both,3=none)
//     byte generation; // + 0x14 (+1, +2, etc)
//     ...
//     byte level;      // + 0x72
//     word hp;         // + 0x74
//     word mp;         // + 0x76
//     word attack;     // + 0x78
//     word defense;    // + 0x7A
//     word agility;    // + 0x7C
//     word wisdom;     // + 0x7E
//     word cur_hp;     // + 0x80
//     word max_hp;     // + 0x82
//     word cur_mp;     // + 0x84
//     word max_mp;     // + 0x86
//     word cur_att     // + 0x88
//     word cur_def;    // + 0x8A
//     word cur_agi;    // + 0x8C
//     word cur_wis;    // + 0x8E
//     dword xp;        // + 0x90
//     byte tactics     // + 0x94
//     ...
//     byte skill1      // + 0xA0
//     byte skill2      // + 0xA1
//     ...
//     byte skill1_pts  // + 0xA3
//     byte skill2_pts; // + 0xA4
//     ...
//     word unalloc_pts;// + 0xAA
//     ...
//     struct ancestor  // + 0x104 (24 bytes each)
//     {
//       word type;     //    + 0x00
//       char name[8];  //    + 0x02
//       ..
//       char owner[8]; //    + 0x0D
//       ..
//     } ancestors[6]   // [+parent,-parent,++grand,+-grand,-+grand,--grand] (grands only have type info)
// }
function monster_base(index) => 0x8f850 + 0x194 * index
function monster_type(index) => word(monster_base(index) + 0x0C)
function monster_level(index) => byte(monster_base(index) + 0x72)
function has_monster(index) => byte(monster_base(index)) != 0xFF
function party_size() => byte(0x099f30)
function party_monster_index(index) => byte(0x099f32 + index)

// $099f2c is a bit field for the timer (only updated every other frame)
//   11111111 11111100 00000000 00000000 hours
//   00000000 00000011 11110000 00000000 minutes
//   00000000 00000000 00001111 11000000 seconds
//   00000000 00000000 00000000 00111111 frames
function total_playtime_hh() => word(0x099f2e) / 4
function total_playtime_mm() => high4(0x099f2d) + bit0(0x099f2e) * 16 + bit1(0x099f2e) * 32
function trigger_in_game() => dword(0x099f2c) != 0 && // whole timer is non-zero (at least one frame into game)
                              byte(0x16f564) != 0     // prevents false triggers while loading

function trigger_location(isle, subregion) => trigger_in_game() && 
                                              current_island() == isle &&
                                             __ornext(current_location() == subregion || 
                                              current_location() == 0) // sublocation not loaded when using quick save

function monsters_scouted() => dword(0x09a054)
function trainers_battled() => dword(0x09a05c)
function battles_won() => dword(0x09a060)
function monsters_synthesized() => dword(0x09a064)

function main_quest_state() => byte(0x09a2ec)

function game_state() => byte(0x16b770)
state_in_battle = 0
state_exploring = 1
state_synthesizing = 2

minutes = {}
for i in range(0, 9)
    minutes[i] = "0" + i
for i in range(10, 59)
    minutes[i] = "" + i

rich_presence_conditional_display(party_size() == 3, "Lv{0} {1}, Lv{2} {3}, and Lv{4} {5} {6} {7} | {8}h{9}",
    rich_presence_value("Level", monster_level(party_monster_index(0))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(0)), monster_names),
    rich_presence_value("Level", monster_level(party_monster_index(1))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(1)), monster_names),
    rich_presence_value("Level", monster_level(party_monster_index(2))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(2)), monster_names),
    rich_presence_lookup("Location", current_location(), locations, fallback = "?"),
    rich_presence_lookup("Island", current_island(), islands),
    rich_presence_value("Hour", total_playtime_hh()),
    rich_presence_lookup("Minute", total_playtime_mm(), minutes)
)

rich_presence_conditional_display(party_size() == 2, "Lv{0} {1} and Lv{2} {3} {4} {5} | {6}h{7}",
    rich_presence_value("Level", monster_level(party_monster_index(0))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(0)), monster_names),
    rich_presence_value("Level", monster_level(party_monster_index(1))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(1)), monster_names),
    rich_presence_lookup("Location", current_location(), locations, fallback = "?"),
    rich_presence_lookup("Island", current_island(), islands),
    rich_presence_value("Hour", total_playtime_hh()),
    rich_presence_lookup("Minute", total_playtime_mm(), minutes)
)

rich_presence_conditional_display(!trigger_in_game(), "Titles")

rich_presence_conditional_display(party_size() == 1, "Lv{0} {1} {2} {3} | {4}h{5}",
    rich_presence_value("Level", monster_level(party_monster_index(0))),
    rich_presence_lookup("Monster", monster_type(party_monster_index(0)), monster_names),
    rich_presence_lookup("Location", current_location(), locations, fallback = "?"),
    rich_presence_lookup("Island", current_island(), islands),
    rich_presence_value("Hour", total_playtime_hh()),
    rich_presence_lookup("Minute", total_playtime_mm(), minutes)
)

// until the timer starts, the subregion is 0, which causes the display to be "No monsters outside on Fert Isle"
rich_presence_conditional_display(dword(0x099f2c) < 10 * 64, "No monsters in CELL HQ on Fert Isle | 0h00")

rich_presence_display("No monsters {0} {1} | {2}h{3}",
    rich_presence_lookup("Location", current_location(), locations, fallback = "?"),
    rich_presence_lookup("Island", current_island(), islands),
    rich_presence_value("Hour", total_playtime_hh()),
    rich_presence_lookup("Minute", total_playtime_mm(), minutes)
)

// ============================================================

// [[New Game]]
// * After speaking with Warden Trump, turn around and leave.
// * Go down the steps, watch a quick cutscene, then step out through the southern door.
// * Talk to the man near the jetski and say you're ready to leave.
// * Select your starter monster.
// * When you arrive at Domus Isle, go west a bit and talk to the woman.
// * She'll move out of your way. Take the jetski to Infant Isle

// ===== Infant Isle =====
// [ ] Dracky              Lv 1 In cave
// [ ] Lips                Lv 1 In cave
// [ ] Mischievous Mole    Lv 1 Outside, north side, day
// [ ] Platypunk           Lv 1 Outside, north side, day
// [ ] Slime               Lv 1 Outside, east side, day
// [ ] Stump Chump         Lv 2 Outside, west side, night
// [ ] Ghost               Lv 3 Outside, north side, night
// [ ] Shadow              Lv 3 In cave, near chest
// [ ] Winky               Lv 4 Outside, west side, night
// [ ] Gigantes            Lv15 [Rare] Outside, east side, near fire pit, day
// [ ] Hades Condor        Lv16 
// [ ] King Slime          Lv20 [Rare] Outside, near Scout's Stone

// * Enter the scout post to update your respawn point
// * Immediately leave and start fighting stuff. Just kill slimes until your first monster is level 2.
// * Then attempt to scout them until you get one.
//   Notes on scouting:
//   - It's not any easier to scout a monster that appears by itself vs. with a group.
//   - It's not any easier to scout a monster after you've damaged it.
//   - You don't get any experience for a fight where you capture a monster, even if you killed its groupmates.
//   - If you upset the monster, it's tension will increase and you can't try to scout again that fight.
//   - The chance of scouting a monster is determined by how much damage you would have done to it.
//     It's easier to capture monsters you're much more stronger than. You can crit when scouting.
// * Follow the beach left, then go up the hill. Follow the path around the east side of the island.
// * As you cross the bridges on the north side of the island, you'll get to start fighting 
//   Mischievous Moles and Platypunks. Recruit one and level up to 3.
// * Go back to the scout post if you need to rest.
// * Work your way around to the west side of the island and enter the tent.
// * [ ] Complete Scout Proficiency test #1: 5g -> Any scouted monster -> Medical Herb
// * [ ] Complete Scout Proficiency test #2: 10g -> Platypunk or Mischievous Mole -> Antimagic Powder
// * Behind the tent to the southeast is a ladder. Go down it and open the chest.
//   - brown chests have minor items and refill any time you leave an island
// * This ladder provides a shortcut between the Scoutmaster's tent and the scout post. Go rest if you need.
// * When you reach level 4, head up the ramp northeast of the Scoutmaster's tent and follow it to the cave.
// * Inside the cave, you can scout Dracky, Lips, and Shadow. Shadow and Dracky are decent upgrades.
//   - At level 5, your monsters will get 5 skill points. Slime can learn Heal, but it takes 6.
// * If you follow the path around the south side of the cave, you'll eventually reach a chest with a 
//   Cypress Staff. Make sure to equip it on one of your monsters.
// * When you reach the top of the island, work your way around to the south side of the temple.

// [[Quicksave A | Vuuleen (Lv5) - 1:10]]
// [[Quicksave A | Jamiras (Lv6) - 0:49]]

achievement("The Pledge", "Take the Scout's Pledge", 5,
    trigger = trigger_location(island_infant_isle, location_infant_isle_outside) &&
              main_quest_state() == 5 && prev(main_quest_state()) == 4
)

// * Head south from the temple and slide down the ramp.
// * Climb down two ladders and return to the scout post to rest.
// * Take the jetski back to Domus Isle.
// * Talk to the man at the base of the stairs to attend the opening ceremony.
// * Immediately in front of you will be a ramp, go up it and into the red door.
// * Walk straight forward and talk to the woman behind the desk.
// * Leave the way you came in. Go down the ramp and enter the scout post.
// * In the back room, meet Slimon (blue haired man near the wall).
// * Leave the scout post and walk around the building to the south.
// * Inside and to the left you'll meet Igor Folds. Talk to him, then leave.
// * Go to the far west end of the island and take the northern jetski to Xeroph Isle.

// ===== Xeroph Isle =====
// [ ] Funghoul            Lv 3 [Rare?] Outside, northeast at the molehills, day
// [ ] Komodo              Lv 3 Outside, pit, day
// [ ] Crabid              Lv 4 Outside, south side, night
// [ ] Demonrider          Lv 4
// [ ] Healslime           Lv 4 Outside, south side, day
// [ ] Spitnik             Lv 4 [Rare?] Outside, northeast at the molehills, day
// [ ] Chimaera            Lv 5 Outside, pit, night
// [ ] Dancing Flame       Lv 5 Outside, pit, day
// [ ] Firespirit          Lv 5 Outside, south side, night
// [ ] Frostburn           Lv 5 Outside, pit, night
// [ ] Scorpion            Lv 5 Outside, south side, day
// [ ] Skelegon            Lv 5 [Rare] Outside, pit, day
// [ ] Winky               Lv 5 Cave
// [ ] Muddy Hand          Lv 6 Cave
// [ ] Hammerhood          Lv 5 Temple
// [ ] Bag o' Laughs       Lv 6 Temple
// [ ] Imp                 Lv 7 Temple
// [ ] Mummy Boy           Lv 9 Temple

// * Enter the scout post and go back into the den.
// * Talk to Solitaire, then possibly meet Chuck (the zombie).
// * Leave and start fighting stuff. Your first order of business is to scout a Healslime.
//   Make sure to change its tactics to Focus on Healing.
// * Spend some time levelling up until you can kill scorpions without taking much damage (level 7 or so).
// * Head down into the pit. Spend some more time levelling, and scouting the new monsters.
// * There's a blue chest on a little ledge on the southwest part of the pit. Open it for your first Darkonium Crystal.
// * At around level 11, jump into the quicksand and you'll see Incarnus fighting an Orc. Save him!
//   !! Orc - 235 HP
// * Go into the scout's den and Incarnus will join your team.
// * When you're ready, jump into the quicksand again.
// * At the far end of the cave, follow the rim west and down to a red chest containing a Seed of Wisdom.
// * Return to the pinnacle of the path, and step out onto the north side of the island.
// * Head west and lower the bridge.
// * Then head all the way east for a brown chest and to lower another bridge.
// * Enter the temple and run forward into the first room.
// * Approach the monsters and defeat the three imps.
// * Go through the door, up the ramp, and into the next door.
// * Go straight into the next door.
// * Go up the stairs twice and into the final door. Fight the Mummy boys.
// * Go up two flights of stairs for a brown chest.
// * Go up one more set of stairs and around for a red chest containing a Yggdrasil leaf and a blue chest with
//   a Darkonium Crystal.

// [[Quicksave B | Vuuleen (Lv13) - 4:14]]
// [[Quicksave B | Jamiras (Lv10) - 3:33]]

// * Go through the door, then through the next door.
//   !! Golem - 450 HP

achievement("The Rite", "Complete the shrine on Xeroph Isle", 10,
    trigger = trigger_location(island_xeroph_isle, location_xeroph_isle_shrine_temple2) &&
              main_quest_state() == 11 && prev(main_quest_state()) == 10
)

// * Read the 'How to Zoom' book to learn the Zoom spell
// * Take the jetski from the northern pier to Palaish Isle

// ===== Palaish Isle =====
// [ ] Goodybag            Lv 8 West garden, top of pillars, day
// [ ] Spiked Hare         Lv 8 Garden, day
// [ ] Capsichum           Lv 9 Garden, day
// [ ] Chainine            Lv 9 Garden, night
// [ ] Khalamari Kid       Lv 9 Western pool, day
// [ ] See Urchin          Lv 9 Big pool, day
// [ ] Shell Slime         Lv10 Eastern beach, day
// [ ] Dragonthorn         Lv11 [Rare] Southeast tunnel, day
// [ ] Angel Slime         Lv12 West garden, top of pillars, night
// [ ] King Kelp           Lv12 [Rare]
// [ ] Seasaur             Lv15 [Rare]

// * Enter the scout post to update your respawn location.
// * Climb up the long ramp and enter the building.
// * Go upstairs and talk to Madame Rummy.
// * Go downstairs and talk to the man in front of the ornate door.
// * Defeat 9 slimes in 130 seconds to complete the first challenge (three groups of three).
//   - The timer doesn't stop while you're in battle, but you can finish the last battle after the timer expires
//     as long as you start before the timer expires.

// [[Quicksave C | Vuuleen (Lv16) - 4:55]]
// [[Quicksave C | Jamiras (Lv11) - 3:47]]

// * Talk to the man again to do the second stage of the challenge (15 slimes in 220 seconds).
//   - Note that you'll have to go through the gate to find enough slimes.

achievement("The Gardens", "Open up all of Palaish Isle's gardens", 5,
    trigger = trigger_location(island_palaish_isle, location_palaish_isle_rummy_inside) &&
              byte(0x09a307) == 2 && prev(byte(0x09a307)) == 1
)

// * Go up the stairs, then down the hallway to the right. Step outside into the garden.
// * Collect the brown box, then head down the ramp through the gate.
//   - If you need a rest, you can cast Zoom to quickly return to the scout post.
// * Take a quick right and collect the two brown chests on top of the pillars - watch for Angel Slime and Goodybag spawns.
// * Head east to another brown chest on a pillar, then go behind it and down another ramp.
// * Go through the large gate. Knock over bridges until you get to the outer edge of the pool.
// * Go down the western ramp, then the secondary ramp.
// * Head right (west) and knock over another bridge. You can use this to quickly get back and forth from the scout post.
//   - The pool right next to this bridge hosts the rare spawns for King Kelp (night) and Seasaur (day).
// * Head back to the larger pool and lower the middle bridge to collect a Drakonium from the blue chest.
// * Continue east past the pool and around to the back of the island. Interact with the sign to open the path
//   between Palaish Isle and Domus Isle.
// * Go back to the shortcut bridge, but go east through the tunnel.
// * Before you go down the ramp, turn around and head into a hidden tunnel. There's a blue chest at the end with
//   another piece of Darkonium.
// * Scout a Capsichum, level it to 10, and merge it with your Healer to make a Frou-fry.
//   - Be sure to look at the polarity of your Healer, you'll need a different polarity on the Capsichum.
//   - Inherit the Healer skill so you can continue to heal. Also inherit the Icemeister skill.
//   - Make sure to update the resulting monster's equipment and tactics.
//   - Also consider synthesizing anything else you can with monsters not currently in your party.
//     Leave them as reserves, or in storage. You only want to be levelling up one monster at a time.
//     Try to get at least one Rank E monster.
//   - Monsters inheriting a skill that the parent had points in will get half the points for that skill.
//   - Monsters inherit 1/4 of unspent points from their parents.
//   - Most spell lines can be upgraded if they have enough points to be maxxed out (either individually or when
//     combining two parents). Upgradable spell lines max out at 50 points for the first rank, and 75 for the second.
//     - A monster must be level 25 for 50 allocatable points (21 for 49 points + skill seed).
//     - A mosnter must be level 35 for 75 allocatable points (30 for 73 points + two skill seeds).
//     - And remember, points can be inherited from parents.
//     - If the parents' total points for a skill would max it out, you can still learn the advanced skill.
// * Spend some time getting any newly synthesized monsters in your active party to level 10 or higher.
//   - Now's a good time to scout a bunch of junk monsters for synthesizing. I usually try scouting anything
//     that I encounter that's by itself.
//   - Remember you can Zoom back to the scout post whenever you need to heal.
// * Deposit all of your money into the bank. You'll probably going to die at least once in the shrine.

// * Follow the path around to the northeast, where you'll find the entrance to the shrine.

// ===== Palaish Shrine =====
// [ ] See Urchin          Lv 9 3rd floor N
// [ ] Lump Wizard         Lv11 4th floor W
// [ ] Bubble Slime        Lv12 2nd floor SW
// [ ] Fencing Fox         Lv12 4th floor S
// [ ] Jail Cat            Lv12 3rd floor W
// [ ] Skipper             Lv12 2nd floor N
// [ ] Wax Murderer        Lv12 3rd floor W
// [ ] Cannibox            Lv13 4th floor SE
// [ ] Gold Golem          Lv17 [Rare] 2nd floor SE

// * Go forward all the way and interact with the blue crystal to go to the second floor.
// * There's two brown chests in the southwest room.
// * If you follow the northwest hallway around, you'll find a red chest containing special medicine.
// * Halfway down the hallway, there's a balcony. Interact with the green crystal to go to the third floor.
// * Follow the hallway around to the center room.
// * There's a dragon there (265HP) guarding a snakeskin whip and phoenix sceptre. (Make sure to equip them)
//   - Once defeated it will never return.
//   - You can try to scout it, but unless you're greatly overlevelled, the chances are miniscule.
//   - Don't worry, we can still synthesize one later.
//   - This mini-boss will likely drain your monsters. Don't be afraid to use the red crystal to return to
//     the first floor, exit, and zoom back to the scout post to rest.
// * At the southwest corner of the main room is a chamber with stairs up to another balcony.
// * Go up the stairs, then west along the south wall to find another brown chest.
// * Return to the top of the stairs and head north. Interact with the yellow crystal to go to the fourth floor.
// * Follow the hallway to the center room again.
// * In the southweast corner is a staircase. 
//   - There's a room east of there with a couple of Canniboxes and two red chests. The red chests there contain
//     a strong medicine and a seed of strength. I don't feel like they're worth the effort at this point.
// * Go up the stairs and follow the path to two more chests. The blue chest has darkonium, and the red chest
//   has a Yggdrasil leaf.

// [[Quicksave D | Vuuleen (Lv19) - 10:10]]
// [[Quicksave D | Jamiras (Lv14) - 8:14]]

// * Go through the door, then through the next door.
//   !! Moosifer - 812 HP
//   - Put your attackers on No Mercy, your healer on Focus on Healing, and use items to help heal.
//   - You can also use Give Orders to specify exact commands.
//   - When he psyches himself up, have everyone defend.
//   - Note that your actions always occur before any monsters (yours or enemies), so make sure to keep everyone's
//     health high enough to absorb at least 65 damage (his typical attack).

achievement("No Normal Monster", "Complete the shrine on Palaish Isle", 5,
    trigger = trigger_location(island_palaish_isle, location_palaish_isle_shrine_temple2) &&
              byte(0x09a2ee) == 7 && prev(byte(0x09a2ee)) == 6
)

// * After the fight, you'll be back at the entrance and fully healed.
// * Read the 'Joy of Evac' book to learn the Evac skill.
// * Head back to the scout post and take the jetski back to Xeroph Isle.
// * Make sure you have scouted a Komodo (bottom of pit, day), then take the other jetski to Domus Isle.
//   If you've used the Komodo in a synthesis, you'll need to scout another.
// * Go to the scout's post den and meet Ooligan.
// * Then stop at Monster Storage. Load your Komodo, and a synthesized Rank E monster into your
//   substitutes (or active roster). You can tell it's synthesized because it will be Rank E +1.
// * Then stop at the synthesis booth and create some monsters.
//   - Make sure at least one is a Rank E monster.
// * Proceed to the northern docks and take the left jet ski to Infant Isle.
// * Wander around at night and scout a Ghost, Winkie, or Stump Chump. Put it in your substitutes.
//   - At this time, you should have a Komodo, synthesized Rank E monster, and the recently scouted night monster
//     in your substitutes. Head to Scoutmaster Wiggle's tent, and swap them out for your main team.
//     Talk to him four times to complete the next four steps of the Scout Proficiency test.
// * [ ] Complete Scout Proficiency test #3: 25g -> Ghost, Winky or Stump Chump -> Magic Elixir
// * [ ] Complete Scout Proficiency test #4: 50g -> dragon family (Komodo) -> Battle Whip
// * [ ] Complete Scout Proficiency test #5: 100g -> Rank E monster (Imp, Mummy boy) -> Seed of Magic
// * [ ] Complete Scout Proficiency test #6: 180g -> Synthesized monster -> Martial Artist's Scroll
// * Swap your main party back, then stop at the scout post and update your substitutes.
// * Scout four slimes (two pairs of polarities) and send them to storage.
// * Take the jetski back to Domus Isle
// * Continue to the western piers and take the southern jet ski to Infern Isle.

// ===== Infern Isle =====
// [ ] Metal Slime Knight  Lv12 [Rare]
// [ ] Skeleton            Lv13
// [ ] Walking Corpse      Lv13
// [ ] Dark Slime Knight   Lv14 [Rare] 
// [ ] Flyguy              Lv14

// * Talk to the signpost - it'll heal you.
// * Head west and into the cul-de-sac. Follow the path up to the top.
// * Keeping to the north side of the hill, go east across the bridge.
// * Look for a Metal Slime Knight (or Dark Slime Knight at night). If you see it, try to scout it.
//   You'll probably fail, but it's a good monster for this point of the game.
// * Head all the way south and down to the pier and take the jetski to Celeste Isle.

// ===== Celeste Isle =====
// [ ] Metal Slime         Lv 1 [Rare]
// [ ] Great Sabrecub      Lv13 west shrine, day
// [ ] Great Sabrecat      Lv15
// [ ] Hunter Mech         Lv15 near shrine, day
// [ ] Mecha-Mynah         Lv15 ruins
// [ ] Headhunter          Lv16 ruins, day
// [ ] Nardragon           Lv16 near ruins, night
// [ ] Lesser Demon        Lv17 shrine west, 1F
// [ ] Wrecktor            Lv?? shrine west, 2F
// [ ] Hacksaurus          Lv?? shrine east, 1F 
// [ ] Night Emporer       Lv17 north, night
// [ ] Restless Armor      Lv17 west ruins, night
// [ ] Dancing Devil       Lv18 north, day
// [ ] Gargoyle            Lv18 north, day
// [ ] Skeleton Soldier    Lv?? shrine west, 3F
// [ ] Notso Macho         Lv?? shrine west, 2F

// * Step into the scoutpost. You'll meet Lizzy in the den.
// * Go out and head south up the hill.
// * There are six brown chests in the ruins.
//   - outside, northeast corner, first floor.
//   - inside, southwest corner, first floor.
//   - top of southwest stairs (second floor).
//   - just at the top of the eastern stairs (second floor).
//   - northeast balcony of second floor.
//   - third floor (takes stairs from southwest section of second floor).
// * Go around the northern side of the ruins and down into the valley.
// * Where it comes out on the western side of the island, there's a blue chest inside the second ruins.
// * Go up the nearby ramp and around counterclockwise for a red chest containing elfin elixir.
// * Metal slimes occassionally appear here (in groups with other monsters). This is a good place to
//   grind a few levels until fighting is no longer challenging. Remember to Zoom back to heal when needed. 
//   - Don't worry about scouting a metal slime, they're not that great and you want the exp more at this point.
// * Make sure to do some synthesizing when you return to the scout post.
//   - You should be ready to merge your slimes into slime +1s.
//     Make sure they have opposing polarities. If not, reload and try again.
//   - You'll also want to make a rank C material (i.e. Mud Mannequin) and a Jumping Jackal.

// * From the western ruins, continue up the smaller ramp and left a bit to enter the shrine.
// * Loop around to the right and push the red button.
// * Loop back towards the entrance and go into the inner ring through the newly opened door.
// * Go up the stairs in the center of the map.
// * Go west (right from the top of the stairs) and open the red chest for a seed of wisdom.
// * Return to the stairs and head north. Interact with the red mirror.
// * Head south, then turn right to find a red chest with an elfin elixir in it.
// * Go back to the east and down the stairs.
// * Go south, then loop around the west side for a brown chest.
// * Loop back south and enter the second door on the left.
// * Swing around to the left and go up the stairs.
// * Take the seed of agility from the red chest.
// * Turn right and follow the stairs up.
// * At the top of the stairs, go out through the door.
// * Go across and enter the red door.
// * Go forward and throw the switch.
// * Go back to the door and down the stairs.
// * Take the yggdrasil dew from the red chest.
// * Go down the nearby stairs.
// * Follow the path around the corner, watching for a brown chest.
// * In the next room, stand on the floorplate.
//   - This permanently opens this gate, so you can go rest and come back and continue from here.
//   - When you return to the shrine, you'll have to activate the red button again.
// * Loop all the way up the left side for a brown chest.
// * Head back to the entrance and enter the first room on the east.

// [[Quicksave E | Vuuleen (Lv19) - 16:56]]
// [[Quicksave E | Jamiras (Lv19) - 14:25]]

// * Grab the Sun Tablet.
// * Turn around and follow the white dots on the ground back to the large pink door.
// * Go through and place the tablet on the left pillar.

achievement("Daylight Delivery", "Place the sun tablet", 5,
    trigger = trigger_location(island_celeste_isle, location_celeste_isle_shrine_roof) &&
              bit2(0x8d512) == 1 && prev(bit2(0x8d512)) == 0
)

// * Head back to Infern Isle. Proceed back to Domus Isle.
// * Go straight through town and take the elevator up to Scout HQ.
// * Talk to the woman outside of the commissioner's office.
// * Do battle with the commissioner (it doesn't matter how much you win).
// * Return to the commissioner's office and talk to him again.
// * Go talk to Igor Folds for an antidote herb.
// * Go back towards the dock, but turn left and head into the sewer.
// * Go a bit north (left), then across the bridge.
// * Go into the tent and talk to the man to get a Dancin' Devil
// * Next to the tent is a red chest with 8g in it.
// * Head north, then east into the next section of the sewers.
// * Go down the ramp and west. There's a gold nugget in the red chest.
// * Across a nearby bridge is another red chest, with a seed of defence in it.
// * Leave the sewers and head to the northern jetties.
// * Take the left jetski to Infant Isle.
// * Meet Bob A. Job in the scout den, then head to the west side of the island and cross the bridge.
// * Take the darkonium from the blue chest.
// * Continue west and down the ladder for a brown chest.
// * Go down the next ladder and take the jetski back to Celeste Isle.
// * Go through the gap between the hills and up the ramp.
// * Get a jumbo insulade from the red chest.
// * Go across the rope bridge and enter the blue door.
// * Loop around to the right and push the blue button.
// * Work your way around to the east side, the through the middle of the floor and down the stairs.
// * South into the hall, and all the way up the west side for a brown chest.
// * Go all the way around the outer hall and into the northeastern door.
// * Talk to the blue mirror.
// * Go south a bit for a brown chest tucked behind the wall.
// * Go up the stairs twice and out through the pink door.
// * Enter the blue door, then go east to a level. Pull it.
// * Follow the glowing lights down the stairs. Step on the glowing floor panel.
// * Continue to follow the glowing lights to the Moon Tablet. Take it.
// * Follow the glowing lights south and around the outside of the level.
// * Continue to follow the glowing lights up two sets of stairs and then go out the blue door.

// [[Quicksave F | Vuuleen (Lv20) - 18:46]]
// [[Quicksave F | Jamiras (Lv20) - 16:04]]

// * Place the Lunar Tablet in the right pedestal.

achievement("Moonlight Messenger", "Place the lunar tablet", 5,
    trigger = trigger_location(island_celeste_isle , location_celeste_isle_shrine_roof) &&
              bit3(0x8d512) == 1 && prev(bit3(0x8d512)) == 0
)

// * Take the yggrasil leaf from the red chest, and the darkonium from the blue chest.
// * Enter the door, and proceed to the nexus chamber.
//   !! Great Dragon - 1156 HP
//   - Put your attackers on No Mercy, your healer on Focus on Healing, and use items to help heal.
//   - You can also use Give Orders to specify exact commands.
//   - When he psyches himself up, have everyone defend.
//   - Note that your actions always occur before any monsters (yours or enemies), so make sure to keep everyone's
//     health high enough to absorb at least 70 damage (his typical attack).

achievement("New-Found Strength", "Complete the shrine on Celeste Isle", 5,
    trigger = trigger_location(island_celeste_isle, location_celeste_isle_shrine_temple2) &&
              byte(0x09a2ee) == 7 && prev(byte(0x09a2ee)) == 6
)

// * Use the 'Whistling for Dummies' book to learn how to whistle.
//   - Whistle summons a monster battle to you without having to run around.
// * Leave the temple and talk to the mirror.
// * Turn around and go through the moon door.
// * Work your way down the hill and across the beach to the jetty.
// * Take the left jetski to Fert Isle.

// ===== Fert Isle =====
// [ ] Metal Slime         Lv 1 [Rare]
// [ ] Hades Condor        Lv16
// [ ] Bodkin Archer       Lv17 near scout post, day
// [ ] Gorerilla           Lv17 near shrine, day
// [ ] Mud Mannequin       Lv17 near the river, ground, night
// [ ] Argon Lizard        Lv18 northeast, ground, day
// [ ] Beetleboy           Lv18 middle level, day
// [ ] Dingaling           Lv18 middle level, night
// [ ] Frogface            Lv18 near the river, ground, day
// [ ] Giant Moth          Lv18 northeast, ground, night
// [ ] Hacksaurus          Lv18
// [ ] Hellhound           Lv18 near scout post, night
// [ ] Hell Hornet         Lv18 [Rare]
// [ ] Scissor Beetle      Lv18 middle level, day
// [ ] Wild Slime          Lv18 [Rare]
// [ ] Lump Wizard         Lv19
// [ ] Wailin' Weed        Lv20 near scout post, night
// [ ] Treeface            Lv21
// [ ] Great Argon Lizard  Lv22 [Rare]
// [ ] Jargon              Lv22 middle level, night

// * Loop around the eastern side of the island.
// * There's a brown chest on a ledge in the northeast.
// * Follow the river through the middle of the island to the southwest shore.
// * Scout a Frogface, then return to Celeste Isle and scout a Hunter Mech

// * In the scout post, do some synthesizing.
//   - You should be ready to make your King Slime now (merge the two +1 slimes you made earlier)
//   - Do not use the Jumping Jackal in any synthesis yet.
// * Take the right jetski (at the northern pier) back to Infant Isle and go to the scout post.
//   - Put the Hunter Mech, King Slime, and Jumping Jackal in your reserves.
// * Go to the scoutmaster's tent (with at least 1600g).
// * [ ] Complete Scout Proficiency test #7: 300g -> Rank C material (Hunter Mech)
// * [ ] Complete Scout Proficiency test #8: 500g -> Jumping Jackal (Frogface + Chainine) -> Plus Sceptre
// * [ ] Complete Scout Proficiency test #9: 800g -> King Slime (fuse four slimes) -> Positive Puller
// * Return to Celeste Isle and do some levelling.
// * When the fights there start to become less difficult, return to Fert Isle.

// * Continue up to the hole in the tree.
// * Follow the left branch until you leave the tree.
// * Go forward, then around to the right. Climb the ladder for a brown chest.
// * Back down the ladder, then north across the wooden bridge.
// * At the top of that ladder is a red chest containing a seed of life.
// * Back down the ladder and across the other wooden bridge, then around to the next ladder going up.
// * At the top, find a blue chest containing another darkonium.
// * Go down the ladder, then down another ladder and across another wooden bridge.
// * Continue to the southwest and approach the ladder going down.
//   - Some people will move the boxes creating a shortcut back to the scout post.

// [[Quicksave G | Vuuleen (Lv25) - 24:53]]
// [[Quicksave G | Jamiras (Lv21) - 23:51]]

// * Go across the western bridge and around the hill to the top.
// * Cross another bridge and open the two chests for a darkonium and special medicine.
// * Proceed through the three doors, andinto the nexus chamber.
//   !! Demon-at-arms - 1532 HP
//   - Same as other fights - two attackers on Show No Mercy, healer on Focus on Healing.
//   - He hits twice per round, but only for ~45 each time.
//   - Use healing items to keep everyone over 100 HP.

achievement("The Form I Have Yearned to Attain", "Complete the shrine on Fert Isle", 5,
    trigger = trigger_location(island_fert_isle, location_fert_isle_shrine_temple2) &&
              byte(0x09a2ee) == 7 && prev(byte(0x09a2ee)) == 6
)

// * Read 'The Art of Vanishing' book.
// * Take the jetski back to Celeste Isle, then Infant Isle.
// * Run around to the other pier and take the jetski back to Domus Isle.
// * Swing by Dr. Fold's house and talk to him for a magic elixir.
// * Go to scout HQ and leave via the eastern door of the upper level.
// * Approach the next door and ring the bell.
// * After the announcements, step back outside and Solitaire will confront you again.
// * Go back to Dr. Fold's house and he'll give you an elfin elixir.
// * Head down towards the western piers and Black Jacques will give you a letter.
// * Go into the sewers and talk to the girl in the middle tent to get a Mum.

// * The next step is to win the Scout Challenge. Aim for everyone having at least 200 HP and someone with Midheal, 
//   FullHeal, or Multiheal.
// * At this point, you can do the final Madame Rummy challenge to gain access to the metal menagerie.
//   - Use Vanish and the metal slimes won't run away
// * After winning the Scout Challenge, the monsters available on Infern Isle change. Make sure to capture a couple
//   Fly Guys, Skeletons, Metal Slime Knights, and Dark Slime Knights.
// * While you're levelling up, consider the following syntheses:
//   - You'll want to get a start on these, but we won't do the final synthesis for a while.
//     * https://gamefaqs.gamespot.com/boards/933956-dragon-quest-monsters-joker/42253938
//     - Uber Healer = Healer (100) + Mage Aid (100) + Bolsterer (100) 
//     - Healslime + Khalamari Kid => Snail Slime with Mage Aid
//       - Put all points in Healer. We need to max it and Mage Aid
//     - Slime + Shadow => Shell Slime with Bolsterer 
//       - Fuse without allocating points - we need to max Bolsterer
//     - Two more Healslimes that complement the Snail Slime (-) and Shell Slime (-)
//   - Remember, when fusing (particularly for monsters level 17 or higher), allocate their free points before fusing.
//     - Children get half of allocated points if learning a skill the parent had points in, but only a quarter of unspent
//       points. 
//     - Monsters get additional points at levels 11, 15, 17, 20, 21, 25, 26, 30, 35, 38, 39, and 40.
//       If you're one level short of extra points, it's often beneficial to get that extra level before fusing.
//     - For maxing out skills to unlock the higher tiered skills, it's more cost effective to split the points over both
//       children (when possible). It's quicker to level two monsters to 15 than one to 25 for the same amount of points.
//   - NOTE: save the Jumping Jackal - we'll need it later.

// [[Quicksave H | Vuuleen (Lv28) - 35:26]]
// [[Quicksave H | Jamiras (Lv21) - 29:58]]

// * The next step is to win the Scout Challenge. When you're ready, go talk to the lady
//   at the main counter in Scout HQ.
//   - The hardest thing about these fights is not being able to heal between fights. Coming up against a new opponent
//     with a fresh set of monsters while one or two of yours are low on health usually ends up with a failed attempt.
//   - There's three rounds. After you defeat Tryger, Solitaire manages to disqualify herself.

achievement("We Have a Champion", "Win the Monster Scout Challenge", 10,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq_battlements) &&
              bit5(0x8d510) == 1 && prev(bit5(0x8d510)) == 0
)

// * Swing by Igor Fields' house and talk to him about Dr. Snap (unimportant?)
// * Down in the sewers, you can get a phial of yggdrasil dew from the lady in the first tent
// * Take the jetty to Infant Isle (west northern pier), then proceed to Celeste Isle (northwest pier),
//   and on to Fert Isle (nearby pier).
// * Enter the scout post, then talk to Black Jacques in the scout den.
// * Work your way around the east side of the island to the northwest. There will be a pier there. Take the jetski.

// ===== CELL HQ =====
// [ ] Dingaling           Lv18 
// [ ] Hacksaurus          Lv18 
// [ ] Jargon              Lv22 
// [ ] Metal Dragon        Lv25 

// * Take the elevator up into CELL HQ.
// * There's a red chest in the first room containing a Forester's Axe
// * Go to the north side and up the stairs
// * Follow the hallway around and up the next set of stairs.

// [[Quicksave I | Vuuleen (Lv27) - 40:03]]
// [[Quicksave I | Jamiras (Lv21) - 30:36)]]

// * Go through the door and fight.
//   !! Belial - 1760 HP
// * Talk to the warden

achievement("He Walked Right Past It", "Receive the Baryon Sphere", 5,
    trigger = trigger_location(island_fert_isle, location_fert_isle_cell_hq_office) &&
              bit2(0x8d503) == 1 && prev(bit2(0x8d503)) == 0
)

// * Turn around and leave CELL HQ (you can't use Evac or Zoom here).
// * At this point, you should be able to synthesize a Rank A monster.
//   - You may have to make some intermediate Rank B monsters.
//   - Wailin' Weed + pretty much anything is one way.
// * Take the jetski back to Celeste Isle and on to Infant Isle.
// * Stop at the Scoutmaster's Tent with your rank A monster
// * [ ] Complete Scout Proficiency test #10: 1000g -> Rank A monster (Gigantes) -> Metal Talons
// * Talk to the other man in the tent to det a Diemon.
// * Proceed to Domus Isle, and stop at the scout post so you have a place to Zoom to/revive at.
// * Take the southern jetski on the west end of town to Infern Isle.

// ===== Infern Isle =====
// [ ] Skeleton Soldier    Lv17 northern island center
// [ ] Cockateer           Lv20 northern island east side
// [ ] Silvapithecus       Lv21 northern island center
// [ ] Lethal Armor        Lv22 southern island beach
// [ ] Dragurn             Lv24 southern island hills
// [ ] Tyrantosaurus       Lv24 northern island west side

// * Head into the northern building (with the glowing eyes)
// * Proceed through the next door and through the tunnel
// * After the brief cutscene, follow the left path.
// * At the northwestern edge of the island, duck down onto a ledge for a brown chest.
// * Turn around and take the path towards the center of the island.
// * When you reach the top of the mountain, a battle will begin.
//   !! Ace of Spaces - 2880 HP
// * Use the Baryon Sphere on the Ace of Spades

achievement("Reunited", "Use the Baryon Sphere", 5,
    trigger = trigger_location(island_infern_isle, location_infern_isle_mountain_outside) &&
              bit5(0x8d517) == 1 && prev(bit5(0x8d517)) == 0
)

// * Enter the volcano

// ===== Tartarus =====
// [ ] Liquid Metal Slime  Lv 1 [Rare]
// [ ] Skeleton Soldier    Lv17 2F (purple)
// [ ] Cockateer           Lv20 3F (purple)
// [ ] Silvapithecus       Lv21
// [ ] Fallen Prieset      Lv22
// [ ] Phantom Swordsman   Lv22
// [ ] Soulspawn           Lv24
// [ ] Demon-at-Arms       Lv32
// [ ] Totured Soul        Lv32
// [ ] Buffalogre          Lv36
// [ ] Mohawker            Lv36
// [ ] Black Dragon        Lv38
// [ ] Boss Troll          Lv40
// [ ] Atlas               Lv36

// * Follow the path around to a brown chest.
// * Continue to the fork and head left and outside.
// * Follow the path to another brown chest, then proceed into the next cave.
// * Stay on the outside until you reach the glowing wall.
// * Climb it and fight a black dragon (1670HP) guarding a red chest containing a Warlord's Hammer
//   and another brown chest.
// * Head east to go back outside. Follow the path to the next cave and head back inside.
// * Follow the path to another brown chest. Then go out through the southern cave.
// * Turn right and follow the western path to a red chest containing a zombiesblight.
// * Go back inside and head northeast to go back outside again.
// * Follow the path to another red chest (trap box!).
// * Continue up the path and go back into the volcano.
// * Follow the path to another red chest containing a yggdrasil dew.
// * Backtrack along the lower path and head all the way south for a red chest containing a staff of darkness.
// * Head northeast and follow the path as it loops back around and into a new area.
// * Just past the pulsating blob, you'll encounter Atlas (1768HP).
// * Continue along the path and outside to the rim of the volcano.
// * Go around to the far side and open two red chests for a yggdrasil leaf and sacred talons.
// * NOTE: The mini-bosses respawn whenever you leave the volcano, so you can kill them, cast Evac, then go back in
//   and kill them again. It's a decent way to grind until you're ready to face the boss.

// [[Quicksave J | Vuuleen (Lv23) - 45:51]]
// [[Quicksave J | Jamiras (Lv21) - 39:19]]

// * Approach the center of the volcano.
//   !! Buffalogre (1250HP) and Mohawker (1160HP)
//   (You'll be fully healed between fights - including reviving dead monsters)

// [[Quicksave K | Vuuleen (Lv29) - 52:27]]
// [[Quicksave K | Jamiras (Lv28) - 47:04]]

//   !! Dr. Snapped (4065HP) and minions
//   - You'll want a healer with Multi-heal
//   (You can start right at the Dr. Snapped fight if you die)

achievement("For Humanity's Sake", "Defeat Dr. Snapped", 10,
    trigger = trigger_location(island_infern_isle, location_infern_isle_mountain_top) &&
              bit0(0x8d518) == 1 && prev(bit0(0x8d518)) == 0
)

// * Head to the scout HQ and into the commissioner's office.
// * Leave scout HQ and head to Infant Isle (west pier north side).

achievement("Full Circle", "Reunite with the Incarnus again", 5,
    trigger = trigger_location(island_infant_isle, location_infant_isle_outside) &&
              bit3(0x8d519) == 1 && prev(bit3(0x8d519)) == 0
)

// * After the credits roll, save your game. Then reset and load it. Let the post-game begin!

// * If you've encountered 100 monsters by now (very likely), you can talk to the man along the 
//   eastern wall in the commissioner's office for a Liquid Metal Slime.
// * Head to the library (west side of scout HQ), and talk to the man to receive a zombie slayer.
// * Upstairs in the item shop, you can do matchmaking. This allows you to pair some of your monsters
//   with monsters provided by the game so you get a new monster and only lose one of yours.

// * You can start the advanced scout proficiency tests now. Talk to Scoutmaster Shuffles on Infant Isle again.
// * [ ] Complete Advanced Scout Proficiency test #1: 1000g -> Slime Knight -> Elfin Elixir
//       - [ ] Phantom Fencer (Celeste moon shrine) + [ ] Slime (Infant Isle)
// * [ ] Complete Advanced Scout Proficiency test #2: 1100g -> Spitnik -> Yggdrasil Dew
//       - [ ] Xeroph Isle
// * [ ] Complete Advanced Scout Proficiency test #3: 1200g -> Green Dragon -> Gold Nugget
//       - [ ] Imp (Xeroph shrine) + [ ] Jargon (Fert Isle night)
// * [ ] Complete Advanced Scout Proficiency test #4: 1300g -> anything with Great in the name -> Sage's Staff
//       - [ ] Great Sabrecub
// * [ ] Complete Advanced Scout Proficiency test #5: 1400g -> anything with Man in the name -> Scourge Whip
//       - [ ] Mud Mannequin (Fert Isle night)
// * [ ] Complete Advanced Scout Proficiency test #6: 1500g -> Living Statue -> Sage's Scroll
//       - [ ] Buffalogre + [ ] Golem
// * [ ] Complete Advanced Scout Proficiency test #7: 1600g -> Cannibox -> Hero Spear
//       - [ ] Palaish Shrine 4F
// * [ ] Complete Advanced Scout Proficiency test #8: 1700g -> Tortured Soul -> Dragon Slayer
//       - [ ] Living Statue + [ ] Stark Raven
// * [ ] Complete Advanced Scout Proficiency test #9: 1800g -> Malroth -> Neutral Ground
//       - See below
// * [ ] Complete Advanced Scout Proficiency test #10: 2000g -> Dracky, Platypunk, or Mischievous Mole -> Orichalcum Claws

// * You can also participate in the battle arena on Xeroph isle (bottom of the crater).
// * [ ] Rank E: 10g -> Seed of Life
// * [ ] Rank D: 50g -> Metal Claws
// * [ ] Rank C: 100g -> Yggdrasil Leaf
// * [ ] Rank B: 500g -> Minus Sceptre
// * [ ] Rank A: 1000g -> Dragontail Whip
// * [ ] Rank S: 2000g -> Loyalty Card (20% discount at shops)
// * [ ] Rank X: 3000g -> Miracle Mace

// * Now's also a good time to start on the piracy sidequest. Random encounter between islands at night.
// * [ ] Route 1: Between Celeste Isle and Fert Isle
// * [ ] Route 2: Between Domus Isle and Xeroph Isle
// * [ ] Route 3: Between Infern Isle and Celeste Isle
// * [ ] Route 4: Between Xeroph Isle and Palaish Isle
// * [ ] Route 5: Between Infant Isle and Celeste Isle

// Item shop skill scrolls:
// * [ ] Warrior: rank C Slime x2 (Dragon Slime, King Slime, Cure Slime, Liquid Metal Slime)
// * [ ] Mage: rank C Demon x2 (Gryphon, Great Dracky, Octavian Sentry, Wrecktor)
// * [ ] Priest: rank C Nature x2 (Hades Condor, Great Sabrecat, Treeface, Scissor Beatle)
// * [ ] Martial Artist: rank C Material x2 (Mud Mannequin, Dingaling, Hunter Mech, Puppeteer)

// [[Quicksave L | Vuuleen (Lv32) - 77:21]]
// - Combine Divo (Breath III) and Fryey (Wisdom III)
// - Combine Divey and Mr Fry for (Defense III)
// - Combine Grimer and Murker for (Crk Zam III) [Crk Zam III, Assassin, Healer]
// - Combine Yabber and Gracer for King Squid (S) with (Frzz Bng III) [Berserker, DefBoost]
// - Combine WIGHT+ and WIGHT- for Wight King (S) [Attack III, Anti-metal, Reaper]
// - Combine Garuder and Giger for Atlas (S) [Agi II, Anti-metal, Diabolist]
// - Return to the commissioner's office to get a Metal King Slime (S) for having 100 unique skills.

// [[Quicksave M | Vuuleen (Lv42) - 97:51]]
// - Combine Eveeler and Nessie for (Dragon Family)
// - Combine Red and Skelo for (Nature Family)
// - Combine Buffey and MOOS- for (Beast Family)
// - Combine Jumey and Sabey for (Material Family)
// - Combine Mr Arch and BELI- for (Demon Family)
// - Combine Leth and Mr Rip for (Undead Family)
// - Combine BLKDRGN+ and BLKDG- for Black Dragon (S)
// - Combine Barono and Fencer for Dullahan (S)
// - Combine Kiddo and Squido for Khalamari (S)
// - Combine Mr Wyrm and Larder for Alabast Dragon (S)
// - Combine MALR+ and Stater for Malroth (S)
// - Take Malroth and Punko to Scoutmaster Snuffles to complete Advanced Scout Proficiency
// - Level up Roseguardin (or take Riptide before combining) to complete Battle Arena
//   and defeat Captain Crow (between Infant Isle and Celeste Isle at night)

// [[Quicksave N | Vuuleen (Lv45) - 99:25]]
// - Go to the commissioner's office and fight Solitaire
// - Go into the sewers, unlock the door, and fight Estark

// [[Quicksave O | Vuuleen (Lv40) - 114:47]]
// - Combine Mr. Alab and Morety for Orgodemir (X)
// - Combine Ruin and Roser for Psaro (X)
// - Combine Moley and Clubber for Don Mole (S)

// [[Quicksave P | Vuuleen (Lv71) - 124:30]]
// - Combine Alabo and Ester for Dhoulmagus (S)
// - Combine Daro and Quick for (Slime Family)
// - Combine Malo and Lardey for Nimzo (X)
// - Combine UH+ and UH- for Uber Healer

// [[Quicksave Q | Vuuleen (Lv75) - 127:04]]
// - Combine Zoma and Rhap for Rhaptorne (X)

// [[Quicksave R | Vuuleen (Lv75) - 135:22]]
// - Combine TRPBX+ and TRPBX= for Trap Box (S)
// - Combine Gloop and Gloob for Grandpa Slime (S)
// - Get second Grandpa Slime for having 200 entries in monster library

// [[Quicksave S | Vuuleen (Lv75) - 136:49]]
// - Combine Golder and Grandey for Gem Slime (X)

// [[Quicksave T | Vuuleen (Lv75) - 137:55]]
// - Combine Greador and Greader for Dragonlord (X)
// - Level to 10 and combine with Rhap2 to make Dragovian Lord (X)
// - OR
// - Combine Orgodey and Rhap2 to make a Living Statue
// - Combine Darro and Mr Crow to make a Tortured Soul
// - Level them both to 10 and combine to make Dr. Snapped

// [[Quicksave L | Jamiras (Lv31) - 53:53]]
// - Swap Moler from substitutes to complete scout proficiency
// - Level up and defeat Rank X battle arena

// [[Quicksave M | Jamiras (Lv38) - 66:59]]
// - Combine Mr Gread and Mr Arch for (Demon Family)

// [[Quicksave N | Jamiras (Lv61) - 79:28]]
// - Combine Finley and Eveeley for (Beast Family)
// - Combine Lethey and Baroney for (Undead Family)
// - Combine Squiddey and Kiddey for Khalamari 
// - Go to the commissioner's office and talk to the lady for (100 skills)
//   - Get Metal King Slime for (15 Rank S)
// - Talk to Solitaire and win the battle for (Commissioner's Key)
// - Go into the sewer and fight Estark (Waited Long)

// [[Quicksave O | Jamiras (Lv75) - 112:38]]
// - Combine Mr Bull and Slayey for (Estark)
// - Go to commissioner's office and talk to the man for (200 monsters)
// - Talk to the woman for (150 skills) (need positively charge Metal Kaiser)
// - Merge Mr Chubb and Mr King for a new King Bubble Slime
// - Merge the recently acquired Metal Kaiser with Glop (must be opposite polarity from the other King Bubble Slime)
// - Level them up and the merge them (need opposite polarity as Grandpa Slime received for 200 monsters)
// - Level that up and merge the two Grandpa slimes (need negative polarity in result)
// - Merge with Goldie for (Gem Slime) (need negatively charged Gem Slime)
// - Merge with Alaber to make a Great Dragon. Merge Crowo with Alabe to make a polarity opposite Great Dragon.
// - Level them up and merge them for (DragonLord) (need positive polarity in result)
// - Level up the DragonLord and go capture a new Captain crow (positive charge) at night between Infant Isle
//   and Celeste Isle

// [[Quicksave P | Jamiras (Lv75) - 112:38]]
// - Merge Lorder and Rhap for (Dragovian Lord)
// - Reset and reload game
// - Merge Orgodemir and Rhap
// - Merge Crowo and Darro
// - Level them up and merge them for (Dr Snapped)


// Monsters get additional points at levels 11, 15, 17, 20, 21, 25, 26, 30, 35, 38, 39, and 40.

// ===== Synthesis: Uber Healer skill =====
// * Merge the Snail Slime and one Healslime to make a Wild Slime with Healer and Mage Aid
//   - Put all points in Healer for the Healslime
// * Merge the Shell Slime and the other Healslime to make a She-slime with Healer and Bolsterer
//   - Put all points in Healer for the Healslime
// * [ ] Slime Knight = [ ] Wild Slime + [ ] She Slime
//   - In order to unlock the Uber Healer skill, you need to max out Bolsterer (100) on the She-slime,
//     Mage Aid (100) on the Wild Slime, and max out Healer (100) on either.

// ===== Synthesis: Killing Machine (S) =====
// [ ] Killing Machine = [ ] Hunter Mech (Celeste Isle) + [ ] Phantom Swordsman (Tartarus)

// ===== Synthesis: Black Dragon (S) =====
// [ ] Dark Slime Knight = [ ] Cockateer (Infern Isle) + [ ] Slime (Infant Isle)
// [ ] Grim Rider = [ ] Demonrider (Xeroph Isle NE night) + [ ] Restless Armor (Celeste ruins night)
//  [ ] Bone Baron = Grim Rider + Dark Slime Knight
//  [ ] Great Dragon = [ ] (rank A) + [ ] (dragon)
//   [ ] Black Dragon = Great Dragon + Bone Baron

// ===== Synthesis: Wight King (S) =====
// [ ] Stark Raven = [ ] Skeleton Soldier + [ ] Silvapithecus
// [ ] Living Statue = [ ] Metal Slime Knight + [ ] Golem
//  [ ] Tortured Soul = Stark Raven + Living Statue (wait until after advanced scout #6)
//  [ ] King Bubble Slime = [ ] (rank A) + [ ] (slime family)
//   [ ] Wight King = Tortured Soul + King Bubble Slime

// ===== Synthesis: Drakularge (x20) =====
// - used by Gigantes (x11), Alabast Dragon (x4), Nimzo, Don Mole (x2)
// [ ] Drakularge = [ ] Giant Moth + [ ] (dragon family)

// ===== Synthesis: Gigantes (x11) =====
// - used by Atlas (x4), Malroth (x2), Nimzo, Don Mole (x4)
// [ ] Gigantes = [ ] Skeletal Soldier + [ ] Silvapithecus
//     Gigantes (+ Gigantes appears in matchmaking)

// ===== Synthesis: Atlas (S) (x4) ====
// - used for Alabast Dragon (x4)
// [ ] Jamirus = [ ] Gigantes + [ ] Dracky
//  [ ] Garuda = [ ] Hades Condor + [ ] Jamirus
//  [ ] Moosifer = [ ] Buffalogre + Pan Piper/Satyr
//   [ ] Atlas = [ ] Gigantes + [ ] Moosifer/Garuda/Boss Troll

// ===== Synthesis: Alabast Dragon (S) (x4) =====
// - used for Orgodemir, Rhapthorne, Dragonlord (x2)
// [ ] Great Dragon = [ ] (rank A - gigantes) + [ ] (dragon)
//  [ ] Mechan-o-wyrm = Great Dragon + (+) Metal Dragon (matchmaking)
//   [ ] Alabast Dragon = Drakulard + [ ] Mechan-o-wyrm

// ===== Synthesis: Don Mole (S) =====
// [ ] Mischevious Mole+ = [ ] Mischevious Mole + [ ] Mischevous Mole
// [ ] Buffalogre (x2) = [ ] Gigantes + [ ] Soulspawn
//  [ ] Boss Troll (x2) = [ ] Gigantes + [ ] Buffalogre
//      Boss Troll = Jailcat x3 (trade with Kitty - Infant/Xeroph den)
//      Boss Troll = (+Gigantes from matchmaking) + [ ] Buffalogre
//   [ ] Night Clubber (x2) = [ ] Boss Troll + [ ] Drakularge
//    [ ] Night Clubber+ = [ ] Night Clubber + [ ] Night Clubber
//     [ ] Don Mole = Mischevious Mole+ + Night Clubber+

// ===== Synthesis: Khalamari (S) =====
// - used for Malroth
// [ ] Buffalogre (x2) = [ ] Gigantes + [ ] Soulspawn
//  [ ] Boss Troll (x2) = [ ] Gigantes + [ ] Buffalogre
// [ ] Great Argon Lizard = [ ] Argon Lizard + [ ] Argon Lizard +
//                          [ ] Argon Lizard + [ ] Argon Lizard
// [ ] Frou-Fry (x3) = [ ] Komodo + [ ] Dracky or [ ] Argon Lizard + [ ] (beast family)
//  [ ] Frou-Frou = [ ] Frou-Fry + [ ] Frou-Fry +
//                  [ ] Frou-Fry + [ ] Great Argon Lizard
//   [ ] Night Clubber = [ ] Boss Troll + [ ] Frou-Frou
//  [ ] Drakularge = [ ] Giant Moth + [ ] (dragon family)
//   [ ] Night Clubber = [ ] Boss Troll + [ ] Drakularge 
//    [ ] King Squid (x2) = [ ] Khalamari Kid + [ ] Night Clubber
//     [ ] Khalamari = [ ] Khalamari Kid + [ ] Khalamari Kid +
//                     [ ] King Squid + [ ] King Squid

// ===== Synthesis: Malroth (S) (x2) =====
// - used for Zoma, Nimzo
// [ ] Demon-at-arms = [ ] Wailin' Weed (Fert Isle night) + [ ] (demon)
// [ ] Living Statue = [ ] Wailin' Weed (Fert Isle night) + [ ] (material)
//  [ ] Malroth = Demon-at-arms + [ ] Khalamari
//  [ ] Malroth = Demon-at-arms + [ ] Living Statue

// ===== Synthesis: Zoma (X) =====
// - used for Rhapthorne2
// [ ] Grim Rider = [ ] Demonrider (Xeroph Isle NE night) + [ ] Restless Armor (Celeste ruins night)
// [ ] Mohawker = [ ] Buffalogre + [ ] Wild Slime (Fert Isle rare night spawn - red chest on pillar)
//  [ ] Bone Baron = Mohawker + [ ] Grim Rider
//   [ ] Dullahan = Bone Baron + [ ] Phantom Fencer
//    [ ] Zoma = Dullahan + [ ] Malroth

// ===== Synthesis: Ruin (X) (x2) =====
// - used for Psaro (x2)
// [ ] Jum (x8) = Wrecktor (celeste sun near red chest 2f - whistle) + Shadow (infant cave)
//  [ ] Boe = Jum + [ ] (nature family)
//  [ ] Boh = Jum + [ ] (beast family)
//  [ ] Mum = Jum + [ ] (material family)
//   [ ] Mumboh = [ ] Mum + [ ] Boh
//   [ ] Jumboe = [ ] Jum + [ ] Boe
//    [ ] Mumboh-Jumboe = Mumboh + Jumboe
//     [ ] Ruin = Mumboh-Jumboe + [ ] Gold Golem (Palaish Shrine, rare 2F SE)

// ===== Synthesis: Psaro (X) (x2) =====
// - used for Estark, Rhapthorne
// [ ] Dessert Demon (xeroph shrine) = [ ] Imp (Xeroph shrine) + [ ] Dancing Devil (north Celeste Isle day)
//     Dessert Demon (+ Dessert Demon appears in matchmaking)
//  [ ] Archdemon = [ ] Dessert Demon (xeroph shrine) + [ ] Natso Macho (celeste sun shrine)
//  [ ] Octavian Sentry = [ ] Gryphon (Celeste moon shrine) + [ ] Seasaur (palaish night - pool, rare)
//   [ ] Gracos = Archdemon + Octavian Sentry
//    [ ] Heligator = Gracos + [ ] King Squid
//     [ ] Riptide = Heligator + [ ] Jumping Jackal
//      [ ] Roseguardin = [ ] Riptide + [ ] Lethal Armor
//       [ ] Psaro = Roseguardin + [ ] Ruin

// ===== Synthesis: Estark (X) (x2) =====
// - used for Rhapthorne, Mortamor
// [ ] Metal King Slime = Liquid Metal Slime x4
//  [ ] Beetlebully = Metal King Slime + [ ] Beetleboy
// [ ] Grim Rider = [ ] Demonrider (xeroph night) + [ ] Restless Armor (celeste night)
//  [ ] Bone Baron = Grim Rider + [ ] Dark Slime Knight
//   [ ] Roseguardin = [ ] Bone Baron + [ ] Lethal Armor
//    [ ] Psaro = Roseguardin + [ ] Ruin
//     [ ] Estark = Psaro + [ ] Beetlebully

// ===== Synthesis: Nimzo (S) =====
// - used for Mortamor, Rhapthorne
// [ ] Atlas = [ ] Gigantes + [ ] Moosifer/Garuda/Boss Troll
//  [ ] Drakulard = Atlas + [ ] Drakularge
//   [ ] Nimzo = Drakulard + [ ] Malroth

// ===== Synthesis: Gem Slime (X) =====
// - used for Dragonlord
// [ ] Gold Golem+ = [ ] Gold Golem + [ ] Gold Golem (palaish shrine)
// [ ] Metal King Slime = Liquid Metal Slime x4
//  [ ] King Bubble Slime = [ ] King Slime + Metal King Slime
//  [ ] King Bubble Slime = [ ] King Bubble Slime + [ ] Metal Kaiser (150 skills)
//   [ ] Grandpa Slime = King Bubble Slime + King Bubble Slime (must have grandparents as listed above)
//   [ ] Grandpa Slime (one from 200 entries in monster library)
//    [ ] Grandpa Slime+ = [ ] Grandpa Slime + [ ] Grandpa Slime
//     [ ] Gem Slime = Gold Golem+ + Grandpa Slime+

// ===== Synthesis: Trap Box (S) =====
// [ ] Liquid Metal Slime = [ ] Metal Slime + [ ] Metal Slime (Matchmaking has a [+] Metal Slime)
// [ ] Dark Slime = [ ] Liquid Metal Slime+ + [ ] Metal Slime Knight
//  [ ] Metal Kaiser = Liquid Metal Slime (must be from two Metal Slimes) + Dark Slime
//      Metal Kaiser = Liquid Metal Slime x2 (trade with Rusty in Xeroph or Palaish den)
//   [ ] Living Statue = Metal Kaiser + [ ] Cannibox (Palaish Shrine 4F)
//  [ ] Mimic = [ ] Cannibox + [ ] Lethal Armor (Infern Isle)
//  [ ] Mimic = [ ] Cannibox + [ ] Lethal Armor (Infern Isle)
//   [ ] Mimic+ = Mimic + Mimic
//    [ ] Trap Box = Mimic+ + Living Statue

// ===== Synthesis: Dragonlord (X) =====
// - used for Rhapthorne
// [ ] Great Dragon = [ ] (rank A) + [ ] (dragon)
// [ ] Great Dragon = [ ] Alabast Dragon + [ ] Captain Crow
// [ ] Great Dragon = [ ] Alabast Dragon + [ ] Gem Slime
//  [ ] Dragonlord = Great Dragon + Great Dragon

// ===== Synthesis: Rhapthorne (X) =====
// - used for Rhapthorne2
// [ ] Dhoulmagus = [ ] Alabast Dragon + [ ] Estark (can also use Psaro, but we need to make an Estark for an achievement)
//  [ ] Rhapthorne = Dhoulmagus + [ ] Nimzo

// ===== Synthesis: Rhapthorne2 (X) =====
// - used for Dr. Snapped and Dragovian Lord (after getting Dragovian Lord achievement, reset)
// [ ] Rhapthorne2 = [ ] Rhapthorne + [ ] Zoma

// ===== Synthesis: Dragovian Lord (X) =====
// [ ] Dragovian Lord = [ ] Rhapthorne 2 + [ ] Dragonlord

// ===== Synthesis: Mortamor (X) =====
// - used for Orgodemir
// [ ] Mortamor = [ ] Nimzo + [ ] Estark

// ===== Synthesis: Orgodemir (X) =====
// - used for Dr. Snapped
// [ ] Orgodemir = Alabast Dragon + Mortamor

// ===== Synthesis: Darkonium Slime (S) =====
// - used for Dr. Snapped
// [ ] Beshemoth Slime = [ ] Behemoth Slime (rare spawn on uncharted isle) + She-Slime
// [ ] Beshemoth Slime = [ ] Behemoth Slime (rare spawn on uncharted isle) + She-Slime
//  [ ] Beshemoth Slime+ = Beshemoth Slime + Beshemoth Slime
// [ ] Liquid Metal Slime = [ ] Metal Slime + [ ] Metal Slime (Matchmaking has a [+] Metal Slime)
//  [ ] Metal King Slime = [ ] Liquid Metal Slime x4
//   [ ] King Bubble Slime = Metal King Slime + [ ] King Cureslime
//    [ ] Darkonium Slime = King Bubble Slime + [ ] Beshemoth Slime+

// ===== Synthesis: Dr. Snapped (X) =====
// [ ] ???? = [ ] Rhapthorne 2 + [ ] Orgodemir
// [ ] ???? = [ ] Darkonium Slime + [ ] Captain Crow
//  [ ] Dr. Snapped = ???? + ????

// ====================================
// Matchmaking:
// * Archdemon      <= Dessert Demon + Dark Slime Knight (- rank C)
// * Beetlebully    <= Beetleboy + Metal King Slime (+)
// * Boe            <= Jum + Beetlebully (+ rank S nature) [postgame]
// * Boss Troll     <= Gigantes + Buffalogre (-) [postgame]
// * Cureslime      <= Healslime + King Slime (- rank C)
// * Dark Slime     <= Tyrantosaurus + King Slime (- rank C)
// * Demon-at-arms  <= Bone Baron + Belial (+ rank A) [postgame]
// * Demon-at-arms  <= Octavian Sentry + Belial (+ rank A demon)
// * Dragon Slime   <= Healslime + Gryphon (- rank C)
// * Jumping Jackal <= Orc + Wild Boarfish/Scorpion (+ rank F nature)
// * King Cureslime <= Healslime + Dark Slime Knight (- rank C)
// * King Cureslime <= Tyrantosaurus + Dark Slime Knight (- rank C)
// * King Cureslime <= Liquid Metal Slime + Dark Slime Knight (- rank B slime) [postgame]
// * Living Statue  <= Bone Baron + Moosifer (+ rank A) [postgame]
// * Mechan-o-wyrm  <= Metal Dragon + Great Dragon (-)
// * Metal Dragon   <= Hunter Mech + Dragurn (+ rank D dragon))
// * Octavian Sentry<= Healslime + Gryphon (- rank C)
// * Stark Raven    <= King Kelp + Soulspawn (- undead)
// * Yabby          <= King Slime + Gorerilla (rank B nature)

// * Gigantes + [-] (rank A) => wailin' weed/buffalogre
// * Metal Dragon + [-] Great Dragon => Mechan-o-wyrm
// * Dessert Demon + [-] Notso Macho (rank C) => Archdemon
// * Metal Slime + [-] Metal Slime => Liquid Metal Slime

// * Healslime + [-] (rank C) => ????
// * Metal Slime Knight + [-] Hunter Mech => ????
// * King Slime + [+] (rank B nature - Beetleboy/Giant Moth/Gorerilla) => ????
// * Dragonthorn + [+] (rank E undead - Muddy Hand/Demonrider/Mummy Boy/Skipper) => Snapdragon ????
// * Orc + [+] (rank F nature - Capsichum/Wild Boarfish/Scorpion/Crabid/Chimaera) => Jumping Jackal/Dragonthorn
// * Tyrantosaurus + [-] (rank C) => ????
// * Goody Bag + [-] Goodybag => Cannibox
// * King Kelp + [-] (undead) => Phantom Swordsman -> Wailin' Weed
// * Hades Conder + [-] Seasaur => Abyss Diver
// * Puppeteer + [+] Wrecktor => Fallen Priest
// * Octavian Sentry + [+] (rank A demon - Jamirus/Gracos/Demon-at-Arms/Belial) => ????
// * Dancing Devil + [-] Imp => Dessert Demon
// * Demon Rider + [+] Restless Armor => Grim Rider
// * Lesser Demon + [-] (rank D beast - Pan Piper/Jumping Jackal/Night Emporer/Weartiger/Brownie) => Gargoyle/Gryphon
// * Walking Corpse + [+] (rank D material - Cannibox/Rockbomb/Anchorman/Gold Golem/Mecha-mynah) => 
//                          Mecha-mynah -> Restless Armor
// ===== Postgame =====
// * Liquid Metal Slime + [-] (rank B slime - Dark Slime/Dark Slime Knight/King Cureslime) => ????
// * Khalamari Kid + [+] King Squid => ????
// * Beetleboy + [+] Metal King Slime => Beetlebully
// * Jum + [+] (nature S - Beetlebully/King Squid/Khalamari) => Boe ???

// ====================================
// https://gamefaqs.gamespot.com/boards/933956-dragon-quest-monsters-joker/66899415

// One Oomphed monster with 700 attack will get ~~6% when scouting Metal Slime from Metal Menarerie. 
// Which means 3 Double Trouble Oomphed monsters with 700 attack will get you 36%, which I would say
// is okay. You might need a few tries, but with Metal Tickets you can effortlessly enter Metal Menaerie
// again and again. Metal Tickets can be bought from sewers merchant for 10000G. One trip to the
// circular arena up the vines in Tartarus nets you a Dragonsblight (guaranteed drops from Black Dragon),
// which you can sell for 5000G. Of course you can try with three non-Double trouble monsters, but the
// chance of scouting will be much lower. As for Oomph, you can get it from Anti-Metal.

// Finally, how to get that one Metal King Slime?
// Oomphed 700 attack monster will get ~~0.5%, so you don't want to scout them. To synthesize one, you
// need 4 Liquid Metal Slimes. And Liquid Metal Slime is made by synthesizing two Metal Slimes. The trick
// is to use a Metal Slime from Matchmaking, so that you have to catch only 4 Metal Slimes. Matchmaking
// Metal Slime is (+) charged, so keep only (-) charged Metal Slimes.

// ====================================

achievement("It's Alive!", "Synthesize a monster", 5,
    trigger = trigger_in_game() && game_state() == state_synthesizing &&
              monsters_synthesized() > prev(monsters_synthesized())
)

achievement("A Little Help, Please", "Unlock the Synthesis Picks option", 5,
    trigger = trigger_in_game() && game_state() == state_synthesizing &&
              monsters_synthesized() >= 20 && prev(monsters_synthesized()) < 20
)

achievement("Synthesis Master", "Synthesize 50 monsters", 10,
    trigger = trigger_in_game() && game_state() == state_synthesizing &&
              monsters_synthesized() >= 50 && prev(monsters_synthesized()) < 50
)

achievement("A Grand Lineage", "Synthesize a +5 monster", 5,
    trigger = trigger_in_game() && game_state() == state_synthesizing &&
              monsters_synthesized() > prev(monsters_synthesized()) &&
              byte(0x8f864) >= 5
)

function trainers_defeated() => dword(0x9a05c)
achievement("Joker vs", "Defeat a trainer's squad in battle", 5,
    trigger = trigger_in_game() && trainers_defeated() > prev(trainers_defeated())
)

achievement("Monster Exchange", "Trade monsters with a trainer", 5,
    trigger = trigger_in_game() && any_of(range(0x9a31b, 0x9a32b), a => byte(a) == 3 && prev(byte(a)) < 3)
)

achievement("The Menagerie", "Gain access to the metal menagerie", 5,
    trigger = trigger_in_game() && current_island() == island_palaish_isle &&
              byte(0x09a307) == 3 && prev(byte(0x09a307)) == 2
)

achievement("Curse Neptune's Trident", "Defeat Captain Crow", 10,
    trigger = trigger_in_game() &&
              current_location() == location_uncharted_pirate_ship &&
              byte(0x9a30f) == 0x13 && prev(byte(0x9a30f)) == 0x12

)

achievement("The Arena Don't Have No More Ranks", "Complete Rank X of the Battle Arena", 10,
    trigger = trigger_location(island_xeroph_isle, location_xeroph_isle_battle_arena_tent) &&
              byte(0x9a03e) == 7 && prev(byte(0x9a03e)) == 6
)

achievement("Monster Scout Proficiency Test", "Complete all 10 problems for Scoutmaster Shuffles", 10,
    trigger = trigger_location(island_infant_isle, location_infant_isle_scoutmaster_shuffles_tent) &&
              byte(0x9a30e) == 0x29 && prev(byte(0x9a30e)) == 0x1e
)

achievement("Advanced Monster Scout Proficiency Test", 
            "Complete the second set of 10 problems for Scoutmaster Shuffles", 25,
    trigger = trigger_location(island_infant_isle, location_infant_isle_scoutmaster_shuffles_tent) &&
              byte(0x9a30e) == 0x2a && prev(byte(0x9a30e)) == 0x28
)

achievement("The Commissioner's Key", "Complete Solitaire's Challenge", 10,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
              byte(0x9a2ec) == 0x1d && prev(byte(0x9a2ec)) == 0x1c
)

achievement("I Have Waited Long for Thee", "Defeat Estark in the secret lab", 10,
    trigger = trigger_location(island_domus_isle, location_domus_isle_secret_lab) &&
              bit2(0x8d51b) == 1 && prev(bit2(0x8d51b)) == 0
)

function monsters_befriended() => sum_of(range(0x99f8f, 0x99fb9), addr => bitcount(addr))

// ICON: Matchmaking
achievement("Scout I", "Befriend 50 unique monsters", 5,
    trigger = measured(monsters_befriended() >= 50, when=trigger_in_game()) && prev(monsters_befriended()) < 50
)

achievement("Scout II", "Befriend 100 unique monsters", 10,
    trigger = measured(monsters_befriended() >= 100, when=trigger_in_game()) && prev(monsters_befriended()) < 100
)

achievement("Scout III", "Befriend 150 unique monsters", 25,
    trigger = measured(monsters_befriended() >= 150, when=trigger_in_game()) && prev(monsters_befriended()) < 150
)

function skills_learnt() => sum_of(range(0x99fbc, 0x99fd1), addr => bitcount(addr))

achievement("Skills Library Proficiency I", "Add 50 entries to the skill library", 5,
    trigger = measured(skills_learnt() >= 50, when=trigger_in_game()) && prev(skills_learnt()) < 50
)

achievement("Skills Library Proficiency II", 
            "Receive the King Metal Slime for having 100 entries in your skills library", 10,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
              byte(0x9a2fd) == 1 && prev(byte(0x9a2fd)) == 0
)

achievement("Skills Library Proficiency III", 
            "Receive the Kaiser Slime for having 150 entries in your skills library", 25,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
              byte(0x9a2fd) == 3 && prev(byte(0x9a2fd)) < 3
)

// since we can't max out the monster library, there's a couple skills missing too
//achievement("Skills Library Proficiency IV", 
//            "Receive Leopold for having all 192 entries in your skills library", 50,
//    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
//              byte(0x9a2fd) == 5 && prev(byte(0x9a2fd)) < 5
//)

function has_skill(skill_id) => bit(skill_id % 8, 0x99fbc + skill_id / 8)
achievement("Inherited Knowledge", "Learn a rank III skill (does not include Incarnus skills)", 5,
    trigger = trigger_in_game() && any_of(rank3_skills, s => has_skill(s) == 1 && prev(has_skill(s)) == 0)
)

achievement("With Great Power", "Learn an Uber skill", 10,
    trigger = trigger_in_game() && any_of(uber_skills, s => has_skill(s) == 1 && prev(has_skill(s)) == 0)
)


achievement("Monster Library Proficiency I", 
            "Receive the Liquid Metal Slime for having 100 entries in your monster library", 10,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
              byte(0x9a2fc) == 1 && prev(byte(0x9a2fc)) == 0
)

achievement("Monster Library Proficiency II", 
            "Receive the Grandpa Slime for having 200 entries in your monster library", 25,
    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
              byte(0x9a2fc) == 3 && prev(byte(0x9a2fc)) < 3
)

// cannot get this - need to have seen Trode, Empyrea, Robbin' Hood, and Wildcard
//                 - Robbin' Hood can be "won from chance encounter"?
// push to Unofficial anyways...
//achievement("Monster Library Proficiency III", 
//            "Receive Empyrea for having all 210 entries in your monster library", 50,
//    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
//              byte(0x9a2fc) == 5 && prev(byte(0x9a2fc)) < 5
//)

//achievement("Proficient Librarian", 
//            "Receive Robbin' Hood and Trode for completing both the monster library and skills library", 10,
//    trigger = trigger_location(island_domus_isle, location_domus_isle_scout_hq) &&
//              byte(0x9a2fc) == 7 && byte(0x9a2fd) == 7 && 
//              (prev(byte(0x9a2fc)) < 7 || prev(byte(0x9a2fd)) < 7)
//)

function array_contains(arr, n)
{
    for i in arr
    {
        if (i == n)
            return true
    }
    
    return false
}

// a non-encountered monster will show as ????? in the list, or ????? as their "found on"
function encountered_monster(m) => bit(m % 8, 0x99f62 + m / 8)

// a non-befriended monster will show as ????? in the list, or ????? as their skills/traits
function befriended_monster(m) => bit(m % 8, 0x99f8f + m / 8)

function library_achievement(uppercaseName, lowercaseName, points, monsters)
{
    valid_monsters = []
    ignored = false
    
    for monster in monsters
    {
        if (array_contains(rank_x_monsters, monster))
            ignored = true
        else if (array_contains(rank_s_monsters, monster))
            ignored = true
        else if (array_contains(unsynthesizable_monsters, monster))
            ignored = true
        else
            array_push(valid_monsters, monster)
    }
       
    befriended_monster_count = sum_of(valid_monsters, m => befriended_monster(m))
    achievement(uppercaseName + " Library", 
        "Befriend all " + length(valid_monsters) + " rank A-F monsters in the " + lowercaseName + " library",
        points,
//        trigger = measured(tally_of(valid_monsters, length(valid_monsters),
//                                    m => once(encountered_monster(m) == 1 || befriended_monster(m) == 1)),
//                           when=trigger_in_game()) &&
//                  any_of(valid_monsters, m => encountered_monster(m) == 0 || befriended_monster(m) == 0)
        trigger = measured(befriended_monster_count == length(valid_monsters), when=trigger_in_game()) &&
                  prev(befriended_monster_count) < length(valid_monsters)
    )
}

// library_achievement matches "Types of Monsters Befriended"

library_achievement("Slime", "slime", 25, family_slime)
// Page 1: Slime, Bubble Slime, Shell Slime, Healslime, She-slime, Drake Slime
// Page 2: Snail Slime, Wild Slime, Slime Knight, Metal Slime, Metal Slime Knight, Angel Slime
// Page 3: Behemoth Slime, Beshemoth Slime, Dragon Slime, King Slime, Cure Slime, Liquid Metal Slime
// Page 4: Dark Slime, Dark Slime Knight, King Cureslime, King Bubble Slime, Kaiser Slime

library_achievement("Dragon", "dragon", 25, family_dragon)
// Page 1: Komodo, Frou-fry, Dragonthorn, Argon Lizard, Nardragon, Snapdragon
// Page 2: Jargon, Green Dragon, Skelegon, Dragurn, Seasaur, Red Dragon
// Page 3: Hacksaurus, Sea Dragon, Tyrantosaurus, Metal Dragon, Great Argon Lizard, Abyss Diver
// Page 4: Megalodon, Frou-Frou, Darkularge, Great Dragon, Mechan-o-wyrm

library_achievement("Nature", "nature", 25, family_nature)
// Page 1: Capsichum, Wild Boarfish, Scorpion, Crabid, Chimaera, Spiked Hare
// Page 2: Khalamari Kid, Jailcat, Great Sabrecub, Hell Hornet, Eveel, Bullfinch
// Page 3: Hades Condor, Great Sabrecat, Treeface, Scissor Beetle, Beetleboy, Giant Moth
// Page 4: Gorerilla, Heligator, Yabby, Riptide, Garuda

library_achievement("Beast", "beast", 25, family_beast)
// Page 1: Platypunk, Mischevious Mole, Satyr, Hammerhood, Fencing Fox, Chainine
// Page 2: Orc, Pan Piper, Jumping Jackal, Night Emporer, Weartiger, Brownie
// Page 3: Bodkin Archer, Gargoyle, Merman, Diemon, Notso Macho, Cockateer
// Page 4: Silvapithecus, Gigantes, Moosifer, Mohawker, Buffalogre, Pazuzu

library_achievement("Material", "material", 25, family_material)
// Page 1: Bag o' laughs, Shadow, Dancing Flame, Frostburn, Spitnik, Goodybag
// Page 2: King Kelp, Wax Murderer, Cannibox, Rockbomb, Anchorman, Gold Golem
// Page 3: Mecha-mynah, Mud Mannequin, Dingaling, Hunter Mech, Puppeteer, Jum
// Page 4: Mimic, Golem, Living Statue, Boe, Mum, Boh

library_achievement("Demon", "demon", 25, family_demon)
// Page 1: Draky, Lips, Winky, See Urchin, Imp, Lump Wizard
// Page 2: Frogface, Dessert Demon, Dancing Devil, Headhunter Lesser Demon, Gryphon
// Page 3: Great Dracky, Octavian Sentry, Wrecktor, Lethal Armor, Fallen Priest, Archdemon
// Page 4: Boss Troll, Jamirus, Gracos, Demon-at-Arms, Belial

library_achievement("Undead", "undead", 25, family_undead)
// Page 1: Ghost, Firespirit, Stump Chump, Funghoul, Muddy Hand, Demonrider
// Page 2: Mummy Boy, Skipper, Phantom Fencer, Flyguy, Skeleton, Walking Corpse
// Page 3: Restless Armor, Hellhound, Phantom Swordsman, Skeleton Soldier, Grim Rider, Soulspawn
// Page 4: Stark Raven, Wailin' Weed, Tortured Soul, Roseguardin, Bone Baron

//library_achievement("Incarni", "incarni", 25, family_incarni)

function rank_s_achievement(title, description, points, count)
{
    valid_monsters = []
    
    for monster in rank_s_monsters
    {
        if (!array_contains(unsynthesizable_monsters, monster) || monster == monster_captain_crow)
            array_push(valid_monsters, monster)
    }
       
    befriended_monster_count = sum_of(valid_monsters, m => befriended_monster(m))
    achievement(title, description, points, 
        trigger = measured(befriended_monster_count == count, when=trigger_in_game()) &&
                  prev(befriended_monster_count) < count
    )
}

// King Metal Slime and Grandpa Slime are rewards, everything else has to be synthesized.
// Black Dragon, Don Mole, Killing Machine, Trap Box, and Wight King are not used in any other syntheses.
rank_s_achievement("Something Special I", "Befriend your first rank S monster", 5, 1)
rank_s_achievement("Something Special II", "Befriend five rank S monsters", 10, 5)
rank_s_achievement("Something Special III", "Befriend ten rank S monsters", 10, 10)
rank_s_achievement("Something Special IV", "Befriend fifteen rank S monsters", 10, 15)
rank_s_achievement("Something Special V", "Befriend all twenty-one rank S monsters", 25, 21)

for monster in rank_x_monsters
{
    if (!array_contains(unsynthesizable_monsters, monster))
    {
        first_char = substring(monster_names[monster], 0, 1)
        if (first_char == "E" || first_char == "O")
            description = "Synthesize an " + monster_names[monster]
        else
            description = "Synthesize a " + monster_names[monster]
        
        if (monster == monster_dr_snapped ||
            monster == monster_gem_slime)
            points = 25
        else
            points = 10
    
        achievement(monster_names[monster] + " Synthesis", description, points,
            trigger = trigger_in_game() && game_state() == state_synthesizing &&
                      monsters_synthesized() > prev(monsters_synthesized()) &&
                      monster_type(0) == monster
        )
    }
}

// Skill lines: https://gamefaqs.gamespot.com/ds/933956-dragon-quest-monsters-joker/faqs/50887
//  50  75 100
// [ ] [ ] [ ] Frizz & Bang
// [ ] [ ] [ ] Frizz & Woosh
// [ ] [ ] [ ] Frizz & Zap
// [ ] [ ] [ ] Frizz & Zam
// [ ] [ ] [ ] Bang & Woosh
// [ ] [ ] [ ] Bang & Crack
// [ ] [ ] [ ] Bang & Zap
// [ ] [ ] [ ] Bang & Zam
// [ ] [ ] [ ] Woosh & Crack
// [ ] [ ] [ ] Woosh & Zap
// [ ] [ ] [ ] Woosh & Zam
// [ ] [ ] [ ] Crack & Zap
// [ ] [ ] [ ] Crack & Zam
// [ ] [ ] [ ] Fire
// [ ] [ ] [ ] Ice
// [ ] [ ] [ ] Breath
//     [ ] [ ] Antimagic
//     [ ] [ ] Wulfspade
//     [ ] [ ] Hawkhart
//     [ ] [ ] Diamagon
//     [ ] [ ] Cluboon
// [ ] [ ] [ ] Attack Boost
// [ ] [ ] [ ] Defence Boost
// [ ] [ ] [ ] Agility Boost
// [ ] [ ] [ ] Wisdom Boost



