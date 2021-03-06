// The Bugs Bunny Crazy Castle
// #ID = 1597

function is_actor_alive(index) => bit7(0x000500 + index * 0x20) == 1
function is_actor_moving_vertically(index) => bit1(0x000500 + index * 0x20)
function is_in_menu() => bit1(0x00000C) == 1
function is_in_level() => !is_in_menu() && is_actor_alive(0)
function current_level() => byte(0x000068) + 1
function max_level() => byte(0x000069) + 1
function current_lives() => byte(0x00007C)
function is_level_complete() => byte(0x000518) == 0xFF

function complete_level_trigger(level) => is_in_level() && is_level_complete() && current_level() == level

function achievement_complete_level(level, points) {
    achievement(
        title = "Level " + level + " Complete", 
        description = "Complete level " + level, 
        points = points,
        trigger = complete_level_trigger(level)
    )
}

achievement_complete_level(10, 5) // WZFS
achievement_complete_level(20, 5) // ZTPZ
achievement_complete_level(30, 5) // WYCZ
achievement_complete_level(40, 10) // TX9W
achievement_complete_level(50, 10) // 2TWX
achievement_complete_level(60, 10) // YTKX

achievement(
    title = "Marathon",
    description = "Complete all 60 levels in one sitting without changing the selected level",
    points = 25,
    trigger = complete_level_trigger(60) && once(current_level() == 1) && 
              never(current_level() < max_level()) &&
              never(byte(0x01FB) == 0x1E)  // main menu
)

function achievement_complete_secret_level(secret_level, level) {
    achievement(
        title = "Level S" + secret_level + " Complete", 
        description = "Complete secret level " + secret_level, 
        points = 10,
        trigger = complete_level_trigger(level)
    )
}

achievement_complete_secret_level(1, 64) // sign on 30 or YYOX
achievement_complete_secret_level(2, 62) // sign on 41 or PYCX
achievement_complete_secret_level(3, 61) // sign on 45 or PPMX
achievement_complete_secret_level(4, 63) // sign on 60 or YPAX

achievement(
    title = "Under Construction",
    description = "Visit a level higher than 64",
    points = 4,
    trigger = is_in_level() && current_level() > 64
)

achievement(
    title = "Deja vu",
    description = "Select a level lower than the current level and play it",
    points = 2,
    trigger = is_in_level() && current_level() < max_level()
)

function points_1() => low4(0x0000B9)
function points_10() => low4(0x0000B8)
function points_100() => low4(0x0000B7)
function points_1k() => low4(0x0000B6)
function points_10k() => low4(0x0000B5)
function points_100k() => low4(0x0000B4)
function points_1m() => low4(0x0000B3)
function points_10m() => low4(0x0000B2)
function points() => points_1() + points_10() * 10 + points_100() * 100 +
                     points_1k() * 1000 + points_10k() * 10000 + points_100k() * 100000 +
                     points_1m() * 1000000 + points_10m() * 10000000

achievement(
    title = "20000 Points",
    description = "Have at least twenty thousand points",
    points = 3,
    trigger = is_in_level() && (points_10k() >= 2 || points_100k() > 0 || points_1m() > 0 || points_10m() > 0)
)

achievement(
    title = "50000 Points",
    description = "Have at least fifty thousand points",
    points = 10,
    trigger = is_in_level() && (points_10k() >= 5 || points_100k() > 0 || points_1m() > 0 || points_10m() > 0)
)

function is_actor_dead(index) {
    actor_status_address = 0x000510 + index * 0x20
    return bit2(actor_status_address) == 1 && bit1(actor_status_address) == 0 // 4 or 5 but not 6 or 7
}

function actor_killed_trigger(index, type) {
    actor_type = byte(0x000509 + index * 0x20)
    actor_present = byte(0x000500 + index * 0x20) != 0
    return actor_type == type && actor_present && is_actor_dead(index)
}

function achievement_actor_killed(type, label, achievement_title) {
    achievement(
        title = achievement_title,
        description = "Eliminate a " + label,
        points = 2,
        trigger = is_in_level() && (actor_killed_trigger(1, type) || 
                                    actor_killed_trigger(2, type) ||
                                    actor_killed_trigger(3, type) || 
                                    actor_killed_trigger(4, type) ||
                                    actor_killed_trigger(5, type) || 
                                    actor_killed_trigger(6, type) ||
                                    actor_killed_trigger(7, type))
    )
}

achievement_actor_killed(1, "Sylvester", "Sufferin' Succotash")
achievement_actor_killed(2, "Yosemite Sam", "Say Yer Prayers Varmint")
achievement_actor_killed(3, "Daffy Duck", "You're Deth-picable")
achievement_actor_killed(4, "Wile E Coyote", "Yikes")

function is_actor_moving_vertically(index) {
    return bit1(0x000500 + index * 0x20) == 1
}

achievement(
    title = "Diving for Carrots",
    description = "Complete any level by falling on the last carrot",
    points = 3,
    trigger = is_in_level() && is_level_complete() && is_actor_moving_vertically(0)
)

function is_actor_in_pipe(index) {
    actor_status = low4(0x000510 + index * 0x20)
    return actor_status == 6 || // going up
           actor_status == 7    // going down
}

function achievement_no_pipes_challenge(level, points) {
    achievement(
        title = "Level " + level + " Claustrophobia",
        description = "Complete level " + level + " without using pipes",
        points = points,
        trigger = complete_level_trigger(level) && 
                  once(is_in_menu()) &&           // start the achievement any time the user is at the menu screen
                  never(is_actor_in_pipe(0)) // stop the achievement any time they go in a pipe
    )
}

// returns true if actor is not dead, or not present
function is_actor_not_dead(index) {
    actor_status = low4(0x000510 + index * 0x20)
    return actor_status != 4 && actor_status != 5
}

function achievement_avoid_enemies_challenge(level, points) {
    achievement(
        title = "Level " + level + " Pacifist",
        description = "Complete level " + level + " without eliminating anyone",
        points = points,
        trigger = complete_level_trigger(level) && is_actor_not_dead(1) &&
                  is_actor_not_dead(2) && is_actor_not_dead(3) && is_actor_not_dead(4) &&
                  is_actor_not_dead(5) && is_actor_not_dead(6) && is_actor_not_dead(7)
    )
}

function achievement_kill_all_enemies_challenge(level, points, actor1, actor2, actor3, actor4, actor5) {
    achievement(
        title = "Level " + level + " Massacre",
        description = "Complete level " + level + " after eliminating everyone",
        points = points,
        trigger = complete_level_trigger(level) && is_actor_dead(actor1) && is_actor_dead(actor2) &&
                  is_actor_dead(actor3) && is_actor_dead(actor4) && is_actor_dead(actor5)
    )
}

achievement_no_pipes_challenge        ( 7, 10)                // ZW4S
achievement_avoid_enemies_challenge   ( 9, 10)                // WSRS
achievement_kill_all_enemies_challenge( 9, 10, 2, 3, 4, 6, 6) // WSRS
achievement_kill_all_enemies_challenge(13, 10, 1, 3, 4, 6, 6) // WWMS
achievement_avoid_enemies_challenge   (14, 10)                // WXCS
achievement_avoid_enemies_challenge   (23, 10)                // ZP4Z
achievement_avoid_enemies_challenge   (31, 10)                // XPAZ
achievement_kill_all_enemies_challenge(33, 10, 2, 3, 4, 6, 6) // 2SSW
achievement_avoid_enemies_challenge   (38, 10)                // 2XEW
achievement_avoid_enemies_challenge   (40, 10)                // TX9W
achievement_kill_all_enemies_challenge(42, 10, 2, 3, 4, 7, 7) // PZFW
achievement_avoid_enemies_challenge   (43, 10)                // YSJW
achievement_avoid_enemies_challenge   (46, 10)                // PXCW
achievement_kill_all_enemies_challenge(46, 10, 1, 2, 3, 4, 6) // PXCW
achievement_avoid_enemies_challenge   (47, 10)                // YWAW
achievement_avoid_enemies_challenge   (48, 10)                // YXOW
achievement_avoid_enemies_challenge   (49, 10)                // 22SX
achievement_avoid_enemies_challenge   (56, 10)                // TY9X
achievement_avoid_enemies_challenge   (57, 10)                // P2RX
achievement_avoid_enemies_challenge   (58, 10)                // PTFX
achievement_avoid_enemies_challenge   (60, 10)                // YTKX

leaderboard("High Score", "Most points at game over or victory",
    start  = byte(0x01FB) == 0x4a,   // game start sequence
    cancel = byte(0x01FB) == 0xB8,   // reset sequence
    submit = byte(0x01FB) != 0x96 && // in stage
             byte(0x01FB) != 0x69 && // paused
             byte(0x01FB) != 0xC1 && // death
             byte(0x01FB) != 0xC0 && // stage complete
             byte(0x01FB) != 0xEE && // transition to "that's all folks"
             byte(0x01FB) != 0xF9 && // transition to "that's all folks"
             byte(0x01FB) != 0xFE && // transition to "that's all folks"
             byte(0x01FB) != 0x55 && // continue
             byte(0x01FB) != 0x58 && // continue
             byte(0x01FB) != 0x5B && // transition to stage
             byte(0x01FB) != 0xB8 && // reset sequence
             byte(0x01FB) != 0xDF && // the end
             byte(0x01FB) != 0x4A,   // game start sequence
    value  = points()
)

leaderboard("High Score - One Life", "Most points in a single life",
    start  = byte(0x01FB) == 0x4a,   // game start sequence
    cancel = byte(0x01FB) == 0xB8,   // reset sequence
    submit = current_lives() < prev(current_lives()),
    value  = points()
)

leaderboard("High Score - Looper", "High score after looping. Submits on game over",
    start  = byte(0x01FB) == 0xE7,   // end transition
    cancel = byte(0x01FB) == 0xB8,   // reset sequence
    submit = byte(0x01FB) == 0x2F,   // game over
    value  = points()
)

PauseLookup = {
    0x69: "▌▌ ",
}

SecretStages = {
    61: "S3",
    62: "S2",
    63: "S4",
    64: "S1"
}

rich_presence_conditional_display(byte(0x0034) == 5, "Ending")
rich_presence_conditional_display(byte(0x0034) == 2 || byte(0x0034) == 3 || byte(0x0062) == 1, "Titles")

rich_presence_conditional_display(current_level() > 60 && current_level() <= 64, "{0}Stage {1}, {2} lives",
    rich_presence_lookup("Pause", byte(0x0001FB), PauseLookup, ""),
    rich_presence_lookup("SecretStages", current_level(), SecretStages),
    rich_presence_value("Lives", current_lives())
)

rich_presence_display("{0}Stage {1}, {2} lives",
    rich_presence_lookup("Pause", byte(0x0001FB), PauseLookup, ""),
    rich_presence_value("Stage", current_level()),
    rich_presence_value("Lives", current_lives())
)