// Hard Hat Mack
// #ID = 14322
// MD5: aba173f5138eb06495c484aa0fca25b2 (woz)
// MD5: 2fb9e6d698d5ca4c6c28ec4fd72acc5c ([cr Mr. Krac-Man].do)

// NOTE: the game has a psuedo-level select.
// You can press any of the numeric keys on the main screen to change the layout to the specified level.
// It does not actually warp you to the level (i.e. pressing 4 will give you the same screen as level 4, but only one enemy)
// As such, the level-specific achievements also have to validate the layout.

function current_screen() => byte(0x6a6e)
screen_lv1=2
screen_lv2=3
screen_lv3=1

screen_map = {
    1: screen_lv1,
    2: screen_lv2,
    3: screen_lv3,
    4: screen_lv1,
    5: screen_lv2,
    6: screen_lv3
}

function in_game() => byte(0x082c) == 0
function demo_screen() => byte(0x7210)
demo_screen_title = 1
demo_screen_lv1 = 2
demo_screen_lv2 = 3
demo_screen_lv3 = 0

demo_screens = {
    demo_screen_title: "Title",
    demo_screen_lv1: "Level 1 (Demo)",
    demo_screen_lv2: "Level 2 (Demo)",
    demo_screen_lv3: "Level 3 (Demo)",
}

function remaining_lives() => byte(0x4edf)
function game_over() => remaining_lives() == 0xff
function current_level() => byte(0x7000)
function current_level_10() => byte(0x7001)

function score_1() => byte(0x1d60)
function score_10() => byte(0x1d61)
function score_100() => byte(0x1d62)
function score_1000() => byte(0x1d63)
function score_10000() => byte(0x1d64)
function score() => score_10000() * 10000 + score_1000() * 1000 + score_100() * 100 + score_10() * 10 + score_1()

rich_presence_conditional_display(!in_game(), "{0}",
    rich_presence_lookup("Screen", demo_screen(), demo_screens)
)

rich_presence_display("Level {0}, {1} Points, {2} Lives remaining",
    rich_presence_value("Level", current_level() + current_level_10() * 10),
    rich_presence_value("Points", score(), format="SCORE"),
    rich_presence_value("Level", remaining_lives())
)

// =========================================================================

function mack_x() => byte(0x0812)
function mack_y() => byte(0x0811)
function mack_direction() => byte(0x0819)
direction_up = 0
direction_right = 1
direction_down = 2
direction_left = 3
function mack_can_move() => byte(0x6377) == 1

function screen_transitioning() => byte(0x0ba5) != 0x40
function last_key_pressed() => byte(0x081C)
function starting_level() => word(0x086E)
starting_level1 = 0x0921
starting_level2 = 0x09B7
starting_level3 = 0x0870

leaderboard("Hi Score", "Highest score at game over",
    start = in_game() && mack_x() != 0 && !screen_transitioning(),
    submit = game_over(),
    cancel = !in_game(),
    value = score()
)

leaderboard("Rushed Riveting", "Fastest time to complete the riveting stage",
    start = in_game() && current_screen() == screen_lv1 && mack_x() != 0 && !screen_transitioning() &&
            starting_level() == starting_level1, // prevent starting if die on level 1 and start on some other level
    submit = current_level() > prev(current_level()),
    cancel = !in_game() || remaining_lives() == 0xFF,
    value = measured(repeated(0, in_game())),
    format = "FRAMES",
    lower_is_better = true
)

// =========================================================================

function trigger_complete_any_level() => in_game() && current_level() != prev(current_level())
function trigger_complete_level(level) => in_game() && current_screen() == screen_map[level] &&
                                          prev(current_level()) == level && current_level() == level + 1

achievement("Level 1", "Complete Level 1", 5, trigger_complete_level(1))
achievement("Level 2", "Complete Level 2", 5, trigger_complete_level(2))
achievement("Level 3", "Complete Level 3", 10, trigger_complete_level(3))
achievement("Level 4", "Complete Level 4", 10, trigger_complete_level(4))
achievement("Level 5", "Complete Level 5", 10, trigger_complete_level(5))
achievement("Level 6", "Complete Level 6", 25, trigger_complete_level(6))

function trigger_screen_challenge(screen)
{
    return in_game() && once(!in_game() || current_screen() != screen) && 
           current_screen() == screen &&
           trigger_when(current_level() > prev(current_level()))
}

function trigger_without_dying() => never(remaining_lives() < prev(remaining_lives()))
function trigger_complete_screen_without_dying(screen) => trigger_screen_challenge(screen) &&
                                                          trigger_without_dying()

achievement("Accident Free Riveting", "Complete the riveting stage without dying", 
            5, trigger_complete_screen_without_dying(screen_lv1), id=310879)
achievement("Accident Free Lunch Break", "Complete the lunchbox stage without dying",
            10, trigger_complete_screen_without_dying(screen_lv2), id=310880)
achievement("Accident Free Recycling", "Complete the recycling stage without dying",
            10, trigger_complete_screen_without_dying(screen_lv3), id=310881)

// My best time was 36 seconds
achievement("Ahead of Schedule", "Complete the riveting stage in under 50 seconds", 5,
    trigger_screen_challenge(screen_lv1) &&
    disable_when(repeated(50 * 60, once(!screen_transitioning()) && mack_x() != 0), until = !in_game())
)

// 0x0815 alternates between a4 and a6 when climbing up a rope.
// 0x0815 is a4 when going up a rope
// 0x0815 alternates between a4, 9c and 96 if killed by monster in level.
// 0x0815 is a4 when going down to the trampoline and up from it.
function climbing_chains() => byte(0x0815) == 0xa4 && mack_can_move() &&
                              (mack_direction() == direction_up || mack_direction() == direction_down)

// it looks like mack is climbing a rope when he's using the trampoline, so ignore when x is greater than 0xe4
achievement("The Chains Were Rusty", "Complete the riveting stage without using the chains", 5,
    trigger_screen_challenge(screen_lv1) && 
    never(climbing_chains() && unless(mack_x() >= 0xe4)) &&
    never(game_over())
)

function jumping() => byte(0x0818) == 1

achievement("Heavy Work Boots", "Complete the riveting stage without jumping", 5,
    trigger_screen_challenge(screen_lv1) && never(jumping()) && never(game_over())
)

achievement("Work Smarter, Not Harder",
    "Complete the riveting stage by placing all the girders before riveting any of them" +
    " (and without dying while riveting)", 5,
    in_game() && never(current_screen() != screen_lv1) &&    // on level 1
    trigger_when(current_level() > prev(current_level())) && // advance to level 2
    once(dword(0x58fd) == 0x00000000) &&              // no girders placed 
    once(dword(0x58fd) == 0x01010101) &&              // all girders are placed but not riveted
    trigger_without_dying()                           // reset on death    
)

function tool_on_screen() => byte(0x6A6D) == 0

achievement("Tools of the Trade", "Grab the tool on the lunchbox stage and make it back to" +
                                  " the left of the smasher without dying", 10,
    in_game() &&
    never(current_screen() != screen_lv2) &&
    once(tool_on_screen()) &&
    !tool_on_screen() &&
    trigger_when(mack_y() < 0x90 && mack_x() < 0xC8) &&
    trigger_without_dying()
)

achievement("Middle Management", "Complete the recycling stage without using the lower chains", 10,
    trigger_screen_challenge(screen_lv3) && never(climbing_chains() && mack_y() > 100) && never(game_over())
)

achievement("Handyman", "Score 5000 points", 5, in_game() && score_1000() == 5)
achievement("Engineer", "Score 10000 points", 10, in_game() && score_10000() == 1)
achievement("Foreman", "Score 15000 points", 25, in_game() && score_10000() == 1 && score_1000() == 5)

