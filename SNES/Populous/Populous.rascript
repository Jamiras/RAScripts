// Populous
// #ID=1104
// md5: 6f9294b5f83d777def17a801bf02df01 (U)
// md5: 4c1f4e4775478cd53d34269e4f242855 (E)
// md5: 63e862d28c24c6e4b261897172bd5e68 (J)

// previous md5s (unlinked):
// md5: 3b8202c6ab15d1f7273969ab923baa2c
// md5: 6949139d6a6fd6cf876020594411d472
// md5: bcaadec087fcb3c18341b77b3facca55
// md5: eab17febf8456e4a6a10b949eee03c02

// passwords: http://codebook.potchgult.com/POPULOUS%20(snes).html
// terrain changes every five levels: 0-4=grass, 5-9=desert, 10-14=snow, 15-19=lava, 20-24=bit

//                      Build (None, People, Towns, UpOnly)
//                      |Swamps (Shallow, Deep); shallow disappear after first kill
//                      ||Water (Harmful, Fatal)
// Password Level Type  ||| Pop Skills (you/him)
// |            | |     ||| |   | 
// GENESIS      1 grss                        mortal
// S1DW2L4R     5 dsrt 
// SH2C42LL    30 franc Tsh 3/3 ESKV/V
// H5B5CD5R    68 cake  Tsh 1/3 ESKV/ESV      mortal
// K2LL3M4    181 cake  Tsh 2/4 E/-           immortal - amazingly slow - only skill is earthquake - not even armaggedon
// Q1ZC4H5L4  203 lava  Tsh 2/4 SKV/KF        eternal
// B3G3T      209 bit   Tsh 5/2 ESKVF/SK      
// J5S2N5ND   244 silly Tsh 5/3 K/-           eternal
// B3G5G52CK  401 grss  Tsh 2/1 SKVF/ESKVF
// B1D53TT	  462 pig   Tsh 30/5 ESKF/SKVF
// B2L41H5L4  586 franc Tsh 2/4 E/E
// B3RL5P5RD  603 pig   TBh 1/1 EKVF/SK
// SW12ND5R	  632 silly Tsh 5/5 -/-
// S1D53T5LD	677 snow  TBh 5/5 S/S
// E51Y2LL    854 japan Tsh 1/13 ESKVF/EK
// J5S1J5B    980 piglet Tsh 1/13 X/X 
// SC53SB1R   983 piglet Ush 5/5 K/SK
// H1MS5D5RD  986 desert Ush 1/15 ESKF/ESKVF  eternal king
// V4RY5ZL2N  988 desert Ush 1/13 ESKF/ESKVF

// K2LLTB1R	World #405 (Bit Plains)
// B2L41H5L4	World #586 (Francais)
// B2NGBP1L	World #712 (Rock & Lava)
// E51L5PT5RY	World #890 (Desert)


//  =>Stage Select: During a game in conquest mode, press [START] to pause the
//    game (the ZZZ icon lights up). While the cursor is on the map screen, hold
//    [L] and press A. Now, hold [R] and press Y B X A [SELECT]. Highlight the
//    Armageddon (skull & crossbones) icon and press A. The icon should remain
//    grey. Click on the World icon to enter Game Set Up, move to Conquest and
//    press A. Now, use X and B to choose your world.
//  ->Full Power (doesn't seem to work): At any time, press A then B, hold L and press [R]
//    A B X [SELECT]. Move to the SWAMP icon. If it hasn't turned red, you now
//    have now have full power.

// setting $8E to 0 immediately ends the match. winner determined by populations

// $007C is actually level * 5 - not sure why - 0xFFFF for custom scenario
function current_level() => word(0x007C) / 5

// $0085 or $008C will be 1 during the game
function is_title_screen() => word(0x0085) == 0

function current_map_cursor() => byte(0x2202)
cursor_cross = 4
cursor_reticle = 5
cursor_swamp = 2
cursor_papal_magnet = 0xEE

function cursor_location() => high4(0x00C3)
cursor_location_view = 0
cursor_location_commands = 8
cursor_location_powers = 12

function selected_command() => byte(0x00C4)
command_view_knights = 0x30
command_view_battles = 0x31
command_gather_then_settle = 0x32
command_settle = 0x33
command_raise_lower_land = 0x34
command_place_shield = 0x35
command_view_shield_bearer = 0x39
command_fight_then_settle = 0x3A
command_go_to_papal_magnet = 0x3B
command_place_papal_magnet = 0x3C
command_view_papal_magnet = 0x42

function settle_mode() => byte(0x010B)
settle_mode_go_to_papal_magent = 0
settle_mode_settle = 1
settle_mode_gather_then_settle = 2
settle_mode_fight_then_settle = 3

function selected_power() => byte(0x00C5)
power_earthquake = 0x28
power_swamp = 0x20
power_knight = 0x18
power_volcano = 0x10
power_flood = 0x19
power_armageddon = 0x21
power_isometric = 0x1a
power_pause = 0x12
power_music = 0x11
power_sfx = 0x08
power_game_setup = 0x09
power_balance = 0x00

function is_player_vs_cpu() => byte(0x011E) == 0
function is_cpu_vs_cpu() => byte(0x011E) == 1
function is_water_fatal() => bit0(0x0083) == 1
function is_swamp_bottomless() => bit1(0x0083) == 1
function is_build_disabled() => bit2(0x0083) == 1
function is_build_up_only() => bit3(0x0083) == 1
function is_build_near_towns_only() => bit4(0x0083) == 1

function is_game_summary_screen() => byte(0x0068) == 0xFC
function game_summary_cursor_location() => word(0x2200)
function is_game_won() => is_game_summary_screen() && game_summary_cursor_location() == 0xA14A
function is_game_lost() => is_game_summary_screen() && game_summary_cursor_location() == 0xA13A

function trigger_game_started() => word(0x0080) != 0
function trigger_in_game() => !is_game_summary_screen() && is_player_vs_cpu() && trigger_game_started()
function trigger_game_from_start() => once(word(0x0080) < 20)
function trigger_win_game() => is_game_won() && never(is_cpu_vs_cpu()) && trigger_game_from_start() && trigger_game_started()
function trigger_during_game() => trigger_game_from_start() && trigger_game_started() && never(is_cpu_vs_cpu())

function current_score() => dword(0x0078)
function current_mana() => dword(0x0114)

// ===== Spells (6x 30) =====
//  2 - Summon an earthquake (2500 mana) [+25pts]
//  3 - Drown an enemy in a swamp (5000 mana) [+50pts]
//  4 - Convert your leader to a knight (7500 mana) [+75pts]
//  5 - Summon a volcano (10000 mana) [+100pts]
//  7 - Summon a flood (40000 mana) [+250pts]
//  9 - Invoke Armageddon (80000 mana) [+5000pts]

function spell_being_cast() => byte(0x0118)
spell_raise_land = 1
spell_lower_land = 2
spell_earthquake = 3
spell_swamp = 4
spell_papal_magnet = 5
spell_volcano = 6
spell_knight = 14 // also flood and armageddon

function spell_being_cast2() => byte(0x0182)
spell2_raise_land = 0
spell2_lower_land = 2
spell2_flood = 1
spell2_knight = 2
spell2_volcano = 4
spell2_earthquake = 16
spell2_swamp = 0
spell2_papal_magnet = 0
spell2_armageddon = 0
spell2_swamp_activate = 8

// there doesn't seem to be any reliable way to detect when a spell is cast. $0118 and $0182
// indicate when a spell is trying to be cast, but both go back to 0 when the spell is actually cast.
// the most reliable thing I've found so far is that each spell takes mana and gives points.
// watch for mana consumption and score increase, but only in the frame immediately following the spell indicator
function trigger_cast(spell, count) {
    if (count == 1) {
        return current_score() > prev(current_score()) &&
               current_mana() < prev(current_mana()) &&
               never(prev(spell_being_cast()) != spell)
    } else {
        return repeated(count, current_score() > prev(current_score())) &&
               repeated(count, current_mana() < prev(current_mana())) &&
               unless(prev(spell_being_cast()) != spell)    
    }
}

function trigger_cast_earthquake(count) => trigger_cast(spell_earthquake, count)
achievement(title = "And the Ground Began to Shake", description = "Cast the earthquake spell", points = 2,
            trigger = trigger_in_game() && trigger_cast_earthquake(1))

function trigger_cast_swamp() => trigger_cast(spell_swamp, 1)
achievement(title = "Quicker than Quicksand", description = "Cast the swamp spell", points = 3,
            trigger = trigger_in_game() && trigger_cast_swamp())

function trigger_cast_knight(count) => trigger_cast(spell_knight, count) && once(prev(spell_being_cast2()) == spell2_knight)
achievement(title = "The Mighty Warrior", description = "Cast the knight spell", points = 4,
            trigger = trigger_in_game() && trigger_cast_knight(1))

function trigger_cast_volcano(count) => trigger_cast(spell_volcano, count)
achievement(title = "Instant Mountain", description = "Cast the volcano spell", points = 5,
            trigger = trigger_in_game() && trigger_cast_volcano(1))

function trigger_cast_flood(count) => trigger_cast(spell_knight, count) && once(prev(spell_being_cast2()) == spell2_flood)
achievement(title = "Strange Tides", description = "Cast the flood spell", points = 7,
            trigger = trigger_in_game() && trigger_cast_flood(1))

// armageddon => $000C => 00C0 => 01C1 (buildings disappear) => 01FA (start moving to center)
function trigger_cast_armageddon() => trigger_cast(spell_knight, 1) && repeated(2, prev(spell_being_cast2()) == spell2_armageddon)
achievement(title = "There Can Be Only One", description = "Cast the armageddon spell", points = 9,
            trigger = trigger_in_game() && trigger_cast_armageddon())

// ===== Terrain (10x 70) =====
//  5 - - Win a game in Grassy Plains
//  6 - - Win a game in Desert
//  8 - - Win a game in Snow & Ice
//  7 - - Win a game in Rock & Lava
//  7 - - Win a game in Japanesque
//  6 - - Win a game in Francaise
//  8 - - Win a game in Silly Land
//  7 - - Win a game in Bit Plains
//  7 - - Win a game in Cake Land
//  9 - - Win a game in Piglet World

function current_landscape() => byte(0x016C)
landscape_grassy_plains = 0
landscape_desert = 1
landscape_snow_and_ice = 2
landscape_rock_and_lava = 3
landscape_bit_land = 4
landscape_piglet_world = 5
landscape_cake_land = 6
landscape_silly_land = 7
landscape_francaise = 8
landscape_japanesque = 9

landscapes = {
    landscape_grassy_plains: "Grassy Plains",
    landscape_desert: "Desert",
    landscape_snow_and_ice: "Snow and Ice",
    landscape_rock_and_lava: "Rock and Lava",
    landscape_bit_land: "Bit Plains",
    landscape_piglet_world: "Piglet World",
    landscape_cake_land: "Cake Land",
    landscape_silly_land: "Silly Land",
    landscape_francaise: "Francaise",
    landscape_japanesque: "Japanesque",
}

function landscape_achievement(landscape, points) {
    achievement(title = landscapes[landscape] + " Conquerer", 
                description = "Conquer a " + landscapes[landscape] + " world", points = points,
                trigger = trigger_win_game() && never(current_landscape() != landscape))
}

landscape_achievement(landscape_grassy_plains, 5)
landscape_achievement(landscape_desert, 6)
landscape_achievement(landscape_snow_and_ice, 8)
landscape_achievement(landscape_rock_and_lava, 7)
landscape_achievement(landscape_japanesque, 7)
landscape_achievement(landscape_francaise, 6)
landscape_achievement(landscape_silly_land, 8)
landscape_achievement(landscape_bit_land, 7)
landscape_achievement(landscape_cake_land, 7)
landscape_achievement(landscape_piglet_world, 9)

// ===== Progression (8x 110) =====
//  5 - - Complete Genesis (0)
//  7 - - Complete a world (1-99)
//  9 - - Complete a world (100-199)
// 11 - - Complete a world (200-399)
// 13 - - Complete a world (400-599)
// 15 - - Complete a world (600-799)
// 20 - - Complete a world (800-987)
// 30 - - Complete the final world (988)

// titles come every 100 levels, and are based on the _next_ level you're going to play.
//   0- 99 = mortal
// 100-199 = immortal
// 200-299 = eternal
// 300-399 = deva
// 400-499 = greater being
// 500-599 = deity
// 600-699 = greater deity
// 700-799 = mortal king
// 800-899 = greater king
// 900-999 = eternal king

function level_range_achievement(min_level, max_level, points, title, description) {
    achievement(title = title, description = description, points = points,
                trigger = trigger_win_game() && current_level() >= min_level && current_level() <= max_level)
}
level_range_achievement(  0,   0,  5, "In the Beginning", "Conquer 'Genesis' (battle ID 0)")
level_range_achievement(  1,  99,  7, "Well Done Mortal", "Conquer a world with a battle ID between 1 and 99")
level_range_achievement(100, 199,  9, "Well Done Immortal", "Conquer a world with a battle ID between 100 and 199")
level_range_achievement(200, 399, 11, "Well Done Eternal", "Conquer a world with a battle ID between 200 and 399")
level_range_achievement(400, 599, 13, "Well Done Greater Being", "Conquer a world with a battle ID between 400 and 599")
level_range_achievement(600, 799, 15, "Well Done Greater Diety", "Conquer a world with a battle ID between 600 and 799")
level_range_achievement(800, 987, 20, "Well Done Greater King", "Conquer a world with a battle ID between 800 and 987")
level_range_achievement(988, 988, 30, "You Have Conquered Evil", "Conquer 'V4RY5ZL2N' (battle ID 988)")

// ===== Challenges (15x 190) =====
//  5 - - Score at least 90000 points
// 10 - - Score at least 120000 points
// 20 - - Score at least 150000 points
//  5 - - Have at least 25 castles
// 10 - - Have at least 50 castles
//  5 - - Win at least 25 battles
// 10 - - Win at least 100 battles
// 15 - - Win at least 300 battles
// 30 - - Conquer a world without any battles
// 30 - - Conquer a world without casting anything except raise/lower land and papal magnet
// 25 - - Conquer a world where building land is disabled
//  5 - - Cast flood on a world with fatal water
//  5 - - Cast earthquake 50 times in a single world
//  5 - - Cast knight 10 times in a single world
// 10 - - Cast volcano 30 times in a single world

// score (5 digit) => $034D (6 digit) => $034C
achievement(title = "Diety in Training", description = "Conquer a world with at least 90,000 points", points = 5,
            trigger = trigger_win_game() && ((low4(0x034C) >= 1) || (low4(0x034D) >= 9)))
achievement(title = "Apprentice Diety", description = "Conquer a world with at least 120,000 points", points = 10,
            trigger = trigger_win_game() && ((low4(0x034C) == 1 && low4(0x034D) >= 2) || low4(0x034C) > 1))
achievement(title = "Master Diety", description = "Conquer a world with at least 150,000 points", points = 20,
            trigger = trigger_win_game() && ((low4(0x034C) == 1 && low4(0x034D) >= 5) || low4(0x034C) > 1))
            
function num_castles() => byte(0x0126)
achievement(title = "Urban Development", description = "Conquer a world while having at least 25 castles", points = 5,
            trigger = trigger_win_game() && num_castles() >= 25)
achievement(title = "Sprawling Kingdom", description = "Conquer a world while having at least 50 castles", points = 10,
            trigger = trigger_win_game() && num_castles() >= 50)

function num_battles() => word(0x008A)
achievement(title = "Feudal Dispute", description = "Conquer a world with at least 25 battles", points = 5,
            trigger = trigger_win_game() && num_battles() >= 25)
achievement(title = "Warring Tribes", description = "Conquer a world with at least 100 battles", points = 10,
            trigger = trigger_win_game() && num_battles() >= 100)
achievement(title = "The Army Victorious", description = "Conquer a world with at least 300 battles", points = 15,
            trigger = trigger_win_game() && num_battles() >= 300)
achievement(title = "Divine Wrath", description = "Conquer a world without any battles", points = 30,
            trigger = trigger_win_game() && num_battles() == 0)

// earthquake, swamp, knight, volcano, floor, and armageddon all give points. this achievement works by turning itself
// off while the user hasn't earned any points (it seems to start at 5x number of peons, and earthquake is worth 25).
// since you can start a world with up to 9 followers, that means 45 is the lowest number we can safely restrict the
// score to. if the score goes above 45 and they're not on the summary screen (won game), then reset the game_from_start 
// flag so it won't trigger when they do win. for worlds with less than 5 followers, this means it's safe to cast 
// earthquake once (shhh).
// put the PauseIf in an alt group so it doesn't prevent the once() in trigger_game_from_start()
achievement(title = "Trust Thy Followers", points = 30,
            description = "Conquer a world without using any divine powers other than raise+lower land and papal magnet",
            trigger = trigger_game_from_start() && trigger_game_started() && never(is_cpu_vs_cpu()) &&
                      (is_game_won() && (unless(current_score() <= 45) && never(!is_game_summary_screen())) || 
                       (byte(0) != byte(0))))
                      

achievement(title = "Lowland Cleansing", description = "Cast flood on a world where 'water is fatal'", points = 5,
            trigger = trigger_in_game() && trigger_cast_flood(1) && is_water_fatal())
                      
achievement(title = "An Unchanging World", description = "Conquer a world where you 'cannot build'", points = 25,
            trigger = trigger_win_game() && never(!is_build_disabled()))
// sneaky hackery: a core-level PauseIf prevents the ResetIfs from triggering, but alt-level PauseIfs don't.
// use a dummy OR condition that will never be true to move the PauseIfs into an alt group.
achievement(title = "Aftershocks", description = "Cast the earthquake spell at least thirty times in a single world", points = 5,
            trigger = trigger_during_game() && never(current_score() == 0) && 
                     (trigger_cast_earthquake(30) || byte(0) != byte(0)))
achievement(title = "I Dub Thee Sir Decem", description = "Create at least ten knights in a single world", points = 5,
            trigger = trigger_during_game() && never(current_score() == 0) && 
                     (trigger_cast_knight(10) || byte(0) != byte(0)))
//achievement(title = "Global Warming", description = "Cast the flood spell at least three times in a single world", points = 10,
//            trigger = trigger_during_game() && never(current_score() == 0) && 
//                     (trigger_cast_flood(3) || byte(0) != byte(0)))
achievement(title = "A New Mountain Range", description = "Cast the volcano spell at least thirty times in a single world", points = 10,
            trigger = trigger_during_game() && never(current_score() == 0) && 
                     (trigger_cast_volcano(30) || byte(0) != byte(0)))

// TODO: eliminate a plague?
// TODO: drown X enemies in swamps - how to tell?
// TODO: spot a ladybug?

function level_leaderboard(level, name) {
    // this is currently set up to start on display of the summary screen with the cursor in the victory location
    // the cancel condition is the cursor in the fail location, which will never happen once the start condition
    // is met. ideally, we'd start with trigger_game_from_start(), but we don't want the score displaying during
    // the level because it obscures part of the UI and only shows the value from casting spells until victory.
    leaderboard(title = name, description = "Highest score on " + name,
                start = is_game_won() && current_level() == level * 5 && 
                        byte(0x0060) == 1,                                 // level overview - not master display
                cancel = game_summary_cursor_location() == 0xA13A,
                submit = byte(0x0020) == 0 && prev(byte(0x0020)) == 1,     // click new game
                value  = current_score())
}

level_leaderboard(0, "Genesis")

verbs = {
    0: "Playing",
    1: "Watching"
}

rich_presence_conditional_display(is_title_screen(), "Title Screen")

rich_presence_conditional_display(!trigger_game_started() && is_game_summary_screen(), "Starting a game")

rich_presence_conditional_display(word(0x007C) == 0xFFFF, "{0} Custom Map in {1}",
    rich_presence_lookup("Verb", bit0(0x011E), verbs),
    rich_presence_lookup("Landscape", current_landscape(), landscapes)
)
rich_presence_display("Playing Battle {0} in {1}", 
    rich_presence_value("Battle", current_level()),
    rich_presence_lookup("Landscape", current_landscape(), landscapes)
)
