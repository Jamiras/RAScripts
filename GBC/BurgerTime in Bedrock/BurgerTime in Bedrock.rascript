// BurgerTime in Bedrock
// #ID=6531
// MD5: 50e6d9d88450932743161b7512838ccc (US)
// MD5: 99825e86250ab53b5ea8ac702930919d (EU)

// passwords (Snaggletooth is bear thing, frog is plant thing):
// Level 2: Fly, Blue Dinosaur, Gazoo, Snaggletooth
// Level 3: Alligator, Alligator, Snake, Gazoo
// Level 4: Plant, Fly, Snake, Gazoo
// Level 5: Blue Dinosaur, Snaggletooth, Snaggletooth, Snake
// Level 6: Gazoo, Alligator, Fly, Blue Dinosaur
// Stage Select: Alligator, Snaggletooth, Gazoo, Blue Dinosaur

function current_screen() => byte(0xc0a4)
screen_in_game = 1
screen_title_card = 2
screen_intro = 4
screen_conspiracy = 5
screen_main_menu = 6
screen_password = 7 // also high scores
screen_options = 8
screen_level_select = 9
screen_connect_failure = 14
screen_level_complete = 15
screen_death = 16 // also final trophy
screen_continue = 17

// 24px top, 36px right - barney


function current_level() => byte(0xc71d)
levels = {
    0: "Area 1.1",   // Gizmo, Fly, Blue Lizard
    1: "Area 1.2",   // Snake, Snake, Fly
    2: "Area 1.3",   // Alligator, Brontosaurus, Fly
    3: "Area 1.4",   // Alligator, Kangaroo, Snaggletooth
    4: "Area 2.1",   // Fly, Plant, Blue Lizard
    5: "Area 2.2",   // Snaggletooth, Blue Lizard, Gizmo
    6: "Area 2.3",   // Plant, Snaggletooth, Blue Lizard
    7: "Area 2.4",   // Fly, Gizmo, Snaggletooth
    8: "Area 3.1",   // Mammoth, Alligator, Snake
    9: "Area 3.2",   // Fly, Blue Lizard, Brontosaurus
    10: "Area 3.3",  // Snaggletooth, Plant, Snake
    11: "Area 3.4",  // Fly, Alligator, Blue Lizard
    12: "Area 4.1",  // Fly, Fly, Alligator
    13: "Area 4.2",  // Fly, Blue Lizard, Gizmo
    14: "Area 4.3",  // Snake, Snaggletooth, Gizmo
    15: "Area 4.4",  // Blue Lizard, Alligator, Snaggletooth
    16: "Area 5.1",  // Snaggletooth, Snake, Gizmo
    17: "Area 5.2",  // Fly, Plant, Plant
    18: "Area 5.3",  // Fly, Fly, Snake
    19: "Area 5.4",  // Alligator, Snake, Plant
    20: "Area 6.1",  // Brontosaurus, Gizmo, Snaggletooth
    21: "Area 6.2",  // Snaggletooth, Blue Lizard, Plant
    22: "Area 6.3",  // Kangaroo, Alligator, Blue Lizard
    23: "Area 6.4",  // Snaggletooth, Mammoth, Giznmo
    24: "Completed",
}

function current_difficulty() => byte(0xc71c)
difficulty_easy = 0
difficulty_hard = 1
difficulties = {
    difficulty_easy: "Easy",
    difficulty_hard: "Hard"
}

function current_character() => byte(0xc71b)
characters = {
    0: "Fred",
    1: "Barney"
}

function current_score() => word(0xc715) * 100

function remaining_lives() => byte(0xc717)
function remaining_clubs() => byte(0xc718)


rich_presence_conditional_display(current_screen() == screen_intro, "Titles")
rich_presence_conditional_display(remaining_lives() == 0 && current_screen() < screen_death, "Titles")

rich_presence_display("{0} {1}, {2} x{3} - {4} points",
    rich_presence_lookup("level", current_level(), levels),
    rich_presence_lookup("difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("char", current_character(), characters),
    rich_presence_value("lives", remaining_lives()),
    rich_presence_value("score", current_score())
)

// ------------------------------------------------------------

// * complete a level without using any clubs
// * complete a level without dying
// * defeat all enemies on a level at the same time
// * hit two enemies with a single club
// * complete all levels in area 1
// * complete all levels in area 2
// * complete all levels in area 3
// * complete all levels in area 4
// * complete all levels in area 5
// * complete all levels in area 6
// * complete all levels in area 1 without dying
// * complete all levels in area 2 without dying
// * complete all levels in area 3 without dying
// * complete all levels in area 4 without dying
// * complete all levels in area 5 without dying
// * complete all levels in area 6 without dying
// * score 20000
// * score 50000
// * score 100000

function trigger_complete_area(area) => once(current_level() == area * 4 - 4) &&
                                        current_level() == area * 4 - 1 &&
                                        current_screen() == screen_level_complete &&
                                        never(current_screen() == screen_main_menu)

function area_achievement(area, points)
{
    achievement(
        title = "Area " + area,
        description = "Complete all four levels of area " + area,
        points = points,
        trigger = trigger_complete_area(area)
    ) 
}

function area_achievement_hard(area, points)
{
    achievement(
        title = "Area " + area + " Hard",
        description = "Complete all four levels of area " + area + " on Hard",
        points = points,
        trigger = trigger_complete_area(area) && current_difficulty() == difficulty_hard
    ) 
}

function area_achievement_no_death(area, points)
{
    achievement(
        title = "Perfect Area " + area,
        description = "Complete all four levels of area " + area + " without dying",
        points = points,
        trigger = trigger_complete_area(area) && never(remaining_lives() < prev(remaining_lives()))
    ) 
}

area_achievement(1, 5)              // IMG: barney_victory_1_4       11800
area_achievement_no_death(1, 5)     // IMG: fred_victory_1_4_1up
area_achievement_hard(1, 10)        // IMG: fred_victory_1_4         21300

area_achievement(2, 5)              // IMG: barney_victory_2_4       22500
area_achievement_no_death(2, 10)    // IMG: barney_victory_2_4_1up
area_achievement_hard(2, 10)        // IMG: fred_victory_2_4         40900

area_achievement(3, 5)              // IMG: barney_victory_3_4       44000
area_achievement_no_death(3, 10)    // IMG: fred_victory_3_4_1up
area_achievement_hard(3, 10)        // IMG: fred_victory_3_4

area_achievement(4, 5)              // IMG: barney_victory_4_4       70800
area_achievement_no_death(4, 10)    // IMG: barney_victory_4_4_1up
area_achievement_hard(4, 10)        // IMG: fred_victory_4_4

area_achievement(5, 10)             // IMG: barney_victory_5_4       88100
area_achievement_no_death(5, 10)    // IMG: fred_victory_5_4_1up
area_achievement_hard(5, 10)        // IMG: fred_victory_5_4

area_achievement(6, 10)             // IMG: barney_end               106700
area_achievement_no_death(6, 25)    // IMG: barney_victory_6_4_1up
area_achievement_hard(6, 25)        // IMG: fred_end

function trigger_in_level() => current_screen() == screen_in_game ||  // normal
                               current_screen() == screen_password || // after completing x-4 of previous area
                               current_screen() == screen_death       // after continue

// GOOD - IMG: plants
achievement("Avoidance", "Complete a level without using the club or dying", 5,
    trigger = current_screen() == screen_level_complete &&
              never(remaining_clubs() < prev(remaining_clubs())) &&
              never(remaining_lives() < prev(remaining_lives())) &&
              (once(current_screen() == screen_main_menu) ||
               once(current_screen() == screen_continue) ||
               once(current_level() != prev(current_level())))
)

function number_of_enemies() => byte(0xc6a3)

//       4  5  6  7  8  9  A  B  C  D  E  F  0  1  2  3  4
//      ST    AN    FR             X1 Y1 X2 Y2       EN     AN = facing/animation  ST = state  EN = enemy type
// C6A4 04 08 00 01 01 08 04 04 01 33 10 43 20 18 00 B8 34
// C6B5 04 20 01 00 01 08 05 04 01 81 10 91 20 18 01 B8 34
// C6C6 04 04 00 03 02 08 06 03 01 1E 10 2E 20 18 02 AF 34
// C6D7 00 00 00 00
//
// ST = state: 04 = normal, 10=falling, 84=respawning, 20=killed by dino
function enemy_state(index) => byte(0xc6a4 + index * 17)
state_normal = 0x04
state_stunned = 0x08
state_falling = 0x10
state_dying = 0x20
state_invulnerable = 0x84

function enemy_animation(index) => byte(0xc6a6 + index * 17)

function enemy_type(index) => byte(0xc6b3 + index * 17)
type_gizmo = 0xAC
type_fly = 0xAF
type_blue_lizard = 0xB2
type_plant = 0xB5
type_snake = 0xB8
type_snaggletooth = 0xBB
type_alligator = 0xBE
type_brontosaurus = 0xC1
type_kangaroo = 0xC4
type_mammoth = 0xC7
type_dino = 0xCA          // dino power-up counts as an enemy/sprite

enemies_stunned = []
enemies_falling = []
enemies_eliminated = []
enemies_cleared = always_true()
for i in range(0,2)
{
    array_push(enemies_stunned, once(enemy_state(i) == state_stunned && prev(enemy_state(i)) == state_normal))
    array_push(enemies_falling, once(enemy_state(i) == state_falling && prev(enemy_state(i)) != state_falling))
    array_push(enemies_eliminated,
        (enemy_state(i) == state_dying && prev(enemy_state(i)) != state_dying && prev(enemy_state(i)) != state_falling))
    enemies_cleared = enemies_cleared && enemy_state(i) == state_dying
}

function current_animation() => byte(0xc6fa)
animation_walk_right = 0
animation_walk_left = 1
animation_walk_down = 2
animation_walk_up = 3
animation_victory = 4
animation_club_right = 5
animation_club_left = 6
animation_dying = 7
animation_club_down = 8
animation_club_up = 9

// GOOD - IMG: thwack
// facing down on ladder?
achievement("Thwack!", "Knock out at least two enemies with a single swing of the club", 3,
    trigger = trigger_in_level() && 
              never(current_animation() < animation_club_right) &&
              never(current_animation() == animation_dying) &&
              tally(2, enemies_stunned)
)

function is_falling(index) => byte(0xc563 + index * 15) == 3
ingredient_falling_sum = 0
for i in range(0,18)
    ingredient_falling_sum = ingredient_falling_sum + is_falling(i)

// GOOD - IMG: falling_mammoth
achievement("Going Down", "Make at least two enemies fall when dropping a single ingredient", 4,
    trigger = trigger_in_level() && 
              never(ingredient_falling_sum != 3) && // only one ingredient falling
              tally(2, enemies_falling)
)

// GOOD - IMG: dino_chase
achievement("All Clear", "Eliminate all enemies in a level at the same time", 5,
    trigger = (enemies_cleared) && trigger_in_level()
)

// GOOD - IMG: extermination
achievement("Extermination", "Eliminate six or more enemies in a single level", 5,
    trigger = tally(6, enemies_eliminated) && 
              never(current_level() != prev(current_level())) &&
              never(current_screen() == screen_continue) &&
              never(current_screen() == screen_main_menu) &&
              trigger_in_level()
)

function score_achievement(score, points)
{
    achievement(
        title = score + " Points",
        description = "Score at least " + score + " points",
        points = points,
        trigger = current_score() >= score && trigger_in_level()
    )
}

score_achievement(10000, 3)   // IMG: barney_victory_10000
score_achievement(25000, 5)   // IMG: fred_victory_25000
score_achievement(50000, 10)  // IMG: barney_victory_50000
score_achievement(75000, 25)  // IMG: fred_victory_75000

// ------------------------------------------------------------

leaderboard("High Score (Easy)", "Highest score at game over or completion", 
    start = current_difficulty() == difficulty_easy && 
            current_score() > 0 &&
            (remaining_lives() == 0 || // handles continue and game over
             current_level() == 24),   // handles game completion
    cancel = current_screen() == screen_main_menu,
    submit = always_true(),
    value = current_score()
)

leaderboard("High Score (Hard)", "Highest score at game over or completion", 
    start = current_difficulty() == difficulty_hard && 
            current_score() > 0 &&
            (remaining_lives() == 0 || // handles continue and game over
             current_level() == 24),   // handles game completion
    cancel = current_screen() == screen_main_menu,
    submit = always_true(),
    value = current_score()
)
