// Gargoyle's Quest II
// #ID = 5060

// md5: 95a84bf29a9de8db0d36cb62d6fe225d (US)
//      a8fb853e26eeb3f5fd638df4d206b6ab (E)


function current_level() => byte(0x0029)
function current_scene() => byte(0x006A)
function max_health() => byte(0x0036)
function current_health() => byte(0x0038)
function current_lives() => byte(0x0039)
function jump_level() => byte(0x007D) // 0=1, 1=2, etc
function wing_energy() => byte(0x003B)
function number_of_vials() => byte(0x007E)
function enemy_hp() => byte(0x041D)

function firebrand_overworld_direction() => byte(0x03F0)
overworld_direction_left = 2
overworld_direction_right = 1
overworld_direction_up = 8
overworld_direction_down = 4

function firebrand_state() => byte(0x04F4)
state_walking = 1
state_jumping = 2
state_spitting_while_jumping = 3
state_flying = 4
state_spitting_while_flying = 5
state_climbing = 6
state_spitting_while_climbing = 7
state_inching_forward = 8
state_standing = 9
state_spitting = 10
state_exploding = 17
state_sitting = 18

function current_weapon() => byte(0x0037)
weapon_fire = 0
weapon_boomerang = 1
weapon_platform = 2
weapon_goo = 3
weapon_darkfire = 4


achievement(
    title = "The Beginning of the Quest ", description = "Your Start in Eutruria", points = 8,
    id = 15188, badge = "14679", published = "10/12/2014 3:46:24 PM", modified = "10/12/2014 4:04:02 PM",
    trigger = once(firebrand_state() == state_inching_forward) && 
              firebrand_state() == state_standing && 
              current_level() == 2
)

achievement(
    title = "Time to Leave Etruria", description = "Defeat Nagus", points = 14,
    id = 15189, badge = "14779", published = "10/12/2014 3:46:49 PM", modified = "10/12/2014 4:04:04 PM",
    trigger = current_level() == 2 && current_scene() == 1 && 
              enemy_hp() == 0 && 
              never(current_health() == 0) && 
              firebrand_overworld_direction() == overworld_direction_up
)

achievement(
    title = "Hinom Forest", description = "Defeat Death Ballon and learn the Magic Buster", points = 14,
    id = 15190, badge = "14780", published = "10/12/2014 3:46:58 PM", modified = "10/12/2014 4:04:10 PM",
    trigger = current_level() == 7 && current_scene() == 2 && 
              enemy_hp() == 0 && 
              never(current_health() == 0) && 
              once(byte(0x000064) == 0x01) && 
              byte(0x000064) == 0x03
)

achievement(
    title = "Desert Sittem", description = "Defeat the Sand Frog and learn the Magic Tornado", points = 14,
    id = 15191, badge = "14782", published = "10/12/2014 3:47:07 PM", modified = "10/12/2014 4:04:15 PM",
    trigger = current_level() == 7 && current_scene() == 8 && 
              byte(0x00041C) == 0 && 
              never(current_health() == 0) && 
              once(byte(0x000064) == 0x03) && 
              byte(0x000064) == 0x07
)

// 9973: Activated upon reentering the level after getting a game over against the boss  (RetroArch, FCEUmm)<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
achievement(
    title = "Removing the Sand", description = "Defeat the Sand Frog using only the Normal Attack (without dying)", points = 19,
    id = 15192, badge = "14783", published = "10/12/2014 3:47:14 PM", modified = "9/24/2015 7:38:33 AM",
    trigger = current_level() == 5 && 
              byte(0x00006B) == 2 && 
              never(current_weapon() != weapon_fire) &&            // using only normal attack  
              once(never(current_health() == 0)) &&                // reset if player dies
              once(byte(0x00041C) == 32) &&                        // starts at 32
              byte(0x00041C) == 0 &&                               // ends at 0
              repeated(32, byte(0x00041C) < prev(word(0x00041C)))  // deal 32 points of damage
)

achievement(
    title = "Breaking the Barrier", description = "Raise the Jump to Lv.3", points = 14,
    id = 15193, badge = "14786", published = "10/12/2014 3:47:20 PM", modified = "10/12/2014 4:04:25 PM",
    trigger = current_level() == 15 && 
              once(byte(0x00007D) == 0x01) && 
              byte(0x00007D) == 0x02
)

// 9972: Activated upon restarting the fight after a loss (RetroArch, FCEUmm)<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
achievement(
    title = "King's Palace", description = "Defeat the Fake King", points = 14,
    id = 15194, badge = "14787", published = "10/12/2014 3:47:27 PM", modified = "10/12/2014 4:04:27 PM",
    trigger = byte(0x000040) == 0x17 && 
              byte(0x00006B) == 1 && 
              byte(0x00041C) == 0 &&                    // enemy died
              never(current_health() == 0) &&           // player didn't
              byte(0x000438) == 0
)

achievement(
    title = "Mt. Imaus", description = "Defeat the Twin Guardian and get the Jump Upgrade", points = 19,
    id = 15195, badge = "14792", published = "10/12/2014 3:47:38 PM", modified = "10/12/2014 4:04:30 PM",
    trigger = current_level() == 15 && 
              byte(0x00006B) == 2 && 
              byte(0x000040) == 2 && 
              once(byte(0x00007D) == 0x02) && 
              byte(0x00007D) == 3
)

achievement(
    title = "Desert Near Topete", description = "Defeat the Outside Labyrinth", points = 19,
    id = 15196, badge = "14793", published = "10/12/2014 3:47:44 PM", modified = "10/12/2014 4:04:33 PM",
    trigger = byte(0x000040) == 0x1D && byte(0x000438) == 0
)

achievement(
    title = "Praying Mantis", description = "Defeat the Outside Labyrinth using only the Normal Attack", points = 24,
    id = 15197, badge = "14794", published = "10/12/2014 3:47:48 PM", modified = "10/12/2014 4:04:35 PM",
    trigger = byte(0x000040) == 0x1D && byte(0x000438) == 0 && 
              never(current_weapon() != weapon_fire) &&    // using only the fire weapon
              once(byte(0x00041C) == 0x20) &&              // from 32 health
              byte(0x00041C) == 0 &&                       // to 0
              never(current_health() == 0)                 // without player dying
)

// 9996: This achievement triggered near the end of the level without beating the Doppleganger.<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 6069: Labyrinth popped halfway through the level, and the other 3 popped when I died against Goza and Breagar the first time. I'm using USA version.
// 5825: Trigger before defeat Doppelganger
achievement(
    title = "Labyrinth", description = "Defeat the Doppelganger", points = 14,
    id = 15198, badge = "14810", published = "10/12/2014 3:47:52 PM", modified = "10/12/2014 4:04:38 PM",
    trigger = byte(0x000040) == 7 &&
              once(enemy_hp() == 32) &&                    // from 32 health
              enemy_hp() == 0 &&                           // to 0
              never(firebrand_state() == state_exploding)  // without player dying
)

achievement(
    title = "Fake Firebrand", description = "Defeat the Doppelganger using only the Normal Attack", points = 24,
    id = 15199, badge = "14809", published = "10/12/2014 3:47:56 PM", modified = "10/12/2014 4:04:40 PM",
    trigger = byte(0x000040) == 7 && 
              never(current_weapon() != weapon_fire) &&    // using only the normal attack
              once(enemy_hp() == 32) &&                    // from 32 health
              enemy_hp() == 0 &&                           // to 0
              byte(0x000439) == 0 &&                       // this seems unnecessary - it's a health counter for another enemy earlier in the stage
              never(firebrand_state() == state_exploding)  // without player dying
)

achievement(
    title = "The Power of the Queen", description = "Get the Magic Claw from the Queen", points = 9,
    id = 15200, badge = "14811", published = "10/12/2014 3:47:59 PM", modified = "10/12/2014 4:04:43 PM",
    trigger = once(bit3(0x000064) == 0x0) && bit3(0x000064) == 0x1 && byte(0x000040) == 0x02
)

achievement(
    title = "The Power of the King", description = "Get the Hippogriff's Feather from the King", points = 9,
    id = 15201, badge = "14812", published = "10/12/2014 3:48:13 PM", modified = "10/12/2014 4:04:45 PM",
    trigger = byte(0x000040) == 2 && once(byte(0x000063) == 0x02) && byte(0x000063) == 0x03
)

// 9979: Activated upon restarting the fight after a loss (RetroArch, FCEUmm)<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 6070: Labyrinth popped halfway through the level, and the other 3 popped when I died against Goza and Breagar the first time. I'm using USA version.
achievement(
    title = "Goza's Palace", description = "Defeat Goza", points = 19,
    id = 15202, badge = "14815", published = "10/12/2014 3:48:22 PM", modified = "10/12/2014 4:04:48 PM",
    trigger = byte(0x000040) == 8 && 
              once(enemy_hp() == 120) &&                   // from 120 health
              enemy_hp() == 0 &&                           // to 0
              never(firebrand_state() == state_exploding)  // without player dying
)

achievement(
    title = "More Powerful Than Goza", description = "Defeat Goza without taking damage", points = 24,
    id = 15203, badge = "14814", published = "10/12/2014 3:48:27 PM", modified = "10/12/2014 4:04:50 PM",
    trigger = byte(0x000040) == 8 && 
              once(enemy_hp() == 120) &&                       // from 120 health
              enemy_hp() == 0 &&                               // to 0
              never(firebrand_state() == state_exploding) &&   // without player dying
              never(current_health() < prev(current_health())) // without taking damage
)

// 10007: This Achievement triggered if you die against Breager.<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 9980: Activated upon restarting the fight after a loss (RetroArch, FCEUmm)<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 6071: Labyrinth popped halfway through the level, and the other 3 popped when I died against Goza and Breagar the first time. I'm using USA version.
// 930: triggered in last stage.
achievement(
    title = "Breager's Palace", description = "Defeat Breager", points = 24,
    id = 15204, badge = "14833", published = "10/12/2014 3:48:31 PM", modified = "10/12/2014 4:04:53 PM",
    trigger = byte(0x000040) == 9 && 
              once(enemy_hp() == 160) &&                   // from 160 health
              enemy_hp() == 0 &&                           // to 0
              never(firebrand_state() == state_exploding)  // without player dying
)

// 10008: This Achievement triggered if you die against Breager.<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 9981: Activated upon restarting the fight after a loss (RetroArch, FCEUmm)<br/>MD5: 95a84bf29a9de8db0d36cb62d6fe225d
// 6072: Labyrinth popped halfway through the level, and the other 3 popped when I died against Goza and Breagar the first time. I'm using USA version.
// 931: triggered after die and restart on Breager.
achievement(
    title = "The Real Red Blaze", description = "Defeat Breager without taking damage", points = 29,
    id = 15205, badge = "14834", published = "10/12/2014 3:48:35 PM", modified = "10/12/2014 4:04:56 PM",
    trigger = byte(0x000040) == 9 && 
              once(enemy_hp() == 160) &&                       // from 160 health
              enemy_hp() == 0 &&                               // to 0
              never(firebrand_state() == state_exploding) &&   // without player dying
              never(current_health() < prev(current_health())) // without taking damage
)

achievement(
    title = "The Human World", description = "A very Beatiful Land", points = 19,
    id = 15206, badge = "14835", published = "10/12/2014 3:48:37 PM", modified = "10/12/2014 4:04:58 PM",
    trigger = once(byte(0x000040) == 0x02) && byte(0x000040) == 0x16 && byte(0x000063) == 0x04 && byte(0x00007D) == 0x04 && bit4(0x000064) == 0x1
)

achievement(
    title = "Time to Rest", description = "It's a Long trip, so...", points = 9,
    id = 15207, badge = "14784", published = "10/12/2014 3:48:45 PM", modified = "10/12/2014 4:05:01 PM",
    trigger = once(firebrand_state() == state_standing) && firebrand_state() == state_sitting
)

achievement(
    title = "Another Heart", description = "Get the first Life Upgrade", points = 9,
    id = 15208, badge = "14685", published = "10/12/2014 3:48:53 PM", modified = "10/12/2014 4:05:05 PM",
    trigger = once(max_health() == 0x03) && max_health() == 0x04 && current_health() == 0x04
)

achievement(
    title = "Fallen Angel", description = "Raise the Wings to Lv.2", points = 9,
    id = 15209, badge = "14781", published = "10/12/2014 3:49:00 PM", modified = "10/12/2014 4:05:08 PM",
    trigger = current_level() == 15 && current_scene() == 1 && once(byte(0x000063) == 0) && byte(0x000063) == 0x01
)

achievement(
    title = "Red Arremer", description = "A Perfect Gargoyle", points = 24,
    id = 15210, badge = "14813", published = "10/12/2014 3:49:04 PM", modified = "10/12/2014 4:05:11 PM",
    trigger = bit3(0x000064) == 0x1 && bit4(0x000064) == 0x1 && byte(0x000063) == 0x04 && byte(0x00007D) == 0x04 && max_health() == 0x08
)

achievement(
    title = "Very Few Vails", description = "Get the MAX of Vails", points = 19,
    id = 15211, badge = "14790", published = "10/12/2014 3:49:07 PM", modified = "10/12/2014 4:05:14 PM",
    trigger = byte(0x00007E) == 0x99
)

