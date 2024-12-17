// Block Kuzushi
// #ID = 4064

// A = Advance (go to next level)
// B = Bomb (8 surrounding squares)
// C = Cross (destroy entire row and entire column - until encounter gap)
// I = Item
//     <D> = speed Down
//     <E> = Elongate (wider)
//     <L> = ? (pass through blocks)
//     <M> = Multi-ball (splits when hits paddle - up to 8)
//     <R> = Reduce (smaller)
//     <U> = speed Up
//     <1up>=extra life
// ? = Random item applied (see items)
// ! = Advance one line (endless mode)
// !!= Advance two lines (endless mode)

// Level skip: At the title screen, press U,L,D,R,A.
// You should hear an explosion to confirm it's enabled.
// Then, in game, press U+Select to skip a level, or D+Select to go back.
// You can also go frame by frame by pressing A while paused.

// $C151: Ball Y
function ball_y() => byte(0xC151)

// $C1C7: Paddle State
function paddle_state() => byte(0xC1C7)
paddle_state_normal = 0x05
paddle_state_loading = 0x0F
paddle_state_endless_gameover = 0x11

// $C19F: Paddle Size
function paddle_size() => byte(0xC19F)
paddle_size_reduced = 0
paddle_size_normal = 1
paddle_size_enlarged = 2

// $C2D5: Loading (1=Loading, 5=In level)
function stage_loading() => byte(0xC2D5) == 1

// $C300: FF=in play
function in_play() => byte(0xC300) == 0xFF

// $C301: FF=paused
function paused() => byte(0xC301) == 0xFF

// $C304: Game State
function game_state() => byte(0xC304)
game_state_in_game = 1
game_state_title_screen = 2
game_state_mode_select = 6

// $C510: mode
function mode() => byte(0xC510)
mode_normal = 0
mode_endless = 1
mode_battle = 2

// $C511: Stage
function current_stage() => byte(0xC511)

// $C514: Bricks remaining
function bricks_remaining() => byte(0xC514)

// $C519: [24-bit] frame counter (when not paused)
function frame_counter_when_not_paused() => tbyte(0xC519)

// $C520: [6 bytes] Score (display) [46=0]
function score() => measured((byte(0xC520) - 0x46) * 100000 +
                             (byte(0xC521) - 0x46) * 10000 +
                             (byte(0xC522) - 0x46) * 1000 +
                             (byte(0xC523) - 0x46) * 100 +
                             (byte(0xC524) - 0x46) * 10 +
                             (byte(0xC525) - 0x46),
                             when = byte(0xC520) != 0)
function score_100k() => byte(0xC520) - 0x46
function score_10k() => byte(0xC521) - 0x46
function score_1k() => byte(0xC522) - 0x46

// $C52D: B-level (endless mode)
function current_b_level() => byte(0xC52D)

// $C55C: Number of active balls
function active_balls() => byte(0xC55C)

// $C566: Speed
function current_speed() => byte(0xC566)

// $C5BE: Vertical velocity
function vertical_velocity() => word(0xC5BE)

// $C5D2: Lives
function lives() => byte(0xC5D2)

// $C5D6: FF=Ball stuck to paddle
function ball_stuck_to_paddle() => byte(0xC5D6) == 0xFF

// $CB75: FF=cheat enabled
function cheat_enabled() => byte(0xCB75) == 0xFF
cheat_lookup={ 0xFF: "." }

// $CFB7: Boss ID
function boss_id() => byte(0xCFB7)
boss_nulu = 0
boss_pierre = 1
boss_hudreau = 2
boss_unmeau = 3
boss_gunther = 4
boss_kokoyashii = 5
boss_thundercloud = 6
boss_kuwar = 7
boss_kuwar_head = 8

// $CFB9: Boss HP
function boss_hp() => byte(0xCFB9)

// $DF10: Sound effect
function sound_effect() => byte(0xDF10)
sound_effect_hit_paddle = 0x1a
sound_effect_hit_wall = 0x1b
sound_effect_hit_brick = 0x1c
sound_effect_boss_defeated = 0x1d
sound_effect_collect_D = 0x1e
sound_effect_collect_E = 0x1f

function in_game() => ball_y() != 0 && !cheat_enabled()
function complete_stage(stage) => in_game() && 
                                  mode() == mode_normal &&
                                  current_stage() == stage + 1 &&
                                  prev(current_stage()) == stage
function defeat_boss(stage) => in_game() && 
                               mode() == mode_normal &&
                               current_stage() == stage &&
                               boss_hp() == 0 &&
                               sound_effect() == sound_effect_boss_defeated 
function complete_any_stage() => in_game() &&
                                 mode() == mode_normal &&
                                 current_stage() > prev(current_stage())
function timer(seconds) => repeated(seconds * 60, byte(0xC519) != prev(byte(0xC519)))
function single_level_challenge() => in_game() &&
                                     never(game_state() != game_state_in_game) &&
                                     never(stage_loading())

rich_presence_conditional_display(frame_counter_when_not_paused() == 0, "Titles")
rich_presence_conditional_display(mode() == mode_endless, "Endless mode B{0} |{1} {2} lives | {3}",
    rich_presence_value("Stage", current_b_level()),
    rich_presence_lookup("Cheat", byte(0xCB75), cheat_lookup),
    rich_presence_value("Lives", lives()),
    rich_presence_value("Score", score(), format="SCORE")
)
rich_presence_conditional_display(mode() == mode_battle, "Battle mode")
rich_presence_display("Stage {0} |{3} {1} lives | {2}",
    rich_presence_value("Stage", current_stage()),
    rich_presence_value("Lives", lives()),
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_lookup("Cheat", byte(0xCB75), cheat_lookup)
)

// Complete boss levels (x8)
achievement("Nulu", "Complete stage 6", 5, defeat_boss(6), type="progression") // 8 HP
achievement("Pierre", "Complete stage 12", 5, defeat_boss(12), type="progression") // 12 HP
achievement("Hudreau", "Complete stage 18", 5, defeat_boss(18), type="progression") // 15 HP
achievement("Unmeau", "Complete stage 24", 5, defeat_boss(24), type="progression") // 17 HP
achievement("Gunther", "Complete stage 30", 5, defeat_boss(30), type="progression") // 20 HP
achievement("Kokoyashii", "Complete stage 36", 5, defeat_boss(36), type="progression") // 22 HP
achievement("Thundercloud", "Complete stage 42", 5, defeat_boss(42), type="progression") // 25 HP
achievement("Kuwar", "Complete stage 48", 10, type="win_condition", // 30 + 20 HP
    trigger = defeat_boss(48) &&
              boss_id() == boss_kuwar_head // boss defeated sound effect triggers after first phase
)

achievement("An Unstoppable Force", 
            "Keep the ball moving for 20 seconds without hitting any breakable bricks (non-boss stage)", 3,
    trigger = single_level_challenge() &&
              timer(20) && 
              // NOTE: hitting unbreakable bricks makes the same sound as hitting outside walls
              never(sound_effect() == sound_effect_hit_brick) &&
              never(current_speed() == 0) &&
              never(boss_hp() > 0)
)

// maximum speed is actually higher - at least 0x3a - at 0x30, things are pretty hectic
achievement("It's a Blur", "Reach the maximum ball speed", 2,
    trigger = in_game() &&
              current_speed() >= 0x30
)

achievement("Hot Potato", "Bounce the ball off the paddle five times at maximum ball speed (no multiball)", 5,
    trigger = single_level_challenge() &&
              never(active_balls() != 1) &&
              measured(repeated(5, current_speed() >= 0x30 &&
                                sound_effect() == sound_effect_hit_paddle && 
                                prev(sound_effect()) != sound_effect_hit_paddle))
)

achievement("Send in the Clones", "Have eight balls on the screen at once", 5,
    trigger = in_game() && 
              active_balls() == 8
)

achievement("Juggler", "Have two or more balls on the screen for at least 30 seconds", 5,
    trigger = single_level_challenge() &&
              never(active_balls() < 2) &&
              timer(10) &&             // don't show challenge indicator before 10 seconds
              trigger_when(timer(30))
)

achievement("Size Doesn't Matter", "Bounce the ball off a reduced paddle five times (no multiball)", 5,
    trigger = single_level_challenge() &&
              never(paddle_size() != paddle_size_reduced) &&
              never(active_balls() != 1) &&
              measured(repeated(5, sound_effect() == sound_effect_hit_paddle && 
                                prev(sound_effect()) != sound_effect_hit_paddle))
)

achievement("Reserves", "Have at least five lives", 5,
    trigger = in_game() &&
              lives() >= 5 &&
              prev(lives()) < 5
)

achievement("Clean Sweep", "Complete a normal mode stage without dying and without using the A powerup", 5,
    trigger = complete_any_stage() &&
              once(stage_loading()) &&
              never(boss_hp() > 0) &&
              never(lives() < prev(lives())) &&
              once(bricks_remaining() == 1) // 'A' powerup completes the level with bricks remaining
)

achievement("Coming Through", "Destroy 50 blocks with the L powerup", 5,
    trigger = in_game() &&
              measured(repeated(50, bit0(0xC55D) == 1 && bricks_remaining() < prev(bricks_remaining())))
)

// this assumes the player cannot earn more than 5000 points at a time.
// 24990 (largest value below 25000) + 5000 = 29990 (still with a 2 in the 10k position)
achievement("25k", "Have 25000 points (normal mode)", 5,
    trigger = in_game() && mode() == mode_normal &&
              score_10k() == 2 && 
              score_1k() >= 5 && prev(score_1k()) < 5
)

achievement("50k", "Have 50000 points (normal mode)", 10,
    trigger = in_game() && mode() == mode_normal &&
              score_10k() >= 5 && prev(score_10k()) < 5
)

achievement("100k", "Have 100000 points (normal mode)", 10,
    trigger = in_game() && mode() == mode_normal &&
              score_100k() >= 1 && prev(score_100k()) == 0
)

achievement("Endless 20k", "Have 20000 points (endless mode)", 5,
    trigger = in_game() && mode() == mode_endless &&
              score_10k() >= 2 && prev(score_10k()) < 2
)

achievement("Endless 40k", "Have 40000 points (endless mode)", 10,
    trigger = in_game() && mode() == mode_endless &&
              score_10k() >= 4 && prev(score_10k()) < 4
)

leaderboard("Endless High Score", "Highest score in endless mode",
    start = mode() == mode_endless && !cheat_enabled() && paddle_state() == paddle_state_endless_gameover,
    submit = always_true(),
    cancel = always_false(),
    value = score()
)

// leaderboard - fastest game completion
