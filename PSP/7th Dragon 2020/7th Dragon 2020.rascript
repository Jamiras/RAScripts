// 7th Dragon 2020
// #ID = 16452

// Quest notes: https://docs.google.com/spreadsheets/d/1uxwcI8qQwrHxzTJCysNPkoo4oPf_ZvO98ynlNf_LnVE/edit?gid=8#gid=8
// wiki: https://w.atwiki.jp/7d2020/pages/1.html

// Filter range for event flags: 0xa98690-0xa98d5f

// Dev time: 92h 2m; final 114h 10m
// Want to try Knight + Psychic (mage) + Psychic (healer)

function current_playtime_frames() => dword(0xa9b5f0)
function standard_difficulty() => dword(0xa9b5ec) == 1

class CharacterSkill
{
    base_address = 0
    
    function level() => dword(this.base_address + 0x00)
    function skill() => dword(this.base_address + 0x04)
    function unknown() => dword(this.base_address + 0x08)
}

class CharacterData
{
    base_address = 0
    
    function class() => byte(this.base_address + 0x0000)
    function level() => word(this.base_address + 0x000c)
    function life() => dword(this.base_address + 0x0010)
    function mana() => dword(this.base_address + 0x0014)
    function exp() => dword(this.base_address + 0x001c)
    function sp() => dword(this.base_address + 0x0020)
    function equipped_weapon() => dword(this.base_address + 0x003c)
    function equipped_armor() => dword(this.base_address + 0x0040)
    function equipped_accessory1() => dword(this.base_address + 0x0044)
    function equipped_accessory2() => dword(this.base_address + 0x0048)
    
    function skill(index) => CharacterSkill(this.base_address + 0x0050 + index * 12)
}

function character(index) => CharacterData(0xa9b628 + index * (0xa9c32c - 0xa9b628))

function character_class(index) => character(index).class()
function character_level(index) => character(index).level()

class_samurai = 0
class_trickster = 1
class_destroyer = 2
class_psychic = 3
class_hacker = 4

classes = {
    class_samurai: "Samurai",
    class_trickster: "Trickster",
    class_destroyer: "Destroyer",
    class_psychic: "Psychic",
    class_hacker: "Hacker",
}

function current_location() => dword(0x1098844)
location_tokyo_city_hall_plaza = 0xAD
location_tokyo_city_hall_entrance = 0xA2
location_tokyo_city_hall_2F = 0xA3
location_tokyo_city_hall_3F = 0xA4
location_tokyo_city_hall_4F = 0xA5
location_tokyo_city_hall_10F = 0xA6
location_tokyo_city_hall_roof = 0xA7
location_tokyo_city_hall_cutscene = 0x14
location_white_house_cutscene = 0x0C
location_ney_york_subway_cutscene = 0x10
location_shinjuku_shelter_hospital = 0xAA
location_shinjuku_shelter = 0x0B
location_shinjuku_shelter_factory = 0xA9
location_shinjuku_shelter_headquarters = 0xA8
location_city_map = 0x01
location_tokyo_hall_inverted_plaza = 0x22
location_tokyo_hall_inverted_entrance = 0x1A
location_tokyo_hall_inverted_2F = 0x1B
location_tokyo_hall_inverted_3F = 0x1C
location_tokyo_hall_inverted_4F = 0x1D
location_tokyo_hall_inverted_floating_reef = 0x20
location_tokyo_hall_inverted_11F = 0x1E
location_tokyo_hall_inverted_12F = 0x1F
location_tokyo_hall_inverted_roof = 0x21
location_murakumo_dorm_4f_unit_13_room = 0xBC
location_murakumo_dorm_4f = 0xBA
location_murakumo_dorm_4f_unit_10_room = 0xBB
location_meeting_room_7f = 0xAF
location_meeting_room_7f_meeting_room = 0xB0
location_city_hall_entrance_1f = 0xAE
location_shibuya_flowersea_station_crossing = 0x27
location_shibuya_flowersea_dogenzaka = 0x29
location_shibuya_flowersea_upper_dogenzaka = 0x2D
location_shibuya_flowersea_lower_dogenzaka = 0x2E
location_murakumo_hq_5f = 0xB1
location_murakumo_hq_5f_control_room = 0xB2
location_murakumo_hq_5f_personnel_room = 0xB3
location_laboratory_6f = 0xBD
location_laboratory_6f_room = 0xBE
location_shibuya_flowersea_to_shibuya = 0x2A
location_shibuya_center_street = 0x2F
location_shibuya_center_street_sewers = 0x33
location_city_hall_residential_a_hall = 0xBF
location_city_hall_residential_a_left_room = 0xC0
location_city_hall_residential_a_right_room = 0xC1
location_tokyo_underground_nakano_station = 0x3C
location_tokyo_underground_subway_offshoot = 0x37
location_tokyo_underground_offshoot_area_a = 0x39
location_tokyo_underground_offshoot_area_b = 0x3A
location_tokyo_underground_sewers = 0x3F
location_tokyo_underground_sewers2 = 0x40
location_tokyo_underground_sewers_offshoot_area_a = 0x41
location_tokyo_underground_sewers_offshoot_area_b = 0x42
location_tokyo_underground_sewers_reservoir = 0x43
location_barracks_3f = 0xB7
location_barracks_3f_strategy_room = 0xB8
location_barracks_3f_lounge = 0xB9
location_ikebukuro_railcage_yamate_station = 0x50
location_ikebukuro_railcage_100m = 0x51
location_ikebukuro_railcage_200m = 0x52
location_ikebukuro_railcage_hub = 0x53
location_ikebukuro_railcage_400m = 0x54
location_ikebukuro_railcage_400m_rim = 0x55
location_ikebukuro_railcage_zenith = 0x56
location_ikebukuro_railcage_imperial_dragon = 0x57
location_ikebukuro_railcage_273m = 0x59
location_ikebukuro_railcage_218m = 0x58
location_shuto_expressway = 0x0D
location_clinic_2f = 0xB4
location_clinic_2f_clinic = 0xB5
location_clinic_2f_sick_room = 0xB6
location_city_hall_residential_b_hall = 0xC2
location_city_hall_residential_b_left_room = 0xC3
location_city_hall_residential_b_right_room = 0xC4
location_ikebukuro_railcage2_yamate_station = 0x10E
location_ikebukuro_railcage2_100m = 0x10F
location_ikebukuro_railcage2_200m = 0x110
location_ikebukuro_railcage2_hub = 0x111
location_ikebukuro_railcage2_400m = 0x112
location_ikebukuro_railcage2_400m_rim = 0x113
location_ikebukuro_railcage2_zenith = 0x114
location_ikebukuro_railcage2_imperial_dragon = 0x115
location_ikebukuro_railcage2_273m = 0x117
location_ikebukuro_railcage2_218m = 0x116
location_diva_room = 0xD5
location_yotsuya_spine_bridge = 0x64
location_yotsuya_graveyard_1 = 0x65
location_yotsuya_graveyard_2 = 0x66
location_yotsuya_graveyard_3 = 0x67
location_yotsuya_graveyard_4 = 0x68
location_yotsuya_moonlit_ramble = 0x69
location_yotsuya_moonlit_bridge = 0x6a
location_yotsuya_moonlit_arena = 0x6b
location_yotsuya_moonlit_way = 0x6c
location_city_hall_sample_cases = 0xd7
location_yotsuya_after_spine_bridge = 0x11d
location_yotsuya_after_graveyard_1 = 0x11e
location_yotsuya_after_graveyard_2 = 0x11f
location_yotsuya_after_graveyard_3 = 0x120
location_yotsuya_after_graveyard_4 = 0x121
location_yotsuya_after_moonlit_ramble = 0x122
location_yotsuya_after_moonlit_bridge = 0x123
location_yotsuya_after_moonlit_arena = 0x124
location_yotsuya_after_moonlit_way = 0x125
location_city_hall_residential_c_hall = 0xC5
location_city_hall_residential_c_left_room = 0xC6
location_city_hall_residential_c_right_room = 0xC7
location_city_hall_roof = 0x148
location_tokyo_underground_nakano_station2 = 0x3d
location_tokyo_underground_subway_offshoot2 = 0x38
location_tokyo_underground_offshoot_area_c = 0x3b
location_tokyo_underground_3km = 0x3e
location_tokyo_underground_2km = 0x4d
location_tokyo_underground_1km = 0x4e
location_tokyo_underground_kokubunji_station = 0x4b
location_tokyo_underground_kokubunji_station_lit = 0x4c
location_kokubunji_searsand_desert = 0x71
location_kokubunji_searsand_factory_front = 0x72
location_kokubunji_searsand_factory_entrance = 0x82
location_kokubunji_searsand_factory_area_1 = 0x73
location_kokubunji_searsand_factory_elevator = 0x80
location_kokubunji_searsand_factory_area_2 = 0x75
location_kokubunji_searsand_factory_area_2b = 0x7b
location_kokubunji_searsand_factory_area_1_rear = 0x74
location_kokubunji_searsand_factory_area_2c = 0x76
location_kokubunji_searsand_factory_elevator2 = 0x7e
location_kokubunji_searsand_factory_dragon_fabrication = 0x81
location_kokubunji_searsand_factory_area_3 = 0x77
location_kokubunji_searsand_factory_area_3b = 0x78
location_kokubunji_searsand_factory_elevator3 = 0x7c
location_kokubunji_searsand_factory_elevator4 = 0x7d
location_kokubunji_searsand_factory_area_4 = 0x79
location_kokubunji_searsand_nerve_center = 0x7a
location_city_hall_residential_d_hall = 0xC8
location_city_hall_residential_d_left_room = 0xC9
location_city_hall_residential_d_right_room = 0xCA
location_city_hall_industrial_area = 0xd8
location_city_hall_industrial_area_intro = 0xce
location_city_hall_power_room = 0xd0
location_city_hall_baths = 0xd1
location_city_hall_skylounge = 0xd3
location_kokubunji_searsand_after_desert = 0x12a
location_kokubunji_searsand_after_factory_front = 0x12b
location_kokubunji_searsand_after_factory_entrance = 0x136
location_kokubunji_searsand_after_factory_area_1 = 0x12c
location_kokubunji_searsand_after_factory_area_2 = 0x12e
location_kokubunji_searsand_after_factory_area_2b = 0x12f
location_kokubunji_searsand_after_factory_area_1_rear = 0x134
location_kokubunji_searsand_after_factory_area_2c = 0x76 // ?
location_kokubunji_searsand_after_factory_dragon_fabrication = 0x135
location_kokubunji_searsand_after_factory_area_3 = 0x130
location_kokubunji_searsand_after_factory_area_3b = 0x131
location_kokubunji_searsand_after_factory_area_4 = 0x132
location_shibuya_miyashita_park = 0x28
location_shibuya_to_miyashita = 0x2b
location_shibuya_miyashita_street = 0x30
location_shibuya_miyashita_underground = 0x34
location_shibuya_north_miyashita_street = 0x31
location_shibuya_north_miyashita = 0x2c
location_shibuya_sewers = 0x32
location_shibuya_sleepy_hollow_cutscene = 0xe5
location_shibuya_after_dogenzaka = 0xe7
location_shibuya_after_upper_dogenzaka = 0xeb
location_shibuya_after_lower_dogenzaka = 0xec
location_shibuya_after_miyashita_park = 0xe6
location_shibuya_after_to_miyashita = 0xe9
location_shibuya_after_miyashita_street = 0xee
location_shibuya_after_north_miyashita_street = 0xef
location_shibuya_after_miyashita_underground = 0xf0
location_shibuya_after_north_miyashita = 0xea
location_shibuya_after_sewers = 0xf2
location_city_hall_sky_hangout = 0xcf
location_city_hall_residential_e_hall = 0xCB
location_city_hall_residential_e_left_room = 0xCC
location_city_hall_residential_e_right_room = 0xCD
location_meeting_room_7f_meeting_room_renovated = 0xDA
location_daiba_underground = 0x44
location_daiba_offshoot_area_a = 0x47
location_daiba_underground_n = 0x46
location_daiba_offshoot_area_b = 0x4a
location_daiba_icepack_entrance = 0x83
location_daiba_icepack_entrance_plaza = 0x84
location_daiba_icepack_avenue_1f = 0x88
location_daiba_icepack_central_plaza = 0x87
location_daiba_icepack_avenue_2f = 0x89
location_daiba_icepack_avenue_3f = 0x8a
location_daiba_icepack_west_street = 0x86
location_daiba_icepack_east_street = 0x85
location_daiba_icepack_fountain_plaza = 0x8b
location_daiba_icepack_glacial_depths = 0x8c
location_skylounge_renovated = 0xd4
location_city_hall_laboratory_chx = 0xd6
location_tokyo_underground_after_sewers = 0xfd
location_tokyo_underground_after_sewers2 = 0xfe
location_tokyo_underground_after_sewers_offshoot_area_a = 0xff
location_tokyo_underground_after_sewers_offshoot_area_b = 0x100
location_tokyo_underground_after_sewers_reservoir = 0x101
location_daiba_after_underground = 0x102
location_daiba_after_offshoot_area_a = 0x105
location_daiba_after_underground_n = 0x104
location_daiba_after_offshoot_area_b = 0x108
location_daiba_icepack_after_entrance = 0x139
location_daiba_icepack_after_entrance_plaza = 0x13a
location_daiba_icepack_after_avenue_1f = 0x13e
location_daiba_icepack_after_central_plaza = 0x13d
location_daiba_icepack_after_avenue_2f = 0x13f
location_daiba_icepack_after_avenue_3f = 0x140
location_daiba_icepack_after_west_street = 0x13c
location_daiba_icepack_after_east_street = 0x13b
location_daiba_icepack_after_fountain_plaza = 0x141
location_daiba_icepack_after_glacial_depths = 0x142
location_tokyo_tower_front = 0x92
location_tokyo_tower_viewing_deck_1f = 0x93
location_tokyo_tower_viewing_deck_2f = 0x94
location_tokyo_tower_viewing_deck_3f = 0x95
location_tokyo_tower_viewing_deck_4f = 0x96
location_tokyo_tower_spiral_stairs = 0x97
location_city_hall_industrial_area7 = 0xd9
location_tokyo_tower_spiral_stairs2 = 0x9d
location_tokyo_tower_dragon_perimeter = 0x9b
location_tokyo_tower_dragon_perimeter2 = 0x9e
location_tokyo_tower_dragons_domain_x = 0x98
location_tokyo_tower_dragons_domain_y = 0x99
location_tokyo_tower_dragons_domain_z = 0x9a
location_tokyo_tower_true_dragons_lair = 0x9c
location_tokyo_tower_true_dragons_lair2 = 0x9f
location_credits = 0x02
location_yotsura_illusory = 0x149
location_daiba_icepack_illusory = 0x14b

locations = {
    location_tokyo_city_hall_plaza: "City Hall",
    location_tokyo_city_hall_entrance: "City Hall",
    location_tokyo_city_hall_2F: "City Hall",
    location_tokyo_city_hall_3F: "City Hall",
    location_tokyo_city_hall_4F: "City Hall",
    location_tokyo_city_hall_10F: "City Hall",
    location_tokyo_city_hall_roof: "City Hall",
    location_tokyo_city_hall_cutscene: "City Hall",
    location_white_house_cutscene: "City Hall",
    location_shinjuku_shelter_hospital: "Shinjuku Shelter",
    location_shinjuku_shelter: "Shinjuku Shelter",
    location_shinjuku_shelter_factory: "Shinjuku Shelter",
    location_shinjuku_shelter_headquarters: "Shinjuku Shelter",
    location_city_map: "City Map",
    location_tokyo_hall_inverted_plaza: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_entrance: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_2F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_3F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_4F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_floating_reef: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_11F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_12F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_roof: "Tokyo Hall Inverted",
    location_murakumo_dorm_4f_unit_13_room: "City Hall",
    location_murakumo_dorm_4f: "City Hall",
    location_murakumo_dorm_4f_unit_10_room: "City Hall",
    location_meeting_room_7f: "City Hall",
    location_meeting_room_7f_meeting_room: "City Hall",
    location_city_hall_entrance_1f: "City Hall",
    location_shibuya_flowersea_station_crossing: "Shibuya Flowersea",
    location_shibuya_flowersea_dogenzaka: "Shibuya Flowersea",
    location_shibuya_flowersea_upper_dogenzaka: "Shibuya Flowersea",
    location_shibuya_flowersea_lower_dogenzaka: "Shibuya Flowersea",
    location_murakumo_hq_5f: "City Hall",
    location_murakumo_hq_5f_control_room: "City Hall",
    location_murakumo_hq_5f_personnel_room: "City Hall",
    location_laboratory_6f: "City Hall",
    location_laboratory_6f_room: "City Hall",
    location_shibuya_flowersea_to_shibuya: "Shibuya Flowersea",
    location_shibuya_center_street: "Shibuya Flowersea",
    location_shibuya_center_street_sewers: "Shibuya Flowersea",
    location_city_hall_residential_a_hall: "City Hall",
    location_city_hall_residential_a_left_room: "City Hall",
    location_city_hall_residential_a_right_room: "City Hall",
    location_tokyo_underground_nakano_station: "Tokyo Underground",
    location_tokyo_underground_subway_offshoot: "Tokyo Underground",
    location_tokyo_underground_offshoot_area_a: "Tokyo Underground",
    location_tokyo_underground_offshoot_area_b: "Tokyo Underground",
    location_tokyo_underground_sewers: "Tokyo Underground",
    location_tokyo_underground_sewers_offshoot_area_a: "Tokyo Underground",
    location_tokyo_underground_sewers_offshoot_area_b: "Tokyo Underground",
    location_tokyo_underground_sewers_reservoir: "Tokyo Underground",
    location_tokyo_underground_sewers2: "Tokyo Underground",
    location_barracks_3f: "City Hall",
    location_barracks_3f_strategy_room: "City Hall",
    location_barracks_3f_lounge: "City Hall",
    location_ikebukuro_railcage_yamate_station: "Ikebukuro Railcage",
    location_ikebukuro_railcage_100m: "Ikebukuro Railcage",
    location_ikebukuro_railcage_200m: "Ikebukuro Railcage",
    location_ikebukuro_railcage_hub: "Ikebukuro Railcage",
    location_ikebukuro_railcage_400m: "Ikebukuro Railcage",
    location_ikebukuro_railcage_400m_rim: "Ikebukuro Railcage",
    location_ikebukuro_railcage_zenith: "Ikebukuro Railcage",
    location_ikebukuro_railcage_imperial_dragon: "Ikebukuro Railcage",
    location_ikebukuro_railcage_273m: "Ikebukuro Railcage",
    location_ikebukuro_railcage_218m: "Ikebukuro Railcage",
    location_shuto_expressway: "Shuto Expressway",
    location_clinic_2f: "City Hall",
    location_clinic_2f_clinic: "City Hall",
    location_clinic_2f_sick_room: "City Hall",
    location_city_hall_residential_b_hall: "City Hall",
    location_city_hall_residential_b_left_room: "City Hall",
    location_city_hall_residential_b_right_room: "City Hall",
    location_ikebukuro_railcage2_yamate_station: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_100m: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_200m: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_hub: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_400m: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_400m_rim: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_zenith: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_imperial_dragon: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_273m: "Ikebukuro Railcage",
    location_ikebukuro_railcage2_218m: "Ikebukuro Railcage",
    location_diva_room: "City Hall",
    location_yotsuya_spine_bridge: "Yotsuya Evernight",
    location_yotsuya_graveyard_1: "Yotsuya Evernight",
    location_yotsuya_graveyard_2: "Yotsuya Evernight",
    location_yotsuya_graveyard_3: "Yotsuya Evernight",
    location_yotsuya_graveyard_4: "Yotsuya Evernight",
    location_yotsuya_moonlit_bridge: "Yotsuya Evernight",
    location_yotsuya_moonlit_ramble: "Yotsuya Evernight",
    location_yotsuya_moonlit_way: "Yotsuya Evernight",
    location_yotsuya_moonlit_arena: "Yotsuya Evernight",
    location_city_hall_sample_cases: "City Hall",
    location_yotsuya_after_spine_bridge: "Yotsuya Evernight",
    location_yotsuya_after_graveyard_1: "Yotsuya Evernight",
    location_yotsuya_after_graveyard_2: "Yotsuya Evernight",
    location_yotsuya_after_graveyard_3: "Yotsuya Evernight",
    location_yotsuya_after_graveyard_4: "Yotsuya Evernight",
    location_yotsuya_after_moonlit_bridge: "Yotsuya Evernight",
    location_yotsuya_after_moonlit_ramble: "Yotsuya Evernight",
    location_yotsuya_after_moonlit_way: "Yotsuya Evernight",
    location_yotsuya_after_moonlit_arena: "Yotsuya Evernight",
    location_city_hall_residential_c_hall: "City Hall",
    location_city_hall_residential_c_left_room: "City Hall",
    location_city_hall_residential_c_right_room: "City Hall",
    location_city_hall_roof: "City Hall",
    location_tokyo_underground_nakano_station2: "Tokyo Underground",
    location_tokyo_underground_subway_offshoot2: "Tokyo Underground",
    location_tokyo_underground_offshoot_area_c: "Tokyo Underground",
    location_tokyo_underground_3km: "Tokyo Underground",
    location_tokyo_underground_2km: "Tokyo Underground",
    location_tokyo_underground_1km: "Tokyo Underground",
    location_tokyo_underground_kokubunji_station: "Tokyo Underground",
    location_tokyo_underground_kokubunji_station_lit: "Tokyo Underground",
    location_kokubunji_searsand_factory_front: "Kokubunji Searsand",
    location_kokubunji_searsand_desert: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_entrance: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_1: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_elevator: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_2: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_2b: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_1_rear: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_2c: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_elevator2: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_dragon_fabrication: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_3: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_3b: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_elevator3: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_elevator4: "Kokubunji Searsand",
    location_kokubunji_searsand_factory_area_4: "Kokubunji Searsand",
    location_kokubunji_searsand_nerve_center: "Kokubunji Searsand",
    location_city_hall_residential_d_hall: "City Hall",
    location_city_hall_residential_d_left_room: "City Hall",
    location_city_hall_residential_d_right_room: "City Hall",
    location_city_hall_industrial_area_intro: "City Hall",
    location_city_hall_industrial_area: "City Hall",
    location_city_hall_power_room: "City Hall",
    location_city_hall_baths: "City Hall",
    location_city_hall_skylounge: "City Hall",
    location_kokubunji_searsand_after_desert: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_front: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_entrance: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_1: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_1_rear: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_2: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_2b: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_3: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_3b: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_area_4: "Kokubunji Searsand",
    location_kokubunji_searsand_after_factory_dragon_fabrication: "Kokubunji Searsand",
    location_shibuya_miyashita_park: "Shibuya Flowersea",
    location_shibuya_to_miyashita: "Shibuya Flowersea",
    location_shibuya_miyashita_street: "Shibuya Flowersea",
    location_shibuya_miyashita_underground: "Shibuya Flowersea",
    location_ney_york_subway_cutscene: "Shibuya Flowersea",
    location_shibuya_north_miyashita_street: "Shibuya Flowersea",
    location_shibuya_north_miyashita: "Shibuya Flowersea",
    location_shibuya_sewers: "Shibuya Flowersea",
    location_shibuya_sleepy_hollow_cutscene: "Shibuya Flowersea",
    location_shibuya_after_dogenzaka: "Shibuya Flowersea",
    location_shibuya_after_upper_dogenzaka: "Shibuya Flowersea",
    location_shibuya_after_lower_dogenzaka: "Shibuya Flowersea",
    location_shibuya_after_miyashita_park: "Shibuya Flowersea",
    location_shibuya_after_to_miyashita: "Shibuya Flowersea",
    location_shibuya_after_miyashita_street: "Shibuya Flowersea",
    location_shibuya_after_north_miyashita_street: "Shibuya Flowersea",
    location_shibuya_after_miyashita_underground: "Shibuya Flowersea",
    location_shibuya_after_north_miyashita: "Shibuya Flowersea",
    location_shibuya_after_sewers: "Shibuya Flowersea",
    location_city_hall_sky_hangout: "City Hall",
    location_city_hall_residential_e_hall: "City Hall",
    location_city_hall_residential_e_left_room: "City Hall",
    location_city_hall_residential_e_right_room: "City Hall",
    location_meeting_room_7f_meeting_room_renovated: "City Hall",
    location_daiba_underground: "Tokyo Underground",
    location_daiba_offshoot_area_a: "Tokyo Underground",
    location_daiba_underground_n: "Tokyo Underground",
    location_daiba_offshoot_area_b: "Tokyo Underground",
    location_daiba_icepack_entrance: "Daiba Icepack #13",
    location_daiba_icepack_entrance_plaza: "Daiba Icepack #13",
    location_daiba_icepack_avenue_1f: "Daiba Icepack #13",
    location_daiba_icepack_central_plaza: "Daiba Icepack #13",
    location_daiba_icepack_avenue_2f: "Daiba Icepack #13",
    location_daiba_icepack_avenue_3f: "Daiba Icepack #13",
    location_daiba_icepack_west_street: "Daiba Icepack #13",
    location_daiba_icepack_east_street: "Daiba Icepack #13",
    location_daiba_icepack_fountain_plaza: "Daiba Icepack #13",
    location_daiba_icepack_glacial_depths: "Daiba Icepack #13",
    location_skylounge_renovated: "City Hall",
    location_city_hall_laboratory_chx: "City Hall",
    location_tokyo_underground_after_sewers: "Tokyo Underground",
    location_tokyo_underground_after_sewers2: "Tokyo Underground",
    location_tokyo_underground_after_sewers_offshoot_area_a: "Tokyo Underground",
    location_tokyo_underground_after_sewers_offshoot_area_b: "Tokyo Underground",
    location_tokyo_underground_after_sewers_reservoir: "Tokyo Underground",
    location_daiba_after_underground: "Tokyo Underground",
    location_daiba_after_offshoot_area_a: "Tokyo Underground",
    location_daiba_after_underground_n: "Tokyo Underground",
    location_daiba_after_offshoot_area_b: "Tokyo Underground",
    location_daiba_icepack_after_entrance: "Daiba Icepack #13",
    location_daiba_icepack_after_entrance_plaza: "Daiba Icepack #13",
    location_daiba_icepack_after_avenue_1f: "Daiba Icepack #13",
    location_daiba_icepack_after_central_plaza: "Daiba Icepack #13",
    location_daiba_icepack_after_avenue_2f: "Daiba Icepack #13",
    location_daiba_icepack_after_avenue_3f: "Daiba Icepack #13",
    location_daiba_icepack_after_west_street: "Daiba Icepack #13",
    location_daiba_icepack_after_east_street: "Daiba Icepack #13",
    location_daiba_icepack_after_fountain_plaza: "Daiba Icepack #13",
    location_daiba_icepack_after_glacial_depths: "Daiba Icepack #13",
    location_tokyo_tower_front: "Tokyo Tower",
    location_tokyo_tower_viewing_deck_1f: "Tokyo Tower",
    location_tokyo_tower_viewing_deck_2f: "Tokyo Tower",
    location_tokyo_tower_viewing_deck_3f: "Tokyo Tower",
    location_tokyo_tower_viewing_deck_4f: "Tokyo Tower",
    location_tokyo_tower_spiral_stairs: "Tokyo Tower",
    location_city_hall_industrial_area7: "City Hall",
    location_tokyo_tower_spiral_stairs2: "Tokyo Tower",
    location_tokyo_tower_dragon_perimeter: "Tokyo Tower",
    location_tokyo_tower_dragon_perimeter2: "Tokyo Tower",
    location_tokyo_tower_dragons_domain_x: "Tokyo Tower",
    location_tokyo_tower_dragons_domain_y: "Tokyo Tower",
    location_tokyo_tower_dragons_domain_z: "Tokyo Tower",
    location_tokyo_tower_true_dragons_lair: "Tokyo Tower",
    location_tokyo_tower_true_dragons_lair2: "Tokyo Tower",
    location_credits: "City Hall",
    location_yotsura_illusory: "Yotsuya Evernight",
}

unknown_locations = []
for i in range(1, 0x150)
{
    if (!dictionary_contains_key(locations, i))
        array_push(unknown_locations, i)
}

function current_area() => dword(0x1098d84)
area_city_hall = 0x00
area_tokyo_hall_inverted = 0x01
area_shibuya_flowersea = 0x02
area_kokubunji_subway = 0x03
area_toshima_subway = 0x04
area_daiba_subway = 0x05
area_ikebukuro_railcage = 0x06
area_yotsuya_evernight = 0x07
area_kokubunji_searsand = 0x08
area_daiba_icepack_13 = 0x09
area_tokyo_tower = 0x0A
area_intro_city_hall = 0x0B
area_shinjuku_shelter = 0x0D
area_illusory_capital = 0x0E
area_city_map = 0x10
area_shuto_expressway = 0xFFFFFFFF

areas = {
    area_city_hall: "City Hall",
    area_tokyo_hall_inverted: "Tokyo Hall Inverted",
    area_shibuya_flowersea: "Shibuya Flowersea",
    area_kokubunji_subway: "Kokubunji Subway",
    area_toshima_subway: "Toshima Subway",
    area_daiba_subway: "Daiba Subway",
    area_ikebukuro_railcage: "Ikebukuo Railcage",
    area_yotsuya_evernight: "Yotsuya Evernight",
    area_kokubunji_searsand: "Kokubunji Searsand",
    area_daiba_icepack_13: "Daiba Icepack #13",
    area_tokyo_tower: "Tokyo Tower",
    area_intro_city_hall: "City Hall",
    area_shinjuku_shelter: "Shinjuku Shelter",
    area_illusory_capital: "Illusory Capital",
    area_shuto_expressway: "Shuto Expressway",
    area_city_map: "City Map",
}

function rp_area() => max_of(measured(current_area(), when=current_location() != location_city_map),
                             measured(area_city_map, when=current_location() == location_city_map))

function in_game() => character(0).class() != 0xFF

rich_presence_conditional_display(!in_game(), "Titles")

function current_chapter() => byte(0xa98908) // actual current chapter
                            + bit0(0xa98731) // flag for illusory capital
chapters = {
    0: "Ch0",
    1: "Ch1",
    2: "Ch1.5",
    3: "Ch2",
    4: "Ch3",
    5: "Ch4",
    6: "Ch5",
    7: "Ch6",
    8: "Ch7",
    9: "ChX",
    10: "Ch+",
}

difficulties = {
    0: " (casual)",
    1: "",
}

function quests_completed() => bit7(0xa986e8) + bit6(0xa986e8) + bitcount(0xa986e9) + bitcount(0xa986ea) + 
                               bitcount(0xa986eb) + bitcount(0xa986ec) + bit0(0xa986ed)
function quest_count() => 33

rich_presence_conditional_display(character(1).class() == 0xFF, "Lv{0} {1} | {2} | {3}: {4}/{5} quests | {6}{7}",
    rich_presence_value("Level", character(0).level()),
    rich_presence_lookup("Class", character(0).class(), classes),
    rich_presence_lookup("Area", rp_area(), areas),
    rich_presence_lookup("Chapter", current_chapter(), chapters),
    rich_presence_value("Quests", quests_completed()), quest_count(),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="MINUTES"), // 30fps
    rich_presence_lookup("Difficulty", dword(0xa9b5ec), difficulties)
)

rich_presence_conditional_display(character(2).class() == 0xFF, 
                                  "Lv{0} {1} and Lv{2} {3} | {4} | {5}: {6}/{7} quests | {8}{9}",
    rich_presence_value("Level", character(0).level()),
    rich_presence_lookup("Class", character(0).class(), classes),
    rich_presence_value("Level", character(1).level()),
    rich_presence_lookup("Class", character(1).class(), classes),
    rich_presence_lookup("Area", rp_area(), areas),
    rich_presence_lookup("Chapter", current_chapter(), chapters),
    rich_presence_value("Quests", quests_completed()), quest_count(),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="MINUTES"),
    rich_presence_lookup("Difficulty", dword(0xa9b5ec), difficulties)
)

rich_presence_display("Lv{0} {1}, Lv{2} {3}, and Lv{4} {5} | {6} | {7}: {8}/{9} quests | {10}{11}",
    rich_presence_value("Level", character(0).level()),
    rich_presence_lookup("Class", character(0).class(), classes),
    rich_presence_value("Level", character(1).level()),
    rich_presence_lookup("Class", character(1).class(), classes),
    rich_presence_value("Level", character(2).level()),
    rich_presence_lookup("Class", character(2).class(), classes),
    rich_presence_lookup("Area", rp_area(), areas),
    rich_presence_lookup("Chapter", current_chapter(), chapters),
    rich_presence_value("Quests", quests_completed()), quest_count(),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="MINUTES"),
    rich_presence_lookup("Difficulty", dword(0xa9b5ec), difficulties)
)


class BattleEntity
{
    base_address = 0
    
    function next() => dword(this.base_address + 0x10)
    function life() => dword(this.base_address + 0x64)
    function type() => dword(this.base_address + 0x78)
}

entity_type_rabi = 10
entity_slime = 20
entity_poison_frog = 30
entity_roper = 40
entity_type_bluegrass_nymph = 50
entity_badger = 60
entity_dragelope = 70
entity_wild_ape = 80
entity_mandala_fan = 90
entity_scorpion = 100
entity_giant_pincer = 110
entity_smilodon = 120
entity_wraith = 130
entity_blossom = 140
entity_murderbear = 150
entity_zombie_solder = 160
entity_nighthawk = 170
entity_green_turtle = 180
entity_trash_golem = 190
entity_flying_shark = 200
entity_wild_board = 210
entity_deathscissor = 220
entity_bloom_seed = 230
entity_red_rabi = 240
entity_blue_rabi = 250
entity_magma_slime = 260
entity_white_jelly = 270
entity_singing_frog = 280
entity_froggle = 290
entity_northcrown = 300
entity_airgrass_nymph = 310
entity_darkgrass_nymph = 320
entity_bunbuku = 330
entity_enragelope = 350
entity_flushed_monkey = 360
entity_amethyst_fan = 370
entity_crimson_fan = 380
entity_sky_crab = 390
entity_jackal = 400
entity_phantom = 410
entity_rafflesia = 420
entity_freesia = 430
entity_lazy_bear = 440
entity_twilight_wing = 450
entity_volcanic_turtle = 460
entity_magnetic_golem = 470
entity_snow_boar = 480
entity_vortex_golem = 480
entity_schwarzer_tod = 500
entity_bloom_seed_20xx = 530
entity_green_tortoise = 540
entity_tentacles = 550
entity_mad_bear = 560
entity_garbage_golem = 570
entity_feral_hawk = 580
entity_hawk_chief = 590
entity_volcanic_turtle = 600
entity_bandit_bear = 610
entity_tachibana = 620
entity_rabbit_type_zero = 630
entity_electrolaser = 640
entity_railgun = 650
entity_dramselfly = 1000
entity_little_dragon = 1010
entity_stony_dragon = 1030
entity_armanos = 1040
entity_hover_dragon = 1050
entity_hazard_dragon = 1060
entity_sumo_dragon = 1070
entity_d1 = 1090
entity_enshentas = 1100
entity_granderodon = 1120
entity_tower_dragon = 1130
entity_shield_dragon = 1140
entity_tyrannosaurus = 1150
entity_dragonfly = 1160
entity_microdragon = 1170
entity_hammerer = 1180
entity_blizzasaurus = 1200
entity_dracoprism = 1210
entity_chemical_dragon = 1220
entity_thunder_dragon = 1240
entity_freeze_dragon = 1250
entity_snapdragon = 1260
entity_destroyer_dragon = 1270
entity_cornarodon = 1280
entity_cannon_dragon = 1290
entity_aegis_dragon = 1300
entity_dinosaurus = 1310
entity_d2 = 1330
entity_dragonlord = 1340
entity_wyvern = 1420
entity_tower_draggy = 1430
entity_dragonfly_v = 1440
entity_dramselfly_v = 1450
entity_little_dragon_v = 1460
entity_microdragon_v = 1470
entity_hammerhead_v = 1480
entity_hammerer_v = 1490
entity_stony_dragon_v = 1500
entity_blizzasaurus_v = 1510
entity_hover_dragon_v = 1520
entity_dracoprism_v = 1530
entity_hazard_dragon_v = 1540
entity_sumo_dragon_v = 1550
entity_dragonlord_v = 1560
entity_machine_dragon_v = 1570
entity_thunder_dragon_v = 1580
entity_freeze_dragon_v = 1590
entity_enshentas_v = 1600
entity_ferver_dragon_v = 1610
entity_criminal_dragon_v = 1620
entity_cornarodon_v = 1630
entity_shield_dragon_v = 1650
entity_dinosaurus_v = 1670
entity_destructigon_v = 1680
entity_takehaya = 2000
entity_neko = 2010
entity_daigo = 2020
entity_ino_shibuya = 2040
entity_guchi_shibuya = 2050
entity_neko_shuto = 2060
entity_neko_kokubunji = 2070
entity_daigo_shuto = 2080
entity_daigo_kokubunji = 2090
entity_tao = 2110
entity_tao_shibuya = 2120
entity_akira = 2140
entity_akira_shibuya = 2150
entity_ino_city_hall = 2160
entity_guchi_city_hall = 2170
entity_ino = 2190
entity_guchi = 2200
entity_kimo = 2210
entity_kaku = 2220
entity_warcry = 3000
entity_jigowatt = 3020
entity_trinitro = 3040
entity_sleepy_hollow = 3050
entity_zero_blue = 3060
entity_dragoness_mizuchi = 3070
entity_true_niara = 3080
entity_wounded_warcry = 3090
entity_scaber_body = 3130
entity_scaber_tail = 3140
entity_true_niara2 = 3150
entity_illusory_charger = 3190
entity_sleepy_hollow_unbeatable = 3240
entity_illusory_dream = 3250
entity_party_member = 0xFFFFFFFF

function bit_set_at_location(bit, location) => current_location() == location && bit == 1 && prev(bit) == 0

function story_achievement(title, description, points, location, bit, type="progression")
{
    achievement(title, description, points, type=type,
         trigger = bit_set_at_location(bit, location) && standard_difficulty()
    )
}

function story_achievement2(title, description, points, location, location2, bit, type="progression")
{
    achievement(title, description, points, type=type,
         trigger = (bit_set_at_location(bit, location) ||
                    bit_set_at_location(bit, location2)) && standard_difficulty()
    )
}

function quest_achievement(title, points, location, bit)
{
    achievement("Quest: " + title, "Complete the " + title + " quest", points,
        trigger = bit_set_at_location(bit, location)
    ) 
}

function quest_achievement2(title, points, location, location2, bit)
{
    achievement("Quest: " + title, "Complete the " + title + " quest", points,
        trigger = bit_set_at_location(bit, location) ||
                  bit_set_at_location(bit, location2)
    ) 
}


// ===== Chapter 0 =====
// ----- City Hall Plaza -----
// * Select a portrait and class for your character
//   - Samurai - All around. 
//               Good attack skills, has self heal, self buffs, and gets a pretty useful party buff later on.
//   - Hacker - Buffer/Debuffer.
//              Buffs are fairly useful but it depends on your playstyle.
//              Hacking is somewhat useless because it takes up 2 turns (and sometimes misses).
//   - Psychic - Healer/Mage type. 
//               Targets elemental weaknesses and heals/revives your team.
//               Pretty much a requirement in every party unless you want to use up your items.
//   - Trickster - Debuffer/Anti-air.
//                 Dagger skills inflict Status effects on enemies.
//                 Gun skills are effective on flying enemies.
//                 EX Skill is probably the most broken in the game.
//   - Destroyer - Attacker/Defender.
//                 Good damage output but is also an effective defender due to Counter Stance.
// * After being told about your mission, walk up to the terminal and add two more party members (Log in > Entry).
//   - A "common" party is Destroyer/Trickster/Psychic
//   - An alternate suggestion is Samurai/Hacker/Psychic
//   - My favorite (so far) is Samurai/Psychic/Psychic
// * They'll automatically be assigned to your party.
// * Head north and talk to the man standing in front of the building.

// ----- City Hall 1F -----
// * After more dialog and a demo fight, save at the green ball, then head up the stairs.

// ----- City Hall 2F -----
// * Being level 1 makes this difficult. Don't be afraid to use healing items. 
//   Once you hit level 2, it's easier to kill the enemies, and by level 4 you can just use Auto.
//   Note that you automatically refill LF/MN when you level up.
// * Head west (lower left of screen), then south (lower right), then east (upper right) to a door.
//   Just keep moving forward until you're in the room just east of where you entered the floor.
// * Open the chest for Medicine x5 [bit2(0xa98790)], then head up the stairs.

// ----- City Hall 3F -----
// * Loop around to the southern hallway and enter the doorway to get to the center of the floor.
// * Open the chest for Mana Water x3 [bit3(0xa98790)], then go back out.
// * Head west down the hallway (passing the next doorway).
// * Keep going until you encounter Gatou, who will teach you First Aid (S) [Party Skill].
// * Head upstairs.

// ----- City Hall 4F -----
// * Follow the hallway around to the save point and save.
//   - Save points usually appear just before a boss.
//   - It's generally a good idea to hang around the save point until you level up so you're full on LF/MN.
//   - In this case, it's a good idea to get to level 4.
// * A bit farther and you'll encounter Gatou and Nagare talking.
// * Keep going down the hallway and around the corner where you'll find a chest with Heal Aero I x2 [bit5(0xa98790)].
// * Go back and talk to Gatou. Let him know you're ready, and you'll get to fight the first boss.
//   - D1 has 250 LF. Just have everyone use their Skill and it should be dead in three turns.

story_achievement("A Good Show for Baby Murakumo", "Defeat the first dragon", 2,
                  location_tokyo_city_hall_4F, bit0(0xa98758))

// * Run back to the save point to refresh your LF/MN.
// * Go back to where you fought D1 and exit through the northeast door and get another speech from Gatou.
// * Head around the hallway to the east and then south for a chest containing Medicine I x3 [bit4(0xa98790)].
// * Go back and enter the elevator.

// ----- City Hall 10F -----
// * Head down the west hallway and keep going until you get to the elevators.
// * If you haven't reached level 5 yet, hang out at the save point until you do.
// * Save, then take one to the roof.
// [Save 1 - n/a - Lv5 0h41]

// ----- City Hall Roof -----
// * You'll immediately be thrown into battle with D2.
//   - D2 has 300 LF. 
//   - Just like the first dragon have everyone use their skills and use Medicine if someone drops below half.

story_achievement("Training Interrupted", "Defeat the dragon on the roof of City Hall", 5, 
                  location_tokyo_city_hall_cutscene, bit1(0xa98758))

// * After a brief cutscene, you'll immediately be thrown back into battle with Warcry.
//   - Warcry has 80000 LF. You can't defeat it now. After a couple rounds, he'll wipe your party.
// * There's another cutscene, then the game title video plays.

// ----- Shijuku Shelter -----
// * You wake up in a hospital.
// * Step out of the room for another brief cutscene.
// * Leave the room again, and head east. Behind the first door is a shop where you can buy supplies if you need any.
// * Keep moving down the hallway and you'll run into Natsume. When asked to join Murakumo, say yes.

// ===== Chapter 1 =====
// * Agree to help take back City Hall.
// * Go back to the hospital to meet Nav 3.6 and Nav 3.7, and complete your checkup.
//   - You'll now be able to use Custom to learn new skills.
// * Save, and the leave the shelter.
// * Go to Tokyo Hall Inverted.

// ----- Tokyo Hall Inverted, City Hall Plaza -----
// * Go into the building and jump into the hole.

// ----- Tokyo Hall Inverted 2F -----
// * In the first large room, head west to a chest containing 30Az [bit5(0xa98796)].
// * Head back through the first room and north from the next room for a chest containing Escape Kit x3 [bit4(0xa98796)].
// * Go all the way south and navigate through the rubble in the next big room.
// * Continue south and jump into the hole.

// ----- Tokyo Hall Inverted 3F -----
// * Head east into the next room and through the rubble. 
//   - A chest in the northeast corner has Mana Water x2 [bit7(0xa98796)].
// * Go back to the center of the room, then head north. At the fork, head west.
// * Use the Custom menu to learn/improve skills (if you haven't already), then save.
// * After saving, try leaving north and you'll encounter a boss.
//   - Hammerhead has 400 LF. You'll probably be Lv. 6.
//   - All three characters start the battle with a full Exhaust meter. Exhaust and Skill everyone for the first turn.
//     Continue to Skill and use Medicines on anyone below 25 LF.
// * Revisit the save point to restory your LF/MN.
// * Follow the hallway to the next room. After going around the rubble, you'll see a green crystal. This serves as
//   a checkpoint. Interact with it to open a portal between the 3F and the entrance.
// * You can't go down the west hall yet, so head east instead. Keep following the hallway north.
// * In the next room, head west, then fight stuff until you reach level 7. 
//   - This will refill your EX guage, as well as improve your stats for the next fight.
//   - If you've already reached level 7, make sure your LF is full and your MN is at least half.
// * Head south to fight another Hammerhead.
//   - You may not have an Exhaust meter this time, but otherwise the strategy is the same.
// * Open the chest for Nano Aid x2 [bit6(0xa98796)].
//   - You'll probably want to go back to the save point to restory your LF/MN, then return here.
// [Save 2 - Lv8 2h03 - Lv7 1h28]
// * Go back to the last room and west to fight another Hammerhead.

achievement("Head-banging", "Defeat the three Hammerheads on the third floor of Tokyo Tower Inverted", 
    points = 5, type="progression",
    trigger = current_location() == location_tokyo_hall_inverted_3F && 
              bit7(0xa98758) == 1 && bit6(0xa98758) == 1 &&
              (prev(bit7(0xa98758)) == 0 || prev(bit6(0xa98758)) == 0)
)
    
// * Return to the exit point and leave the tower. Then return to Shinjuku Shelter.

// ----- Shinjuku Shelter -----
// * Go into the hospital (first door) and Rest at the bed. This restores your LF and MN, but also replenishes any 
//   limited use skills you may have used.
// * Leave the hospital and enter the next door to the right.
//   - Watch a cutscene and learn the Revive Technique [Party Skill].
// * Talk to the girl at the back of the room for a Medicine. Upgrade your weapons and restock your Medicine.
// * Go back to Tokyo Hall Inverted 3F

// ----- Tokyo Hall Inverted 3F -----
// * Head west down the hallway that you couldn't go down earlier and jump into the hole.

// ----- Tokyo Hall Inverted 4F -----
// * Go south, then east through the next room.
//   - Now, you can see the dragons patrolling. Sneak up behind it and attack! It's another Hammerhead.
// * Head north and around to a chest containing Heal Aero I x2 [bit2(0xa98797)]
// * Go back to the main room, then south. Gatou will call you.
// * Move south through the next room and follow the hallway to a chest containing 150 Az [bit0(0xa98797)].
// * Return to the last large room and head west, where you'll encounter another patrolling Hammerhead.
// * Go west down the hallway for a chest containing Ozonol x4 [bit1(0xa98797)].
// * Go back to the last room and then south. Nav 3.7 will call you.
// * Step through the glowing door.

// ----- Tokyo Hall Inverted Floating Reef -----
// * Walk to the lower left, then Jump across the abyss. 
//   - Keep progressing and jumping until you reach the big island with the guard.
// * Jump right, then right again for a chest containing Heal Aero II x1 [bit7(0xa98797)].
// * Jump back to the last platform, then north. across several more platforms until you can get back into the building.

// ----- Tokyo Hall Inverted 11F -----
// * Head north to the intersection.
// * At the end of the west hall is a Paras Guard [bit4(0xa98797)].
// * Go back to the intersection, then east to deliver the gear to the guards.
// * Behind the guards is the exit point. Activate it.
//   - If you need to rest, you can teleport out and go back to the shelter.
//   - NOTE: you actually have to rest in the shelter. Touching a blue save point does not restore your LF/MN.
// * Keep heading east to encounter a new dragon. Salamander has 280 LF.
// * Grab the chest beyond where he was for an SP Up 100 [bit6(0xa98797)].
// * Go west and then north back to the main room.
// * Keep going north.
// * At the intersection, head west and kill another Salamander.
// * Behind it is a chest containing Heal Aero II x2 [bit3(0xa98797)].
// * Return east through the intersection and kill another Salamander.
// * Go north, then around to the north side of the room for a chest containing Guard Ring x1 [bit5(0xa98797)].
// * Go back through the center of the room and west down the long hallway.
// * Jump into the hole at the end.

// ----- Tokyo Hall Inverted 12F -----
// * Head south into the main room. A guard will tell you Gatou is on the roof.
// * Keep heading south to the save point to rest.
// * Go back to the previous floor and grind to level 11.
// * Upgrade your skills and save. Then jump into the hole.
// [Save 3 - Lv11 3h25 - Lv11 2h36]

// ----- Tokyo Hall Inverted Roof -----
// * Gatou doesn't want any help, but we're going to help anyway.
//   - Wounded Warcry has 1200 LF.
//   - Hopefully your Exhaust meters are full again. Feel free to use them!
//   - If you have Decoy Mirror, keep it active.

achievement("Rescue Mission", "Save Gatou and Nagare from Wounded Warcry", points = 5, type="progression",
    trigger = bit_set_at_location(bit2(0xa98758), location_tokyo_hall_inverted_11F) ||
              bit_set_at_location(bit2(0xa98758), location_city_map)
)

// ===== Chapter 1.5 =====
// ----- City Hall 4F Murakumo Dorm -----
// * Step out into the hallway.
// * Press R and select 7F Meeting Room.

// ----- City Hall 7F Meeting Room -----
// * Follow the hallway around to the main room.
// * After the briefing, leave the room, then go to 1F Entrance.

// ----- City Hall 1F Entrance -----
// * Go to the center part of the room and talk to Miya behind the desk.
// * Go to the west side and upgrade your armor and weapons. Consider buying Poison Guards if you can afford it.
//   Feel free to sell any weapons/armor you're not using.
// * Use the Tokyo Map to go to Shibuya Flowersea

// ----- Shibuya Flowersea - Station Crossing -----
// * Kill the two Salamanders out front, then walk up the west path
//   - Take your time exploring this area. Feel free to run back to the city map and return to Your Room in City
//     Hall to rest.

// ----- Shibuya Flowersea - Dogenzaka -----
// * Kill the two Salamanders and the Chemical Dragon, then walk up the tree branch and open the chest containing 
//   Posionol x6 [bit6(0xa9879c)].
// * Go under the branch and see a man facing a dragon. Turns out it's just a group of monsters who are easy to kill.
// * Continue along the path to the next area.

// ----- Shibuya Flowersea - Upper Dogenzaka -----
// * Kill the Chemical Dragon. Continue down the hall and kill two more Chemical Dragons.
// * Proceed north and around the corner to a save point.
//   - As a general strategy, each time you find a save point, you should grind at least to the next level
//     because you can just step on the save point after each kill to fully restore your LF/MN.
// * In the northwest corner of the room with the save point is a chest containing 80Az [bit1(0xa9879d)].
// * Head south and save Yuki from a Salamander.
// * At the end of the southern hallway is a chest containing Mana Water x3 [bit0(0xa9879d)].
// * Go back to where you saved Yuki and head east into the next area.

// ----- Shibuya Flowersea - Dogenzaka -----
// * Approach two more survivors (Ino and Guchi), then kick their butt.
// * Open the nearby chest for Heal Aero II x2 [bit7(0xa9879c)], then head west into the next area.

// ----- Shibuya Flowersea - Lower Dogenzaka -----
// * Kill the Sumo Dragon and keep heading west until Nav tells you to examine the trash can. 
//   - Do so to rescue the Privy Man.
// * Head west a bit and kill another Sumo Dragon.
// * At the end of the path is a chest containing Venom Guard x1 [bit2(0xa9879d)]. Equip it!
// * Go back to the trash can, then north, and east to another save point.
//   - Grind to level 13.
// [Save 4 - Lv13 3h42]
// * Keep going east to the next area.

// ----- Shibuya Flowersea - Dogenzaka -----
// * After a short cutscene, you'll have to face another Sumo Dragon.
// * Key trigger [New People] is now unlocked.

story_achievement("Worth a Hundred Ordinary Troops", "Save Nami and Aoi at Shibuya Flowersea", 5,
                  location_shibuya_flowersea_dogenzaka, bit1(0xa9878a)
)

// * Use an Escape Kit and return to City Hall.

// ----- City Hall 1F Entrance -----
// * Go to the entrance for a short cutscene.
// * Go to the center part of the room and talk to Miya.
//   - Repair the Murakuma HQ and Laboratory. Meet Sharon.
//   - You'll end up back in your room.
// * Go back to the entrance and talk to Sharon. Accept both quests.
// * Go to the 6th floor Laboratory.

// ----- City Hall 6F Laboratory -----
// * Talk to Shibuki in the southeast room. She'll request you rescue 15 survivors.
//   If you talk to her again, she should tell you that you've rescued 4 so far.
// * Proceed into the right lower door and Natsume will ask you to seek out SKY members.
// * Go to the 5th floor Mirakuma HQ.

// ----- City Hall 5F Murakuma HQ -----
// * Enter the right lower door and talk to Masaki. You'll get 300SP each, and get new skills to unlock.
// * Leave City Hall and head to the Shinjuku Shelter.

// ----- Shinjuku Shelter -----
// * Walk up the hall to the northeast. Examine the glowing dot.
// * Leave and go to Shibuya Flowersea.

// ----- Shibuya Flowersea - Station Crossing -----
// * Go west. 
// * Follow the path past the second save point (to where you saved Nami and Aoi).
// * After a brief cutscene, fight a Green Tortoise (350LF). It should be easy.
// * Return to City Hall.

// ----- City Hall 1F Entrance -----
// * Talk to the woman near the save point to complete the "Look for Medicine" quest.

quest_achievement("Look for Medicine", 2, location_city_hall_entrance_1f, bit6(0xa986e8))

// * Talk to Sharon.

quest_achievement("Monsters in Shibuya!", 3, location_city_hall_entrance_1f, bit7(0xa986e8))

// * Return to Shibuya Flowersea.

// ----- Shibuya Flowersea - Station Crossing -----
// * Head up the eastern path to a new area

// ----- Shibuya Flowersea - To Shibuya -----
// * Defeat the Chemical Dragon.
// * Head northeast, then walk up the branch and rescue Colonel Shikishima.
// * Go back down and to the southwest and open the chest containing Poisonol x4 [bit4(0xa9879d)].
// * Proceed up the nearby branch. When it branches, head northwest first.
// * There's a chest there with 100 Az [bit5(0xa9879d)].
// * Head back to the branch and east around the curve. Then head southwest below the branches for another chest
//   containing Nano Aid x3 [bit3(0xa9879d)].
// * Go behind the last branch you decended to rescue Staff Chief Mikasa.
// * Proceed north, then east into the next area.

// ----- Shibuya Flowersea - Center Street [Lv12] -----
// * Head east, defeating the Salamander.
// * Keep going east. You'll run into Akira and Tao. It should be an easy fight for you.
// * Continue east to fight two more Chemical Dragons (the second will likely add to the fight before you finish
//   the first), then rescue a girl and open the chest containing Medicine II x2 [bit6(0xa9879d)].
// * Go back to where you fought Akira and Tao and head north.
// * Continue north past the intersection and go into the sewers. There's two chests there containing
//   Blind Guard [bit1(0xa9879e)] and SP Up 100 [bit0(0xa9879e)], and you can rescue Shirai.
// * Go back above ground and head east. Behind the Salamander is a chest containing Heal Aero I x3 [bit7(0xa9879d)]
//   and another survivor (Shino) to rescue.
// * Head all the way west to save point, then north to fight Ino and Guchi. Another relatively easy fight.
// * Behind them is a chest containing Escape Kit [bit2(0xa9879e)].
// * Go back to save again, then head north and west into the next area.
// [Save 5 - Lv15 6h31 - Lv15 5h02]

// ----- Shibuya Flowersea - To Shibuya -----
// * After a few steps, you'll find a group talking. Daigo and Neko attack you.
//   - Daigo has 1020 HP. Neko has 780.
//   - But it doesn't really matter. After three rounds, Takehaya interrupts, so just have everyone Guard.

story_achievement2("There's Too Much to Explain Right Now", "Meet Takehaya in the Shibuya Flowersea", 5,
                   location_shibuya_flowersea_to_shibuya,
                   location_city_map, 
                   bit1(0xa98841)
)

// ----- City Hall - 1F Entrance -----
// * Go to the center part of the room and talk to Miya.
//   - Repair Residential A
// * Talk to Sharon (the other lady behind the desk) and accept the "Find a Lost Woman" quest.
// * Go to "My Room" and rest.
// * Examine the table to receive a bento box from your Navi assistant.
//   - These boxes will appear from time to time. If you collect enough of them, you can have
//     unique interactions with the senders in the lounge.
// * Go to floor 8.

// ----- City Hall Residential A -----
// * Talk to the privy man just west of the elevator.
// * Talk to Nagare's wife in the right room to learn Stealth I [Party Skill].
// * In the southeast corner of the floor, you can buy a First Aid Pack I from the forlorn girl
//   and a Pharma Set from the crafty woman.
// * Leave (to Tokyo Map), then go back to Shibuya Flowersea.

// ----- Shibuya Flowersea -----
// * Take the left path and keep going to Lower Dogenzaka (where the second save point is).
//   Instead of going up to the second save point, head west to the dead end.
// * Talk to the lost woman. You'll arrive back at City Hall.

// ----- City Hall -----
// * Go to Residential A and talk to the privy man to learn the Exit skill [Party Skill].

quest_achievement("Find a Lost Woman", 3, location_city_hall_residential_a_hall, bit0(0xa986e9))

// * Go to "My Room" and rest, then leave and go to the subway.

// ----- Kokubunji Subway, Subway Offshoot -----
// * Head southeast and collect the Blinol x5 [bit0(0xa987a3)].
// * Head north for an earthquake and a brief cutscene.
// * Continue north and kill the Little Dragon.
// * Keep heading north, staying on the left side of the derailed subway train.
// * Open the chest for 90az [bit1(0xa987a3)].
// * Go around the derailed train and north into the next area.

// ----- Kokubunji Subway, Nakano Station -----
// * After a brief cutscene, return south to the Offshoot, then east into the next area.

// ----- Kokubunji Subway, Offshoot Area A -----
// * Head south as soon as you can to fight another Little Dragon.
// * Just behind it is a Camo Tool x2 [bit4(0xa987a3)].
//   - Reminder: if you need to rest, you can use the Exit skill and go back to City Hall.
// * Go back to the first fork, and head east to fight another Little Dragon.
// * Jump into the giant hole.
// * Head west, then north to fight two more Little Dragons.
// * Head east and open a chest containing Nano Aid x3 [bit4(0xa987a3)].
// * Head all the way west and rescue Private Kamachi.
// * Go back to the room where the two Little Dragons were and head south. Jump into the hole.
// * Head south into the next area.

// ----- Kokubunji Subway, Offshoot Area B -----
// * You'll quickly run into another Little Dragon.
// * Then head east to face a Granderodon.
//   - It has 600HP and is conciderably harder than a Little Dragon.
//   - It will start the third turn with an AoE attack that hits everyone for ~30HP. 
//     Make sure to keep everyone topped off as he'll do a lot of damage in one round and then use the AoE in
//     the next round without the chance to heal in between.
// * Behind it is Private Makita.
// * Return to the previous area.

// ----- Kokubunji Subway, Offshoot Area A -----
// * Head west to face another Granderodon.
// * Behind him is a chest containing Medicine II x3 [bit6(0xa987ae)].
// * Head south into the next area.

// ----- Kokubunji Subway, Offshoot Area B -----
// * You'll quickly run into another Little Dragon.
// * Behind it are two big holes. Jump into the left one.
// * Head east a bit and jump into another hole. Open the chest for an SP Up 100 [bit7(0xa987a3)].
// * Go back to the two big holes and jump into the right one.
// * Head south for another earthquake and another Little Dragon.
// * Head east to a fork, then north to a chest containing Mana Water x2 [bit0(0xa987a4)].
// * Return to the fork, restore your LF/MN, then head east to fight another Granderodon.
// * Keep going east past the next fork to a chest containing Heal Aero II x2 [bit1(0xa987a4)].
// * Go back to the fork and head north to fight another Little Dragon.
// * Walk around the big hole and head west to rescue the Charming Woman.
// * Go back and jump in the big hole.
// * Open the nearby chest for Escape Kit x1 [bit2(0xa987a4)]
// * Head north into the next area.

// ----- Tokyo Underground, Offshoot Area A -----
// * Head north and you'll find Private Sasuga being attacked.
// * Defeat the Granderodon

story_achievement2("Subway Salvation", 
    "Rescue the missing SDF people in the Tokyo Underground Offshoot", 10,
    location_tokyo_underground_offshoot_area_a,
    location_tokyo_underground_offshoot_area_b,
    bit2(0xa986be)
)

// * Leave (use the Exit skill) [30 Dragons defeated].
// * Re-enter.

// ----- Tokyo Underground, Nakano Station -----
// * Go north to Nakano Station.
// * After another cutscene, head all the way south out of the subway.
// * Another earthquake and a cutscene and you'll be back at City Hall.

// ----- City Hall, Unit 13's Room -----
// * Rest, and you'll get another cutscene. 

// ===== Chapter 2 =====
// * Check the table in the room for a note from Natsume (and some Makunouchi)
// * Go down to the main Entrance and rebuild the Industrial Area
//   - There's new equipment for sale at the armory (left side of entrance).
// * After upgrading your equipment, talk to Sharon and pick up the four new quests.
// [Save 6 - Lv16 ?? - Lv16 6h28]
// * Talk to the Toiling Plumber near the nearby plants.
//   - You'll get teleported to the sewers where you'll have to fight two groups of Tentacles.

quest_achievement("Plumbing Emergency", 2, location_city_hall_entrance_1f, bit6(0xa986e9))

// * Head up to 8F Residential A.
// * Talk to the Old Softy in the right room (man in blue).
//   - He wants you to collect two Warm Furs (from the badgers in the subway).
//   - Chances are, you already have them. Talk to him again, and when you hand them over, the quest is done!

quest_achievement("Blanket Shortage", 2, location_city_hall_residential_a_right_room, bit1(0xa986e9))

// * Enter the left room and talk to the ABC Manager.
//   - He wants you to retrieve stuff from his store in Shibuya.
// * Go to the Meeting Room on 7F. After a cutscene, you'll have access to Toshima Subway.
// * Step out of the room for another brief cutscene.
// * Head to Shibuya Flowersea.

// ----- Shibuya Flowersea -----
// * Take the left path to Upper Dogenzaka. 
//   - Just behind the save point is an interaction point that has a game console.
// * Go back to the entrance and take the right path to Center Street. 
//   - There's two interaction points to hit.
//   - The southern one has Juice. The northern one has Old Magazines.
// * Leave Shibuya and head to the Toshima subway.

// ----- Toshima Subway, Sewer -----
// * Walk across the bridge, north a bit, and down the stairs.
// * When you reach the next bridge, keep heading north and talk to the Bossy Scientist.
// * Go a bit south and open the chest containing Heal Aero II x3 [bit3(0xa987a9)].
// * Go back to the bridge we skipped earlier and cross it.
// * Head north, up some stairs and south a bit. Enter the glowing hallway.

// ----- Toshima Subway, Offshoot Area A -----
// * Head east until you reach another hole.
// * Just north of the hole is a Granderodon. Kill it.
// * Head north into the foggy area and kill the Little Dragon.
// * Go east for two chests containing Mana Water x3 [bit6(0xa987a9)] and Medicine II x3 [bit5(0xa987a9)].
// * At the south end of the room, talk to the Seafaring Man.
// * Go back and jump in the hole.
// * Head east and fight the Mad Bear.
//   - Mad Bear has 500 HP. His Chomp will do a lot of damage to you on the second turn, but if everyone is fully
//     healed going into the battle, you should survive it and kill him before he does anything else.
// * After a cutscene, head back to the hole and then south.
// * At the fork, go west. You'll end up back near the entrance.
// * Go down the stairs and grab the chest containing 120 Az [bit2(0xa987a9)].
// * Go back to the fork and head east. Jump in the hole.
// * Head north and fight two Little Dragons.
// * In the northeast corner of the room, talk to the Sickly Man.
// * Continue along the path into the next area.

// ----- Toshima Subway, Offshoot Area B -----
// * Walk into the fog and kill two more Little Dragons.
// * Follow the room as it curves around to the west. Eventually, you'll encounter Buntaro. Rescue him.
// * Defeat the Granderodon behind him and open the chest behind it for a Swift Ring [bit7(0xa987a9)].
// * Head southwest from where the Granderodon was and walk into the south wall.
//   Follow it east to a tunnel going south that doesn't appear on the map.
// * At the end of the tunnel is another Little Dragon and three chests:
//   - Nano Fix x2 [bit2(0xa987aa)], SP Up 100 x3 [bit1(0xa987aa)], and Body Guard x1 [bit0(0xa987aa)].
// * Go back to the foggy room and head east. Jump into the hole.
// * Defeat the Granderodon.
// * Follow the tunnel to a hole. There's nothing in it, so keep going. Jump in the next hole.
// * Head south and rescue the Cute Scientist.
// * Go back to the hole, then west into the next area.

// ----- Toshima Subway, Sewer -----
// * Go down the stairs, across the bridge and up the next stairs. 
// * Just to the south is a Spendid Steward. Talk to him.
// * Go north, cross another bridge and enter the next area.

// ----- Toshima Subway, Reservoir -----
// * Cross the room into the next part of the sewers.
// * Go forward and rescue Tetsu.
// * Leave by going up the ladder. Return to Tokyo City Hall.

// ----- Tokyo City Hall, Entrance -----
// [Save 7 - Lv18 9h28 - Lv17 7h22]
// * Talk to Miya and rebuild the barracks.
// * Talk to Sharon (quest giver) at the entrance.

quest_achievement("Monsters Underground", 3, location_city_hall_entrance_1f, bit3(0xa986e9))

// * Go to Residential Area A and talk to the ABC manager in the left room.

quest_achievement("Looters Wanted", 3, location_city_hall_residential_a_left_room, bit4(0xa986e9))

// * Go to 6F and talk to Shibuki to get the reward for saving 15 people: Cultivation Set 1

achievement("Cultivation Set 1", "Receive the reward for rescuing 15 people", 5,
    trigger = bit_set_at_location(bit5(0xa98841), location_laboratory_6f)
)

// * Go to SDF Barracks (3F).
// * In the northwest corner, talk to the guard to receive a Paras Cut.
// * Enter the left room and talk to Rin.
// * Go to your room and rest.
// * Go to Ikebukuro Railcage.

// ----- Ikebukuro Railcage, Yamate Station -----
// * Talk to Sergeant Ikoma, then proceed into the railcage.

// ----- Ikebukuro Railcage, 100m -----
// * Go north past the two downed guards and follow the curve around to rescue Tomiko.
// * Head into the middle and kill the two Hover Dragons.
// * Move to the northeast and up the spiral.

// ----- Ikebukuro Railcage, 200m -----
// * Take a few steps south for a brief cutscene.
// * Head east at the fork, then south to a chest containing Heal Aero II x2 [bit6(0xa987b5)].
// * Go west around the curve and destroy the Electrolaser.
// * Go back around to the guard that was blocking the laser.
//   - NOTE: There's a Tower Dragon patrolling the fork. It's a very hard fight that I recommend you should avoid for now.
// * Go just past the fork and attack the Hover Dragon just off the east edge. It will charge at you as you pass.
// * Go around the southern bend and north into the next fork. Continue east to draw the attention of another Hover Dragon.
// * Just past that (to the south) is a chest containing Poisonol x4 [bit7(0xa987b5)].
// * Step back and into the middle ring. A guard will distract an Electrolaser while you go destroy it.
// * Continue around the inner ring and take the northern path. It curves around to another Electrolaser.
// * Go back to the southeast and out to the outer bridge there. Watch for a patrol. It's another Tower Dragon
//   and should be avoided.
// * Head north for a cutscene. Then continue north and up the spiral.

// ----- Ikebukuro Railcage, Hub -----
// * Head south for another cutscene.
// * Go east at the fork and north to a chest containing Silver Water x1 [bit2(0xa987b6)].
// * Head south past the fork and fight a Hover Dragon.
// * Go back to the outer path and south a bit. There's a save point just to the east.
// * Hang around the save point and grind up to at least level 20.
// * Head southeast for a cutscene, leading into a battle with a Railgun.
//   - It's a fairly trivial fight, then there's another cutscene.
// * Take the exit and return to base

// ----- City Hall -----
// * After another cutscene, head to your room and rest.
// * Go back to the meeting room on 7F for yet another cutscene.
// * Leave city hall and return to the Ikebukuro Railcage hub.

// ----- Ikebukuro Railcage, Hub -----
// * Head north and you'll encounter a Thunder Dragon.
// * Behind it, to the east is a woman across a gap. Talk to her to rescue her (thoughtless woman).
// * Go west, and get jumped by a Hover Dragon.
// * Continue south and rescue Mishima to the east.
// * Go back to the fork, north, west, and south to a chest containing SP Up 100 [bit1(0xa987b6)].
// * Return to the exit portal, then head southwest to the save point to rest.
// * Return to the exit portal, then head east and southeast until you encounter another Thunder Dragon.
// * Follow the path behind it to the north and there's a chest just to the west containing 350Az [bit3(0xa987b6)].
// * Keep going north for another Thunder Dragon.
// * Behind it, go straight north and up the spiral to the next floor.

// ----- Ikebukuro Railcage, 400m -----
// * Head south for a cutscene.
// * Go east and south to the first laser.
// * Go north around the bend, then east at the inner loop to rescue a doting mother.
// * Go through the middle area and south some more (avoiding the Tower Dragon patrol).
// * Go west from the next "room" to a chest containing Heal Aero II x2 [bit4(0xa987b6)].
// * Go back to the room and south into the next area.

// ----- Ikebukuro Railcage, 400m Rim -----
// * Head due east to get ambushed by a Hover Dragon.
// * Go south at the fork, then east to rescue the American soldier John.
// * Go back to the fork, then east and north into the next area.

// ----- Ikebukuro Railcage, 400m -----
// * Go west and defeat the Electrolaser.
// * Go northeast and defeat a Thunder Dragon.
// * Go east into the next area.

// ----- Ikebukuro Railcage, 400m Rim -----
// * Open the chest for SP Up 200 x2 [bit2(0xa987b7)].
// * Head back into the previous area, then south into the next previous area, then west and north
//   back to the first area.

// ----- Ikebukuro Railcage, 400m -----
// * Go north, then east (avoiding the Tower Dragon patrol).
// * As you round the corner, there's another Tower Dragon patrol. When it goes north, take the east path.

// ----- Ikebukuro Railcage, 400m Rim -----
// * Head north and fight a Hover Dragon.
// * Collect the Mana Water x3 behind it [bit7(0xa987b6)].
// * Go south a bit and west into the next area.

// ----- Ikebukuro Railcage, 400m -----
// * After a brief cutscene, engage with the Electrolaser.
// * Go back through the previous two areas.
// * Dodge the Tower Dragon and step south. Let it go east, then head north all the way into the next area.

// ----- Ikebukuro Railcage, Zenith -----
// * After a brief cutscene, collect the Heal Aero III [bit0(0xa987b7)] and Nano Fix x2 [bit1(0xa987b7)].
// * Talk to the nearby electrical engineer Yashima to rescue them.
// * Activate the exit portal to open it up for later.
// * Then head east and up the spiral. There's a save point at top.
// [Save 8 - Lv22 11h06 - Lv22 9h27]
// * Head east into the next area.
// * Walk up the ramp and face the Jigowatt.
//   - Jigowatt has 3650 LF.
//   - When he starts charging, heal everyone. When he's "done" charging, have everyone defend.
//     Rail Charge hits everyone for like 90% damage, even if they're defending.

story_achievement("Railcage Overload", "Defeat Jigowatt", 10, 
                  location_ikebukuro_railcage_imperial_dragon, bit1(0xa98740))

// ----- City Hall -----
// * After a brief cutscene, leave the meeting room for another short cutscene.
// * Go to your room. Grab the bento boxes, then rest.
// * Go to the left room on the fifth floor.
// * Talk to your dispatcher to gain access to Shuto Expressway.
// * Leave and go to the Shuto Expressway.

// ----- Shuto Expressway -----
// * Head north for a cutscene and then a fight with Daigo and Neko.
//   - Take out Neko first. She's weak to fire.
// * Give the Med Supply to either Neko or Daigo.
// * After a short cutscene, you'll end up back at City Hall

// ----- City Hall -----
// * Enter the building and talk to Miya. Repair the clinic and Residential B.
// * Talk to Sharon and pick up the Rescue from a Cult and Ikebukuro Search Party quests.
// * Go to 2F clinic.
// * Talk to the doctor in the left room to learn Death Cut.
// * Enter the right room for a cutscene, then talk to Rin on the bed for another cutscene.
// * Rest in your room for another cutscene.

// ===== Chapter 3 =====
// * Grab more bento boxes, then go to Residential B.
// * Buy Gloom Cut from the calm girl and Blind Cut from the energetic lady.
// * Talk to Asami in the right room to advance the Cult quest.
// * Talk to the quiet lady at the back of the right room to advance the Search Party quest.
// * Enter the left room and talk to the salving senior to learn Out Hunting [Party Skill].
// * Go to the entrance, and then outside to the plaza.
// * Talk to Shiba (man in the middle of the road).
// * Head back inside. Talk to Sachi (near the bulletin boards on the right side).
// * Return to Residential B and talk to Asami in the right room.

quest_achievement("Rescue from a Cult", 2, location_city_hall_residential_b_right_room, bit5(0xa986e9))

// * Leave and go to Ikebukuro Railcage.

// ----- Ikebukuro Railcage, Entrance -----
// * Proceed to the 200m level and fight the first Tower Dragon we skipped.
//   - Tower Dragons jump every other turn. So attack as much as you can, then guard when they jump.
//     Try to heal and attack after they land so you can guard while they're in the air again.
// * There's another Tower Dragon in the southeast corner of the level.
// * Go up to the hub and through the southeast exit to an area we didn't explore earlier.
// * Defeat the first Tower Dragon.
// * Come around the half loop and head all the way south.
// * Go around another half loop for a chest containing Skytalon x1 [bit7(0xa97f4)]. Good Psychic weapon!
// * Go back through the half loop and west at the next branch.
// * Talk to the girlish man to save him.
// * Go north around the long half loop and fight another Tower Dragon.
// * Keep going into the next area.
// * Follow the path to the middle and kill another Tower Dragon.
// * Talk to the middle-schooler to rescue him.
// * Go all the way back to the hub floor, then up to 400m.
// * Go through the middle and kill the Tower Dragon patrolling the southwest part of the level.
// * Follow the path west for a chest containing Medicine III x2 [bit5(0xa987b6)].
// * Go to the east side of the level and fight the other Tower Dragon.
// * Recommend going back to the save point and grinding to at least Lv24. Save and return here.
// * Head east into the next area, north a bit and west back into the first area.
// * Defeat the Wyvern to rescue Miku.
//   - The Wyvern has 1500 LF and will do about 50% damage to two characters every turn.
//   - Hit it with EX powers and try to whittle it down while keeping everyone up.
// * You'll rescue Miku and be automatically transported back to City Hall.

// ----- City Hall -----
// * Go to Residential B right room and talk to the quiet lady to complete the quest.

quest_achievement("Ikebukuro Search Party", 5, location_city_hall_residential_b_right_room, bit7(0xa986e9))

// * Go to the entrance and repair the Diva room.
// * Go to the Diva room and talk to Miku.

achievement("Diva Mode", "Unlock Diva Mode", 2,
    trigger = bit_set_at_location(bit6(0xa98861), location_diva_room)
)

// * Go to your room and rest.
// * Go to the meeting room (7F) for another cutscene and access to Yotsuya Evernight.
// * Go to the entrance and get the Medicine Running Low, Look for a Book, and Yikes! Monster Mess quests.
// * Go to the clinic right room and give two Red Rabifangs to the nurse near Rin.
//   - Learn First Aid (M) [Party Skill]

quest_achievement("Medicine Running Low", 2, location_clinic_2f_sick_room, bit0(0xa986ea))

// * Go to the control room on 5F (left side) and search the bookshelf in the lower left.
// * Go to the meeting room (7F) and give the book to Kirino.

quest_achievement2("Look for a Book", 2, 
    location_meeting_room_7f_meeting_room,
    location_meeting_room_7f_meeting_room_renovated,
    bit2(0xa986e9))

// * Go to Residential A. Talk to the MANIC manager in the southwest corner.
// * Leave City Hall

achievement("Ikebukuro Railcage Cleansed", "Clear all the dragons in Ikebukuro Railcage", 10,
    trigger = bit_set_at_location(bit0(0xa98831), location_city_map)
)

// ----- Shibuya Flowersea -----
// * Go up the left side until you reach the second save point. A brief cutscene will occur, then you get
//   to fight three Feral Hawks, then a Chief Hawk.
// * Leave and return to City Hall.

// ----- City Hall -----
// * Return to the southwest corner of Residential A

quest_achievement("Yikes! Monster Mess", 3, location_city_hall_residential_a_hall, bit6(0xa986ea))

// * Leave and go to Yotsuya Evernight

// ----- Yotsuya Evernight -----
// * After a cutscene, talk to Aoi for Candy Bar x3
// * Proceed up the bridge.

// ----- Yotsuya Evernight, Graveyard Area 1 -----
// - No minimap here? Bah...
// * Keep moving north. Go to the side of the stairs and rescue the mechanic, Eri.
// * Now go up the stairs and attack the Dramselfly.
// * Go across the next bridge and examine the glowing yellow spot.
// * Head across the next bridge. There's a chest containing Nano Fix x2 [bit1(0xa987bc)] to the southwest.
// * Go east and loop around the building on the right for a chest containing Somanel x5 [bit2(0xa987bc)].
// * Go back and head west, across another bridge where you can kill another Dramselfly.
// * Keep heading west across another bridge. A chest on the south side has 400Az [bit0(0xa987bc)]
// * Then head north across a bridge and down the stairs to a save point.
//   - Grind everyone to level 26. Save.
//   - You have Out Hunting now, which will bring monsters to you, so you can just stand on the save point.
// * Go across the east bridge and fight the Destroyer Dragon.
//   - This is a tough fight, just keep everyone as healed as possible.
// * Go back to the save point to rest, then keep going east.
// * On the other side of the bridge you'll find a soldier just standing there. 
// * Talk to him, then follow him across the bridge.

// ----- Yotsuya Evernight, Graveyard Area 2 -----
// * Go across the north bridge and rescue Tatsuji.
// * Return south, then go east across four bridges into the next area.
// * After a brief cutscene, you have to fight three Zombie Soldiers.
//   - Use AE attacks on the first round, then clean up whatever is left.
// * You'll get teleported back to the entrance, where you'll finally be able to use the minimap.
// * Go across the bridge

// ----- Yotsuya Evernight, Graveyard Area 1 ----- 
// * North across the bridge. Up the stairs. East, North.
// * Loop around the rock wall and head west across two bridges, and north across a third.
// * Go down the stairs and rest at the save point.
// * Head east across several bridges into the next area.

// ----- Yotsuya Evernight, Graveyard Area 2 -----
// * Go east once and talk to the soldier. Kill it.
// * North across the bridge is an exit point. Claim it.
// * Head west and up the stairs.
// * Cross the north bridge and kill the Dramselfly.
// * Go west into the next area and kill two more Dramselflies.
// * Then open the chest for an SP Up 200 [bit5(0xa987bc)].
// * Return to the previous area, across the bridge and south.
// * Go east and defeat the Destroyer Dragon guarding the path.
// * Go across the bridge and examine the glowing yellow spot.
// * Go east into the next area.

// ----- Yotsuya Evernight, Graveyard Area 3 -----
// * Go across the east bridge for a chest containing Mana Water x3 [bit7(0xa987bc)]
// * Go back across the bridge and north.
// * Go up the stairs and east. Up another set of stairs and there's a save point.
// * There's a brief cutscene as you try to cross the bridge, and then you get ambushed by more zombies.
//   - Three fights in a row without a chance to heal in between.
// * Go east across another bridge and examine another glowing yellow spot.
// * Go south across a bridge, then down the stairs.
// * In the northwest corner is a chest containing Medicine III x2 [bit0(0xa987bd)].
// * Go across the western bridge and kill the Dramselfly.
// * Work your way around the southern part of the room and cross another bridge to arrive at a chest
//   containing Bloodgear x1 [bit6(0xa987bc)] (hacker weapon).
// * Go back to where the stairs were and wrap around the right side of the building and rescue the newscaster.
// * Cross the bridge to the east and fight the Destroyer Dragon.
//   - The path goes back to area 1, but it is near a save point. Suggest going east, then north to rest, then return.
// * Go north and up the stairs. Kill the Dramselfly, then another Destroyer Dragon.
// * Cross the bridge into a new area.

// ----- Yotsuya Evernight, Graveyard Area 4 -----
// * Go north across the bridge for a chest containing Heal Aero II x2 [bit2(0xa987bd)].
// * Go back to the south, then cross the east bridge and kill two Dramselflies.
// * Go north and open an exit.
// * Go around, down the stairs, and across another bridge.
// * Kill the damselfly. Step into the goo and kill the Destroyer Dragon.
// * Wander through the goo until you reach a yellow glowing spot. Examine it.
// * There's a chest against the western wall containing Crimson Tekk x1 [bit1(0xa987bd)] (destroyer weapon).
// * Go back through the goo and across the eastern bridge into a new area.
// * Climb the stairs and get a Death Guard from the chest [bit3(0xa987bd)].
// * Return to the previous area.
// * West across the bridge, up the stairs, then north across the next bridge.
// * Kill another Dramselfly, then get Somanel x4 from the chest [bit5(0xa987bd)].
// * Go east across the bridge and rescue a frail nurse.
// * Go east into the next area and rescue a celeb starlet.
// * Go back to the previous area and west across two bridges. Kill the Dramselfly.
// * There's a chest in the southeast corner containing Nano Fix x2 [bit4(0xa987bd)].
// * Defeat the Destroyer Dragon.
// * Go west into the next area.

// ----- Yotsuya Evernight, Moonlit Ramble -----
// * Go north, and west, north, west (to the marker).
// * Go east twice to the next marker.
// * Immediately turn around and go east to the next marker.
// * Go around the building for a chest containing Nano Fix x2 [bit1(0xa987be)].
// * Go up the stairs and north to a save point.
// * Go west to a new area and open a chest containing Blind Guard [bit3(0xa987bc)].
// * Go around the building and defeat another Destroyer Dragon.
// * Return to the previous area, grind to 30 and save.
// [Save 9 - Lv29 15h04 - Lv30 13h21]
// * Head north into the next area.
// * Step on the bridge and jump across the gap. Continue following the path until you engage the imperial dragon.
//   - Lore-A-Lua has 4500 LF.

story_achievement("Moonlit Massacre", "Defeat Lore-a-Lua", 10, 
                  location_yotsuya_after_moonlit_arena, bit5(0xa98743))

// ----- City Hall -----
// * Cutscene where you hand the sample to Natsume.
//   !! NOTE: 13 rescuable people disappear when moving into chapter 4. 
//   !!       If you haven't rescued them, you can't get the achievement for rescuing all 75 people.
//   !!       You should have 33 people rescued at this point.
// * Go to your room and grab the bento off the table, then rest.
// * Cutscene

// ===== Chapter 4 =====
// * Apparently, a lot of people disappeared. Head to the meeting room on 7F for another long cutscene.
// * You can buy a First Aid Pack 2 from the forlorn girl in the Residential A hallway.
// * You can buy an ingredients set from the crafty woman in the Residential A hallway.
// * Go to the entrance.
// * Repair the Power Room, Murakumo HQ, and Residential C. 
//   - You should also have exactly enough to repair The Industrial Area, which will let you buy upgraded equipment.
// * Get the "Help a Vehicle Search", "MIA", "Rescue from a Cult 2", and "Truth About Vanishing" quests
//   from Sharon.
// * Go to the 3rd floor. Talk to Private Tonami in the upper left hallway.
// * Talk to Rin in the left room.
// * Go to the Residence B (9F).
// * Buy the Stone Cut and Venom Cut from the women in the lower right hallway.
// * Talk to Asami (right room).
// * Go to Residence C (10F).
// * Buy the Cerberus (Psychic weapon) and Masamune (Samurai weapon) from the people in the lower right hallway.
// * Talk to Fujita (left room) to learn Stealth II [Party Skill].
// * Talk to Fujita again.
// * Go to the southeast corner of 6F and talk to Shibuki.

achievement("Cultivation Set 2", "Receive the reward for rescuing 30 people", 5,
    trigger = current_location() == location_laboratory_6f && bit6(0xa98841) == 1 && prev(bit6(0xa98841)) == 0
)

// * Go to the entrance and upgrade your weapons and armor.
// * Leave City Hall.

// ----- Yotsuya Evernight, Graveyard Area 2 -----
// * Go south and east into the next area.
// * Collect the Chaos Guard from the chest [bit4(0xa987bc)].
// * Return to the exit point.
// * Go up the stairs and across the bridge to the north.
// * Cross the bridge to the west to fight Tachibana (1800HP)
// * Return to the exit point. Leave and enter Graveyard Area 4.

// ----- Yotsuya Evernight, Graveyard Area 4 -----
// * Go around, then north across the next bridge.
// * Go west into the next area.

// ----- Yotsuya Evernight, Moonlit Ramble -----
// * Go north, then east into the next area.
// * Open the two chests for Survival Belt [bit7(0xa987bd)] and SP Up 300 x2 [bit0(0xa987be)].
// * Go back to the previous area, and west twice into a new area.
// * Rescue Lisa.
// * Go back to the previous area, north, and west into a new area.
// * Open the chest for 1000Az [bit6(0xa987bd)].
// * Leave.

// ----- Shinjuku Shelter -----
// * Talk to the gatekeeper. Pay the 5000Az.
// * Talk to the three believers, then talk to Asami. Learn SP Bonus [Party Skill].

quest_achievement("Rescue from a Cult 2", 2, location_shinjuku_shelter, bit6(0xa986f1))

// ----- Shuto Expressway -----
// * Head north to see some guards fighting something.
// * Defeat the Garbage Golem (1000HP).
// * You'll get teleported back to City Hall.

// ----- City Hall -----
// * Return to Tonami in the northwest corner of 3F.

quest_achievement("Help a Vehicle Search", 4, location_barracks_3f, bit4(0xa986ea))

// * Return to Rin in the left room on 3F.

quest_achievement("MIA", 2, location_barracks_3f_strategy_room, bit5(0xa986ea))

// * Go back to your room, collect the bento box, and rest.
// * Leave.

// ----- Kokubunji Subway, Entrance -----
// * Go all the way north until you encounter the sleeping dragon, then head east into Offshoot Area C.

// ----- Kokubunji Subway, Offshoot Area C -----
// * Go east a bit and rescue the frazzled aide.
// * Jump in the hole.
// * Jump in the next hole and collect Silver Water x2 from the chest [bit6(0xa987a4)].
// * Jump back in the hole and head west.
// * Rescue the Cub reporter.
// * Sneak under the train and open the chest for Heal Aero III x2 [bit2(0xa987a3)].
// * Keep moving northeast to return to Offshoot Area C.
// * Jump in the hole, and the next hole.
// * Head south and fight the Armanos.
// * Behind it are two chests: SP Up 300 x2 [bit5(0xa987a4)] and 600Az [bit4(0xa987a4)].
// * Go all the way back to the where you rescued the cub reporter and go east back into
//   Offshoot Area C.
// * Head north. After a brief cutscene, kill the Armanos.
// * Search the chest for Medicine III x2 [bit3(0xa987a4)].
// * Head down the hallway and defeat another Armanos.
// * Keep heading east and rescue Hamachi.
// * Jump in the hole.
// * Head west down the hallway and defeat another Armanos.
// * Head west into the next area.
// * Head south around the subway car, then north and rescue the mechanic, Iino.
// * Head north into the next area.

// ----- Kokubunji Subway, 3km -----
// * Head north and rescue Kouta.
// * Keep heading north into the next area.

// ----- Kokubunji Subway, 2km -----
// * Head north for a brief cutscene.
// * Keep heading north into the next area.

// ----- Kokubunji Subway, 1km -----
// * Keep going north for another cutscene.
// * Keep heading north into the next area.

// ----- Kokubunji Subway, Kokubunji Station -----
// * Go up the stairs and save.
// * Interact with the switch on the east wall.
// * Exit up the stairs.

// ----- Kokubunji Searsand, Desert -----
// * Head northwest and defeat the Snapdragon.
// * Keep going northwest for another Snapdragon.
// * On top of a little platform is a chest containing 1000Az [bit2(0xa987c3)].
// * Go northeast a bit for another Snapdragon and a chest containing a Khanjar [bit3(0xa987c3)] {Trickster dagger}.
// * Go north a little ways and rescue Nishiki.
// * Go back towards the entrance, then head east.
// * Work your way southeast around the bend and kill another Snapdragon.
// * Behind it is a chest containing Heal Aero IV x2 [bit0(0xa987c3)].
// * Go north around the bend and kill another Snapdragon.
// * Go straight east and rescue the Gamer Dude.
// * Just a bit north is another Snapdragon.
// * And behind it is a chest containing Golden Gun x1 [bit4(0xa987c3)] {Trickster gun}.
// * Go west (past the entrance to the next area) for a chest containing SP Up 500 x1 [bit1(0xa987c3)].
// * Now head north into the next area.

// ----- Kokubunji Searsand, Factory Front -----
// * Follow the path and there will be a quick cutscene.
// * When the path branches, go north into the next area.

// ----- Kokubunji Searsand, Factory Entrance -----
// * Head east for another cutscene.
// * Get ambushed by a Machine Dragon.
// * Go east through the southern hallway.

// ----- Kokubunji Searsand, Factory Area 1 -----
// * Follow the path until you engage another Machine Dragon.
// * In the northeast corner of the next platform is a chest containing Stonol x5 [bit5(0xa987c3)]
// * Follow the path until you engage another Machine Dragon.
// * Keep going for a cutscene that automatically moves you to the next area.
// * Go northwest into a new unlabelled area.
// * Go down the stairs and into the next area.

// ----- Kokubunji Searsand, Factory Area 1 Rear -----
// * Go south around the donut platform to fight a Stony Dragon.
// * Head west for a chest containing SP Up 200 x2 [bit0(0xa987c4)].
// * Go back to the donut platform and south, then west through several platforms to another donut.
// * Go west, then north to fight another Stony Dragon.
// * Behind it is a chest containing Silver Water x2 [bit7(0xa987c3)].
// * Head west and rescue the Lively Bartender.
// * Go north and a bit east to a chest containing Nano Fix x3 [bit6(0xa987c3)].
// * Go all the way west, then all the way south, then west into the next area.
// * Climb down the stairs and into the next area.

// ----- Kokubunji Searsand, Factory Area 1 -----
// * Kill the Hazard Dragon.
// * Go west and follow the path until you rescue the Taciturn Scientist.
// * Go back to where you entered this area, and enter the door just south of there.
// * Activate the elevator and you'll be back in Factory Area 2.

// ----- Kokubunji Searsand, Factory Area 2 -----
// * Head east, then south to unlock the Factory Area 2 exit and save.
// * Head east through the southern door.
// * Keep heading east to the donut platform, then kill the Stony Dragon on the northern bridge.
//   - These guys can petrify your characters.
//   - If you find them hard, grind a level or two back at the save point.
// * Go around the next donut platform and kill another Stony Dragon.
// * After the next donut platform is a cutscene. Then you have to fight a Hazard Dragon.
// * Head down the stairs and west into the previous area.
// * Around the corner, rescue an Otaku Scientist and open the chest for an Escape Kit [bit1(0xa987c4)].
// * Just a bit south is a Hazard Dragon, which gets you back to the save point to rest.
// * Go back to the area where you rescued the scientist, and enter the elevator.

// ----- Kokubunji Searsand, Elevator -----
// * Step forward and push the button.

// ----- Kokubunji Searsand, Dragon Fabrication -----
// * Loop around the right path to a chest containing SP Up 300 x2 [bit2(0xa987c4)].
// * Go back around and engage the Mechanical Dragons
//   - There are five in total. You'll be facing two at a time for most of this fight.
//   - Individually they're not that hard. Just use your anti-flying skills and keep healed.
// * Go up the right side of the room and rescue the Young Scientist.
// * Loop around the west path to a chest containing Heal Aero x3 [bit3(0xa987c4)].
// * Climb the ladder to the next area.

// ----- Kokubunji Searsand, Factory Area 3 -----
// * Unlock the exit, then head north.
// * Kill the Stony Dragon on the donut platform.
// * Head west and go down the ladder to a chest containing Nano Hope x3 [bit4(0xa987c4)].
// * Go back up the ladder and return to the donut platform.
// * Go east and down a ladder to a chest containing Heal Aero IV x3 [bit5(0xa987c4)].
// * Go back to the donut area.
// * Head north and kill three Hazard Dragons. Attack the back one first to minimize the
//   extra encounters.
// * Head west and rescue Mutsu.
// * Go back to the middle and head north (there's nothing east) and go up the ladder.
// * Equip Frost Guard/Frost cut gear.
//   - Grind to 38
// * Save, then head north for a cutscene and another battle.
// [Save 10 - Lv36 18h48 - Lv36 16h30]
//   - Daigo has 2000LF. Takehaya has 2300LF. Neko has 1800.
//   - The second turn, all three combine forces to do major damage. Have everyone guard.
//     They'll do it again on turn 5 if all three are still up.
//   - Have everyone use EX skills on Neko the first round, guard the second round,
//     then spend the next round or two recovering before going after Neko again.
//   - Once Neko is down, the fight becomes much easier and there's one less enemy doing
//     damage, and they can't do the combined forces attack any more.

story_achievement2("True Hunters", "Defeat SKY in Kokubunji Searsand", 10, 
                  location_kokubunji_searsand_factory_elevator4, 
                  location_kokubunji_searsand_factory_area_3b,
                  bit3(0xa986ca))

// * Go back to the save point to rest (and save).
// * Go back to the elevator and activate it.
// * Follow the path around to another save point.
//   - Equip Flame guards if you have them.
// * Then proceed into the next area.

// ----- Kokubunji Searsand, Nerve Center -----
// * Just approach the boss and kill it.
//   - Trinitro has 9000LF. 
//   - At about half health, he gains a regeneration every turn and a new skill that does ~50%
//     damage to the entire party (while still getting two attacks per turn).
//   - Around 25% health, he gets a bunch of buffs.

story_achievement("Molten Monstrosity", "Defeat Trinitro", 10, 
                  location_kokubunji_searsand_nerve_center, bit3(0xa98747))

// ----- City Hall -----
// * Rest in your room.

// ===== Chapter 5 =====
// * Go to the clinic (2F right room). There will be a cutscene and you'll be back in the hallway.
// * Go back in and talk to Neko and Daigo.
// * Go to the control room (5F left room).
// * Go into the research lab (5F right room). Talk to Masakito learn new battle skills.
// * Go to the entrance and repair Residential D, Baths, Skylounge, Industrial Area Lv.2 (if you haven't yet),
//   and Industrial Area Lv.3
// * Talk to Sharon and accept five new quests: A New Hero Emerges?, New Pathogen Alert!, For Delicions Food,
//   Monsters in Kokubunji!, and WRO Recruiting Day.
// * Go to the clinic (2F left room) and talk to the doctor.
// * Go to the barracks (3F) and try to enter the right room.
// * Actually enter the right room and talk to the woman.
// * Go to the dorms (4F) and enter the left room. Search the bento box to learn EXP Bonus [Party Skill].
// * Enter your room. Collect all the bento boxes for an invite to the Skylounge.
// * Go to Laboratory (6F). Save.
// * Talk to the passing scientist near the elevator. Choose to go to the roof.
// * Defeat the Metal Tanuki (2000HP).
// * Enter the left room. Give the virus sample to the man in the back left.
// * Exit the room and talk to Shibuki in the southeast corner.

achievement("Guardian Set", "Receive the reward for rescuing 45 people", 5,
    trigger = bit_set_at_location(bit7(0xa98841), location_laboratory_6f)
)

// * Go to 7F and talk to the Relief Org Chief in the northwest hallway.
// * On 8F (Residential A) you can buy First Aid Pack 3 and 4 from the Forlorn girl.
//   You can also buy SP Up 300x3 and a bento set from the Crafty woman.
// * Go to 9F and talk to Hibino in the left room. Choose the middle option.
// * In the southeast corner, you can buy a Chaos Cut from the calm girl.
//   You can also buy Sleep Cut from the energetic girl.
// * Go to 10F and talk to the chef in the northwest corner.
//   - You need a Top Bear Cut, but you should have several from the last dungeon.

quest_achievement("For Delicious Food", 2, location_city_hall_residential_c_hall, bit3(0xa986eb))

// * Enter the left room and talk to Coach Fujita.

quest_achievement("Truth About Vanishing", 5, location_city_hall_residential_c_left_room, bit7(0xa986ea))

// * Enter the right room and talk to Gouda. Choose the first option.
// * In the southeast corner, you can buy Fuma Shuriken (hacker weapon) from the Arrogant girl.
//   You can also buy Duel Knuckle (destroyer weapon) from the Plump man.
// * Go to 11F and talk to the girl in the middle of the northern hallway to learn Stealth III  [Party Skill].
// * In the southeast corner, you can buy Mind Guard from the Cheeky boy (equip it) and Tomoegozen
//   (samurai weapon) from the Pleasing Lass.
// * Talk to Hiroe in the right room. Choose the third option.

quest_achievement("WRO Recruiting Day", 2, location_meeting_room_7f, bit5(0xa986eb))

// * Go to the power room (15F) and talk to Private Yamada to get a Burn Cut.
// * Go to the baths (13F) and talk to the proprieter to learn Take It Easy [Party Skill].
// * Go to the skyloungue (14F) and talk to Rin.

achievement("Shut Up and Take It", "Get a bunch of food and an email address from Rin", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit5(0xa98820) == 0 && prev(bit5(0xa98820)) == 1    // Rin leaves
)

// * Talk to the bartender to learn EX Booster [Party Skill].

// * Equip any weapons/armor you may have bought from the residential floors.
// * Go to the armory (left side of entrance) and upgrade your weapons and armor.
//   - If you've been following the walkthrough, you should have a Chaos Cut, a Mind Guard
//     and a Status Guard. Equip them (if you haven't already). If not, but Chaos Guards
//     so everyone had Chaos protection for the upcoming Dragonflies.
//   - Also buy Body Guards.
// * Leave.
// * Go to Kokubuji Desert.

// ===== Kokubunji Searsand, Desert =====
// * Head to the far northwest corner of the desert to find a couple guards fighting a monster.
//   - Volcanic Turtle has 1200 life. This is an easy fight.
// * Go to Ikebukuo Railcage (Hub).

// ===== Ikebukuro Railcage, Hub =====
// * Go to the northwest corner and back one floor.
// * Work your way to the center ring and go north, where you'll find Himuro fighting a monster. It'll attack you.
//   - Sky Crab has 1200 life. This is an easy fight.
// * Go back up to the previous floor, and up again to 400m.
// * Head out the southwest exit, then go northeast back into the main area. You'll find Himuro has collapsed.
// * You'll end up back at City Hall.

// ===== City Hall =====
// * Talk to Sharon.

quest_achievement("A New Hero Emerges", 3, location_city_hall_entrance_1f, bit0(0xa986eb))

// * Go to the SDF Barracks (3F). Talk to the Quaking Woman in the right room.

quest_achievement("Monsters in Kokubunji", 3, location_barracks_3f_lounge, bit4(0xa986eb))

// * Go to Shibuya Flowersea - Miyashita Park

// ===== Shibuya, Miyashita Park =====
// * Talk to Guchi.
// * Go north, climb up the root and go south. Enter the manhole.
// * Open the chest for SP Up 500 x1 [bit5(0xa9879e)].
// * Rescue MP's son.
// * Go back outside and retrace your steps to the start of the root.
// * Then head north under the root and engage Tao and Akira.
// * After a custscene, return to City Hall and save.
//   - The upcoming Tyrannosaurus battle is a huge blocker. He hits twice per turn, often hitting everyone
//     for 40% damage with one of the attacks. I ended up grinding to 43 before I was comfortable fighting it.
// * Head west into the next area.
// * Go west and fight the Tyrannosaurus (2900 LF)
// * Head south at the intersection and kill a Dragonfly.
// * Continue around the corner and engage Kaku and Kimo.
// * Behind them is a chest containing 3800Az. [bit6(0xa9879e)].
// * Go back to the intersection and head west. Talk to Maki.
// * Continue into the next area.

// ===== Shibuya, Center Street =====
// * Open the chest for Silver Water x2 [bit4(0xa9879e)].
// * Go a bit more west and kill the Dragonfly.
// * Keep going west, then out the northwest exit.
// * Talk to Takehaya.
// * Return to the previous area and head south and west through the southern exit.
// * You'll quickly run into Neko fighting a monster.
//   - Sleepy Hollow has 80000 LF. You can't kill it. After a couple rounds, it will run away.
// * Continue east back to Miyashita street. (go to the marker)

// ===== Shibuya, Miyashita Street =====
// * Go north from the intersection and kill another Dragonfly.
// * Keep going north into the next area.
// * Head east and open the chest containing Somanel x5 [bit7(0xa9879e)].
// * Go back to the entrance area and then north to fight a Tyrannosaurus.
// * Continue north and rescue Yuri.
// * Open the nearby chest for Stop Guard x1 [bit1(0xa9879f)].
// * Go southwest to a save point.
//   - If you haven't already, grind to level 43 or 44.
// * Go north to a chest containing Heal Aero IV x2 [bit0(0xa9879f)].
// * Continue east and fight another Tyrannosaurus.
// * Follow the path and kill another Tyrannosaurus.
// * Continue into the next area.
// * Go forward a bit to rescue a Masseuse.
// * Then open the nearby chest for Nano Hope x2 [bit2(0xa9879f)].
// * Continue along the path for a cutscene.
// * Go back to the previous area.
// * Work your way to the save point, then open the grating.

// ===== Shibuya, Sewers =====
// * Talk to the nearby man to rescue him (Oga).
// * Head west a bit, then across the bridge.
// * Go east for a chest containing Heal Aero III x4 [bit3(0xa9879e)].
// * Go west, then up the ladder.

// ===== Shibuya, Dogenzaka =====
// * Follow the path to a Dragonfly. Kill it.
// * Kill the Tyrannosaurus to the north.
// * Leave east (through the southern branch).
// * You'll find Daigo fighting the Sleepy Hollow.
// - Fight it until it runs away again.
// * Loop around to the southern exit and enter the next area.
// * Kill the Dragonfly, then the Tyrannosaurus.
// * Use the save point and continue to the next area, killing another Dragonfly and
//   Tyrannosaurus on the way.
// * Unlock the exit point and go back to the save point to rest and save.
// [Save 11 - Lv42 23h22 - Lv45 20h53]
// * Proceed into the next area and open the exit gate.
// * Continue south to the area after that.
// * Here, you'll find Takehaya fighting Sleepy Hollow. And you join him.
//   - Now Sleepy Hollow only has 9000 HP.
//   - As long as you have confuse blocking items equipped, this fight is straightforward.
//   - The first turn he will try to confuse someone. Be ready to cure it.
//   - When he uses Gather Power (roughly every five turns), his next turn will be a sweeping
//     damage attack that has a high chance to confuse multiple people.

story_achievement("Flights of Confusion", "Defeat Sleepy Hollow", 10, 
                  location_city_map, bit7(0xa98832))

achievement("Shibuya Flowersea Cleansed", "Clear all the dragons in Shibuya Flowersea", 10,
    trigger = bit_set_at_location(bit5(0xa98830), location_city_map)
)

// ----- City Hall -----
// * Grab the bento boxes off the table, then head to the Meeting Room (7F).
// * Go to the entrance and repair the Industrial Area Lv.4, SKY Hangout, and Residential E.
// * Talk to Sharon and pick up the Teacher for Day, Paper Chase, Special Delivery, and
//   Stop Occult Violence quests.
// * Go to 5F Personnel Room (right room). Talk to Masaki about the secret arts [level 40+ to find monsters/mats].
//   - Samurai: Rabbit Type Zero in Kokubunji Factory Area 2 - come alone
//     - Make sure you have at least two levels in Battering Gale and six in Renki First Aid.
//     * Use the computer in My Room to remove the other characters from the party.
//     * Teleport to Kokubunji Searsand Factory Area 2. Head through the upper of the two nearest doors.
//     * Head all the way east, then north, then east to where the Rabbit Type Zero will be waiting.
//       - You may have to engage and escape from a dragon that we didn't get to earlier. There's also a person to
//         rescue, but we'll deal with both later.
//     * He has 1800 LF.
//     * Use Battering Gale any time you have more than half health. Otherwise use Renki First Aid or Medicines.
//       - Darksteel Breath may help, depending on how much you've invested in it.
//   - Trickster: Bring Iino these materials:
//     * Slimy Mucus from Toshima sewer
//     * Love Pollen from Shibuya
//     * Illusory Pollen from Kokubunji
//   - Destroyer: Tower Dragons in Ikebukuro 273m
//     * Go to Ikebukuro Railcage, Hub.
//     * Exit via the southeast hall.
//     * Head south and a Tower Draggy will engage.
//       - If you find it's hardly taking any melee damage, come back in a few levels. At 43, I would only hit for 1
//         damage with both my melee characters. At 53, I was hitting for ~200 with Forward Punch.
//   - Psychic: Buy Onyx Enigma from the Crafty Girl in the southeast corner of the Residential A hallway
//   - Hacker: Weekly Famitsu magazine. Find three in City Hall. Look for places where quiet people gather.
//     * Weekly Famitsu #1 is in the southeast corner of 5F
//     * Weekly Famitsu #2 is in the southeast corner of Power Room (15F)
//     * Weekly Famitsu #3 is in the empty bed in the right room of Residental Hall D (11F)
//     * Then talk to Iino in Industrial Area (13F).

achievement("The Secret Arts", "Unlock one of the hidden skills", 5,
    trigger = bit_set_at_location(bit6(0xa98779), location_kokubunji_searsand_after_factory_area_2b) || // Samurai
              bit_set_at_location(bit7(0xa98779), location_city_hall_industrial_area)                || // Trickster
              bit_set_at_location(bit0(0xa9877a), location_ikebukuro_railcage_273m)                  || // Destroyer
              bit_set_at_location(bit0(0xa9877a), location_ikebukuro_railcage2_273m)                 || // Destroyer
              bit_set_at_location(bit1(0xa9877a), location_city_hall_residential_a_hall)             || // Psychic
              bit_set_at_location(bit2(0xa9877a), location_murakumo_hq_5f)                           || // Hacker 1
              bit_set_at_location(bit2(0xa9877a), location_city_hall_power_room)                     || // Hacker 2
              bit_set_at_location(bit2(0xa9877a), location_city_hall_residential_d_right_room)          // Hacker 3
)

// * Go to Residential E (12F).
//   - Talk to the Serious Staffer in the southwest corner to learn Revive Technique II [Party Skill].
// * Go to Residential D (11F).
//   - Buy a Rogue's Band from the Cheeky Boy (2980Az)
//   - Buy the Iai Teachings from the Pleasing Lass (10000Az) [Lets Samurai start in Iai stance]
//   - Talk to the Collected Child in the left room.
// * Go to Residential C (10F).
//   - Buy a Venom Kukri from the Arrogant Girl (2620Az) [Trickster sword]
//   - Buy a Pocket Army from the Plump Man (3200Az) [Trickster gun]
// * Go to Residential B (9F)
//   - Buy a Stop Cut from the Calm Girl (1000Az)
//   - Buy a Frost Cut from the Energetic Lady (1500Az)
//   - Talk to Asami in the right room.
// * Go to Residential A (8F)
//   - Buy First Aid Pack 5 from Forlorn Girl (3000Az)
//   - Buy Onyx Enigma from Crafty Girl (2000Az) and learn Hidden Insight and Dark Invasion [Psychic Secret Technique]
//   - Buy SP Up 500 x3 from Crafty Girl (2000Az)
// * Talk to MP Ariake in the Meeting Room (7F) hall.
// * Go to the Laboraty (6F) and talk to the Sleepy Scientist (SE corner) to get some paper.
// * Go to the Strategy room on the SDF Barracks (3F) and talk to Rin.
// * Go to Residential D (11F) and talk to the Collected Child in the left room.
// * Go to the Clinic (2F) right room and listen to SKY.
// * Talk to Daigo

achievement("Quest: Paper Chase", "Complete the Paper Chase quest", 2,
    trigger = bit_set_at_location(bit7(0xa986eb), location_clinic_2f_sick_room) || // Ch. 5
              bit_set_at_location(bit7(0xa986eb), location_city_hall_sky_hangout) || // Ch. 6
              bit_set_at_location(bit7(0xa986eb), location_city_hall_skylounge) // guide says Daigo is here sometimes
) 

// * Talk to Guchi and Ino sitting on the benches in the middle of the room. Quickly defeat them.

quest_achievement("Teacher for a Day", 2, location_clinic_2f_sick_room, bit6(0xa986eb))

// * Go to Sky Hangout (14F) and talk to Akira to receive the Giant Medal.
// * Talk to Shino near the car.
// * Go to the southeast corner of Meeting Room (7F).

quest_achievement("Special Delivery", 2, location_meeting_room_7f, bit0(0xa986ec))

// * Go to the entrance (1F) and upgrade your equipment.
// * Go to Shibuya, Station Crossing

// ===== Shibuya Flowersea =====
// * Go east.
// * Climb up the root and down the left side.
// * Examine the glowing yellow thing.
// * Leave. Go to Yotsuya, Graveyard Area 4.

// ===== Yotsuya Evernight =====
// * Go south, then west into Graveyard Area 3.
// * Go south twice, then west across three islands to encounter Sachi and a Founder.
// * After a brief scene, you'll engage with the Dinosaurus.
//   - Dinosaurus has 3500 LF.
//   - He hits twice a turn for roughly half a character's health, so keep everyone topped off.

quest_achievement("Stop Occult Violence", 5, location_yotsuya_after_graveyard_3, bit1(0xa986ec))

// * Leave and return to City Hall

achievement("Yotsura Evernight Cleansed", "Clear all the dragons in Yotsura Evernight", 10,
    trigger = bit_set_at_location(bit2(0xa98831), location_city_map)
)

// ===== City Hall =====
// * Go to the Laboratory (6F) and talk to the Mad Scientist on the left side of the inner room.
// * Go to the Clinic (2F) and talk to the doctor in the left room to learn First Aid (L) [Party Skill]

quest_achievement("New Pathogen Alert", 3, location_clinic_2f_clinic, bit1(0xa986eb))

party_skills = [
    bit5(0xa9885f), // Out Hunting (salving senior) [City Hall Residential B]
    bit4(0xa9885f), // Stealth I (Nagare's wife) [City Hall Residential A]
    bit6(0xa9885f), // Stealth II (Fujita) [City Hall Residential C]
    bit7(0xa9885f), // Stealth III (girl in hallway) [City Hall Residential D]
    bit0(0xa98770), // Exit (privy man) [City Hall Residential A]
    bit1(0xa98770), // First Aid (S) (Gatou) [City Hall 3F hallway]
    bit0(0xa98860), // First Aid (M) (complete Medicine Running Low) [City Hall clinic]
    bit3(0xa98770), // First Aid (L) (complete New Pathogen Alert) [City Hall clinic]
    bit4(0xa98770), // Revive Technique (cutscene) [Shinjuku Shelter]
    bit5(0xa98770), // Revive Technique II (serious staffer) [City Hall Residential E]
    bit3(0xa98861), // Take It Easy (proprieter) [City Hall Baths]
    bit4(0xa98861), // EX Booster (bartender) [City Hall Sky Lounge]
    bit0(0xa98771), // EXP Bonus (bento box) [City Hall dorms]
    bit1(0xa98771), // SP Bonus (complete Rescue from a Cult 2) [Shinjuku Shelter]
]

achievement("Party On!", "Unlock all 14 party skills", 10,
    trigger = in_game() &&
              measured(sum_of(party_skills, s => s) == length(party_skills)) &&
              sum_of(party_skills, s => prev(s)) == length(party_skills) - 1
)

// * Go to the control room on Murakumo HQ (5F left). Talk to the Navis.
// * Go to to the northern hallway of Meeting Room (7F) and talk to the prime minister.
// * Go to My Room on 4F and get all the bentos.
// * Rest, then go to the Skylounge (14F).
// * Talk to Sharon to get a Corona and her email.

achievement("A Saikyo Tag Team", "Get an accessory and an email address from Sharon", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit0(0xa98821) == 0 && prev(bit0(0xa98821)) == 1    // Sharon leaves
)

// * Go to the Laboratory (6F) and talk to Kirino (NE corner). There should be a chain of four choices. If you get a
//   message about talking to people, make sure you've spoken to the Navis at Murakumo HQ, Rin at the SDF Barracks,
//   and SKY in the Clinic sick room.
// * Go to the Meeting Room (7F) for a long cutscene.

// ===== Chapter 6 =====
// * Leave, and go to Subway, Daiba.

// ----- Daiba Underground -----
// * Go down the nearby stairs, across the bridge, and north.
// * Reimi will be talking with Keima and some guards.
// * Go down the stairs on the east side and continue all the way north to rescue Kawakami.
// * Go south to the colorful tunnel and enter it.
// * Continue east a bit and kill a Dragonfly.
// * Rescue Ishizawa and open the nearby chests for 3000Az [bit1(0xa987b0)] and 500Az [bit2(0xa987b0)].
// * Return to the previous area and head south to the next colorful tunnel and enter it.
// * Kill the Hammerer [2600LF].
// * Jump in the pit and head east. Kill another Hammerer.
// * Proceed to the intersection and repair the wiring.
// * Open the chest in the southern alcove for Heal Aero III x4 [bit0(0xa987b0)].
// * Go back to the pit and jump into it.
// * Head east to another pit and jump into that.
// * Follow the path and kill a Dragonfly.
// * At the end of the east tunnel is another junction to repair, and a chest containing Somanel x5 [bit7(0xa987af)].
// * Go back and follow the south tunnel to another pit. Jump into it.
// * Go north and rescue Kihada.
// * Go west and kill the Hammerer.
// * Continue west into the next area.
// * Use the save point.
//   - Grind to 46.
// * Cross the bridge and head south to a chest containing Heal Aero IV x2 [bit4(0xa987af)].
// * Go north and kill a Shield Dragon [2800LF].
// * Revisit the save point to rest.
// * Continue north into the next area.
// * Head north, across the bridge, south down the stairs and across the next bridge.
// * To the north is a chest containing Silver Water x2 [bit6(0xa987af)].
// * Go back across the both bridges and continue north down some more stairs.
// * Cross another bridge, then enter the northern tunnel.
// * Kill a Hammerer, then open the chest behind it for SP Up 300 x2 [bit1(0xa987b1)].
// * Return to the previous area and enter the southern tunnel.
// * Go forward a bit and kill another Dragonfly.
// * The east tunnel forks. Rescue Sengoku from the lower fork and get the Medicine III x4 from the chest
//   in the upper fork [bit0(0xa987b1)].
// * Go back to the room and head north. Jump in the pit.
// * Head north and kill a Hammerer.
// * Follow the southeast tunnel to rescue a Stuffy Scientist.
// * Go south through a tunnel not visible on the map.
// * Open the two chests for Heal Aero IV x3 [bit2(0xa987b1)] and Hypno Crystal x1 [bit3(0xa987b1)].
// * Go back to where you killed the last Hammerer and kill another one just a bit north of there.
// * Go southwest and kill a Dragonfly.
// * Go back to the main area. Continue north, then take the southeast passage to another junction.
// * Open the nearby chest for Miracle Meds x1 [bit4(0xa987b1)].
// * Follow the north wall to the west and jump in another pit.
// * Repair the last junction then unlock the exit.
// * Proceed west into the next area.
// * Go south, cross the bridge, and south some more. Rescue Rumi.
// * Go north and defeat the Shield Dragon.
// * Cross the bridge and save.
//   - If you're close to 48, grind to it. If not, make sure you're at least 47.
// * Head north into the next area.
// * Attack the Scaber's tail.
//   - The tail has 4000 LF. Just use your normal abilities and heal.
// * Go back to the save point to rest.
// * Go back to the reservoir and head west. Attack the Scaber's body.
//   - The body has 3600 LF. Another mediocre fight.
// * Go back to the save point and rest, 
// [Save 12 - Lv47 27h01 - Lv48 23h43]
// * Return all the way to the front and attack the Scaber's head.
//   - The head has 10000 HP, but no special attacks. Just keep hacking at it.
//   - This is a great opportunity to play with your new EX-Special attacks.
//     Try to space them out, as they sometimes overlap.

story_achievement("A Segmented Siege", "Defeat Scaber", 10, location_city_map, bit3(0xa98833))

achievement("Tokyo Underground Cleansed", "Clear all the dragons in Tokyo Underground", 10,
    trigger = bit_set_at_location(bit4(0xa98831), location_city_map)
)

// ----- City Hall -----
// * Go to 7F Meeting Hall for a quick cutscene.
// * Go to the entrance and accept the Seeking Lab Materials, Unofficial Business, and Fairytale Lost quests.
// * Upgrade Industrial Area to Lv. 5.
// * Go to your room (4F), collect the Bento, and rest.
// * Go to the Skylounge and talk to Daigo.

achievement("As Strong as Steel", "Get some equipment and an email address from Daigo", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit7(0xa98820) == 0 && prev(bit7(0xa98820)) == 1    // Daigo leaves
)

// - The Bare Knuckle is a fist weapon and the Steel Soul is an armor. Both are restricted to Destroyers.
// * Go to the control room on Murakumo HQ 5F (left side) and talk to Navi.
// * Go to the Laboratory(6F) and talk to Shibuki.

achievement("Colorful Set", "Receive the reward for rescuing 60 people", 10,
    trigger = bit_set_at_location(bit0(0xa98842), location_laboratory_6f)
)

// - The Nail Bat is a Samurai Sword.
// - The Lolly Dagger is a Trickster dagger.
// - The Grenadine is a Trickster gun.
// - The Hammerhead is a Destroyer weapon.
// - The Gold Record is a Hacker weapon.
// * Go into the main laboratory room, and talk to the Top Scientist (middle north).
// - You probably already have Energy Crystals from killing White Jellies in Daiba, so talk to him again.

quest_achievement2("Seeking Lab Materials", 3,
                   location_city_hall_sample_cases, location_city_hall_laboratory_chx, bit2(0xa986ec))

// - Totally Up is an accessory that raises EXP and SP gain by 20%
// * Check the computer in the northwest cubicle.
// * Go back to the control room on Murakumo HQ 5F (left side) and talk to Navi.

quest_achievement("Unofficial Business", 2, location_murakumo_hq_5f_control_room, bit2(0xa986eb))

// * Go to Residental D and talk to the Bookstore Clerk in the right room. Ask about "Nestor & Oak".
// * Go to the 7F meeting room and talk to Kirino.

quest_achievement2("Fairytale Lost", 2, 
    location_meeting_room_7f_meeting_room_renovated, 
    location_meeting_room_7f_meeting_room, bit3(0xa986ec))

// * Go back to your room and collect more Bento boxes.
// * Go to the Skylounge 

achievement("Ask Me Whatever", "Get some armor and an email address from Kirino", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit1(0xa98820) == 0 && prev(bit1(0xa98820)) == 1    // Kirino leaves
)

// * Go back to your room and collect more Bento boxes.
// * Go to the Skylounge 

achievement("Let Me Know How They Taste", "Get some snacks and an email address from your Nav operator", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              ((bit3(0xa98820) == 0 && prev(bit3(0xa98820)) == 1) || // Navi leaves
               (bit2(0xa98820) == 0 && prev(bit2(0xa98820)) == 1))   // Mina leaves
)

// - Sober Slacks are hacker armor.

// * Go to Residential E
//   - Buy a Dragon Egg from the OG Scientist (30000Az). It'll be useful for the final boss.
//   - Buy Miracle Aero x2 from Suspicious man (10000Az)
// * Update your equipment, then go to the first floor and buy any upgrades still available.
//   - You should have two Frost Cuts. Equip them.

// ----- Daiba Icepack #13, Entrance -----
// ===== Chapter 7 =====
// * Jump down and enter the cave.

// ----- Daiba Icepack #13, Entrance Plaza -----
// * Move forward, then head west to fight an Enshentas.
//   - Enshentas has 2500 LF.
// * Behind it, hiding under the frozen shack, is a Soldier's Son to rescue.
// * There's another Enshentas on the east side of the room. Kill it too.

// ----- Daiba Icepack #13, Avenue 1F -----
// * Move north and rescue Miyoshi in the first room.
// * There's a save point on the west side.
// * Kill the Blizzasaurus in the next hallway (2550LF).
// * Kill another Blizzasaurus in the northern hallway.
// * Keep going north into the next area.

// ----- Daiba Icepack #13, Center Plaza -----
// * Kill the Enshentas on each side, then talk to Natsume in the middle.
// * Go back to the previous area and head east into the next area.

// ----- Daiba Icepack #13, Avenue 2F -----
// * A Blizzasaurus will walk by. Kill it.
// * Head south and around the donut for a chest containing Frost Guard x1 [bit4(0xa987c9)].
//   - Equip it. Your other two characters should already have Frost Cuts.
// * Head north into the next area.

// ----- Daiba Icepack #13, Avenue 3F -----
// * Loop around and head south to rescue Boss Carpenter.
// * Stand on the red dot and jump into the hole.

// ----- Daiba Icepack #13, Avenue 1F -----
// * Open the two chests for Dragon Dew x1 [bit6(0xa987c8)] and Escape Kit x2 [bit7(0xa987c8)].
// * Kill the nearby Cornarodon.
// * Hit the save point, then go slightly west, north, and all the way east back to 2F and north back to 3F.

// ----- Daiba Icepack #13, Avenue 3F -----
// * Loop around and head west to kill a Blizzasaurus wandering the hall.
//   - Ignore the nearby dragon guarding a wall for now.
// * Head west and north to a chest containing SP Up EX x1 [bit6(0xa987c9)].
// * There's a chest to the south containing Miracle Aero x1 [bit7(0xa987c9)].
// * Now go back and kill the dragon. It's a Cornarodon (3120LF).
// * Jump into the hole behind it.

// ----- Daiba Icepack #13, Avenue 2F -----
// * Kill the nearby Cornarodon.
// * Head west around the first donut and jump into the hole for the second one.
// * Head south and east back into Avenue 2F.
// * Proceed around the corner and jump in the hole.

// ----- Daiba Icepack #13, Avenue 1F -----
// * Kill the nearby Cornarodon. Quickly save at the nearby save point, then come back.
// * In the southeast corner of the room is a chest containing Heal Aero III x3 [bit0(0xa987c9)].
// * Head west into the next area.

// ----- Daiba Icepack #13, West Street -----
// * In the southwest corner of this room is a chest containing Heal Aero IV x2 [bit5(0xa987c8)].
// * Go around the corner and kill the wandering Enshentas.
// * A bit further down the hall, rescue Ken.
// * Kill another Enshentas, and then talk to Natsume.
//   - She'll take off and leave you to fight a Freeze Dragon (5200HP).
// * Go back to the previous area.

// ----- Daiba Icepack #13, Avenue 1F -----
// * Save, then head west into the next area.

// ----- Daiba Icepack #13, Avenue 2F -----
// * Follow the path into the next area, killing the Blizzasaurus along the way.

// ----- Daiba Icepack #13, Avenue 3F -----
// * Kill the Blizzasaurus, then head west.
// * Open the chest containing Hoshime (Samurai sword) [bit5(0xa987c9)].
// * Rescue the nearby Miserly Man, then head back down the hallway to the east.
// * Turn north and jump in the hole.

// ----- Daiba Icepack #13, Avenue 2F -----
// * Head south and kill a Blizzasaurus.
// * Open two chests for Silver Water x2 [bit2(0xa987c9)] and Hypno Crystal [bit3(0xa987c9)].
// * Rescue the nearby Baseball Fan and jump in the hole.
// * Hit the save point, then head straight west back to 2F.
// * Continue following the path back to 3F.

// ----- Daiba Icepack #13, Avenue 3F -----
// * Go north, east, south, and east to find another Blizzasaurus.
// * Go east and down the stairs into the next area.

// ----- Daiba Icepack #13, Avenue 2F -----
// * Open the chest containing Berserk [bit1(0xa987c9)] (psychic weapon).
// * Rescue the nearby Cheerful Athlete.
// * Jump into the hole.

// ----- Daiba Icepack #13, Avenue 1F -----
// * Rescue the nearby Akino, then kill the nearby Cornarodon.
// * Go to the save point, then come back here and east into the next area.

// ----- Daiba Icepack #13, East Street -----
// * Grab the Heal Aero IV x2 from the nearby chest. [bit4(0xa987c8)]
// * Head north to kill the Enshentas.
// * Follow the path to kill another Enshentas.
// * Go north some more and talk to Natsume. She leaves you to fight another Freeze Dragon.
// * Go back to the save point.
//   - Grind to level 53.
// * Then head north into Center Plaza.
 
// ----- Daiba Icepack #13, Center Plaza -----
// * Continue north into the next area.

// ----- Daiba Icepack #13, Fountain Plaza -----
// * Step forward and confront Natsume.
// * When she's done talking, proceed around the fountain to find an exit point.
// * Activate it and continue north.
// * Make sure everyone is using Frost Guards and/or Frost Cuts.
// * Save at the save point and advance to the next area.
// [Save 13 - Lv53 29h27 - Lv53 25h49]

// ----- Daiba Icepack #13, Glacial Depths -----
// * Engage the Imperial Dragon Zero-Blue!
//   - Zero-Blue has 16500 LF.
//   - Use your first turn buffing yourself. As soon as you start attacking, he uses blizzard.
//   - On your second turn, use your EX+Secret powers.
//   - After the third round, you'll start taking freeze damage every turn. Have someone using group heals
//     even if it doesn't look like you need to.
//   - Continue to beat on it normally, making sure to keep everyone healed each turn.
//   - If your EX gauge refills, feel free to use your EX+Secret powers again.

story_achievement("Frozen Fiend", "Defeat Zero-Blue", 10, location_city_map, bit4(0xa98833))

achievement("Daiba Icepack #13 Cleansed", "Clear all the dragons in Daiba Icepack #13", 10,
    trigger = bit_set_at_location(bit5(0xa98831), location_city_map)
)

// ----- City Hall -----
// * After handing over the sample, you'll be back in your room.
// * Rest.

// ===== Chapter X =====
// * Go to the Meeting Room (7F).
// * Go to the entrance and renovate the Murakumo Dorm, Murakumo HQ, Sky Hangout, Skylounge, and Industrial Area.
// * Talk to Sharon and accept the A Message from SKY, Favor from Unit 13, Assistance Required,
//   Medicine for a Pal, and Rescuer Rescue quests.
// * Go to the clinic (2F) sickroom (right room) and talk to Ino or Guchi.

quest_achievement("A Message from SKY", 2, location_clinic_2f_sick_room, bit4(0xa986ec))

// * Go to the Strategy Room (left) on 3F SDF Barracks. Talk to Private Saneda.
// * Go to Murakumo Hall (4F) and get the EXP Up G from the hard worker in the north hallway.
// * Go to Murakumo HQ (5F) and talk to Masaki in the Personel Room (right) to learn new battle skills.
// * Go to the Meeting Room on 7F. Talk to MP Ariake in the SE corner of the hallway.
// * Go to the Skylounge and talk to the bartender to get a Mind Booster (accessory).
// * Go to the SKY Hangout and Sui should immediately talk to you.
// * Talk to Akira to get a Tough Medal.
// * Walk right and talk to Sou.
// * Go to the southwest room and talk to Hari.
// * Go to the Laboratory (6F) and talk to Emille (girl in red).
//   - You should already have a Snow Tusk (from Snow Boar) and Slender Petal (Daiba subway), so talk to her again.

quest_achievement("Assistance Required", 3, location_city_hall_laboratory_chx, bit6(0xa986ec))

// * Talk to the Calm Scientist (just to Emille's right).
// * Go to the Meeting Room on 7F. Talk to MP Ariake in the SE corner of the hallway.

// ----- Yotsuya Evernight, Graveyard Area 4 -----
// * Go down the nearby stairs and examine the glowing ball.
// * Leave

// ----- Kokubunji Searsand, Factory Area 3 -----
// * Go north to the donut, then east. 
//   - The Killhorn Dragon has 4100LF.
//   - The easiest way to win is to have everyone use their EX+Secret skills, but they may still be exhausted from
//     the last boss battle.
//   - Otherwise, it Gathers power on the first turn and does massive damage on the second.
//     If you have everyone Guard on the second turn, they'll likely survive, but be stunned.
// * Exit, and re-enter at Factory Area 2.
// * Go through the northern of the two nearest doors and head straight east into a Stony Dragon.
// * Just east of the dragon, rescue the Surveyor.
// * Leave.

achievement("Kokubunji Searsand Cleansed", "Clear all the dragons in Kokubunji Searsand", 10,
    trigger = bit_set_at_location(bit3(0xa98831), location_city_map)
)

// ----- Daiba Icepack #13, Fountain Plaza -----
// * Go south twice to Avenue 1F.
// * Head a bit east and defeat the Bandit Bears. They have 1300LF each.
//   - You'll be teleported back to City Hall.

quest_achievement("Rescuer Rescue", 4, location_city_hall_entrance_1f, bit0(0xa986ed))

// ----- City Hall, Your Room -----
// * Collect the bento and rest.
//   - Takehaya will visit.
// * Go to the Skylounge.
// * Talk to Emille.
//   - Kingsguard is an accessory that blocks 55% of all status effects. Equip it on someone!

achievement("Pen and Paper", "Get an accessory and an email address from Emille", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit2(0xa98821) == 0 && prev(bit2(0xa98821)) == 1    // Emille leaves
)

// * Go to the Laboratory on 6F and talk to Calm Scientist near the tablets.
// * Go to 7F and talk to Aitelle outside main room.
// * Talk to MP Ariake in the SE corner.
//   - You'll be teleported to the SKY hangout.
// * Talk to Sou at the north end of the SKY hangout.

quest_achievement("Medicine for a Pal", 4, location_city_hall_sky_hangout, bit7(0xa986ec))

// * Go to your room and collect the Flag Bento.
// * Go to the Skylounge.
// * Talk to Aitelle. Amemurakumo is a samurai sword.

achievement("Human Lives Can Be Fleeting Things", "Get a weapon and an email address from Aitelle", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit1(0xa98821) == 0 && prev(bit1(0xa98821)) == 1    // Aitelle leaves
)

// * Return to 7F and talk to MP Ariake again.

quest_achievement("A Favor for Unit 13", 3, location_meeting_room_7f, bit5(0xa986ec))

// * Go back to My Room and get the Fried Bento.
// * Go to the Skylounge.
// * Talk to Neko. Kittyclaw is a psychic weapon. Kitty Parka is a psychic armor.

achievement("You Wanna Be Friends with Me?", "Get some gear and an email address from Neko", 3,
    trigger = current_location() == location_city_hall_skylounge && 
              bit6(0xa98820) == 0 && prev(bit6(0xa98820)) == 1    // Neko leaves
)

// * Equip all your new gear, then go to 1F and buy (and equip) any upgrades (there probably won't be any).
// * Go to the Meeting Room on 7F.
// * Another cutscene, and you'll be back on the city map.

// ----- Tokyo Tower, Front -----
// * After the cutscene, enter the elevator.

// ----- Tokyo Tower, Viewing Deck 1F -----
// * Head east. Just south of the guard is a chest containing Heal Aero III x4 [bit6(0xa987ce)].
// * Go north and around to rescue Yoshida.
// * Go back to the first room and then follow the hallway south.
// * Eventually, you'll reach another room, where you can kill the Aegis Dragon [3800LF].
// * Go through the door.
// * In the next room, you'll have to kill three Microdragons [1550LF each].
// * Go north and up the spiral staircase.

// ----- Tokyo Tower, Viewing Deck 2F -----
// * Head north and rescue the flashy woman.
// * Open the nearby chests for Hypno Crystal x1 [bit6(0xa987cf)] and a Pescado [bit5(0xa987cf)].
//   - Pescado is a trickster knife, but not as good as the AAA Victory.
// * Go back downstairs.

// ----- Tokyo Tower, Viewing Deck 1F -----
// * Go south and follow the hallway around and north to a Dragonlord [4080LF].
// * Behind it, rescue Takano.
// * Head east and open the chests for Hypno Crystal x1 [bit1(0xa987cf)], 3500Az [bit0(0xa987cf)],
//   Stealth Jet x1 [bit2(0xa987cf)] (psychic/hacker armor), and Dragon Dew x3 [bit7(0xa987ce)].
// * Go back to where you fought the Dragonload and head east into another room.
// * Talk to Rin.
// * Go into the next area and up the stairs.

// ----- Tokyo Tower, Viewing Deck 2F -----
// * Open the chest in the northeast corner for Silver Water x3 [bit3(0xa987cf)].
// * Head west and kill the Dragonlord in the hallway.
// * West is a dead end, so head south.
// * Head west from there to fight another Dragonlord.
// * Then go south to a chest containing Heal Aero IV x3 [bit4(0xa987cf)].
// * Go north and east until you come to a fork in the hallway heading south. Take it.
// * In the next room, you'll have to kill three more Microdragons.
// * West is another dead end, so head south.
// * After another cutscene, you can save.
//   - Grind to lv. 56.
// * Go through the door and up the stairs.

// ----- Tokyo Tower, Viewing Deck 3F -----
// * Follow the hallway west. Step south to fight a Dragonlord.
// * Continue south, then west to fight a wandering Dragonlord.
// * Go south and kill the two Microdragons.
// * Continue south where you'll find Daigo.
// * Head east and kill the Criminal Dragon [6000LF].
//   - Note that Stop Guard/Cut doesn't work against Criminal Dragon's seal.
// * Continue north and up the stairs.

// ----- Tokyo Tower, Viewing Deck 4F -----
// * Head south and west to fight a roaming Criminal Dragon.
//   - You can sneak up on this one to get an extra turn before he breaks his shackles.
// * Go south and kill the Aegis Dragon.
// * Head southeast, then north and into the next area.

// ----- Tokyo Tower, Viewing Deck 3F -----
// * Go all the way south to open chests containing Vajra [bit7(0xa987cf)] and SP Up EX x2 [bit0(0xa987d0)].
//   - Vajra is a hacker weapon, but not as good as Dreamcast.
// * Return to 4F.

// ----- Tokyo Tower, Viewing Deck 4F -----
// * Go south, west, and north back to a room.
// * Head west, then north. Kill another wandering Criminal Dragon.
// * Go all the way west, then south to an Aegis Dragon.
// * Keep going south to fight another Criminal Dragon.
// * In the room south of there, open a chest containing Miracle Meds x4 [bit1(0xa987d0)].
// * Return to the previous room and head east for a cutscene.
// * Activate the escape point and return to city hall.

// ----- City Hall, Laboratory 6F -----
// * Talk to Shibuki in the southeast corner of 6F.

achievement("Final Showdown Set", "Receive the reward for rescuing 75 people", 10, type="missable",
    trigger = bit_set_at_location(bit1(0xa98842), location_laboratory_6f)
)

// * Go to your room and rest.
// * Go to the entrance and repair everything remaining.
// * Make sure to buy the best armor and weapons available
// * Talk to Prime Minister in the hallway on floor 7F for a Skill Up G.
// * Return to Tokyo Tower.

// ----- Tokyo Tower, Viewing Deck 4F -----
// * Go into the next area and up the stairs for a brief cutscene.

// ----- Tokyo Tower, Dragon Perimeter -----
// * Save
//   - If you haven't made it to Lv.58 yet, go back to 4F and grind.
//   - Equip frost resistant gear if you've switched it out.
// [Save 14 - Lv58 31h15 - Lv59 29h11]
// * Go around the west side and talk to Mizuchi.
// * Dragoness Mizuchi has 20000LF.
//   - Use your EX secret skills on the first turn.
//   - Switch to your standard attack patterns and healing on the second turn.
//   - Around every 6 turns , she uses Gather Power. Have everyone defend.
//   - Just keep attacking until she dies.

story_achievement2("It Was All for Nothing", "Defeat the Dragoness", 10,
                  location_tokyo_tower_dragon_perimeter,
                  location_tokyo_tower_dragon_perimeter2,
                  bit1(0xa9875a))

// * Open the nearby chest for a Cool Jacket [bit6(0xa987d1)] - samurai armor.
// * Go back and save, then return and climb the stairs.

// ----- Tokyo Tower, Dragon's Domain X -----
// * Head north to a chest containing Optical Camo x3 [bit2(0xa987d0)].
// * Go back south, then west. Stand below the dragon to draw it to you. Dracoprism has 2700LF.
// * Follow the path west as it turns north.
// * Kill the Cannon Dragon [2200LF] on the platform.
// * Head east and open the chest containing Dragoon [bit3(0xa987d0)] - trickster gun.
// * Go back to the platform where you killed the Cannon Dragon and head north. Get jumped by another Dracoprism.
// * Go north for two chests: Heal Aero IV x3 [bit4(0xa987d0)] and Hypno Crystal x1 [bit5(0xa987d0)].
// * Go back to the previous platform, then east.
// * Keep going east and get jumped by another Dracoprism.
// * At the fork, continue east and kill a Cannon Dragon.
// * Then head south for a chest containing SP Up EX x3 [bit6(0xa987d0)].
// * Go back to the fork, then head north and west for a quick taunt.
// * Continue into the next area.

// ----- Tokyo Tower, Dragon's Domain Y -----
// * Go north and kill the Cannon Dragon.
// * Go west until you reach a chest containing Assault Suit [bit7(0xa987d0)] (fighter armor).
// * Return to the first platform and head north.
// * Go north and get jumped by another Dracoprism.
// * Kill a Cannon Dragon on the next platform.
// * Go north and kill the Criminal Dragon.
// * Follow the path east for two chests: Diablerie [bit0(0xa987d1)] and Dreadskull [bit1(0xa987d1)].
//   - Dreadskull is a destroyer weapon and Diablerie is trickster armor.
// * Go all the way west for a Status Guard [bit2(0xa987d1)].
//   - Equip this on someone.
//   - You should now have two characters with Status Guard, and one with Kingsguard.
// * Go back to the platform where you killed the Cannon Dragon.
// * Go south and kill the Dracoprism.
// * Continue along the path until the Mysterious Voice calls you again.
// * Proceed up the stairs into the next area.

// ----- Tokyo Tower, Dragon's Domain Z -----
// * Go up the west path for a chest containing Miracle Aero x3 [bit3(0xa987d1)].
// * Go back to the first platform, then north to the next platform.
// * Go east for a chest containing Hypno Crystal x3 [bit4(0xa987d1)].
// * Return to the previous platform, then go north and kill the Cannon Dragon.
// * Follow the path around the corner and kill the Aegis Dragon.
// * Keep going south and kill a Dragonlord.
// * Head southwest to a chest containing Dragon Egg x1 [bit5(0xa987d1)].
// * Go east and kill the Criminal Dragon.
//   - The Dracoprisms may join the fight. If they do, they're generally easier to kill than the Criminal Dragon.
//   - If they don't join the Criminal Dragon fight, you have to fight on the nearby bridge and Guard until they
//     join the fight with some random enemy. They won't approach you directly.
// * The next platform has a save point in the northeast and an exit portal in the south.
// * Use the exit portal. [190 dragons defeated]

achievement("Tokyo Tower Cleansed", "Clear all the dragons in Tokyo Tower", 10,
    trigger = bit_set_at_location(bit6(0xa98831), location_city_map)
)

// * Go back in, and save.
//   - Grind to 63.
// [Save 15 - Lv61 33h08 - Lv63 30h39]
// * Go up the stairs. The mysterious voice will talk again.
// * Continue up the spiral into the next area.

// ----- Tokyo Tower, True Dragon's Lair -----
// * Continue up the spiral to the top.
// * The True Dragon Niara has 30000LF.
//   - Use your EX secret skills on the first turn.
//   - Use your buff skills on the second turn.
//   - On the third turn, have two characters use Dragon Eggs and the third heal.
//   - Switch to your standard attack patterns and healing on the second turn.
//   - At 50%, Niara will lose all debuffs and switch up its attacks. (?? It also make you lose all your buffs??)
//   - Use your EX secret skills again.
//   - Three turns later, it will charge for two turns, then use Meteor 2020.
//     That instantly kills anyone who isn't guarding, so when you see it gather power, use the next
//     turn to fully heal everyone, and guard on the turn after it.
//     If you have a hacker, this is a great time to use their EX secret skill.
// * There will be a cutscene where Takehaya wounds Niara.
//   - Niara comes back with 20000LF. Luckily, you get full LF/MN/EX.
//   - You also get three turns to do whatever you want while it tries to charge and use Meteor 2020 again.
//     But it won't work.
//   - Use your EX secret skills on the first turn.
//   - Then just keep hitting him with your strongest attacks.

story_achievement("How Truly Vexing", "Defeat the True Dragon", 25,
                  location_tokyo_tower_true_dragons_lair2, bit2(0xa9875a), type="win_condition")

// ----- City Hall, Clinic -----
// * Feel free to visit with everyone.
// * When you're ready to proceed, go to the 7F Meeting Room.
// * After the credits roll, save your game.
// [Save 16 - Lv62 33h49 - Lv64 31h12]
// * Return to the menu and load the game you just saved.
// * Leave city hall to find a new place on the map. Go there.

// ----- Illusory Capital, City Hall -----
// * Walk forward and talk to Emille and Aitelle.
// - If you've killed all the dragons, you'll have the 20Dz required to enter.
// * Inside, feel free to talk to the ghosts of fallen comrades.
// * When you're ready, step into the glowing circle.

// ----- Illusory Capital, Ikebukuro Railcage -----
// * The basic enemies here are weaker versions of the guardians in previous areas.
// * The guardians are stronger versions of the guardians from previous areas.
// * Go south and fight the Tower Dragon V [3500LF].
// * Work your way to the center and fight the Thunder Dragon V [5076LF]
// * Head north and fight the wandering Tower Dragon V.
// * Keep going north, then west to a chest containing Paras Cut x1 [bit2(0xa98871)].
// * Go back to the center, then south to fight another Thunder Dragon V.
// * Head west, then follow the southern path to a chest containing Miracle Aero x3 [bit3(0xa98871)].
// * Turn around and head north to kill the wandering Tower Dragon V.
// * Keep moving north and examine the glowing sphere.
// * Save at the save point.
//   - Go back through the portal and grind to 66. gh the portal and kill stuff until they are.
// [Save 17 - n/a - Lv66 31h50]
// * Equip anti-paralysis gear, save at the save point, then approach the boss.
//   - Illusory Charger is Lv.65 and has 23000LF.
//   - This fight is similar to Niara. Guard when he charges two turns in a row.

achievement("Illusory Charger", "Defeat the guardian of the illusory Ikebukuro Railcage", 10,
            bit_set_at_location(bit6(0xa9875b), location_ikebukuro_railcage_imperial_dragon))

// * Proceed forward and get Hellblade Azot [bit4(0xa98871)] and Sacred Georg [bit5(0xa98871)] (trickster weapons).
// * Go back to save/rest.
// * Enter the glowing orb to proceed to the next area.

// ----- Illusory Capital, Yotsura Evernight -----
// * Go north, then west, to kill a Destructigon V [5148LF].
// * Go south and kill the Dramselfly V [4400LF].
// * Then go west and north to a chest containing Miracle Aero x2 [bit7(0xa98871)].
// * Loop back around and head north to kill another Dramselfly V.
// * Head east for a chest containing SP Up EX x3 [bit6(0xa98871)].
// * Head all the way west, killing another Dramselfly V and a Destructigon V along the way.
// * Use the glowing circle.
// * Climb up the platforms. Save.
//   - Go back and grind to Lv.69.
//   - Equip curse resistant gear (you're probably already wearing the best stuff - Status Guard/Kingsguard).
// * Save, then approach the boss.
// [Save 18 - n/a - Lv69 32h35]
//   - Illusory Empress is Lv.68 has 22000LF.
//   - She is very fast and will almost always attack before you. Plan to heal even if you don't need to.

achievement("Illusory Empress", "Defeat the guardian of the illusory Yotsura Evernight", 10,
            bit_set_at_location(bit4(0xa9875c), location_yotsuya_moonlit_arena))

// * Get the All Guard [bit0(0xa98872)]. It protects against all statuses 100% (upgrade to Status Guard).
//   Equip it on your healer.
// * Go back and save/rest.
// * Enter the glowing orb.

// ----- Illusory Capital, Kokubunji Searsand -----
// * Head southeast and kill the Stony Dragon V [4437LF].
//   - Stony dragons can turn you to stone. Consider equipping Stone Cuts.
// * Keep heading southeast and make the Ferver Dragon V appear [4437LF].
// * More southeast is another Stony Dragon V.
// * South a bit more is a chest containing Burn Cut x1 [bit1(0xa98872)].
//   - This will be useful against the next boss.
// * Now go northeast to kill another Stony Dragon V.
// * To the east is a chest containing Hypno Crystal x4 [bit2(0xa98872)].
// * Head north and fight another Ferver Dragon V.
// * Use the glowing circle.
// * Rest at the save point. Go back and grind to lv73, then return.
// * Equip flame resistant gear (Burn Cuts). Save, then approach the boss.
// [Save 18 - n/a - Lv73 33h71]
//   - Illusory Gold is Lv.70 and has 25000LF.
//   - When he uses Heat Charge, have everyone guard and hope to go before it does.
//   - Try to keep Decoy Mirror up as it can absorb the Heat Breath and you can mass Cure on the
//     turn he uses it.

achievement("Illusory Gold", "Defeat the guardian of the illusory Kokubunji Searsand", 10,
            bit_set_at_location(bit2(0xa9875d), location_kokubunji_searsand_nerve_center))

// * Open the chest containing Ragnarok [bit3(0xa98872)] - psychic weapon.
// * Go back and save/rest.
// * Enter the glowing circle.

// ----- Illusory Capital, Shibuya Flowersea -----
// * Equip Confuse resistant gear (Chaos Guard/Cut, All Guard).
// * Head south and west and kill the Dragonfly V [4500LF].
// * Go all the way north to a chest containing SP Up EX x3 [bit4(0xa98872)].
// * Return to the previous room and head west to kill another Dragonfly V.
// * In the next room, kill the Dinosaurus V [5292LF] guarding the gate.
// * Follow the path around the corner and kill another Dragonfly V.
// * Proceed east, and open the chest for Dragon Dew x5 [bit5(0xa98872)].
// * Then kill the nearby Dinosaurus V.
// * In the next room, talk to Aitelle, then enter the glowing circle.
// * NOTE: there's no save point at this boss, but there is an exit portal. When you're ready to save, exit and return
//         to City Hall.
//   - Grind to Lv.76.
// [Save 19 - n/a - Lv76 34h51]
// * Return to Illusory Shibuya, and approach the boss.
//   - Illusory Dream is Lv.72 and has 26000 LF.
//   - When he uses Gather Power, have everyone guard. He'll hit everyone for ~60% damage, then one person for another 40%.

achievement("Illusory Dream", "Defeat the guardian of the illusory Shibuya Flowersea", 10,
            bit_set_at_location(bit0(0xa9875e), location_shibuya_flowersea_station_crossing))

// * Open the chest containing Amenoohaba [bit6(0xa98872)] - samurai weapon.
// * Find somewhere to save/rest.
// * Enter the glowing circle.

// ----- Illusory Capital, Tokyo Underground -----
// * Go west and fight the Little Dragon V [3395LF].
// * Go north and kill the Shield Dragon V [5700LF] guarding the gate.
// * Proceed north and jump into the hole.
// * Continue north to the large chamber, then west to a chest containing Miracle Aero x2 [bit0(0xa98873)].
// * Go back to the chamber and north to face a Shield Dragon V and two Little Dragon Vs.
//   - This fight is very taxing. To make it slightly simpler, just keep using Escape and re-engage until you're
//     only fighting a Little Dragon - the Shield Dragon won't join, so you just have to fight the two Little
//     Dragons. Then you can fight the Shield Dragon separately.
//   - If you don't want to try this tactic, have everyone guard on the second turn. When the Little Dragon arrives
//     it does a lot of damage. Then use an EX Secret skill on it and kill it as quickly as possible. Repeat with
//     the other Little Dragon, then worry about the Shield Dragon.
//   - It's probably still worth using an EX Secret Skill on the first Little Dragon, as even the two of them are
//     hard. If you can knock it out before the second joins, you can take a breather and rest between them, but I
//     didn't have much luck getting the second one by itself, so it's probably best to let it join, and just kill
//     it with the first. If you do get stuck with the second and the Shield Dragon, kill the second, then escape
//     and rest before tackling the Shield Dragon.
//   - The Shield Dragon by itself isn't anything you haven't fought before.
// * At the end of the east hallway is a chest containing Stop Cut x1 [bit7(0xa98872)].
// * Go all the way west and jump into the hole.
// * Talk to Emille.
// * Continue west and enter the glowing circle.
// * Collect the Mirrored Coa [bit2(0xa98873)]  (Psychic/Hacker armor)
//   and Megaton Fist [bit1(0xa98873)] (Destroyer weapon) from the chests.
// * Equip Stop Guards and Poison Guards and save.
//   - Grind to level 79 (and make sure your EX gauges are charged).
// [Save 20 - n/a - Lv79 35h43]
// * Save again and approach the boss.
//   - Illusory Insetoi is Lv. 75 and has 27000LF.
//   - It seems to be weak to Blind.
//   - When he uses Thrash Head, you'll be bombarded when rocks in two turns. Use the next turn to heal, then guard.
//   - Just space out your EX skills and keep everyone healed.

achievement("Illusory Insectoi", "Defeat the guardian of the illusory Tokyo Underground", 10,
            bit_set_at_location(bit6(0xa9875e), location_tokyo_underground_sewers_reservoir))

// * Save
// * Enter the glowing circle on the west end.

// ----- Illusory Capital, Daiba Icepack #13 -----
// * Go west, and north and kill the Blizzasaurus V [6100LF].
// * North and east to a chest containing SP Up EX x3 [bit3(0xa98873)].
// * Head west all the way and south to kill a Cornarodon V [6600LF] guarding a gate.
// * Behind it is a Frost Cut [bit4(0xa98873)].
// * Head north and kill the two Blizzasauruses wandering the hallway.
// * Continue north and east and kill a Cornaodon V guarding a gate.
// * Talk to Aitelle.
// * Enter the glowing circle.
// * Equip Frost Cuts/Guards and Save.
//   - Grind to 81 and charge your EX gauge.
// [Save 21 - n/a - Lv81 36h24]
// * Save again and approach the boss.
//   - Illusory Azure is Lv. 78 and has 28500LF.
//   - At 2/3 health, he'll start using Blizzard. It's an AE attack that hits everyone for ~60 damage each turn for
//     the next three turns (often before you get any actions - like healing).
//     Have anyone with less than half health guard, and whoever is left cast Cure or use Heal Aero items.
//     Anyone with more than three quarters health can still attack if they're not healing.

achievement("Illusory Azure", "Defeat the guardian of the illusory Daiba Icepack #13", 10,
            bit_set_at_location(bit4(0xa9875f), location_daiba_icepack_glacial_depths))

// * Collect the Duel Suit [bit5(0xa98873)] (Samurai/Trickster/Destroyer armor) from behind it.
// * Save
// * Enter the glowing circle.

// ----- Illusory Capital, Tokyo Hall Inverted -----
// * Head east down the hallway. Follow it south, then west until you run into a Salamander V [4896LF].
// * Go all the way west to a chest containing SP Up Ex x3 [bit6(0xa98873)].
// * Return to the intersection and head south into the room. Kill the Hammerer V [5760LF].
// * Go east and south to a chest containing Miracle Aero x2 [bit7(0xa98873)].
// * Continue down the west hallway to kill a Salamander V.
// * Keep going west, then north back to the big room, where you can kill another Hammerer V.
// * Down the west hallway is another Salamander V.
// * Head south and talk to Emille.
//   - There's a big jump in this boss's level. That means additional grinding. Get to level 89.
// * Enter the glowing circle.
// * Equip Burn Cuts/Guards and Save.
// [Save 22 - n/a - Lv89 38h08]
// * Approach the boss.
//   - Illusory Bellow is Lv.85 and has 32000LF.
//   - He alternates between Searing Firesphere and Giga Break.
//   - At 50%, he adds a charge, followed by Typhoon Howl. Guard on the turns after he uses Gather Power.

achievement("Illusory Bellow", "Defeat the guardian of the illusory Tokyo Hall Inverted", 10,
            bit_set_at_location(bit2(0xa98760), location_tokyo_hall_inverted_roof))

// * Collect the Veda [bit0(0xa98874)] (hacker accessory) and Rapid Ring [bit1(0xa98874)] (anyone accessory).
// * Save
// * Enter the glowing circle.

// ----- Illusory Capital, Tokyo Tower -----
// * Follow the path around to a room, then head north to a chest containing Hypno Crystal x5 [bit2(0xa98874)].
// * Return to the room and head west where you'll find a Criminal Dragon V [8200LF].
// * Continue along the path to the next room where you'll find a chest containing Miracle Aero x3 [bit5(0xa98874)].
// * Proceed north through the next room and kill the Dragonlord V [5868LF] guarding the gate.
// * Collect the Saint's Ring from the chest behind it [bit4(0xa98874)].
// * Return to the previous room and east into the next room where you can kill another Criminal Dragon V.
// * Continue all the way east and kill the Dragonlord V guarding the gate.
// * Collect the Dragon Egg from the chest behind it [bit3(0xa98874)].
// * Return to the previous fork and go north.
// * Examine the exit crystal to activate the last gate.
// * Kill the Dragonlord V guarding the gate.
// * Talk to Aitelle.
// * There is no save point at the final boss. Use the exit gate, or go back to Tokyo Hall inverted to save.
//   - You'll want to grind some levels too. The final boss is Lv.99. Might as well get to 99 yourself.
//   - An easy way to grind levels is to kill the Dragonlord V at the exit gate, leave and return, then repeat.
//     It will respawn every time you leave the dungeon.
//   - Depending on your party make-up, it might be faster to just quickly dispatch the non-guardian monsters.
// [Save 23 - n/a - Lv99 40h38]
// * Enter the glowing circle.
// * Walk up the path, and approach the boss.
//   - Dragoner Takehaya is Lv.99 and has 46000LF (though he will heal for about 3000 twice during the fight).
//   - This is the final boss battle. Don't be afraid to use your items.
//   - It's often better to use Miracle Aeros than spreading a Cure over the party.
//   - Use normal attacks (no EX specials) until he heals the first time (around 66%).
//   - He will use SKY on the first turn, and every third turn thereafter (4/7/10/etc). Guard on those turns.
//   - Remember to use Def boosting items like Nav Cookies.
//   - In the later phases, Thunder Shield will inflict paralysis, so keep equipment up for that. Otherwise, focus
//     on defense.
//   - This fight is mostly about react skills. Defend on the first turn, then activate react skills on the second turn
//     and whenever they expire.
//   - If you have a trickster, use his EX Special to put the boss to sleep, then use a Dragon Egg to refill
//     the EX meter so you can do it again when it wears off. While it's asleep, reapply buffs, heal, etc.
//     Save your other character's EX Specials for when you run out of Dragon Eggs.
//   - If you don't have a trickster, use a similar strategy where you use Dragon Eggs to refill your EX guages
//     and hit him as hard as you can.
//   - At 30%, after he heals for the second time, he'll use Exhaust followed by SKY, which will be devastating
//     to you. Try to be at full health and guard with everyone. If that's not possible, have your fastest character
//     use a Miracle Aero and guard with the others.
//   - After that, he'll use SKY every couple turns, so try to defeat him as fast as possible. This is where you
//     really let loose with your EX skills.

achievement("The Dragoner", "Defeat the guardian of the illusory Tokyo Tower", 25,
            bit_set_at_location(bit0(0xa98761), location_credits))


