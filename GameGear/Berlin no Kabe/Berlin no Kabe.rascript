// Berlin no Kabe
// #ID = 17327

// https://segaretro.org/Berlin_no_Kabe

function score_XX0000() => bcd(byte(0x0017))
function score_00XX00() => bcd(byte(0x0018))
function score_0000XX() => bcd(byte(0x0019))
function score() => score_XX0000() * 10000 + score_00XX00() * 100 + score_0000XX()

function remaining_lives() => byte(0x001C)
function remaining_continues() => byte(0x016C)

function mode() => byte(0x1FFF)
mode_titles = 2
mode_stage_text = 3
mode_game = 5
mode_loading3 = 6
mode_loading2 = 8
mode_loading = 9
mode_cutscene = 15

function on_screen_message() => byte(0x0403)
message_stage_clear = 0x9A
message_game_over = 0x5D

class LookupItem
{
    id = 0
    label = ""
}

class StageEnum
{
    function current() => byte(0x001A)
    function is(lookup) => this.current() == lookup.id
    function was(lookup) => prev(this.current()) == lookup.id
    function complete(lookup) => this.is(lookup) && mode() == mode_game && on_screen_message() == message_stage_clear
    
    // World 1: Ice
    stage_1_1 = LookupItem(0x00, "Stage 1-1")
    stage_1_2 = LookupItem(0x01, "Stage 1-2")
    stage_1_3 = LookupItem(0x02, "Stage 1-3")
    stage_1_4 = LookupItem(0x03, "Stage 1-4")
    stage_1_5 = LookupItem(0x04, "Stage 1-5") // defeat all enemies -> shop
    stage_1_shop = LookupItem(0x23, "Stage 1-Shop") // ゆうじょう
    stage_1_boss = LookupItem(0x05, "Stage 1-Boss")

    // World 2: Forest
    stage_2_1 = LookupItem(0x06, "Stage 2-1")
    stage_2_2 = LookupItem(0x07, "Stage 2-2")
    stage_2_3 = LookupItem(0x08, "Stage 2-3") // defeat all enemies -> shop
    stage_2_shop = LookupItem(0x24, "Stage 2-Shop") // しんらい
    stage_2_4 = LookupItem(0x09, "Stage 2-4")
    stage_2_5 = LookupItem(0x0A, "Stage 2-5")
    stage_2_boss = LookupItem(0x0B, "Stage 2-Boss")
    
    // World 3: Technology
    stage_3_1 = LookupItem(0x0C, "Stage 3-1") // thousands digit is even -> shop
    stage_3_shop = LookupItem(0x25, "Stage 3-Shop") // あい
    stage_3_2 = LookupItem(0x0D, "Stage 3-2")
    stage_3_3 = LookupItem(0x0E, "Stage 3-3")
    stage_3_4 = LookupItem(0x0F, "Stage 3-4")
    stage_3_5 = LookupItem(0x10, "Stage 3-5")
    stage_3_boss = LookupItem(0x11, "Stage 3-Boss")

    // World 4: Sky
    stage_4_1 = LookupItem(0x12, "Stage 4-1")
    stage_4_2 = LookupItem(0x13, "Stage 4-2")
    stage_4_3 = LookupItem(0x14, "Stage 4-3") // fall off a platform at least 15 times before the last enemy is destroyed
    stage_4_shop = LookupItem(0x26, "Stage 4-Shop") // ゆうき
    stage_4_4 = LookupItem(0x15, "Stage 4-4")
    stage_4_5 = LookupItem(0x16, "Stage 4-5")
    stage_4_boss = LookupItem(0x17, "Stage 4-Boss")

    // World 5: Underwater
    stage_5_1 = LookupItem(0x18, "Stage 5-1")
    stage_5_2 = LookupItem(0x19, "Stage 5-2") // dig exactly 7 holes by the end of the stage
    stage_5_shop = LookupItem(0x27, "Stage 5-Shop") // へいわ
    stage_5_3 = LookupItem(0x1A, "Stage 5-3")
    stage_5_4 = LookupItem(0x1B, "Stage 5-4")
    stage_5_5 = LookupItem(0x1C, "Stage 5-5")
    stage_5_boss = LookupItem(0x1D, "Stage 5-Boss")

    // World 6: Boss Gauntlet
    stage_6_1 = LookupItem(0x1E, "Stage 6-1")
    stage_6_2 = LookupItem(0x1F, "Stage 6-2")
    stage_6_3 = LookupItem(0x20, "Stage 6-3")
    stage_6_4 = LookupItem(0x21, "Stage 6-4")
    stage_6_5 = LookupItem(0x22, "Stage 6-5")
}

// visit all 5 shops to fight all five bosses again for the good ending
// things to buy at the shop (last until game over):
// * golden hammer (500) - only need one hit to dig holes
// * winged boots (1000) - lets you jump by pressing both buttons simultaneously
// * cat head (5000) - extra life
// * bubble (3500) - allows you to take 3 hits before dying
// * doubler (2000) - doubles the points awarded

// while paused, press up+1+2 to restart the level
// press start+1+2 to reset the game

// ========

// The first shop is after Stage 1-5. You should have ~4000 points. Buy the doubler for 2000 points
// and the hammer upgrade for 500 points.

// Stage 1 boss: The penguin will occassionally jump, which releases icicles from the ceiling. Just dodge them.

// Stage 2-3: knock out two spaces on the top level. The hedgehogs will only step over run, so three of them
// will turn around.

// The second shop is after Stage 2-3. If you had to continue, rebuy the doubler and hammer upgrades.
// Buy the jump skill for 1000 points and bubble for 3500 points.

// Stage 2 boss: The hedgehog will bounce around the screen after you drop him. Hide in a corner, then move out
// of the way after his first bounce.

// Stage 3-1: drop off the right edge when the first robot is about three spaces from the ladder. One or two of
// the robots should come at you. Quickly knock out two holes, and then knock them out. If you're lucky, you'll
// take out the others below. 
// IMPORTANT!: Make sure the third digit of your score (00X000) is even to reach the shop. Replenish the doubler
// and hammer if you continued, and the shield if you've taken any damage. Invest the rest in extra lives.

// Stage 3-2: hopefully, one of the two robots will go to the top. Follow it. Dig holes on either side of the
// middle platform to drop one of the outer robots on the inner one.

// Stage 3-4: knock out the space immediately to the right of the ladder. Drop the "free" blue guy through it twice
// turning him red. Then drop him on the top blue guy. Drop down and knock the lower blue guy out and repeat the
// above to turn him red then drop him on the remaining blue guy.

// Stage 3 boss: The robot constantly spews out junk, and occasionally explodes into lots of junk. Make the hole
// a safe distance from him and wait for it to fall in while avoiding all the junk.

// Stage 4-3: step off a platform and fall at least 15 times to access the shop. Since there's no upper limit to this,
// count 15 drops when there's only one monster left. Replenish the doubler and hammer if you continued, and the
// shield if you've taken any damage. Invest the rest in extra lives.

// Stage 4-4: Stay at the bottom left until the bats are nearly upon you. Quickly run under them and stand near the
// hole. When they stop flying, jump off and quickly run down two levels. You want to be over the second left-side
// vines when they stop flying the next time so you can run under them. Stop at the next vine and wait for them to
// stop flying again. Run all the way to the bottom and trap the yellow drop. Unfortunately, you can't really use
// the yellow one to kill the bats, so make a bunch of holes and then run loops until they get stuck in the holes.

// Stage 4-5: Drop down the right side and knock out alternating clouds on the way down. Drop down again. One of the
// bats should get stuck in one of the holes. Knock it down and hopefully take out a second. Repeat for the any
// remaining.

// Stage 4 boss: The eggplant has a ball and chain she flings at you. Try to stay away from it. Otherwise it's
// basically the same as the robot. Dig a hole, stay away from the boss, wait for it to fall in.

// Stage 5-1: You have to drop the little green guys on the octopii.

// Stage 5-2: Dig EXACTLY seven holes to open the shop. There are eight monsters, so you need to drop one onto another
// then each remaining monster can have its own hole. If you kill more than one with the drop, make sure to dig extra holes.
// Don't worry about replenishing the doubler here (if you continued), there's no more need for money.
// Do replenish the hammer and shield, then full up on extra lives.;p

// Stage 5-3: You need to immediately climb the left vine and drop onto the middle of the field,
// quickly press right and dig. Hopefully, this traps the blue jumper. Then, when the pink octopus is under
// the right side of the middle tower, kill the blue jumper so it chains into the pink octopus, then all the
// stuff in the tower.

// Stage 5 boss: The octopus's gimmick is to shoot black balls into the air, which makes the level invisible to you
// and it can fly anywhere. The balls don't hurt you, so just worry about the octopus.

// If you've visited all five shops, you'll get 3 extra continues and then have to face a boss gauntlet. Without
// being able to visit the shops in-between, you won't be able to refresh your hammer or shield. Good luck! The
// only realy nuisance is the hedgehog bouncing all over the screen.


Stage = StageEnum()
stage_map = field_map(Stage, (k, v) => {v.id: v.label})

rich_presence_conditional_display(mode() == mode_titles, "Titles")

rich_presence_conditional_display(mode() == mode_cutscene && 
                                  !Stage.is(Stage.stage_5_boss) &&
                                  !Stage.is(Stage.stage_6_5), "Intro")

rich_presence_display("{0} | {1} | {2} extra {3} | {4} {5}",
   rich_presence_lookup("Stage", Stage.current(), stage_map),
   rich_presence_value("Score", score(), format="SCORE"),
   rich_presence_value("Lives", remaining_lives()),
   rich_presence_lookup("LifePlurality", remaining_lives(), {1:"life"}, fallback="lives"),
   rich_presence_value("Credits", remaining_continues()),
   rich_presence_lookup("CreditsPlurality", remaining_continues(), {1:"credit"}, fallback="credits")
)

achievement("Penguin Plummeted", "Defeat the boss of world 1", 5, type="progression",
    trigger = Stage.complete(Stage.stage_1_boss)
)

achievement("Hedgehog Holed", "Defeat the boss of world 2", 5, type="progression",
    trigger = Stage.complete(Stage.stage_2_boss)
)

achievement("Robot Crashed", "Defeat the boss of world 3", 10, type="progression",
    trigger = Stage.complete(Stage.stage_3_boss)
)

achievement("Eggplant Squashed", "Defeat the boss of world 4", 10, type="progression",
    trigger = Stage.complete(Stage.stage_4_boss)
)

achievement("Octopus Sank", "Defeat the boss of world 5", 10, type="win_condition",
    trigger = Stage.complete(Stage.stage_5_boss)
)

achievement("The Arcade Experience", "Defeat the boss of world 5 with default settings (3 lives, 3 credits)", 25,
    trigger = Stage.complete(Stage.stage_5_boss) &&
              byte(0x016a) <= 3 && // starting lives
              byte(0x016b) <= 3    // starting credits
)

achievement("Reunited", "Break down the wall and find your mother", 25,
    trigger = Stage.is(Stage.stage_6_5) && 
              (mode() == mode_cutscene || mode() == mode_loading) &&
              word(0x060C) == 0x5D9C // mother hugging crying child
)

// shop condition: even digit in thousands place of score
achievement("Numerology", "Enter the secret shop of world 3", 5,
    trigger = trigger_when(Stage.is(Stage.stage_3_shop)) && Stage.was(Stage.stage_3_1)
)

// shop condition: fall at least 15 times
achievement("Gravimetrics", "Enter the secret shop of world 4", 5,
    trigger = trigger_when(Stage.is(Stage.stage_4_shop)) && Stage.was(Stage.stage_4_3)
)

// shop condition: dig exactly 7 holes
achievement("Septiforis", "Enter the secret shop of world 5", 5,
    trigger = trigger_when(Stage.is(Stage.stage_5_shop)) && Stage.was(Stage.stage_5_2)
)

// the stage changes to the shop identifier while the Stage Complete message for the entry stage is visible.
// to prevent triggering when stepping into the shop portal, make sure the shop flag is not set.
function in_shop() => byte(0x0613) == 1
achievement("Extra Dessert I", "Collect all the cake in the bonus level of world 1", 5,
    trigger = Stage.complete(Stage.stage_1_shop) && !in_shop()
)

achievement("Extra Dessert II", "Collect all the cake in the bonus level of world 2", 5,
    trigger = Stage.complete(Stage.stage_2_shop) && !in_shop()
)

achievement("Extra Dessert III", "Collect all the cake in the bonus level of world 3", 5,
    trigger = Stage.complete(Stage.stage_3_shop) && !in_shop()
)

achievement("Extra Dessert IV", "Collect all the cake in the bonus level of world 4", 5,
    trigger = Stage.complete(Stage.stage_4_shop) && !in_shop()
)

achievement("Extra Dessert V", "Collect all the cake in the bonus level of world 5", 5,
    trigger = Stage.complete(Stage.stage_5_shop) && !in_shop()
)

achievement("Don't Trip", "Complete a stage without falling", 5,
    trigger = once(prev(mode()) != mode_game) &&
              never(mode() != mode_game) &&
              never(byte(0x61a) != 0) && // times fallen
              never(Stage.current() >= Stage.stage_1_shop.id) && // all bonus levels are >= stage_1_shop
              on_screen_message() == message_stage_clear
)

achievement("Score I", "Score at least 20000 points", 5,
    trigger = mode() == mode_game && score_XX0000() >= 2 && prev(score_XX0000()) < 2
)

achievement("Score II", "Score at least 40000 points", 10,
    trigger = mode() == mode_game && score_XX0000() >= 4 && prev(score_XX0000()) < 4
)
