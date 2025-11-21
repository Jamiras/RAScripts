// Fire Rescue
// #ID = 34326

// Per https://www.msx.org/forum/msx-talk/emulation/troubles-getting-fire-rescue-hudson-soft-1984-to-work-properly?page=1
// Patch byte $0876 of the ROM from 09 to 08 and you can keep going past stage 8, but there's no clear end.

// NOTE: blueMSX does not expose memory correctly in MSX2 mode. Addresses are offset by -C000.
//       To address this, we look at address $FC48, which should be 0x8000. If it's 0xFFFF, we're
//       in the bad state and have to apply the offset. Luckily, we can do that with a simple
//       multiplication against the least significant bit of $FC48. Because the "auto" setting
//       loads the game in msx2 mode, all of the code notes are associated to the msx2 addresses.
function is_real_mode() => ~bit0(0xFC48)
function msx_address(msx2_address) => is_real_mode() * 0xC000 + msx2_address

// $2610: [8-bit] 1=dying
function is_dying() => byte(msx_address(0x2610))

// $2628: [8-bit] Player X
function player_x() => byte(msx_address(0x2628))

// $2629: [8-bit] Player Y
function player_y() => byte(msx_address(0x2629))

// $262C: [8-bit] 1=leading a mouse
function is_leading_a_mouse() => byte(msx_address(0x262C))

// $262E: [8-bit] 1=has spray
function has_spray() => byte(msx_address(0x262E))

// $27A8: [8-bit] Current stage
function current_stage() => byte(msx_address(0x27A8))

// $27AA: [8-bit] 1=jumping
function is_jumping() => byte(msx_address(0x27AA)) == 1

// $27AD: [16-bit] Score (x10)
function score_normalized() => word(msx_address(0x27AD))
function score() => score_normalized() * 10

// $27B1: [8-bit] Remaining lives
function remaining_lives() => byte(msx_address(0x27B1))
function in_game() => remaining_lives() != 0xFF

// $27B2: [8-bit] 1=exit ladder visible
function is_exit_ladder_visible() => byte(msx_address(0x27B2))

function mouse_state(index) => byte(msx_address(0x262F + index * 8))
function mouse_y(index) => byte(msx_address(0x2631 + index * 8))

function remaining_mice() => sum_of(range(0, 4), i => mouse_state(i) / mouse_state(i))

rich_presence_conditional_display(!in_game(), "Titles")
rich_presence_conditional_display(mouse_y(0) == 0, "Titles") // reset doesn't clear lives, but does clear mouse y

rich_presence_display("Stage {0} | {1} | {2} lives | {3}/5 mice rescued",
    rich_presence_value("Stage", current_stage()),
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_value("Lives", remaining_lives()),
    rich_presence_value("Mice", 5 - remaining_mice())
)

function stage_achievement(stage, points, type="progression")
{
    achievement("Stage " + stage, "Complete stage " + stage, points, type=type,
        trigger = in_game() && current_stage() == stage + 1 && prev(current_stage()) == stage
    )
}

stage_achievement(1, 2)
stage_achievement(2, 3)
stage_achievement(3, 5)
stage_achievement(4, 5)
stage_achievement(5, 5)
stage_achievement(6, 10)
stage_achievement(7, 10)
stage_achievement(8, 25, type="win_condition")

function stage_screen_showing() => byte(msx_address(0x279E)) != 0x0F
function start_level() => once(stage_screen_showing())
//function complete_level() => player_y() == 0x16 && player_x() == 0x1D
function complete_level() => current_stage() > prev(current_stage())

function never_below_mouse(index) => always_false() && never(mouse_state(index) == 1 && player_y() > mouse_y(index))
achievement("Going Down", "Complete a stage without ever going lower than an unrescued mouse (any stage except 0)", 5,
    trigger = in_game() &&
              !stage_screen_showing() &&
              once(start_level()) &&
              (trigger_when(complete_level()) ||
                  never_below_mouse(0) ||
                  never_below_mouse(1) ||
                  never_below_mouse(2) ||
                  never_below_mouse(3) ||
                  never_below_mouse(4)
              )
)

achievement("Bottoms Up!", "Rescue the mice in order from lowest to highest (any stage except 0)", 5,
    trigger = in_game() && 
              current_stage() != 0 &&
              trigger_when(once(mouse_state(0) < prev(mouse_state(0)) &&
                  once(mouse_state(1) < prev(mouse_state(1)) &&
                      once(mouse_state(2) < prev(mouse_state(2)) &&
                          once(mouse_state(3) < prev(mouse_state(3)) &&
                              once(mouse_state(4) < prev(mouse_state(4)))
                          )
                      )
                  )
              )) &&
              disable_when(is_dying() == 1, until=stage_screen_showing()) &&
              never(mouse_state(4) == 1)
)

achievement("Navigating the Flames", "Complete a stage without jumping (any stage except 0)", 5,
    trigger = in_game() && 
              once(start_level()) &&
              current_stage() != 0 &&
              !stage_screen_showing() &&
              never(is_jumping()) &&
              trigger_when(complete_level())
)
