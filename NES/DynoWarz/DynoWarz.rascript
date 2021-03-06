// DynoWarz - The Destruction of Spondylus
// #ID = 1673

// Level 1 - 8547
// Level 2 - 5431
// Level 3 - 9892
// Level 4 - 6315
// Level 5 - 7452
// Level 6 - 1697
// Level 7 - 6425
// Ending  - 9425

// Enemy Viewer - 7777 [Up/Down to cycle, Start to leave]
// Weapon Select - 8708 [Up to change gun in man mode, Down in dino mode]
// Sound Test - 1965 [B to change sound, A to play, Start to leave]
// Level Select - 0916

locations = {
   0x00: "Menu",
   0x04: "Stage 1", // Intro
   0x08: "Stage 1", // Planet
   0x0C: "Stage 1", // Cave
   0x10: "Stage 1", // Planet
   0x14: "Stage 1", // AIC
   0x18: "Stage 2", // Planet
   0x1C: "Stage 2", // Cave
   0x20: "Stage 2", // Planet
   0x24: "Stage 2", // AIC
   0x28: "Stage 3", // Planet
   0x2C: "Stage 3", // Cave
   0x30: "Stage 3", // Planet
   0x34: "Stage 3", // AIC
   0x38: "Stage 4", // Planet
   0x3C: "Stage 4", // Jungle
   0x40: "Stage 4", // Planet
   0x44: "Stage 4", // AIC
   0x48: "Stage 5", // Planet
   0x4C: "Stage 5", // Cave
   0x50: "Stage 5", // Planet
   0x54: "Stage 5", // AIC
   0x58: "Stage 6", // Planet
   0x5C: "Stage 6", // Cave
   0x60: "Stage 6", // Planet
   0x64: "Stage 6", // AIC
   0x68: "Stage 7", // Planet
   0x6C: "Stage 7", // Cave
   0x70: "Stage 7", // Planet
   0x74: "Stage 7", // AIC
}

function location() => byte(0x0089) 

weapons = {
   0: "Punch",
   1: "Launch Fist",
   2: "Fire Balls",
   3: "Beam",
   4: "Bomb",
   5: "Gun",
}

function define_weapon(index) {
    weapon_lookup[index] = weapons[index] + " 1"
    weapon_lookup[index + 5] = weapons[index] + " 2"
    weapon_lookup[index + 10] = weapons[index] + " 3"
}

weapon_lookup = { 0: weapons[0] }
define_weapon(1)
define_weapon(2)
define_weapon(3)
define_weapon(4)

// NOTE: there is no Gun 3, Gun 2 registers as a level 3 gun.
weapon_lookup[5] = weapons[5] + " 1"
weapon_lookup[15] = weapons[5] + " 2" 

// Grabbing the "P" on stage 6A will fully upgrade whatever weapon you're currently using.
// If you're still using Punch, it becomes a Level 3 punch (0 + 2 * 5 = 10)
weapon_lookup[10] = "Punch"

function weapon() => byte(0x0610)
function weapon_level() => byte(0x00D5)

rich_presence_display("{0}, {1}",
    rich_presence_lookup("Location", location(), locations),
    rich_presence_lookup("Weapon", weapon() + weapon_level() * 5, weapon_lookup)
)

function player_x() => word(0x0611)
function player_y() => byte(0x0601)
function player_energy() => byte(0x060A)
function player_barrier() => byte(0x060E)
function trigger_dead() => player_energy() == 0 || player_y() > 0xE2 // Y goes to E1 when jumping in robosaur
function trigger_returning_to_robosaur() => byte(0x0490) == 2

// demon dog = 02 17
// computer 3 = 02 19 (hp goes to -1 when defeated)
// tiny dimetradon = 0X 02
// pteradactyl = 0X 05
// triceratops = 0X 08
// rocket launcher dino = 03 0D
// bomb triceratops = 0X 0F
// tube sauropod = 0X 12
// stegosaurus = 0X 13
// sauropod = 0X 1D
// stage 1 boss = 02 07 (pink ceratosaurus)
// stage 2 boss = 02 09 (blue pteradactyl)
// stage 3 boss = 03 16 (green ceratosaurus)
// stage 4 boss = 03 14 (silver pteradactyl)
// stage 5 boss = 02 14 (pteradactyl)
// stage 6 boss = 02 0A (bronchiosaurus)
// stage 7 boss = 02 0B (tube bronchiosaurus)

function enemy_id(index) => word(0x061A + 29 * index)
function enemy_hp(index) => byte(0x0620 + 29 * index)

// 35 pts per stage (x7) = 245
// ---------------------------
//  5 - Defeat the guardian 
// 15 - Defeat the guardian with the fist weapon
//  5 - Deactivate the computer and return to your robosaur
// 10 - Complete the stage without dying

// enemy HP actually has to go below 0 before they die.
function trigger_defeat_boss(index, boss_id) => enemy_id(index) == boss_id && enemy_hp(index) > 0xE0

function stage_achievements(stage_id, boss_id, boss_name, stage_sequence) {
    // you encounter the stage 5 boss twice, once earlier in the level and one at the end, ensure we only
    // count the one at the end.
    trigger_boss_fight = trigger_defeat_boss(0, boss_id) || trigger_defeat_boss(1, boss_id)
    if (stage_id == 5)
        trigger_boss_fight = (trigger_defeat_boss(0, boss_id) || trigger_defeat_boss(1, boss_id)) && player_x() > 0x0400

    achievement(
        title = boss_name + " Defeated",
        description = "Defeat the " + stage_sequence + " guardian",
        points = 5,
        trigger = location() == stage_id * 16 && trigger_boss_fight
    )

    achievement(
        title = boss_name + " Brawler",
        description = "Defeat the " + stage_sequence + " guardian without a weapon",
        points = 10,
        trigger = location() == stage_id * 16 && 
                  weapon() == 0 &&
                  trigger_boss_fight 
    )
    
    achievement(
        title = "Stage " + stage_id + " Complete",
        description = "Deactivate the " + stage_sequence + " computer and return to your robosaur.",
        points = 5,
        trigger = location() == stage_id * 16 + 4 && 
                  trigger_returning_to_robosaur()
    )
    
    start_id = stage_id * 16 - 8
    if (stage_id == 1)
        start_id = 4
    
    achievement(
        title = "Stage " + stage_id + " Expert",
        description = "Complete stage " + stage_id + " without continuing",
        points = 10,
        trigger = once(location() == start_id) && 
                  location() == stage_id * 16 + 4 &&
                  trigger_returning_to_robosaur() && 
                  never(trigger_dead())
    )
}

stage_achievements(1, 0x0702, "Pink Ceratosaurus", "first") // launch fist 3 for shutout ?? is even possible?
stage_achievements(2, 0x0902, "Blue Pteradactyl", "second") // fire balls 3 - small jump at start so it goes over head, then hide in right corner
stage_achievements(3, 0x1603, "Green Ceratosaurus", "third") // easy - just duck the incoming bullets
stage_achievements(4, 0x1403, "Silver Pteradactyl", "fourth") // same as other pteradactyl - walk to black between trees and gate, !small! jump left, then hide in right corner
stage_achievements(5, 0x1402, "Green Pteradactyl", "fifth") // same as other pteradactyls
stage_achievements(6, 0x0A02, "Blue Bronchiosaurus", "sixth") // easy - just need a powerful weapon and duck under bullets
stage_achievements(7, 0x0B03, "Red Bronchiosaurus", "seventh")

// Challenges = 110 [355]
// ---------------------------
// 10 - defeat any ceratosaurus without taking damage
// 25 - defeat any pteradacytl without taking damage
// 10 - defeat any brontosaurus without taking damage
// 15 - defeat any LSC without taking damage
// 50 - Complete all seven stages without dying

// I don't believe stage 1 or stage 7 bosses can be defeated without taking damage.
// Stage 1 boss charges at you every time he's hit and there's no way to jump over him
// Stage 7 boss can be run under when it jumps, but has so many HP you have to successfully do it at least five times.
// For the three pteradactyls (2,4,5), you just have to avoid the initial swoop by making a small jump just to the left as soon
// as it starts diving. If the pteradactly doesn't hit you, run to the right corner where it can't get you and fight from there.
// For bosses 3 and 6, you just need to kill it before it gets to you and duck under any bullets they send.

function trigger_flawless_boss(boss_id) => trigger_defeat_boss(0, boss_id) && 
                                           once(enemy_id(0) != boss_id) &&
                                           never(player_energy() < prev(player_energy())) &&
                                           never(player_barrier() < prev(player_barrier()))

achievement(
    title = "Ceratosaurus Shutout",
    description = "Defeat any ceratosaurus guardian without being hit",
    points = 10,
    trigger = low4(0x0089) == 0x00 &&
              (trigger_flawless_boss(0x0702) || // stage 1
               trigger_flawless_boss(0x1603))   // stage 3
)

achievement(
    title = "Pteradactyl Shutout",
    description = "Defeat any pteradactyl guardian without being hit",
    points = 10,
    trigger = low4(0x0089) == 0x00 &&
              (trigger_flawless_boss(0x0902) || // stage 2
               trigger_flawless_boss(0x1403) || // stage 4
               (trigger_flawless_boss(0x1402) && player_x() > 0x0400))   // stage 5
)

achievement(
    title = "Bronchiosaurus Shutout",
    description = "Defeat any bronchiosaurus guardian without being hit",
    points = 10,
    trigger = low4(0x0089) == 0x00 &&
              (trigger_flawless_boss(0x0A02) || // stage 6
               trigger_flawless_boss(0x0B03))   // stage 7
)

achievement(
    title = "Firewall",
    description = "Defeat any computer without being hit",
    points = 10,
    trigger = low4(0x0089) == 0x04 && trigger_flawless_boss(0x1902)
)

achievement(
    title = "Spondylus Savior",
    description = "Complete all seven stages without continuing",
    points = 50,
    trigger = once(location() == 4) && 
              location() == 7 * 16 + 4 &&
              trigger_returning_to_robosaur() && 
              never(trigger_dead()) &&
              unless(byte(0x00B6) == 2) // disable while player rising to next level (Y will become negative,
                                        // which appears as if the player fell in a hole)
)

// Weapon Upgrades = 45 [400]
// ---------------------------
// 10 - Fully upgrade the Launch Fist weapon (3)
// 10 - Fully upgrade the Fire Ball weapon (3)
// 10 - Fully upgrade the Bomb weapon (3)
// 10 - Fully upgrade the Beam weapon (3)
//  5 - Fully upgrade the Gun weapon (2)

function is_weapon_select_enabled() => byte(0x0480) == 1

function weapon_achievement(title, weapon_id, points) {
   achievement(
       title = title,
       description = "Fully upgrade the " + weapons[weapon_id] + " weapon",
       points = points,
       trigger = weapon() == weapon_id && weapon_level() == 2 &&
                 !is_weapon_select_enabled() // prevent trigger when weapon select cheat enabled
   )
}
   
weapon_achievement("Rocket Fists", 1, 5)
weapon_achievement("Great Balls of Fire", 2, 5)
weapon_achievement("Pew Pew", 3, 5)
weapon_achievement("Incoming", 4, 5)
weapon_achievement("Double Barrels", 5, 5)
