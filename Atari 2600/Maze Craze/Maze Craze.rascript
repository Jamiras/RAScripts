// Maze Craze
// #ID=14367
// MD5: f825c538481f9a7a46d1e9bc06200aaf

// speed is displayed in the upper left corner (1=normal, 2=fast, 3=slow, 4=very slow)
// game mode number is displayed in the middle - see chart
// visibility is displayed in the upper right (1=full, 2=mostly visible, 3=barely visible, 4=no visibility)
// ----+---------+--------+--------------------+-------------------------------------------------
// game| robbers |  peek  | mode               | achievements
// ----+---------+--------+--------------------+-------------------------------------------------
//  1-4|   none  |  auto  | standard           | timed (blind), timed (blind+fast)
//  6-4|   none  | player | standard           | timed (blind), timed (blind+fast)
// 16-4|   none  |  none  | standard           | timed (blind), timed (blind+fast)
//  7-4|   none  |  none  | scouts             | timed (blind), timed (blind+fast)
// ----+---------+--------+--------------------+-------------------------------------------------
//  2-4|   two   | player | standard           | solve (blind), solve (blind+fast), timed (fast)
// 13-4|   two   | player | wounds             | ignore
//  9-4|   two   |  none  | standard           | solve (blind), solve (blind+fast)
//  3-4|  three  | player | standard           | solve (blind), solve (blind+fast), timed (fast)
//  5-4|  three  |  none  | wounds             | solve (blind), solve (blind+fast)
//  6-1|   five  |  none  | standard           | solve,         solve (fast),       timed (fast)
// ----+---------+--------+--------------------+-------------------------------------------------
//  4-4|  three  |  auto  | capture            | timed, timed (blind), timed (fast)
//  8-4|  three  | player | capture + blockade | ignore
// 12-4|  three  |  auto  | capture            | ignore - same as 4-X
// 14-4|  three  | player | capture            | timed (blind)
// ----+---------+--------+--------------------+-------------------------------------------------
// 10-4|   two   |  none  | terror             | ignore
// 11-4|  three  |  none  | terror + blockade  | ignore
// 15-4|  three  |  auto  | terror             | ignore
//  7-1|   five  |  none  | terror             | ignore
// ----+---------+--------+--------------------+-------------------------------------------------
// standard: be the first to escape
// capture: the robbers must be captured before you can escape
// wounds: robbers greatly delay the player instead of eliminating them (really only effective for 2P)
// terror: you cannot escape until your opponent is eliminated (really only effective for 2P)
// blockade: you can drop a false wall to confuse your opponent (really only effective for 2P)
// auto-peek: the hidden part of the map appears briefly every five seconds
// player-peek: the hidden part of the map appears briefly when the player pushes their button - six second cooldown

function game_mode(speed, mode, visibility) => byte(0x3D) == (speed - 1) * 64 + (mode - 1) * 4 + (visibility - 1)
function player_active() => bit6(0x3C) == 0
function maze_complete() => byte(0x6C) == 0xFF
function timer() => byte(0x61)

leaderboard(
    title = "In Game Timer",
    description = "For timed achievements",
    start = once(always_true()), // must be false at least one frame to start/restart
    submit = always_false(),
    cancel = always_false(),
    value = measured(repeated(99999, timer() != prev(timer()))) && // count frames
            unless(maze_complete()) &&                             // until maze completes
            never(!player_active())                                // reset between mazes
)

function untimed_maze(title, speed, mode, visibility, points, annotation)
{
    achievement(title = title, points = points, 
                description = "Complete a " + speed + "-" + mode + "-" + visibility + 
                              " maze (" + annotation + ")",
                trigger = game_mode(speed, mode, visibility) &&
                          maze_complete()
    )
}

function untimed_maze2(title, speed, mode, visibility, speed2, mode2, visibility2, points, annotation)
{
    achievement(title = title, points = points, 
                description = "Complete a " + speed + "-" + mode + "-" + visibility + 
                              " or " + speed2 + "-" + mode2 + "-" + visibility2 +
                              " maze (" + annotation + ")",
                trigger = maze_complete() &&
                          (game_mode(speed, mode, visibility) || game_mode(speed2, mode2, visibility2))                          
    )
}


function timed_maze(title, speed, mode, visibility, time, points, annotation)
{
    achievement(title = title, points = points, 
                description = "Complete a " + speed + "-" + mode + "-" + visibility + 
                              " maze in under " + time + " seconds (" + annotation + ")",
                trigger = game_mode(speed, mode, visibility) &&
                          maze_complete() &&
                          unless(repeated(time * 60, timer() != prev(timer()))) &&
                          (always_false() || never(!player_active()))
    )
}

// Complete a 1-1-4 maze in under 40 seconds (auto-peek, no robbers)       - Brownout Race (5)
// Complete a 1-6-4 maze in under 40 seconds (player-peek, no robbers)     - Blackout Race (5)
// Complete a 1-7-4 maze in under one minute (no-peek, no robbers, scouts) - Doppler Race (5)
// Complete a 1-16-4 maze in under two minutes (no-peek, no robbers)       - Blind Race (5)

timed_maze("Brownout Race", 1,  1, 4,  40, 5, "auto-peek, no robbers")
timed_maze("Blackout Race", 1,  6, 4,  40, 5, "player-peek, no robbers")
timed_maze("Doppler Race",  1,  7, 4,  60, 5, "no-peek, no robbers, scouts")
timed_maze("Blind Race",    1, 16, 4, 120, 5, "no-peek, no robbers")

// Complete a 1-2-4 maze (player-peek, two robbers)                        - Two Robbers in a Blackout (5)
// Complete a 1-9-4 maze (no-peek, two robbers)                            - Two Robbers, No Peeking (10)
// Complete a 1-3-4 maze (player-peek, three robbers)                      - Three Robbers in a Blackout (5)
// Complete a 1-5-4 maze (no-peek, three robbers)                          - Three Robbers, No Peeking (10)
// Complete a 1-6-1 maze (full visibility, five robbers)                   - Five Robbers (10)

untimed_maze("Two Robbers in a Blackout",   1, 2, 4,  5, "player-peek, two robbers")
untimed_maze("Two Robbers, No Peeking",     1, 9, 4, 10, "no-peek, two robbers")
untimed_maze("Three Robbers in a Blackout", 1, 3, 4,  5, "player-peek, three robbers")
untimed_maze("Three Robbers, No Peeking",   1, 5, 4, 10, "no-peek, three robbers")
untimed_maze("Five Robbers",                1, 6, 1, 10, "full visibility, five robbers")

// Complete a 1-4-1 maze in under one minute (full visibility, capture)    - Capture (5)
// Complete a 1-4-4 maze in under two minutes (auto-peek, capture)         - Brownout Capture (5)
// Complete a 1-14-4 maze in under two minutes (player-peek, capture)      - Blackout Capture (5)

timed_maze("Capture",          1,  4, 1,  60, 5, "full visibility, capture")
timed_maze("Brownout Capture", 1,  4, 4, 120, 5, "auto-peek, capture")
timed_maze("Blackout Capture", 1, 14, 4, 120, 5, "player-peek, capture")

// Complete a 2-1-4 maze in under 30 seconds (auto-peek, no robbers)       - Fast Brownout Race (5)
// Complete a 2-6-4 maze in under 30 seconds (player-peek, no robbers)     - Fast Blackout Race (5)
// Complete a 2-7-4 maze in under 50 seconds (no-peek, no robbers, scouts) - Fast Doppler Race (5)
// Complete a 2-16-4 maze in under 90 seconds (no-peek, no robbers)        - Fast Blind Race (5)

timed_maze("Fast Brownout Race", 2,  1, 4,  30, 5, "auto-peek, no robbers")
timed_maze("Fast Blackout Race", 2,  6, 4,  30, 5, "player-peek, no robbers")
timed_maze("Fast Doppler Race",  2,  7, 4,  50, 5, "no-peek, no robbers, scouts")
timed_maze("Fast Blind Race",    2, 16, 4,  90, 5, "no-peek, no robbers")

// Complete a 2-2-1 or 2-9-1 maze (full visibility, two robbers)           - Two Fast Robbers (5)
// Complete a 2-2-4 maze (player-peek, two robbers)                        - Two Fast Robbers in a Blackout (10)
// Complete a 2-9-4 maze (no-peek, two robbers)                            - Two Fast Robbers, No Peeking (10)
// Complete a 2-3-1 or 2-5-1 maze (full visibility, three robbers)         - Three Fast Robbers (5)
// Complete a 2-3-4 maze (player-peek, three robbers)                      - Three Fast Robbers in a Blackout (10)
// Complete a 2-5-4 maze (no-peek, three robbers)                          - Three Fast Robbers, No Peeking (25)
// Complete a 2-6-1 maze (full visibility, five robbers)                   - Five Fast Robbers (10)

untimed_maze2("Two Fast Robbers",                2, 2, 1, 2, 9, 1,  5, "full visibility, two robbers")
untimed_maze("Two Fast Robbers in a Blackout",   2, 2, 4,          10, "player-peek, two robbers")
untimed_maze("Two Fast Robbers, No Peeking",     2, 9, 4,          10, "no-peek, two robbers")
untimed_maze2("Three Fast Robbers",              2, 3, 1, 2, 5, 1,  5, "full visibility, three robbers")
untimed_maze("Three Fast Robbers in a Blackout", 2, 3, 4,           5, "player-peek, three robbers")
untimed_maze("Three Fast Robbers, No Peeking",   2, 5, 4,          25, "no-peek, three robbers")
untimed_maze("Five Fast Robbers",                2, 6, 1,          10, "full visibility, five robbers")

// Complete a 2-4-1 maze in under 45 seconds (full visibility, capture)    - Fast Capture (7)
// Complete a 2-4-4 maze in under 90 seconds (auto-peek, capture)          - Fast Brownout Capture (10)
// Complete a 2-14-4 maze in under 90 seconds (player-peek, capture)       - Fast Blackout Capture (10)

timed_maze("Fast Capture",          1,  4, 1,  45,  5, "full visibility, capture")
timed_maze("Fast Brownout Capture", 1,  4, 4,  90, 10, "auto-peek, capture")
timed_maze("Fast Blackout Capture", 1, 14, 4,  90, 10, "player-peek, capture")
