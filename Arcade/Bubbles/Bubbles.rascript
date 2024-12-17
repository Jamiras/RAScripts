// Bubbles
// #ID = 15121

// MAME puts the RAM from $0000-$BFFF (48KB)
// https://github.com/mamedev/mame/blob/4f10818b9bcfb1afb4149dc8b76186f266a51e8e/src/mame/midway/williams.cpp#L557
// but most of that is shared with videoram. only $9800-$BFFF (10KB) is actual RAM
// https://github.com/mamedev/mame/blob/4f10818b9bcfb1afb4149dc8b76186f266a51e8e/src/mame/midway/williams.cpp#L72-L102

// FBNeo does the same thing, but it exposes that chunk of memory at $4200
// https://github.com/libretro/FBNeo/blob/5ff066cd49bab84394753edfbe553a00ab94cc77/src/burn/drv/pre90s/d_williams.cpp#L1358-L1368
// https://github.com/libretro/FBNeo/blob/5ff066cd49bab84394753edfbe553a00ab94cc77/src/burn/drv/pre90s/d_williams.cpp#L1217-L1222
// so the actual addresses of interest are $DA00-$101FF
// the NVRAM (cmos settings - i.e. lives per credit) are not exposed by FBNeo (Only AllRam is
// exposed, and DrvNVRAM  appears before AllRam)

// $00DA00: b7: Left player enabled (in game)
//          b6: Right player enabled (2P game)
//          b5: Enemies active
//          b3: Has broom
//          b2: Level complete
function between_levels() => bit5(0xDA00) == 0

// $00DA11: [8-bit] Attract/Gameplay flag?
//          0x02: Attract/Game Over.
//          0x03: Gameplay.
function mode() => byte(0x00DA11)
mode_not_in_game = 2
mode_in_game = 3

// $00DA14: active (or last) sound
function sound() => byte(0x00DA14)
sound_periodic_drop = 0x07
sound_collecting_bonus_points = 0x0C
sound_coin_inserted = 0x11
sound_new_game_music = 0x86
sound_alternate_drop1 = 0x95
sound_alternate_drop2 = 0x98
sound_new_level_music = 0xa7
sound_cockroach_warning = 0xb2
sound_collision = 0xbc // when you run into something
sound_explosion = 0xbf // when you explode, or cockroach is killed
sound_game_over = 0xc9
sound_absorb = 0xd4
sound_dun_dun_dun_dun = 0xd9 // earned extra life
sound_greasie_boost = 0xe3
sound_ram_brush = 0xed
sound_drain_ready_to_advance = 0xf2
sound_sink_filling_with_water = 0xfa
sound_water_draining_from_sink = 0xff


// $00DA1D: [8-bit] Extra Man Every setting.
//          Sets how often the player can earn an extra Bubble. This byte (BCD) * 1000 points.
function dip_extra_man() => byte(0x00DA1D)

// $00DA1E: [8-bit] Difficulty x25
//          0x7D (125) = 5 (default).
function dip_difficulty() => byte(0x00DA1E)

// $00DA66: Lives
function lives() => byte(0x00DA66)

// $00DA67: Bubble Size 0C (min) - 18 (max)
function bubble_size() => byte(0x00DA67)

// $00DA69: Sink (Stage)
function stage() => byte(0x00DA69)

// $00DA6C: Remaining Brushes
function remaining_brushes() => byte(0x00DA6C)

// $00DA6D: Remaining Sponges
function remaining_sponges() => byte(0x00DA6D)

// $00DA6E: Remaining Greasies
function remaining_greasies() => byte(0x00DA6E)

// $00DA6F: Remaining Crums
function remaining_crums() => byte(0x00DA6F)

// $00DA70: Remaining Razor Blades
function remaining_razor_blades() => byte(0x00DA70)

// $00DA71: Remaining Ants
function remaining_ants() => byte(0x00DA71)

// $00DBC8: [BCD] Credits
function credits() => bcd(byte(0x00DBC8))

// $00DC00: Drain Color (copied from $DA8A??)
function drain_color() => byte(0xDC00)

// $00DC01: Actor linked list head ($9A01 real address, +4200 to convert each for FBNeo)
//  Actor linked list structure:
//  00-01: B463  next pointer
//  02-03: AC4D  prev pointer
//  04   : 21    x location
//  05   : 84    y location
//  06-07: 3095  
//  08-09: 536E
//  0A-0B: C000
//  0C   : 05    type (2=brush, 4=cockroach, 5=housekeeper, 8=crumb, 9=ant, B=drop)
//  0D   : FF    active (always FF?)
//  0E-0F: 2B12
//  10-11: 2B93
//  12-13: FF70
//  14-15: FF2C
//  16-17: 1004
//  18-19: 3D10
// -------- some records stop here (linked list only advance 1A bytes to next entry)
//  1A-1B: 0002
//  1C:    01
//  1D-1E: 0110 maid points BCD (x10)

// $00DC73: Score - BCD XX000000
function score_XX000000() => byte(0x00DC73)
function score_X0000000() => high4(0x00DC73)
function score_0X000000() => low4(0x00DC73)

// $00DC74: Score - BCD 00XX0000
function score_00XX0000() => byte(0x00DC74)
function score_00X00000() => high4(0x00DC74)
function score_000X0000() => low4(0x00DC74)

// $00DC75: Score - BCD 0000XX00
function score_0000XX00() => byte(0x00DC75)
function score_0000X000() => high4(0x00DC75)
function score_00000X00() => low4(0x00DC75)

// $00DC76: Score - BCD 000000XX
function score_000000X0() => high4(0x00DC76)
function score_0000000X() => low4(0x00DC76)

function score() => bcd(byte(0x00DC73)) * 1000000 + 
                    bcd(byte(0x00DC74)) * 10000 + 
                    bcd(byte(0x00DC75)) * 100 +
                    bcd(byte(0x00DC76))

function score_x100_nobcd() => high4(0x00DC74) * 1000 +
                               low4(0x00DC74) * 100 +
                               high4(0x00DC75) * 10 +
                               low4(0x00DC75)

function player1_lives() => byte(0xdc7d)

// The setting for number of initial lives is at $CC02 (in the NVRAM that's not exposed by
// FBNeo, so we have to ensure the number of lives is 3 when the game starts)
function ensure_default_lives() => disable_when(player1_lives() != 3 && mode() == 3 && prev(mode()) == 2)

// https://arcarc.xmission.com/PDF_Arcade_Williams/Bubbles_Instruction_Manual_(16-3012-101).pdf
// * Extra man every 20000 [seems to default to every 25000]
// * 3 men per credit      [can't find a value that affects this]
// * difficulty 5          [translates to 125]
function default_settings() => dip_extra_man() == 0x25 && 
                               dip_difficulty() == 125 &&
                               ensure_default_lives()
                               
leaderboard(
    id=33462, title = "High Score",
    description = "Highest score on default settings.",
    start  = mode() == mode_not_in_game && 
             prev(mode()) == mode_in_game &&
             lives() == 0 &&
             default_settings(),            
    cancel = always_false(),
    submit = always_true(),
    value = measured(score()),
    format = "VALUE"
)

rich_presence_conditional_display(mode() != 3, "Not playing")

multiplayer_lookup = {
    0: "",
    1: " (2P)"
}

rich_presence_display("Score: {0} | Sink: {1} | Bubbles: {2}{3}",
    rich_presence_value("Value", bcd(byte(0x00DC73)) * 1000000 + bcd(byte(0x00DC74)) * 10000 + bcd(byte(0x00DC75)) * 100 + bcd(byte(0x00DC76))),
    rich_presence_value("Value", stage()),
    rich_presence_value("Value", lives()),
    rich_presence_lookup("Multiplayer", bit6(0x00DA00), multiplayer_lookup)
)

function trigger_in_game() => mode() == mode_in_game && default_settings()
function complete_level() => sound() == sound_collecting_bonus_points

// https://www.arcade-history.com/?n=bubbles&page=detail&id=347
// * Crumb: 100 points.
// * Ants: 150 points.
// * Greasie: 200 points (need broom?).
// * Cleaning Lady: 500 points (will increase as she collects items).
// * Roach: 1,000 points (can be conquered if you collect the Cleaning Lady and gain her sweeping skill to bump it into the drain).
// * Dive Ahead Bonus: x1000 points per bubble enlargement. Advance two levels.
// * End Sink Bonus: x250 points per bubble enlargement. Advance one level.
// * x2 points very close to the drain.


achievement("A Leaky Faucet", "Score 20000 points", 5,
    trigger = trigger_in_game() && score_00XX0000() >= 2 
)

achievement("A Light Trickle", "Score 40000 points", 5,
    trigger = trigger_in_game() && score_00XX0000() >= 4
)

achievement("Full Flow", "Score 60000 points", 10,
    trigger = trigger_in_game() && score_00XX0000() >= 6
)

achievement("From the Fire Hose", "Score 100000 points", 25,
    trigger = trigger_in_game() && score_00XX0000() >= 0x10
)

achievement("About to Burst Your Bubble", "Reach the largest bubble size", 2,
    trigger = trigger_in_game() && bubble_size() == 0x18
)

achievement("Everything But the Kitchen Sink", "Score 25000 points before level 5", 10,

    trigger = trigger_in_game() &&
              (score_00XX0000() > 2 || (score_00XX0000() == 2 && score_0000XX00() > 0x50)) &&
              stage() < 5
)

achievement("Down the Drain", "Reach sink 5", 5,
    trigger = trigger_in_game() && stage() >= 5
)

achievement("Up the Water Spout", "Reach sink 10", 10,
    trigger = trigger_in_game() && stage() >= 10
)

achievement("A Whirlpool of Fun", "Reach sink 15", 25,
    trigger = trigger_in_game() && stage() >= 15
)

// point value kept on actor linked list!
//achievement("Tip Your Housekeeper", "Collect a cleaning lady worth at least 1000 points", 3,
//    trigger = trigger_in_game() 
//)

// cockroach presence tracked on actor linked list!
// cockroach is worth 1000 points, collision sound plays while score increases
// unless score crosses a life boundary, in which case the extra life sound is given priority.
// can't watch for <= 0x2000 because BCD carryover would by 0x10000 (0x9900 -> 0x10900 = 0x7000!)
// additionally, per ticket 64538, the rollover at 50k also raises the free life sound, so we can't
// rely on that combination. instead, watch for the brush disappearing, as the only ways to lose
// a brush are to kill a cockroach or complete the level.
// unfortunately, the brush flag sometimes updates a frame before the score, so we have to capture
// it being lost, but only for a couple frames.
function lost_broom() => bit3(0xDA00) < prev(bit3(0xDA00))

achievement("Swatted", "Kill a cockroach", 2,
    trigger = trigger_in_game() && 
              lost_broom() &&
              never(between_levels()) &&       // reset when player dies
              never(stage() != prev(stage()))  // reset between levels
)

achievement("Squashed", "Kill two cockroaches in a single level without dying", 5,
    trigger = trigger_in_game() &&
              repeated(2, lost_broom()) &&
              never(between_levels()) &&       // reset when player dies
              never(stage() != prev(stage()))  // reset between levels
)

// brush presence tracked on actor linked list!
// brush kill is worth 2000 points
function kill_brush() => (dword_be(0xdc73) - prev(dword_be(0xdc73)) >= 0x2000 &&
                          // this goes up when points are awarded for a brush kill
                          byte(0xDA9E) > prev(byte(0xDA9E)) &&
                          never(between_levels()))

achievement("Get a Plunger", "Push a brush or sponge into the drain", 5,
    trigger = trigger_in_game() && 
              kill_brush()
)

// brush presence tracked on actor linked list!
achievement("Better Call a Plumber",
            "Push three brushes and/or sponges into the drain in a single level without dying", 10,
    trigger = trigger_in_game() && 
              repeated(3, kill_brush())
)

achievement("All Washed Up", "Complete a level by cleaning all the grime", 2,
    trigger = trigger_in_game() && 
              complete_level() &&
              remaining_greasies() == 0 &&
              remaining_crums() == 0 &&
              remaining_ants() == 0
)

// ants are worth 150 points. watch for points going up in a frame where number of ants
// goes down. if we won't watch for points, it'll also capture when the cleaning lady
// gets one, or one falls into the drain.
achievement("Anteater", "Absorb 8 ants in a single level without dying", 4,
    trigger = trigger_in_game() &&
              measured(repeated(8, score_0000XX00() != prev(score_0000XX00()) &&
                                   remaining_ants() < prev(remaining_ants()))) &&
              never(between_levels())
)

// cockroach presence tracked on actor linked list!
// this watches for three cockroaches to enter the level, and subtracts a cockroach any time
// the player loses the broom (assuming they killed a cockroach with it)
achievement("They Scatter When the Lights Go On", 
            "Dodge cockroaches until there are three on the screen", 5,
    trigger = trigger_in_game() && 
              never(lives() < prev(lives())) &&
              never(between_levels()) &&
              // drain flashes red three times before cockroach appears
              tally(3 * 3, drain_color() != 7 && prev(drain_color()) == 7, 
                    deduct(lost_broom()),
                    deduct(lost_broom()),
                    deduct(lost_broom())               
                   ) &&
              sound() != sound_cockroach_warning // wait until it actually appears
)

achievement("Like a Soap Opera", "Score 25000 points to earn an extra life before dying", 5,
    trigger = trigger_in_game() && lives() >= 3 && prev(lives()) < 3 &&
              score_XX000000() == 0 && 
              score_00XX0000() < 5 &&
              score_00XX0000() >= 2 // only allow at 25k
)

