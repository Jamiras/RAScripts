// Dragon Spirit: The New Legend
// #ID = 1666

// $002A: Input
function input() => bit6(0x00002A)

// $003D: Score: 000,0X0
function score_10s() => byte(0x00003D)

// $003E: Score: 000,X00
function score_100s() => byte(0x00003E)

// $003F: Score: 00X,000
function score_1000s() => byte(0x00003F)

// $0040: Score: 0X0,000
function score_10000s() => byte(0x000040)

// $0041: Score: X00,000
function score_100000s() => byte(0x000041)

// $0047: Stage/Area
function stage_area() => byte(0x000047)

// $0048: Checkpoint
function checkpoint() => byte(0x000048)

// $004B: 4 = 1 head; 8 = 2 heads; 16 = 3 heads;  24 = invincibility;  20 = spread powerup? 20 = small; 48 = small with familiars
function dragon_state() => byte(0x00004B)

// $004C: Bits 6 7 = Fire strength; Bit2 = Autofire; Bit0 = Spread powerup; Bit1 = Large fire powerup
function spread_powerup() => bit0(0x00004C)
function large_fire_powerup() => bit1(0x00004C)
function autofire() => bit2(0x00004C)

// $004D: Fire powerup timer?
function fire_powerup_timer() => byte(0x00004D)

// $004E: 02 = new game?
//        01 = continue
//        00 = level select
function new_game() => byte(0x00004E)

// $004F: Speed?
function speed() => bit7(0x00004F)

// $0051: Lives remaining
function lives_remaining() => byte(0x000051)

// $0052: Power Bomb powerup timer
function power_bomb_powerup_timer() => byte(0x000052)

// $0053: Low Nibble=Current Health; High Nibble=Max Health
function current_health() => low4(0x000053)

// $0054: 00 = Gold, 01 = Blue
function gold_01_blue() => byte(0x000054)
function gold_dragon() => byte(0x000054) == 0
function blue_dragon() => byte(0x000054) == 1

// $0055: Area name?
function area_name() => byte(0x000055)

// $0059: Demo. 00 = Playing
function demo_00_playing() => byte(0x000059)

// $0102: Lives cheat??
function lives_cheat() => byte(0x000102)

// $03A0: Music
function music() => byte(0x0003A0)

// $03FF: Pause
function pause() => byte(0x0003FF)

// $0480: Maiden Portraits?
function maiden_portraits() => byte(0x000480)

function without_cheating() => lives_cheat() == 0 && new_game() != 0
function in_game() => demo_00_playing() == 0 && without_cheating() && stage_area() != 14

function complete_stage(stage) => in_game() &&
                                  stage_area() == stage && 
                                  dragon_state() == 184

achievement(
    title = "Land Before Time", points = 5,
    description = "Clear Area 1 - The Paleozoic Era.",
    id = 44883, badge = "45580", published = "2/9/2017 2:32:22 AM", modified = "7/19/2020 8:28:04 AM",
    trigger = complete_stage(0)
)

achievement(
    title = "Melty", points = 5,
    description = "Clear Area 2 - The Volcano.",
    id = 44884, badge = "45581", published = "2/9/2017 2:32:27 AM", modified = "7/19/2020 8:28:20 AM",
    trigger = complete_stage(1)
)

achievement(
    title = "Jungle Fever", points = 5,
    description = "Clear Area 3 - The Jungle.",
    id = 44885, badge = "45582", published = "2/9/2017 2:33:46 AM", modified = "7/19/2020 8:28:18 AM",
    trigger = complete_stage(2)
)

// Ticket 48544: After beating the stage, the achievement didn't pop.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (Mesen)
//               Emulator Version: 1.10.3
achievement(
    title = "Bone Collector", points = 5,
    description = "Clear Area 4 - The Graveyard.",
    id = 44886, badge = "45583", published = "2/9/2017 2:34:06 AM", modified = "7/19/2020 8:28:17 AM",
    trigger = complete_stage(3)
)

// Ticket 48534: Beat the Level, achievement didn't pop
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (FCEUmm)
//               Emulator Version: 1.10.3
achievement(
    title = "Dangerous Cave", points = 5,
    description = "Clear Area 5 - Cave Road.",
    id = 44887, badge = "45584", published = "2/9/2017 2:34:34 AM", modified = "7/19/2020 8:28:16 AM",
    trigger = complete_stage(4)
)

// Ticket 48535: Beat the Level, achievement didn't pop, had used two continues before hand.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (FCEUmm)
//               Emulator Version: 1.10.3
achievement(
    title = "Under the Ice", points = 10,
    description = "Clear Area 6 - The Glacier.",
    id = 44888, badge = "45586", published = "2/9/2017 2:35:09 AM", modified = "7/19/2020 8:28:15 AM",
    trigger = complete_stage(5)
)

achievement(
    title = "The Ocean Depths", points = 10,
    description = "Clear Area 7 - The Deep Sea.",
    id = 44889, badge = "45589", published = "2/9/2017 2:35:20 AM", modified = "7/19/2020 8:28:14 AM",
    trigger = complete_stage(6)
)

// Ticket 51006: Didn't trigger. I believe I had used two continues when I beat the level.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (FCEUmm)
//               Emulator Version: 1.10.3
achievement(
    title = "Into the Darkest Fray", points = 10,
    description = "Clear Area 8 - The Dark Quarters.",
    id = 44890, badge = "45591", published = "2/9/2017 2:35:42 AM", modified = "7/19/2020 8:28:12 AM",
    trigger = complete_stage(7)
)

achievement(
    title = "The Scariest Nightmare", points = 25,
    description = "Defeat Galda and clear the game as the Gold Dragon.",
    id = 44891, badge = "45597", published = "2/9/2017 2:36:36 AM", modified = "7/19/2020 8:28:10 AM",
    trigger = complete_stage(12) && gold_dragon()
)

achievement(
    title = "The Legend of Dragon", points = 25,
    description = "Defeat Galda and clear the game as the Blue Dragon.",
    id = 44892, badge = "45595", published = "2/9/2017 2:36:40 AM", modified = "7/19/2020 8:28:09 AM",
    trigger = complete_stage(12) && blue_dragon()
)


// Ticket 48242: Triggered after failing the first boss, getting to the start screen where it displays Gold Dragon and
//               then resetting the game. Had gotten the flame enhancer and small dragon powerups during the first
//               level.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RALibRetro (QuickNES)
//               Emulator Version: 1.3
achievement(
    title = "Mega Flame", points = 1,
    description = "Collect the Flame Enhancer power-up and clear any level with it.",
    id = 44893, badge = "45610", published = "2/9/2017 2:37:48 AM", modified = "5/15/2022 8:45:45 PM",
    trigger = in_game() && large_fire_powerup() == 1 && 
              trigger_when(dragon_state() >= 144) && trigger_when(dragon_state() <= 184)
)

// Ticket 48531: This achievement also popped for me when I died.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (QuickNES)
//               Emulator Version: 1.10.1
achievement(
    title = "Burn the Land", points = 1,
    description = "Collect the Sweeping Fire power-up and clear any level with it.",
    id = 44894, badge = "45611", published = "2/9/2017 2:37:53 AM", modified = "5/15/2022 8:45:46 PM",
    trigger = in_game() && spread_powerup() == 1 && 
              fire_powerup_timer() == 0 && trigger_when(dragon_state() >= 144) && 
              trigger_when(dragon_state() <= 184)
)

achievement(
    title = "Cloning Procedure", points = 2,
    description = "Collect the Dual Dragon power-up and clear any level with it.",
    id = 44895, badge = "45607", published = "2/9/2017 2:37:59 AM", modified = "5/15/2022 8:45:46 PM",
    trigger = in_game() && prev(dragon_state()) == 48 &&
              trigger_when(dragon_state() >= 144) && trigger_when(dragon_state() <= 184)
)

achievement(
    title = "Size Regression", points = 2,
    description = "Collect the Shrinker power-up and clear any level with it.",
    id = 44896, badge = "45620", published = "2/9/2017 2:38:04 AM", modified = "7/19/2020 8:28:22 AM",
    trigger = in_game() && prev(dragon_state()) == 20 && dragon_state() >= 144 && dragon_state() <= 184
)

achievement(
    title = "Nuke 'Em", points = 1,
    description = "Collect the Power Bomb power-up.",
    id = 44897, badge = "45599", published = "2/9/2017 2:40:20 AM", modified = "7/19/2020 8:28:02 AM",
    trigger = in_game() && power_bomb_powerup_timer() >= 159
)

achievement(
    title = "World Shaker", points = 1,
    description = "Collect the Earthquake power-up.",
    id = 44898, badge = "45621", published = "2/9/2017 2:40:29 AM", modified = "7/19/2020 8:28:01 AM",
    trigger = in_game() && byte(0x000321) >= 159
)

achievement(
    title = "Power of Pink", points = 1,
    description = "Collect the Fire Dragon power-up.",
    id = 44899, badge = "45687", published = "2/9/2017 2:40:36 AM", modified = "7/19/2020 8:27:59 AM",
    trigger = in_game() && dragon_state() == 24
)

achievement(
    title = "Hit Me Now", points = 1,
    description = "Collect the Power Wing power-up.",
    id = 44900, badge = "45618", published = "2/9/2017 2:40:42 AM", modified = "7/19/2020 8:27:58 AM",
    trigger = in_game() && dragon_state() != 24 && fire_powerup_timer() == 160 && 
              prev(fire_powerup_timer()) < fire_powerup_timer() && word(0x00004A) != 11288
)

// Ticket 48530: This achievement popped for me when I died.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (QuickNES)
//               Emulator Version: 1.10.1
// Ticket 48243: Triggered after failing the first boss, getting to the start screen where it displays Gold Dragon and
//               then resetting the game. Had gotten the flame enhancer and small dragon powerups during the first
//               level.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RALibRetro (QuickNES)
//               Emulator Version: 1.3
achievement(
    title = "Arisha's Blessings", points = 5,
    description = "Achieve maximum firepower and speed, then clear any level.",
    id = 44901, badge = "45666", published = "2/9/2017 2:53:55 AM", modified = "5/15/2022 8:45:46 PM",
    trigger = in_game() && autofire() == 1 && bit6(0x00004C) == 1 && bit7(0x00004C) == 1 && speed() == 1 && 
              trigger_when(dragon_state() >= 144) && trigger_when(dragon_state() <= 184)
)

achievement(
    title = "Hidden Potential", points = 25,
    description = "Collect the secret power-up.",
    id = 44902, badge = "45663", published = "2/9/2017 2:59:45 AM", modified = "7/19/2020 8:27:56 AM",
    trigger = in_game() && dragon_state() != 24 && fire_powerup_timer() == 160 && 
              prev(fire_powerup_timer()) < fire_powerup_timer() &&
              (word(0x00004A) == 11288 || word(0x00004A) == 13336)
)

function complete_stage_without_taking_damage(stage) =>
                                  in_game() &&
                                  stage_area() == stage && 
                                  never(area_name() != stage) &&
                                  trigger_when(dragon_state() == 184) &&
                                  once(byte(0x000056) == 1) &&
                                  never(byte(0x000056) == 0) &&
                                  never(stage_area() == 14) &&
                                  once(checkpoint() == 0) &&
                                  never(prev(current_health()) > current_health())

achievement(
    title = "Escaping the Dinosaurs", points = 10,
    description = "Clear Area 1 without taking damage.",
    id = 44903, badge = "45654", published = "2/9/2017 3:00:11 AM", modified = "5/15/2022 8:45:47 PM",
    trigger = complete_stage_without_taking_damage(0)
)

achievement(
    title = "Not Hot Enough", points = 10,
    description = "Clear Area 2 without taking damage.",
    id = 44904, badge = "45655", published = "2/9/2017 3:00:22 AM", modified = "5/15/2022 8:45:47 PM",
    trigger = complete_stage_without_taking_damage(1)
)

achievement(
    title = "Soaring the Trees", points = 10,
    description = "Clear Area 3 without taking damage.",
    id = 44905, badge = "45656", published = "2/9/2017 3:12:51 AM", modified = "5/15/2022 8:45:47 PM",
    trigger = complete_stage_without_taking_damage(2)
)

achievement(
    title = "Desert Sweeper", points = 10,
    description = "Clear Area 4 without taking damage.",
    id = 44906, badge = "45657", published = "2/9/2017 3:12:57 AM", modified = "5/15/2022 8:45:48 PM",
    trigger = complete_stage_without_taking_damage(3)
)

achievement(
    title = "Swift Manuevers", points = 10,
    description = "Clear Area 5 without taking damage.",
    id = 44907, badge = "45658", published = "2/9/2017 3:13:02 AM", modified = "5/15/2022 8:45:48 PM",
    trigger = complete_stage_without_taking_damage(4)
)

achievement(
    title = "Ice Shaving", points = 10,
    description = "Clear Area 6 without taking damage.",
    id = 44908, badge = "45659", published = "2/9/2017 3:13:05 AM", modified = "5/15/2022 8:45:42 PM",
    trigger = complete_stage_without_taking_damage(5)
)

achievement(
    title = "Drowning the Competition", points = 10,
    description = "Clear Area 7 without taking damage.",
    id = 44909, badge = "45660", published = "2/9/2017 3:13:24 AM", modified = "5/15/2022 8:45:38 PM",
    trigger = complete_stage_without_taking_damage(6)
)

achievement(
    title = "No Need For Lights", points = 10,
    description = "Clear Area 8 without taking damage.",
    id = 44910, badge = "45661", published = "2/9/2017 3:13:38 AM", modified = "5/15/2022 8:45:38 PM",
    trigger = complete_stage_without_taking_damage(7)
)

achievement(
    title = "Castle Conqueror", points = 25,
    description = "Clear the entirety of Area 9 without taking damage.",
    id = 44911, badge = "45662", published = "2/9/2017 3:20:02 AM", modified = "5/15/2022 8:45:39 PM",
    trigger = in_game() && stage_area() == 12 && 
              never(area_name() != 8) &&
              trigger_when(dragon_state() == 184) &&
              once(stage_area() == 8) &&
              once(stage_area() == 9) &&
              once(stage_area() == 10) &&
              once(stage_area() == 11) &&
              once(stage_area() == 12) &&
              once(byte(0x000056) == 1) &&
              never(byte(0x000056) == 0) &&
              never(stage_area() == 14) &&
              once(checkpoint() == 0) &&
              never(prev(current_health()) > current_health())
)

function blue_dragon_challenge(stage, music_id) => in_game() && blue_dragon() && stage_area() == stage &&
                                                   once(music() == music_id) && music() != music_id &&
                                                   trigger_when(dragon_state() == 184)
                                                   
function blue_dragon_no_damage_challenge(stage, music_id) => blue_dragon_challenge(stage, music_id) &&
                                                             never(prev(current_health()) > current_health())

achievement(
    title = "Making Them Extinct", points = 5,
    description = "In Blue Dragon Mode, defeat the Plesiosaurus without taking damage.",
    id = 44912, badge = "45676", published = "2/9/2017 3:20:29 AM", modified = "5/15/2022 8:45:39 PM",
    trigger = blue_dragon_no_damage_challenge(0, 42)
)

achievement(
    title = "Mythical Battle", points = 5,
    description = "In Blue Dragon Mode, defeat the Round Phoenix without taking damage.",
    id = 44913, badge = "45677", published = "2/9/2017 3:20:38 AM", modified = "5/15/2022 8:45:39 PM",
    trigger = blue_dragon_no_damage_challenge(1, 43)
)

achievement(
    title = "Plant Life", points = 5,
    description = "In Blue Dragon Mode, defeat Griathrious without taking damage.",
    id = 44914, badge = "45678", published = "2/9/2017 3:20:43 AM", modified = "5/15/2022 8:45:40 PM",
    trigger = blue_dragon_no_damage_challenge(2, 44)
)

// Ticket 48545: I died at the boss and got back from a earlier checkpoint. When I entered the boss area again I
//               noticed the rich presence icon wasn't there anymore; I have beaten the boss damageless but still no
//               achievement popped – the achievement for the are 4 didn't unlock either.
//               RetroAchievements Hash: 3d012f801c162c7f0ca97d516c25bcd6
//               Emulator: RetroArch (Mesen)
//               Emulator Version: 1.10.3
achievement(
    title = "Gravedigger", points = 5,
    description = "In Blue Dragon Mode, defeat Death Guardian without taking damage.",
    id = 44915, badge = "45679", published = "2/9/2017 3:20:46 AM", modified = "5/15/2022 8:45:40 PM",
    trigger = blue_dragon_no_damage_challenge(3, 45)
)

achievement(
    title = "Mother Arachnid", points = 5,
    description = "In Blue Dragon Mode, defeat the Parent Spider without taking damage.",
    id = 44916, badge = "45680", published = "2/9/2017 3:21:01 AM", modified = "5/15/2022 8:45:41 PM",
    trigger = blue_dragon_no_damage_challenge(4, 46)
)

achievement(
    title = "Serpent Dismantling", points = 10,
    description = "In Blue Dragon Mode, defeat Gubira without taking damage.",
    id = 44917, badge = "45681", published = "2/9/2017 3:21:05 AM", modified = "5/15/2022 8:45:41 PM",
    trigger = blue_dragon_no_damage_challenge(5, 47)
)

achievement(
    title = "Not Your Average Seafood", points = 10,
    description = "In Blue Dragon Mode, defeat the Sea Devil without taking damage.",
    id = 44918, badge = "45682", published = "2/9/2017 3:23:08 AM", modified = "5/15/2022 8:45:41 PM",
    trigger = blue_dragon_no_damage_challenge(6, 48)
)

achievement(
    title = "Wall Guardian", points = 10,
    description = "In Blue Dragon Mode, defeat the Turn Way Guard without taking damage.",
    id = 44919, badge = "45684", published = "2/9/2017 3:23:11 AM", modified = "5/15/2022 8:45:42 PM",
    trigger = blue_dragon_no_damage_challenge(7, 49)
)

achievement(
    title = "Final Trial", points = 10,
    description = "In Blue Dragon Mode, defeat the Hydra and Galda without taking damage.",
    id = 44920, badge = "45683", published = "2/9/2017 3:23:14 AM", modified = "5/15/2022 8:45:42 PM",
    trigger = blue_dragon_no_damage_challenge(12, 51) && byte(0x000055) == 8
)


achievement(
    title = "Flight of the Dragon", points = 5,
    description = "Earn 100,000 points.",
    id = 44921, badge = "45628", published = "2/9/2017 3:23:25 AM", modified = "2/9/2017 4:25:54 AM",
    trigger = in_game() && score_100000s() == 1 && prev(score_100000s()) < score_100000s()
)

achievement(
    title = "Blazing Through the Darkness", points = 10,
    description = "Earn 200,000 points.",
    id = 44922, badge = "45669", published = "2/9/2017 3:23:32 AM", modified = "7/19/2020 8:28:39 AM",
    trigger = in_game() && score_100000s() == 2 && prev(score_100000s()) < score_100000s()
)

achievement(
    title = "Soldier of Mitgult", points = 25,
    description = "Earn 300,000 points.",
    id = 44923, badge = "45671", published = "2/9/2017 3:23:35 AM", modified = "7/19/2020 8:28:37 AM",
    trigger = in_game() && score_100000s() == 3 && prev(score_100000s()) < score_100000s()
)

achievement(
    title = "Pacifist Wyvern", points = 50,
    description = "In Blue Dragon Mode, clear the game with under 100,000 points. (Must select New Game)",
    id = 44924, badge = "45666", published = "2/9/2017 3:23:40 AM", modified = "5/15/2022 8:45:43 PM",
    trigger = in_game() && trigger_when(stage_area() == 12) && trigger_when(dragon_state() == 184) && 
              new_game() == 2 && blue_dragon() && score_100000s() == 0 && score_10000s() > 0
)

achievement(
    title = "Gift From Iris", points = 10,
    description = "Earn a total of 6 lives.",
    id = 44925, badge = "45685", published = "2/9/2017 3:23:52 AM", modified = "7/19/2020 8:28:33 AM",
    trigger = in_game() && lives_remaining() == 6 && prev(lives_remaining()) < lives_remaining()
)

achievement(
    title = "Greenhouse Champ", points = 25,
    description = "In Blue Dragon Mode, defeat Griathrious without firing a shot.",
    id = 44926, badge = "45667", published = "2/9/2017 3:24:37 AM", modified = "5/15/2022 8:45:43 PM",
    trigger = blue_dragon_challenge(2, 44) &&
              never(input() == 1) && 
              unless(pause() == 1) && 
              unless(music() == 6) && 
              unless(music() == 9)
)

achievement(
    title = "Save the Children", points = 25,
    description = "In Blue Dragon Mode, defeat the Parent Spider without firing a shot.",
    id = 44927, badge = "45668", published = "2/9/2017 3:24:41 AM", modified = "5/15/2022 8:45:43 PM",
    trigger = blue_dragon_challenge(4, 46) &&
              never(input() == 1) && 
              unless(pause() == 1) && 
              unless(music() == 6) && 
              unless(music() == 9)
)

achievement(
    title = "My Lovely Ladies", points = 25,
    description = "Rescue the maidens of Areas 2, 4 and 6 in one session.",
    id = 44928, badge = "45664", published = "2/9/2017 3:24:44 AM", modified = "7/19/2020 8:28:29 AM",
    trigger = once(maiden_portraits() == 110) && once(maiden_portraits() == 114) && once(maiden_portraits() == 118) && 
              never(stage_area() > 6) && 
              never(stage_area() == 0) && 
              in_game() && 
              stage_area() == 6
)

// Ticket 37972: Triggered even though I got Maiden 6. Did not get maiden 2 and 4 but I did get maiden 6 and it
//               triggered when moving to Deep Sea (Stage 7).
//               MD5: Unknown
//               Emulator: RetroArch (1.9.1 - FCEUmm ((SVN) eb87c5e))
achievement(
    title = "Shadows of the Maidens", points = 10,
    description = "Reach the Deep Sea without rescuing the maidens of Areas 2, 4, and 6.",
    id = 44929, badge = "45665", published = "2/9/2017 3:24:55 AM", modified = "10/5/2019 6:19:01 PM",
    trigger = once(maiden_portraits() == 212) && once(maiden_portraits() == 214) && once(maiden_portraits() == 216) && 
              never(stage_area() > 6) && 
              never(stage_area() == 0) && 
              in_game() && 
              stage_area() == 6
)

achievement(
    title = "Spirit of the Green Dragon", points = 25,
    description = "Clear 4 levels in a row without losing the Flame Enhancer power-up.",
    id = 44930, badge = "45674", published = "2/9/2017 3:24:57 AM", modified = "5/15/2022 8:45:44 PM",
    trigger = in_game() && measured(repeated(4, prev(area_name()) < area_name())) &&
              never(large_fire_powerup() != 1) && 
              dragon_state() >= 144 && dragon_state() <= 184 && 
              never(area_name() == 14)
)

achievement(
    title = "Spirit of the White Dragon", points = 25,
    description = "Clear 4 levels in a row without losing the Sweeping Fire power-up.",
    id = 44931, badge = "45675", published = "2/9/2017 3:25:00 AM", modified = "5/15/2022 8:45:44 PM",
    trigger = in_game() && fire_powerup_timer() == 0 && 
              dragon_state() >= 144 && dragon_state() <= 184 &&
              measured(repeated(4, prev(area_name()) < area_name())) && 
              never(spread_powerup() != 1) &&
              never(area_name() == 14)
)

achievement(
    title = "Zawell's Bane", points = 50,
    description = "Clear the game as the Gold Dragon without ever getting hit.",
    id = 44932, badge = "45672", published = "2/9/2017 3:25:04 AM", modified = "5/15/2022 8:45:44 PM",
    trigger = in_game() && trigger_when(stage_area() == 12) &&
              trigger_when(dragon_state() == 184) && 
              gold_dragon() &&
              once(area_name() == 0) && 
              trigger_when(once(area_name() == 2)) &&
              trigger_when(once(area_name() == 3)) && 
              trigger_when(once(area_name() == 6)) && 
              trigger_when(once(area_name() == 12)) && 
              never(prev(current_health()) > current_health()) &&
              once(maiden_portraits() == 189)
)

achievement(
    title = "Galda's Bane", points = 50,
    description = "Clear the game as the Blue Dragon without losing a life.",
    id = 44933, badge = "45673", published = "2/9/2017 3:25:07 AM", modified = "5/15/2022 8:45:45 PM",
    trigger = in_game() && trigger_when(stage_area() == 12) &&
              trigger_when(dragon_state() == 184) && 
              blue_dragon() &&
              trigger_when(once(area_name() == 0)) &&
              trigger_when(once(area_name() == 1)) &&
              trigger_when(once(area_name() == 2)) && 
              trigger_when(once(area_name() == 3)) &&
              trigger_when(once(area_name() == 4)) && 
              trigger_when(once(area_name() == 5)) &&
              trigger_when(once(area_name() == 6)) && 
              trigger_when(once(area_name() == 7)) &&
              trigger_when(once(area_name() == 8)) && 
              never(prev(lives_remaining()) > lives_remaining()) &&
              once(maiden_portraits() == 189)
)



leaderboard(
    id = 1951, title = "Blue Dragon High Score",
    description = "High Score in Blue Dragon Mode.",
    start  = maiden_portraits() == 189 && blue_dragon() && new_game() == 2,
    cancel = stage_area() == 14,
    submit = stage_area() == 12 && dragon_state() == 184,
    value = score_100000s() * 100000 + score_10000s() * 10000 + score_1000s() * 1000 + score_100s() * 100 + score_10s() * 10,
    format = "SCORE"
)

leaderboard(
    id = 1950, title = "Gold Dragon High Score",
    description = "High Score in Gold Dragon Mode.",
    start  = maiden_portraits() == 189 && gold_dragon() && new_game() == 2,
    cancel = stage_area() == 14,
    submit = stage_area() == 12 && dragon_state() == 184,
    value = score_100000s() * 100000 + score_10000s() * 10000 + score_1000s() * 1000 + score_100s() * 100 + score_10s() * 10,
    format = "SCORE"
)
