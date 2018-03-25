// Legend of Zelda: Link''s Awakening DX, The
// #ID = 5371
// MD5: 7351daa3c0a91d8f6fe2fbcca6182478 (U) (V1.2) [C][!]

// $C150: Pause Flag (Upper4 bits)

// $C170: Dialogue Text Characters
function current_dialog_chars() => byte(0x00C170)

// $C173: Dialogue ID
function current_dialog() => byte(0x00C173)

// $CE80: Start of Memory Block: Last n map coordinates entered

// $D369: Music address
function current_music() => byte(0x00D369)

// $D401: Destination data byte 1: 00 - overworld,
//        01 - dungeon,
//        02 - side view area (ff=boss?) VOLATILE!!
// $D402: Destination data byte 2: Values from 00 to 1F accepted.
//        FF is Color Dungeon
// $D403: Destination data byte 3:
//        Room number.
//        Must appear on map or it will lead to an empty room
// $D404: Destination data X and Y co-ordinates
// $D405: Destination data X and Y co-ordinates
// $D45F: Possible Map Screen address?
// $D700: Tile Data

// $DB00: Inventory slot B
function inventory_b() => byte(0x00DB00)

// $DB01: Inventory slot A
function inventory_a() => byte(0x00DB01)

// $DB02: Inventory slot 1
// $DB03: Inventory slot 2
// $DB04: Inventory slot 3
// $DB05: Inventory slot 4
// $DB06: Inventory slot 5
// $DB07: Inventory slot 6
// $DB08: Inventory slot 7
// $DB09: Inventory slot 8
// $DB0A: Inventory slot 9
// $DB0B: Inventory slot 10
// $DB0C: Has "Flippers"
// $DB0D: Has "Secret Medicine"
// $DB0E: Has "Trading Sequence Item" (0x00 through 0x0e)
// $DB0F: Secret Seashells
// $DB44: 8-bit - Set to 1 when Shield Collected

// $DB45: Arrows
function num_arrows() => byte(0x00DB45)

// $DB46: "Should be killed by shop owner"-flag
// $DB4C: Magic Powder

// $DB4D: Bombs
function num_bombs() => byte(0x00DB4D)

// $DB56: Deaths in Slot 1
function slot1_deaths() => byte(0x00DB56)

// $DB5A: Player Health
function player_health() => byte(0x00DB5A)

// $DB5B: 8-bit - Num Heart Containers
function player_max_health() => byte(0x00DB5B)

// $DB5E: Rupees
function num_rupees() => byte(0x00DB5E)

// $DB60: Dungeon ID (00 = Tail Cave, 01 = Bottle Grotto, 02 = Key Cavern, 03 = Angler's Tunnel, 
//        04 = Catfish's Maw, 05 = Face Shrine, 06 = Eagle's Tower, 07 = Turtle Rock, 08 = Wind Fish's Egg, 
//        13 = Dream Shrine, 14 = Kanalet Castle, FF = Color Dungeon)
function current_dungeon() => byte(0x00DB60)
dungeon_tail_cave = 0
dungeon_bottle_grotto = 1
dungeon_key_cavern = 2
dungeon_anglers_tunnel = 3
dungeon_catfishs_maw = 4
dungeon_face_shrine = 5
dungeon_eagles_tower = 6
dungeon_turtle_rock = 7
dungeon_wind_fishs_egg = 8
dungeon_dream_shrine = 13
dungeon_kanalet_castle = 14
dungeon_color_dungeon = 255

// $DB6E: "THIEF"-flag

// $DBA6: Game save being used
function current_game_slot() => byte(0x00DBA6)

// $DC0C: First photo bit-map
// $DC0D: Second photo bit-map (bit7=1 if first photo is "No" photo)
// $DC0F: Color Dungeon Clothes Upgrade (0 = Green Clothes, 1 = Red Clothes, 2 = Blue Clothes)
// $FFF6: 8-bit - Current Grid Square

achievement(
    title = "Tail Cello", description = "Acquire the Full Moon Cello from the Tail Cave", points = 10,
    id = 28819, badge = "29328", published = "9/16/2015 2:12:35 PM", modified = "12/7/2016 11:19:00 AM",
    trigger = once(byte(0x00DB65) > 1) && once(byte(0x00DB65) < 8) && once(byte(0x00D402) == 0) && 
              once(never(byte(0x00D402) != 0))
)

achievement(
    title = "Bottle Horn", description = "Acquire the Conch Horn from the Bottle Grotto", points = 10,
    id = 28820, badge = "29331", published = "9/16/2015 2:12:39 PM", modified = "12/7/2016 11:19:15 AM",
    trigger = once(byte(0x00DB66) > 1) && once(byte(0x00DB66) < 8) && once(byte(0x00D402) == 1) && 
              once(never(byte(0x00D402) != 1))
)

achievement(
    title = "Cavern Bell", description = "Acquire the Sea Lily's Bell from the Key Cavern", points = 10,
    id = 28821, badge = "29332", published = "9/16/2015 2:12:42 PM", modified = "12/7/2016 11:19:34 AM",
    trigger = once(byte(0x00DB67) > 1) && once(byte(0x00DB67) < 8) && once(byte(0x00D402) == 2) && 
              once(never(byte(0x00D402) != 2))
)

// Ticket 3519: This triggered as soon as I fell down off the cliff to the screen where the Angler's Tunnel entrance
//               is.
achievement(
    title = "Angler's Harp", description = "Acquire the Surf Harp from the Angler's Tunnel", points = 10,
    id = 28822, badge = "29402", published = "9/16/2015 2:12:45 PM", modified = "12/7/2016 11:19:43 AM",
    trigger = once(byte(0x00DB68) > 1) && once(byte(0x00DB68) < 8) && once(byte(0x00D402) == 3) && 
              once(never(byte(0x00D402) != 3))
)

achievement(
    title = "Catfish's Marimba", description = "Acquire the Wind Marimba from the Catfish's Maw", points = 10,
    id = 28823, badge = "29403", published = "9/16/2015 2:12:48 PM", modified = "12/7/2016 11:19:46 AM",
    trigger = once(byte(0x00DB69) > 1) && once(byte(0x00DB69) < 8) && once(byte(0x00D402) == 4) && 
              once(never(byte(0x00D402) != 4))
)

achievement(
    title = "Face Triangle", description = "Acquire the Coral Triangle from the Face Shrine", points = 10,
    id = 28824, badge = "29405", published = "9/16/2015 2:12:51 PM", modified = "12/7/2016 11:19:49 AM",
    trigger = once(byte(0x00DB6A) > 1) && once(byte(0x00DB6A) < 8) && once(byte(0x00D402) == 5) && 
              once(never(byte(0x00D402) != 5))
)

achievement(
    title = "Tower Organ", description = "Acquire the Organ of Evening Calm from the Eagle's Tower", points = 10,
    id = 28825, badge = "29409", published = "9/16/2015 2:12:54 PM", modified = "12/7/2016 11:19:51 AM",
    trigger = once(byte(0x00D402) == 0) && once(never(byte(0x00D402) != 0)) && once(byte(0x00D46B) == 46) && 
              once(never(byte(0x00D46B) != 46)) && once(byte(0x00DB6B) > prev(byte(0x00DB6B)))
)

achievement(
    title = "Turtle Drum", description = "Acquire the Thunder Drum from Turtle Rock", points = 10,
    id = 28826, badge = "29320", published = "9/16/2015 2:12:57 PM", modified = "12/7/2016 11:19:54 AM",
    trigger = once(byte(0x00DB6C) > 1) && once(byte(0x00DB6C) < 8) && once(byte(0x00D402) == 7) && 
              once(never(byte(0x00D402) != 7))
)

achievement(
    title = "It Was All A Dream", description = "Wake the Wind Fish from his slumber", points = 15,
    id = 28827, badge = "29322", published = "9/16/2015 2:13:00 PM", modified = "12/7/2016 11:20:35 AM",
    trigger = once(byte(0x00D3CA) == 61) && once(byte(0x00D3CB) == 63) && once(byte(0x00D401) == 0) && 
              once(byte(0x00D402) == 0) && once(byte(0x00D403) == 0) && once(never(byte(0x00D401) != 0)) && 
              once(never(byte(0x00D402) != 0)) && once(never(byte(0x00D403) != 0))
)

// Ticket 6064: ugh, this trigerred wrongly too. disgusting
// Ticket 3525: The achievements for beating the game without dying and waking the Wind Fish didn't trigger.
achievement(
    title = "A Dream Come True", description = "Help Marin fulfill her dream", points = 20,
    id = 28828, badge = "29323", published = "9/16/2015 2:13:02 PM", modified = "12/7/2016 11:20:43 AM",
    trigger = once(byte(0x00D3CA) == 61) && 
              once(byte(0x00D3CB) == 63) && 
              once(byte(0x00D401) == 0) && 
              once(byte(0x00D402) == 0) && 
              once(byte(0x00D403) == 0) && 
              once(never(byte(0x00D401) != 0)) && 
              once(never(byte(0x00D402) != 0)) && 
              once(never(byte(0x00D403) != 0)) &&
              ((byte(0x00DB57) == 0 && current_game_slot() == 0) ||
               (byte(0x00DB57) == 0 && current_game_slot() == 1) ||
               (byte(0x00DB57) == 0 && current_game_slot() == 2))
)

function trigger_damageless_boss(dungeon, room_before_boss) =>
    never(player_health() < prev(player_health())) && // without taking damage
    byte(0x00DB60) == dungeon &&                      // dungeon
    once(byte(0x00D46B) == room_before_boss) &&       // room before boss
    once(byte(0x00D34D) == 96) &&                     // boss dialog
    never(byte(0x00D34C) == 33) &&                    // music??
    unless(high4(0xC150) == 15) &&                    // bringing up subscreen
    byte(0x00D34D) == 124                             // pick up the heart

// the previous implementation relied on a once/never combination on the dungeon
// the dungeon would occassionally reset to 0 when opening the inventory menu, 
// causing the achievement to reset. the new implementation replaces the once/never
// with a simpler must be true at completion clause. also removed unnecesary once()
// clauses on never() conditions
//function trigger_damageless_boss(dungeon, room_before_boss) =>
//    once(never(player_health() < prev(player_health()))) && // without taking damage
//    once(byte(0x00D402) == dungeon) &&                // dungeon 0
//    once(never(byte(0x00D402) != dungeon)) &&         // not in dungeon 0
//    once(byte(0x00D46B) == room_before_boss) &&       // room before boss
//    once(byte(0x00D34D) == 96) &&                     // boss dialog
//    once(never(byte(0x00D34C) == 33)) &&              // music??
//    once(byte(0x00D34D) == 124)                       // pick up the heart

achievement(
    title = "Bested Moldorm", description = "Defeat Moldorm without being harmed", points = 15,
    id = 28829, badge = "29327", published = "9/16/2015 2:13:04 PM", modified = "12/7/2016 11:20:45 AM",
    trigger = trigger_damageless_boss(0, 38)
)

// Ticket 11454: This achievement did not trigger at all. I did 2 attempts at beating him without
//               getting hit and it did not trigger.
//               MD5: 07c211479386825042efb4ad31bb525f
// Ticket 5604: Defeated boss without taking damage, achievement didn't trigger.  Don't know if it matters, but I was
//               holding a Guardian Acorn at the time.
// Ticket 4914: Completed this twice (once going in damaged, once going in full health), and it didn't trigger either
//               time.
// Ticket 4838: Broken achievement :(
achievement( // F10
    title = "Bested Genie", description = "Defeat Genie without being harmed", points = 15,
    id = 28830, badge = "29330", published = "9/16/2015 2:13:07 PM", modified = "12/7/2016 11:20:47 AM",
    trigger = trigger_damageless_boss(1, 38)
)

// Ticket 11483: I did 3 attempts of beating Slime Eye without being harmed and it still won't trigger.
//               MD5: 07c211479386825042efb4ad31bb525f
// Ticket 7138: Tried three times (took damage one of those times), did not trigger at all after beating the boss,
//               acquiring the bell, or re-entering the dungeon.
//               Using the ROM Legend of Zelda, The - Link's Awakening DX (U) (V1.2) [C][!].gbc.
// Ticket 6616: 
// Ticket 3858: This is the boss of the third Dungeon,I  reset the game 3 or four times and after beat him without
//               taking any damage,but I didn't get the achievment.
// Ticket 3518: Bested Slime Eye didn't trigger for me when I beat him without damage.
achievement( // F9
    title = "Bested Slime Eye", description = "Defeat Slime Eye without being harmed", points = 15,
    id = 28831, badge = "29333", published = "9/16/2015 2:13:12 PM", modified = "12/7/2016 11:20:50 AM",
    trigger = trigger_damageless_boss(2, 62)
)

// Ticket 7120: 
// Ticket 5796: Doesn't trigger if you don't end the fight with all your hearts apparently. Had the problem on other
//               bosses before so I think it might apply to all bosses. In order to trigger you need to not take damage
//               during the fight AND have all your hearts.
achievement( // F8
    title = "Bested Angler Fish", description = "Defeat Angler Fish without being harmed", points = 15,
    id = 28832, badge = "29400", published = "9/16/2015 2:13:15 PM", modified = "12/7/2016 11:20:53 AM",
    trigger = trigger_damageless_boss(3, 33)
)

// resetif (0xd402) != level is causing resetif when opening menu during fight

achievement( // F7
    title = "Bested Slime Eel", description = "Defeat Slime Eel without being harmed", points = 15,
    id = 28833, badge = "29401", published = "9/16/2015 2:13:18 PM", modified = "12/7/2016 11:20:55 AM",
    trigger = trigger_damageless_boss(4, 19)
)

// triggers even if taking damage
achievement( // F6
    title = "Bested Facade", description = "Defeat Facade without being harmed", points = 15,
    id = 28834, badge = "29406", published = "9/16/2015 2:13:20 PM", modified = "12/7/2016 11:20:58 AM",
    trigger = trigger_damageless_boss(5, 36) // room before boss is 36 - $D46C goes to 37 when picking up the heart
)

// Ticket 6274: I took damage but it popped after the fight anyway.
// Ticket 6044: I got hit a LOT of times. rom version 02
// Ticket 4948: Win achievement with 13 hearts lost.
achievement( // F5
    title = "Bested Evil Eagle", description = "Defeat Evil Eagle without being harmed", points = 15,
    id = 28835, badge = "29408", published = "9/16/2015 2:13:23 PM", modified = "12/7/2016 11:21:00 AM",
    trigger = trigger_damageless_boss(6, 54) && once(byte(0xD401) == 2)
              // the room does not change when fighting the boss (it stays 54). instead, look at $D401
              // for pre-boss flag. It seems to reliably be 2, even when leaving the tower. If there are issues
              // suggest changing 54 to 53, which is the room prior to the room before the boss.
)

achievement( // F4
    title = "Bested Hot Head", description = "Defeat Hot Head without being harmed", points = 15,
    id = 28836, badge = "29321", published = "9/16/2015 2:13:25 PM", modified = "12/7/2016 11:21:02 AM",
    trigger = trigger_damageless_boss(7, 19)
)

// Ticket 6275: Best shadow also popped though I took damage. I'm using USA rom.
// Ticket 6063: triggered after being damaged a lot too. maybe the red potion has something to do with it
// Ticket 5668: I took a lot of damage during the fight, but the achievement triggered anyway.  I'll remove it from my
//               achievements.  Not sure what I did to trigger it.
achievement( // F3
    title = "Bested Shadow Nightmares", description = "Defeat all 6 Shadow Nightmares without being harmed", points = 20,
    id = 28837, badge = "29325", published = "9/16/2015 2:13:28 PM", modified = "12/7/2016 11:21:05 AM",
    trigger = never(player_health() < prev(player_health())) && // without taking damage
              once(byte(0x00DB60) == 8) &&                      // dungeon 8
              once(byte(0x00D46B) == 19) &&                     // room before boss
              unless(high4(0xC150) == 15) &&                    // bringing up subscreen
              byte(0x00D3CA) == 57 &&                           // climb stairs
              byte(0x00D3CB) == 89                              // climb stairs                     
//    trigger_before = once(byte(0x00D3CA) == 57) && 
//                     once(byte(0x00D3CB) == 89) && 
//                     once(byte(0x00D402) == 8) && 
//                     once(byte(0x00D46B) == 19) && 
//                     once(never(player_health() == prev(word(0x00DB5A))))
)

// Ticket 11485: This achievement triggered when I went into the boss room for the first time without
//               defeating Evil Orb.
//               MD5: 07c211479386825042efb4ad31bb525f
// Ticket 6263: Got this just by waking into it's room.
// Ticket 5605: Achievement triggered as soon as I walked in to the fight.
// Ticket 4994: It triggered when I entered the boss room
// Ticket 4924: This triggered when I entered the boss in question.
// Ticket 4896: At the entrance of the room's boss
// Ticket 3859: This is the boss in the hiden colours dungeon,as soon as I entered the boss room,
//               the achievment just triggered,i didn't need to take care of not beeing hit.
// Ticket 3529: The Bested Evil Orb achievement triggered when I did a save
achievement( // F2
    title = "Bested Evil Orb", description = "Defeat Evil Orb without being harmed", points = 20,
    id = 28908, badge = "29419", published = "9/18/2015 1:40:27 PM", modified = "12/7/2016 11:22:01 AM",
    trigger = never(player_health() < prev(player_health())) && // without taking damage
              byte(0x00DB60) == 255 &&                          // color dungeon
              once(byte(0x00D46B) == 33) &&                     // room before boss
              once(byte(0x00D34D) == 96) &&                     // boss dialog
              never(byte(0x00D34C) == 33) &&                    // music??
              unless(high4(0xC150) == 15) &&                    // bringing up subscreen
              byte(0x00DBB5) == 1                               // doors open
//    trigger_before = once(byte(0x00D46B) == 25) && // 25 = boss's room
//              once(never(player_health() < prev(player_health()))) && 
//              once(byte(0x00D34D) == 96) && 
//              once(byte(0x00D402) == 0) && once(never(byte(0x00D402) != 0)) && // attempt at level
//              once(never(byte(0x00D34C) == 33)) && once(byte(0x00D339) == 99)
)

function trigger_damageless_boss(dungeon, room_before_boss) =>
    never(player_health() < prev(player_health())) && // without taking damage
    byte(0x00D402) == dungeon &&                      // dungeon 0
    once(byte(0x00D46B) == room_before_boss) &&       // room before boss
    once(byte(0x00D34D) == 96) &&                     // boss dialog
    never(byte(0x00D34C) == 33) &&                    // music??
    once(byte(0x00D34D) == 124)                       // pick up the heart


achievement(
    title = "Level-1 Shield", description = "Acquire the Level-1 Shield from Tarin", points = 3,
    id = 28838, badge = "29411", published = "9/16/2015 2:13:30 PM", modified = "12/7/2016 11:21:11 AM",
    trigger = once(byte(0x00DB44) == 1)
)

achievement(
    title = "Level-1 Sword", description = "Acquire the Level-1 Sword from Toronbo Shores", points = 3,
    id = 28839, badge = "29413", published = "9/16/2015 2:13:32 PM", modified = "12/7/2016 11:21:13 AM",
    trigger = once(byte(0x00DB4E) == 1)
)

achievement(
    title = "Level-2 Sword", description = "Obtain the Level-2 Sword", points = 10,
    id = 28841, badge = "29319", published = "9/16/2015 2:13:37 PM", modified = "12/7/2016 11:21:20 AM",
    trigger = once(byte(0x00DB4E) == 2)
)

achievement(
    title = "Music Man", description = "Learn all 3 Ocarina songs", points = 15,
    id = 28842, badge = "29334", published = "9/16/2015 2:13:40 PM", modified = "12/7/2016 11:21:22 AM",
    trigger = byte(0x00DB49) == 7
)

achievement(
    title = "Washed Up Returner", description = "Get the boomerang", points = 10,
    id = 28843, badge = "29385", published = "9/16/2015 2:13:44 PM", modified = "12/7/2016 11:21:25 AM",
    trigger = once(inventory_b() == 13)
)

achievement(
    title = "I Have Half A Heart", description = "Obtain a total of 7 hearts", points = 5,
    id = 28844, badge = "29329", published = "9/16/2015 2:13:47 PM", modified = "12/7/2016 11:21:28 AM",
    trigger = once(player_max_health() == 7) && once(never(byte(0x00D401) == 0)) && once(never(byte(0x00D402) == 0)) && 
              once(never(byte(0x00D403) == 0))
)

achievement(
    title = "Awaken My Heart", description = "Obtain all 14 Heart Containers", points = 15,
    id = 28845, badge = "29316", published = "9/16/2015 2:13:50 PM", modified = "12/7/2016 11:21:31 AM",
    trigger = once(player_max_health() == 14)
)

achievement(
    title = "Rupee Amasser", description = "Get a total of 999 rupees on the rupee counter", points = 10,
    id = 28848, badge = "29317", published = "9/16/2015 2:13:58 PM", modified = "12/7/2016 11:21:40 AM",
    trigger = byte(0x00DB5D) == 9 && num_rupees() == 153 && never(word(0x00DB5D) < 9) && never(num_rupees() < 153)
)

achievement(
    title = "Shell Collection", description = "Collect all possible 26 Secret Seashells across Koholint", points = 10,
    id = 28849, badge = "29315", published = "9/16/2015 4:15:47 PM", modified = "12/7/2016 11:21:43 AM",
    trigger = once(byte(0x00DB0F) == 38) && never(byte(0x00D401) == 0) && never(byte(0x00D402) == 0) && 
              never(byte(0x00D403) == 0)
)

achievement(
    title = "The Travels of THIEF", description = "Complete the Photo Album", points = 20,
    id = 31930, badge = "32674", published = "1/16/2016 6:26:02 PM", modified = "12/7/2016 11:25:57 AM",
    trigger = once(bit0(0x00DC0C) == 1) && once(bit1(0x00DC0C) == 1) && once(bit2(0x00DC0C) == 1) && 
              once(bit3(0x00DC0C) == 1) && once(bit4(0x00DC0C) == 1) && once(bit5(0x00DC0C) == 1) && 
              once(bit6(0x00DC0C) == 1) && once(bit7(0x00DC0C) == 1) && once(bit0(0x00DC0D) == 1) && 
              once(bit1(0x00DC0D) == 1) && once(bit2(0x00DC0D) == 1) && once(bit3(0x00DC0D) == 1) && 
              never(byte(0x00D403) == 255) && never(byte(0x00D403) == 0)
)

achievement(
    title = "Here Stands A Brave Man", description = "Agree to be photographed", points = 2,
    id = 31931, badge = "32673", published = "1/16/2016 6:26:06 PM", modified = "12/7/2016 11:26:42 AM",
    trigger = never(bit7(0x00DC0D) != 0) && once(bit0(0x00DC0C) == 1) && once(bit7(0x00DC0D) == 0) && 
              never(byte(0x00D403) == 255) && never(byte(0x00D403) == 0) && never(byte(0x00D403) != 55)
)

achievement(
    title = "Beautiful! I'll call this 'Game Over'", description = "Keep refusing to be photographed", points = 3,
    id = 31932, badge = "32672", published = "1/16/2016 6:26:10 PM", modified = "12/7/2016 11:26:47 AM",
    trigger = never(bit7(0x00DC0D) != 1) && once(bit0(0x00DC0C) == 1) && once(bit7(0x00DC0D) == 1) && 
              never(byte(0x00D403) == 255) && never(byte(0x00D403) == 0) && never(byte(0x00D403) != 55)
)

achievement(
    title = "More Powder!", description = "Get the Magic Powder capacity upgrade from the Mad Batter", points = 3,
    id = 28861, badge = "29382", published = "9/17/2015 1:28:18 PM", modified = "12/7/2016 11:21:53 AM",
    trigger = byte(0x00DB4C) == 64
)

achievement(
    title = "More Arrows!", description = "Get the Arrow capacity upgrade from the Mad Batter", points = 3,
    id = 28862, badge = "29383", published = "9/17/2015 1:28:22 PM", modified = "12/7/2016 11:21:55 AM",
    trigger = num_arrows() == 96
)

achievement(
    title = "More Bombs!", description = "Get the Bomb capacity upgrade from the Mad Batter", points = 3,
    id = 28863, badge = "29384", published = "9/17/2015 1:28:24 PM", modified = "12/7/2016 11:21:58 AM",
    trigger = num_bombs() == 96
)

achievement(
    title = "New Clothes!", description = "Acquire the red clothes or the blue clothes from the Color Dungeon.", points = 10,
    id = 28909, badge = "29420", published = "9/18/2015 1:40:34 PM", modified = "12/7/2016 11:29:11 AM",
    trigger = byte(0x00DC0F) >= 1 && byte(0x00DC0F) <= 2
)

dungeons = {
    dungeon_tail_cave: "Tail Cave",
    dungeon_bottle_grotto: "Bottle Grotto",
    dungeon_key_cavern: "Key Cavern",
    dungeon_anglers_tunnel: "Angler's Tunnel",
    dungeon_catfishs_maw: "Catfish's Maw",
    dungeon_face_shrine: "Face Shrine",
    dungeon_eagles_tower: "Eagle's Tower",
    dungeon_turtle_rock: "Turtle Rock",
    dungeon_wind_fishs_egg: "Wind Fish's Egg",
    dungeon_dream_shrine: "Dream Shrine",
    dungeon_kanalet_castle: "Kanalet Castle",
    dungeon_color_dungeon: "Color Dungeon",
    10: "a Cave",
    14: "a House",
    16: "a House",
    17: "a Cave",
    18: "a House",
    19: "the Dream Shrine",
    20: "Kanalet Castle", 
    21: "Moblin Cave", // bow-wow prison
    22: "the Southern Shrine",
    30: "a House",
    31: "a Cave",
}

rich_presence_conditional_display(byte(0xDB5B) == 0, "Titles")

rich_presence_conditional_display(byte(0xDB5F) == 1, "Exploring {0}",
    rich_presence_lookup("Dungeon", current_dungeon(), dungeons)
)

rich_presence_display("Exploring the overworld")
