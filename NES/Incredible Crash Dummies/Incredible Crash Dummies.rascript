// Incredible Crash Test Dummies
// #ID = 1750

// At the title screen, press Right, Right, Up, Left, Up, Right, Down, B, A, Select. 
// Start the game and the level select menu should appear.

// Steering wheel: temporary invisibility
// Oil can: projectile weapon, limited ammo
// Rocket: speed boost
// Balloon: lighter - jump farther
// Leg: spinning top of doom weapon

// score: [0x057B-0x0580] (0x57B is ones digit, 0x0580 is 100,000s)
// oil:   [0x0582-0x0583] (0x582 is ones digit, 0x0583 is 10s)
// cones: [0x0584-0x0585] (0x584 is ones digit, 0x0585 is 10s) [50 cones = 1up]
//  09 = 0
//  0A = 1
//  0B = 2
//  0C = 3
//  0D = 4
//  0E = 5
//  0F = 6
//  10 = 7
//  11 = 8
//  12 = 9

// 0x04B6: first boss, second boss HP (goes to FF when dead)

function lives() => byte(0x0586)
function health() => byte(0x0589)

function equipped() => byte(0x053B)
equip_gas = 0
equip_oil = 1
equip_handle = 2
equip_key = 3
equip_leg = 4

function character_sprite() => byte(0x001C)

sprites_spin = {
    "idle": 0x17,
    "moving_forward": 0x1C,
    "knockback": 0x1E,
    "explode": 0x2B,
    "losing_head": 0x28,
    "lost_head": 0x21,
    "moving_forward_without_head": 0x26,
    "moving_forward_blur": 0x18,
    "moving_forward_blur_without_head": 0x22,
    "leg_weapon": 0x20,
    "leg_weapon_headless": 0x2A,
    "using_handle": 0x36,
}

sprites_slick = {
    "idle": 0x1D,
    "moving_forward": 0x18,
    "knockback": 0x1E, //?
    "explode": 0x2B,
    "losing_head": 0x27,
    "lost_head": 0x27,
    "moving_forward_without_head": 0x23,
    "moving_forward_without_head_b": 0x22,
    "moving_forward_blur": 0x18, //?
    "moving_forward_blur_without_head": 0x22, //?
    "leg_weapon": 0x20, //?
    "leg_weapon_headless": 0x2A, //?
    "using_handle": 0x36, //?
    "impatient": 0x25,
}

function current_screen() => byte(0x001A) // screen/level
screens = {
   0x00: "Title Screen", // 1P/2P select (also game over)
   0x78: "Title Screen", // LJN logo
//   0x5C: "Title Screen", // also descriptive (no-image) cutscenes, like between 2-1 and puzzle room
   0x58: "Title Screen", // full screen logo
   0x6A: "Title Screen", // seatbelt
   0x82: "Intro",
   0x8A: "Intro",
   0x7E: "Intro",
   0x96: "Intro",
   0x86: "Intro",
   0x9E: "Intro",
   0x8E: "Intro",
   0x92: "Intro",
   0x5C: "Level Screen", // level title card
   0xA6: "Level 1-1",                             // F1
   0xB2: "Level 1-1", // ending cutscene
   0xAC: "Level 1-2",                             // F2
   0x6C: "Level 1-2", // ending cutscene
   0xB4: "Between Levels", // beginning cutscene
   0x70: "Between Levels", // beginning cutscene
   0xB8: "Level 2-1",                             // F3
//   0xA6: "Level 2-1", // puzzle room              // F4
   0xC2: "Level 2-2",                             // F5
   0x66: "Level 2-2", // ending cutscene
//   0xB4: "Level 3-1", // beginning cutscene
//   0x70: "Level 3-1", // beginning cutscene
   0xC6: "Level 3-1",                             // F6
   0xCE: "Level 3-1", // ending cutscene
   0xCA: "Level 3-2",                             // F7
//   0xCA: "Level 3-2", // -> 0x5C -> back to 0xCA for boss fight
   0x62: "Level 3-2", // ending cutscene
//   0xB4: "Level 4-1", // beginning cutscene
//   0x70: "Level 4-1", // beginning cutscene
   0xD2: "Level 4-1",                             // F8
   0xE6: "Level 4-1", // ending cutscene
   0xD6: "Level 5-1",                             // F9  
//   0xD6: "Level 5-2",                             // F0
   0xE2: "Level 5-2", // ending cutscene
   0x7A: "Level 5-2", // ending cutscene
}

function current_level() => byte(0x033)
level_1_1 = 0x42
level_1_2 = 0xB6
level_2_1 = 0xD5
level_2_puzzle = 0x55
level_2_2 = 0x09
level_3_1 = 0x8B
level_3_2 = 0xA6
level_3_boss = 0x30
level_4_1 = 0x7D
level_5_1 = 0x3F
level_5_2 = 0xE2

level_data = {
    level_1_1: {
        "name": "The Crash Test Center",
        "level": "Level 1-1",
        "screen": 0xA6,
        "completion_screen": 0xB2,
        "next_level": level_1_2,
        "start_x": 0x0000,
        "start_y": 0x0330,
        "cones": 46,
        "sprites": sprites_spin,
    },
    level_1_2: {
        "name": "The Sewer",
        "level": "Level 1-2",
        "screen": 0xAC,
        "completion_screen": 0x6C,
        "next_level": level_2_1,
        "start_x": 0x0270,
        "start_y": 0x0090,
        "cones": 45,
        "sprites": sprites_slick,
    },
    level_2_1: {
        "name": "Inside the Big Top",
        "level": "Level 2-1",
        "screen": 0xB8,
        "completion_screen": 0x5C,
        "next_level": level_2_puzzle,
        "start_x": 0x0000,
        "start_y": 0x0330,
        "cones": 64,
        "sprites": sprites_spin,
    },
    level_2_puzzle: {
        "name": "The Electric Room",
        "level": "Level 2-1",
        "screen": 0xA6,
        "completion_screen": 0x5C,
        "next_level": level_2_2,
        "start_x": 0x0080,
        "start_y": 0x0030,
        "sprites": sprites_spin,
    },
    level_2_2: {
        "name": "The Fun House",
        "level": "Level 2-2",
        "screen": 0xC2,
        "completion_screen": 0x66,
        "next_level": level_3_1,
        "start_x": 0x0000,
        "start_y": 0x0730,
        "cones": 43,
        "sprites": sprites_slick,
    },
    level_3_1: {
        "name": "The Warehouse",
        "level": "Level 3-1",
        "screen": 0xC6,
        "completion_screen": 0xCE,
        "next_level": level_3_2,
        "start_x": 0x0000,
        "start_y": 0x01B0,
        "cones": 50,
        "sprites": sprites_spin,
    },
    level_3_2: {
        "name": "The Docks",
        "level": "Level 3-2",
        "screen": 0xCA,
        "completion_screen": 0x5C,
        "next_level": level_3_boss,
        "start_x": 0x0000,
        "start_y": 0x0230,
        "cones": 48,
        "sprites": sprites_slick,
    },
    level_3_boss: {
        "name": "The Pirate Ship",
        "level": "Level 3-2",
        "screen": 0xCA,
        "completion_screen": 0x62,
        "next_level": level_4_1,
        "start_x": 0x0100,
        "start_y": 0x0030,
        "sprites": sprites_slick,
    },
    level_4_1: {
        "name": "Car Wreckers",
        "level": "Level 4-1",
        "screen": 0xD2,
        "completion_screen": 0xE6,
        "next_level": level_5_1,
        "start_x": 0x01F0,
        "start_y": 0x0230,
        "cones": 31,
        "sprites": sprites_spin,
    },
    level_5_1: {
        "name": "The Junk Yard",
        "level": "Level 5-1",
        "screen": 0xD6,
        "completion_screen": 0x5C,
        "next_level": level_5_2,
        "start_x": 0x0000,
        "start_y": 0x00C0,
        "cones": 34,
        "sprites": sprites_spin,
    },
    level_5_2: {
        "name": "The Junk Man",
        "level": "Level 5-2",
        "screen": 0xD6,
        "completion_screen": 0xE2,
        "start_x": 0x0000,  
        "start_y": 0x0030,  
        "sprites": sprites_spin,
    },
}

level_levels = {
    0: "Titles",
    0x42: "Titles", // level select
    0xBB: "Level 1-1", // cutscene
    0x97: "Ending", // cutscene
}

for level in level_data {
    level_levels[level] = level_data[level]["level"]
}

rich_presence_display("{0}, {1} Lives",
    rich_presence_lookup("Level", current_level(), level_levels),
    rich_presence_value("Lives", lives())
)

function screen_x() => word(0x004C)
function screen_y() => word(0x004F)

function in_game() => current_level() != 0 && character_sprite() != 0

// 11 progress achievements  (160)
//  2 boss achievements      ( 35)
//  8 cone achievements      (105)
//  4 head achievements      ( 85)
//  2 misc achievements      ( 15)

// ==== Levels (160) ====

function trigger_complete_level_core(level) {
    trigger = once(current_level() == level)                             // start anywhere in level
              
    if (level_data[level]["completion_screen"] != 0x5C)
        trigger = trigger &&
              current_screen() == level_data[level]["completion_screen"] // level completion cutscene
    else
        trigger = trigger && 
              current_level() == level_data[level]["next_level"]         // start next level

    return trigger
}

function trigger_complete_level(level) => trigger_complete_level_core(level) && never(lives() == 0)

function level_achievement(points, level) {
    achievement(
        title = level_data[level]["name"],
        description = "Complete " + level_data[level]["level"],
        points = points,
        trigger = trigger_complete_level(level)
    )
}

level_achievement(5, level_1_1)
level_achievement(10, level_1_2)
level_achievement(10, level_2_1)

achievement(
    title = "Electric Chase",
    description = "Complete the spark puzzle",
    points = 5,
    trigger = trigger_complete_level(level_2_puzzle)
)

level_achievement(10, level_2_2)
level_achievement(10, level_3_1)
level_achievement(10, level_3_2)

achievement(
    title = "The Pirate",
    description = "Rescue Daryl",
    points = 5,
    trigger = trigger_complete_level(level_3_boss)
)

level_achievement(10, level_4_1)
level_achievement(10, level_5_1)
level_achievement(10, level_5_2)

achievement(id=53107,
    title = "The Full Story",
    description = "Complete the game from the start",
    points = 25,
    trigger = once(current_screen() == level_data[level_1_1]["screen"]) &&      // 1-1
              once(current_screen() == level_data[level_1_2]["screen"]) &&      // 1-2
              current_screen() == level_data[level_5_2]["completion_screen"] && // complete 5-2
              never(word(0x06D4) == 0x09FF) &&                                  // cheat menu
              never(current_screen() == 0x00)                                   // game over
)

// ==== Boss Challenges (35) ====

function trigger_no_damage() => never(health() < prev(health()))  

function pirate_hp() => byte(0x4B6)
achievement(
    title = "Discus Dodger",
    description = "Defeat the Pirate without being hit",
    points = 10,
    trigger = once(current_level() == level_3_boss) &&                      // start anywhere in level
              once(pirate_hp() == 14) && pirate_hp() >250 &&                // boss full health to dead
              trigger_no_damage()                                           // without getting hit
)

function weight_y() => byte(0x470)
achievement(id=53123,
    title = "Careful Crusher",
    description = "Defeat Junkman without being hit",
    points = 25,
    trigger = once(current_level() == level_5_2) &&                             // start anywhere in level
              never(current_level() != level_5_2) &&                            // prevents trigger during final cutscene
              once(screen_x() < 0x380) &&                                       // reset until engaged with boss
              screen_x() >= 0x300 &&                                            // prevent trigger if using invincibility on fire
              byte(0x00DC) == 0x59 &&                                           // death animation??
              trigger_no_damage()                                               // without getting hit
)

// ==== Cone Challenges (105) ====

function cones_collected() => word(0x0584)
function level_cones_achievement(points, level) {
    cones = level_data[level]["cones"]
    achievement(
        title = "Cone Collector - " + level_data[level]["name"],
        description = "Collect all " + cones + " cones in " + level_data[level]["level"] + " without dying",
        points = points,
        trigger = never(current_level() != level) &&  // reset counter if level changes
                  never(current_screen() == 0x5C) &&  // reset counter on title card (prevent freebie when count goes from uninitialized to 0)
                  repeated(cones, cones_collected() != prev(cones_collected())) &&
                  never(lives() < prev(lives()))      // reset counter if died (all cones respawn)
    )
}

level_cones_achievement(10, level_1_1) 
level_cones_achievement(10, level_1_2) 
level_cones_achievement(10, level_2_1) 
level_cones_achievement(10, level_2_2) 
level_cones_achievement(10, level_3_1) 
level_cones_achievement(10, level_3_2) 
level_cones_achievement(10, level_4_1) 
level_cones_achievement(10, level_5_1) 

// ==== Head Challenges (85) ====

function level_headed_achievement(points, level) {
    achievement(
        title = "Keep Your Head - " + level_data[level]["name"],
        description = "Complete " + level_data[level]["level"] + " without losing your head",
        points = points,
        trigger = trigger_complete_level(level) &&
                  once(screen_x() == level_data[level]["start_x"]) &&
                  once(screen_y() == level_data[level]["start_y"]) &&
                  never(character_sprite() == level_data[level]["sprites"]["losing_head"])
    )
}

level_headed_achievement(25, level_2_1)
level_headed_achievement(25, level_2_2)
level_headed_achievement(50, level_3_2) // verified

function trigger_complete_level_headless(level) {
    return (trigger_complete_level_core(level) && once(character_sprite() == level_data[level]["sprites"]["lost_head"])) ||
           (trigger_complete_level_core(level) && once(character_sprite() == level_data[level]["sprites"]["moving_forward_without_head"]))
}

achievement(
    title = "It's Not a Disability",
    description = "Complete any level without your head",
    points = 5,
    trigger = current_level() != 0 &&
              never(character_sprite() == sprites_slick["moving_forward"]) &&
              never(character_sprite() == sprites_spin["moving_forward"]) &&
              never(lives() == 0) &&
              (trigger_complete_level_headless(level_1_1) || // verified
               trigger_complete_level_headless(level_1_2) ||
               trigger_complete_level_headless(level_2_1) || // verified
               trigger_complete_level_headless(level_2_2) ||
               trigger_complete_level_headless(level_3_1) ||
               trigger_complete_level_headless(level_3_2) || // verified
               trigger_complete_level_headless(level_4_1) ||
               trigger_complete_level_headless(level_5_1)) 
)


// ==== Miscellaneous (15) ====
achievement(
    title = "Insurance Policy",
    description = "Gain an extra life",            // collect 50 cones
    points = 5,
    trigger = in_game() && lives() > prev(lives()) && character_sprite() != sprites_spin["explode"]
)

//achievement(
//    title = "It Wasn't Attached",
//    description = "Lose your head",
//    points = 5,
//    trigger = in_game() && 
//              (character_sprite() == sprites_spin["lost_head"] || character_sprite() == sprites_slick["lost_head"])
//)

//achievement(
//    title = "Dangerous Lubricant",
//    description = "Equip the oil sprayer",
//    points = 5,
//    trigger = in_game() && equipped() == equip_oil
//)

// invincibility from leg weapon sets X to X and timer to 0x1A
// invincibility from steering wheel sets 0x053E to 0xFF and timer to 0x0C
// invincibility from damage sets 0x53D to 0xFF and timer to 0x02
function is_invincible() => byte(0x053C) > 0
//achievement(
//    title = "Invincible",
//    description = "Pick up a steering wheel",
//    points = 5,
//    trigger = in_game() && byte(0x053E) == 0xFF // goes from 0 to 255 when picking up a steering wheel, and back to 0 after it wears off
//)

//achievement(
//    title = "Light on Your Feet",
//    description = "Pick up a balloon",
//    points = 5,
//    trigger = in_game() && byte(0x05A3) == 10 // goes from 6 to 10 when picking up a balloon, and back to 6 after it wears off
//)    

//achievement(
//    title = "Full Speed Ahead",
//    description = "Pick up a rocket",
//    points = 5,
//    trigger = in_game() && byte(0x05A1) == 3 // goes from 2 to 3 when picking up a rocket, and back to 2 after it wears off
//)   

function is_paused() => byte(0x0027) == 0xF8
function is_rocket_active() => byte(0x05B9) != 0
achievement(
    title = "Reckless Speeding",
    description = "Maintain motion lines for at least 5 seconds",
    points = 5,
    
    // NOTE: 5 seconds is 300 frames (60 * 5), I use 280  (4.66 seconds) to give the player a little lee-way
    // since counting it themselves might seem a bit faster than 5 actual seconds.
    trigger = in_game() && repeated(280, is_rocket_active()) && 
              never(byte(0x058D) < 3) &&        // speed going right (3 = lines)
              never(byte(0x058D) > 0xFD) &&     // speed going left (-3 = lines)
              never(current_level() == 0x97) && // prevents trigger during final cutscene
              unless(is_paused())
)   

//achievement(
//    title = "Helicopter Limbs",
//    description = "Use the leg weapon",
//    points = 5,
//    trigger = in_game() && (character_sprite() == sprites_spin["leg_weapon"] || 
//                            character_sprite() == sprites_spin["leg_weapon_headless"] ||
//                            character_sprite() == sprites_slick["leg_weapon"] || 
//                            character_sprite() == sprites_slick["leg_weapon_headless"])
//)

// 0x4C1 briefly goes to 1 when walking through an enemy while invincible
// 0x4C5 briefly goes to 1 when walking through a second enemy while invincible

// TODO: 5
// 10 points - kill at least 4 things while using the steering wheel
// 10 points - kill at least 6 things while using the leg weapon
// 5 points - have at least 100000 pts


//achievement(
//    title = "Steering Wheel Slaughter",
//    description = "Eliminate at least four enemies while using the steering wheel power",
//    points = 10,
//    trigger = in_game() && never(byte(0x053E) != 0xFF) && // while using steering wheel
//              times(8, byte(0x648) != prev(byte(0x648)))  // FF=>21=>FF=>21=>FF=>21=>FF=>21=>FF
//                                                          //  21 = 1000 pts, 22 = 2000, 24 = 50pts
//)   

// 0xDE == 0xD1
// 0x668 == 0xB1
