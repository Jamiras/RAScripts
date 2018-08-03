// Donkey Kong
// #ID = 1466

// $0025: P1 score: XX0,000
function p1_score_10k() => byte(0x000025)

// $0026: P1 score: 00X,X00
function p1_score_100() => byte(0x000026)

// $0027: P1 score: 000,0XX
function p1_score_1() => byte(0x000027)

// $002E: Bonus counter: X,X00
function bonus_100() => byte(0x00002E)

// $002F: Bonus counter: 0,0XX
function bonus_1() => byte(0x00002F)

// $004E: 8bit bool game over screen on
function game_over() => byte(0x00004E) == 1

// $0050: Game Type entered: 0=1P Game A, 1=1P Game B, 2=2P Game A, 3=2P Game B
function game_type() => byte(0x000050)
type_a = 0
type_b = 1

// $0051: Game Mode?: 18=1 Player, 1C=2 Players
function game_mode() => byte(0x000051)

// $0053: stage
function current_stage() => byte(0x0053)
stage_ramp = 1
stage_elevator = 3
stage_rivet = 4

// $0054: Playthrough loop
function playthrough_loop() => byte(0x000054)

// $0055: p1 Lives
function p1_lives() => byte(0x000055)

// $050B: demo
function trigger_not_demo() => byte(0x00050B) == 0

// $0510: 38 at title screen
function trigger_title() => byte(0x000510) == 0x38
function trigger_never_title() => never(trigger_title())

achievement(
    title = "Beginner", description = "Complete Game A on level 1", points = 5,
    id = 3391, badge = "03975", published = "10/29/2013 11:23:12 PM", modified = "11/17/2013 10:23:28 PM",
    trigger = once(byte(0x000402) == 1) && game_type() == 0
)

achievement(
    title = "Intermediate", description = "Complete Game A on level 3", points = 10,
    id = 3392, badge = "03976", published = "10/29/2013 11:23:17 PM", modified = "11/17/2013 10:23:35 PM",
    trigger = once(byte(0x000402) == 3) && game_type() == 0
)

achievement(
    title = "Expert", description = "Complete Game A on level 5", points = 15,
    id = 3393, badge = "03977", published = "10/29/2013 11:23:21 PM", modified = "11/17/2013 10:23:40 PM",
    trigger = once(byte(0x000402) == 5) && game_type() == 0
)

achievement(
    title = "Beginner B", description = "Complete Game B on level 1", points = 10,
    id = 3397, badge = "03981", published = "10/29/2013 11:23:38 PM", modified = "11/17/2013 10:33:02 PM",
    trigger = game_type() == 1 && byte(0x000402) == 1
)

achievement(
    title = "Intermediate B", description = "Complete Game B on level 3", points = 15,
    id = 3398, badge = "03982", published = "10/29/2013 11:23:43 PM", modified = "11/17/2013 10:32:59 PM",
    trigger = game_type() == 1 && byte(0x000402) == 3
)

achievement(
    title = "Expert B", description = "Complete Game B on level 5", points = 20,
    id = 3399, badge = "03983", published = "10/29/2013 11:23:48 PM", modified = "11/17/2013 10:32:55 PM",
    trigger = game_type() == 1 && byte(0x000402) == 5
)

// Ticket 12805: Unlocked on its own on rom load
//               MD5: 093aa80bf4baaa489ffa4a7f6985c533
//               Emulator: RALibRetro
// Ticket 5774: Skipped the items on Screen 2 (I was getting the Speed cheevs), then picked up all three on Screen 3.
//               This triggered upon getting two of the three.
achievement(
    title = "Personal Shopper", description = "Collect both of Pauline's dropped items on screen 2", points = 5,
    id = 3400, badge = "03984", published = "10/29/2013 11:23:52 PM", modified = "11/6/2013 2:29:19 AM",
    trigger = word(0x0000C9) >= 1 && word(0x0000CA) >= 1 && current_stage() == stage_elevator
)

achievement(
    title = "Fashionista!", description = "Collect all 3 of Pauline's dropped items on screen 3", points = 10,
    id = 3401, badge = "03985", published = "10/29/2013 11:23:57 PM", modified = "11/6/2013 2:34:25 AM",
    trigger = byte(0x0000C9) == 1 && byte(0x0000CA) == 1 && byte(0x0000CB) == 1 && byte(0x000400) == 4
)

achievement(
    title = "It's-A Me!", description = "Awarded an extra life", points = 5,
    id = 3394, badge = "03978", published = "10/29/2013 11:23:25 PM", modified = "10/29/2013 11:24:36 PM",
    trigger = once(byte(0x000408) >= 1)
)

// Ticket 2832: Triggered upon resetting the game.  Not sure if this achievement was supposed to cross all
//               playthroughs until a reset, but I definitely never killed 20 enemies during a single playthrough
//               without a game over.
// Ticket 2336: Rampage triggers sometimes by simply resetting emulator, I managed to get this achievement 3 times the
//               same way (by removing Rampage from my earnings of course)
achievement(
    title = "Rampage", description = "Destroy 20 enemies with hammers in one playthrough", points = 10,
    id = 3402, badge = "03986", published = "10/29/2013 11:24:01 PM", modified = "10/31/2013 1:35:03 AM",
    trigger = repeated(160, word(0x0000BF) == 9) && trigger_not_demo() && never(game_over())
)

achievement(
    title = "Pacifist", description = "Complete screen one without picking up a hammer", points = 5,
    id = 3582, badge = "04183", published = "11/16/2013 3:04:07 PM", modified = "11/16/2013 4:04:51 PM",
    trigger = byte(0x000400) == 1 && byte(0x000451) == 1 && byte(0x000452) == 1 && byte(0x000053) == 3 && 
              prev(byte(0x000053)) == 1
)

achievement(
    title = "Give Peace a Chance", description = "Complete Screen 3 without picking up a hammer", points = 10,
    id = 3585, badge = "04184", published = "11/16/2013 3:04:22 PM", modified = "11/16/2013 4:22:48 PM",
    trigger = byte(0x000451) == 1 && byte(0x000452) == 1 && byte(0x0000C1) == 1 && byte(0x0000C2) == 1 && 
              byte(0x0000C3) == 1 && byte(0x0000C4) == 1 && byte(0x0000C5) == 1 && byte(0x0000C6) == 1 && 
              byte(0x0000C7) == 1 && byte(0x0000C8) == 1
)

achievement(
    title = "Plumbing At Speed", description = "Complete screen one with more than 3500 bonus", points = 5,
    id = 3595, badge = "04183", published = "11/17/2013 10:26:45 PM", modified = "11/17/2013 10:40:24 PM",
    trigger = byte(0x000400) == 1 && byte(0x000053) == 3 && prev(byte(0x000053)) == 1 && bonus_100() >= 53
)

achievement(
    title = "Plumbing At Speed 2", description = "Complete screen two with more than 3000 bonus", points = 5,
    id = 3596, badge = "04183", published = "11/17/2013 10:34:47 PM", modified = "11/17/2013 10:49:16 PM",
    trigger = byte(0x000400) == 3 && byte(0x000053) == 4 && prev(byte(0x000053)) == 3 && bonus_100() >= 48
)

achievement(
    title = "Plumbing At Speed 3", description = "Complete screen three with more than 2000 bonus", points = 5,
    id = 3597, badge = "04183", published = "11/17/2013 10:37:12 PM", modified = "11/17/2013 10:48:31 PM",
    trigger = byte(0x000400) == 4 && byte(0x000053) == 1 && prev(byte(0x000053)) == 4 && bonus_100() >= 32
)

achievement(
    title = "Nick of Time", description = "Finish screen 3 with only 100 points remaining on bonus counter", points = 10,
    id = 3396, badge = "03980", published = "10/29/2013 11:23:34 PM", modified = "11/6/2013 3:31:10 AM",
    trigger = bonus_100() <= 1 && byte(0x0000C1) == 1 && byte(0x0000C2) == 1 && byte(0x0000C3) == 1 && 
              byte(0x0000C4) == 1 && byte(0x0000C5) == 1 && byte(0x0000C6) == 1 && byte(0x0000C7) == 1 && 
              byte(0x0000C8) == 1
)

achievement(
    title = "50k", description = "Score a total of 50,000 points", points = 10,
    id = 3395, badge = "03979", published = "10/29/2013 11:23:30 PM", modified = "10/29/2013 11:24:41 PM",
    trigger = p1_score_10k() == 5
)

achievement(
    title = "80k", description = "Score 80,000 points", points = 30,
    id = 3586, badge = "04188", published = "11/16/2013 3:04:26 PM", modified = "11/16/2013 3:09:39 PM",
    trigger = p1_score_10k() == 8
)

achievement(
    title = "100k", description = "Score 100,000 points", points = 50,
    id = 3587, badge = "04189", published = "11/16/2013 3:04:30 PM", modified = "11/17/2013 10:38:52 PM",
    trigger = p1_score_10k() == 16
)

function flawless_playthrough(count, type) => once(dword(0x000024) == 0) &&  // no score (new game)
                                              once(p1_lives() >= 2) &&       // start with 2 lives (sometimes 3 briefly)
                                              never(byte(0x0096) == 0xFF) && // never die
                                              byte(0x000402) == count &&     // playthroughs completed
                                              game_type() == type            // A or B

// Ticket 10933: Triggers when lives are at 0. Change != to > so it only triggers when lives are 2 or over.
//               MD5: b1263a2dcd14ef308f7b5429873072de
// Ticket 2830: Both of these achievements triggered when I died during stage 1 of the second loop of game A/B.
achievement(
    title = "Iron Man II", description = "Complete one playthrough on Game B without dying", points = 25,
    id = 3588, badge = "04192", published = "11/16/2013 3:04:34 PM", modified = "11/16/2013 3:17:13 PM",
    trigger = flawless_playthrough(1, type_b)
)

// Ticket 5775: I was playing Game B, got an extra life, then died on Level 2, Screen 3. Decided to continue, and when
//               I made it to the next level both of these triggered. I can only assume it's because I never lost any
//               lives BESIDES the extra one.
achievement(
    title = "Unstoppable II", description = "Complete two playthroughs on Game B without dying", points = 30,
    id = 3589, badge = "04191", published = "11/16/2013 3:04:39 PM", modified = "6/25/2015 12:31:20 PM",
    trigger = flawless_playthrough(2, type_b)
)

// Ticket 12392: Triggered at game-over at level 3 of level 4 of game B.
//               MD5: 093aa80bf4baaa489ffa4a7f6985c533
// Ticket 8628: triggered when game overing on stage 4 of game b
//               MD5: 093aa80bf4baaa489ffa4a7f6985c533
// Ticket 3159: died one time at level 2 i think and i got to lvl 4 and died at scene 1 it said gameover and i got the
//               achivement
achievement(
    title = "Invincible II", description = "Complete three playthroughs on Game B without dying", points = 35,
    id = 3590, badge = "04193", published = "11/16/2013 3:04:43 PM", modified = "11/17/2013 10:30:08 PM",
    trigger = flawless_playthrough(3, type_b)
)

// Ticket 10934: Triggers when lives are at 0. Change != to > so it only triggers when lives are 2 or over.
//               MD5: b1263a2dcd14ef308f7b5429873072de
// Ticket 5210: It triggered when I won the game.
// Ticket 2831: Both of these achievements triggered when I died during stage 1 of the second loop of game A/B.
achievement(
    title = "Iron Man", description = "Complete one playthrough on Game A without dying", points = 15,
    id = 3581, badge = "04185", published = "11/16/2013 3:04:01 PM", modified = "11/16/2013 3:16:59 PM",
    trigger = flawless_playthrough(1, type_a)
)

// Ticket 12388: The requirements check the number of lifes, so if you died once and received 1up you will still get
//               the achievement.
//               MD5: 093aa80bf4baaa489ffa4a7f6985c533
// Ticket 5776: I was playing Game B, got an extra life, then died on Level 2, Screen 3. Decided to continue, and when
//               I made it to the next level both of these triggered. I can only assume it's because I never lost any
//               lives BESIDES the extra one.
// Ticket 2838: I got the Invincible achievement to trigger, but not this one.
// Ticket 2252: This achievement didn't trigger but i have unlock 3 playthroughs without dying.
//               //               Thanks for help.
achievement(
    title = "Unstoppable", description = "Complete two playthroughs on Game A without dying", points = 25,
    id = 3583, badge = "04186", published = "11/16/2013 3:04:12 PM", modified = "8/15/2015 2:03:50 PM",
    trigger = flawless_playthrough(2, type_a)
)

achievement(
    title = "Invincible", description = "Complete three playthroughs on Game A without dying", points = 35,
    id = 3584, badge = "04187", published = "11/16/2013 3:04:17 PM", modified = "11/17/2013 11:21:45 PM",
    trigger = flawless_playthrough(3, type_a)
)
