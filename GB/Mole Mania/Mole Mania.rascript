// Mole Mania
// #ID = 2477

// $A002: Score Level 1
function score_lv1() => byte(0x00A002)

// $A003: Score Level 2
function score_lv2() => byte(0x00A003)

// $A004: Level 3 Score
function score_lv3() => byte(0x00A004)

// $A006: Level 5 Score
function score_lv5() => byte(0x00A006)

// $A008: Level 7 Score
function score_lv7() => byte(0x00A008)

// $CE52: Health
function health() => byte(0x00CE52)

// $CE53: 40 - Minigame Completed
function minigame() => byte(0x00CE53)

// $CE54: 01 - Have Map
function map() => byte(0x00CE54)

// $CE55: 01 - Have Locator
function locator() => byte(0x00CE55)

// $CE56: 01 - Have Recovery
function recovery() => byte(0x00CE56)

// $CE57: 01 - Have Surrender
function surrender() => byte(0x00CE57)

// $CE66: Cabbages
function cabbages() => byte(0x00CE66)

// $CFDB: Map ID
function map_id() => byte(0x00CFDB)

// $CFDD: Stage
function stage() => byte(0x00CFDD)

// $FF91: Game State? 13 = Winning a Stage
function game_state() => byte(0x00FF91)

achievement(
    title = "Spike In The Ass", description = "Clear Stage 1", points = 10,
    id = 23519, badge = "56413", published = "6/8/2015 7:59:22 PM", modified = "11/23/2019 7:56:33 AM",
    trigger = stage() == 0 && game_state() == 19 && map_id() == 3 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "The Sun Goes Down", description = "Clear Stage 2", points = 10,
    id = 23520, badge = "56416", published = "6/8/2015 7:59:25 PM", modified = "11/23/2019 7:56:34 AM",
    trigger = stage() == 1 && game_state() == 19 && map_id() == 2 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "100t Are Nothing For A Mole", description = "Clear Stage 3", points = 10,
    id = 23521, badge = "56417", published = "6/8/2015 7:59:28 PM", modified = "11/23/2019 7:56:36 AM",
    trigger = game_state() == 19 && map_id() == 5 && unless(once(byte(0x00D706) == 10)) &&
              ((stage() == 2) ||
               (stage() == 9))
)

achievement(
    title = "Someones Got An Anger Problem", description = "Clear Stage 4", points = 10,
    id = 23522, badge = "56418", published = "6/8/2015 7:59:30 PM", modified = "11/23/2019 7:56:37 AM",
    trigger = stage() == 3 && game_state() == 19 && map_id() == 15 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Small Mama", description = "Clear Stage 5", points = 10,
    id = 23523, badge = "56419", published = "6/8/2015 7:59:33 PM", modified = "11/23/2019 7:56:38 AM",
    trigger = stage() == 4 && game_state() == 19 && map_id() == 2 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Sure... \"Play\"...", description = "Clear Stage 6", points = 10,
    id = 23524, badge = "56420", published = "6/8/2015 7:59:35 PM", modified = "11/23/2019 7:56:39 AM",
    trigger = stage() == 5 && game_state() == 19 && map_id() == 10 && unless(once(byte(0x00D706) == 10))
)

// Ticket 20239: As tagged, this did not trigger for me after clearing the stage successfully.
//               MD5: f28ade3926852a8ad2e449c274683956
//               Emulator: RAVBA
achievement(
    title = "Is That A Sonic Reference?", description = "Clear Stage 7", points = 10,
    id = 23525, badge = "56421", published = "6/8/2015 7:59:37 PM", modified = "11/23/2019 7:56:41 AM",
    trigger = stage() == 14 && game_state() == 19 && map_id() == 24 && unless(once(byte(0x00D706) == 10))
//    trigger = stage() == 6 && game_state() == 19 && map_id() == 24 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Family Reunion", description = "Clear Stage 8 And Beat The Game", points = 25,
    id = 23526, badge = "56422", published = "6/8/2015 7:59:39 PM", modified = "11/23/2019 7:56:42 AM",
    trigger = stage() == 7 && game_state() == 19 && map_id() == 3 && unless(once(byte(0x00D706) == 10))
)

// Ticket 22516: I beat Level 1 at 100% but the achievement is still locked.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Level 1 100 Percent", description = "Get 100 Points In Level 1", points = 15,
    id = 23527, badge = "56423", published = "6/8/2015 8:01:00 PM", modified = "11/23/2019 7:56:43 AM",
    trigger = score_lv1() == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 2 100 Percent", description = "Get 100 Points In Level 2", points = 15,
    id = 23528, badge = "56424", published = "6/8/2015 8:01:02 PM", modified = "11/23/2019 7:56:47 AM",
    trigger = score_lv2() == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 3 100 Percent", description = "Get 100 Points In Level 3", points = 15,
    id = 23529, badge = "56425", published = "6/8/2015 8:01:04 PM", modified = "11/23/2019 7:56:46 AM",
    trigger = score_lv3() == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 4 100 Percent", description = "Get 100 Points In Level 4", points = 15,
    id = 23530, badge = "56426", published = "6/8/2015 8:01:06 PM", modified = "11/23/2019 7:56:49 AM",
    trigger = byte(0x00A005) == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 5 100 Percent", description = "Get 100 Points In Level 5", points = 15,
    id = 23531, badge = "56427", published = "6/8/2015 8:01:08 PM", modified = "11/23/2019 7:56:52 AM",
    trigger = score_lv5() == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 6 100 Percent", description = "Get 100 Points In Level 6", points = 15,
    id = 23532, badge = "56428", published = "6/8/2015 8:01:10 PM", modified = "11/23/2019 7:56:50 AM",
    trigger = byte(0x00A007) == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Level 7 100 Percent", description = "Get 100 Points In Level 7", points = 15,
    id = 23533, badge = "56429", published = "6/8/2015 8:01:11 PM", modified = "11/23/2019 7:56:53 AM",
    trigger = score_lv7() == 100 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested Kangaroon", description = "Beat Stage 1 Boss Without Taking Damage", points = 15,
    id = 23534, badge = "56430", published = "6/8/2015 8:01:13 PM", modified = "11/23/2019 7:56:57 AM",
    trigger = once(map_id() == 7) && stage() == 0 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 3 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested Sundes", description = "Beat Stage 2 Boss Without Taking Damage", points = 15,
    id = 23535, badge = "56431", published = "6/8/2015 8:01:15 PM", modified = "11/23/2019 7:56:56 AM",
    trigger = once(map_id() == 5) && stage() == 1 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 2 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested Funton", description = "Beat Stage 3 Boss Without Taking Damage", points = 15,
    id = 23536, badge = "56432", published = "6/8/2015 8:01:17 PM", modified = "11/23/2019 7:56:58 AM",
    trigger = once(map_id() == 11) && never(health() < prev(health())) && game_state() == 19 && 
              map_id() == 5 && unless(once(byte(0x00D706) == 10)) &&
              ((stage() == 2) ||
               (stage() == 9))
)

achievement(
    title = "Bested Mad Wrencher", description = "Beat Stage 4 Boss Without Taking Damage", points = 15,
    id = 23537, badge = "56433", published = "6/8/2015 8:01:18 PM", modified = "11/23/2019 7:57:00 AM",
    trigger = once(map_id() == 20) && stage() == 3 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 15 && unless(once(byte(0x00D706) == 10))
)

// Ticket 15504: The achievement did not pop (tried multiple times) and the one for beating the stage did pop so I
//               don't believe it's a network issue, i did look at the achievement infor for some information that may
//               help
//               ID 1: 0x00cfdb has one hit and a value in the memory of 02
//               ID 2: 0x00cfdd has 0 hits and an ever increasing value in parentheses and a value in the memory of 04
//               ID 3: 0x00ce52 has 0 hits and 0 in parentheses and a current value in memory of 04
//               ID 4: 0x00ff91 has 0 hits and an ever increasing value in parentheses and a value of in the memory of
//               13
//               ID 5: 0x00ce56 has 0 hits and 0 in parentheses and a current value in memory of 01
//               
//               I took these all in the post boss cabbage is on the screen but haven't examined it screen
//               MD5: f28ade3926852a8ad2e449c274683956
//               Emulator: RAVBA
achievement(
    title = "Bested Big Mama", description = "Beat Stage 5 Boss Without Taking Damage", points = 15,
    id = 23538, badge = "56434", published = "6/8/2015 8:01:20 PM", modified = "11/23/2019 7:57:01 AM",
    trigger = once(map_id() == 8) && stage() == 4 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 2 && unless(once(byte(0x00D706) == 10))
//    trigger = once(map_id() == 8) && stage() == 4 && never(health() < prev(health())) && 
//              game_state() == 19 && recovery() == 2 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested The Sammy Bros.", description = "Beat Stage 6 Boss Without Taking Damage", points = 15,
    id = 23539, badge = "56435", published = "6/8/2015 8:01:22 PM", modified = "11/23/2019 7:57:03 AM",
    trigger = once(map_id() == 16) && stage() == 5 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 10 && unless(once(byte(0x00D706) == 10))
//    trigger = once(map_id() == 16) && stage() == 5 && never(health() < prev(health())) && 
//              game_state() == 19 && recovery() == 10 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested Snowman", description = "Beat Stage 7 Boss Without Taking Damage", points = 15,
    id = 23540, badge = "56436", published = "6/8/2015 8:01:24 PM", modified = "11/23/2019 7:57:06 AM",
    trigger = once(map_id() == 31) && stage() == 14 && never(health() < prev(health())) && 
              game_state() == 19 && map_id() == 24 && unless(once(byte(0x00D706) == 10))
//    trigger = once(map_id() == 31) && stage() == 6 && never(health() < prev(health())) && 
//              game_state() == 19 && recovery() == 24 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Bested Jinbe", description = "Beat Stage 8 Boss Without Taking Damage", points = 35,
    id = 23541, badge = "56437", published = "6/8/2015 8:01:26 PM", modified = "11/23/2019 7:57:05 AM",
    trigger = once(map_id() == 7) && stage() == 7 && never(health() < prev(health())) && 
              game_state() == 19 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Map!", description = "Get A Map", points = 10,
    id = 23542, badge = "56438", published = "6/8/2015 8:01:29 PM", modified = "11/23/2019 7:55:00 AM",
    trigger = map() == 1 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Locator!", description = "Get A Locator", points = 10,
    id = 23543, badge = "56439", published = "6/8/2015 8:01:31 PM", modified = "11/23/2019 7:55:04 AM",
    trigger = locator() == 1 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Recovery!", description = "Get A Recovery Potion", points = 10,
    id = 23544, badge = "56440", published = "6/8/2015 8:01:33 PM", modified = "11/23/2019 7:55:07 AM",
    trigger = recovery() == 1 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Surrender!", description = "Get A Surrender Item", points = 10,
    id = 23545, badge = "56441", published = "6/8/2015 8:01:35 PM", modified = "11/23/2019 7:55:10 AM",
    trigger = surrender() == 1 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Neener, Neener My Ass!", description = "Complete The Bonus Minigame", points = 10,
    id = 23546, badge = "56442", published = "6/8/2015 8:01:36 PM", modified = "11/23/2019 7:57:17 AM",
    trigger = minigame() == 64 && unless(once(byte(0x00D706) == 10))
)

achievement(
    title = "Dinner Is Ready", description = "Get 20 Cabbages", points = 10,
    id = 23547, badge = "56443", published = "6/8/2015 8:01:38 PM", modified = "11/23/2019 7:57:21 AM",
    trigger = cabbages() == 20 && unless(once(byte(0x00D706) == 10))
)

rich_presence_conditional_display(byte(0xc9e4) == 0, "Titles")
rich_presence_conditional_display(byte(0xc9e4) > 8, "Epilogue")

rich_presence_display("Level {0}, {1}/20 cabbages, {2}/4 items",
    rich_presence_value("Level", byte(0xc9e4) + 1),
    rich_presence_value("Cabbages", cabbages()),
    rich_presence_value("Items", map() + locator() + recovery() + surrender())
)
