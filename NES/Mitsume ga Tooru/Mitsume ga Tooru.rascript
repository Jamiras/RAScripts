// Mitsume ga Tooru
// #ID = 4986

// Level select: hold A+B on controller 2, press A A A A B B B B A B A B A B A B on controller 1

function current_scene() => byte(0x0041)
function current_bgm() => byte(0x0B0E) // really 030E

bgm_ending = 182
bgm_final_boss_1 = 174

purchase_psycho_wave = 0x23EE
purchase_super_sonic = 0x27E8
purchase_hyper_aura = 0x27EA
purchase_super_condor = 0x27EC
purchase_birdy = 0x23E8
purchase_1UP = 0x27EE
purchase_heal = 0x23EA

function purchase() => word(0x00CA)
function take_damage() => byte(0x0074) == 10 // countdown timer for immunity after getting hit, actually starts a lot higher

achievement(
    title = "Uncle Scrooge",
    description = "Win the game without spending money",
    points = 30,
    trigger = once(current_scene() == 1) && current_scene() >= 55 && current_bgm() == bgm_ending &&
              never(purchase() == purchase_psycho_wave) &&
              never(purchase() == purchase_super_sonic) &&
              never(purchase() == purchase_hyper_aura) &&
              never(purchase() == purchase_super_condor) &&
              //never(purchase() == purchase_birdy) && // have to allow birdy for completing on easy
              never(purchase() == purchase_1UP) &&
              never(purchase() == purchase_heal)
)

function boss1_hp() => byte(0x0668)
function boss2_hp() => byte(0x0669)

achievement(
    title = "Veggie Salad",
    description = "Beat second boss without taking damage",
    points = 15,
    trigger = current_scene() == 8 && never(current_scene() != 8) && never(take_damage()) &&
              once(boss1_hp() == 40) && boss1_hp() > 250
)

// scene 55 = tank fight, will go right into boss fight with boss as #2
// scene 56 = boss fight with boss as #1, happens after dying.
achievement(
    title = "Hero's Alter-Ego",
    description = "Beat Last Boss without taking damage on Normal",
    points = 15,
    trigger = once(current_bgm() == bgm_final_boss_1) && never(current_scene() < 55) &&
              never(take_damage()) && 
              ((current_scene() == 55 && once(boss2_hp() == 64) && boss2_hp() > 250) ||
               (current_scene() == 56 && once(boss1_hp() == 64) && boss1_hp() > 250))
)

function things_on_screen() => byte(0x0095)
function player_x() => word(0x0063)
function player_x_high() => byte(0x0064)

// bird drops 6 coins, but if the player is standing on the bird, only four may appear on screen.
// if enemies are also on screen, the counter goes even higher, but enemies are immediately defeated upon
// locating the bird, so the total number of things will eventually drop to 0. if enemies are defeated
// before finding bird, total number of things will still be 1 for the hidden bird.
achievement(
    title = "Stowaway Bird",
    description = "Find the first coin bird in Stage 4",
    points = 5,
    trigger = current_scene() == 18 && once(things_on_screen() == 4) && things_on_screen() == 0 &&
              never(player_x_high() <= 149) && never(player_x_high() >= 169)
)


// [ach=12754] should now be working.

// I've also modified [ach=12857] so it no longer fails if money is lost to continuing, and added [ach=52741] to eliminate the confusion around [ach=13857] only triggering on the second hidden bird.