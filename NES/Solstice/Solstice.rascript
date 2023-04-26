// Solstice: The Quest for the Staff of Demnos
// #ID = 1965
// md5: 79130862501091b3923e71af3cfc3032

// ============== items ========== 167pts          (28)
// magic boots:                      3pts          x 1
// 4 keys:                          12pts          x 4
// 9 simple potions:                33pts          x 9
// 6 hidden rooms (7 potions, 1UP)  44pts          x 6
// 3 switches:                       0pts          x 0 << easy 15 more points?
// have at least 10 lives           10pts          x 1
// hat diver                         5pts          x 1
// 6 pieces of staff:               60pts          x 6
// ============== completion ===== 163pts [330pts] ( 8)
// complete game:                   20pts          
//  without continuing:             20pts           
//  without dying                   40pts          
//  > 70%                            8pts
//  > 80%                           10pts
//  > 90%                           15pts
//   100%                           20pts
//  < 40%                           30pts
// ============== exploration ====  70pts [400pts] ( 5)
// main castle (49 rooms):          15pts
// doomed souls (90 rooms):         20pts
// gardens of pain (27 rooms):      15pts
// blood gardens (14 rooms):         0pts - merge with gardens of pain?
// slaughter yards (24 rooms):      10pts
// tower of tears (8 rooms):         0pts - simple up and down, ignore
// mines of insanity (11 rooms):     0pts - linear, ignore
// stonehedge guardens (22 rooms):  10pts
// tower of terror (7 rooms):        0pts - simple up and down, ingore
// ===============================        [400pts] (41 total)

function current_lives() => byte(0x0789)
function current_room() => byte(0x0015)
function current_continues() => byte(0x079F)
function current_staff_pieces() => byte(0x795)

function room_sprite(index) => byte(0x73C + index)
function trigger_collect_item(sprite_index, sprite_id) {
    return prev(room_sprite(sprite_index)) == sprite_id && // desired item was present
           room_sprite(sprite_index) == 0 &&               // desired item no longer present
           unless(byte(0x0738) == 0x57) &&                 // ignore reset on death
           unless(byte(0x078b) != 0x00)                    // prevent trigger when using red potion
}

function sprite1_achievement(room, sprite, title, points, description) {
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room && trigger_collect_item(1, sprite)
    )
}

function sprite2_achievement(room, sprite, title, points, description) {
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room && trigger_collect_item(2, sprite)
    )
}

function sprite3_achievement(room, sprite, title, points, description) {
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room && trigger_collect_item(3, sprite)
    )
}

function sprite12_achievement(room, sprite1, sprite2, title, points, description) {
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room && room_sprite(1) == 0 && room_sprite(2) == 0 &&
                  (prev(room_sprite(1)) == sprite1 || prev(room_sprite(2)) == sprite2)
    )
}

function sprite23_achievement(room, sprite2, sprite3, title, points, description) {
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = current_room() == room && room_sprite(2) == 0 && room_sprite(3) == 0 &&
                  (prev(room_sprite(2)) == sprite2 || prev(room_sprite(3)) == sprite3)
    )
}

function trigger_complete_game() => current_room() == 0xFE && byte(0x07B2) == 6 // changes to 6 when credits roll
function trigger_from_start() => once(byte(0x7A9) == 3) // only 3 during initial scenes
function trigger_reset_between_games() => never(byte(0x7A9) == 3)

// 0x37C is tens digit + 1, 0x37D is ones digit + 1 (i.e. 83% = 09 04)
function current_completion_rate() => byte(0x037C)    
function trigger_completion_rate_at_least(percent) {
    if (percent == 100) {
        return byte(0x037B) == 2 // 100%
    }
    
    return byte(0x037B) == 2 ||                // 100%
           byte(0x037C) >= (percent / 10) + 1  // >= X0%
}
function trigger_completion_rate_less_than(percent) => byte(0x037B) != 2 && byte(0x037C) < (percent / 10) + 1

// on pause menu [S=start]: BSS BBS SBB SSS BSB BBS SSB SBS SBS SBB SBS > gives 90 lives and fills potions
// there are only 14 1UPs to collect, so the player should never have more than 18 lives, but we'll give 
// them up to 24 before we assume they're cheating
function trigger_cheat() => current_lives() > 24

// 0356-0358: rooms visited (in menu)
// 037C-0380: percentage (in menu)

sprite3_achievement(0x11, 0xD0, "These Boots are Made for Jumping", 3, "Collect the magic boots")
sprite3_achievement(0x0F, 0xD1, "Key I", 3, "Collect the key from the main castle")
sprite1_achievement(0x77, 0xD4, "Key II", 4, "Collect the key from the Caves of the Doomed Souls")
sprite1_achievement(0xC7, 0xD2, "Key III", 5, "Collect the key from the Blood Gardens")
sprite3_achievement(0xE2, 0xD3, "Key IV", 5, "Collect the key from the Stonehedge Garden")
sprite2_achievement(0x20, 0xDE, "Blue Potion I", 5, "Collect the blue potion in the castle tower")
sprite1_achievement(0x80, 0xE1, "Blue Potion II", 5, "Collect the blue potion from the Caves of the Doomed Souls")
sprite1_achievement(0xCB, 0xE5, "Purple Potion I", 5, "Collect the purple potion from the Blood Gardens")
sprite1_achievement(0x8F, 0xE0, "Purple Potion II", 5, "Collect the purple potion from the Caves of the Doomed Souls")
sprite2_achievement(0x16, 0xDD, "Green Potion I", 5, "Collect the green potion from the main castle")
sprite1_achievement(0xAE, 0xE7, "Green Potion II", 5, "Collect the green potion from the Gardens of Pain") 
sprite3_achievement(0x43, 0xE2, "Yellow Potion I", 5, "Collect the yellow potion from the Slaughter Yards")
sprite1_achievement(0xDB, 0xE6, "Yellow Potion II", 5, "Collect the yellow potion from the Stonehedge Garden")
sprite1_achievement(0xEC, 0xE8, "Yellow Potion III", 5, "Collect the second yellow potion from the Stonehedge Garden")

sprite1_achievement(0x60, 0xDF, "Hidden Room I", 5, "Collect the blue potion in the pit between the castle and the caves")
sprite1_achievement(0x5E, 0xCB, "Hidden Room II", 5, "Collect the wizard's hat in the pit between the castle and the caves")
sprite2_achievement(0xE3, 0xE3, "Hidden Room III", 5, "Collect the blue potion from below the Caves of the Doomed Souls")
sprite3_achievement(0xE8, 0xE4, "Hidden Room IV", 10, "Collect the yellow potion from the Caves of the Doomed Souls")
sprite12_achievement(0xA3, 0xDB, 0xDC, "Hidden Room V", 10, "Collect the yellow and blue potions from below the main castle")
sprite23_achievement(0xFB, 0xE9, 0xEA, "Hidden Room VI", 10, "Collect the yellow and purple potions from the Tower of Ultimate Terror")

sprite1_achievement(0xCA, 0xD9, "Staff I", 10, "Collect the staff piece from the Blood Gardens")
sprite1_achievement(0x30, 0xD6, "Staff II", 10, "Collect the staff piece from the castle tower")
sprite1_achievement(0xA1, 0xD8, "Staff III", 10, "Collect the staff piece from the Caves of the Doomed Souls")
sprite3_achievement(0x1C, 0xD5, "Staff IV", 10, "Collect the staff piece from the main castle")
sprite1_achievement(0x50, 0xD7, "Staff V", 10, "Collect the staff piece from the Slaughter Yards")
sprite3_achievement(0xF7, 0xDA, "Staff VI", 10, "Collect the staff piece from the Tower of Ultimate Terror")

achievement(
    title = "Hat Diver", 
    description = "Collect the wizard's hat after jumping out of the Tower of Tears", 
    points = 10, 
    trigger = current_lives() > prev(current_lives()) && 
              (current_room() == 0x3E || current_room() == 0x3F || current_room() == 0x36)
)

achievement(
    title = "Pocketful of Hats",
    description = "Have at least 10 lives in reserve (no cheating)",
    points = 25,
    trigger = trigger_from_start() && current_lives() >= 10 && never(trigger_cheat())
)

achievement(
    title = "Rescued",
    description = "Save the Princess",
    points = 25,
    trigger = current_room() == 0xFE && current_staff_pieces() == 0x3F
)

achievement(
    title = "No Continues",
    description = "Complete the game without using a continue (no cheating)",
    points = 25,
    trigger = trigger_complete_game() && trigger_from_start() &&
              never(current_continues() < prev(current_continues())) &&
              never(trigger_cheat())
)

achievement(
    title = "The Immortal",
    description = "Complete the game without dying",
    points = 50,
    trigger = trigger_complete_game() && trigger_from_start() &&
              never(current_lives() < prev(current_lives()))
)

achievement(
    title = "Completionist I",
    description = "Finish the game with at least 70% completion rate",
    points = 10,
    trigger = trigger_complete_game() && trigger_completion_rate_at_least(70)
)

achievement(
    title = "Completionist II",
    description = "Finish the game with at least 80% completion rate",
    points = 10,
    trigger = trigger_complete_game() && trigger_completion_rate_at_least(80)
)

achievement(
    title = "Completionist III",
    description = "Finish the game with at least 90% completion rate",
    points = 25,
    trigger = trigger_complete_game() && trigger_completion_rate_at_least(90)
)

achievement(
    title = "Perfectionist",
    description = "Finish the game with 100% completion rate",
    points = 50,
    trigger = trigger_complete_game() && trigger_completion_rate_at_least(100)
)

// ======= 100% ======
// https://www.youtube.com/watch?v=RQTrkQe5pA4
// === Main Castle ===
// W-E N W W S S S S
// > Key I (3)
// N E N E E [credit] E N
// > These Boots Are Made for Jumping (3)
// S S W W-E S E-W D (aim east) D D E
// > Hidden Room I (6)
// W D
// === Caves of the Doomed Souls === [025 rooms, 08.78%]
// W S W W S S W
// > Key II (3)
// W W W W U
// === Gardens of Pain === [037 rooms, 12.10%]
// N-S W W N E-W W-W-E-E N W [1UP] W N W
// === Blood Gardens === [049 rooms, 15.42%]
// N-W-W-E-E-S [1UP] (W-E?) S (hidden platform in middle of room) E-W W W W
// > Key III (3)
// N N [credit jump] E 
// > Staff I (10)
// E
// > Purple Potion I (3)
// W N [teleport]
// === Gardens of Pain === [063 rooms, 23.04%]
// E E [1UP] N N W [credit] W S W S E E
// > Green Potion II (3)
// N E E S
// > Garden Explorer (15)
// E
// === Main Castle === [078 rooms, 28.90%]
// [credit] E S-S-S-E-W-[1UP]-N-N-N N N N D(jump from SE)-U [block-U] [block-U] [long jump D SE] U
// > Blue Potion I (4)
// D D E E S E S S W S S
// > Green Potion I (4)
// S E E E [block up] U D N
// > Staff II (10)
// [D hidden behind pillar] D D
// > Hidden Room II (6)
// D D
// === Caves of the Doomed Souls === [103 rooms, 39.64%]
// W S E-W W W W W S S E E S-N N E E E S E S W W S
// > Purple Potion II (3)
// N E E N N-N-E-[credit]-S-S-N-N-W-S-S W W [teleport] S S W W W N W
// > Blue Potion II (3)
// E E S S-S-[1UP]-N-N E S S E N E E E E S W W S
// > Staff III (10)
// N E N N E N E S E N [D jump to middle]
// > Hidden Room III (6)
// U E N E-N-S-W N-S [destroy all (purple potion)] D [switch]
// W U N N U [1UP] [1UP] [block U] [1UP] [1UP]
// > Hidden Room IV (6)
// S D (aim NW) W W W 
// > Cave Explorer (20)
// W W W S W W S S W W W W W U
// === Gardens of Pain === [173 rooms, 65.03%]
// W W N N N E E E
// === Main Castle === [173 rooms, 65.03%]
// E N N N E E E E E S [duck under middle spike ball] S S 
// > Castle Explorer (15)
// [freeze time (yellow potion)]
// > Staff IV (10)
// N N N [D rightmost spike is fake] [1UP C0]
// > Hidden Room V (10)
// U W W W N 
// === Slaughter Yards === [181 rooms, 70.50%]
// N N-S E [switch] W W N N-S W N N
// === Tower of Tears === [190 rooms, 73.24%]
// D (NW corner) [block U] [block U] [block U] [block U] [1UP] S [NW corner]
// > Hat Diver (5) [1UP while falling]
// D D D 
// === Slaughter Yards === [198 rooms, 76.75%]
// E N E E S E-E-W-W
// > Yellow Potion I (4)
// N [E (very hard) credit jump] [N - use yellow potion to stop falling block]) N
// > Staff V (10)
// S S E [middle vanishes] N [E, using purple potion while entering] N-W-E-S [S, run south as soon as you enter] 
// > Yard Explorer (10)
// D
// === Mines of Insanity === [213 rooms, 82.61%]
// S S E E S W S E [credit] E S U
// === Stonehedge Gardens === [224 rooms, 85.74%]
// S E-E-
// > Yellow Potion II (4)
// W-W S E E S S (E do not fall! - stand halfway south about to fall and jump east) 
// [N - use shield - blue potion - and jump on heads] N E S E 
// > Key IV (3)
// E S
// > Yellow Potion III (5)
// W (running jump to grab block and land on moving platform, block jump to teleporter) [teleport] 
// N [W - use yellow potion] [credit jump] W [W blind jump to hidden platform, then green platform] 
// > Stonehedge Explorer (10)
// N
// === Tower of Ultimate Terror === [246 rooms, 93.94%]
// [block U] [block U] [block U] [D jump SE] U
// (have to get bubble over red block [push when red at top] and use both to jump) U
// (push and use bubble east to catch yellow block, then south, jump west, and drop the block and
// do a pick-up-jump to get to high platform and a block jump to get up to the next room) [block U] 
// > Staff VI (10)
// [U - jump on skeleton head] [switch] D D D D (drop all the way) 
// [block U] [block U] [block U] [D jump SE] U (bubble over red block, jump) U
// (push and use bubble east to catch yellow block, climb on the red block, at the top, jump a bit east, then block jump north)
// > Hidden Room VI (10)
// S D D D D (drop all the way) W
// > complete the game (20)
// ===================

// ======= 31% =======
// === Main Castle ===
// S W S W S
// get the first key
// N E N E E E N
// get the boots
// S W W N N W N E E E S S S [stop time - yellow potion]
// get the first piece of staff (staff IV)
// N N N W W W N 
// === Slaughter Yard ===
// N N N N
// [credit jump - do not pick up!] E
// N (wait half a second then double jump) N
// get the second staff piece (staff V)
// S S W S S S S 
// === Main Castle ===
// S E S S W S S S E E E U (N)
// | Quickly jump to the block on the conveyor belt and grab it before it falls.  If
// | you miss it, go down and try again.  When you have it, double-jump to the north
// | exit, but under no circumstances should you go up to the next room!  That will
// | add an unnecessary room to your completion rate.  Take the north exit.
// grab that third piece of staff (Staff II)
// D D D (ignore 1UP) D 
// === Caves of the Doomed Souls ===
// W W W S W W S S W [ignore key] W W W W U 
// === Gardens of Pain ===
// N N W N W W N W
// === Blood Gardens ===
// S (invisible platform in middle of room) W W W
// get the second key (Key III)
// E E E E S 
// === Gardens of Pain ===
// E E N N W [teleport] S
// get the fourth piece of staff (Staff I)
// N [teleport] E S S E S S D 
// === Caves of the Doomed Souls ===
// E E E E E N N E E N E E E E E E E E (three floating platforms) S S W S W N W S W S S W S
// get the fifth piece of staff (Staff III)
// N E N N E N E S E N E N N E
// U [push bubble west, stop it one square before wall, push it north. ogre will hit it and move south.
//    blue potion. when ogre near south walkway, jump on ogre, then jump to get yellow square. ride 
//    ogre to NE corner and jump to platform there, stand on southernmost square, then cube jump to next room]
// === Stonehedge Gardens ===
// E [N - use your last blue potion] E S E
// get the third key (Key IV)
// E S W [teleport] N W [W - credit jump - don't pick up] W N
// === Tower of Ultimate Terror ===
// [block U] [block U] [block U] [D jump SE] U
// (have to get bubble over red block [push when red at top] and use both to jump) U
// (push and use bubble east to catch yellow block, then south, jump west, and drop the block and
// do a pick-up-jump to get to high platform and a block jump to get up to the next room) [block U] 
// > get final piece of staff (Staff VI)
// D D D D (Drop all the way) W
// > complete the game (20)
// ===================

achievement(
    title = "Minimalist",
    description = "Finish the game with less than 40% completion rate",
    points = 50,
    trigger = trigger_complete_game() && trigger_completion_rate_less_than(40)
)

achievement(
    title = "Castle Explorer",
    description = "Visit all 48 rooms in the castle",
    points = 10,
    trigger = trigger_reset_between_games() &&
              once(current_room() == 0x00) &&
              once(current_room() == 0x01) &&
              once(current_room() == 0x02) &&
              once(current_room() == 0x03) &&
              once(current_room() == 0x04) &&
              once(current_room() == 0x05) &&
              once(current_room() == 0x06) &&
              once(current_room() == 0x08) &&
              once(current_room() == 0x09) &&
              once(current_room() == 0x0A) &&
              once(current_room() == 0x0B) &&
              once(current_room() == 0x0C) &&
              once(current_room() == 0x0D) &&
              once(current_room() == 0x0E) &&
              once(current_room() == 0x0F) &&
              once(current_room() == 0x10) &&
              once(current_room() == 0x11) &&
              once(current_room() == 0x12) &&
              once(current_room() == 0x13) &&
              once(current_room() == 0x14) &&
              once(current_room() == 0x15) &&
              once(current_room() == 0x16) &&
              once(current_room() == 0x17) &&
              once(current_room() == 0x18) &&
              once(current_room() == 0x19) &&
              once(current_room() == 0x1A) &&
              once(current_room() == 0x1B) &&
              once(current_room() == 0x1C) &&
              once(current_room() == 0x1D) &&
              once(current_room() == 0x1E) &&
              once(current_room() == 0x1F) &&
              once(current_room() == 0x20) &&
              once(current_room() == 0x21) &&
              once(current_room() == 0x22) &&
              once(current_room() == 0x23) &&
              once(current_room() == 0x24) &&
              once(current_room() == 0x25) &&
              once(current_room() == 0x26) &&
              once(current_room() == 0x27) &&
              once(current_room() == 0x28) &&
              once(current_room() == 0x29) &&
              once(current_room() == 0x2A) &&
              once(current_room() == 0x2B) &&
              once(current_room() == 0x2C) &&
              once(current_room() == 0x2D) &&
              once(current_room() == 0x2E) &&
              once(current_room() == 0x2F) &&
              once(current_room() == 0x30) 
              // once(current_room() == 0xA3) // hidden
)

achievement(
    title = "Cave Explorer",
    description = "Visit all 82 rooms in the Caves of Doomed Souls",
    points = 10,
    trigger = trigger_reset_between_games() &&
              once(current_room() == 0x61) &&
              once(current_room() == 0x62) &&
              once(current_room() == 0x63) &&
              once(current_room() == 0x64) &&
              once(current_room() == 0x65) &&
              once(current_room() == 0x66) &&
              once(current_room() == 0x67) &&
              once(current_room() == 0x68) &&
              once(current_room() == 0x69) &&
              //once(current_room() == 0x6A) && // required to get to 0x6B
              once(current_room() == 0x6B) &&
              once(current_room() == 0x6C) &&
              once(current_room() == 0x6D) &&
              once(current_room() == 0x6E) &&
              once(current_room() == 0x6F) &&
              once(current_room() == 0x70) &&
              once(current_room() == 0x71) &&
              once(current_room() == 0x72) &&
              once(current_room() == 0x73) &&
              once(current_room() == 0x74) &&
              //once(current_room() == 0x75) && // assume passed through to get to 0xBD
              //once(current_room() == 0x76) && // assume passed through to get to 0xBD
              once(current_room() == 0x77) &&
              //once(current_room() == 0x78) && // assume passed through to get to 0x77
              once(current_room() == 0x79) &&
              //once(current_room() == 0x7A) && // required to get to 0x83
              once(current_room() == 0x7B) &&
              once(current_room() == 0x7C) &&
              //once(current_room() == 0x7D) && // assume passed through to get to 0x7C
              //once(current_room() == 0x7E) && // required to get to 0x8F
              once(current_room() == 0x7F) &&
              once(current_room() == 0x80) &&
              //once(current_room() == 0x81) && // required to get to 0x80
              once(current_room() == 0x82) &&
              once(current_room() == 0x83) &&
              //once(current_room() == 0x84) && // assume passed through to get to 0x7B
              //once(current_room() == 0x85) && // required to get to 0x8F
              //once(current_room() == 0x86) && // required to get to 0x8F
              //once(current_room() == 0x87) && // required to get to 0x8F
              once(current_room() == 0x88) &&
              once(current_room() == 0x89) &&
              once(current_room() == 0x8A) &&
              once(current_room() == 0x8B) &&
              //once(current_room() == 0x8C) && // required to get to 0x9B
              once(current_room() == 0x8D) &&
              //once(current_room() == 0x8E) && // assume passed through to get to 0x7B
              once(current_room() == 0x8F) &&
              once(current_room() == 0x90) &&
              once(current_room() == 0x91) &&
              //once(current_room() == 0x92) && // assume passed through to get from 0x89 to 0x93
              once(current_room() == 0x93) &&
              //once(current_room() == 0x94) && // required to get to 0x9B
              once(current_room() == 0x95) &&
              once(current_room() == 0x96) &&
              once(current_room() == 0x97) &&
              once(current_room() == 0x98) &&
              once(current_room() == 0x99) &&
              once(current_room() == 0x9A) &&
              once(current_room() == 0x9B) &&
              once(current_room() == 0x9C) &&
              once(current_room() == 0x9D) &&
              //once(current_room() == 0x9E) && // required to get to 0xA1
              //once(current_room() == 0x9F) && // required to get to 0xA1
              once(current_room() == 0xA0) &&
              once(current_room() == 0xA1) &&
              once(current_room() == 0xBD) &&
              //once(current_room() == 0xBE) && // assume passed through to get to 0xBD
              once(current_room() == 0xCF) &&
              once(current_room() == 0xD0) &&
              once(current_room() == 0xD1) &&
              //once(current_room() == 0xD2) && // required to get to 0xE9
              once(current_room() == 0xD3) &&
              once(current_room() == 0xD4) &&
              once(current_room() == 0xD5) &&
              // once(current_room() == 0xE3) && // hidden
              once(current_room() == 0xE4) &&
              once(current_room() == 0xE5) &&
              //once(current_room() == 0xE6) && // required to get to 0xE9
              //once(current_room() == 0xE7) && // required to get to 0xE9
              //once(current_room() == 0xE8) && // required to get to 0xE9
              once(current_room() == 0xE9) &&
              once(current_room() == 0xF8) &&
              once(current_room() == 0xFC) 
)

achievement(
    title = "Garden Explorer",
    description = "Visit all 41 rooms in the Gardens of Pain and the Blood Gardens",
    points = 10,
    trigger = trigger_reset_between_games() &&
              once(current_room() == 0xA4) &&
              once(current_room() == 0xA5) &&
              once(current_room() == 0xA6) &&
              once(current_room() == 0xA7) &&
              once(current_room() == 0xA8) &&
              once(current_room() == 0xA9) &&
              once(current_room() == 0xAA) &&
              once(current_room() == 0xAB) &&
              once(current_room() == 0xAC) &&
              once(current_room() == 0xAD) &&
              once(current_room() == 0xAE) &&
              once(current_room() == 0xAF) &&
              once(current_room() == 0xB0) &&
              once(current_room() == 0xBa) &&
              once(current_room() == 0xB2) &&
              once(current_room() == 0xB3) &&
              once(current_room() == 0xB4) &&
              once(current_room() == 0xB5) &&
              once(current_room() == 0xB6) &&
              once(current_room() == 0xB7) &&
              once(current_room() == 0xB8) &&
              once(current_room() == 0xB9) &&
              once(current_room() == 0xBA) &&
              once(current_room() == 0xBB) &&
              once(current_room() == 0xBC) &&
              once(current_room() == 0xBF) &&
              once(current_room() == 0xC0) &&
              once(current_room() == 0xC1) &&
              once(current_room() == 0xC2) &&
              once(current_room() == 0xC3) &&
              once(current_room() == 0xC4) &&
              once(current_room() == 0xC5) &&
              once(current_room() == 0xC6) &&
              once(current_room() == 0xC7) &&
              once(current_room() == 0xC8) &&
              once(current_room() == 0xC9) &&
              once(current_room() == 0xCA) &&
              once(current_room() == 0xCB) &&
              once(current_room() == 0xCC) &&
              once(current_room() == 0xCD) &&
              once(current_room() == 0xCE)
)

achievement(
    title = "Yard Explorer",
    description = "Visit all 24 rooms in the Slaughter Yards",
    points = 10,
    trigger = trigger_reset_between_games() &&
              once(current_room() == 0x07) &&
              once(current_room() == 0x31) &&
              once(current_room() == 0x32) &&
              once(current_room() == 0x33) &&
              once(current_room() == 0x34) &&
              once(current_room() == 0x35) &&
              once(current_room() == 0x36) &&
              once(current_room() == 0x40) &&
              once(current_room() == 0x41) &&
              once(current_room() == 0x42) &&
              once(current_room() == 0x43) &&
              once(current_room() == 0x44) &&
              once(current_room() == 0x45) &&
              once(current_room() == 0x46) &&
              once(current_room() == 0x47) &&
              once(current_room() == 0x48) &&
              once(current_room() == 0x49) &&
              once(current_room() == 0x4A) &&
              once(current_room() == 0x4B) &&
              once(current_room() == 0x4C) &&
              once(current_room() == 0x4D) &&
              once(current_room() == 0x4E) &&
              once(current_room() == 0x4F) &&
              once(current_room() == 0x50)
)

achievement(
    title = "Stonehedge Explorer",
    description = "Visit all 22 rooms in the Stonehedge Garden",
    points = 10,
    trigger = trigger_reset_between_games() &&
              once(current_room() == 0xD6) &&
              once(current_room() == 0xD7) &&
              once(current_room() == 0xD8) &&
              once(current_room() == 0xD9) &&
              once(current_room() == 0xDA) &&
              once(current_room() == 0xDB) &&
              once(current_room() == 0xDC) &&
              once(current_room() == 0xDD) &&
              once(current_room() == 0xDE) &&
              once(current_room() == 0xDF) &&
              once(current_room() == 0xE0) &&
              once(current_room() == 0xE1) &&
              once(current_room() == 0xE2) &&
              once(current_room() == 0xEA) &&
              once(current_room() == 0xEB) &&
              once(current_room() == 0xEC) &&
              once(current_room() == 0xED) &&
              once(current_room() == 0xEE) &&
              once(current_room() == 0xEF) &&
              once(current_room() == 0xF0) &&
              once(current_room() == 0xF1) &&
              once(current_room() == 0xF2) 
)

staff_pieces_lookup = {
    0x00: "no pieces of the",
    0x01: "one piece of the",
    0x03: "two pieces of the",
    0x07: "three pieces of the",
    0x0F: "four pieces of the",
    0x1F: "five pieces of the",
    0x3F: "the complete",
}

rich_presence_display("Exploring Kâstleröck with {0} staff and {1} lives",
    rich_presence_lookup("StaffPieces", current_staff_pieces(), staff_pieces_lookup),
    rich_presence_value("Lives", current_lives())
)   
