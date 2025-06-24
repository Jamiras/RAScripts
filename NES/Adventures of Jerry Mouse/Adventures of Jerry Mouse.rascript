// ~Hack~ Adventures of Jerry Mouse, The: The Rescue of Nibbles
// #ID = 16203

// A+Start works to continue on the X-1 world where you last ran out of lives

powerups = {
    0: "Small",
    1: "Big",
    2: "Super",
}

function current_powerup() => byte(0x0756)
function current_world() => byte(0x075f) + 1
function current_level() => byte(0x075c) + 1
function current_lives() => byte(0x075a) + 1
function current_score() => byte(0x07dd) * 1000000 +
                            byte(0x07de) * 100000 +
                            byte(0x07df) * 10000 +
                            byte(0x07e0) * 1000 +
                            byte(0x07e1) * 100 +
                            byte(0x07e2) * 10
function screen_offset() => byte(0x071a)
function stage_scrolling_progress() => byte(0x006d)
function current_coins() => byte(0x0075e)

function is_demo() => byte(0x0770) == 0
function is_playing() => byte(0x0770) == 1
function enemy_squashed() => bit2(0x00f1) == 1
function enemy_killed() => bit3(0x00f1) == 1
function tom_health() => byte(0x0483)

function level_complete() => prev(byte(0x000e)) == 5
function level_start() => byte(0x000e) == 7 && stage_scrolling_progress() == 0

function picked_up_1up() => byte(0x0115) == 0x0B
function powerup_onscreen() => byte(0x0039)
powerup_1up = 3

lives = {
    1: "life",
}

rich_presence_conditional_display(is_demo(), "{0} Jerry in {1}-{2} | Demo",
    rich_presence_lookup("Powerup", current_powerup(), powerups),
    rich_presence_value("Number", current_world()),
    rich_presence_value("Number", current_level())
)

rich_presence_display("{0} Jerry in {1}-{2} | {3} {4} | {5}",
    rich_presence_lookup("Powerup", current_powerup(), powerups),
    rich_presence_value("Number", current_world()),
    rich_presence_value("Number", current_level()),
    rich_presence_value("Number", current_lives()),
    rich_presence_lookup("Lives", current_lives(), lives, fallback="lives"),
    rich_presence_value("Score", current_score(), format="SCORE")
)

function pacifist_achievement(world, level, points)
{
    achievement(
        title = "Sneaky as a Mouse " + world + "-" + level,
        description = "Complete " + world + "-" + level + " without stomping on or killing any enemies",
        points = points,
        trigger = never(current_world() != world) && never(current_level() != level) &&
                  never(is_demo()) &&
                  once(level_start()) &&
                  never(enemy_squashed() || enemy_killed()) &&
                  trigger_when(level_complete())
    )
}

function coins_achievement(world, level, coins, points)
{
    achievement(
        title = "The Packrat's Purse " + world + "-" + level,
        description = "Collect " + coins + " coins in " + world + "-" + level + " without dying",
        points = points,
        trigger = never(current_world() != world) && never(current_level() != level) &&
                  measured(repeated(coins, current_coins() != prev(current_coins()))) &&
                  never(level_start()) &&
                  never(current_lives() < prev(current_lives()))
                  
    )
}

function tom_achievement(world, level, points, type="progression")
{
    roman = {
        1: "I",
        2: "II",
        3: "III",
    }

    achievement(
        title = "Tom Trounced " + roman[world],
        description = "Defeat Tom in " + world + "-" + level,
        points = points,
        type = type,
        trigger = never(current_world() != world) && never(current_level() != level) &&
                  once(tom_health() != 0) && 
                  byte(0x00f0) == 8 // music buffer
    )
}

// no pipes can be entered in whole game
// no stars in whole game

pacifist_achievement(1, 1, 5)
coins_achievement(1, 2, 50, 5)
pacifist_achievement(1, 3, 5)
tom_achievement(1, 4, 5)

coins_achievement(2, 2, 20, 5)
pacifist_achievement(2, 3, 5)
tom_achievement(2, 4, 5)

coins_achievement(3, 2, 25, 5)
pacifist_achievement(3, 3, 5)
tom_achievement(3, 4, 10, "win_condition")

achievement("The Cat's Me-Ouch!", "Defeat Tom by throwing cheese at him", 5,
    trigger = current_level() == 4 &&
              current_powerup() == 2 &&
              tom_health() == 0 &&
              bit7(0x00f2) == 1 // bowser KO sound
)

achievement("Mouse Trouble", "Defeat 20 enemies by throwing cheese at them", 3,
    trigger = current_powerup() == 2 &&
              tom_health() == 0 &&
              measured(repeated(20, current_powerup() == 2 &&                   // player can shoot fireballs
                                    enemy_killed() && prev(!enemy_killed()) &&  // enemy killed by fireball or shell
                                    (byte(0x0024) != 0 || byte(0x0025) != 0)))  // fireball on screen
)

achievement("The Invisible Mouse", "Collect the hidden 1-up in 1-1", 3,
    trigger = current_world() == 1 && current_level() == 1 &&
              powerup_onscreen() == powerup_1up &&
              picked_up_1up()
)

achievement("Mouse Cleaning", "Collect the hidden 1-up in 2-1", 3,
    trigger = never(current_world() != 2) && never(current_level() != 1) &&
              powerup_onscreen() == powerup_1up &&
              picked_up_1up()
)

achievement("Is There a Doctor in the Mouse?", "Collect enough coins to get an extra life", 2,
    trigger = is_playing() && 
              current_coins() == 0 &&
              prev(current_coins()) == 99 &&
              current_lives() > prev(current_lives())
)

achievement("Mouse into Space", "Get a 5000 point bonus from the flagpole", 2,
    trigger = byte(0x010f) == 0 && // 5000-point bonus
              prev(byte(0x000e)) == 4 // flagpole
)

achievement("Yankee Doodle Mouse", "Earn six fireworks at the end of a level", 2,
    trigger = byte(0x06d7) == 6 && // 6 fireworks
              level_complete()
)


