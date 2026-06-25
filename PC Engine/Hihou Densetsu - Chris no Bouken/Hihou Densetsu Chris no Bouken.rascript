// Hihou Densetsu: Chris no Bouken
// #ID = 28826
// MD5: c9e0db42be0c9dbb72acb1d148e302a7 - Hihou Densetsu - Chris no Bouken (Japan)

// Press SELECT at "Stage Select" screen to change stage.

function lives() => byte(0x1F00)
function health() => byte(0x1F01)
function coins() => byte(0x1F05)

function state() => byte(0x1F41)
state_titles = 0x00
state_level1 = 0x01 // 1-1, 5-1
state_level2 = 0x02 // 4-2
state_level3 = 0x03 // 5-2
state_level4 = 0x04 // 2-2, 4-1
state_level5 = 0x05 // 3-1, 3-2
state_level6 = 0x06 // 6-1, 6-2
state_level7 = 0x07 // 7-1, 7-2
state_level8 = 0x08 // 8-1, 8-2
state_boss = 0x09
state_intro = 0x0B
state_cutscene_1 = 0x0C
state_cutscene_2 = 0x0D
state_cutscene_3 = 0x0E
state_cutscene_4 = 0x11
state_cutscene_5 = 0x12
state_cutscene_6 = 0x13
state_cutscene_7 = 0x14
state_cutscene_8 = 0x15
state_cutscene_end = 0x16
state_stage_select = 0x17

function level() => byte(0x1F92)
function stage() => byte(0x1F93)
function substage() => byte(0x1F94)
level_1_1 = 0x01
level_1_2 = 0x02
level_2_1 = 0x03
level_2_2 = 0x04
level_3_1 = 0x05
level_3_2 = 0x06
level_4_1 = 0x07
level_4_2 = 0x08
level_5_1 = 0x09
level_5_2 = 0x0A
level_6_1 = 0x0B
level_6_2 = 0x0C
level_7_1 = 0x0D
level_7_2 = 0x0E
level_8_1 = 0x0F
level_8_2 = 0x10

levels = {
    level_1_1: "1-1",
    level_1_2: "1-2",
    level_2_1: "2-1",
    level_2_2: "2-2",
    level_3_1: "3-1",
    level_3_2: "3-2",
    level_4_1: "4-1",
    level_4_2: "4-2",
    level_5_1: "5-1",
    level_5_2: "5-2",
    level_6_1: "6-1",
    level_6_2: "6-2",
    level_7_1: "7-1",
    level_7_2: "7-2",
    level_8_1: "8-1",
    level_8_2: "8-2",
}

function weapon() => byte(0x1F06)
weapon_knife = 0
weapon_dart = 2
weapon_dart2 = 3
weapon_arc = 4
weapon_arc2 = 5
weapon_boomerang = 6
weapon_boomerang2 = 7

weapons = {
    weapon_knife: "Knife",
    weapon_dart: "Darts",
    weapon_dart2: "Darts+",
    weapon_arc: "Cutter",
    weapon_arc2: "Cutter+",
    weapon_boomerang: "Boomerang",
    weapon_boomerang2: "Boomerang+",
}

rich_presence_conditional_display(state() == state_titles || state() == state_stage_select, "Titles")
rich_presence_conditional_display(state() == state_intro, "Intro")

rich_presence_display("Stage {0}-{1} | {2} | {3} lives",
    rich_presence_value("Stage", stage()),
    rich_presence_value("Stage", substage()),
    rich_presence_lookup("Weapon", weapon(), weapons),
    rich_presence_value("Lives", lives())
)

// names from https://www.chrismcovell.com/games_illustrated/arc-hihou_densetsu.html

function trigger_beat_boss(s) => stage() == s && state() == state_boss && byte(0x1a6d) == 0xFF

// wait for eye to bounce over; jump into socket, jump and hit brain 8 times
achievement("Crystal Skull", "Complete Stage 1", 5, type="progression",
    trigger = trigger_beat_boss(1)
)

// too hard to avoid getting a weapon...
// achievement("I Stab at Thee", "Complete Stage 1 without ever getting a weapon", 10,
//     trigger = trigger_beat_boss(1) &&
//               trigger_when(byte(0x1a6d) == 0xFF) &&
//               once(state() == state_stage_select) &&
//               never(weapon() != weapon_knife)
//)

// hit him as he charges at you. crouch to avoid his projectiles
achievement("Veracruz", "Complete Stage 2", 5, type="progression",
    trigger = trigger_beat_boss(2)
)

// stand in the dark area. jump and hit when he's coming in from the right side or stopped near the crack
// when he stops at the other side, hit him a couple times, then run under him so the fireballs go straight down.
// ignore him when the shield is up.
achievement("Uxmal", "Complete Stage 3", 5, type="progression",
    trigger = trigger_beat_boss(3)
)

// his first attack is lightning, just be moving to dodge it. his second attack is a projectile. jump over it.
// repeat this until his spirit leaves his body. Then he repeats the same pattern, but the lightning hits multiple
// places on the screen and the projectile is faster.
achievement("Quetzalcoatl", "Complete Stage 4", 5, type="progression",
    trigger = trigger_beat_boss(4)
)

// stand near it. jump and attack, repeat. then wait for it to split. run to the left side of the screen and they'll
// go to where you were. after they come up out of the lava, return to be near it. repeat until it shows its spikes.
// phase 2: walk back and forth. when it gets close, it will stop - it's about to drop. take another step, then turn
// around and hit it. repeat until dead.
achievement("Sunstone", "Complete Stage 5", 5, type="progression",
    trigger = trigger_beat_boss(5)
)

// it will shoot lasers at 45 degrees towards you. wait a second after the head spins to jump and attack. that brief
// pause should allow you to jump over the lasers. if successful, you can quickly jump and attack again. sometimes he'll
// turn brown and attack again, but usually he'll go back under ground, in which case you need to reposition.
// repeat until dead.
achievement("Tlaloc", "Complete Stage 6", 10, type="progression",
    trigger = trigger_beat_boss(6)
)

// attack, then approach. as long as he doesn't get too far away from you, he won't jump at you (which is hard to avoid).
achievement("Kukulkan", "Complete Stage 7", 10, type="progression",
    trigger = trigger_beat_boss(7)
)

// stand right next to him and whack away. jump over the orb projectile when it comes close. the other projectiles will
// go behind you.
achievement("Lagash", "Complete Stage 8", 10, type="win_condition",
    trigger = trigger_beat_boss(8)
)

function in_level() => state() >= state_level1 && state() <= state_level8

achievement("Insurance", "Save up 30 coins for an extra life", 4,
    trigger = in_level() && lives() > prev(lives()) && prev(coins()) == 29
)

achievement("Power Up", "Get the second level of any weapon power", 1,
    trigger = in_level() && (weapon() & 1) == 1
)

