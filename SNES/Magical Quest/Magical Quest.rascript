// The Magical Quest starring Mickey Mouse
// #ID = 467

function current_screen() => byte(0x02AD)
function health() => byte(0x02B1)
function screen_x() => word(0x049C)
function screen_x_hi() => byte(0x049D)

function achievement_damageless_boss(stage, name, boss_x_hi) {
    achievement(
        title = "Expert " + name,
        description = "Defeat the " + name + " without being harmed",
        points = 10, 
        trigger = repeated(10, current_screen() == stage) &&       // 0x02AD: on correct stage
                  never(current_screen() < stage) &&               // 0x02AD: not on correct stage / game over
                  current_screen() == 0x34 &&                      // 0x02AD: complete stage
                  repeated(10, screen_x_hi() == boss_x_hi - 1) &&  // 0x049D: before boss
                  never(health() < prev(health())) &&              // 0x02B1: damageless
                  repeated(10, byte(0x1D8D) == 1) &&               // 0x1D8D: during boss?
                  never(screen_x() == 0)                           // 0x049C: outside level
    )
}

achievement_damageless_boss(3, "Snake Boss", 1)
achievement_damageless_boss(11, "Fire Boss", 1)
achievement_damageless_boss(15, "Bird Boss", 1)
achievement_damageless_boss(19, "Ice Skater Boss", 1)

function achievement_damageless_subboss(stage, name, description) {
    achievement(
        title = "Return of " + name,
        description = "Defeat the " + description + " Mini-boss in Pete's Castle without being harmed",
        points = 5, 
        trigger = repeated(10, current_screen() == stage) &&       // 0x02AD: on correct stage (1)
                  never(current_screen() != stage) &&              // 0x02AD: never leave stage/game over (5*)
                  screen_x() > 0x180 &&                            // 0x049C: after boss (6*)
                  repeated(10, screen_x() < 0x80) &&               // 0x049C: before boss (3)
                  never(health() < prev(health())) &&              // 0x02B1: damageless (2)
                  repeated(10, byte(0x1D8D) == 1)                  // 0x1D8D: during boss? (4)
    )
}

achievement_damageless_subboss(29, "Swoopy", "Bat")
achievement_damageless_subboss(28, "Hoopy", "Vine")
achievement_damageless_subboss(31, "Bork", "Fire")

achievement(
    title = "Ha-ha! Not This Time Pete!",
    description = "Defeat Pete without being harmed",
    points = 10, 
    trigger = repeated(10, current_screen() == 27) &&          // 0x02AD: on correct stage (1)
              current_screen() == 0x39 &&                      // 0x02AD: complete stage (4)
              never(health() < prev(health())) &&              // 0x02B1: damageless (2)
              repeated(10, byte(0x035D) == 5)                  // 0x035D: timer (hundreds) (3*)
)
