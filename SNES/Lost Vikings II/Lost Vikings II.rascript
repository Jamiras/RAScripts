// The Lost Vikings II
// #ID = 1002
// MD5: 6808b453828d6a6f228e3225055df4c4 (U)
// MD5: 9cf4265a4a1aad19959dcdbb94803d12 (E) // all addresses are +2 (char1_hp = $1039, $1AA2 -> $1AA4)

// $0202: Special Abilitys unlocked (0=no; 5=yes)
// $037E: Idle Animation screen

// $1037: Char1 Health
function char1_hp() => byte(0x001037)

// $1039: Char2 Health
function char2_hp() => byte(0x001039)

// $103B: Char3 Health
function char3_hp() => byte(0x00103B)

// $1177: Char 1 Value (0=Erik; 1=Baleog; 2=Olaf; 3=Feng; 4=Torch; 5=Noone)
function char1() => byte(0x001177)

// $1179: Char 2 Value (0=Erik; 1=Baleog; 2=Olaf; 3=Feng; 4=Scorch; 5=Noone THEN feng; 6=Noone THEN Scorch)
function char2() => byte(0x001179)

// $117B: Char 3 Value (0=Erik; 1=Baleog; 2=Olaf; 3=Feng; 4=Torch; 5=Noone)
function char3() => byte(0x00117B)
char_erik = 0
char_baleog = 1
char_olaf = 2
char_feng = 3
char_torch = 4
char_none = 5

// $1A92: World Value 16 BIt
function current_world() => word(0x001A92)

// $1A93: World Value
// $1AA2: Level value seems wired some times you can change it somehow; last level of world always: 013a

function trigger_no_special_abilities() => word(0x000202) == 0

achievement(
    title = "Dark Ages!", description = "Reach level 8", points = 10,
    id = 23584, badge = "23983", published = "6/10/2015 12:22:51 PM", modified = "6/10/2015 3:27:31 PM",
    trigger = prev(current_world()) == 256 && current_world() == 257
)

achievement(
    title = "I don't care about Transylvania", description = "Reach level 8 without additional help", points = 10,
    id = 23592, badge = "23989", published = "6/10/2015 3:44:40 PM", modified = "6/10/2015 3:44:52 PM",
    trigger = prev(current_world()) == 256 && current_world() == 257 && trigger_no_special_abilities()
)

achievement(
    title = "Smuggler's Cove", description = "Reach level 14", points = 10,
    id = 23585, badge = "23984", published = "6/10/2015 12:22:52 PM", modified = "6/10/2015 3:27:40 PM",
    trigger = prev(current_world()) == 512 && current_world() == 513
)

achievement(
    title = "Another Cauldron bites the Dust", description = "Reach level 14 without additional help", points = 10,
    id = 23593, badge = "23990", published = "6/10/2015 3:44:43 PM", modified = "6/10/2015 3:44:55 PM",
    trigger = prev(current_world()) == 512 && current_world() == 513 && trigger_no_special_abilities()
)

achievement(
    title = "Amazon Jungel", description = "Reach level 20", points = 10,
    id = 23586, badge = "23985", published = "6/10/2015 12:22:53 PM", modified = "6/10/2015 3:27:48 PM",
    trigger = prev(current_world()) == 768 && current_world() == 769
)

achievement(
    title = "Vengeance Landing", description = "Reach level 20 without additional Help", points = 10,
    id = 23594, badge = "23991", published = "6/10/2015 3:44:46 PM", modified = "6/10/2015 3:44:59 PM",
    trigger = prev(current_world()) == 768 && current_world() == 769 && trigger_no_special_abilities()
)

achievement(
    title = "The Future", description = "Reach level 26", points = 10,
    id = 23587, badge = "23986", published = "6/10/2015 12:22:54 PM", modified = "6/10/2015 3:27:58 PM",
    trigger = prev(current_world()) == 1024 && current_world() == 1025
)

achievement(
    title = "Reach To The Star....crafts!", description = "Reach level 26 without additional Help", points = 10,
    id = 23595, badge = "23992", published = "6/10/2015 3:44:48 PM", modified = "6/10/2015 3:45:02 PM",
    trigger = prev(current_world()) == 1024 && current_world() == 1025 && trigger_no_special_abilities()
)

achievement(
    title = "End of the Line", description = "Complete the Game", points = 25,
    id = 23590, badge = "23987", published = "6/10/2015 2:52:09 PM", modified = "6/10/2015 3:22:52 PM",
    trigger = prev(current_world()) == 1281 && current_world() == 2049
)

achievement(
    title = "That was easy", description = "Complete the Game without additional help", points = 30,
    id = 23591, badge = "23988", published = "6/10/2015 3:25:44 PM", modified = "6/10/2015 3:25:50 PM",
    trigger = prev(current_world()) == 1281 && current_world() == 2049 && byte(0x000202) == 0
)

achievement(
    title = "You Guys Are Terrible!", description = "Aquire additional help (because you died in the first level)", points = 5,
    id = 23581, badge = "23980", published = "6/10/2015 12:22:42 PM", modified = "6/10/2015 12:26:55 PM",
    trigger = char1_hp() == 0 && prev(char1_hp()) == 2 && word(0x001A90) == 7169
)

achievement(
    title = "With Feng And Claws!", description = "Meet Fang!", points = 10,
    id = 23582, badge = "23981", published = "6/10/2015 12:22:45 PM", modified = "6/10/2015 3:48:47 PM",
    trigger = prev(char2()) == char_none && char2() == char_feng
)

achievement(
    title = "With Scorched Wings", description = "Meet Scorch!", points = 10,
    id = 23583, badge = "23982", published = "6/10/2015 12:22:49 PM", modified = "7/4/2015 9:38:51 PM",
    trigger = prev(char2()) == 6 && char2() == char_torch
)

function trigger_no_damage() => never(char1_hp() < prev(char1_hp())) && 
                                never(char2_hp() < prev(char2_hp())) && 
                                never(char3_hp() < prev(char3_hp()))

// Ticket 5607: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 20 - D4RK", description = "Finish Level 20 without beeing hit, without additional help", points = 5,
    id = 23623, badge = "24041", published = "6/11/2015 10:51:40 AM", modified = "6/11/2015 10:52:00 AM",
    trigger = once(prev(byte(0x001AA2)) != 81) &&   // not level
              prev(byte(0x001AA2)) == 81 &&         // level
              byte(0x001AA2) == 83 &&               // next level
              never(byte(0x001AA2) > 83) && 
              never(byte(0x001AA2) < 81) && 
              byte(0x000202) == 0 &&                // without additional help
              byte(0x001A93) == 4 &&                // amazon
              trigger_no_damage()
)

// Ticket 12276: The cheev don't pop when I pass the stage fulfilling the requirements.
//               Emulator: RASnes9x
// Ticket 5608: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 21 - H4RD", description = "Finish Level 21 without beeing hit, without additional help", points = 10,
    id = 23624, badge = "24042", published = "6/11/2015 10:51:43 AM", modified = "6/11/2015 10:51:59 AM",
    trigger = once(prev(byte(0x001AA2)) != 83) && prev(byte(0x001AA2)) == 83 && byte(0x001AA2) == 85 && 
              byte(0x000202) == 0 && byte(0x001A93) == 4 && never(byte(0x001AA2) > 85) && never(byte(0x001AA2) < 83) && 
              trigger_no_damage()
)

// Ticket 5609: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 22 - HRDR", description = "Finish Level 22 without beeing hit, without additional help", points = 10,
    id = 23625, badge = "24043", published = "6/11/2015 10:51:44 AM", modified = "7/4/2015 9:34:25 PM",
    trigger = once(prev(byte(0x001AA2)) != 85) && prev(byte(0x001AA2)) == 85 && byte(0x001AA2) == 87 && 
              byte(0x000202) == 0 && byte(0x001A93) == 4 && trigger_no_damage()
)

// Ticket 5610: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 23 - LOST", description = "Finish Level 23 without beeing hit, without additional help", points = 10,
    id = 23626, badge = "24044", published = "6/11/2015 10:51:46 AM", modified = "6/11/2015 10:52:01 AM",
    trigger = once(prev(byte(0x001AA2)) != 87) && prev(byte(0x001AA2)) == 87 && byte(0x001AA2) == 89 && 
              byte(0x000202) == 0 && byte(0x001A93) == 4 && never(byte(0x001AA2) > 89) && never(byte(0x001AA2) < 87) && 
              trigger_no_damage()
)

// Ticket 5611: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 24 - OBOY", description = "Finish Level 24 without beeing hit, without additional help", points = 15,
    id = 23627, badge = "24045", published = "6/11/2015 10:51:47 AM", modified = "7/4/2015 9:34:06 PM",
    trigger = once(prev(byte(0x001AA2)) != 89) && prev(byte(0x001AA2)) == 89 && byte(0x001AA2) == 58 && 
              byte(0x000202) == 0 && byte(0x001A93) == 4 && trigger_no_damage()
)

// Ticket 12277: It got the same issue of level 21, it doesn't trigger when you pass the level fulfilling the
//               requirements.
//               Emulator: RASnes9x
// Ticket 11736: please verify this achievement, i beated this level as said "without additional help" (the special
//               powers) and didnt received a single hit but the achievement didnt triggered
//               MD5: e60ee38cdbdbffde4bc8a8a44383a753
// Ticket 11536: Well just that. It wont trigger. Several tries. Tried doing it without resets and frameskips. Hardcore
//               Mode. Here's a video:
//               https://youtu.be/blI46zb3QeQ
//               MD5: 6808b453828d6a6f228e3225055df4c4
// Ticket 5612: All I know is they don't trigger when passing the level in question without being hit.
// Ticket 4326: I finished both levels with full (but not shielded) health, yet they didn't work. As always, I used
//               Hardcore and the recommended ROM type.
achievement(
    title = "Level 25 - HOM3", description = "Finish Level 25 without beeing hit, without additional help", points = 20,
    id = 23628, badge = "24046", published = "6/11/2015 10:51:48 AM", modified = "5/5/2016 4:01:57 AM",
    trigger = once(prev(byte(0x001AA2)) != 58) && prev(byte(0x001AA2)) == 58 && byte(0x001AA2) == 47 && 
              byte(0x000202) == 0 && never(byte(0x001AA2) > 58) && never(byte(0x001AA2) < 47) && 
              trigger_no_damage() && once(prev(current_world()) == 400)
)

// Ticket 5613: All I know is they don't trigger when passing the level in question without being hit.
// Ticket 4327: I finished both levels with full (but not shielded) health, yet they didn't work. As always, I used
//               Hardcore and the recommended ROM type.
achievement(
    title = "Level 26 - SHCK", description = "Finish Level 26 without beeing hit, without additional help", points = 15,
    id = 23629, badge = "24047", published = "6/11/2015 10:51:49 AM", modified = "5/5/2016 4:01:53 AM",
    trigger = once(prev(byte(0x001AA2)) != 101) && prev(byte(0x001AA2)) == 101 && byte(0x001AA2) == 97 && 
              byte(0x000202) == 0 && byte(0x001A93) == 5 && never(byte(0x001AA2) > 101) && never(byte(0x001AA2) < 97) && 
              trigger_no_damage()
)

// Ticket 12295: Doesn't trigger after requirements, tried twice and it hasn't worked.
//               Emulator: RASnes9x
// Ticket 11739: this one is also bugged, didnt triggered at all
//               MD5: e60ee38cdbdbffde4bc8a8a44383a753
// Ticket 5614: All I know is they don't trigger when passing the level in question without being hit.
// Ticket 4328: This one didn't work either.
achievement(
    title = "Level 27 - TNNL", description = "Finish Level 27 without beeing hit, without additional help", points = 15,
    id = 23630, badge = "24048", published = "6/11/2015 10:51:51 AM", modified = "5/5/2016 4:01:49 AM",
    trigger = once(prev(byte(0x001AA2)) != 97) && prev(byte(0x001AA2)) == 97 && byte(0x001AA2) == 99 && 
              byte(0x000202) == 0 && byte(0x001A93) == 5 && never(byte(0x001AA2) > 99) && never(byte(0x001AA2) < 97) && 
              trigger_no_damage()
)

// Ticket 5615: All I know is they don't trigger when passing the level in question without being hit.
achievement(
    title = "Level 28 - H3LL", description = "Finish Level 28 without beeing hit, without additional help", points = 20,
    id = 23631, badge = "24049", published = "6/11/2015 10:51:52 AM", modified = "6/11/2015 10:53:12 AM",
    trigger = once(prev(byte(0x001AA2)) != 99) && prev(byte(0x001AA2)) == 99 && byte(0x001AA2) == 103 && 
              byte(0x000202) == 0 && byte(0x001A93) == 5 && never(byte(0x001AA2) > 103) && never(byte(0x001AA2) < 99) && 
              trigger_no_damage()
)

// Ticket 5616: All I know is they don't trigger when passing the level in question without being hit.
// Ticket 4350: This didn't trigger, despite finishing with starting health. I DID use some food, but that didn't seem
//               to matter for the "No Hit" cheevs I already got.
achievement(
    title = "Level 29 - 4RGH", description = "Finish Level 29 without beeing hit, without additional help", points = 20,
    id = 23632, badge = "24050", published = "6/11/2015 10:51:53 AM", modified = "5/5/2016 4:01:44 AM",
    trigger = once(prev(byte(0x001AA2)) != 103) && prev(byte(0x001AA2)) == 103 && byte(0x001AA2) == 105 && 
              byte(0x000202) == 0 && byte(0x001A93) == 5 && never(byte(0x001AA2) > 105) && never(byte(0x001AA2) < 103) && 
              trigger_no_damage()
)

// Ticket 11581: One of the characters (Scorch) WAS hit by electricity (not by enemies) once during the level then
//               healed. At the end of the level achievement unlocked. I don't know if it is relevant but before this I
//               restarted this level several time without resseting emulator. I played with Hardcore mode on.
//               MD5: 6808b453828d6a6f228e3225055df4c4
achievement(
    title = "Tomator With Claws And Wings", description = "Defeat Tomator Phase 1 without being hit and without additional help", points = 50,
    id = 23622, badge = "24039", published = "6/11/2015 10:10:41 AM", modified = "6/11/2015 10:51:57 AM",
    trigger = byte(0x000202) == 0 && trigger_no_damage() && once(prev(byte(0x001AA2)) != 105) && byte(0x001AA2) == 67 && 
              prev(byte(0x001AA2)) == 105 && never(byte(0x001A93) != 5)
)

// Ticket 4349: I took a cheap hit to both Eric and Baelog, but this still triggered. Keeping it because, well, cheap
//               hit.
achievement(
    title = "Tomator Puree, Again!", description = "Defeat Tomator Phase 2 without beeing hit and without additional help", points = 50,
    id = 23621, badge = "24040", published = "6/11/2015 10:10:38 AM", modified = "12/21/2015 4:28:45 PM",
    trigger = byte(0x000202) == 0 && trigger_no_damage() && once(prev(word(0x001AA2)) != 323) && 
              prev(word(0x001AA2)) == 323 && word(0x001AA2) == 327
)
