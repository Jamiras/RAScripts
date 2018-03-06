// Final Fantasy III
// #ID = 341

// md5: 544311e104805e926083acf29ec664da (U v1.1)
// md5: e986575b98300f721ce27c180264d890 (U v1.0)
// md5: 97bf78e916b80f47cf35edf502be34dc (J)        [not associated to these achievements - game Id = 8023]

// 1/26 - 35 open tickets
// 2/08 - 31 open tickets
// 2/09 - 30 open tickets
// 2/17 - 17 open tickets

// [16-bit] 00e1 = enemy dies. 16 triggers at same time.
// STABLE value for [BATTLE SCREEN DIALOGUE]
// (lower battle screen dialogue, not upper)
function enemy_dies() => word(0x000014)

// [8-bit] Rapid text output. Also scripted movement.
// [Opera House] 6d when playing dog bark sound.
// 6e, turned out the lights
function script_pointer() => byte(0x000020)

// [8-bit] (STABLE BATTLE DIALOGUE 2)
function battle_dialog_pointer() => byte(0x000048)

// [16-bit] Which Menu subscreen you are on.
function menu_subscreen() => word(0x000054)

// [16-bit] Character X coordinant.
// Duplicate of 0xh7c. Multiples of 10 seem to be next square.
function character_x() => byte(0x00005C)

// [16-bit] Character Y coordinant.
// Duplicate of 0xh70. multiples of 10 seem to be next square. Also temp value.
function character_y() => byte(0x000060)

function battle_message_pointer() => word(0x00007A)

// [16-bit] WHICH MAP LOADED, see also 0x84.
// !!!!!!!!!!!! 0000 if in battle?
function current_loaded_map() => word(0x000082)

// [16-bit] Dialogue scroll 0-100
function dialog_scroll_location() => word(0x000084)

// demo mode values/screenload values
// 0f0f 1f1f 3f3f
function demo_mode() => word(0x000086)

// [8-bit] Dialogue cursor selection
// (if you are asked a question)
function dialog_cursor_selection() => byte(0x0000C4)

// [8-bit] CHAT DIALOGUE!!! Whenever a new chat
// window opens, this updates.
function chat_dialog_id() => byte(0x0000D0)

// [8-bit] Chat dialogue additional lines.
function chat_dialog_additional_lines() => byte(0x0000D3)

// Colisseum - Item you wager.
function colisseum_wager() => byte(0x000205)

// Colisseum - Opponent you fight in battle.
function colisseum_opponent() => byte(0x000206)

// Colisseum - Item you win 1.
function colisseum_prize() => byte(0x000207)

// [8-bit] ITEM YOU JUST picked up from a treasure
// chest or found.
function last_treasure() => byte(0x000583)

// Spell Power
function spell_power() => word(0x0011A6)

// Hit rate
function hit_rate() => word(0x0011A8)

// In-battle status - 01=Dark 02=Zombie 04=Poison 08=Magitek 10=Clear 20=Imp 40=Petrify 80=death
function battle_status() => word(0x0011AA)

// Status - 01=Dance 02=Regen 04=Slow 08=Haste 10=Stop 20=Shell 40=Safe 80=Reflect 64 = Imp?
function character_status() => word(0x0011AC)

// Level of attacker
function attacker_level() => byte(0x0011AF)

// [16-bit] Battle damage
function battle_damage() => word(0x0011B0)

// [16-bit] MONSTER FORMATION ENCOUNTERED. BATTLE.
function monster_formation() => word(0x0011E0)

// [8-bit] Battle background that loaded
function battle_background() => word(0x0011E2)
background_plains = 0
background_desert = 2
background_forest = 3
background_cave = 10
background_hills = 11
background_snow = 18
background_earth = 21
background_water = 35
background_opera = 43

// On world map... 00=on foot, 01=In airship, 02=Riding Chocobo
function current_vehicle() => byte(0x0011FA)
vehicle_none = 0
vehicle_airship = 1
vehicle_chocobo = 2
function trigger_in_airship() => current_vehicle() == vehicle_airship
function trigger_riding_chocobo() => current_vehicle() == vehicle_chocobo

// [8-bit] Which character is being displayed on the map (as leader)
// only valid on map. in towns and dungeons, look at $07FB (which has a different mapping). it will be 0 on map
function current_leader() => byte(0x0011FB)

function character_level(character) => byte(0x001608 + character * 0x25)
character_terra = 0
character_locke = 1
character_cyan = 2
character_shadow = 3
character_edgar = 4
character_sabin = 5
character_celes = 6
character_strago = 7
character_relm = 8
character_setzer = 9
character_mog = 10
character_gau = 11
character_gogo = 12
character_umaro = 13

character_banon = 17

// Begin Multi-Party. [8-bit]
// First character in Party 1 c1/e1=Terra lower 4
// 1st char Front Row/Back Row - c and e
function multi_party() => byte(0x001850)

// [8-bit] 3rd character in Party 1
// Setzer Front/Back=51/71
// 38 = Nothing 49/69
function party_character_3() => byte(0x001859)

// [8-bit] 4th character in Party 1
// Gau Front/Back=59/79
// 38 = Nothing pos 1 - c1/e1
function party_character_4() => low4(0x00185B)

// Gil 1 of 3.
function money() => byte(0x001860)

// [8-bit] Increases as you gain Espers, Continues through to 0xh1a6c. 
// 0=Ramuh 1=Ifrit 2=Shiva 3=Siren 4=Terrato 5=Shoat 6=Madiun 7=Bismark
function espers_learned() => byte(0x001A69)

// [16-bit] Increases as more characters join.
// 0=Terra 1=Locke 2=Cyan 3=Shadow 4=Edgar 5=Sabin 6=Celes 7=Strago
function characters_in_party() => word(0x001EDE)

// [16-bit] Map location A (see also 0x1f66)
// 00 = World of Balance
// 01 = World of Ruin 2001?
function current_map() => word(0x001F64)

// [16-bit] Map location B (see also 0x1f64)
function current_sub_map() => word(0x001F66)

// [8-bit] Experience earned after battle 1 of 3
// Also after experience is rewarded, item rewarded.
// Also item stolen in battle. (All else FF)
function battle_experience() => byte(0x002F35)

// Gold after battle
// Also Quantity of item won
function battle_gold() => byte(0x002F38)

// Position 1 character 00 = normal ff = seized 01=dead
function character_state() => byte(0x003219)

// [16-bit] Enemy 1 health
// Continues through to Enemy 6 at 0x3c06.
// 0000=enemy dead
function enemy_health() => word(0x003BFC)

// [16-bit] MP for FireEater, Atma, etc
// FE starts at 1e0, drain to 00 using Rasp/Osmose
function enemy_mp() => word(0x003C10)

// ============================================================================

lookup_characters = {
    0: "Terra",
    1: "Setzer",
    2: "Cyan",
    3: "Gau",
    4: "Edgar",
    5: "Umaro",
    6: "Celes",
    8: "Relm",
    9: "Locke",
    10: "Mog",
    11: "Shadow",
    12: "Gogo",
    13: "Sabin",
    14: "Banon", // also Maduin
    15: "Strago",
//    character_gogo: "Gogo",
}

lookup_world_characters = {
    character_terra: "Terra",
    character_locke: "Locke",
    character_cyan: "Cyan",
    character_shadow: "Shadow",
    character_edgar: "Edgar",
    character_sabin: "Sabin",
    character_celes: "Celes",
    character_strago: "Strago",
    character_relm: "Relm",
    character_setzer: "Setzer",
    character_mog: "Mog",
    character_gau: "Gau",
    character_gogo: "Gogo",
    character_umaro: "Umaro",
    character_banon: "Banon",
}

// locations should be captured when entering the location from the bottom left
function current_location() => word(0x001f6b)
location_narshe               = 0x2154
location_figaro               = 0x4C40
location_south_figaro         = 0x6F56
location_figaro_cave          = 0x664B
location_mt_koltz             = 0x6466
location_mt_koltz2            = 0x5C62
location_returners            = 0x4068
location_chocobo_stable       = 0x5536
location_old_mans_house       = 0x23A5
location_imperial_camp        = 0x24A5
location_doma_castle          = 0x549C
location_phantom_forest       = 0x52B2 // also Baren Falls
location_phantom_forest2      = 0x5CB2 // south entrance
location_mobliz               = 0x73DC
location_crescent_mtn         = 0x94D6
location_nikeah               = 0x3D75
location_figaro_kohlingen     = 0x301E
location_kohlingen            = 0x271A
location_shack                = 0x0921
location_jidoor               = 0x831A
location_jidoor2              = 0x821B
location_jidoor3              = 0x831C
location_zozo                 = 0x5B15
location_opera_house          = 0x9A2D
location_albrook              = 0xCB8A
location_tzen                 = 0x9577
location_tzen2                = 0x9578
location_chocobo_stable2      = 0x967D
location_maranda              = 0xE242
location_vector               = 0xBB78
location_imperial_base        = 0xC2A5
location_sealed_gate_cave     = 0xC2A9
location_chocobo_stable3      = 0xEB4D
location_thamasa              = 0x80FA
location_esper_mountain       = 0x82E5
location_solitary_island      = 0xF04C
location_solitary_island2     = 0xEF4C
location_solitary_island3     = 0xE749 // mountain
location_ruin_albrook         = 0xD18C
location_ruin_tzen            = 0xB382
location_ruin_mobliz          = 0x87ED
location_chocobo_stable4      = 0x9CE5
location_ruin_nikeah          = 0x4C92
location_ruin_south_figaro    = 0x5F71
location_ruin_figaro_cave     = 0x626A
location_ruin_figaro_castle   = 0x5551
location_ruin_figaro_kohlingen= 0x3A35
location_ruin_kohlingen       = 0x2D26
location_daryls_tomb          = 0x3419
location_ruin_maranda         = 0xB845
location_ruin_jidoor          = 0x9C22
location_ruin_thamasa         = 0xE6FB
location_ruin_narshe          = 0x2173
location_ruin_house           = 0x148C
location_ruin_opera_house     = 0xB71F
location_colosseum            = 0x1132
location_cave_on_the_veldt    = 0x59CF
location_ruin_zozo            = 0x832B
location_fanatics_tower       = 0x7EA0
location_ebots_rock           = 0xDFF9
location_triangle_island_cave = 0x2EEF
location_ruin_doma_castle     = 0x4BAB
location_ruin_doma_castle2    = 0x4BAC
location_phoenix_cave         = 0x9D75
location_ruin_house2          = 0x2DB2
location_kefkas_tower         = 0xC689

location_names = {
    location_narshe: "Narshe",
    location_figaro: "Figaro Castle",
    location_figaro_kohlingen: "Figaro Castle",
    location_south_figaro: "South Figaro",
    location_figaro_cave: "Figaro Cave",
    location_mt_koltz: "Mt. Koltz",
    location_mt_koltz2: "Mt. Koltz",
    location_returners: "Returners' Hideout",
    location_old_mans_house: "House",
    location_imperial_camp: "Imperial Camp",
    location_doma_castle: "Doma Castle",
    location_phantom_forest: "Phantom Forest",
    location_phantom_forest2: "Phantom Forest",
    location_mobliz: "Mobliz",
    location_crescent_mtn: "Crescent Mountain",
    location_nikeah: "Nikeah",
    location_kohlingen: "Kohlingen",
    location_shack: "Shack",
    location_jidoor: "Jidoor",
    location_jidoor2: "Jidoor",
    location_jidoor3: "Jidoor",
    location_zozo: "Zozo",
    location_opera_house: "the Opera House",
    location_albrook: "Albrook",
    location_tzen: "Tzen",
    location_tzen2: "Tzen",
    location_chocobo_stable: "Chocobo Stable",
    location_chocobo_stable2: "Chocobo Stable",
    location_chocobo_stable3: "Chocobo Stable",
    location_chocobo_stable4: "Chocobo Stable",
    location_maranda: "Maranda",
    location_vector: "Vector",
    location_imperial_base: "the Imperial Base",
    location_sealed_gate_cave: "the Cave to the Sealed Gate",
    location_thamasa: "Thamasa",
    location_esper_mountain: "Esper Mountain",
    location_solitary_island: "the Solitary Island",
    location_solitary_island2: "the Solitary Island",
    location_solitary_island3: "the Solitary Island",
    location_ruin_albrook: "Albrook",
    location_ruin_tzen: "Tzen",
    location_ruin_mobliz: "Mobliz",
    location_ruin_nikeah: "Nikeah",
    location_ruin_south_figaro: "South Figaro",
    location_ruin_figaro_cave: "Figaro Cave",
    location_ruin_figaro_castle: "Figaro Castle",
    location_ruin_figaro_kohlingen: "Figaro Castle",
    location_ruin_kohlingen: "Kohlingen",
    location_daryls_tomb: "Daryl's Tomb",
    location_ruin_maranda: "Maranda",
    location_ruin_jidoor: "Jidoor",
    location_ruin_thamasa: "Thamasa",
    location_ruin_narshe: "Narshe",
    location_ruin_house: "House",
    location_ruin_opera_house: "the Opera House",
    location_colosseum: "the Colosseum",
    location_cave_on_the_veldt: "the Cave on the Veldt",
    location_ruin_zozo: "Zozo",
    location_fanatics_tower: "the Fanatics' Tower",
    location_ebots_rock: "Ebot's Rock",
    location_triangle_island_cave: "Triangle Island Cave",
    location_ruin_doma_castle: "Doma Castle",
    location_ruin_doma_castle2: "Doma Castle",
    location_phoenix_cave: "Phoenix Cave",
    location_ruin_house2: "House",
    location_kefkas_tower: "Kefka's Tower",
}

function location_key(location) => ((location / 256) / 4) * 64 + ((location % 256) / 4)

lookup_locations = {}
for location in location_names {
    lookup_locations[location_key(location)] = location_names[location]
}

large_locations = {
    location_figaro: 2,
    location_south_figaro: 2,
    location_doma_castle: 2,
    location_figaro_kohlingen: 2,
    location_zozo: 2,
    location_vector: 2,
}

for location in large_locations {
    if (large_locations[location] == 2) {
        lookup_locations[location_key(location + 256)] = location_names[location]       // up one
        lookup_locations[location_key(location - 1)] = location_names[location]         // up one
        lookup_locations[location_key(location + 256 - 1)] = location_names[location]   // up one, right one
    }
}

rich_presence_conditional_display(byte(0x001626) == 0, "Title Screen")

rich_presence_conditional_display(byte(0x01F64) <= 1, "{0} is exploring the world", // 00=world of balance, 01=world of ruin
    rich_presence_lookup("WorldCharacter", current_leader(), lookup_world_characters)
)


rich_presence_conditional_display(current_map() == 7, "{0} is exploring the airship",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

rich_presence_conditional_display(current_map() == 6, "{0} is exploring the airship",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

rich_presence_conditional_display(current_map() == 11, "{0} is exploring the airship", // world of ruin
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

rich_presence_conditional_display(current_map() == 12, "{0} is exploring the airship", // world of ruin
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

// approaching floating island
rich_presence_conditional_display(current_map() == 10, "{0} is exploring the airship",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

rich_presence_conditional_display(current_map() == 0x018A, "{0} is exploring the floating continent",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

// escape sequence
rich_presence_conditional_display(current_map() == 0x0189, "{0} is exploring the floating continent",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters)
)

rich_presence_display("{0} is exploring {1}",
    rich_presence_lookup("Character", low4(0x07FB), lookup_characters),
    rich_presence_lookup("Location", high4(0x001F6C)*256+bit3(0x001F6C)*128+bit2(0x001F6C)*64+high4(0x001F6B)*4+bit3(0x001F6B)*2+bit2(0x001F6B), lookup_locations)
//    ,rich_presence_value("LocationId", high4(0x001F6C)*256+bit3(0x001F6C)*128+bit2(0x001F6C)*64+high4(0x001F6B)*4+bit3(0x001F6B)*2+bit2(0x001F6B))
)

//lookup_near = {
//    0: "",
//    1: "near ",
//}

//rich_presence_display("{0} is exploring {1}{2} ({3})",
//    rich_presence_lookup("Character", low4(0x07FB), lookup_characters),
//    rich_presence_lookup("Near", bit5(0x001F65), lookup_near),
//    rich_presence_lookup("Location", high4(0x001F6C)*256+bit3(0x001F6C)*128+bit2(0x001F6C)*64+high4(0x001F6B)*4+bit3(0x001F6B)*2+bit2(0x001F6B), lookup_locations),
//    rich_presence_value("LocationId", high4(0x001F6C)*256+bit3(0x001F6C)*128+bit2(0x001F6C)*64+high4(0x001F6B)*4+bit3(0x001F6B)*2+bit2(0x001F6B))
//)

// ============================================================================
// New Game

achievement(
    title = "The Approach on Narshe", description = "Watch the snowfield scene without skipping", points = 1,
    id = 4938, badge = "05569", published = "2/11/2014 1:38:25 AM", modified = "4/21/2014 4:03:37 PM",
    trigger = current_loaded_map() == 18 && dialog_scroll_location() == 256 && demo_mode() == 57375 && 
              byte(0x000041) <= 18 && byte(0x000042) == 253
)

achievement(
    title = "Shell-shocked", description = "Destroy Whelk's armored shell", points = 5,
    id = 4960, badge = "05579", published = "2/12/2014 2:01:47 AM", modified = "12/23/2015 4:05:36 PM",
    trigger = monster_formation() == 432 && battle_background() == 9 && battle_experience() == 235
)

achievement(
    title = "Elixir-in-a-Clock", description = "The first of many", points = 1,
    id = 4962, badge = "05584", published = "2/12/2014 2:53:11 AM", modified = "4/21/2014 4:04:06 PM",
    trigger = bit2(0x001E40) == 1 && current_loaded_map() == 30 && dialog_scroll_location() == 0
)

achievement(
    title = "Semantic Nonsense", description = "Steal a MithrilKnife while protecting Terra in the Caves of Narshe", points = 5,
    id = 4967, badge = "05963", published = "2/12/2014 3:41:39 PM", modified = "4/21/2014 4:06:32 PM",
    trigger = monster_formation() == 4 && battle_background() == 10 && battle_experience() == 1 && 
              byte(0x002F36) == 255 && byte(0x002F37) == 255 && battle_gold() == 255
)

// ============================================================================
// 01 - Leaving Narshe

// 10857: This achievement did not fire at me. and I used the exact exact version of rom ( 1.0 )<br/>MD5: 8c7a4e80684b9117c8dc7de146d7c126
// have Terra use magic in a battle
achievement(
    title = "Every little thing she does is Magic", description = "Trigger a hidden scene shortly after escaping Figaro Castle", points = 5,
    id = 5006, badge = "05631", published = "2/12/2014 9:12:40 PM", modified = "4/21/2014 4:14:27 PM",
    trigger = battle_dialog_pointer() == 223 && 
              never(byte(0x000014) == 12) && 
              never(bit1(0x001DD1) != 1) &&                                  // secret Terra scene indicator
              ((monster_formation() >= 6 && monster_formation() <= 7 && 
                battle_background() == 0 && once(byte(0x000014) == 135)) ||
               (monster_formation() >= 7 && monster_formation() <= 8 && 
                battle_background() == 3 && once(byte(0x000014) == 203)) ||
               (monster_formation() >= 8 && monster_formation() <= 12 && 
                battle_background() == 2 && once(byte(0x000014) == 28)) ||
               (monster_formation() == 434 &&                                // M-TekArmor pursuit (required fight)
                battle_background() == 2 && once(byte(0x000014) == 28)) ||
               (monster_formation() > 2 && monster_formation() < 19 && 
                battle_background() == 10 && once(byte(0x000014) == 135)))
)

achievement(
    title = "To the Horizons", description = "Ride a Chocobo on the World Map", points = 1,
    id = 5008, badge = "05633", published = "2/12/2014 9:57:25 PM", modified = "4/21/2014 4:14:55 PM",
    trigger = trigger_riding_chocobo() && current_loaded_map() == 0 && dialog_scroll_location() == 37376
)

// ============================================================================
// 02 - Mt Koltz

achievement(
    title = "Hadouken!", description = "Perform AuraBolt", points = 1,
    id = 5096, badge = "05731", published = "2/15/2014 3:23:08 AM", modified = "8/27/2014 8:00:48 AM",
    trigger = byte(0x00007A) == 57 && byte(0x00ECF0) == 173 && bit1(0x001D28) == 1 && byte(0x0011A1) == 32 && 
              byte(0x0011A4) == 32 && byte(0x0011A6) == 68
)

// ============================================================================
// 03 - Returners' Hideout

achievement(
    title = "Stubborn Girl", description = "Refuse Banon's offer three times", points = 1,
    id = 5128, badge = "05739", published = "2/16/2014 5:29:04 PM", modified = "4/21/2014 4:15:27 PM",
    trigger = never(current_loaded_map() != 108) && dialog_scroll_location() == 0 && chat_dialog_id() == 54 && 
              word(0x0000C4) == 6
)

// can be triggered by standing next to the raft (before jumping on) for 7 minutes or simply waiting at any
// intersection for some period of time resulting in 7 minutes on the raft
achievement(
    title = "River Rats", description = "Spending TOO MUCH TIME on the Lete River", points = 1,
    id = 5129, badge = "05740", published = "2/17/2014 2:51:50 AM", modified = "4/21/2014 4:16:00 PM",
    trigger = current_loaded_map() == 113 && dialog_scroll_location() == 256 && 
              repeated(4000, byte(0x000010) == 214) && never(byte(0x000010) == 215) && 
              unless(current_loaded_map() == 0)
)

achievement(
    title = "Seafood Soup", description = "Turn up the heat on your first encounter with Ultros", points = 5,
    id = 5130, badge = "05741", published = "2/17/2014 3:31:46 AM", modified = "2/17/2014 3:44:08 PM",
    trigger = never(monster_formation() != 473) && battle_background() == 13 && 
              once(battle_message_pointer() == 0x834b) && // Yaaooouch!
              battle_message_pointer() == 0x835e          // Seafood soup!
)

// ============================================================================
// XX - Terra's Scenario

// chocobo stable in forest west of desert southwest of where figaro castle was - make banon leader and purchase
achievement(
    title = "What the-?!?", description = "Make Banon ride a chocobo", points = 5,
    id = 5131, badge = "05742", published = "2/17/2014 3:57:35 AM", modified = "2/17/2014 4:00:10 AM",
    trigger = trigger_riding_chocobo() && current_loaded_map() == 0 && dialog_scroll_location() == 37376 && 
              never(current_leader() != character_banon)
)

// ============================================================================
// XX - Sabin's Scenario

achievement(
    title = "May I have this dance?", description = "Get in the way of Cyan's fury", points = 1,
    id = 5136, badge = "05745", published = "2/17/2014 5:10:22 PM", modified = "4/21/2014 4:17:33 PM",
    trigger = never(current_loaded_map() != 119) && dialog_scroll_location() == 0 && 
              once(chat_dialog_id() == 66) && chat_dialog_id() == 67 && 
              never(chat_dialog_id() == 62) && never(chat_dialog_id() == 63)
)

achievement(
    title = "Spooky...", description = "Have two Ghosts in your party at once", points = 5,
    id = 5137, badge = "05746", published = "2/17/2014 6:33:02 PM", modified = "4/21/2014 4:18:03 PM",
    trigger = never(byte(0x001705) != 191) && byte(0x001706) == 191 && byte(0x001707) == 191 && 
              byte(0x001708) == 191 && byte(0x001709) == 191 && byte(0x00170A) == 255 && 
              never(byte(0x00172A) != 191) && byte(0x00172B) == 191 && byte(0x00172C) == 191 && 
              byte(0x00172D) == 191 && byte(0x00172E) == 191 && byte(0x00172F) == 255 && 
              byte(0x001857) > 72 && byte(0x001858) > 72
)

achievement(
    title = "Choo-plex", description = "Perform a Suplex on the GhostTrain", points = 5,
    id = 5282, badge = "05863", published = "2/19/2014 9:13:21 PM", modified = "2/19/2014 9:13:57 PM",
    trigger = byte(0x00ECF0) == 177 && monster_formation() == 437 && battle_background() == 33
)

// 10919: this achievement does not work for me
//        I made a save before I got the letter but it still did not work for me.<br/>MD5: 83cd438bbdd1e643f54711f9b2f8fb2c
achievement(
    title = "Courier", description = "Deliver all the letters and items on behalf of the wounded soldier in Mobliz", points = 5,
    id = 5431, badge = "05962", published = "2/21/2014 4:19:54 PM", modified = "2/25/2014 3:16:12 AM",
    trigger = never(current_loaded_map() != 163) &&                             // Mobliz post office
              dialog_scroll_location() == 0 &&                                  // For 500GP you can send a ...
              once(chat_dialog_id() == 7) &&                                    // For 500GP you can send a ...
              chat_dialog_additional_lines() == 0 &&                            
              once(chat_dialog_additional_lines() == 1) &&
              ((dialog_cursor_selection() == 2 && byte(0x0000E5) == 0) ||       // (Send It)
               (never(dialog_cursor_selection() == 4) && byte(0x0000E5) == 0))  // (Forget It)
)

// ============================================================================
// XX - Locke's Scenario

// 6562: I want to know when this is supposed to trigger and if I need to do something besides not stealing clothes and not using the walkthrough walls glitch becuase I believe I did everything right.
//        I know it wasn't a sync issue because "Anti-Runic" did trigger but my internet cut off so it didn't register.
//        ROM Used: Final Fantasy III (USA) (Rev 1); MD5: 0x544311e104805e926083acf29ec664da.
// 1120: Triggered as soon as I went down stairs into the basement of South Figaro before the scenarios.
// 338: Triggered during initial visit to South Figaro upon going down the hidden staircase in the Northwest house.
achievement(
    title = "No, really! I'm not a thief!", description = "Negotiate Locke's scenario without stealing any clothes (no guard clipping)", points = 5,
    id = 5522, badge = "06046", published = "2/22/2014 5:50:10 AM", modified = "12/27/2015 10:47:52 AM",
    trigger = once(byte(0x001626) == 1) &&    // Locke sprite
              never(byte(0x001626) == 19) &&  // merchant sprite
              never(byte(0x001626) == 14) &&  // soldier sprite
              current_loaded_map() == 83 &&   // hidden room in rich persons house
              character_x() == 96 && character_y() == 32 && // enter basement 
              never(word(0x0000D0) == 412) && // chat dialog
              once(word(0x0000D0) == 219)     // Ah! Cider! Glug, glug, ...
)

achievement(
    title = "Anti-Runic", description = "Steal Air Lancet from TunnelArmr, never use Runic, and win in Locke's scenario", points = 5,
    id = 5563, badge = "06081", published = "2/23/2014 2:17:41 AM", modified = "2/23/2014 4:00:08 AM",
    trigger = never(monster_formation() != 436) && battle_background() == 10 && once(word(0x00008E) == 52736) && 
              byte(0x002E72) == 238 && battle_experience() == 238 && byte(0x002F36) == 0 && never(byte(0x003D4A) == 11) && 
              once(battle_experience() == 3)
)

// ============================================================================
// 07 - Battle for Narshe

achievement(
    title = "Covert Strike Team", description = "Engage in only one battle during Kefka's raid on Narshe", points = 5,
    id = 5564, badge = "06082", published = "2/23/2014 8:21:30 PM", modified = "2/23/2014 8:27:17 PM",
    trigger = once(current_loaded_map() == 22) && battle_background() == 18 && once(word(0x0000D0) == 873) && 
              never(monster_formation() == 91) && never(monster_formation() == 92) && never(monster_formation() == 89) && 
              never(monster_formation() == 88) && never(monster_formation() == 87) && monster_formation() == 505 && 
              battle_experience() == 178 && byte(0x002F36) == 0 && byte(0x002F37) == 0
)

// ============================================================================
// 08 - Return to Figaro

// bring sabin and edgar to figaro, spend the night
achievement(
    title = "The Coin Toss", description = "Witness a hidden scene that reveals Edgar and Sabin's past", points = 5,
    id = 5571, badge = "06106", published = "2/24/2014 3:13:41 AM", modified = "2/24/2014 3:22:04 AM",
    trigger = never(current_loaded_map() != 58) && dialog_scroll_location() == 256 && word(0x0000D0) == 970
)

// take locke to rachel's house (northwest) in kohlingen
achievement(
    title = "Forever Rachel", description = "Witness a hidden scene that reveals Locke's past", points = 5,
    id = 5579, badge = "06111", published = "2/24/2014 4:26:04 AM", modified = "2/24/2014 4:26:10 AM",
    trigger = never(current_loaded_map() != 197) && dialog_scroll_location() == 256 && word(0x0000D0) == 1011
)

// ============================================================================
// 09 - Zozo

// chainsaw is reward from clock puzzle [in inn] (6:10:50) - skill for edgar
achievement(
    title = "Friday the 13th", description = "Split an enemy in two with the chainsaw", points = 1,
    id = 5852, badge = "06375", published = "3/2/2014 7:39:27 PM", modified = "4/25/2014 2:48:52 AM",
    trigger = once(byte(0x0000ED) == 0) && once(word(0x00007A) == 33604) && byte(0x00ECF0) == 176 && 
              never(byte(0x0011AA) != 128) && never(byte(0x003A5B) == 8) && never(byte(0x003A5B) == 16) && 
              never(byte(0x003A5B) == 1) &&
              ((never(byte(0x0061C3) == 5) && never(byte(0x0061C3) == 7)) ||
               (never(byte(0x0061E3) == 5) && never(byte(0x0061E3) == 7)) ||
               (never(byte(0x006203) == 5) && never(byte(0x006203) == 7)) ||
               (never(byte(0x006223) == 5) && never(byte(0x006223) == 7)))
)

// ============================================================================
// 10 - Opera House

// simply walk onto stage without reading the script - you don't have to perform it to trigger the achievement
achievement(
    title = "Photographic Memory", description = "Perform without reviewing the script", points = 1,
    id = 5933, badge = "06380", published = "3/5/2014 2:40:42 AM", modified = "4/21/2014 4:20:21 PM",
    trigger = never(current_loaded_map() != 238) && dialog_scroll_location() == 0 && never(word(0x0000D0) == 1206) && 
              byte(0x000070) == 0 && byte(0x00006C) == 160 &&
              ((once(word(0x0000D0) == 1201)) ||
               (once(word(0x0000D0) == 1203)))
)

// middle switch
achievement(
    title = "Hey - who turned out the lights?", description = "Switch off the lights at the Opera House", points = 1,
    id = 5943, badge = "06387", published = "3/6/2014 12:41:48 AM", modified = "4/21/2014 4:20:58 PM",
    trigger = never(current_loaded_map() != 232) && script_pointer() == 110 && 
              dialog_scroll_location() <= 256 &&
              dialog_scroll_location() >= 0 &&
              current_sub_map() == 0x2472        // prevents triggering when entering rafters
)

// left switch for a minute
achievement(
    title = "Bark-O-Matic", description = "Waste time fooling around with the dog bark at the sound stage", points = 1,
    id = 5944, badge = "06388", published = "3/6/2014 1:07:13 AM", modified = "4/21/2014 4:21:11 PM",
    trigger = never(current_loaded_map() != 232) && repeated(1500, script_pointer() == 109) && 
              dialog_scroll_location() <= 256 && dialog_scroll_location() >= 0
)

// right switch
achievement(
    title = "Surprise!", description = "Drop in on the audience (or stage)", points = 1,
    id = 5945, badge = "06390", published = "3/6/2014 1:31:06 AM", modified = "4/21/2014 4:21:27 PM",
    trigger = never(current_loaded_map() != 232) && script_pointer() == 111 && dialog_scroll_location() <= 256 && 
              dialog_scroll_location() >= 0
)

// 7689: 
// 7433: I killed EVERY team of rats in the rafters and this didn't trigger.
achievement(
    title = "Rat Race", description = "Rats in the rafters - Kill as many as you can! ", points = 5,
    id = 5987, badge = "06445", published = "3/7/2014 3:20:40 PM", modified = "3/7/2014 11:03:22 PM",
    trigger = never(current_loaded_map() == 232) &&                  // never leave rafters; reset counter before entering 
              once(current_loaded_map() == 235) &&                   // in rafters
              battle_background() == 24 &&                           // rafter fight
              repeated(23, byte(0x003A77) < prev(byte(0x003A77))) && // kill 20 rats
              ((monster_formation() == 112) ||   // sewer rat, vermin, sewer rat
               (monster_formation() == 113))     // ??
)

// old trigger for Rat Race
//    trigger = never(current_loaded_map() == 232) && battle_background() == 24 && 
//              repeated(50, byte(0x000029) > prev(byte(0x000029))) && 
//              unless(high4(0x000029) == 1) && unless(high4(0x000029) == 2) && unless(high4(0x000029) == 3) && 
//              unless(high4(0x000029) == 4) && unless(high4(0x000029) == 5) && unless(high4(0x000029) == 6) && 
//              unless(high4(0x000029) == 7) && unless(high4(0x000029) == 8) && unless(high4(0x000029) == 9) && 
//              unless(high4(0x000029) == 10) && unless(high4(0x000029) == 11) && unless(high4(0x000029) == 12) && 
//              unless(high4(0x000029) == 13) && unless(high4(0x000029) == 14) && 
//              unless(byte(0x000029) == 1) && unless(byte(0x000029) == 2) && unless(byte(0x000029) == 3) && 
//              unless(byte(0x000029) == 4) && unless(byte(0x000029) == 5) && unless(byte(0x000029) == 6) && 
//              unless(byte(0x000029) == 7) && unless(byte(0x000029) == 8) && unless(byte(0x000029) == 9) && 
//              unless(byte(0x000029) == 250) && unless(byte(0x000029) == 251) && unless(byte(0x000029) >= 253) && 
//              unless(byte(0x000029) == 241) && unless(byte(0x000029) == 242) && unless(byte(0x000029) == 243) && 
//              unless(byte(0x000029) == 244) && unless(byte(0x000029) == 245) && unless(byte(0x000029) == 246) && 
//              unless(byte(0x000029) == 247) && unless(byte(0x000029) == 248) && unless(byte(0x000029) == 249) && 
//              once(current_loaded_map() == 235) && 
//              never(word(0x0000D0) == 1264) &&
//              ((monster_formation() == 112) ||   // sewer rat, vermin, sewer rat
//               (monster_formation() == 113))     // ??

achievement(
    title = "Encore!", description = "Flawless performance on opening night at the Opera House", points = 5,
    id = 5935, badge = "06379", published = "3/5/2014 3:42:21 AM", modified = "3/7/2014 6:10:26 PM",
    trigger = byte(0x001EA2) < 8 && never(current_loaded_map() != 233) && dialog_scroll_location() >= 0 && 
              dialog_scroll_location() <= 256 && word(0x0000D0) == 1251 && word(0x0000D2) == 256
)

// ============================================================================
// 11 - Albrook

achievement(
    title = "Pacifism in the Pit", description = "Find a way to escape the battle with Ifrit and Shiva", points = 5,
    id = 6015, badge = "06469", published = "3/8/2014 11:09:32 PM", modified = "3/8/2014 11:24:35 PM",
    trigger = never(monster_formation() != 439) && battle_background() == 29 && once(byte(0x00007A) == 26) && 
              never(byte(0x00007A) == 176) && byte(0x00007A) == 0
)

achievement(
    title = "The Tempest", description = "Steal a Tempest from Number 128", points = 2,
    id = 6016, badge = "06470", published = "3/9/2014 2:03:22 AM", modified = "4/25/2014 2:49:05 AM",
    trigger = never(monster_formation() != 442) && battle_background() == 44 && battle_experience() == 46 && 
              byte(0x002F36) == 255 && byte(0x002F37) == 255 && battle_gold() == 255
)

// 6565: When is this supposed to trigger? I used the airship many times but it's not popping up.
// 2694: didn't trigger...
achievement(
    title = "The World is Yours", description = "Pilot the Airship for the first time", points = 1,
    id = 6001, badge = "06472", published = "3/8/2014 3:19:52 AM", modified = "4/21/2014 4:22:47 PM",
    trigger = current_loaded_map() == 0 && dialog_scroll_location() == 37376 && word(0x000090) == 255 && 
              trigger_in_airship() && byte(0x00F40A) == 1 && once(prev(current_loaded_map()) == 6) && 
              never(chat_dialog_id() == 33) && once(chat_dialog_id() == 36) && once(dialog_cursor_selection() == 2) && 
              once(chat_dialog_additional_lines() == 0)
)

// ============================================================================
// 12 - Airship

// Narshe - lone wolf quest
achievement(
    title = "Hanging by a Pom-pom", description = "Choose to rescue Mog", points = 1,
    id = 6025, badge = "06476", published = "3/10/2014 3:43:11 AM", modified = "4/21/2014 4:27:24 PM",
    trigger = never(current_loaded_map() != 23) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              word(0x0000D0) == 1758
)

// Triangle island - northeast corner - 32000 HP! - save for later...
achievement(
    title = "Intangible!", description = "Defeat Intangir in his homeland, no instant death moves, no dances", points = 5,
    id = 6024, badge = "06475", published = "3/9/2014 10:57:47 PM", modified = "9/15/2014 6:46:38 PM",
    trigger = never(monster_formation() != 210) && enemy_dies() == 225 && byte(0x000029) == 252 && 
              once(byte(0x00007A) == 0) && never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&
              ((battle_background() == 0) || (battle_background() == 0))
)

// ============================================================================
// 13 - Sealed Gate

achievement(
    title = "Chivalry is Undead", description = "Have Zombie Cyan escort Terra through 'The Cave to the Sealed Gate'", points = 5,
    id = 6041, badge = "06489", published = "3/10/2014 9:16:04 PM", modified = "4/25/2014 2:44:36 AM",
    trigger = never(byte(0x00165E) != 2) && unless(current_loaded_map() == 0) && never(current_loaded_map() != 384) && 
              character_y() == 64 && party_character_3() <= 64 && byte(0x00185B) <= 64 && 
              current_leader() >= character_terra && current_leader() <= character_cyan && // also includes locke
              unless(current_loaded_map() == 255) && unless(current_loaded_map() == 256) && 
              byte(0x001853) <= 64 && byte(0x001854) <= 64 && byte(0x001855) <= 64 && byte(0x001856) <= 64 && 
              byte(0x001857) <= 64 && byte(0x001858) <= 64 && byte(0x00185A) <= 64 && byte(0x00185C) <= 64 && 
              byte(0x00185D) <= 64 &&
              ((word(0x00005C) >= 32 && word(0x00005C) <= 64 && low4(0x001850) == 1 && low4(0x001852) == 9) ||
               (word(0x00005C) >= 32 && word(0x00005C) <= 64 && low4(0x001850) == 9 && low4(0x001852) == 1) ||
               (word(0x00005C) >= 32 && word(0x00005C) <= 64 && low4(0x001850) == 9 && low4(0x001852) == 9) ||
               (word(0x00005C) >= 32 && word(0x00005C) <= 64 && low4(0x001850) == 1 && low4(0x001852) == 1))
)

// Vector Revisited
achievement(
    title = "Master Philanthropist", description = "Max out Emperor Gestahl's favor during the banquet", points = 5,
    id = 6154, badge = "06556", published = "3/12/2014 2:32:38 AM", modified = "3/12/2014 2:33:40 AM",
    trigger = never(current_loaded_map() != 251) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              byte(0x001FC2) == 93
)

// ============================================================================
// 14 - Esper Search

// Return to airship (SE of Maranda) and talk to Setzer
achievement(
    title = "Repairing the Airship", description = "Witness a hidden scene that reveals Setzer's past", points = 5,
    id = 6155, badge = "06557", published = "3/12/2014 3:08:47 AM", modified = "3/12/2014 3:08:52 AM",
    trigger = never(current_loaded_map() != 7) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              word(0x0000D0) == 1887
)

// 7690: 
// 2187: I didn't kill it by draining its magic points, i used morph  ice rod, but i still got the achievement
achievement(
    title = "Psychic Flame", description = "Defeat FireEater by draining away its Magic Points", points = 5,
    id = 6156, badge = "06558", published = "3/12/2014 6:59:30 PM", modified = "3/26/2014 3:13:49 AM",
    trigger = never(monster_formation() != 449) && battle_background() <= 25 && 
              never(current_map() != 0x15F) &&                    // room where flame eater is
              word(0x3C10) == 0 && prev(word(0x3C10)) != 0 &&     // MP drops to 0 in the same frame that
              enemy_health() == 0 && prev(enemy_health()) == 0 && // HP drops to 0
              once(enemy_health() == 8400)                        // prevent trigger when entering battle
//    trigger_before = never(monster_formation() != 449) && battle_background() <= 25 && 
//              enemy_mp() == 0 &&                // enemy MP
//              repeated(5, byte(0x0061C3) == 5) &&   // battle animation - 5 = static, 7 = jumping
//              repeated(5, byte(0x0061C4) == 5) &&   // ice rod attack counts as "5" - do it five times
//              repeated(5, byte(0x0061C3) == 7) &&   // steal counts as "7" - do it once
//              repeated(5, byte(0x0061C4) == 7)
)

// ============================================================================
// 15 - Esper Mountain

// Chocobo and Tabby suits can be found here
achievement(
    title = "OMG FURRIES!", description = "Have Strago and Relm wear Tabby, Chocobo, Moogle, Nutkin, or Behemoth suits", points = 1,
    id = 6220, badge = "06648", published = "3/16/2014 2:34:37 AM", modified = "4/21/2014 5:12:56 PM",
    trigger = byte(0x001725) >= 157 && byte(0x001725) <= 161 && byte(0x00174A) >= 157 && byte(0x00174A) <= 161 && 
              unless(menu_subscreen() == 44807) && unless(menu_subscreen() == 2051) && unless(menu_subscreen() == 48898)
)

// back in towner after mountain
achievement(
    title = "And Finally ... Peace", description = "A happy ending", points = 5,
    id = 6198, badge = "06604", published = "3/14/2014 3:43:08 AM", modified = "3/14/2014 3:43:15 AM",
    trigger = never(current_loaded_map() != 341) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              word(0x0000D0) == 2064 && word(0x0000D2) == 256
)

// try to leave town as General Leo
achievement(
    title = "None Shall Pass", description = "Have at least one run-in with the Guardian before the final dungeon", points = 1,
    id = 6002, badge = "06463", published = "3/8/2014 3:31:19 PM", modified = "4/16/2014 2:22:22 AM",
    trigger = never(monster_formation() != 445) &&
              ((battle_background() == 20) ||
               (battle_background() == 30))
)

// ============================================================================
// 16 - Floating Continent

achievement(
    title = "The Decisive Battle", description = "Steal a Ribbon from and defeat AtmaWeapon, no instant death moves", points = 5,
    id = 6255, badge = "06682", published = "3/17/2014 1:57:07 PM", modified = "10/7/2014 12:49:43 AM",
    trigger = never(monster_formation() != 450) && 
              once(byte(0x00007A) == 0) &&        // battle message none
              once(byte(0x00007A) == 203) &&      // battle message - and as ancient as the cosmos
              byte(0x000029) == 0 &&              // enemy not dead?
              never(byte(0x0011AA) == 128) &&     // battle status = dead (instant death attack)
              unless(byte(0x0011A2) == 44) &&     // attack = ??
              enemy_dies() >= 226 && 
              once(battle_experience() == 202) && // stole ribbon
              ((enemy_health() == 0) || (enemy_mp() == 0))
)

// don't jump onto the airship after defeating Nerapa
achievement(
    title = "Patience Pays I", description = "Earn Shadow's eternal respect", points = 1,
    id = 6257, badge = "06685", published = "3/17/2014 4:47:36 PM", modified = "9/15/2014 6:48:05 PM",
    trigger = never(current_loaded_map() != 393) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              word(0x0000D0) == 2164
)

achievement(
    title = "This is the End", description = "Reach the second world", points = 5,
    id = 6258, badge = "06686", published = "3/17/2014 5:17:50 PM", modified = "3/18/2014 12:54:17 AM",
    trigger = never(current_loaded_map() != 0) && dialog_scroll_location() == 37376 && word(0x000090) == 255 && 
              byte(0x001F64) == 1
)

// ============================================================================
// 17 - World of Ruin

achievement(
    title = "The Cold Embrace of Death", description = "A dramatic moment", points = 5,
    id = 6279, badge = "06708", published = "3/18/2014 2:58:34 AM", modified = "3/18/2014 2:58:40 AM",
    trigger = byte(0x001FD0) <= 30 && never(current_loaded_map() != 397) && dialog_scroll_location() >= 0 && 
              dialog_scroll_location() <= 256 && word(0x0000D0) == 2189
)

achievement(
    title = "Choose Life", description = "A healthy fish diet", points = 5,
    id = 6280, badge = "06707", published = "3/18/2014 3:19:06 AM", modified = "3/19/2014 3:35:34 AM",
    trigger = word(0x001FD0) >= 255 && never(current_loaded_map() != 397) && dialog_scroll_location() >= 0 && 
              dialog_scroll_location() <= 256 && word(0x0000D0) == 2176
)

// rescue the boy in Tzen - collect all 8 chests (including the two monster-in-a-boxes)
achievement(
    title = "Child Endangerment", description = "Collect every treasure from the collapsing house and escape", points = 1,
    id = 6295, badge = "06719", published = "3/19/2014 3:35:12 AM", modified = "4/21/2014 4:30:33 PM",
    trigger = bit6(0x001E51) == 1 && bit1(0x001E52) == 1 && bit7(0x001E51) == 1 && bit0(0x001E52) == 1 && 
              bit2(0x001E52) == 1 && bit3(0x001E52) == 1 && bit4(0x001E52) == 1 && bit5(0x001E52) == 1 && 
              current_loaded_map() == 305 && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              chat_dialog_id() == 171
)

// Figaro Cave - if didn't collect chest in Act I
achievement(
    title = "Patience Pays II", description = "Find a Hero Ring in the South Figaro Cave", points = 1,
    id = 6400, badge = "06847", published = "3/21/2014 1:16:25 PM", modified = "4/12/2014 3:24:45 AM",
    trigger = never(current_loaded_map() != 90) && dialog_scroll_location() >= 0 && dialog_scroll_location() <= 256 && 
              bit3(0x001E42) == 1 && last_treasure() == 201
)

// Figaro Castle - Engine Room - Use Edgar's 'Flash' while Celes is seized
achievement(
    title = "Edgar's 'interests'", description = "Celes is Seized by Tentacles, and Edgar decides to snap a picture", points = 5,
    id = 6412, badge = "06852", published = "3/21/2014 5:28:26 PM", modified = "4/21/2014 4:31:21 PM",
    trigger = never(monster_formation() != 454) && battle_background() <= 55 && 
              byte(0x00007A) == 34 && 
              byte(0x00ECF0) == 161 &&
              ((byte(0x7B6C) == character_celes && byte(0x003D49) == 0xC8) || // celes in first slot
               (byte(0x7B6D) == character_celes && byte(0x003D4B) == 0xC8) || // celes in second slot
               (byte(0x7B6E) == character_celes && byte(0x003D4D) == 0xC8) || // celes in third slot
               (byte(0x7B6F) == character_celes && byte(0x003D4F) == 0xC8))   // celes in fourth slot
//    trigger_before = never(monster_formation() != 454) && battle_background() <= 55 && byte(0x00007A) == 34 && 
//              byte(0x00ECF0) == 161 &&
//              ((low4(0x001856) == 1 && high4(0x001856) >= 12 && high4(0x001856) <= 14 && character_state() == 255) ||
//               (low4(0x001856) == 9 && high4(0x001856) >= 12 && high4(0x001856) <= 14 && byte(0x00321B) == 255) ||
//               (low4(0x001856) == 1 && high4(0x001856) >= 13 && high4(0x001856) <= 15 && byte(0x00321D) == 255) ||
//               (low4(0x001856) == 9 && high4(0x001856) >= 13 && high4(0x001856) <= 15 && byte(0x00321F) == 255))
)

// ============================================================================
// 18 - Daryl's Tomb

achievement(
    title = "Super Bouncy Doom", description = "Use nothing but Super Balls against Dullahan and win", points = 5,
    id = 6424, badge = "06864", published = "3/23/2014 1:12:45 PM", modified = "9/19/2014 11:08:28 PM",
    trigger = never(monster_formation() != 455) && battle_background() == 38 && once(byte(0x00007A) == 0) && 
              enemy_dies() == 10 && enemy_health() == 0 && byte(0x00007A) == 67 &&
              ((unless(attacker_level() == 37) && never(byte(0x0011A9) != 148) && unless(word(0x00007A) == 0)))
)

// ============================================================================
// 19 - Mobliz Revisited

// 7751: 
// 6487: Only Celes and Terra, only using Bio and Cure, didn't trigger.
// 3494: Did this with Celes and Terra in the party with no insta-kills and the achievement doesn't trigger.
achievement(
    title = "Minerva Twins", description = "Defeat Phunbaba's final form using only Celes and Terra, no instant death moves", points = 5,
    id = 6887, badge = "07170", published = "4/5/2014 12:21:45 AM", modified = "10/8/2014 3:08:34 AM",
    trigger = never(monster_formation() != 423) && battle_background() == 5 &&  // second form
              once(byte(0x00007A) == 0) &&                                      // battle start
              never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&   // no instant death skills
              enemy_dies() == 31 && enemy_health() == 0 &&                      // victory
              ((word(0x007B6C) == 0x1206 && word(0x007B6E) == 0xFFFF) ||        // celes in slot 1, terra in slot 2
               (word(0x007B6C) == 0x0612 && word(0x007B6E) == 0xFFFF) ||        // terra in slot 1, celes in slot 2
               (word(0x007B6C) == 0xFF12 && word(0x007B6E) == 0xFF06) ||        // terra in slot 1, celes in slot 3
               (word(0x007B6C) == 0xFF12 && word(0x007B6E) == 0x06FF))          // terra in slot 1, celes in slot 4
              
//    trigger_before = never(monster_formation() != 423) && battle_background() == 5 &&  // second form
//              once(byte(0x00007A) == 0) &&                                      // battle start
//              never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&   // no instant death skills
//              enemy_dies() == 31 && enemy_health() == 0 &&                      // victory
//              byte(0x001852) <= 64 && 
//              byte(0x001853) <= 64 && 
//              byte(0x001854) <= 64 && 
//              byte(0x001855) <= 64 && 
//              byte(0x001857) <= 64 && 
//              byte(0x001858) <= 64 && 
//              byte(0x001859) <= 64 && 
//              byte(0x00185A) <= 64 && 
//              byte(0x00185B) <= 64 && 
//              byte(0x00185C) <= 64 && 
//              byte(0x00185D) <= 64 &&
//              ((low4(0x001850) == 9 && high4(0x001850) >= 4 && low4(0x001856) == 1 && high4(0x001856) >= 12 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 1 && high4(0x001850) >= 4 && low4(0x001856) == 9 && high4(0x001856) >= 12 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 1 && high4(0x001850) >= 5 && low4(0x001856) == 9 && high4(0x001856) >= 13 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 9 && high4(0x001850) >= 5 && low4(0x001856) == 1 && high4(0x001856) >= 13 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 9 && high4(0x001850) >= 5 && low4(0x001856) == 9 && high4(0x001856) >= 12 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 9 && high4(0x001850) >= 4 && low4(0x001856) == 9 && word(0x001856) >= 13 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 1 && high4(0x001850) >= 4 && low4(0x001856) == 9 && high4(0x001856) >= 13 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 1 && high4(0x001850) >= 5 && low4(0x001856) == 1 && high4(0x001856) >= 12 && byte(0x001854) <= 32) ||
//               (low4(0x001850) == 1 && high4(0x001850) >= 4 && low4(0x001856) == 1 && high4(0x001856) >= 13 && byte(0x001854) <= 32))
)

// western mines - Narshe (kuku's charm is the moogle charm)
achievement(
    title = "Kuku's Treasures", description = "Find Kuku's Charm and Ribbon she left behind for Mog (one session)", points = 2,
    id = 5818, badge = "06869", published = "3/2/2014 2:08:55 PM", modified = "4/27/2014 1:42:55 AM",
    trigger = unless(current_map() != 44) && bit7(0x001E59) == 1 && bit5(0x001E41) == 1 && once(last_treasure() == 202) &&
              ((current_sub_map() == 15481) || (current_sub_map() == 12153))
)

// last dance learned on snow fields
achievement(
    title = "Slam Dancin'", description = "Learn all Dances", points = 5,
    id = 6465, badge = "06868", published = "3/25/2014 2:32:18 AM", modified = "8/30/2014 10:41:20 PM",
    trigger = byte(0x001D4C) == 255 && bit2(0x001EDF) == 1
)

// ============================================================================
// 20 - Tritoch

// 6641: 
// 4106: I used Celes solo and fire rods / fire spells for Tritoch and the achievement didn't trigger
// 3811: Tried 5-10 times using different attacks.  No instant death, once drill only.  Once fight command only (via 58 edgar with atma weapon)  doesnt seem to trigger at all
// 3479: Defeated Tritoch multiple times using different strategies and never got the achievement to trigger.
// 3057: This achievement doesn't trigger. I beat him many time with a full team and another one with terra only. I used her fire spell.
// 2347: I beated it using 5 different parties (and even tried by soloing it) but the achievement never triggered. (and I didn't even tried to cast an instant death on it)
// 2295: Killed it with Relm using Ultima while Gogo and Mog were jumping. No achievement
achievement(
    title = "Avenging Vicks and Wedge", description = "Defeat Tritoch, no instant death moves", points = 5,
    id = 6535, badge = "06947", published = "3/26/2014 2:45:48 AM", modified = "12/8/2015 10:35:15 PM",
    trigger = never(monster_formation() != 487) && 
              once(byte(0x00007A) == 0) &&                                       // enter battle
              byte(0x000029) == 0 && 
              never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&    // no instant death moves
              enemy_dies() >= 226 &&
              ((enemy_health() == 0) || (enemy_mp() == 0))                       // enemy dies
)

// jump over ledge after tritoch and wander through cave, interact with bone totem, defeat umaro, have mog talk to him
achievement(
    title = "The Abominable Comrade", description = "Recruit Umaro", points = 1,
    id = 6619, badge = "06974", published = "3/28/2014 5:04:02 AM", modified = "4/8/2014 5:03:53 PM",
    trigger = bit5(0x001EDF) == 1 && never(current_map() != 283)
)

// ============================================================================
// 21 - Owzer's Mansion

achievement(
    title = "I work alone", description = "Have Shadow rescue Relm, alone", points = 5,
    id = 7128, badge = "07275", published = "4/7/2014 4:59:07 PM", modified = "4/11/2014 2:26:39 AM",
    trigger = never(current_map() != 208) && dialog_scroll_location() <= 256 && 
              never(current_leader() != character_shadow) && 
              multi_party() <= 64 && byte(0x001851) <= 64 && byte(0x001852) <= 64 && byte(0x001854) <= 64 && 
              byte(0x001855) <= 64 && byte(0x001856) <= 64 && byte(0x001857) <= 64 && byte(0x001858) <= 64 && 
              party_character_3() <= 64 && byte(0x00185A) <= 64 && byte(0x00185B) <= 64 && byte(0x00185C) <= 64 && 
              chat_dialog_id() == 158 && byte(0x00185D) <= 64 &&
              ((low4(0x001853) == 1 && high4(0x001853) >= 12) ||
               (low4(0x001853) == 9 && high4(0x001853) >= 12) ||
               (low4(0x001853) == 1 && high4(0x001853) >= 13) ||
               (low4(0x001853) == 9 && high4(0x001853) >= 13))
)

// ============================================================================
// 22 - Ebot's Rock

// 3060: This one is broken. I solo hildon with relm on my second fight with him but no trigger.
// 2758: Tried this achievement a few times, never triggered. Relm and Strago in my party, Strago does nothing (also tried defend) while Relm nuked Hidon with Ultima / Meteor.
achievement(
    title = "Step Aside, Gramps!", description = "Solo Hidon using only Relm, no instant death moves", points = 5,
    id = 7162, badge = "07401", published = "4/8/2014 11:48:10 PM", modified = "12/13/2015 5:08:07 PM",
    trigger = never(monster_formation() != 464) && battle_background() == 10 && 
              once(byte(0x00007A) == 0) &&                                        // battle start
              enemy_dies() >= 203 && enemy_health() == 0 &&                       // enemy dies
              never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&     // no instant death moves
              ((word(0x007B6C) == 0xFF08 && word(0x007B6E) == 0xFFFF) ||          // relm in slot 1
               (word(0x007B6C) == 0x08FF && word(0x007B6E) == 0xFFFF) ||          // relm in slot 2
               (word(0x007B6C) == 0xFFFF && word(0x007B6E) == 0xFF08) ||          // relm in slot 3
               (word(0x007B6C) == 0xFFFF && word(0x007B6E) == 0x08FF))            // relm in slot 4
//    trigger_before = never(monster_formation() != 464) && battle_background() == 10 && 
//              once(byte(0x00007A) == 0) &&                                        // battle start
//              enemy_dies() >= 203 && enemy_health() == 0 &&                       // enemy dies
//              never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) &&     // no instant death moves
//              byte(0x001850) <= 64 && byte(0x001852) <= 64 && byte(0x001853) <= 64 && byte(0x001854) <= 64 && 
//              byte(0x001855) <= 64 && byte(0x001856) <= 64 && byte(0x001857) <= 64 && byte(0x001859) <= 64 && 
//              byte(0x00185A) <= 64 && byte(0x00185B) <= 64 && byte(0x00185C) <= 64 && byte(0x00185D) <= 64 && 
//              ((low4(0x001858) == 1 && high4(0x001858) >= 12 && high4(0x001858) <= 14) ||
//               (low4(0x001858) == 9 && high4(0x001858) >= 12 && high4(0x001858) <= 14) ||
//               (low4(0x001858) == 1 && high4(0x001858) >= 13 && high4(0x001858) <= 15) ||
//               (low4(0x001858) == 9 && high4(0x001858) >= 13 && high4(0x001858) <= 15))
)

// ============================================================================
// 23 - Triangle Island Cave

achievement(
    title = "Gender Crisis", description = "Recruit Gogo", points = 1,
    id = 6767, badge = "07133", published = "4/3/2014 1:04:35 AM", modified = "4/8/2014 5:04:23 PM",
    trigger = bit4(0x001EDF) == 1 && never(current_map() != 278)
)

// cave to ancient castle
achievement(
    title = "Alone in the Dark", description = "Solo Master Pug using only Gau, no instant death moves", points = 5,
    id = 7197, badge = "07318", published = "4/9/2014 8:39:49 PM", modified = "6/29/2016 7:55:06 PM",
    trigger = never(monster_formation() != 483) && battle_background() == 10 && never(byte(0x0011AA) == 128) && 
              unless(byte(0x0011A2) == 44) && enemy_dies() == 31 && word(0x003C00) == 0 && multi_party() <= 64 && 
              byte(0x001852) <= 64 && byte(0x001853) <= 64 && byte(0x001854) <= 64 && byte(0x001855) <= 64 && 
              byte(0x001856) <= 64 && byte(0x001857) <= 64 && byte(0x001858) <= 64 && party_character_3() <= 64 && 
              byte(0x00185A) <= 64 && byte(0x00185C) <= 64 && byte(0x00185D) <= 64 &&
              ((party_character_4() == 1 && high4(0x00185B) >= 12 && high4(0x00185B) <= 14) ||
               (party_character_4() == 9 && high4(0x00185B) >= 12 && high4(0x00185B) <= 14) ||
               (party_character_4() == 1 && high4(0x00185B) >= 13 && high4(0x00185B) <= 15) ||
               (party_character_4() == 9 && high4(0x00185B) >= 13 && high4(0x00185B) <= 15))
)

// ancient castle
achievement(
    title = "Samurai Showdown", description = "Steal from and defeat KatanaSoul, no instant death moves", points = 5,
    id = 7201, badge = "07322", published = "4/10/2014 1:20:25 AM", modified = "8/31/2014 3:06:38 AM",
    trigger = never(monster_formation() != 465) && battle_background() <= 26 && never(byte(0x0011AA) == 128) && 
              enemy_dies() == 31 && enemy_health() == 0 && once(enemy_dies() == 0) &&
              ((once(battle_experience() == 47)) ||
               (once(battle_experience() == 49)))
)

// talk to queen's statue in ancient castle
achievement(
    title = "Shin-Zantetsuken", description = "Transform Odin into Raiden", points = 1,
    id = 7238, badge = "07333", published = "4/10/2014 1:26:50 PM", modified = "4/10/2014 7:11:13 PM",
    trigger = bit3(0x001A6A) == 0 && bit4(0x001A6A) == 1 && prev(bit4(0x001A6A)) == 0 && current_loaded_map() == 408
)

// ============================================================================
// 24 - Cyan's Dream

// the "never(byte(0x007A) < prev(byte(0x007A)))" seems to trip this up alot
achievement(
    title = "Espers in the Dreamscape", description = "Using nothing but Magicite, slay all three Dream Stooges", points = 5,
    id = 7165, badge = "07285", published = "4/9/2014 2:57:52 AM", modified = "4/21/2014 4:37:34 PM",
    trigger = never(monster_formation() != 460) && battle_background() <= 46 && 
              once(word(0x003C14) > 1800) && 
              enemy_health() == 0 && word(0x003C00) == 0 && word(0x003BFE) == 0 && 
              // $007A = battle message
              never(byte(0x00007A) < prev(byte(0x00007A))) && byte(0x00007A) == 55 && 
              unless(byte(0x00007A) == 0) && 
              unless(byte(0x00007A) == 18) && 
              unless(byte(0x00007A) == 29) && 
              unless(byte(0x00007A) == 30) && 
              unless(byte(0x00007A) == 31) && 
              unless(byte(0x00007A) == 32) && 
              unless(byte(0x00007A) == 33) && 
              unless(byte(0x00007A) == 34) &&
              unless(byte(0x00007A) == 37) && 
              unless(byte(0x00007A) == 39) && 
              unless(byte(0x00007A) == 41) && 
              unless(byte(0x00007A) == 44) && 
              unless(byte(0x00007A) == 47) && 
              unless(byte(0x00007A) == 51) && 
              unless(byte(0x00007A) == 56) && 
              unless(byte(0x00007A) == 57) && 
              unless(byte(0x00007A) == 72) && 
              unless(byte(0x00007A) == 133) && 
              unless(byte(0x00007A) == 169) && 
              // character 1 action
              never(byte(0x0061C1) != 0) && unless(byte(0x0061C1) == 7) && 
                                            unless(byte(0x0061C1) == 6) && 
                                            unless(byte(0x0061C1) == 20) && 
                                            unless(byte(0x0061C1) == 22) && 
                                            unless(byte(0x0061C1) == 55) && 
                                            unless(byte(0x0061C1) == 68) && 
              // character 2 action
              never(byte(0x0061E1) != 0) && unless(byte(0x0061E1) == 7) && 
                                            unless(byte(0x0061E1) == 6) && 
                                            unless(byte(0x0061E1) == 20) && 
                                            unless(byte(0x0061E1) == 22) && 
                                            unless(byte(0x0061E1) == 55) && 
                                            unless(byte(0x0061E1) == 68) && 
              // character 3 action
              never(byte(0x006201) != 0) && unless(byte(0x006201) == 7) && 
                                            unless(byte(0x006201) == 6) && 
                                            unless(byte(0x006201) == 20) && 
                                            unless(byte(0x006201) == 22) && 
                                            unless(byte(0x006201) == 55) && 
                                            unless(byte(0x006201) == 68) && 
              // character 4 action
              never(byte(0x006221) != 0) && unless(byte(0x006221) == 7) && 
                                            unless(byte(0x006221) == 6) && 
                                            unless(byte(0x006221) == 20) && 
                                            unless(byte(0x006221) == 22) && 
                                            unless(byte(0x006221) == 55) && 
                                            unless(byte(0x006221) == 68)
)

achievement(
    title = "Throne Retained", description = "Defeat Wrexsoul and win a Pod Bracelet", points = 5,
    id = 7173, badge = "07288", published = "4/9/2014 6:35:32 PM", modified = "4/21/2014 4:38:04 PM",
    trigger = never(monster_formation() != 462) && battle_background() == 26 && battle_experience() == 200 && 
              byte(0x002F36) == 0 && byte(0x002F37) == 0 && battle_gold() == 1 &&
              ((enemy_health() == 0) || (enemy_mp() == 0))
)

achievement(
    title = "Swordity Sword", description = "Learn all Swordtechs", points = 5,
    id = 6890, badge = "07172", published = "4/5/2014 3:20:15 AM", modified = "4/21/2014 4:52:18 PM",
    trigger = byte(0x001CF7) == 255 &&
              ((current_loaded_map() == 123) ||
               (character_level(character_cyan) == 70))
)

// ============================================================================
// 25 - Pheonix Cave

// 7758: Recruited Gogo as my 14th character recruit, didn't trigger. Definitely have all characters.
// trigger requires 16 characters, notes for $1EDF indicate its unclear what bits 6 and 7 are for
// whatever they are is before the opera house (the earliest quick save I still had after triggering this)
achievement(
    title = "You Are Not Alone", description = "Recruit every character", points = 5,
    id = 6296, badge = "07277", published = "3/19/2014 4:01:11 AM", modified = "4/8/2014 3:56:13 PM",
    trigger = characters_in_party() == 65535
)

// colliseum battle - wager ragnarok sword (which can only be obtained by not getting the ragnarok esper!)
achievement(
    title = "Illuminated!", description = "Win an Illumina at the colosseum", points = 1,
    id = 7299, badge = "07414", published = "4/12/2014 6:21:51 PM", modified = "4/12/2014 6:21:59 PM",
    trigger = never(colisseum_wager() != 27) && colisseum_opponent() == 249 && colisseum_prize() == 26 && 
              battle_experience() == 26 && byte(0x002F36) == 0 && byte(0x002F37) == 0 && battle_gold() == 0
)

// vist old man's house north of Doma Castle with Sabin and Gau in party
achievement(
    title = "What is a Man?", description = "Witness a hidden scene that involves Gau and his father", points = 5,
    id = 7286, badge = "07403", published = "4/12/2014 1:40:42 PM", modified = "4/12/2014 1:42:48 PM",
    trigger = never(current_loaded_map() != 131) && dialog_scroll_location() == 256 && chat_dialog_id() == 244
)

// ============================================================================
// 26 - Fanatics' Tower

achievement(
    title = "Complete Toolset", description = "Find the Air Anchor in the Fanatics' Tower", points = 5,
    id = 6704, badge = "07066", published = "3/31/2014 3:04:42 AM", modified = "3/31/2014 3:04:48 AM",
    trigger = bit1(0x001E57) == 1 && never(current_map() != 370) && current_sub_map() == 1800
)

achievement(
    title = "Psychic Vampires", description = "Defeat MagiMaster by draining away his Magic Points", points = 5,
    id = 7298, badge = "07412", published = "4/12/2014 4:58:43 PM", modified = "4/12/2014 4:58:54 PM",
    trigger = never(monster_formation() != 354) && battle_background() <= 45 && 
              enemy_mp() == 0 && prev(enemy_mp()) != 0 &&         // MP drops to 0 in the same frame that
              enemy_health() == 0 && prev(enemy_health()) == 0 && // HP drops to 0
              once(enemy_health() == 50000)                       // prevent trigger when entering battle
//    trigger_before = never(monster_formation() != 354) && battle_background() <= 45 && enemy_mp() == 0 && 
//              repeated(5, byte(0x0061C3) == 5) && repeated(5, byte(0x0061C4) == 5) && 
//              repeated(5, byte(0x0061C3) == 7) && repeated(5, byte(0x0061C4) == 7)
)

// dinosaur forest, northeast of Doma castle
achievement(
    title = "Hold onto your butts...", description = "Defeat Brachosaur, no instant death moves", points = 5,
    id = 6798, badge = "07151", published = "4/4/2014 1:52:17 AM", modified = "4/25/2014 4:04:39 AM",
    trigger = never(monster_formation() != 322) && battle_background() <= 21 && once(byte(0x00007A) == 0) && 
              enemy_dies() == 225 && enemy_health() == 0 && never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44)
)

// stay at an inn with shadow in your party over and over
achievement(
    title = "Beyond the Shadows I", description = "Witness Shadow's first set of dreams", points = 5,
    id = 5653, badge = "06169", published = "2/25/2014 4:12:31 AM", modified = "4/9/2014 1:38:03 AM",
    trigger = never(current_loaded_map() != 182) && dialog_scroll_location() == 256 && word(0x0000D0) == 472
)

// requires not rescuing shadow
achievement(
    title = "Beyond the Shadows II", description = "Witness Relm's dream", points = 5,
    id = 5132, badge = "07284", published = "2/17/2014 4:30:03 AM", modified = "4/27/2014 1:57:33 AM",
    trigger = never(current_loaded_map() != 349) && dialog_scroll_location() == 256 && word(0x0000D0) == 2588
)

// ============================================================================
// 27 - Kefka's Tower

achievement(
    title = "Pro-Runic", description = "Use Runic to counter Atma's Ultima", points = 5,
    id = 7354, badge = "07457", published = "4/14/2014 5:17:55 AM", modified = "4/21/2014 4:44:09 PM",
    trigger = never(monster_formation() != 482) && once(word(0x00002A) == 65535) && 
              once(enemy_mp() < prev(enemy_mp())) && once(word(0x0011A2) == 8705) && 
              once(word(0x0011A4) == 32) && once(spell_power() == 0) && once(hit_rate() == 0) && 
              once(battle_status() == 0) && once(character_status() == 0) && never(word(0x0011A4) == 5152) && 
              never(word(0x0011A2) == 10240) && never(word(0x0011A2) == 2560) && never(word(0x0011A2) == 8768) && 
              never(word(0x0011A2) == 9792) && never(word(0x0011A2) == 8800) && never(word(0x0011A2) == 560) && 
              word(0x0011A4) == 20513
)

// 7783: 
// 5059: I navigated south through the maze in that room on the 3rd path, got the chest with the shield and no achievement.
achievement(
    title = "Shielded from View", description = "Find the well-hidden Aegis Shield in Kefka's Tower", points = 1,
    id = 6705, badge = "07071", published = "3/31/2014 4:06:29 AM", modified = "12/2/2014 5:42:28 PM",
    trigger = never(current_map() != 410) &&  // kefka's tower
              bit1(0x001E5E) == 1 &&          // aegis shield collected
              prev(bit1(0x001E5E)) == 0       // not previously collected
//    trigger_before = never(current_map() != 410) && bit1(0x001E5E) == 1 &&
//              ((current_sub_map() == 4875) || (current_sub_map() == 11526))
)

// 2244: I triggered it using Relm's sketch glitch in Zozo (world of balance)
achievement(
    title = "Dragon Slayer", description = "Defeat the eight legendary dragons", points = 5,
    id = 6534, badge = "07070", published = "3/26/2014 2:13:36 AM", modified = "8/30/2014 10:25:30 PM",
    trigger = bit7(0x001A6A) == 1 // received "Crusader" magicite
)

// ============================================================================
// 28 - Kefka's Tower 2

// if blaster lands (enemy skill), this will not trigger
achievement(
    title = "Goddess of Darkness", description = "Steal a Red Jacket from and defeat Poltergeist, no instant death moves", points = 5,
    id = 6000, badge = "07511", published = "3/8/2014 2:49:21 AM", modified = "4/26/2014 2:22:10 AM",
    trigger = never(monster_formation() != 470) && battle_background() <= 22 && once(byte(0x00007A) == 0) && 
              enemy_dies() == 31 && never(byte(0x0011AA) == 128) && once(battle_experience() == 147) && 
              unless(byte(0x0011A2) == 44) &&
              ((enemy_health() == 0) || (enemy_mp() == 0))
)

achievement(
    title = "Doomfiend", description = "Defeat Doom and learn Forcefield, no instant death moves", points = 5,
    id = 7126, badge = "07512", published = "4/7/2014 3:42:40 PM", modified = "8/31/2014 6:21:39 AM",
    trigger = never(monster_formation() != 468) && battle_background() <= 29 && once(byte(0x00007A) == 0) && 
              once(enemy_dies() == 31) && never(byte(0x0011AA) == 128) && byte(0x00007A) == 127 && 
              unless(byte(0x0011A2) == 44) &&
              ((enemy_health() == 0) || (enemy_mp() == 0))
)

achievement(
    title = "Goddess of Light", description = "Defeat Goddess, no instant death moves", points = 5,
    id = 6617, badge = "07513", published = "3/28/2014 4:47:59 AM", modified = "12/2/2014 3:28:44 AM",
    trigger = never(monster_formation() != 469) && battle_background() <= 20 && once(byte(0x00007A) == 0) && 
              enemy_dies() == 31 && never(byte(0x0011AA) == 128) && unless(byte(0x0011A2) == 44) && 
              unless(word(0x0011A4) == 48) &&
              ((enemy_health() == 0) || (enemy_mp() == 0))
)

// ============================================================================
// 29 - Point of No Return

achievement(
    title = "So Long and Thanks for All the Fish", description = "Clear the game with all the fish!", points = 20,
    id = 6889, badge = "07282", published = "4/5/2014 3:06:21 AM", modified = "4/24/2014 1:59:00 AM",
    trigger = once(monster_formation() == 471) && once(monster_formation() == 512) && 
              once(monster_formation() == 513) && battle_background() <= 51 && once(enemy_dies() == 49535) && 
              once(battle_background() == 51) && never(current_map() != 356) && bit2(0x001EBA) == 1 && 
              bit3(0x001EBA) == 1 && bit4(0x001EBA) == 1 && bit5(0x001EBA) == 1 &&
              ((enemy_health() == 0 && monster_formation() == 514) ||
               (enemy_mp() == 0 && monster_formation() == 514))
)

achievement(
    title = "LLG", description = "Clear the game with no character exceeding level 30", points = 40,
    id = 7296, badge = "07756", published = "4/12/2014 4:27:43 PM", modified = "9/2/2014 7:53:58 AM",
    trigger = once(monster_formation() == 471) && once(monster_formation() == 512) && 
              once(monster_formation() == 513) && battle_background() == 51 && once(enemy_dies() == 49535) && 
              once(battle_background() == 51) && never(current_map() != 356) && 
              never(character_level(character_terra) > 30) && 
              never(character_level(character_locke) > 30) && 
              never(character_level(character_cyan) > 30) && 
              never(character_level(character_shadow) > 30) && 
              never(character_level(character_edgar) > 30) && 
              never(character_level(character_sabin) > 30) && 
              never(character_level(character_celes) > 30) && 
              never(character_level(character_strago) > 30) && 
              never(character_level(character_relm) > 30) && 
              never(character_level(character_setzer) > 30) && 
              never(character_level(character_mog) > 30) && 
              never(character_level(character_gau) > 30) && 
              never(character_level(character_gogo) > 30) && 
              never(character_level(character_umaro) > 30) &&
              ((enemy_health() == 0 && monster_formation() == 514) ||
               (enemy_mp() == 0 && monster_formation() == 514))
)

// ============================================================================

// 11226: Changed the background in multipel ways and teh acheivement didnt trigger.<br/>MD5: e986575b98300f721ce27c180264d890
achievement(
    title = "Custom Background", description = "I guess default's not good enough for you", points = 1,
    id = 4963, badge = "05585", published = "2/12/2014 3:06:57 AM", modified = "4/21/2014 5:13:13 PM",
    trigger = never(current_map() == 3) && 
              never(current_sub_map() == 1800) && 
              never(menu_subscreen() == 24585) && // 1st config screen
              never(menu_subscreen() == 24582) && // 2nd config screen
              menu_subscreen() == 44807 &&        // main menu subscreen
              ((bit0(0x001D4E) > 0) ||            // selection other than 0
               (bit1(0x001D4E) > 0) ||            // selection other than 0
               (bit2(0x001D4E) > 0))              // selection other than 0
//    trigger_before = never(current_map() == 3) && never(current_sub_map() == 1800) && 
//              never(menu_subscreen() == 24585) && never(menu_subscreen() == 24582) && 
//              menu_subscreen() == 44807 && unless(demo_mode() == 16383) &&
//              ((bit0(0x001D4E) > 0) || (bit1(0x001D4E) > 0) || (bit2(0x001D4E) > 0))
)

// 343: Popped while sitting on relic equip menu without actually ever equipping Sprint Shoes. Happened during Sabin's scenario in the imperial camp after Kefka runs away.
achievement(
    title = "Gotta Dash", description = "Equip Sprint Shoes on any character", points = 1,
    id = 5095, badge = "05730", published = "2/15/2014 1:42:27 AM", modified = "4/21/2014 5:13:04 PM",
    trigger = never(current_map() == 3) && 
              never(current_sub_map() == 1800) && 
              prev(menu_subscreen()) == 4097 &&                // leave relic subscreen
              menu_subscreen() == 0xAF07 &&                    // main menu subscreen
              bit5(0x0011DF) == 1 &&                           // sprint shoes active
              (byte(0x0011CA) == 230 || byte(0x0011CB) == 230) // either equipped relic is sprint shoes              
//    trigger_before = never(current_map() == 3) && 
//              never(current_sub_map() == 1800) && 
//              never(menu_subscreen() == 24585) && 
//              never(menu_subscreen() == 24582) && 
//              bit5(0x0011DF) == 1 && // sprint shoes active
//              ((byte(0x0011CA) == 230 && prev(menu_subscreen()) == 4097) || // $11CA = relic1, 230=sprint shoes
//               (byte(0x0011CB) == 230 && prev(menu_subscreen()) == 4097) || // $11CB = relic2
//               (byte(0x0011CA) == 230 && prev(menu_subscreen()) == 2) ||
//               (byte(0x0011CB) == 230 && menu_subscreen() == 2))               
)

achievement(
    title = "Mascot Relm", description = "Have Relm dress up in a Moogle Suit", points = 1,
    id = 6221, badge = "06650", published = "3/16/2014 2:36:24 AM", modified = "4/21/2014 5:12:49 PM",
    trigger = byte(0x00174A) == 159
)

achievement(
    title = "Double Dragoon", description = "Equip DragoonBoots and Dragon Horns on Edgar and Mog at once", points = 1,
    id = 7285, badge = "07400", published = "4/12/2014 3:09:33 AM", modified = "4/12/2014 6:56:52 PM",
    trigger = unless(menu_subscreen() == 44807) && unless(menu_subscreen() == 2051) && unless(menu_subscreen() == 48898) &&
              ((byte(0x0016B7) == 191 && byte(0x0016B8) == 217 && byte(0x001795) == 191 && byte(0x001796) == 217) ||
               (byte(0x0016B7) == 191 && byte(0x0016B8) == 217 && byte(0x001795) == 217 && byte(0x001796) == 191) ||
               (byte(0x0016B7) == 217 && byte(0x0016B8) == 191 && byte(0x001795) == 191 && byte(0x001796) == 217) ||
               (byte(0x0016B7) == 217 && byte(0x0016B8) == 191 && byte(0x001795) == 217 && byte(0x001796) == 191))
)

achievement(
    title = "Tetra-Miracle", description = "Win a pair of Marvel Shoes at the colosseum", points = 1,
    id = 6861, badge = "07169", published = "4/4/2014 10:30:36 PM", modified = "4/8/2014 5:07:30 PM",
    trigger = never(colisseum_wager() != 231) && colisseum_opponent() == 37 && colisseum_prize() == 224 && 
              battle_experience() == 224 && byte(0x002F36) == 0 && byte(0x002F37) == 0 && battle_gold() == 0
)

achievement(
    title = "Miao-Miao!", description = "Win a Cat Hood at the colosseum", points = 1,
    id = 7158, badge = "07279", published = "4/8/2014 5:24:40 PM", modified = "4/8/2014 5:24:47 PM",
    trigger = never(colisseum_wager() != 36) && colisseum_opponent() == 133 && colisseum_prize() == 128 && 
              battle_experience() == 128 && byte(0x002F36) == 0 && byte(0x002F37) == 0 && battle_gold() == 0
)

achievement(
    title = "The Master Swordsman", description = "Defeat the true Siegfried", points = 5,
    id = 7164, badge = "07413", published = "4/9/2014 2:12:45 AM", modified = "4/21/2014 5:09:46 PM",
    trigger = never(colisseum_wager() != 239) && colisseum_opponent() == 55 && colisseum_prize() == 229 && 
              battle_experience() == 229 && byte(0x002F36) == 0 && byte(0x002F37) == 0 && battle_gold() == 0
)

// 10922: this conquest released for me in the event that general leo dies<br/>MD5: 83cd438bbdd1e643f54711f9b2f8fb2c
achievement(
    title = "Blitz Expert", description = "Perform Bum Rush", points = 5,
    id = 6439, badge = "06865", published = "3/24/2014 1:17:28 AM", modified = "4/10/2014 7:52:18 PM",
    trigger = byte(0x00007A) == 64 && byte(0x00ECF0) == 161 && bit2(0x001DD1) == 1 && bit7(0x001D28) == 1 && 
              byte(0x0011A6) == 128
)

achievement(
    title = "Elder Wisdom", description = "Learn all Lores", points = 5,
    id = 7157, badge = "07278", published = "4/8/2014 4:12:58 PM", modified = "4/21/2014 5:09:54 PM",
    trigger = byte(0x001D29) == 255 && byte(0x001D2A) == 255 && byte(0x001D2B) == 255
)

achievement(
    title = "Why so Serious?", description = "Cast 7-7-7 Joker Doom", points = 5,
    id = 6017, badge = "06471", published = "3/9/2014 3:21:05 PM", modified = "8/28/2014 11:23:26 PM",
    trigger = byte(0x007B8C) == 0 && byte(0x007B8D) == 0 && byte(0x007B8E) == 0 && byte(0x007B8F) == 1 && 
              byte(0x007B90) == 1 && byte(0x007B91) == 1 && byte(0x00ECF0) == 166
)

// Tier 1: Available immediately on getting Gau
// Tier 2: Available before entering the Sealed Cave
// Tier 3: Available before Floating Continent
// Tier 4: Floating Continent, WoR, Available as soon as you unlock airship
// Tier 5: Everything Else

achievement(
    title = "Beastlore I", description = "Learn the Tier 1 Rages", points = 1,
    id = 6423, badge = "07663", published = "3/22/2014 6:49:03 PM", modified = "11/15/2015 5:01:08 PM",
    trigger = bit0(0x001D2C) == 1 && // Guard
              bit1(0x001D2C) == 1 && // Soldier
              bit2(0x001D2C) == 1 && // Templar
              bit0(0x001D2D) == 1 && // Hazer
              bit3(0x001D2D) == 1 && // Brawler [starts with]
              bit6(0x001D2D) == 1 && // Whisper [starts with]
              bit3(0x001D2E) == 1 && // Were-Rat [starts with]
              bit5(0x001D2E) == 1 && // Rhinotaur [starts with]
              bit7(0x001D2E) == 1 && // Leafer
              bit0(0x001D2F) == 1 && // Stray Cat
              bit1(0x001D2F) == 1 && // Lobo [starts with]
              bit3(0x001D2F) == 1 && // Doberman
              bit2(0x001D30) == 1 && // Pterodon
              bit0(0x001D31) == 1 && // Dark Wind
              bit1(0x001D31) == 1 && // Beakor
           // bit6(0x001D31) == 1 && // Hornet [starts with]
              bit7(0x001D31) == 1 && // CrassHoppr
              bit2(0x001D32) == 1 && // Trilium
              bit6(0x001D32) == 1 && // Trilobiter [starts with]
              bit7(0x001D32) == 0 && // Siegfried
              bit0(0x001D33) == 1 && // Nautiloid [starts with]
              bit0(0x001D34) == 0 && // Chupon
              bit2(0x001D34) == 1 && // M-TekArmor [starts with]
              bit6(0x001D34) == 1 && // Vaporite
              bit5(0x001D35) == 1 && // Repo Man
              bit7(0x001D35) == 1 && // Bomb
              bit2(0x001D37) == 1 && // Ghost
              bit4(0x001D37) == 1 && // Sand Ray
              bit5(0x001D37) == 1 && // Areneid
              bit2(0x001D38) == 1 && // Crawly
              bit3(0x001D38) == 1 && // Bleary
              bit4(0x001D38) == 1 && // Marshal
              bit6(0x001D3A) == 1 && // Rhobite
              bit2(0x001D3B) == 1 && // Tusker
              bit6(0x001D3C) == 1 && // Cirpius
              bit0(0x001D41) == 1 && // GreaseMonk
              bit2(0x001D43) == 1 && // StillGoing
              bit3(0x001D43) == 0 && // Allo Ver
              bit7(0x001D49) == 1 && // 1st Class
              bit4(0x001D4A) == 1    // Wild Rat
)             

achievement(
    title = "Beastlore II", description = "Learn the Tier 2, 3, and 4 Rages", points = 1,
    id = 6197, badge = "07678", published = "3/13/2014 3:05:47 AM", modified = "11/15/2015 5:01:03 PM",
    trigger = bit7(0x001D32) == 0 && bit0(0x001D34) == 0 && bit3(0x001D43) == 0 && bit6(0x001D2C) == 1 && 
              bit1(0x001D2E) == 1 && bit4(0x001D2F) == 1 && bit3(0x001D30) == 1 && bit2(0x001D31) == 1 && 
              bit2(0x001D33) == 1 && bit5(0x001D33) == 1 && bit1(0x001D34) == 1 && bit6(0x001D35) == 1 && 
              bit2(0x001D36) == 1 && bit3(0x001D36) == 1 && bit1(0x001D37) == 1 && bit6(0x001D37) == 1 && 
              bit5(0x001D38) == 1 && bit3(0x001D39) == 1 && bit4(0x001D39) == 1 && bit1(0x001D3A) == 1 && 
              bit3(0x001D3A) == 1 && bit5(0x001D3A) == 1 && bit0(0x001D3B) == 1 && bit1(0x001D3B) == 1 && 
              bit3(0x001D3B) == 1 && bit1(0x001D3C) == 1 && bit4(0x001D3D) == 1 && bit0(0x001D3E) == 1 && 
              bit4(0x001D3E) == 1 && bit7(0x001D44) == 1 && bit3(0x001D45) == 1 && bit1(0x001D46) == 1 && 
              bit7(0x001D47) == 1 && bit0(0x001D49) == 1 && bit5(0x001D4A) == 1 && bit4(0x001D2D) == 1 && 
              bit0(0x001D35) == 1 && bit2(0x001D35) == 1 && bit2(0x001D3C) == 1 && bit5(0x001D3D) == 1 && 
              bit4(0x001D40) == 1 && bit0(0x001D43) == 1 && bit0(0x001D46) == 1 && bit6(0x001D46) == 1 && 
              bit6(0x001D47) == 1 && bit6(0x001D49) == 1
)

// 8154: unlocked all rages the game allows unless this includes leaping the 3 pugs formation aswell which doesn't actually unlock a rage
// 7891: Vect goyl   supose to be found  in kefka tower  but never show up after 3 hours . I need  it to complet the  beast lord 3  achievement.I dont know how to send  save file.
achievement(
    title = "Beastlore III", description = "Learn the Tier 5 and 6 Rages", points = 1,
    id = 6094, badge = "07679", published = "3/11/2014 3:09:37 AM", modified = "8/31/2014 8:40:04 PM",
    trigger = bit3(0x001D2C) == 1 && bit4(0x001D2C) == 1 && bit7(0x001D2C) == 1 && low4(0x001D2D) == 15 && 
              bit5(0x001D2D) == 1 && high4(0x001D2E) == 15 && bit6(0x001D2F) == 1 && byte(0x001D30) == 255 &&
              bit3(0x001D31) == 1 && bit4(0x001D31) == 1 && bit0(0x001D32) == 1 && bit1(0x001D32) == 1 && 
              high4(0x001D32) == 7 && bit3(0x001D33) == 1 && bit4(0x001D33) == 1 && bit6(0x001D33) == 1 && 
              low4(0x001D34) == 14 && bit5(0x001D34) == 1 && byte(0x001D35) == 255 && low4(0x001D36) == 15 && 
              bit6(0x001D36) == 1 && bit7(0x001D36) == 1 && byte(0x001D37) == 255 && bit1(0x001D38) == 1 && 
              bit7(0x001D38) == 1 && low4(0x001D39) == 15 && bit5(0x001D39) == 1 && bit7(0x001D39) == 1 && 
              bit2(0x001D3A) == 1 && bit7(0x001D3A) == 1 && bit4(0x001D3B) == 1 && bit5(0x001D3B) == 1 && 
              bit7(0x001D3B) == 1 && bit0(0x001D3C) == 1 && bit4(0x001D3C) == 1 && bit5(0x001D3C) == 1 && 
              bit7(0x001D3C) == 1 && bit1(0x001D3D) == 1 && bit2(0x001D3D) == 1 && bit6(0x001D3D) == 1 && 
              bit7(0x001D3D) == 1 && low4(0x001D3E) == 15 && bit5(0x001D3E) == 1 && bit7(0x001D3E) == 1 && 
              bit0(0x001D3F) == 1 && bit1(0x001D3F) == 1 && bit3(0x001D3F) == 1 && bit4(0x001D3F) == 1 && 
              bit5(0x001D3F) == 1 && bit1(0x001D40) == 1 && high4(0x001D40) == 15 && bit1(0x001D41) == 1 && 
              bit3(0x001D41) == 1 && bit4(0x001D41) == 1 && bit5(0x001D41) == 1 && bit6(0x001D41) == 1 && 
              bit0(0x001D42) == 1 && bit1(0x001D42) == 1 && bit2(0x001D42) == 1 && bit4(0x001D42) == 1 && 
              bit5(0x001D42) == 1 && bit7(0x001D42) == 1 && byte(0x001D43) == 247 && bit1(0x001D44) == 1 && 
              bit3(0x001D44) == 1 && high4(0x001D44) == 15 && low4(0x001D45) == 15 && bit4(0x001D45) == 1 && 
              bit5(0x001D45) == 1 && bit6(0x001D45) == 1 && bit2(0x001D46) == 1 && bit3(0x001D46) == 1 && 
              high4(0x001D46) == 15 && byte(0x001D47) == 255 && low4(0x001D48) == 15 && bit4(0x001D48) == 1 && 
              bit6(0x001D48) == 1 && bit7(0x001D48) == 1 && byte(0x001D49) == 255 && byte(0x001D4A) == 255 && 
              byte(0x001D4B) == 255
)

achievement(
    title = "Beastlord", description = "Learn the rarest, most elusive Rages", points = 5,
    id = 5432, badge = "05964", published = "2/21/2014 7:28:03 PM", modified = "4/21/2014 1:37:55 PM",
    trigger = bit7(0x001D32) == 0 && bit0(0x001D34) == 0 && bit3(0x001D43) == 0 && bit5(0x001D2C) == 1 && 
              bit7(0x001D2D) == 1 && bit0(0x001D2E) == 1 && bit2(0x001D2E) == 1 && bit2(0x001D2F) == 1 && 
              bit5(0x001D2F) == 1 && bit7(0x001D2F) == 1 && bit5(0x001D31) == 1 && bit3(0x001D32) == 1 && 
              bit7(0x001D33) == 1 && bit4(0x001D34) == 1 && bit7(0x001D34) == 1 && bit4(0x001D36) == 1 && 
              bit0(0x001D38) == 1 && bit6(0x001D38) == 1 && bit6(0x001D39) == 1 && bit0(0x001D3A) == 1 && 
              bit4(0x001D3A) == 1 && bit6(0x001D3B) == 1 && bit3(0x001D3C) == 1 && bit5(0x001D3C) == 1 && 
              bit0(0x001D3D) == 1 && bit3(0x001D3D) == 1 && bit6(0x001D3E) == 1 && bit2(0x001D3F) == 1 && 
              bit6(0x001D3F) == 1 && bit7(0x001D3F) == 1 && bit0(0x001D40) == 1 && bit2(0x001D40) == 1 && 
              bit3(0x001D40) == 1 && bit2(0x001D41) == 1 && bit7(0x001D41) == 1 && bit3(0x001D42) == 1 && 
              bit6(0x001D42) == 1 && bit0(0x001D44) == 1 && bit2(0x001D44) == 1 && bit7(0x001D45) == 1 && 
              bit5(0x001D48) == 1 && bit2(0x001D4B) == 1 && bit6(0x001D4B) == 1 && bit5(0x001D36) == 1
)

achievement(
    title = "Patience Pays III", description = "Uncurse the Curse Shield", points = 1,
    id = 7284, badge = "07399", published = "4/12/2014 2:41:51 AM", modified = "8/31/2014 4:35:51 AM",
    trigger = byte(0x001DD5) == 255 && byte(0x00007A) == 166 && byte(0x00E4B3) == 103
)

// 7139: started up game unplayed before no files and triggered both gillianare and power level 1
// 2245: I triggered it using Relm's sketch glitch in Zozo (world of balance)
achievement(
    title = "Power Level I", description = "At least one character has reached level 40", points = 1,
    id = 7295, badge = "07409", published = "4/12/2014 4:11:52 PM", modified = "4/16/2014 1:53:15 PM",
    trigger = character_level(character_terra) >= 3 && 
              unless(current_loaded_map() == 3) && unless(current_loaded_map() == 0) && 
              unless(current_loaded_map() == 41) && unless(current_loaded_map() == 23) && 
              unless(current_loaded_map() == 20) && unless(current_loaded_map() == 244) && 
              unless(current_loaded_map() == 18) && unless(demo_mode() == 16383) &&
              ((character_level(character_terra) >= 40) ||
               (character_level(character_locke) >= 40) ||
               (character_level(character_cyan) >= 40) ||
               (character_level(character_shadow) >= 40) ||
               (character_level(character_edgar) >= 40) ||
               (character_level(character_sabin) >= 40) ||
               (character_level(character_celes) >= 40) ||
               (character_level(character_strago) >= 40) ||
               (character_level(character_relm) >= 40) ||
               (character_level(character_setzer) >= 40) ||
               (character_level(character_mog) >= 40) ||
               (character_level(character_gau) >= 40) ||
               (character_level(character_gogo) >= 40) ||
               (character_level(character_umaro) >= 40))
)

achievement(
    title = "Power Level II", description = "At least one character has reached level 99", points = 1,
    id = 7297, badge = "07411", published = "4/12/2014 4:46:01 PM", modified = "4/22/2014 2:58:10 PM",
    trigger = character_level(character_terra) >= 3 &&
              ((character_level(character_terra) == 99) ||
               (character_level(character_locke) == 99) ||
               (character_level(character_cyan) == 99) ||
               (character_level(character_shadow) == 99) ||
               (character_level(character_edgar) == 99) ||
               (character_level(character_sabin) == 99) ||
               (character_level(character_celes) == 99) ||
               (character_level(character_strago) == 99) ||
               (character_level(character_relm) == 99) ||
               (character_level(character_setzer) == 99) ||
               (character_level(character_mog) == 99) ||
               (character_level(character_gau) == 99) ||
               (character_level(character_gogo) == 99) ||
               (character_level(character_umaro) == 99))
)

achievement(
    title = "Patron Auctioneer", description = "Win all the exclusive items at the Auction House", points = 5,
    id = 6440, badge = "06866", published = "3/24/2014 2:25:38 AM", modified = "3/24/2014 2:27:26 AM",
    trigger = never(current_map() != 200) && 
              bit2(0x001A6B) == 1 && // ZoneSeek
              bit6(0x001A6B) == 1 && // Golem
              bit5(0x001ECA) == 1 && // Hero Ring
              bit5(0x001ECB) == 1    // Zephyr Cape
)

// cannot get the ragnarok sword or you don't get the ragnarok esper, but the ragnarok sword is required
// to get the Illumina (Illuminated achievement)
achievement(
    title = "Life, Crystalized", description = "Collect all Magicite", points = 5,
    id = 6618, badge = "07332", published = "3/28/2014 4:50:54 AM", modified = "4/21/2014 5:01:22 PM",
    trigger = espers_learned() == 255 && bit0(0x001A6A) == 1 && bit1(0x001A6A) == 1 && bit2(0x001A6A) == 1 && 
              bit5(0x001A6A) == 1 &&   // bahamut
              bit6(0x001A6A) == 1 &&   // alexandr
              bit7(0x001A6A) == 1 &&   // crusader
              byte(0x001A6B) == 255 && // ragnarok, kirin, zoneseek, bismark, phantom, sraphim, golem, unicorn
              bit0(0x001A6C) == 1 &&   // starlet
              bit1(0x001A6C) == 1 &&   // fenrir
              bit2(0x001A6C) == 1 &&   // phoenix
              ((bit3(0x001A6A) == 1 && bit4(0x001A6A) == 0) || // odin
               (bit3(0x001A6A) == 0 && bit4(0x001A6A) == 1))   // raiden
)

achievement(
    title = "N.o...e.s.c.a.p.e...!", description = "Deplete all 55,555 HP from Doom Gaze in one encounter, and obtain Bahamut", points = 5,
    id = 6801, badge = "07748", published = "4/4/2014 3:56:45 AM", modified = "4/22/2014 2:00:47 AM",
    trigger = once(monster_formation() == 463) && once(battle_background() == 41) && once(enemy_health() == 55555) && 
              once(enemy_health() == 0) && once(current_loaded_map() == 17) && bit5(0x001A6A) == 1 && 
              never(current_loaded_map() == 37376)
)

achievement(
    title = "Godhand", description = "Deal 9,999 damage in a single attack (Final value may be reduced)", points = 5,
    id = 6799, badge = "07152", published = "4/4/2014 3:05:05 AM", modified = "4/21/2014 4:57:55 PM",
    trigger = battle_damage() >= 9999 && word(0x002F30) == 0 && word(0x002F32) == 0 && word(0x002F36) == 65535 && 
              word(0x002F38) == 65535 && unless(battle_damage() == 17137)
)

// 7140: started up game unplayed before no files and triggered both gillianare and power level 1
achievement(
    title = "Gillionaire", description = "Earn 5,000,000 Gp", points = 5,
    id = 7200, badge = "02589", published = "4/10/2014 12:37:36 AM", modified = "4/21/2014 4:57:38 PM",
    trigger = money() >= 76 && byte(0x001861) >= 75 && byte(0x001862) >= 64 && unless(dialog_scroll_location() == 0) && 
              unless(current_loaded_map() == 3) && unless(current_loaded_map() == 23) && 
              unless(current_loaded_map() == 20) && unless(current_loaded_map() == 244) && 
              unless(current_loaded_map() == 18)
)
