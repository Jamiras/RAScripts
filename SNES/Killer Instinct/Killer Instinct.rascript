// Killer Instinct
// #ID = 279
//
// md5: 2bb72e91f9b2ac505d917607c23e92ce (USA v1.0)
// md5: c9b698cf98f1aede7a87c1e449384632 (USA v1.1)
// md5: e78a5aa2b537f92adb32eae36acac7c2 (USA beta)
// md5: 9d0c50c8c1c5970c67c0fc41a23fb8b8 (Europe)

function current_character() => byte(0x024E)
function current_opponent() => byte(0x0252)
function current_screen() => word(0x0000)
function trigger_single_player() => byte(0x0214) == 0
function current_battle_index() => byte(0x17EE)
function current_difficulty() => byte(0x024C)
function current_combo_counter() => byte(0x0DE4)
function current_health() => byte(0x0D24)
function current_opponent_health() => byte(0x0D28)
function continues_used() => byte(0x10BE)

function trigger_character_ending(character) => 
    current_character() == character &&
    trigger_single_player() && 
    (current_battle_index() == 11 && current_screen() == 60842) // USA v1.1
// || (byte(0x17EC) == 11           && current_screen() == 60844) // USA v1.0
// || (current_battle_index() == 11 && current_screen() == 60933) // Europe
    
function trigger_battle_screen() => current_screen() >= 34542 && current_screen() <= 34545
screen_1p_battle = 34542 // US v1.1, Eur
screen_2p_battle = 34545 // US V1.0

character_jago = 0
character_tjcombo = 1
character_spinal = 2
character_thunder = 3
character_glacius = 4
character_fulgore = 5
character_cinder = 6
character_sabrewulf = 7
character_orchid = 8
character_riptor = 9
character_eyedol = 10

achievement(
    title = "Eyedol", description = "Become Eyedol", points = 5,
    id = 2373, published = "8/22/2013 12:35:25 AM", modified = "8/25/2013 1:51:48 AM",
    trigger = current_screen() == 37008 && once(current_character() == character_cinder) && 
              never(bit0(0x0012B1) == 0) && never(current_screen() != 37008) && 
              current_character() == character_eyedol && 
              once(word(0x0012B0) == 288) && once(word(0x0012B0) == 272) && 
              once(word(0x0012B0) == 320) && once(word(0x0012B0) == 384) && 
              once(word(0x0012B0) == 16640) && once(word(0x0012B0) == 33024) && 
              trigger_single_player()
)

// NOTE: does not check current_screen, so can't use trigger_character_ending (probably should)
achievement(
    title = "Idol", description = "Defeat Eyedol while playing as Eyedol", points = 5,
    id = 2374, published = "8/22/2013 12:57:26 AM", modified = "8/25/2013 1:51:38 AM",
    trigger = current_battle_index() == 11 && current_character() == character_eyedol &&
              trigger_single_player() && current_opponent() == character_eyedol
)

achievement(
    title = "Jago", description = "Get Jago's ending", points = 5,
    id = 2375, published = "8/22/2013 3:29:18 AM", modified = "8/23/2013 11:36:05 PM",
    trigger = trigger_character_ending(character_jago) && current_difficulty() > 2
)

achievement(
    title = "T.J.Combo", description = "Get Combo's ending", points = 5,
    id = 2376, published = "8/22/2013 3:29:21 AM", modified = "8/23/2013 11:36:07 PM",
    trigger = trigger_character_ending(character_tjcombo) && current_difficulty() > 2
)

achievement(
    title = "Spinal", description = "Get Spinal's ending", points = 5,
    id = 2377, published = "8/22/2013 3:29:24 AM", modified = "8/23/2013 11:36:09 PM",
    trigger = trigger_character_ending(character_spinal) && current_difficulty() > 2
)

achievement(
    title = "Thunder", description = "Get Thunder's ending", points = 5,
    id = 2378, published = "8/22/2013 3:29:27 AM", modified = "8/23/2013 11:36:11 PM",
    trigger = trigger_character_ending(character_thunder) && current_difficulty() > 2
)

achievement(
    title = "Glacius", description = "Get Glacius' ending", points = 5,
    id = 2379, published = "8/22/2013 3:29:30 AM", modified = "8/23/2013 11:36:12 PM",
    trigger = trigger_character_ending(character_glacius) && current_difficulty() > 2
)

achievement(
    title = "Fulgore", description = "Get Fulgore's ending", points = 5,
    id = 2380, published = "8/22/2013 3:29:32 AM", modified = "8/23/2013 11:36:14 PM",
    trigger = trigger_character_ending(character_fulgore) && current_difficulty() > 2
)

achievement(
    title = "Cinder", description = "Get Cinder's ending", points = 5,
    id = 2381, published = "8/22/2013 3:29:34 AM", modified = "8/23/2013 11:36:18 PM",
    trigger = trigger_character_ending(character_cinder) && current_difficulty() > 2
)

achievement(
    title = "Sabrewulf", description = "Get Sabrewulf's ending", points = 5,
    id = 2382, published = "8/22/2013 3:29:35 AM", modified = "8/23/2013 11:36:20 PM",
    trigger = trigger_character_ending(character_sabrewulf) && current_difficulty() > 2
)

achievement(
    title = "Orchid", description = "Get Orchid's ending", points = 5,
    id = 2383, published = "8/22/2013 3:29:37 AM", modified = "8/23/2013 11:36:21 PM",
    trigger = trigger_character_ending(character_orchid) && current_difficulty() > 2
)

achievement(
    title = "Riptor", description = "Get Riptor's ending", points = 5,
    id = 2384, published = "8/22/2013 3:29:39 AM", modified = "8/23/2013 11:36:23 PM",
    trigger = trigger_character_ending(character_riptor) && current_difficulty() > 2
)

achievement(
    title = "Billy Eyedol", description = "Get Eyedol's ending", points = 10,
    id = 2385, published = "8/22/2013 3:45:14 AM", modified = "8/25/2013 1:51:24 AM",
    trigger = trigger_character_ending(character_eyedol) && current_difficulty() > 2
)

achievement(
    title = "Speed Demon", description = "Win a fight between 10 and 15 seconds", points = 15,
    id = 2386, published = "8/22/2013 6:06:22 AM", modified = "8/28/2013 10:58:39 PM",
    trigger = byte(0x0010DC) == 8 && byte(0x0010DC) < 9 && byte(0x0010DB) > 4 && current_screen() >= 34542 && current_opponent_health() == 0 && current_health() > 0 && byte(0x000248) == 0 && byte(0x000DEA) == 1 && word(0x000EC4) > 0 && byte(0x0010EC) == 9 && trigger_single_player() && current_screen() <= 34545
)

achievement(
    title = "Combo City - Jago", description = "Perform a 30 or higher combo with Jago", points = 10,
    id = 2390, published = "8/22/2013 7:13:33 PM", modified = "10/26/2016 6:31:45 PM",
    trigger = current_combo_counter() > 30 && current_character() == character_jago && trigger_battle_screen()
)

achievement(
    title = "Combo City - T.J.Combo", description = "Perform over 36 combo with T.J.Combo", points = 10,
    id = 2391, published = "8/22/2013 7:13:35 PM", modified = "10/26/2016 6:31:49 PM",
    trigger = current_combo_counter() > 36 && current_character() == character_tjcombo && trigger_battle_screen()
)

achievement(
    title = "Combo City - Spinal", description = "Perform over 27 combo with Spinal", points = 10,
    id = 2392, published = "8/22/2013 7:13:36 PM", modified = "10/26/2016 6:31:52 PM",
    trigger = current_combo_counter() > 27 && current_character() == character_spinal && trigger_battle_screen()
)

achievement(
    title = "Combo City - Thunder", description = "Perform over 33 combo with Thunder", points = 10,
    id = 2393, published = "8/22/2013 7:13:38 PM", modified = "10/26/2016 6:31:56 PM",
    trigger = current_combo_counter() > 33 && current_character() == character_thunder && trigger_battle_screen()
)

achievement(
    title = "Combo City - Glacius", description = "Perform over 29 combo with Glacius", points = 10,
    id = 2394, published = "8/22/2013 7:13:40 PM", modified = "10/26/2016 6:32:00 PM",
    trigger = current_combo_counter() > 29 && current_character() == character_glacius && trigger_battle_screen()
)

achievement(
    title = "Combo City - Fulgore", description = "Perform over 30 combo with Fulgore", points = 10,
    id = 2395, published = "8/22/2013 7:13:42 PM", modified = "10/26/2016 6:32:03 PM",
    trigger = current_combo_counter() > 30 && current_character() == character_fulgore && trigger_battle_screen()
)

achievement(
    title = "Combo City - Cinder", description = "Perform over 33 combo with Cinder", points = 10,
    id = 2396, published = "8/22/2013 7:13:43 PM", modified = "10/26/2016 6:32:07 PM",
    trigger = current_combo_counter() > 33 && current_character() == character_cinder && trigger_battle_screen()
)

achievement(
    title = "Combo City - Sabrewulf", description = "Perform over 31 combo with Sabrewulf", points = 10,
    id = 2397, published = "8/22/2013 7:13:45 PM", modified = "10/26/2016 6:32:11 PM",
    trigger = current_combo_counter() > 31 && current_character() == character_sabrewulf && trigger_battle_screen()
)

achievement(
    title = "Combo City - Orchid", description = "Perform a 48 or higher combo with Orchid", points = 10,
    id = 2398, published = "8/22/2013 7:13:47 PM", modified = "10/26/2016 6:32:17 PM",
    trigger = current_combo_counter() > 48 && current_character() == character_orchid && trigger_battle_screen()
)

achievement(
    title = "Combo City - Riptor", description = "Perform over 30 combo with Riptor", points = 10,
    id = 2399, published = "8/22/2013 7:13:49 PM", modified = "10/26/2016 6:32:22 PM",
    trigger = current_combo_counter() > 30 && current_character() == character_riptor && trigger_battle_screen()
)

achievement(
    title = "Combo City - Eyedol", description = "Perform over 10 combo with Eyedol", points = 10,
    id = 2400, published = "8/22/2013 7:13:50 PM", modified = "10/26/2016 6:32:26 PM",
    trigger = current_combo_counter() > 10 && current_character() == character_eyedol && trigger_battle_screen()
)

achievement(
    title = "Easy Mode", description = "Complete the game on any difficulty", points = 5,
    id = 2401, published = "8/22/2013 8:29:32 PM", modified = "3/11/2014 4:05:55 AM",
    trigger = trigger_single_player() && 
              ((current_battle_index() == 10 && current_difficulty() == 0) || 
               (current_battle_index() == 11 && current_difficulty() >= 3 && current_difficulty() < 6))
)

achievement(
    title = "Champion", description = "Complete the game on default or higher difficulty", points = 15,
    id = 2402, published = "8/22/2013 8:29:34 PM", modified = "8/23/2013 5:28:02 AM",
    trigger = current_battle_index() == 11 && current_difficulty() >= 3 && current_difficulty() < 6 && trigger_single_player()
)

achievement(
    title = "Legend", description = "Complete the game on the highest difficulty", points = 30,
    id = 2403, published = "8/22/2013 8:29:36 PM", modified = "8/23/2013 5:27:53 AM",
    trigger = current_battle_index() == 11 && current_difficulty() == 5 && trigger_single_player()
)

achievement(
    title = "Killer Instinct", description = "Complete the game without using a Continue on 4 Stars or higher difficulty", points = 15,
    id = 2404, published = "8/22/2013 8:46:41 PM", modified = "3/11/2014 3:58:50 AM",
    trigger = current_battle_index() == 11 && current_difficulty() < 6 && continues_used() == 0 && current_difficulty() > 2 && trigger_single_player()
)

achievement(
    title = "Humiliation", description = "Perform a Humiliation", points = 5,
    id = 2408, published = "8/22/2013 9:31:10 PM", modified = "8/23/2013 5:27:27 AM",
    trigger = byte(0x0010E3) == 1 && current_screen() == 36564 && trigger_single_player()
)

achievement(
    title = "Supreme Victory", description = "Win a fight on your first health bar", points = 5,
    id = 2409, published = "8/22/2013 9:31:12 PM", modified = "8/23/2013 5:27:17 AM",
    trigger = byte(0x0010E2) == 2 && current_screen() == 36564 && trigger_single_player()
)

achievement(
    title = "Killer King", description = "Get over 500,000 Score in a single fight", points = 20,
    id = 2416, published = "8/22/2013 11:01:50 PM", modified = "8/28/2013 10:41:31 PM",
    trigger = current_difficulty() < 6 && word(0x000EC4) >= 1953 && trigger_battle_screen()
)

function trigger_ultra_combo(character) => 
    current_character() == character && trigger_battle_screen() &&
    byte(0x1116) != 0 && byte(0x1117) != 0 && // combo countdown timer and combo hit count
    byte(0x1119) == 13                        // Ultra Combo

function trigger_ultimate_combo(character) => 
    current_character() == character && trigger_battle_screen() &&
    byte(0x1116) != 0 && byte(0x1117) != 0 && // combo countdown timer and combo hit count
    byte(0x1119) == 14                        // Ultimate Combo
    

achievement(
    title = "Ultimate Jago", description = "Perform Jago's Ultimate combo", points = 5,
    id = 2436, published = "8/23/2013 4:43:10 AM", modified = "5/22/2016 1:43:17 PM",
    trigger = trigger_ultimate_combo(character_jago)
)

achievement(
    title = "Ultra Jago", description = "Perform Jago's Ultra combo", points = 5,
    id = 2437, published = "8/23/2013 4:43:12 AM", modified = "5/22/2016 1:43:16 PM",
    trigger = trigger_ultra_combo(character_jago)
)

achievement(
    title = "Ultimate T.J.Combo", description = "Perform T.J.Combo's Ultimate combo", points = 5,
    id = 2438, published = "8/23/2013 4:43:23 AM", modified = "5/22/2016 1:43:14 PM",
    trigger = trigger_ultimate_combo(character_tjcombo)
)

achievement(
    title = "Ultra T.J.Combo", description = "Perform T.J.Combo's Ultra combo", points = 5,
    id = 2439, published = "8/23/2013 4:43:26 AM", modified = "5/22/2016 1:43:13 PM",
    trigger = trigger_ultra_combo(character_tjcombo)
)

achievement(
    title = "Ultimate Spinal", description = "Perform Spinal's Ultimate combo", points = 5,
    id = 2440, published = "8/23/2013 4:43:28 AM", modified = "5/22/2016 1:43:12 PM",
    trigger = trigger_ultimate_combo(character_spinal)
)

achievement(
    title = "Ultra Spinal", description = "Perform Spinal's Ultra combo", points = 5,
    id = 2441, published = "8/23/2013 4:43:29 AM", modified = "5/22/2016 1:43:10 PM",
    trigger = trigger_ultra_combo(character_spinal)
)

achievement(
    title = "Ultimate Thunder", description = "Perform Thunder's Ultimate combo", points = 5,
    id = 2442, published = "8/23/2013 4:43:31 AM", modified = "5/22/2016 1:43:09 PM",
    trigger = trigger_ultimate_combo(character_thunder)
)

achievement(
    title = "Ultra Thunder", description = "Perform Thunder's Ultra combo", points = 5,
    id = 2443, published = "8/23/2013 4:43:33 AM", modified = "5/22/2016 1:43:08 PM",
    trigger = trigger_ultra_combo(character_thunder)
)

achievement(
    title = "Ultimate Glacius", description = "Perform Glacius' Ultimate combo", points = 5,
    id = 2444, published = "8/23/2013 4:43:34 AM", modified = "5/22/2016 1:43:07 PM",
    trigger = trigger_ultimate_combo(character_glacius)
)

achievement(
    title = "Ultra Glacius", description = "Perform Glacius' Ultra combo", points = 5,
    id = 2445, published = "8/23/2013 4:43:36 AM", modified = "5/22/2016 1:43:06 PM",
    trigger = trigger_ultra_combo(character_glacius)
)

achievement(
    title = "Ultimate Fulgore", description = "Perform Fulgore's Ultimate combo", points = 5,
    id = 2446, published = "8/23/2013 4:43:37 AM", modified = "5/22/2016 1:33:01 PM",
    trigger = trigger_ultimate_combo(character_fulgore)
)

achievement(
    title = "Ultra Fulgore", description = "Perform Fulgore's Ultra combo", points = 5,
    id = 2447, published = "8/23/2013 4:43:39 AM", modified = "5/22/2016 1:33:00 PM",
    trigger = trigger_ultra_combo(character_fulgore)
)

achievement(
    title = "Ultimate Cinder", description = "Perform Cinder's Ultimate combo", points = 5,
    id = 2448, published = "8/23/2013 4:43:43 AM", modified = "5/22/2016 1:43:03 PM",
    trigger = trigger_ultimate_combo(character_cinder)
)

achievement(
    title = "Ultra Cinder", description = "Perform Cinder's Ultra combo", points = 5,
    id = 2449, published = "8/23/2013 4:43:48 AM", modified = "5/22/2016 1:43:02 PM",
    trigger = trigger_ultra_combo(character_cinder)
)

achievement(
    title = "Ultimate Sabrewulf", description = "Perform Sabrewulf's Ultimate combo", points = 5,
    id = 2450, published = "8/23/2013 4:43:49 AM", modified = "5/22/2016 1:43:00 PM",
    trigger = trigger_ultimate_combo(character_sabrewulf)
)

achievement(
    title = "Ultra Sabrewulf", description = "Perform Sabrewulf's Ultra combo", points = 5,
    id = 2451, published = "8/23/2013 4:43:52 AM", modified = "5/22/2016 1:42:59 PM",
    trigger = trigger_ultra_combo(character_sabrewulf)
)

achievement(
    title = "Ultimate Orchid", description = "Perform Orchid's Ultimate combo", points = 5,
    id = 2452, published = "8/23/2013 4:43:54 AM", modified = "5/22/2016 1:42:58 PM",
    trigger = trigger_ultimate_combo(character_orchid)
)

achievement(
    title = "Ultra Orchid", description = "Perform Orchid's Ultra combo", points = 5,
    id = 2453, published = "8/23/2013 4:43:55 AM", modified = "5/22/2016 1:42:57 PM",
    trigger = trigger_ultra_combo(character_orchid)
)

achievement(
    title = "Ultimate Riptor", description = "Perform Riptor's Ultimate combo", points = 5,
    id = 2454, published = "8/23/2013 4:43:57 AM", modified = "5/22/2016 1:42:56 PM",
    trigger = trigger_ultimate_combo(character_riptor)
)

achievement(
    title = "Ultra Riptor", description = "Perform Riptor's Ultra combo", points = 5,
    id = 2455, published = "8/23/2013 4:43:59 AM", modified = "5/22/2016 1:42:54 PM",
    trigger = trigger_ultra_combo(character_riptor)
)

achievement(
    title = "Perfect", description = "Win a fight without taking damage", points = 10,
    id = 2462, published = "8/23/2013 5:24:48 AM", modified = "1/29/2014 12:11:03 AM",
    trigger = current_screen() == 34542 && current_health() == 120 && current_opponent_health() == 0 && 
              byte(0x000DE6) == 0 && byte(0x000DEA) == 1 && 
              word(0x000EC4) > 0 &&  // score > 0 (no demo)
              byte(0x0010EC) == 9 && // P1 wins fight
              trigger_single_player()
)

