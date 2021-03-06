// The Adventures of Lolo III
// #ID=1532
// md5: 3a908031aa0e30b2122e9468b96ead85 (U)

// 17 zones, 3 with 10 levels each, 14 with 5 levels each = 100 levels

function current_character() => bit0(0x0052)
character_lolo = 0
character_lala = 1

characters = {
    character_lolo: "Lolo",
    character_lala: "Lala", 
}

function current_location() => byte(0x014F)
location_grandpas_tree_1 = 0
location_grandpas_tree_2 = 1
location_level_1 = 2
location_level_2 = 3
location_level_3 = 4
location_level_4 = 5
location_level_5 = 6
location_level_6 = 7
location_level_7 = 8
location_level_8 = 9
location_level_9 = 10
location_level_10 = 11
location_level_11 = 12
location_level_12 = 13
location_level_13 = 14
location_level_14 = 15
location_level_15 = 16
location_level_16 = 17
location_level_17 = 18

locations = {
    location_grandpas_tree_1: "Grandpa's Tree",
    location_grandpas_tree_2: "Grandpa's Second Tree",
    location_level_1: "Level 1",
    location_level_2: "Level 2",
    location_level_3: "Level 3",
    location_level_4: "Level 4",
    location_level_5: "Level 5",
    location_level_6: "Level 6",
    location_level_7: "Level 7",
    location_level_8: "Level 8",
    location_level_9: "Level 9",
    location_level_10: "Level 10",
    location_level_11: "Level 11",
    location_level_12: "Level 12",
    location_level_13: "Level 13",
    location_level_14: "Level 14",
    location_level_15: "Level 15",
    location_level_16: "Level 16",
    location_level_17: "Level 17",
}

function current_screen() => byte(0x015A)
screen_password = 0x01   // 001
screen_title = 0x02      // 010
screen_transition = 0x03 // 011
screen_boss  = 0x04      // 100
screen_level = 0x05      // 101
screen_map = 0x06        // 110

function activity(screen, location) {
    modifier = screen / 2
    return modifier * 20 + location
}
function current_activity() => bit2(0x015A) * 40 + bit1(0x015A) * 20 + current_location() 

activities = {}

for location in locations {
    activities[activity(screen_level, location)] = "solving puzzles in " + locations[location]

    if (location <= location_level_3) {
        activities[activity(screen_map, location)] = "in the western kingdom"
        activities[activity(screen_password, location)] = "in the western kingdom"
    } else if (location <= location_level_8) {
        activities[activity(screen_map, location)] = "in the eastern kingdom"
        activities[activity(screen_password, location)] = "in the eastern kingdom"
    } else if (location <= location_level_13) {
        activities[activity(screen_map, location)] = "in the underwater kingdom"
        activities[activity(screen_password, location)] = "in the underwater kingdom"
    } else {
        activities[activity(screen_map, location)] = "in the underground kingdom"
        activities[activity(screen_password, location)] = "in the underground kingdom"
    }
}
activities[activity(screen_title, 0)] = "in the titles"
activities[activity(screen_map, location_grandpas_tree_2)] = "in the eastern kingdom"
activities[activity(screen_password, location_grandpas_tree_2)] = "in the eastern kingdom"
activities[activity(screen_title, location_level_9)] = "in the eastern kingdom" // cutscene going underwater
activities[activity(screen_title, location_level_14)] = "in the underwater kingdom" // cutscene going underground
activities[activity(screen_title, location_level_17)] = "victorious!" // end of game cutscene

rich_presence_display("{0} is {1}",
    rich_presence_lookup("Character", current_character(), characters),
    rich_presence_lookup("Location", current_activity(), activities)
)

function current_room() => byte(0x0051)
first_room = {
    location_grandpas_tree_1: 0x00,
    location_grandpas_tree_2: 0,
    location_level_1: 0x0A,
    location_level_2: 0x0F,
    location_level_3: 0x14,
    location_level_4: 0x1E,
    location_level_5: 0x23,
    location_level_6: 0x28,
    location_level_7: 0x2D,
    location_level_8: 0x32,
    location_level_9: 0x37,
    location_level_10: 0x3C,
    location_level_11: 0x41,
    location_level_12: 0x46,
    location_level_13: 0x4B,
    location_level_14: 0x55,
    location_level_15: 0x5A,
    location_level_16: 0x5F,
    location_level_17: 0x64,
}
last_room = {
    location_grandpas_tree_1: 0x04,
    location_grandpas_tree_2: 0,
    location_level_1: 0x0E, // 1-5 (egg room doesn't update the value)
    location_level_2: 0x13, // 2-5 (key room doesn't update the value)
    location_level_3: 0x1D, // 3-10
    location_level_4: 0x22, // 4-5
    location_level_5: 0x27, // 5-5
    location_level_6: 0x2C, // 6-5 
    location_level_7: 0x31, // 7-5
    location_level_8: 0x36, // 8-5
    location_level_9: 0x3B, // 9-5
    location_level_10: 0x40, // 10-5
    location_level_11: 0x45, // 11-5
    location_level_12: 0x4A, // 12-5
    location_level_13: 0x54, // 13-10
    location_level_14: 0x59, // 14-5
    location_level_15: 0x5E, // 15-5
    location_level_16: 0x63, // 16-5
    location_level_17: 0x6D, // 17-10
}

// $0150 contains the floor progress for grandpa's tree
// $0151 contains the floor progress for level 1 (high4) and level 2 (low 4)
// $0152 for levels 3 and 4, ..., $0159 - level 17 progress (low4)
function progress(location) {
    address = location / 2 + 0x0150
    is_odd = location % 2
    if (is_odd == 1)
        return low4(address)
        
    return high4(address)
}

// progress == 0 is a special room (typically a boss encounter)
// progress == 14 means the level has been completed and the player is fading out
// progress == 15 means the level has been demolished on the map screen
// all other values are the current floor (1 = 1, 5 = 5, 10 = 10)
progress_boss = 0
progress_completed = 14
progress_demolished = 15

function complete(location) => current_location() == location && progress(location) == progress_completed

// completing a floor increments the progress byte for the current level ($151-$159). rather than watching all of them
// for changes, look for something else. The only reliable thing I could find was Lolo's Y position being in the 
// northern wall. Other promising values caused false positives (primarily when pressing select to reset the floor or
// start to return to the map).
function jewel_collected() => byte(0x0060) == 0x01
function player_y() => byte(0x00CD)
function complete_floor() => player_y() == 0x13 && jewel_collected()

// byte(0x0065) goes to 1 for death and 2 for give up, but also sometimes goes to 2 when leaving a level with the start button
function give_up() => word(0x035E) == 0x9FBF
function die_as_lolo() => byte(0x000F) == 0xAE // these fail in room 5-4
function die_as_lala() => byte(0x000F) == 0xCA // these fail in room 5-4
function die() => byte(0x0065) == 1            // this works for all of level 5, maybe other levels should use too?

function current_shots() => byte(0x0057)

function boss_hp() => byte(0x0092) // Alma, Rocky, Leeper, Skull, Gol, Medusa, Don Medusa
function boss2_hp() => byte(0x0093) // Snakey

// 8 is start of sleep, down to 0, then alternates between 1 and 0
// 4 is the last frame where the eyes are open. 3 and 2 are just longer versions of 1 and 0
function is_sleeping() => byte(0x00D7) == 3 

// +------+--------+
// |normal|flawless|
// +------+--------+
// |   3  |    7   |       Level 1 (left volcano)
// |   3  |    7   |       Level 2 (right volcano)
// |   7  |   14   |       Level 3 (tower)
// |   5  |   10   |       Level 4 (first cave) [snakey boss]
// |   5  |   10   |       Level 5 (second cave) [alma boss]
// |   5  |   10   |       Level 6 (third cave) [rocky boss]
// |   5  |   10   |       Level 7 (fourth cave) [leper boss]
// |   6  |   12   |       Level 8 (castle)
// |   7  |   14   |       Level 9 (first pyramid) [skull boss]
// |   7  |   14   |       Level 10 (second pyramid) [gol boss]
// |   7  |   14   |       Level 11 (third pyramid) [medusa boss]
// |   7  |   14   |       Level 12 (fourth pyramid) [don medusa boss]
// |  12  |   24   |       Level 13 (castle) [king egger boss]
// |  10  |   20   |       Level 14 (first castle)
// |  10  |   20   |       Level 15 (second castle)
// |  10  |   20   |       Level 16 (third castle)
// |  20  |   40   |       Level 17 (final castle) [king egger boss]
// +------+--------+-----+
// | 129  |  260   | 389 |
// +------+--------+-----+
//                 |   3 | Defeat a boss other than King Egger as Lala [level 4,5,6,7,9,10,11,12]
//                 |   4 | Reach the top of the tower without the rainbow egg
//                 |   4 | Finish a level with at least three magic shots remaining
//                 +-----+
//                 | 400 |
//                 +-----+

function level_achievement(location, points, title, description) {
    achievement(title = title, points = points, description = description,
                trigger = complete(location))
}

function flawless_level_achievement(location, points, title, description) {
    map_clause = never(current_screen() == screen_map)
    if (location == location_level_3)
        map_clause = map_clause && unless(progress(location) == 0) // prevent disabling during rainbow cutscene
    
    achievement(title = title, points = points, description = "Complete all rooms in " + description + " without dying, leaving, or giving up",
                trigger = complete_floor() &&
                          current_room() == last_room[location] && 
                          once(current_room() == first_room[location]) &&
                          map_clause &&
                          never(give_up()) && 
                          never(die_as_lolo()) &&
                          never(die_as_lala()))
}

level_achievement(location_level_1, 4, "Which Came First?", "Collect the rainbow egg")
level_achievement(location_level_2, 4, "The Key to the Kingdom", "Collect the key")
level_achievement(location_level_3, 5, "The Eastern Reaches", "Reach the eastern part of the realm")
level_achievement(location_level_4, 5, "Bested Snakey", "Defeat the Snakey boss")
level_achievement(location_level_5, 5, "Bested Alma", "Defeat the Alma boss")
level_achievement(location_level_6, 5, "Bested Rocky", "Defeat the Rocky boss")
level_achievement(location_level_7, 5, "Bested Leeper", "Defeat the Leeper boss")
level_achievement(location_level_8, 5, "All Aboard", "Complete the lakeside castle")
level_achievement(location_level_9, 5, "Bested Skull", "Defeat the Skull boss")
level_achievement(location_level_10, 5, "Bested Gol", "Defeat the Gol boss")
level_achievement(location_level_11, 5, "Bested Medusa", "Defeat the Medusa boss")
level_achievement(location_level_12, 5, "Bested Don Medusa", "Defeat the Don Medusa boss")

achievement(title = "Captured", description = "Confront King Egger", points = 10,
            trigger = current_location() == location_level_13 &&
                      progress(location_level_13) == progress_boss &&
                      high4(0x0052) == 0x5)

level_achievement(location_level_14, 10, "Underworld I", "Complete the first underworld palace")
level_achievement(location_level_15, 10, "Underworld II", "Complete the second underworld palace")
level_achievement(location_level_16, 10, "Underworld III", "Complete the third underworld palace")

achievement(title = "Happily Ever After", description = "Cure the inhabitants of Eggerland", points = 25,
            trigger = current_location() == location_level_17 && 
                      byte(0x003F) == 0x0C)

flawless_level_achievement(location_level_1, 5, "Flawless Egg Cave", "the egg cave")
flawless_level_achievement(location_level_2, 5, "Flawless Key Cave", "the key cave")
flawless_level_achievement(location_level_3, 10, "Flawless Towers", "both towers")
flawless_level_achievement(location_level_4, 10, "Flawless Snakey's Cave", "Snakey's cave")
flawless_level_achievement(location_level_5, 10, "Flawless Alma's Cave", "Alma's cave")
flawless_level_achievement(location_level_6, 10, "Flawless Rocky's Cave", "Rocky's cave")
flawless_level_achievement(location_level_7, 10, "Flawless Leeper's Cave", "Leeper's cave")
flawless_level_achievement(location_level_8, 10, "Flawless Lakeside Castle", "the lakeside castle")           
flawless_level_achievement(location_level_9, 10, "Flawless Skull's Pyramid", "Skull's pyramid")
flawless_level_achievement(location_level_10, 10, "Flawless Gol's Pyramid", "Gol's pyramid")
flawless_level_achievement(location_level_11, 10, "Flawless Medusa's Pyramid", "Medusa's pyramid")
flawless_level_achievement(location_level_12, 10, "Flawless Don Medusa's Pyramid", "Don Medusa's pyramid")
flawless_level_achievement(location_level_13, 25, "Flawless Castle Egger", "King Egger's castle")
flawless_level_achievement(location_level_14, 25, "Flawless Underworld I", "the first underworld palace")
flawless_level_achievement(location_level_15, 25, "Flawless Underworld II", "the second underworld palace")
flawless_level_achievement(location_level_16, 25, "Flawless Underworld III", "the third underworld palace")
flawless_level_achievement(location_level_17, 25, "Flawless Egger's Palace", "the final underworld palace")

achievement(title = "Not a Helpless Princess", description = "Defeat a boss other than King Egger as Lala", points = 3,
            trigger = current_character() == character_lala &&
                      current_location() != location_level_17 && 
                      never(current_screen() != screen_boss) && 
                      unless(byte(0x0065) != 0) &&                 // prevents trigger on death/suicide
                      ((once(boss_hp() > 0) && boss_hp() == 0) ||
                       (once(boss2_hp() > 0) && boss2_hp() == 0)))
            
achievement(title = "Forgot Something?", description = "Reach the top of the tower without the rainbow egg", points = 5,
            trigger = current_location() == location_level_3 &&
                      progress(location_level_3) == 0 &&
                      progress(location_level_1) != progress_demolished &&
                      current_screen() == screen_boss &&
                      byte(0x001E) > 0xA4 && byte(0x001E) < 0xB0 && // x
                      byte(0x001F) > 0x6C && byte(0x001F) < 0x84)   // y
            
// spare magic shots are discarded when the jewel is collected
// 10-3 can be done with 2 left
achievement(title = "Spare Magic", description = "Collect the jewel on any floor with at least two unused magic shots", points = 4,
            trigger = prev(current_shots()) >= 2 && jewel_collected())

// sleep timer is not active in boss fights - gol would have been a good candidate.
//achievement(title = "Hidden in Plain Sight", description = "Fall asleep facing any boss", points = 5,
//            trigger = is_sleeping())

