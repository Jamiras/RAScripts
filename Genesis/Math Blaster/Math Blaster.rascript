// Math Blaster: Episode 1
// #ID = 7702

// Achievements can only be earned in normal game difficulty with 3 initial blasertnauts
// (default settings). Any math difficulty may be used unless otherwise specified.

function lives() => byte(0x0e46)
function initial_lives() => byte(0x0182)
function difficulty() => byte(0x0184)
function practice_mode() => byte(0x0186) == 0

function game() => byte(0x2041)
game_none = 0
game_trash_zapper = 1
game_cave_runner = 2
game_math_blaster = 3

games = {
    game_trash_zapper: "Trash Zapper",
    game_cave_runner: "Cave Runner",
    game_math_blaster: "Math Blaster",
}

function screen() => word(0x0ee8)
screen_logos = 0x37a2 // also about
screen_title = 0x3722
screen_trash_zapper = 0x3822
screen_trash_zapper_flash = 0x3922
screen_trash_zapper_bonus = 0x38a2
screen_trash_zapper_post_cutscene = 0x3d22
screen_cave_runner = 0x39a2
screen_cave_runner_post_cutscene = 0x3da2
screen_math_blaster = 0x3a22
screen_math_blaster_post_cutscene = 0x3e22
screen_settings = 0x3aa2
screen_intro = 0x3b
screen_intro2 = 0x3c
screen_ending = 0x3e22
screen_game_over = 0x3ea2

function game_progress() => byte(0x0cf8)
// 00: none
// 01: Trash Zapper text
// 02: Stage One text
// 03: [Trash Zapper game stage 1]
// 04: 10 trash zapped
// 05: Stage Complete text
// 06: top display blanked out
// 07: Bonus Points text
// 08: bonus points allocated
// 09: text cleared
// 0a: Bonus Stage text
// 0b: [Bonus Stage]
// 0c: bonus points awarded
// 0d: text cleared
// 0e: Stage Two text
// 0f: [Trash Zapper game stage 2]
// 10: 10 trash zapped
// 11: Stage Complete text
// 12: top display blanked out
// 13: Bonus Points text
// 14: bonus points allocated
// 15: text cleared
// 16: bonus Stage text
// 17: [Bonus Stage]
// 18: bonus points awarded
// 19: text cleared
// 1a: Stage Three text
// 1b: [Trash Zapper game stage 3]
// 1c: 10 trash zapped
// 1d: Stage Complete text
// 1e: top display blanked out
// 1f: Bonus Points text
// 20: bonus points allocated
// 21: text cleared
// 22: bonus Stage text
// 23: [Bonus Stage]
// 24: bonus points awarded
// 25: text cleared
//     stays all the way through the cave runner sequence
// 00: after cave runner cutscene
// 01: Math Blaster intro
// 02: ""
// 03: Stage One text
// 04: [Math Blaster game stage 1]
// 05: 10 answers
// 06: text cleared
// 07: Stage Over text
// 08: text cleared
// 09: Bonus Points text
// 0a: text cleared
// 0b: awarding points
// 0c: points awarded
// 0d: text cleared
// 0e: Bonus Stage text
// 0f: [Bonus Stage]
// 10: Stage Over text
// 11: points distribution
// 12: points distributed
// 13: Stage Two text
// 14: [Math Blaster game stage 2]
// 15: 10 answers
// 16: text cleared
// 17: Stage Over text
// 18: text cleared
// 19: Bonus Points text
// 1a: text cleared
// 1b: awarding points
// 1c: points awarded
// 1d: text cleared
// 1e: Bonus Stage text
// 1f: [Bonus Stage]
// 20: Stage Over text
// 21: points distribution
// 22: points distributed
// 23: Stage Three text
// 24: [Math Blaster game stage 3]
// 25: 10 answers
// 26: text cleared
// 27: Stage Over text
// 28: text cleared
// 29: Bonus Points text
// 2a: text cleared
// 2b: awarding points
// 2c: points awarded
// 2d: text cleared
// 2e: bad guy leaves (end scene)

function last_sound_effect() => byte(0x0eb4)
function next_sound_effect() => byte(0x0eae) // not all sounds go through this
// 01: shield increase
// 02: lives increase
// 03: collect gem
// 04: shoot laser
// 07: bird/star whistles when stunned
// 08: thruster
// 09: trash zapped (final stage)
// 0a: laser
// 0c: new numbers
// 0d: enemy ship approaching
// 0e: ship's gun
// 0f: enemy ship's gun
// 1a: hit ground
// 2c: splash
// 2d: shoot creature
// 2e: zapped
// 30: take damage/destroy asteroid
// 31: destroy enemy ship/destroy correct trash/blaster
// 32: ow!
// 4e: destroy incorrect trash

function stage() => byte(0x0cfc)

function score() => bcd(word(0x2044)) * 100 + bcd(byte(0x02047))

function points_XXXX00() => bcd(word(0x2044))
function points_0000XX() => bcd(byte(0x2047))
function points_awarded() => points_XXXX00() > prev(points_XXXX00())
function points_awarded_small() => points_0000XX() != prev(points_0000XX())
function last_points_awarded() => bcd(word(0x2048))
function bonus_points_XXXX00() => word(0x204a)

rich_presence_conditional_display(screen() == screen_game_over,
    "{0} | {1} stage {2} (difficulty {3}) | game over",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_lookup("Game", prior(game()), games),
    rich_presence_value("Stage", stage()),
    rich_presence_value("Difficulty", difficulty())
)

rich_presence_conditional_display(screen() == screen_ending && practice_mode(),
    "{0} | Mission Accomplished! | practice mode",
    rich_presence_value("Score", score(), format="SCORE")
)

rich_presence_conditional_display(screen() == screen_ending,
    "{0} | Mission Accomplished! | {1} lives",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_value("Lives", lives())
)

rich_presence_conditional_display(screen() == screen_trash_zapper_post_cutscene,
    "{0} | {1} stage {2} (difficulty {3}) | practice mode",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_lookup("Game", prior(game()), games),
    rich_presence_value("Stage", stage()),
    rich_presence_value("Difficulty", difficulty())
)

rich_presence_conditional_display(game() == game_none, "Titles")

rich_presence_conditional_display(practice_mode(),
    "{0} | {1} stage {2} (difficulty {3}) | practice mode",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_lookup("Game", game(), games),
    rich_presence_value("Stage", stage()),
    rich_presence_value("Difficulty", difficulty())
)

rich_presence_display("{0} | {1} stage {2} (difficulty {3}) | {4} lives",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_lookup("Game", game(), games),
    rich_presence_value("Stage", stage()),
    rich_presence_value("Difficulty", difficulty()),
    rich_presence_value("Lives", lives())
)

function default_settings() => !practice_mode() && initial_lives() == 3

// ==== Trash Zapper ====
// * Answer 10 equations to move on to the bonus round and next stage. Three stages
// * Lose energy for incorrect answers or by getting hit by alien ship (use shield to avoid)
// * Each correct answer = 200pts
// * Alien ship = 150pts
// * Asteroids = 100pts
// * Bonus = longest correct answer streak x1000 + asteroids
// * Satellite = 100pts + recharge shield power

// Complete Trash Zapper (5)
achievement("Trash Zapped", "Complete the Trash Zapper game", 2,
    trigger = prior(game()) == game_trash_zapper && default_settings() &&
              screen() == screen_trash_zapper_post_cutscene
)

// Complete Trash Zapper on difficulty 9 or 12 (5)
achievement("Trash Zapped (Hard)", "Complete the Trash Zapper game on difficulty 9 or 12", 4,
    trigger = prior(game()) == game_trash_zapper && default_settings() &&
              screen() == screen_trash_zapper_post_cutscene &&
              (difficulty() == 9 || difficulty() == 12)
    
)

// Complete Trash Zapper without any incorrect answers (5)
function best_streak() => byte(0x0e38)
achievement("Precision Trash Zapping", 
            "Complete any Trash Zapper stage without any incorrect answers", 5,
    trigger = game() == game_trash_zapper && default_settings() &&
              best_streak() == 10 &&
              (game_progress() == 0x05 ||
               game_progress() == 0x11 ||
               game_progress() == 0x1d) 
)

// Complete Trash Zapper without losing any energy (10)
function energy() => byte(0x0d04)
achievement("Defensive Trash Zapper", 
            "Complete any Trash Zapper stage without losing any energy", 10,
    trigger = never(game() != game_trash_zapper) && default_settings() &&
              never(energy() != prev(energy())) &&
              // Stage One
              ((once(game_progress() == 0x02) &&
               trigger_when(game_progress() == 0x04)) ||
              // Stage Two
              (once(game_progress() == 0x0e) &&
               trigger_when(game_progress() == 0x10)) ||
              // Stage Three
              (once(game_progress() == 0x1a) &&
               trigger_when(game_progress() == 0x1d)))
)

// Zap the trash ship at least five times (5)
function blast_ship() => points_awarded() && last_points_awarded() == 150
achievement("Offensive Trash Zapper", 
            "Zap the Trash Alien's ship five times in a single stage", 2,
    trigger = game() == game_trash_zapper && default_settings() &&
              measured(repeated(5, blast_ship())) &&
              never(screen() != screen_trash_zapper &&
                    screen() != screen_trash_zapper_flash)              
)

// Zap at least ten asteroids in the bonus level (5)
function blast_asteroid() => bonus_points_XXXX00() > prev(bonus_points_XXXX00())
achievement("Rock Zapper", 
            "Destroy fifteen asteroids in a Trash Zapper bonus stage", 2,
    trigger = game() == game_trash_zapper && default_settings() &&
              measured(repeated(15, blast_asteroid())) &&
              never(screen() != screen_trash_zapper_bonus)              
)

// ==== Cave Runner ====
// * To cross through a gate, you must have a number between the result of the two equations
// * Collect water droplets to change your number (10pts)
// * Gems worth extra points = 250pts
// * Shoot a creature = 100pts

// Complete Cave Runner (5)
// game() changes to 0 a few frames before screen changes to post_cutscene
achievement("Up, Up, and Away", "Complete the Cave Runner game", 2,
    trigger = prior(game()) == game_cave_runner && default_settings() &&
              screen() == screen_cave_runner_post_cutscene
)

// Complete Cave Runner on difficulty 9 or 12 (10)
achievement("Up, Up, and Away (Hard)", "Complete the Cave Runner game on difficulty 9 or 12", 4,
    trigger = prior(game()) == game_cave_runner && default_settings() &&
              screen() == screen_cave_runner_post_cutscene &&
              (difficulty() == 9 || difficulty() == 12)
)

// Complete Cave Runner without shooting any creatures (5)
achievement("They're Not a Threat", 
            "Complete the Cave Runner game without shooting any creatures", 5,
    trigger = once(game() == game_cave_runner) && default_settings() &&
              trigger_when(screen() == screen_cave_runner_post_cutscene) &&
              once(screen() == screen_trash_zapper_post_cutscene) &&
              never(last_sound_effect() == 0x2d) &&
              never(game() == game_trash_zapper)
)

// Complete Cave Runner without losing any energy (10)
achievement("Cautious Ascent", "Complete the Cave Runner game without losing energy", 10,
    trigger = once(game() == game_cave_runner) && default_settings() &&
              trigger_when(screen() == screen_cave_runner_post_cutscene) &&
              once(screen() == screen_trash_zapper_post_cutscene) &&
              never(energy() < prev(energy())) &&
              never(lives() < prev(lives()))
)

// Collect at least five gems (5)
function collect_gem() => points_awarded() && next_sound_effect() == 3
achievement("Souvenirs", "Collect five gems in the Cave Runner game", 2,
    trigger = never(game() != game_cave_runner) && default_settings() &&
              measured(repeated(5, collect_gem()))
)

// Shoot at least five creatures (5)
achievement("Pest Control", "Kill ten creatures in the Cave Runner game", 2,
    trigger = never(game() != game_cave_runner) && default_settings() &&
              // the sound effect occurs one frame after the points change. this trick
              // keeps the achievement paused except for the frame when the points are
              // awarded and the frame immediately after. 
              disable_when(repeated(2, !points_awarded()), until=points_awarded()) &&
              measured(repeated(10, 
                  // normal case: sound effect triggered one frame later
                  last_sound_effect() == 0x2d && prev(last_sound_effect()) != 0x2d
              ))
)

// ==== Math Blaster ====
// * Enter the porthole with the correct result for the equation 10 times
// * Eclipse causes loss of life
// * Shoot trash = 10pts
// * Correct answer = 200pts
// * Shoot creature = 100pts
// * Bonus = longest correct answer streak x1000 + ?
// * Gems worth extra points depending on color

// Complete Math Blaster (5)
// game() changes to 0 a few frames before screen changes to post_cutscene
function complete_math_blaster() => prior(game()) == game_math_blaster &&
                                    screen() == screen_math_blaster_post_cutscene 
achievement("Reunited", "Rescue Spot and complete the game", 5,
    trigger = complete_math_blaster() && default_settings()
)

// Complete Math Blaster on difficulty 9 or 12 (10)
achievement("Reunited (Hard)", "Rescue Spot and complete the game on difficulty 9 or 12", 10,
    trigger = complete_math_blaster() && default_settings() &&
              (difficulty() == 9 || difficulty() == 12)
)

// Complete the Math Blaster game with no incorrect answers (5)
achievement("The Right Stuff",
            "Complete the Trash Alien game without any incorrect answers", 5,
    trigger = game() == game_math_blaster && default_settings() &&
              game_progress() == 0x2e &&
              once(screen() == screen_cave_runner_post_cutscene) &&
              never(last_sound_effect() == 0x4e)
)

// Complete Math Blaster without shooting any trash or aliens (5)
function shoot_trash_creature() => points_awarded() && // last_points_awarded() == 100 &&
                                   next_sound_effect() == 0x2d
function shoot_trash() => points_awarded_small() && last_points_awarded() == 10
achievement("My Gun Was Jammed", 
            "Complete the Trash Alien game without destroying any trash or creatures", 5,
    trigger = game() == game_math_blaster && default_settings() &&
              trigger_when(game_progress() == 0x2e) &&
              once(screen() == screen_cave_runner_post_cutscene) &&
              never(shoot_trash_creature()) &&
              never(shoot_trash())
)

// Complete Math Blaster without losing any energy (5)
achievement("Mathematical Gymnastics", "Complete any Trash Alien stage without losing energy", 5,
    trigger = game() == game_math_blaster && default_settings() &&
              never(energy() != prev(energy())) &&
              // Stage One
              ((once(game_progress() == 0x03) &&
                trigger_when(game_progress() == 0x07)) ||
               // Stage Two
               (once(game_progress() == 0x13) &&
                trigger_when(game_progress() == 0x17)) ||
               // Stage Three
               (once(game_progress() == 0x23) &&
                trigger_when(game_progress() == 0x27)))
)

// Collect at least thirty gems in the bonus game (5)
function collect_bonus_gem() => bonus_points_XXXX00() > prev(bonus_points_XXXX00())
achievement("Pocketful of Shinies", "Collect thirty gems in the Trash Alien bonus game", 3,
    trigger = never(game() != game_math_blaster) && default_settings() &&
              measured(repeated(30, collect_bonus_gem())) &&
              never(game_progress() != 0x0f && game_progress() != 0x1f)
)

// Shoot at least ten pieces of trash (5)
achievement("Reduce, Reuse, Disintegrate",
            "Destroy twenty pieces of trash in any Trash Alien stage", 2,
    trigger = never(game() != game_math_blaster) && default_settings() &&
              measured(repeated(20, shoot_trash())) &&
              never(game_progress() != 0x04 && 
                    game_progress() != 0x0f && 
                    game_progress() != 0x14 && 
                    game_progress() != 0x1f && 
                    game_progress() != 0x24)
)

// Shoot at least five creatures (5)
achievement("Pest Control II",
            "Destroy five creatures in any Trash Alien stage", 2,
    trigger = never(game() != game_math_blaster) && default_settings() &&
              measured(repeated(5, shoot_trash_creature())) &&
              never(game_progress() != 0x04 && 
                    game_progress() != 0x0f && 
                    game_progress() != 0x14 && 
                    game_progress() != 0x1f && 
                    game_progress() != 0x24)
)

// ==== End Game ====
// Score at least 50000 points (5)
achievement("Good Score", "Earn at least 50000 points", 3,
    trigger = default_settings() && points_XXXX00() >= 500
)

// Score at least 75000 points (10)
achievement("Great Score", "Earn at least 75000 points", 5,
    trigger = default_settings() && points_XXXX00() >= 750
)

// Score at least 50000 points on difficulty 9 or 12 (10)
achievement("Good Score (Hard)", "Earn at least 50000 points on difficulty 9 or 12", 5,
    trigger = default_settings() && points_XXXX00() >= 500 &&
              (difficulty() == 9 || difficulty() == 12)
)

// Score at least 50000 points on difficulty 9 or 12 (10)
achievement("Great Score (Hard)", "Earn at least 75000 points on difficulty 9 or 12", 10,
    trigger = default_settings() && points_XXXX00() >= 750 &&
              (difficulty() == 9 || difficulty() == 12)
)

// Complete the game without losing any lives (5)
achievement("Indivisible", "Complete the game without losing any lives", 10,
    trigger = complete_math_blaster() && default_settings() && 
              once(game() == game_trash_zapper && game_progress() == 1) &&
              never(lives() < prev(lives()))
)
