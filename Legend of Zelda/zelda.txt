// The Legend of Zelda
// #ID = 1454
//
// md5: d9a1631d5c32d35594b9484862a26cba - US PRG0
// md5: d3f453931146e95b04a31647de80fdab - US PRG1

// save at any time: press start to open the subscreen, press A+Up on controller 2 to bring up the game over screen

function trigger_first_quest() {
    return (byte(0x062D) == 0 && byte(0x0016) == 0) || // game 1
           (byte(0x062E) == 0 && byte(0x0016) == 1) || // game 2
           (byte(0x062F) == 0 && byte(0x0016) == 2)    // game 3
}

function trigger_second_quest() {
    return (byte(0x062D) == 1 && byte(0x0016) == 0) || // game 1
           (byte(0x062E) == 1 && byte(0x0016) == 1) || // game 2
           (byte(0x062F) == 1 && byte(0x0016) == 2)    // game 3
}

function trigger_no_damage() => never(low4(0x00066F) < prev(low4(0x00066F))) && // whole hearts
                                never(byte(0x000670) < prev(byte(0x000670)))    // current heart

function current_location() => byte(0x00EB)
function current_dungeon_location() => byte(0x0526) // map to return to when leaving dungeon
function current_music() => byte(0x0609)
function trigger_heart_container_obtained() => once(byte(0x0000BF) < prev(byte(0x0000BF)))
function trigger_enter_room() => byte(0x00E7) != 0

function current_ring() => byte(0x0662)
ring_none = 0
ring_blue = 1
ring_red = 2

function game_mode() => byte(0x0012)
mode_cave = 0x0B
mode_walking = 0x05 // both in dungeons and overworld

// 6677: Recieved during first quest, Level 8, I had recently recieved "Dungeon Cartographer", as in I had all the maps and compasses for quest 1. I died in level 8 then recieved this achievement when I chooose to save.
achievement(
    title = "Dungeon Explorer", description = "Find all compasses and maps in the second quest", points = 8,
    id = 22743, badge = "34716", published = "5/10/2015 7:23:19 PM", modified = "3/14/2016 10:25:58 AM",
    trigger = byte(0x000667) == 255 &&       // level 9 compass bits??
              byte(0x000668) == 255 &&       // level 9 map bits??
              byte(0x000669) == 1 &&         // level 9 compass found
              byte(0x00066A) == 1 &&         // level 9 map found
              game_mode() == mode_walking && // in dungeon - prevent trigger when switching between save games
              trigger_second_quest()
)

// 7449: triggered on load and save first quest while playing second quest
// 6698: popped when purchased the ring on the first quest, and saved. I had a 2nd quest save file open in slot 1, and the ring was bought in slot 2.
// 8149: save after acquire before leaving room. triggered on reload. [02.sav]
achievement(
    title = "Boy, this is really expensive ! 2", description = "Get equipped with the blue ring in the second quest", points = 3,
    id = 33322, badge = "34107", published = "2/26/2016 9:46:37 AM", modified = "3/16/2016 7:14:07 AM",
    trigger = current_ring() == ring_blue && game_mode() == mode_cave && trigger_second_quest()
)

// 8168: 	This triggered after defeating Ganon and letting the credits start to roll. My death counter was at 12.
achievement(
    title = "8-Bit Master", description = "Defeat Ganon in either Quest without being killed.", points = 25,
    id = 3759, badge = "04336", published = "12/7/2013 7:13:16 AM", modified = "3/1/2016 9:23:21 AM",
    trigger = current_location() == 50 &&                      // zelda's room
              current_dungeon_location() == 5 &&
              current_music() != 0 &&                          // music must be playing - prevents trigger after credits
              ((byte(0x000016) == 0 && byte(0x000630) == 0) || // death counter
               (byte(0x000016) == 1 && byte(0x000631) == 0) || // death counter
               (byte(0x000016) == 2 && byte(0x000632) == 0))   // death counter
)

// 8346: didn't trigger on 2nd/third?
achievement(
    title = "Bested Patra", description = "Defeat the Patra south of a wise man in Death Mountain without being harmed in the First Quest.", points = 10,
    id = 3755, badge = "04329", published = "12/7/2013 6:03:47 AM", modified = "7/4/2015 7:12:00 PM",
    trigger = trigger_no_damage() &&
              never(current_location() != 22) &&    // never leave room
              current_dungeon_location() == 5 && 
              once(byte(0x000486) == 176) &&        // enemy 1 HP
              once(byte(0x000487) == 96) &&         // enemy 2 HP   
              once(byte(0x000488) == 96) &&         // enemy 3 HP 
              once(byte(0x000489) == 96) &&         // enemy 4 HP
              once(byte(0x00048A) == 96) &&         // enemy 5 HP
              once(byte(0x00048B) == 96) &&         // enemy 6 HP
              once(byte(0x00048C) == 96) &&         // enemy 7 HP
              once(byte(0x00048D) == 96) &&         // enemy 8 HP
              once(byte(0x00048E) == 96) &&         // enemy 9 HP
              byte(0x00006E) == 20 &&               // ??
              trigger_heart_container_obtained() &&
              trigger_first_quest()
)

// 8345: got them now, but it didn't trigger?
// 7398: I went through every known cave I could find in the first quest that had a moblin in it, but the achievement still didn't activate.
// 14 moblins + a heart container??
achievement(
    title = "Bounty Hunter", description = "Receive money from every hidden moblin in the first quest", points = 7,
    id = 33226, badge = "34098", published = "2/24/2016 8:35:56 PM", modified = "1/11/2017 1:09:58 PM",
    trigger = byte(0x0006E6) >= 144 &&  // 30 rupees, 0x67
              byte(0x00068E) >= 16 &&   // 100 rupees, 0x0F
              byte(0x0006EA) >= 144 &&  // 100 rupees, 0x6B
              byte(0x0006E1) >= 144 &&  // 100 rupees, 0x62
              byte(0x0006D5) >= 144 &&  // 10 rupees, 0x56 [2: 10 rupees, 0x56]
              byte(0x0006AC) >= 144 &&  // 30 rupees, 0x2D [2: 30 rupees, 0x2D]
              byte(0x0006DA) >= 144 &&  // 10 rupees, 0x5B
              byte(0x0006BC) >= 16 &&   // 30 rupees, 0x3D [2: 30 rupees, 0x3D]
              byte(0x0006CD) >= 16 &&   // 10 rupees, 0x4E [2: 10 rupees, 0x4E]
              byte(0x0006A7) >= 144 &&  // 30 rupees, 0x28 [2: 30 rupees, 0x28]
              byte(0x0006C7) >= 144 &&  // 30 rupees, 0x48 [2: 30 rupees, 0x48]
              byte(0x000692) >= 144 &&  // 30 rupees, 0x13 [2: 30 rupees, 0x13]
              byte(0x0006F0) >= 144 &&  // 30 rupees, 0x71
              byte(0x0006D0) >= 144     // 10 rupees, 0x51 [2: 10 rupees, 0x51]
)                                       //                 [2: 100 rupees, 0x53]
                                        //                 [2: 30 rupees, 0x22]
                                        //                 [2: 30 rupees, 0x58]
                                        //                 [2: 10 rupees, 0x2B]
                                        //                 [2: 10 rupees, 0x6E]

// 4934: Took a hit or two from the fireball launchers, but this still triggered.
achievement(
    title = "Bested Digdogger", description = "Defeat Digdogger without being harmed in the Lizard Dungeon in the first quest", points = 10,
    id = 3748, badge = "04327", published = "12/7/2013 3:45:53 AM", modified = "12/28/2013 9:39:11 PM",
    trigger = trigger_no_damage() && 
              never(current_location() != 36) &&              // don't leave room
              current_dungeon_location() == 11 && 
              once(byte(0x000486) == 240) &&                  // starting HP of large digdogger
              once(byte(0x000487) == 128) &&                  // starting HP of small digdogger
              byte(0x0000BF) < prev(byte(0x0000BF)) &&        // heart container appears
              once(trigger_enter_room()) &&                   // start upon entering room
              trigger_first_quest()
)

// 8339: 	Full hearts, used bombs. Grabbed a heart. Didn't trigger. Should have gotten it 3 times already. Even tried without full health.
achievement(
    title = "Blue Darknut expert", description = "Clear the item room in level 5 without taking damage (not owning the magical sword and without leaving)", points = 6,
    id = 33339, badge = "34220", published = "2/26/2016 3:48:10 PM", modified = "3/15/2016 4:24:44 PM",
    trigger = never(current_location() != 5) &&                   // don't leave room
              current_dungeon_location() == 11 && 
              byte(0x000657) != 3 &&                              // no magic sword
              once(byte(0x00034F) == 0) && byte(0x00034F) == 6 && // defeat all 6
              trigger_no_damage() && 
              once(byte(0x000486) == 128) &&                      // enemy 1 HP
              once(byte(0x000487) == 128) &&                      // enemy 2 HP
              once(byte(0x000488) == 128) &&                      // enemy 3 HP
              once(byte(0x000489) == 128) &&                      // enemy 4 HP
              once(byte(0x00048A) == 128) &&                      // enemy 5 HP
              once(byte(0x00048B) == 128)                         // enemy 6 HP
)

// 4933: I'm pretty sure I got hit once or twice, but this still triggered.
achievement(
    title = "Bested Manhandla", description = "Defeat Manhandla without being harmed in the Manji Dungeon in the first quest", points = 10,
    id = 3743, badge = "04325", published = "12/6/2013 6:52:14 AM", modified = "12/28/2013 9:34:51 PM",
    trigger = trigger_no_damage() && 
              never(current_location() != 77) &&                   // don't leave room
              current_dungeon_location() == 116 && 
              once(trigger_enter_room()) &&                        // start upon entering room
              once(byte(0x000486) == 64) && byte(0x000486) == 0 && // enemy 1 HP
              once(byte(0x000487) == 64) && byte(0x000487) == 0 && // enemy 1 HP 
              once(byte(0x000488) == 64) && byte(0x000488) == 0 && // enemy 1 HP
              once(byte(0x000489) == 64) && byte(0x000489) == 0 && // enemy 1 HP
              once(byte(0x00048A) == 64) && byte(0x00048A) == 0 && // enemy 1 HP
              trigger_first_quest()
)

// 7439: doesn't trigger if leave room and come back [05.sav]
achievement(
    title = "Darknut bombing expert", description = "Clear the item room in level 3 only using bombs (not owning magical sword and without leaving)", points = 6,
    id = 33340, badge = "34099", published = "2/26/2016 3:49:42 PM", modified = "3/15/2016 4:24:35 PM",
    trigger = current_dungeon_location() == 116 && 
              never(current_location() != 105) &&                 // don't leave room
              once(byte(0x00034F) == 0) && byte(0x00034F) == 8 && // defeat all 8 
              once(byte(0x000657) != 3) &&                        // no magic sword
              never(byte(0x000486) == 32) &&                      // enemy 1 HP
              never(byte(0x000487) == 32) &&                      // enemy 2 HP 
              never(byte(0x000488) == 32) &&                      // enemy 3 HP 
              never(byte(0x000489) == 32) &&                      // enemy 4 HP 
              never(byte(0x00048A) == 32) &&                      // enemy 5 HP 
              never(byte(0x00048B) == 32) &&                      // enemy 6 HP 
              never(byte(0x00048C) == 32) &&                      // enemy 7 HP 
              never(byte(0x00048D) == 32)                         // enemy 8 HP
)