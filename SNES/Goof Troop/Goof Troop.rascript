// Goof Troop
// #ID = 238

// $0000B6: Current Stage:
//          0x00 = 1; 0x01 = 2; 0x02 = 3; 0x03 = 4; 0x04 = 5
function current_stage() => byte(0x0000B6)

// $0000B7: Bit1 = Demo (0x00 - no, 0x01 - yes)
function current_room() => byte(0x0000B7)

// $0000C3: fase

// $0000CC: Continues
function continues() => byte(0x0000CC)

// $0000F8: First Stage Boss hits:
//          0x00 = Start
//          0x07 = Dead
function boss1_hp() => byte(0x0000F8)

// $000106: Char animation (0x29 hit by ally)
// $000107: Char control:
//          0xc1 = Being hit by enemy
// $00010D: P1 direction
// $000111: Player 1 X Position (From Left to Right)
// $000114: Player 1 Y Position (From Top to Bottom)

// $00011D: coracoes/HEARTS
function current_hearts() => byte(0x00011D)

// $000140: Itens Amount 0x00 = 1, 0x02 = 2
// $000141: Active Item
//          0x00 = First
//          0x02 = Second
// $000142: First Item:
//          0x00 = Empty; 0x02 = Hookshot; 0x04 = Candle; 0x06 = Silver Key; 0x08 = Gold Key; 0x0a = Shovel; 0x0c = Bell; 0x0e = Wood
// $000143: Second Item:
//          0x00 = Empty; 0x02 = Hookshot; 0x04 = Candle; 0x06 = Silver Key; 0x08 = Gold Key; 0x0a = Shovel; 0x0c = Bell; 0x0e = Wood
// $000154: P1 Hands Up

// $000156: Player 1 Character select 00 = Max 02 = Goof
function p1_character() => byte(0x000156)

// $000157: vidas / lives player 1
function p1_lives() => byte(0x000157)

// $00015E: Some position

// $0001D6: Player 2 Character Select 00 = Max 02 = Goof
function p2_character() => byte(0x0001D6)

// $0001D7: Player 2 Lives
function p2_lives() => byte(0x0001D7)

// $0001F0: Player 2 Status, 02 = Press Start to join
//          04 = alive
//          06 = wait
function p2_status() => byte(0x0001F0)
function trigger_1p_only() => never(p2_status() == 4)

// $000213: Main Menu Item

// $00021C: Second Boss HP 0x30 to 0x00
//          Each Barrel Give 5 Damage, 9 Barrels to Kill
//          -- ALSO USED FOR OTHER BOSSES --
function boss2_hp() => byte(0x00021C)

// $00023F: selecao personagens
// $00026C: Blue Skelleton HP / Green Centipede 0x28 to 0x00, 8 hits (crash if chng)
function boss3_hp() => byte(0x00026C)

// $000298: Green Cent Size 0x0a to 0x05 to 0x00 (changeable)
// $00058C: Red Centipede 0x28 to 0x00, 8 hits (crash if chng)
// $0005B8: Red Cent Size 0x0a to 0x05 to 0x00 (changeable)
// $000B05: objet lancÃ©
// $000B0B: Item id val
// $000B0D: Launched item dir
// $000B10: launch speed ?
// $000B16: launch position X/y?
// $000B17: Launch position x/Y?
// $000B4F: oiseau ?
// $001144: Door Open bits (Stg1, Stg2, Stg4, Stg5)
// $001145: Door Bits (Stg3, Stg4, Stg5 Last Door)
// $001EA2: Main Menu Selected Game (0x9c)
// $01FF01: fase2
// $01FF11: Stage Status
function trigger_stage_clear() => byte(0x01FF11) == 0x1C

achievement(
    title = "The Goofy Forest", description = "Get to Level 2 as Goofy (1P-2P)", points = 5,
    id = 1463, badge = "03761", published = "5/30/2013 8:15:11 PM", modified = "4/25/2015 3:09:09 AM",
    trigger = p1_character() == 2 && current_stage() == 1 && prev(current_stage()) == 0 && current_room() == 0 && 
              byte(0x01FF11) != 29 && byte(0x01FF11) != 25
)

achievement(
    title = "The Cooler Forest", description = "Get to Level 2 as Max (1P-2P)", points = 5,
    id = 19667, badge = "03761", published = "1/6/2015 3:18:14 PM", modified = "4/25/2015 3:17:47 AM",
    trigger = current_stage() == 1 && prev(current_stage()) == 0 && p1_character() == 0 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Goofy Castle", description = "Reach Level 3 - The Castle as Goofy (1P-2P)", points = 5,
    id = 1464, badge = "03762", published = "5/30/2013 8:15:15 PM", modified = "4/25/2015 3:18:18 AM",
    trigger = current_stage() == 2 && prev(current_stage()) == 1 && p1_character() == 2 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Cooler Castle", description = "Reach Level 3 - The Castle as Max (1P-2P)", points = 5,
    id = 19669, badge = "03762", published = "1/6/2015 3:21:13 PM", modified = "4/25/2015 3:18:53 AM",
    trigger = current_stage() == 2 && prev(current_stage()) == 1 && p1_character() == 0 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Goofy Caves", description = "Reach Level 4 - The Caves as Goofy (1P-2P)", points = 5,
    id = 1465, badge = "03763", published = "5/30/2013 8:15:19 PM", modified = "4/25/2015 3:18:59 AM",
    trigger = current_stage() == 3 && prev(current_stage()) == 2 && p1_character() == 2 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Cooler Caves ", description = "Reach Level 4 - The Caves as Max (1P-2P)", points = 5,
    id = 19671, badge = "03763", published = "1/6/2015 3:33:36 PM", modified = "4/25/2015 3:19:03 AM",
    trigger = current_stage() == 3 && prev(current_stage()) == 2 && p1_character() == 0 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Goofy Pirate Ship", description = "Reach Level 5 - The Pirate Ship with Goofy (1P-2P)", points = 5,
    id = 1466, badge = "03764", published = "5/30/2013 8:15:23 PM", modified = "11/1/2016 9:56:54 PM",
    trigger = current_stage() == 4 && prev(current_stage()) != 3 && p1_character() == 2 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "The Cooler Pirate Ship", description = "Reach Level 5 - The Pirate Ship with Max (1P-2P)", points = 5,
    id = 19672, badge = "03764", published = "1/6/2015 3:44:27 PM", modified = "4/25/2015 3:19:12 AM",
    trigger = current_stage() == 4 && prev(current_stage()) == 3 && p1_character() == 0 && current_room() == 0 && 
              byte(0x01FF11) != 25 && byte(0x01FF11) != 29
)

achievement(
    title = "Gosh! The End!", description = "Finish the Game as Goofy (1P-2P)", points = 25,
    id = 1468, badge = "19431", published = "5/30/2013 11:17:39 PM", modified = "12/8/2016 12:18:31 AM",
    trigger = byte(0x0000C3) == 4 && current_stage() == 4 && byte(0x01FF01) == 4 && byte(0x01FF11) == 25 && 
              p1_character() == 2
)

achievement(
    title = "So Cool, So Goof", description = "Finish the Game as Max (1P-2P)", points = 25,
    id = 19664, badge = "19430", published = "1/6/2015 2:34:52 PM", modified = "12/8/2016 12:18:35 AM",
    trigger = byte(0x0000C3) == 4 && current_stage() == 4 && byte(0x01FF01) == 4 && byte(0x01FF11) == 25 && 
              p1_character() == 0
)

function trigger_no_damage() => never(prev(byte(0x000107)) == 0xC1)
function trigger_engage_boss(stage, room) => current_stage() == stage && never(current_room() != room) &&
                                             byte(0x0070) == 8 // halway through fade from black

achievement(
    title = "Professional Thrower", description = "Kill the First Boss Without Taking Damage (1P)", points = 20,
    id = 22176, badge = "22102", published = "4/4/2015 1:41:47 AM", modified = "12/8/2016 12:19:43 AM",
    trigger = trigger_engage_boss(0, 14) && once(boss1_hp()) == 7 && boss1_hp() == 0 && 
              trigger_no_damage() && trigger_1p_only()
//    trigger = current_stage() == 0 && bit2(0x001144) == 1 && once(prev(bit2(0x001144)) == 0) && 
//              prev(boss1_hp()) < boss1_hp() && boss1_hp() == 7 && trigger_no_damage() && 
//              never(prev(current_stage()) != current_stage()) && trigger_1p_only()
)

// Ticket 11374: Used the password to the second stage, reached the boss, ended up tooking damage, then intentionally
//               lost all my lives so I could use a continue to try again. Did it, beat the boss damageless but didn't
//               get the cheevo. (later got the cheevo by doing it first try)
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
achievement(
    title = "Firefighter", description = "Kill the Second Boss Without Taking Damage (1P)", points = 20,
    id = 22177, badge = "22103", published = "4/4/2015 1:41:53 AM", modified = "12/8/2016 12:19:48 AM",
    trigger = trigger_engage_boss(1, 15) && once(boss2_hp()) == 48 && boss2_hp() == 0 && 
              trigger_no_damage() && trigger_1p_only()
//    trigger = current_stage() == 1 && bit4(0x001144) == 1 && once(prev(bit4(0x001144)) == 0) && 
//              prev(boss2_hp()) > boss2_hp() && boss2_hp() == 0 && trigger_no_damage() && 
//              never(prev(current_stage()) != current_stage()) && trigger_1p_only()
)

// Ticket 11370: Triggered after I did the first hit with a blue bone in the Red Skelleton, without taking damage.
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
// Ticket 11240: i haven't done the requirement for the achievement, and yet, it have been achieve
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
// Ticket 10203: This achievement triggered when I landed the first hit at the start of the boss fight.
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
achievement(
    title = "Bone Crusher", description = "Kill the Third Boss Without Taking Damage (1P)", points = 20,
    id = 22178, badge = "22104", published = "4/4/2015 1:41:57 AM", modified = "1/20/2017 12:48:49 AM",
    trigger = trigger_engage_boss(2, 25) && 
              once(boss2_hp() == 48) &&              // prevent trigger if kill while taking damage
              boss2_hp() == 0 && boss3_hp() == 0 &&
              trigger_no_damage() && trigger_1p_only()
//    trigger = current_stage() == 2 && trigger_no_damage() && 
//              never(prev(current_stage()) != current_stage()) && trigger_1p_only() && bit5(0x001145) == 1 && 
//              prev(boss2_hp()) > boss2_hp()
)

achievement(
    title = "Mine Debugger", description = "Kill the Fourth Boss Without Taking Damage (1P)", points = 20,
    id = 22179, badge = "22105", published = "4/4/2015 1:42:02 AM", modified = "4/22/2015 12:43:41 AM",
    trigger = trigger_engage_boss(3, 25) && 
              once(byte(0x000298) == 10) && // prevent trigger on fade to black leaving previous room
              byte(0x000298) == 0 && 
              byte(0x0005B8) == 0 &&
              trigger_no_damage() && trigger_1p_only()
//    trigger = current_stage() == 3 && bit1(0x001146) == 1 && once(prev(bit1(0x001146)) == 0) && 
//              once(prev(byte(0x000298)) > byte(0x000298)) && byte(0x000298) == 0 && 
//              once(prev(byte(0x0005B8)) > byte(0x0005B8)) && byte(0x0005B8) == 0 && trigger_no_damage() && 
//              never(prev(current_stage()) != current_stage()) && trigger_1p_only()
)

// Ticket 11371: This one triggered in the previous room to the final boss (the one where you control the red cannon
//               through the switches on the floor), after I have beat the last of the four regular green pirates with
//               the cannon (playing as Goofy).
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
// Ticket 11241: i haven't done the requirement for the achievement, and yet, it have been achieve
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
achievement(
    title = "End of Piracy", description = "Kill the Final Boss Without Taking Damage (1P)", points = 20,
    id = 22180, badge = "22106", published = "4/4/2015 1:42:06 AM", modified = "6/24/2017 1:13:43 AM",
    trigger = trigger_engage_boss(4, 25) && once(boss2_hp() == 56) && boss2_hp() == 0 && 
              trigger_no_damage() && trigger_1p_only()
//    trigger = current_stage() == 4 && bit4(0x001145) == 1 && boss2_hp() == 0 && trigger_no_damage() && 
//              never(prev(current_stage()) != current_stage()) && trigger_1p_only()
)

function trigger_before_stage(stage) => current_stage() == stage && once(byte(0x00A0) == 6) // 6 = map
function trigger_fruitless(stage) => trigger_before_stage(stage) && trigger_stage_clear() &&
                                     never(current_hearts() > 0) && never(p1_lives() > 3) && trigger_1p_only()

// Ticket 11239: i haven't done the requirement for the achievement, and yet, it have been achieve
//               MD5: bb6a1198e291c8ae58e9581a4296ed4d
achievement(
    title = "No Fruits Allowed 1", description = "Finish Stage 1 without eating any fruits and never have more than 2 lives (1P)", points = 25,
    id = 22398, badge = "22333", published = "4/19/2015 3:28:32 PM", modified = "12/8/2016 12:16:25 AM",
    trigger = once(byte(0x01FF11) == 23) && never(current_hearts() > 0) && never(p1_lives() > 3) && 
              never(byte(0x01FF11) == 33) && byte(0x01FF11) == 28 && current_stage() == 0 && 
              unless(current_stage() != 0) && trigger_1p_only()
)

achievement(
    title = "No Fruits Allowed 2", description = "Finish Stage 2 without eating any fruits and never have more than 2 lives (1P)", points = 15,
    id = 22399, badge = "22332", published = "4/19/2015 3:28:36 PM", modified = "4/22/2015 12:35:04 AM",
    trigger = once(byte(0x01FF11) == 23) && never(current_hearts() > 0) && never(p1_lives() > 3) && 
              never(byte(0x01FF11) == 33) && byte(0x01FF11) == 28 && current_stage() == 1 && 
              unless(current_stage() != 1) && trigger_1p_only()
)

achievement(
    title = "No Fruits Allowed 3", description = "Finish Stage 3 without eating any fruits and never have more than 2 lives (1P)", points = 25,
    id = 22400, badge = "22334", published = "4/19/2015 3:28:39 PM", modified = "12/8/2016 12:16:36 AM",
    trigger = once(byte(0x01FF11) == 23) && never(current_hearts() > 0) && never(p1_lives() > 3) && 
              never(byte(0x01FF11) == 33) && byte(0x01FF11) == 28 && current_stage() == 2 && 
              unless(current_stage() != 2) && trigger_1p_only()
)

achievement(
    title = "No Fruits Allowed 4", description = "Finish Stage 4 without eating any fruits and never have more than 2 lives (1P)", points = 25,
    id = 22401, badge = "22335", published = "4/19/2015 3:28:44 PM", modified = "12/8/2016 12:16:41 AM",
    trigger = once(byte(0x01FF11) == 23) && never(current_hearts() > 0) && never(p1_lives() > 3) && 
              never(byte(0x01FF11) == 33) && byte(0x01FF11) == 28 && current_stage() == 3 && 
              unless(current_stage() != 3) && trigger_1p_only()
)

achievement(
    title = "No Fruits Allowed 5", description = "Finish Stage 5 without eating any fruits and never have more than 2 lives (1P)", points = 25,
    id = 22402, badge = "22336", published = "4/19/2015 3:28:47 PM", modified = "12/8/2016 12:16:47 AM",
    trigger = once(byte(0x01FF11) == 23) && never(current_hearts() > 0) && never(p1_lives() > 3) && 
              never(byte(0x01FF11) == 33) && byte(0x01FF11) == 28 && current_stage() == 4 && 
              unless(current_stage() != 4) && trigger_1p_only()
)

achievement(
    title = "Take it easy!", description = "Get hit by an ally during the boss fight on stage 2 (1P-2P)", points = 5,
    id = 22405, badge = "22339", published = "4/20/2015 2:57:03 PM", modified = "4/22/2015 12:38:05 AM",
    trigger = current_stage() == 1 && byte(0x01FF11) == 27 && bit0(0x000106) == 0 && bit1(0x000106) == 1 && 
              bit2(0x000106) == 1 && byte(0x000107) == 191
)

achievement(
    title = "Explorer", description = "Find 2 secret doors in the castle (1P-2P)", points = 15,
    id = 22406, badge = "22340", published = "4/20/2015 2:57:09 PM", modified = "12/8/2016 12:17:09 AM",
    trigger = bit2(0x001144) == 1 && bit6(0x001144) == 1 && current_stage() == 2 && byte(0x01FF11) == 18
)

achievement(
    title = "Puzzle Master", description = "Completely unlock both paths on Stage 4 (1P-2P)", points = 15,
    id = 22407, badge = "22341", published = "4/20/2015 2:57:13 PM", modified = "4/22/2015 12:38:12 AM",
    trigger = bit4(0x001144) == 1 && bit5(0x001144) == 1 && bit6(0x001144) == 1 && bit7(0x001144) == 1 && 
              bit0(0x001145) == 1 && bit1(0x001145) == 1 && bit3(0x001145) == 1 && current_stage() == 3 && 
              byte(0x01FF11) == 19
)

achievement(
    title = "Dexterous", description = "Run pass all cannons without destroying them on Stage 5 (1P-2P)", points = 10,
    id = 22408, badge = "22342", published = "4/20/2015 2:57:15 PM", modified = "4/22/2015 12:38:15 AM",
    trigger = bit0(0x001145) == 0 && bit1(0x001145) == 0 && bit2(0x001145) == 0 && bit3(0x001145) == 0 && 
              bit7(0x001144) == 1 && current_stage() == 4 && byte(0x01FF11) == 20
)

achievement(
    title = "Extra Goof", description = "Collect your first 6 Hearts in Game (1P-2P)", points = 10,
    id = 1437, badge = "03759", published = "5/30/2013 6:58:21 PM", modified = "12/8/2016 12:17:41 AM",
    trigger = current_hearts() == 6
)

achievement(
    title = "So Much Goof", description = "Have 6 Lives (1P-2P)", points = 10,
    id = 19673, badge = "03760", published = "1/6/2015 3:55:27 PM", modified = "12/8/2016 12:17:36 AM",
    trigger = p1_lives() == 7
)

achievement(
    title = "Full of Goof", description = "First 9 Live in Game (1P-2P)", points = 15,
    id = 1467, badge = "03760", published = "5/30/2013 8:15:29 PM", modified = "12/8/2016 12:17:49 AM",
    trigger = p1_lives() == 10
)

achievement(
    title = "Continuous", description = "Get 9 Continues (1P-2P)", points = 15,
    id = 22409, badge = "22343", published = "4/20/2015 2:57:18 PM", modified = "4/22/2015 12:38:18 AM",
    trigger = continues() == 9
)

achievement(
    title = "Professional Goof", description = "Complete the game (Stg 1 to Stg 5) without taking damage as Goofy (1P)", points = 50,
    id = 22403, badge = "22337", published = "4/20/2015 12:33:22 AM", modified = "4/23/2015 12:01:56 AM",
    trigger = once(byte(0x01FF11) == 26) && once(byte(0x01FF11) == 17) && once(byte(0x01FF11) == 30) && 
              once(byte(0x01FF11) == 18) && once(byte(0x01FF11) == 19) && once(byte(0x01FF11) == 20) && 
              never(byte(0x000107) == 193) && trigger_1p_only() && never(byte(0x01FF11) == 16) && 
              byte(0x01FF11) == 28 && p1_character() == 2
)

achievement(
    title = "Professional Cool", description = "Complete the game (Stg 1 to Stg 5) without taking damage as Max (1P)", points = 50,
    id = 22404, badge = "22338", published = "4/20/2015 12:33:25 AM", modified = "4/23/2015 12:01:59 AM",
    trigger = once(byte(0x01FF11) == 26) && once(byte(0x01FF11) == 17) && once(byte(0x01FF11) == 30) && 
              once(byte(0x01FF11) == 18) && once(byte(0x01FF11) == 19) && once(byte(0x01FF11) == 20) && 
              never(byte(0x000107) == 193) && trigger_1p_only() && never(byte(0x01FF11) == 16) && 
              byte(0x01FF11) == 28 && p1_character() == 0
)
