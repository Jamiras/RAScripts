// Teenage Mutant Ninja Turtles III: The Manhattan Project
// #ID = 2115
// MD5: af57c886e9d1292d4e0f84e057a5dae6

// $0027: 01 = Demo Active
function demo_active() => byte(0x000027)

// $0029: Mode player
function player_mode() => byte(0x000029)
function single_player() => player_mode() == 0

// $002C: Demo Counter
function demo_counter() => byte(0x00002C)

// $002D: Cheat Codes:
//        
//        Bits 0 to 3 = Stage Select
//        Bits 4 and 5 = Extra Lives
//        Bit 6 = Game B Type (JP version)
//        Bit 7 = Easy Mode
function selected_stage() => low4(0x002D)
function cheat_extra_lives_1() => bit4(0x00002D)
function cheat_extra_lives_2() => bit5(0x00002D)
function game_type_b() => bit6(0x00002D)
function easy_mode() => bit7(0x00002D)
function cheat_codes() => byte(0x00002D)
function on_normal_without_extra_lives() => never(high4(0x00002D) != 0)
function without_cheating() => on_normal_without_extra_lives() &&
                               never(selected_stage() != 0 && continue_count() >= 3)

// $0040: Conclus????o de stage
function stage_progress() => byte(0x000040)
function stage_complete() => stage_progress() == 0x10

// $0045: 01 = Game Paused
function game_paused() => byte(0x000045)

// $0056: P1 Inputs (Bit flags)
//        
//        0 = Right
//        1 = Left
//        2 = Down
//        3 = Up
//        4 = Pause
//        5 = Select
//        6 = B
//        7 = A
function p1_inputs_bit_flags() => byte(0x000056)

// $0057: P2 Inputs (Bit flags)
//        
//        0 = Right
//        1 = Left
//        2 = Down
//        3 = Up
//        4 = Pause
//        5 = Select
//        6 = B
//        7 = A
function p2_inputs_bit_flags() => byte(0x000057)

// $0058: Stage
function stage() => byte(0x000058)
function title_screen() => stage() == 0x10

// $0068: Character select
function p1_char() => byte(0x000068)

// $0069: 2P Char: 00 = Leo, 01 = Raph, 02 = Mike, 03 = Don, FF = Inactive
function p2_char() => byte(0x000069)

// $006A: Lives
function lives() => low4(0x00006A)
function p1_died() => high4(0x006A) == 0x0C

// $006B: 2P Lives
function p2_lives() => low4(0x00006B)

// $006D: Points 1
function points_1() => byte(0x00006D)

// $006C: Points 2
function points_2() => byte(0x00006C)

// $0303: 81 when being able to choose the turtle
function when_being_able_to_choose_the_turtle() => byte(0x000303)

// $04D4: Sound Test
function sound_test() => byte(0x0004D4)

// $04D5: P1 Position Y
function p1_position_y() => byte(0x0004D5)

// $04D6: 2P Position Y
function p2_position_y() => byte(0x0004D6)

// $04F1: P1 Health
function p1_health() => byte(0x0004F1)

// $04F2: 2P Health
function p2_health() => byte(0x0004F2)

// $04F3: P1 Actions: 02 = Dive Kick, 03 = Leo's Special Move, 04 = Raph's Special Move, 05 = Mike's Special Move, 06 = Don's Special Move
function p1_actions() => byte(0x0004F3)

// $04F4: 2P Actions: 02 = Dive Kick, 03 = Leo's Special Move, 04 = Raph's Special Move, 05 = Mike's Special Move, 06 = Don's Special Move
function p2_actions() => byte(0x0004F4)

// $04F5: P1 Position X
function p1_position_x() => byte(0x0004F5)

// $04F6: 2P Position X
function p2_position_x() => byte(0x0004F6)

// $050B: Timer to choose the turtle
function timer_to_choose_the_turtle() => byte(0x00050B)

// $0628: HP Boss
function hp_boss() => byte(0x000628)

// $0788: Instant boss
function boss_id() => byte(0x000788)

// $07B0: Number of Continues
function continue_count() => byte(0x0007B0)

CharNameLookup = {
    0: "Leo",
    1: "Raph",
    2: "Mike",
    3: "Don",
}

LevelNameLookup = {
    0x00: "Scene 1 Beach",
    0x01: "Scene 2 Ocean",
    0x02: "Scene 2 Battleship",
    0x03: "Scene 3 Bridge",
    0x04: "Scene 4 New York",
    0x05: "Scene 4 Platform",
    0x06: "Scene 5 Sewer",
    0x07: "Scene 5 Sewer 2",
    0x08: "Scene 6 Technodrome",
    0x09: "Scene 6 Technodrome 2",
    0x0a: "Scene 7 Building",
    0x0b: "Scene 7 Roof",
    0x0c: "Scene 8 Spaceship",
    0x0d: "Scene 8 Spaceship 2 ",
    0x0e: "Scene 8 Final Battle",
    0x10: "Intro",
}

function trigger_complete_stages(first_stage, final_stage) =>
    single_player() && byte(0x000060) == 0 &&
    stage() == final_stage && stage_complete() &&
    once(stage() == first_stage && stage_progress() < 0x0E) &&
    never(title_screen()) && on_normal_without_extra_lives()

achievement(
    title = "Fun on the Beach", points = 5,
    description = "Complete Scene 1",
    id = 15406, badge = "14854", published = "10/14/2014 8:14:41 PM", modified = "1/8/2022 11:12:41 PM",
    trigger = trigger_complete_stages(0, 0)
)

achievement(
    title = "Naval Base", points = 5,
    description = "Complete Scene 2",
    id = 15407, badge = "14864", published = "10/14/2014 8:15:14 PM", modified = "1/8/2022 11:12:44 PM",
    trigger = trigger_complete_stages(1, 2)
)

achievement(
    title = "Clearing the Bridge", points = 5,
    description = "Complete Scene 3",
    id = 15408, badge = "14894", published = "10/14/2014 8:15:41 PM", modified = "1/8/2022 11:12:47 PM",
    trigger = trigger_complete_stages(3, 3)
)

achievement(
    title = "City in the Sky", points = 5,
    description = "Complete Scene 4",
    id = 15409, badge = "14897", published = "10/14/2014 8:16:55 PM", modified = "1/8/2022 11:12:51 PM",
    trigger = trigger_complete_stages(4, 5)
)

achievement(
    title = "Revisiting the Shrine", points = 10,
    description = "Complete Scene 5",
    id = 15410, badge = "14899", published = "10/14/2014 8:17:26 PM", modified = "1/8/2022 11:12:54 PM",
    trigger = trigger_complete_stages(6, 7)
)

achievement(
    title = "Invading Technodrome", points = 10,
    description = "Complete Scene 6",
    id = 15411, badge = "14902", published = "10/14/2014 8:17:48 PM", modified = "1/8/2022 11:12:59 PM",
    trigger = trigger_complete_stages(8, 9)
)

// Ticket 49340: Hi.
//               
//               Today I have finished the game but after I had taken continiou on the seventh level the finishing of
//               scence 7 didn't count.
//               RetroAchievements Hash: Unknown
//               Emulator: RANes
//               Emulator Version: 1.1 FCEUX 2.5.0
achievement(
    title = "Confusion in the Heights", points = 10,
    description = "Complete Scene 7",
    id = 15412, badge = "14928", published = "10/14/2014 8:18:07 PM", modified = "1/8/2022 11:13:02 PM",
    trigger = trigger_complete_stages(10, 11)
)

// These were coded to ensure you beat every boss in the game without switching characters, including accidentally
// changing to them when you die (even if you didn't actually revive as another character).

// Additionally, continuing would trigger the stage select protection.

// The "Without Dying" achievements allow the stage select, but not extra lives or easy difficulty.
// All other achievements must be earned starting a new game with default settings.

// Ticket 49341: Hi.
//               
//               Today I have finished the game but after I had taken continiou on the seventh level the finishing of
//               scences 7 and 8 didn't count.
//               RetroAchievements Hash: Unknown
//               Emulator: RANes
//               Emulator Version: 1.1 FCEUX 2.5.0
achievement(
    title = "Manhattan is Back to Her Place", points = 25,
    description = "Complete Scene 8",
    id = 15438, badge = "14996", published = "10/14/2014 8:38:45 PM", modified = "1/8/2022 11:13:05 PM",
    trigger = trigger_complete_stages(12, 14)
)


function character_challenge(id) => single_player() && byte(0x000060) == 0 &&
                                    trigger_when(stage() == 14 && stage_complete()) &&
                                    once(stage() == 0 && stage_progress() < 0x0E) &&
                                    never(title_screen()) && on_normal_without_extra_lives() &&
                                    (always_true() || (
                                      never(p1_char() != id) &&
                                      unless(p1_health() == 0) && // exactly dead
                                      unless(p1_health() > 0x80)  // overly dead
                                    ))
                                    
// Ticket 50782: Have beatin the game twice as don and neither time has givin me the achievement
//               RetroAchievements Hash: af57c886e9d1292d4e0f84e057a5dae6
//               Emulator: RetroArch (Nes/famicom (mesen))
//               Emulator Version: 1.9.12
achievement(
    title = "Don", points = 25,
    description = "Play through the entire game as Don",
    id = 15442, badge = "14994", published = "10/14/2014 8:41:23 PM", modified = "4/11/2022 5:49:38 AM",
    trigger = character_challenge(3)
)

// Ticket 49221: I have completed the game as Leo twice now, on both Mesen and FCEUMM, and this achievement didn't
//               trigger. I have also had intermittent issues while playing the game with the stage completion
//               achievements. As far as I can tell, the common denominator between all of the incidents of
//               achievements not triggering is using a continue in the final sub-stage of a stage and then finishing
//               the stage, including this final stage. In each case I died to a boss (Krang/Super Shredder for this
//               one) and had to restart the sub-stage.
//               
//               I suspect that the stage selection protection might be a bit over-zealous and is detecting the player
//               starting in the final sub-stage due to continuing as "stage selecting".
//               RetroAchievements Hash: af57c886e9d1292d4e0f84e057a5dae6
//               Emulator: RetroArch (Mesen 0.9.9 & current FCEUMM)
//               Emulator Version: 1.10.3
achievement(
    title = "Leo", points = 25,
    description = "Play through the entire game as Leo",
    id = 15439, badge = "14991", published = "10/14/2014 8:40:43 PM", modified = "4/11/2022 5:49:38 AM",
    trigger = character_challenge(0)
)

// Ticket 51728: Achievement did not open when I completed the game
//               RetroAchievements Hash: Unknown
//               Emulator: RetroArch (?)
//               Emulator Version: Mesen
// Ticket 49342: Hi.
//               
//               Today I have finished the game but after I had taken continiou on the seventh level the finishing of
//               game as Mike didn't count.
//               RetroAchievements Hash: Unknown
//               Emulator: RANes
//               Emulator Version: 1.1 FCEUX 2.5.0
achievement(
    title = "Mike", points = 25,
    description = "Play through the entire game as Mike",
    id = 15441, badge = "14993", published = "10/14/2014 8:41:08 PM", modified = "4/11/2022 5:49:39 AM",
    trigger = character_challenge(2)
)

// Ticket 51729: did not work for Mike Achievement so I tried another and did not open when I complete the game with
//               Raph
//               RetroAchievements Hash: Unknown
//               Emulator: RetroArch
//               Emulator Version: Mesen
achievement(
    title = "Raph", points = 25,
    description = "Play through the entire game as Raph",
    id = 15440, badge = "14992", published = "10/14/2014 8:40:53 PM", modified = "4/11/2022 5:49:39 AM",
    trigger = character_challenge(1)
)

achievement(
    title = "Cowabunga!", points = 25,
    description = "Play through the entire game without using continues",
    id = 15447, badge = "14985", published = "10/14/2014 8:43:18 PM", modified = "1/8/2022 11:14:18 PM",
    trigger = trigger_complete_stages(0, 14) && continue_count() == 3
)

function deathless_boss(stage_id, id, music_id) => single_player() && stage() == stage_id && 
                                byte(0x000060) == 0 &&         // difficulty?
                                byte(0x00090D) == 138 &&       // boss defeated music
                                byte(0x00090C) == 0 &&         // boss defeated
                                boss_id() == id &&
                                never(p1_died()) &&
                                once(byte(0x00090D) == music_id) && // boss start music
                                on_normal_without_extra_lives()

achievement(
    title = "Humiliated a Third Time", points = 10,
    description = "Defeat Rocksteady without dying",
    id = 15425, badge = "14856", published = "10/14/2014 8:27:20 PM", modified = "1/8/2022 11:13:11 PM",
    trigger = deathless_boss(0, 1, 149)
)

achievement(
    title = "Ole!", points = 10,
    description = "Defeat Groundchuck without dying",
    id = 15426, badge = "14866", published = "10/14/2014 8:27:36 PM", modified = "1/8/2022 11:13:20 PM",
    trigger = deathless_boss(2, 2, 150)
)

achievement(
    title = "The True Turtle", points = 10,
    description = "Defeat Slash without dying",
    id = 15427, badge = "14891", published = "10/14/2014 8:27:57 PM", modified = "1/8/2022 11:13:23 PM",
    trigger = deathless_boss(3, 3, 151)
)

achievement(
    title = "Hope I Not See You Anymore", points = 10,
    description = "Defeat Bebop without dying",
    id = 15428, badge = "14893", published = "10/14/2014 8:30:13 PM", modified = "1/8/2022 11:13:26 PM",
    trigger = deathless_boss(3, 4, 151)
)

achievement(
    title = "Noiseless", points = 10,
    description = "Defeat Dirtbag without dying",
    id = 15429, badge = "14896", published = "10/14/2014 8:30:29 PM", modified = "1/8/2022 11:13:29 PM",
    trigger = deathless_boss(5, 5, 152)
)

achievement(
    title = "Until Soon. See You in the Past", points = 10,
    description = "Defeat Leatherhead without dying",
    id = 15430, badge = "14900", published = "10/14/2014 8:31:01 PM", modified = "1/8/2022 11:13:35 PM",
    trigger = deathless_boss(7, 7, 155)
)

achievement(
    title = "Scaring the Children", points = 10,
    description = "Defeat Rahzer without dying",
    id = 15431, badge = "14903", published = "10/14/2014 8:31:11 PM", modified = "1/8/2022 11:13:41 PM",
    trigger = deathless_boss(8, 8, 156)
)

achievement(
    title = "Lost Again", points = 25,
    description = "Defeat Shredder without dying",
    id = 15432, badge = "14909", published = "10/14/2014 8:32:12 PM", modified = "1/8/2022 11:13:38 PM",
    trigger = single_player() && never(stage() != 9) &&
              byte(0x000060) == 0 &&         // difficulty?
              byte(0x00090D) == 138 &&       // boss defeated music
              byte(0x00090C) == 0 &&         // boss defeated
              boss_id() == 9 &&
              never(p1_died()) &&
              once(stage_progress() < 0x0E) && // stage loading [there is no pre-boss music on this stage]
              on_normal_without_extra_lives()
)

achievement(
    title = "You Are Too Slow", points = 10,
    description = "Defeat Tokka without dying",
    id = 15433, badge = "14929", published = "10/14/2014 8:32:21 PM", modified = "1/8/2022 11:13:44 PM",
    trigger = deathless_boss(11, 10, 158)
)

achievement(
    title = "Goodbye Krang", points = 25,
    description = "Defeat Krang without dying",
    id = 15434, badge = "14935", published = "10/14/2014 8:32:34 PM", modified = "1/8/2022 11:13:47 PM",
    trigger = deathless_boss(13, 11, 159)
)

achievement(
    title = "No Mercy", points = 25,
    description = "Defeat Super Shredder without dying",
    id = 15435, badge = "14938", published = "10/14/2014 8:32:58 PM", modified = "1/8/2022 11:13:50 PM",
    trigger = deathless_boss(14, 12, 165)
)

achievement(
    title = "Catching a Wave", points = 5,
    description = "Complete the Sea Area without dying in Scene 2",
    id = 15436, badge = "14861", published = "10/14/2014 8:35:33 PM", modified = "1/8/2022 11:13:53 PM",
    trigger = single_player() && once(stage_progress() < 0x0E) && never(stage() != 1) && byte(0x000060) == 0 && 
              never(p1_died()) && trigger_when(stage_complete()) && on_normal_without_extra_lives()
)

achievement(
    title = "Elevator Action", points = 10,
    description = "Complete the Elevator Area without dying or falling off the platform in Scene 7",
    id = 15437, badge = "14921", published = "10/14/2014 8:36:34 PM", modified = "1/8/2022 11:13:58 PM",
    trigger = single_player() && once(stage_progress() < 0x0E) && never(stage() != 10) && byte(0x000060) == 0 && 
              never(p1_died()) && trigger_when(stage_complete()) && on_normal_without_extra_lives()
)

achievement(
    title = "Normal Score", points = 5,
    description = "Score 250000 Points",
    id = 15444, badge = "14997", published = "10/14/2014 8:42:07 PM", modified = "1/8/2022 11:12:29 PM",
    trigger = repeated(100, points_2() >= 37) && points_2() >= 0 && on_normal_without_extra_lives()
)

achievement(
    title = "Super Score", points = 10,
    description = "Score 500000 Points",
    id = 15445, badge = "14999", published = "10/14/2014 8:42:19 PM", modified = "1/8/2022 11:12:32 PM",
    trigger = repeated(100, points_2() >= 80) && points_2() >= 0 && on_normal_without_extra_lives()
)

achievement(
    title = "Ultra Score", points = 10,
    description = "Score 750000 Points",
    id = 15446, badge = "15000", published = "10/14/2014 8:42:40 PM", modified = "1/8/2022 11:12:35 PM",
    trigger = repeated(100, points_2() >= 117) && points_2() >= 0 && on_normal_without_extra_lives()
)

achievement(
    title = "Long Life for Turtles", points = 25,
    description = "Get 10 Lives (Rest=9)",
    id = 15443, badge = "14995", published = "10/14/2014 8:41:51 PM", modified = "1/8/2022 11:12:38 PM",
    trigger = lives() == 9 && prev(lives()) == 8 && on_normal_without_extra_lives()
)


rich_presence_conditional_display(stage() == 16, "Titles")

rich_presence_conditional_display(demo_active() == 1, "{0} is on {1} [Demo]",
    rich_presence_lookup("CharName", p1_char(), CharNameLookup),
    rich_presence_lookup("LevelName", stage(), LevelNameLookup)
)

rich_presence_conditional_display(single_player(), "{0} is on {1} with {2} lives",
    rich_presence_lookup("CharName", p1_char(), CharNameLookup),
    rich_presence_lookup("LevelName", stage(), LevelNameLookup),
    rich_presence_value("Lives", lives())
)

rich_presence_display("{0} and {1} are on {2}",
    rich_presence_lookup("CharName", p1_char(), CharNameLookup),
    rich_presence_lookup("CharName", p2_char(), CharNameLookup),
    rich_presence_lookup("LevelName", stage(), LevelNameLookup)
)

