// The Stone of Wisdom
// (賢者の石 / Kenja no Ishi)
// #ID = 33195
// MD5: c5b05f12e6c3bfe8f8391e949508eff7

// TODO: translation patch: 
// - https://www.msx.org/downloads/the-stone-of-wisdom-translation-0
// - https://download.file-hunter.com/Games/Translated%20(English)/

// http://eggerland.msxblue.com/stonewisdom-map.png
// - old map: http://msxsolutions.msxblue.com/maps/swisdom.png

// https://en.namu.wiki/w/%ED%98%84%EC%9E%90%EC%9D%98%20%EB%8F%8C(%EA%B2%8C%EC%9E%84)
// https://uniskie.hatenablog.com/?page=1537501158

// passwords: (specific names). Press [caps+right alt] to enter KANA mode (not possible in core), then:
// - Red Level   - [:]+[Y]+[D] -> 10 Pearls, 2xIntel, 2xPower, 2xLife
// - Blue Level  - [U]+[E]+[S] -> 20 Pearls, 4xIntel, 4xPower, 4xLife
// - Green Level - [Q]+[E]+[D] -> 30 Pearls, 6xIntel, 6xPower, 6xLife
// - White Level - [6]+[6]+[E] -> 40 Pearls, 8xIntel, 8xPower, 8xLife
// * passwords are given on death/completing the game and can be entered on the Trig/Space screen


// https://web.archive.org/web/20031114210751/http://www.marsupone.com/marsupone/msxvalley/stone/stone.htm
// * on the CASIO start screen, press CTRL, "Y" and SELECT simultaneously, then the space bar
//   - SELECT should be mapped to the PGUP key.
// * STOP (mapped to END) to pause.
// * F1 to self destruct and restart on level 1


// Attack the pyramids (look like nested squares from above) to reveal crystals
// * Black - increase Intel
// * Red - increase Power
// * Blue - increase Life
// * Yellow - purchasing power
// Similarly colored sand pits drain the corresponding attribute (black=Intel, red=Power, blue=Life)

// Arrows to move, Space or X to attack, Z or GRAPH (left alt) to buy

// NOTE: blueMSX does not expose memory correctly in MSX2 mode. Addresses are offset by -C000.
//       To address this, we look at address $FC48, which should be 0x8000. If it's 0xFFFF, we're
//       in the bad state and have to apply the offset. Luckily, we can do that with a simple
//       multiplication against the least significant bit of $FC48. Because the "auto" setting
//       loads the game in msx2 mode, all of the code notes are associated to the msx2 addresses.
function is_real_mode() => ~bit0(0xFC48)
function msx_address(msx2_address) => is_real_mode() * 0xC000 + msx2_address

function is_invincible() => byte(msx_address(0x2023)) != 0
function is_cheating() => byte(msx_address(0x2023))
function in_game() => byte(msx_address(0x2000)) == 1
function in_game_and_not_cheating() => in_game() && !is_invincible()
function commit_suicide() => byte(msx_address(0x21b3)) == 1

function current_room() => byte(msx_address(0x203e))
room_start = 0x00
room_first_tablet = 0x10
room_end = 0x39

function tablet(index) => byte(msx_address(0x2058 + index))
function power_count(index) => byte(msx_address(0x2354 + index))
power_black_protection = 0
power_red_protection = 1
power_blue_protection = 2
power_intel_resist = 3
power_power_resist = 4
power_life_resist = 5
power_offense = 6
power_defense = 7
power_enemy_crits = 8
power_secrets_crits = 9

function loop_counter() => byte(msx_address(0x2009))
function current_intel() => byte(msx_address(0x2040)) // higher intelligence finds hidden paths without attacking
function current_power() => byte(msx_address(0x2042)) // does more damage to walls
function current_life() => byte(msx_address(0x2044))
function current_score() => byte(msx_address(0x2001)) * 1000000 +
                            byte(msx_address(0x2002)) * 100000 +
                            byte(msx_address(0x2003)) * 10000 +
                            byte(msx_address(0x2004)) * 1000 +
                            byte(msx_address(0x2005)) * 100 +
                            byte(msx_address(0x2006)) * 10
function current_tablets() => byte(msx_address(0x2058)) + 
                              byte(msx_address(0x2059)) +
                              byte(msx_address(0x205a)) +
                              byte(msx_address(0x205b))
function player_y() => byte(msx_address(0x2320))

// ------------------------------------

plural_suffix = {
    1: "",
}

cheating_suffix = {
    1: ".",
}

rich_presence_conditional_display(in_game() && loop_counter() == 0, "{0} | {1} tablet{2}{3}",
    rich_presence_value("Score", current_score(), format="SCORE"),
    rich_presence_value("Tablets", current_tablets()),
    rich_presence_lookup("Plurality", current_tablets(), plural_suffix, fallback="s"),
    rich_presence_lookup("Cheating", is_cheating(), cheating_suffix)
)

rich_presence_conditional_display(in_game() && loop_counter() == 1 && current_room() == room_end,
                                  "{0} | 4 tablets{1}",
    rich_presence_value("Score", current_score(), format="SCORE"),
    rich_presence_lookup("Cheating", is_cheating(), cheating_suffix)
)

rich_presence_conditional_display(in_game(), "{0} | {1} tablet{2}{3} | 2nd loop",
    rich_presence_value("Score", current_score(), format="SCORE"),
    rich_presence_value("Tablets", current_tablets()),
    rich_presence_lookup("Plurality", current_tablets(), plural_suffix, fallback="s"),
    rich_presence_lookup("Cheating", is_cheating(), cheating_suffix)
)

function in_demo() => byte(msx_address(0x21c3)) == 1
rich_presence_conditional_display(in_demo(), "Watching the demo")

rich_presence_display("Titles")

// ------------------------------------

achievement("Tablet I", "Collect the first tablet", 5, type="progression",
    trigger = in_game_and_not_cheating() && tablet(0) == 1 && prev(tablet(0)) == 0
)

achievement("Tablet II", "Collect the second tablet", 5, type="progression",
    trigger = in_game_and_not_cheating() && tablet(1) == 1 && prev(tablet(1)) == 0
)

achievement("Tablet III", "Collect the third tablet", 5, type="progression",
    trigger = in_game_and_not_cheating() && tablet(2) == 1 && prev(tablet(2)) == 0
)

achievement("Tablet IV", "Collect the fourth tablet", 5, type="progression",
    trigger = in_game_and_not_cheating() && tablet(3) == 1 && prev(tablet(3)) == 0
)

// >> I will give a give to the brave young man who has come so far. <The ooi>
//    The true doctor is still far away. I will teleport you back to the 
//    entrance if you wish to continue.
achievement("The Gift", "Deliver the tablets", 5, type="win_condition",
    trigger = in_game_and_not_cheating() && loop_counter() > prev(loop_counter())
)

// >> What a true scholar!
achievement("The Scholar", "Complete the second loop", 10,
    trigger = in_game_and_not_cheating() && loop_counter() > prev(loop_counter()) && loop_counter() == 2
)

// ---- Stage I (red) ----

// Make sure to destory pyramids as they contain power-ups. Killing skeletons will raise your life bar.

// In the fifth room (four skeletons, two pyramids, and stairs in the lower right corner), there's
// a hidden passage to the right of the two pyramids, but you need at least 6 power to open it
// (two more than you start with). You'll most likely need to do this on the second loop.

achievement("Treasure Room I", "Find the room in the first stage with the 4 pearls and the box", 3,
    trigger = in_game_and_not_cheating() && current_room() == 0x05
)

// In the room with the four sparks an no clear exits, kill the sparks and find the hidden door on
// the lower left side of the room. In the next room, open the four boxes, but don't collect the
// treasures. Then find the hidden door on the upper left side of the room.
achievement("Treasure Room II", "Find the room in the first stage with the 15 pearls", 5,
    trigger = in_game_and_not_cheating() && current_room() == 0x0D
)

// ---- Stage II (blue) ----
// Immediately after collecting the tablet, you can go through the two secret passages again and take
// the stairs back to the main part of stage I. This seems like a glitch, so I didn't make an
// achievement for it.

// In the room with the two sparks and the blob, break all five boxes (without collecting the contents)
// to open a tunnel to the right. Be careful getting the middle box as its surrounded by blue sand.
achievement("Treasure Room III", "Find the room in the second stage with the 3 pearls and 5 boxes", 3,
    trigger = in_game_and_not_cheating() && current_room() == 0x16
)

// In the room with the two sparks and the blob, break all five boxes (without collecting the contents)
// to open a tunnel to the right. Be careful getting the middle box as its surrounded by blue sand.
achievement("Treasure Room IV", "Find the room in the second stage with the 9 pearls", 3,
    trigger = in_game_and_not_cheating() && current_room() == 0x1a
)

// ---- Stage III (green) ----

function total_powers() => sum_of(range(0,10), p => power_count(p))

achievement("The First Page", "Purchase a powerup", 2,
    trigger = in_game_and_not_cheating() && total_powers() > prev(total_powers())
)

achievement("Another Couple Pages", "Have three powerups", 4,
    trigger = in_game_and_not_cheating() && total_powers() == 3
)

achievement("A Decent Collection", "Have six powerups", 5,
    trigger = in_game_and_not_cheating() && total_powers() == 6
)

achievement("A Full Book", "Have nine powerups", 5,
    trigger = in_game_and_not_cheating() && total_powers() == 9
)

/*
function power_achievement(title, description, points, power)
{
    achievement(title, description, points,
        trigger = in_game() && power_count(power) > prev(power_count(power))
    )
}

power_achievement("Black Protection", "Purchse the protection against black pits power", 2,
                  power_black_protection)
power_achievement("Red Protection", "Purchse the protection against black pits power", 2,
                  power_red_protection)
power_achievement("Blue Protection", "Purchse the protection against black pits power", 2,
                  power_blue_protection)
power_achievement("Strengthened Intelligence", "Purchse the resist intelligence drain power", 2,
                  power_intel_resist)
power_achievement("Strengthened Power", "Purchse the resist power drain power", 2,
                  power_power_resist)
power_achievement("Black Protection", "Purchse the resist life drain power", 2,
                  power_life_resist)
power_achievement("The Best Offense", "Purchse the improved offsence power", 3,
                  power_offense)
power_achievement("Is a Good Defense", "Purchse the improved defense power", 3,
                  power_defense)
power_achievement("Wallbreaker", "Purchse the improved wall breaking power", 3,
                  power_secrets_crits)
power_achievement("Enemies Beware", "Purchse the enemy crits power", 4,
                  power_enemy_crits)
*/

// stats achievements (two blocks of each, four, six?)

achievement("Studious", "Have two full bars of Intelligence", 5,
    trigger = in_game_and_not_cheating() && current_intel() >= 0x10
)

//achievement("Scholarly", "Have four full bars of Intelligence", 5,
//    trigger = in_game() && current_intel() >= 0x20
//)

achievement("Athletic", "Have two full bars of Power", 5,
    trigger = in_game_and_not_cheating() && current_power() >= 0x10
)

//achievement("Muscular", "Have four full bars of Power", 5,
//    trigger = in_game() && current_power() >= 0x20
//)

achievement("Healthy", "Have two full bars of Life", 5,
    trigger = in_game_and_not_cheating() && current_life() >= 0x10
)

//achievement("Vigorous", "Have four full bars of Life", 5,
//    trigger = in_game() && current_life() >= 0x20
//)

// impractical - cannot open secret passage to tablet without clearing the room
//achievement("Stealthy Spelunking", "Reach the first tablet without attacking anything", 5,
//    trigger = in_game() && 
//              once(current_room() == room_start && loop_counter() == 0) &&
//              trigger_when(current_room() == room_first_tablet) &&
//              never(any_of(range(0, 5), i => byte(0x238c + i * 0x10) == 1))
//)

// ------------------------------------

leaderboard("Fastest First Loop", "Fastest time completing the first loop",
    start = in_game_and_not_cheating() && current_room() == room_start && loop_counter() == 0,
    submit = current_room() == room_end,
    cancel = !in_game() || current_life() == 0 || commit_suicide(),
    value = repeated(0, always_true() && never(!in_game())),
    format = "FRAMES",
    lower_is_better = true,
)


// * Stage 1:
// - Get 15 pearls from hidden room
// - Tablet: ~3:15
// * Stage 2:
// - Go straight for tablet: ~5:30
// - Go east three times to shop (avoid stairs)
//   Power 1: [9] Triangle with Dashes (sword does more damage)
//   Power 2: [13] Wavy line between Bars (more damage to secret passages) [required for wall on stage 3]
//   Power 3: [5] Square Wave with Dots (lose health more slowly)
// - Go back and up the stairs: ~6:00
// * Stage 3:
// - Shop in middle of level
//   Power 4: [15] Triangle on Inverted Table (more damage to enemies)
// - Tablet: ~9:30
// * Stage 4:
// - Go into inner area of large room and break box in lower right [required for secret door in wall in same room]
// - Go back out of inner area and through secret door in lower right to a shop
//   Power 5: [15] Triangle on Inverted Table (more damage to enemies)
// - Tablet: ~12:30
// Select "Yes" (attack button) to start second loop

achievement("Speedy Spelunking", "Complete the first loop in under 15 minutes", 10,
    trigger = in_game() && 
              once(current_room() == room_start && loop_counter() == 0) &&
              current_room() == room_end &&
              never(repeated(15*60*60, always_true()))
)
