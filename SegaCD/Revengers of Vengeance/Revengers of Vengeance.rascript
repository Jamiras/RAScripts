// Revengers of Vengeance
// #ID = 25914

// manual: https://segaretro.org/images/0/05/Revengers_mcd_us_manual.pdf

// Genesis Plus GX: "not enough blocks of internal backup ram"
// * At the Press Start BIOS screen, press B (A), then choose Option, press B, select Format Sega CD
//   - Note. This will delete any save data on the Sega CD, so you might want to copy them to the catridge RAM first.

// password menu: at title screen press A+Z+Y (X+Y+R1)
// * ARC = unknown
// * ASP = aspect ratio test screen
// * AZY = play Black Ball Assault 2
// * BHA = Black Hole Assault cheat codes
// * CM1 = Black Hole Assault ad
// * CM2 = IIIrd World War ad
// * CM3 = Heavy Nova ad
// * KOF = disable shadows
// * KON = enable shadows
// * MTK = enable invincibility
// * PAD = controller test screen
// * SET = view concept art
// * TIM = allow infinite time
// * VIS = view intros and endings

// MTK and ARC are previously undocumented, though I found a reference to MTK here:
// - https://www.sega-16forums.com/forum/site-content/latest-review/1276-revengers-of-vengeance?p=749797#post749797

function current_mode() => byte(0x18ffc)
mode_tournament_1P = 1
mode_tournament_2P = 2
mode_quest = 3
mode_guild_quest = 4
mode_arena = 5
mode_ending = 6 // JP only

function current_screen() => byte(0x1581c)
screen_bios = 0x000f
screen_sega = 0x0010
screen_battle_vs = 0x01a3 // also several other 0x01XX values while stage is loading
screen_titles = 0x01a8
screen_battle_results = 0x01be
screen_battle_post_results = 0x01c9
screen_vis_list = 0x0356
screen_title = 0x08f2 // also map
screen_character_select = 0x0bcd
screen_map = 0x0bcd
screen_town = 0x0ef6
screen_bar = 0x11e7
screen_guild = 0x138b // also gym
screen_shop = 0x152f // all three shops, fortune teller, and town hall
screen_character_select = 0x16a8 // also password screen and enter initials screen
screen_battle_organa = 0x1800 // 185d/1869
screen_battle_logan = 0x19f3
screen_battle_fucida = 0x1c6d
screen_battle_sara = 0x1dea
screen_battle_magnus = 0x1fe3
screen_battle_barko = 0x2263
screen_battle_daktar = 0x243f
screen_battle_algos = 0x25a8
screen_battle_talon = 0x2720
screen_battle_psybart = 0x28e4
screen_battle_jado = 0x2acf
screen_battle_venum = 0x2cff // 2c5e
screen_guild_quest_wizards_staff = 0x2fe0
screen_guild_quest = 0x2fe9
screen_credits = 0x31b4
screen_intro_main = 0x3465
screen_intro_organa = 0x3596
screen_ending_organa = 0x366e
screen_intro_logan = 0x36f0
screen_ending_logan = 0x37c4
screen_intro_fuchida = 0x38ac
screen_ending_fuchida = 0x3967
screen_intro_sara = 0x3a5e
screen_ending_sara = 0x3b78
screen_intro_magnus = 0x3c55
screen_ending_magnus = 0x3cb7
screen_intro_barko = 0x3d6a
screen_ending_barko = 0x3e17
screen_intro_daktar = 0x3e6f
screen_ending_daktar = 0x3ec1
screen_intro_algos = 0x3f62
screen_ending_algos = 0x405a
screen_intro_talon = 0x4109
screen_ending_talon = 0x416c
screen_intro_psybart = 0x41b5
screen_ending_psybart = 0x421e

// because the low byte of current_screen() has some variance, only check the high byte for logic.
// there's one conflict - barko and daktar's endings - but we can also enforce selected character for those.
function current_screen_high() => byte(0x1581d)
function current_screen_is(screen) => current_screen_high() == screen / 256
function current_screen_range(screen_low, screen_high) => current_screen_high() >= screen_low / 256 &&
                                                          current_screen_high() <= screen_high / 256

function in_quest_battle() => current_screen_range(screen_battle_organa, screen_battle_venum)
function in_quest_town() => current_screen_range(screen_town, screen_shop)
function in_quest_ending() => current_screen_range(screen_ending_sara, screen_ending_psybart)

// current_mode sometimes changes from mode_quest to mode_tournament_2P or 0 - particuarly in the frames
// where I'm trying to capture bitflags changing. to work around that, keep a hitcount for being in quest mode
// and clear the hitcount when returning to the title screen.
function in_quest() => once(current_mode() == mode_quest && never(current_screen_is(screen_title)))

function current_guild_quest() => byte(0x18fe4)
guild_quest_wizards_staff = 0
guild_quest_castle_of_the_ice_wraith = 1
guild_quest_lava_dragon = 2
guild_quest_underground_maze = 3
guild_quest_manor_of_traps = 4

guild_quests = {
    guild_quest_castle_of_the_ice_wraith: "Ice Wraith", // 1000G
    guild_quest_underground_maze: "Underground Maze", // 2000G
    guild_quest_wizards_staff: "Staff Demon", // 1000G
    guild_quest_manor_of_traps: "Manor of Traps", // 2000G
    guild_quest_lava_dragon: "Lava Dragon", // 0G
}

function character_p1() => byte(0x18019)
function character_p2() => byte(0x181a9)
function character_quest() => byte(0x18f62)
character_organa = 0
character_logan = 1
character_fuchida = 2
character_sara = 3
character_magnus = 4
character_barko = 5
character_daktar = 6
character_algos = 7
character_talon = 8
character_psybart = 9
character_jado = 10
character_venum = 11

characters = {
    character_organa: "Organa",
    character_logan: "Logan",
    character_fuchida: "Fuchida",
    character_sara: "Sara",
    character_magnus: "Magnus",
    character_barko: "Barko",
    character_daktar: "Daktar",
    character_algos: "Algos",
    character_talon: "Talon",
    character_psybart: "Psybart",
    character_jado: "Jado",
    character_venum: "Venum",
}
character_fallback = "Choosing character"

function character_level() => word(0x18f22)
function character_gold() => word(0x18f3e) * 65536 + word(0x18f40)

function cheating() => byte(0x18eec) != 0 // infinite health code MTK
function current_cheats() => (byte(0x18eec) / byte(0x18eec))
cheats = {
    0: "",
    1: "*",
}

function quest_started() => character_level() < 500

function current_difficulty() => byte(0x18e01)
difficulty_easy = 0
difficulty_normal = 1
difficulty_difficult = 2
difficulty_arcade = 3

difficulties = {
    difficulty_easy: "easy",
    difficulty_normal: "normal",
    difficulty_difficult: "difficult",
    difficulty_arcade: "arcade",
}

// quest character isn't initialized until after a name is chosen
rich_presence_conditional_display(current_mode() == mode_quest && !quest_started(), 
    "{0} | Quest mode ({1}) | Lv.1 | 500 gold",
    rich_presence_lookup("Character", character_p1(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

// quest battle uses same data as tournament mode
rich_presence_conditional_display(current_mode() == mode_quest && in_quest_battle(), 
    "{0} vs {1} | Quest mode ({2}{3}) | Lv.{4} | {5} gold",
    rich_presence_lookup("Character", character_p1(), characters, fallback=character_fallback),
    rich_presence_lookup("Character", character_p2(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

rich_presence_conditional_display(current_mode() == mode_quest && in_quest_town(), 
    "{0} in town | Quest mode ({1}{2}) | Lv.{3} | {4} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

rich_presence_conditional_display(current_mode() == mode_guild_quest, 
    "{0} vs {1} | Quest mode ({2}{3}) | Lv.{4} | {5} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Quest", current_guild_quest(), guild_quests),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

// other quest states - battle results/map/etc
rich_presence_conditional_display(current_mode() == mode_quest, 
    "{0} | Quest mode ({1}{2}) | Lv.{3} | {4} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

// weird hiccup where current_mode sometimes changes to mode_tournament_2P while processing results or during the ending
rich_presence_conditional_display(in_quest() && never(current_mode() > mode_guild_quest),
    "{0} | Quest mode ({1}{2}) | Lv.{3} | {4} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

rich_presence_conditional_display(current_mode() == mode_tournament_1P, "{0} vs {1} | Tournament ({2}{3}) round {4}",
    rich_presence_lookup("Character", character_p1(), characters, fallback=character_fallback),
    rich_presence_lookup("Character", character_p2(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats),
    rich_presence_value("Stage", character_p2() + 1)
)

rich_presence_conditional_display(current_mode() == mode_tournament_2P, "{0} vs {1} | 2P Tournament",
    rich_presence_lookup("Character", character_p1(), characters, fallback=character_fallback),
    rich_presence_lookup("Character", character_p2(), characters, fallback=character_fallback),
    rich_presence_value("Stage", character_p2())
)

rich_presence_conditional_display(current_mode() == mode_arena, "Arena of Death")

rich_presence_conditional_display(current_screen_is(screen_credits) && character_level() < 100, 
    "{0} victorious | Quest mode ({1}) | Lv.{2} | {3} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

rich_presence_conditional_display(current_mode() == mode_ending, 
    "{0} victorious | Quest mode ({1}) | Lv.{2} | {3} gold",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_value("Level", character_level()),
    rich_presence_value("Gold", character_gold())
)

rich_presence_conditional_display(current_screen_is(screen_credits), 
    "{0} victorious | Tournament ({1}{2})",
    rich_presence_lookup("Character", character_quest(), characters, fallback=character_fallback),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_lookup("Cheats", current_cheats(), cheats)
)

rich_presence_display("Titles")

// ================================

function current_health_p1() => word(0x180a0)
function current_health_p2() => word(0x18230)
function venum_beaten() => bit3(0x18f6b) == 1

// read the book (5)
function book_read() => byte(0x18f42) == 1
achievement("The Power of Words", "Dispel the magic protecting Venum's castle", 5, type="progression",
    trigger = in_quest() && !cheating() &&
              book_read() && !prev(book_read())
)

achievement("Experience the Death", "Defeat Jado in quest mode", 5, type="progression",
    trigger = in_quest() && !cheating() &&
              bit2(0x18f6b) == 1 &&
              prev(bit2(0x18f6b)) == 0
)

// beat story mode with each character (8x10)
function character_ending_achievement(title, description, character, screen, id=0, badge="0")
{
    achievement(title, description, 10, type="win_condition", id=id, badge=badge,
        trigger = in_quest() && !cheating() &&
                  venum_beaten() &&
                  character_quest() == character &&
                  prev(current_screen_high()) == screen / 256 &&
                  current_screen_high() != screen / 256
    )    
}

// Organa's projectile: Hold Back, Forward, A
character_ending_achievement("Furry Vengeance", 
                             "Complete quest mode as Organa", character_organa, screen_ending_organa,
                             id=527607, badge="598392")

// Logan has no projectile. Use Forward+C for quick hits. Occassionally, he'll flip the enemy for big damage.
character_ending_achievement("Go In Peace", 
                             "Complete quest mode as Logan", character_logan, screen_ending_logan,
                             id=527608, badge="598393")

// Fuchida's projectile: Down, Down+Forward, Forward, B
character_ending_achievement("This Time It's a Treasure Hunt", 
                             "Complete quest mode as Fuchida", character_fuchida, screen_ending_fuchida,
                             id=527609, badge="598394")

// Sara's projectile: Down, Forward, A
character_ending_achievement("There is Nothing More I Can Teach You", 
                             "Complete quest mode as Sara", character_sara, screen_ending_sara,
                             id=527610, badge="598395")

// Magnus has no projectile. Use Forward+B for quick attacks and the occassional head squeeze. When close, use
// forward and C for a body slam and good damage.
character_ending_achievement("The Curse is Broken", 
                             "Complete quest mode as Magnus", character_magnus, screen_ending_magnus,
                             id=527611, badge="598396")

// Barko has no projectile. He doesn't have any "good" moves. After day 10, repeat days 6-10 before
// attempting Daktar. His most damaging move is the grab to repeatedly bite the opponent.
// You can also use Down, Down+Forward, Forward, C to do a rising kick, but the most effectively thing
// seems to be to jump in, and hit with a regular kick (C) followed by a regular punch (C).
character_ending_achievement("Don't Be Fooled", 
                             "Complete quest mode as Barko", character_barko, screen_ending_barko,
                             id=527612, badge="598397")

// Sara's projectile: Down, Forward, B
character_ending_achievement("There Once Was an Old Witch", 
                             "Complete quest mode as Daktar", character_daktar, screen_ending_daktar,
                             id=527613, badge="598398")

// Algos's project: Down, Down+Forward, Forward, B
character_ending_achievement("The Missing Ring", 
                             "Complete quest mode as Algos", character_algos, screen_ending_algos,
                             id=527614, badge="598399")

character_ending_achievement("That's My Egg!",
                             "Complete quest mode as Talon", character_talon, screen_ending_talon, 
                             id=527615, badge="598400")

character_ending_achievement("Isn't There Anyone Stronger?",
                             "Complete quest mode as Psybart", character_psybart, screen_ending_psybart,
                             id=527616, badge="598401")
                             
// beat story mode on normal (10)
achievement("Revenged", "Defeat Venum in quest mode on normal or difficult", 10,
    trigger = in_quest() && !cheating() &&
              venum_beaten() &&
              !prev(venum_beaten()) &&
              current_difficulty() >= difficulty_normal &&
              current_difficulty() <= difficulty_arcade
)

// beat story mode on hard (25)
achievement("Revenged with Vengeance", "Defeat Venum in quest mode on difficult", 25,
    trigger = in_quest() && !cheating() &&
              venum_beaten() &&
              !prev(venum_beaten()) &&
              current_difficulty() >= difficulty_difficult &&
              current_difficulty() <= difficulty_arcade
)

// finish the quest in under 100 days (10)
function days_consumed() => word(0x18f44)
achievement("Rapid Revenge", "Defeat Venum in quest mode in less than 100 days", 10,
    trigger = in_quest() && !cheating() &&
              venum_beaten() &&
              !prev(venum_beaten()) &&
              days_consumed() < 100
)

function tracked_kills() => bitcount(0x18f6a) + bit0(0x18f6b) + bit1(0x18f6b)
achievement("Making the Rounds", "Defeat all ten non-boss opponents in a single quest", 5,
    trigger = !cheating() &&
              measured(tracked_kills() == 10,
                       when=in_quest() && quest_started() && current_screen_high() > screen_sega / 256) &&
              prev(tracked_kills()) == 9
)

achievement("Flawless Fighting", "Defeat an opponent without taking any damage", 5,
    trigger = in_quest_battle() && !cheating() &&
              current_health_p2() == 0 &&
              prev(current_health_p2()) > 0 &&
              current_health_p1() == 0x6a             
)

function guild_quest_player_health_us() => byte(0x1a242)
function guild_quest_boss_defeated_us() => byte(0x1b182)
function guild_quest_player_health_jp() => byte(0x5a5ae)
function guild_quest_boss_defeated_jp() => byte(0x5b4ee)
function guild_quest_is_jp() => guild_quest_player_health_us() > 3

function guild_quest_achievement(title, description, quest, id=0, badge="")
{
    achievement(title, description, 5, id=id, badge=badge,
        trigger = current_mode() == mode_guild_quest && !cheating() &&
                  current_guild_quest() == quest && (
                  // -- US --
                  (!guild_quest_is_jp() &&
                    prev(guild_quest_boss_defeated_us()) == 0 &&
                    guild_quest_boss_defeated_us() == 1) ||
                  // -- JP --
                  (guild_quest_is_jp() &&
                   prev(guild_quest_boss_defeated_jp()) == 0 &&
                   guild_quest_boss_defeated_jp() == 1)                  
    ))
}

guild_quest_achievement("Village Saved", "Complete the Castle of the Ice Wraith guild quest", 
                        guild_quest_castle_of_the_ice_wraith, id=527622, badge="598407")
guild_quest_achievement("Nobleman Found", "Complete the Manor of Traps guild quest",
                        guild_quest_manor_of_traps, id=527623, badge="598408")
guild_quest_achievement("Staff Recovered", "Complete the Wizard's Staff guild quest",
                        guild_quest_wizards_staff, id=527624, badge="598409")
guild_quest_achievement("Underground Explored", "Complete the Underground Maze guild quest",
                        guild_quest_underground_maze, id=527625, badge="598410")
guild_quest_achievement("Earthquakes Quelled", "Complete the Lava Dragon guild quest",
                        guild_quest_lava_dragon, id=527626, badge="598411")
 
achievement("Careful Questing", "Complete a guild quest without getting hit", 10,
    id=527627, badge="598412",
    trigger = current_mode() == mode_guild_quest && !cheating() && (
              // -- US --
              (!guild_quest_is_jp() &&
               guild_quest_player_health_us() == 3 &&
               prev(guild_quest_boss_defeated_us()) == 0 &&
               guild_quest_boss_defeated_us() == 1) ||
              // -- JP --
              (guild_quest_is_jp() &&
               guild_quest_player_health_jp() == 3 &&
               prev(guild_quest_boss_defeated_jp()) == 0 &&
               guild_quest_boss_defeated_jp() == 1)
))

// Quest Mode:
// * Day  0: Gym - 3 days - Fencing/Invisibility/Meditation: -30g, -14/+4/+1/+2/+2/-3/+5/-1/+6/+12
// * Day  3: Gym - 3 days - Meditation/Fencing/Fencing:      -30g, -14/+8/+2/-2/-2/+0/+4/-1/+6/-2
// * Day  6: Inn - Stay Overnight:                          -100g, +28                         -5
// * Day  7: Gym - 3 days - Fencing/Invisibility/Meditation: -30g, -14/+4/+1/+2/+2/-3/+5/-1/+6/+12
// * Day 10: Gym - 3 days - Meditation/Fencing/Invisibility: -30g, -14/+4/+1/+2/+2/-3/+5/-1/+6/+3
// * Day 13: Fight Daktar (left/up from city)              +1600g, -3days
// * Day 16: Fortune Teller - Grant Powers (x2)             -100g, +0/+15/+16/+1/+3/+15/+20/+33/+11/+0
//           (check magic shop for book - do this every time day advances from here out - it will cost ~1000g)
//           Fight Sara (left from city)                    +800g, -2days
// * Day 18: Fortune Teller - Grant Powers                   -50g, +0/+0/+4/+3/+1/+10/+5/+9/+11/+0
//           (start checking the item shop for a Fighter's guide - if you see it, buy as many as you can afford)
//           (consider spending a little money on other items that raise STR or DEF, but keep at least 1000g for a book)
//           Fight Daktar (left/up from city)              +1600g, -3days
// * Day 21: Fight Daktar (left/up from city)              +1600g, -3days
// * Day 24: Fortune Teller - Grant Powers                   -50g, [didn't capture level 4 stats]
//           Fight Daktar (left/up from city)              +1600g, -3days

// * Continue to fight Daktar and train. Levels at:
//   - Lv2: 128
//   - Lv3: 256
//   - Lv4: 512
//   - Lv5: 1024
//   - Lv6: 1700
//   - Lv7: 2500
//   - Lv8: 3400
//   - Lv9: 4400
//   - Lv10: 5400
//   - Lv11: 6500
//   - Lv12:
//   - Lv13:
//   - Lv14: 9600
// * Make sure to check the magic shop for the book and the item shop for a Fighter's guide. If you see Magic Boots
//   grab a few of them (4-5), but save most of your money for the Fighter's guide.
// * The most efficient way to level up is to farm Daktar and buy equipment, but if you're looking for a change of
//   pace consider doing guild quests. They cost 1000g/2000g to undertake, but you get double that on success (along
//   with experience from killing stuff while on the quest). You can also kill all 10 opponents, after which the
//   fortune teller will inform you which opponent you can fight to get a Book if you haven't found one in the shop.

// * Once you have around 400 offense and 200 defense, and have used the Book to gain access to Venum's Castle,
//   go there and defeat Jado. Jado absorbs ranged attacks, and can't be grabbed, so the easiest way to beat him
//   is to get close and just spam fast punch (A).

// * After defeating Jado, go talk to the Fortune Teller and have her tell you a Fortune (50g). 
//   Then you can go back to Venum's Castle and face Venum himself.
//   After you defeat Venum, the game ends, so feel free to spend whatever money you have left on weapons.

// * Venum is vulnerable to ranged attacks, so just spam them and keep him at bay.
