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

function game_state() => high4(0x3C)
state_normal = 0       // atually bit5=0 (maze not shown) and bit6=0 (players can move)
state_playerkilled = 2 // atually bit5=1 (maze shown) and bit6=0 (players can move)
state_gameover = 4     // atually bit5=0 (maze not shown) and bit6=1 (players cannot move)
state_complete = 6     // exit map or both players dead - transitions to state_gameover
                       // atually bit5=1 (maze shown) and bit6=1 (players cannot move)

function game_mode(speed, mode, visibility) => byte(0x3D) == (speed - 1) * 64 + (mode - 1) * 4 + (visibility - 1)
function player_active() => bit4(0x6A) == 1 && bit6(0x6A) == 0
function players_can_move() => bit6(0x3C) == 0
function player_holding_start() => bit0(0x3C) == 1
function maze_start() => players_can_move() && !player_holding_start() && byte(0x6c) == 0
function maze_being_generated() => bit4(0x6A) == 0
function maze_complete() => game_state() == state_complete && player_active() && !player_holding_start()
function timer() => byte(0x61) // not really, but does decrement every frame, so we can use it that way

rich_presence_display("Maze {0}-{1}-{2}",
    rich_presence_value("Value", bit6(0x3D) + bit7(0x3D) * 2 + 1),
    rich_presence_value("Value", bit2(0x3D) + bit3(0x3D) * 2 + bit4(0x3D) * 4 + bit5(0x3D) * 8 + 1),
    rich_presence_value("Value", bit0(0x3D) + bit1(0x3D) * 2 + 1)    
)

function untimed_maze(id, title, speed, mode, visibility, points, annotation)
{
    achievement(title = title, points = points, id = id, type = "progression",
                description = "Complete a " + speed + "-" + mode + "-" + visibility + 
                              " maze (" + annotation + ")",
                trigger = game_mode(speed, mode, visibility) &&
                          maze_complete()
    )
}

function untimed_maze2(id, title, speed, mode, visibility, speed2, mode2, visibility2, points, annotation)
{
    achievement(title = title, points = points, id = id, type = "progression",
                description = "Complete a " + speed + "-" + mode + "-" + visibility + 
                              " or " + speed2 + "-" + mode2 + "-" + visibility2 +
                              " maze (" + annotation + ")",
                trigger = maze_complete() &&
                          (game_mode(speed, mode, visibility) || game_mode(speed2, mode2, visibility2))                          
    )
}

function timed_maze(id, title, speed, mode, visibility, time, points, annotation)
{
    maze_name = speed + "-" + mode + "-" + visibility

    achievement(title = title, points = points, id = id, type = "progression",
                description = "Complete a " + maze_name + " maze in under " + time + " seconds (" + annotation + ")",
                trigger = game_mode(speed, mode, visibility) &&
                          maze_complete() &&
                          unless(repeated(time * 60, timer() != prev(timer()))) &&
                          (always_false() || never(maze_being_generated()))
    )
    
    leaderboard(
        title = maze_name,
        description = "Complete a " + maze_name + " maze as fast as possible",
        start = game_mode(speed, mode, visibility) && maze_start(),
        submit = maze_complete(),
        cancel = !game_mode(speed, mode, visibility) || // changed maze
                 player_holding_start(),
        value = measured(repeated(99999, timer() != prev(timer()))) && // count frames (~27 minutes maximum)
                never(player_holding_start()),
        format = "FRAMES",
        lower_is_better = true
    )
}

// timed maze requirements were determined by playing each maze at least 20 times. throwing out the highest and lowest
// scores, averaging the remaining scores, subtracting 20% from that, and then rounding up to the nearest second.
// this gives a reasonable target given the randomness of the mazes, and still provides a challenge for most layouts.
// times were calculated using the default (A) difficulty setting. difficulty B makes the player move slightly faster,
// but for most mazes (especially the fast mazes), the additional speed is as much a detriment as a benefit as it makes
// it harder to turn at intersections.

// Complete a 1-1-4 maze in under 21 seconds (auto-peek, no robbers)       - Brownout Race (5)
// Complete a 1-6-4 maze in under 40 seconds (player-peek, no robbers)     - Blackout Race (5)
// Complete a 1-7-4 maze in under one minute (no-peek, no robbers, scouts) - Doppler Race (5)
// Complete a 1-16-4 maze in under two minutes (no-peek, no robbers)       - Blind Race (5)

timed_maze(154600, "Brownout Race", 1,  1, 4, 21, 3, "auto-peek, no robbers")
timed_maze(154606, "Blackout Race", 1,  6, 4, 22, 4, "player-peek, no robbers")
timed_maze(154607, "Doppler Race",  1,  7, 4, 40, 5, "scouts, no robbers")
timed_maze(154610, "Blind Race",    1, 16, 4, 50, 5, "no-peek, no robbers")

// Complete a 1-2-4 maze (player-peek, two robbers)                        - Two Robbers in a Blackout (5)
// Complete a 1-9-4 maze (no-peek, two robbers)                            - Two Robbers, No Peeking (10)
// Complete a 1-3-4 maze (player-peek, three robbers)                      - Three Robbers in a Blackout (5)
// Complete a 1-5-4 maze (no-peek, three robbers)                          - Three Robbers, No Peeking (10)
// Complete a 1-6-1 maze (full visibility, five robbers)                   - Five Robbers (10)

untimed_maze(154601, "Two Robbers in a Blackout",   1, 2, 4,  5, "player-peek, two robbers")
untimed_maze(154608, "Two Robbers, No Peeking",     1, 9, 4, 10, "no-peek, two robbers")
untimed_maze(154602, "Three Robbers in a Blackout", 1, 3, 4, 10, "player-peek, three robbers")
untimed_maze(154605, "Five Robbers",                1, 6, 1,  4, "full visibility, five robbers")

// Complete a 1-4-1 maze in under one minute (full visibility, capture)    - Capture (5)
// Complete a 1-4-4 maze in under two minutes (auto-peek, capture)         - Brownout Capture (5)
// Complete a 1-14-4 maze in under two minutes (player-peek, capture)      - Blackout Capture (5), third robber is not visible when not peeking

timed_maze(154603, "Capture",          1,  4, 1, 18, 2, "full visibility, capture")
timed_maze(154604, "Brownout Capture", 1,  4, 4, 32, 4, "auto-peek, capture")
timed_maze(154609, "Blackout Capture", 1, 14, 4, 40, 5, "player-peek, capture")

// Complete a 2-1-4 maze in under 30 seconds (auto-peek, no robbers)       - Fast Brownout Race (5)
// Complete a 2-6-4 maze in under 30 seconds (player-peek, no robbers)     - Fast Blackout Race (5)
// Complete a 2-7-4 maze in under 50 seconds (no-peek, no robbers, scouts) - Fast Doppler Race (5)
// Complete a 2-16-4 maze in under 90 seconds (no-peek, no robbers)        - Fast Blind Race (5)

timed_maze(154611, "Fast Brownout Race", 2,  1, 4,  18, 4, "auto-peek, no robbers")
timed_maze(154618, "Fast Blackout Race", 2,  6, 4,  16, 4, "player-peek, no robbers")
timed_maze(154619, "Fast Doppler Race",  2,  7, 4,  27, 3, "no-peek, no robbers, scouts")
timed_maze(154622, "Fast Blind Race",    2, 16, 4,  23, 5, "no-peek, no robbers")        

// Complete a 2-2-1 or 2-9-1 maze (full visibility, two robbers)           - Two Fast Robbers (5)
// Complete a 2-2-4 maze (player-peek, two robbers)                        - Two Fast Robbers in a Blackout (10)
// Complete a 2-9-4 maze (no-peek, two robbers)                            - Two Fast Robbers, No Peeking (10)
// Complete a 2-3-1 or 2-5-1 maze (full visibility, three robbers)         - Three Fast Robbers (5)
// Complete a 2-3-4 maze (player-peek, three robbers)                      - Three Fast Robbers in a Blackout (10)
// Complete a 2-5-4 maze (no-peek, three robbers)                          - Three Fast Robbers, No Peeking (25)
// Complete a 2-6-1 maze (full visibility, five robbers)                   - Five Fast Robbers (10)

untimed_maze2(154612, "Two Fast Robbers",              2, 2, 1, 2, 9, 1,  2, "full visibility, two robbers")
untimed_maze(154613, "Two Fast Robbers in a Blackout", 2, 2, 4,           5, "player-peek, two robbers")
untimed_maze(154620, "Two Fast Robbers, No Peeking",   2, 9, 4,          10, "no-peek, two robbers")
untimed_maze(154614, "Three Fast Robbers",             2, 3, 1,           3, "full visibility, three robbers")
//untimed_maze("Three Fast Robbers in a Blackout",     2, 3, 4,           5, "player-peek, three robbers")   // too hard; third not visible
untimed_maze(154617, "Five Fast Robbers",              2, 6, 1,           5, "full visibility, five robbers")

// Complete a 2-4-1 maze in under 45 seconds (full visibility, capture)    - Fast Capture (7)
// Complete a 2-4-4 maze in under 90 seconds (auto-peek, capture)          - Fast Brownout Capture (10)
// Complete a 2-14-4 maze in under 90 seconds (player-peek, capture)       - Fast Blackout Capture (10)

timed_maze(154615, "Fast Capture",          2,  4, 1,  13,  2, "full visibility, capture") // GOOD
timed_maze(154616, "Fast Brownout Capture", 2,  4, 4,  25,  5, "auto-peek, capture")       // GOOD
timed_maze(154621, "Fast Blackout Capture", 2, 14, 4,  22,  5, "player-peek, capture")     // GOOD
