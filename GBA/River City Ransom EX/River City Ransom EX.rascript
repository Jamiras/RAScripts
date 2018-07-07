// River City Ransom EX
// #ID = 2509

// $000246: rep?
// $004990: Store value?
//          0c=merlin?

// $0049D2: difficulty
function current_difficulty() => byte(0x0049D2)

// $006C0D: rep?

// $008414: Alex Punch
//          64=100
function alex_punch() => byte(0x008414)

// $008415: Alex Kick
//          64=100
function alex_kick() => byte(0x008415)

// $008416: Alex Weapon
//          64=100
function alex_weapon() => byte(0x008416)

// $008417: Alex Defense
//          64=100
function alex_defense() => byte(0x008417)

// $008418: Alex Strength
//          64=100
function alex_strength() => byte(0x008418)

// $008419: Alex Agility
//          64=100
function alex_agility() => byte(0x008419)

// $00841A: Alex Jump
//          64=100
function alex_jump() => byte(0x00841A)

// $00841B: alex toughness
//          63=100
function alex_toughness() => byte(0x00841B)

// $00841C: alex willpower
//          64=100
// $00841E: alex stamina
// $008420: alex max stamina

// $008454: money
//          cents
function money_cents() => byte(0x008454)

// $008455: money
function money_dollars() => byte(0x008455)

// $0084B0: ryan punch
function ryan_punch() => byte(0x0084B0)

// $0084B1: ryan kick
function ryan_kick() => byte(0x0084B1)

// $0084B2: ryan weapon
function ryan_weapon() => byte(0x0084B2)

// $0084B3: ryan defense
function ryan_defense() => byte(0x0084B3)

// $0084B4: ryan strength
function ryan_strength() => byte(0x0084B4)

// $0084B5: ryan agility
function ryan_agility() => byte(0x0084B5)

// $0084B6: ryan jump
function ryan_jump() => byte(0x0084B6)

// $0084B7: ryan toughness
function ryan_toughness() => byte(0x0084B7)

// $0084B8: ryan willpower
// $0084B9: ryan willpowerx255
// $0084BA: ryan stamina
// $0084BC: ryan max stamina
// $00884F: recruit thor
// $008980: 01=recruited conan?
// $008992: Conan weapon stats
// $0089AC: c0=recruit conan
// $008A10: start of conans name?
// $008A23: 01=recruit conan
// $008B48: Rick
//          start of name
// $008B5B: 01 = recruit rick ?
// $008CA0: Gary?
//          strength
// $008CB8: c0=recruited?
// $008D2F: recruit gary?
//          01
// $008DCB: recruit mojo
// $008E67: recruit jesse
// $008F03: recruit turk ?
// $008F9F: 01=recruit blade?
// $019086: gamers
// $019087: rejects
// $019088: eagles
// $019089: Dragons
// $01908A: Rockers
// $01908B: entrees
// $01908C: Generic Boys ?
// $01908D: Frat Boys ?
// $01908E: jocks
// $01908F: home boys
// $019090: The Mob
// $019091: locals
// $019092: international;s
// $019093: cowboys
// $019094: plague
// $01EF34: start of player name
//          alex or ryan

achievement(
    title = "Freshman Groupie", description = "Recruit Gary.", points = 10,
    id = 13011, badge = "12881", published = "9/13/2014 7:21:54 PM", modified = "9/15/2014 5:15:24 AM",
    trigger = byte(0x008D2F) == 1 && byte(0x008D2E) != 255
)

achievement(
    title = "Generic Addition", description = "Recruit Conan.", points = 10,
    id = 13012, badge = "12882", published = "9/13/2014 7:47:23 PM", modified = "9/15/2014 5:15:27 AM",
    trigger = byte(0x0089AC) == 192 && byte(0x008A23) == 1
)

achievement(
    title = "Cross Town Backup", description = "Recruit Rick.", points = 10,
    id = 13045, badge = "12942", published = "9/15/2014 12:47:33 AM", modified = "9/15/2014 5:16:17 AM",
    trigger = byte(0x008B5B) == 1 && byte(0x008B5A) != 255
)

achievement(
    title = "Speed-Freak Student", description = "Recruit Jesse.", points = 10,
    id = 13057, badge = "12945", published = "9/15/2014 3:28:02 AM", modified = "9/15/2014 5:16:24 AM",
    trigger = byte(0x008E67) == 1
)

achievement(
    title = "Zombie No.1", description = "Recruit Blade.", points = 10,
    id = 13055, badge = "12944", published = "9/15/2014 2:22:35 AM", modified = "9/15/2014 5:16:20 AM",
    trigger = byte(0x008F9F) == 1
)

achievement(
    title = "0-5 Zombie No.2", description = "Recruit Turk.", points = 10,
    id = 13056, badge = "12947", published = "9/15/2014 3:27:58 AM", modified = "9/15/2014 5:16:22 AM",
    trigger = byte(0x008F03) == 1
)

achievement(
    title = "Zombie No.3", description = "Recruit Mojo.", points = 10,
    id = 13058, badge = "12948", published = "9/15/2014 3:37:12 AM", modified = "9/15/2014 5:16:25 AM",
    trigger = byte(0x008DCB) == 1
)

achievement(
    title = "Zombie No.4", description = "Recruit Thor.", points = 10,
    id = 13071, badge = "12949", published = "9/15/2014 5:08:56 AM", modified = "9/15/2014 5:16:27 AM",
    trigger = byte(0x00884F) == 1
)

achievement(
    title = "Don't be a Wimp!", description = "Set difficulty to [Wussy].", points = 5,
    id = 13010, badge = "12880", published = "9/13/2014 6:56:54 PM", modified = "9/15/2014 5:15:20 AM",
    trigger = current_difficulty() == 0 && byte(0x0049D0) > 0 && byte(0x0049D1) > 0
)

// Ticket 2313: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Alex Punch!", description = "Get Alex's [Punch Stats] to 100.", points = 5,
    id = 13027, badge = "12918", published = "9/14/2014 8:26:39 PM", modified = "9/15/2014 5:15:29 AM",
    trigger = alex_punch() >= 101 && alex_punch() < 127
)

achievement(
    title = "Alex Kick!", description = "Get Alex's [Kick Stat] to 100.", points = 5,
    id = 13028, badge = "12914", published = "9/14/2014 8:26:42 PM", modified = "9/15/2014 5:15:31 AM",
    trigger = alex_kick() >= 101 && alex_kick() < 127
)

// Ticket 2314: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Dirty Alex", description = "Get Alex's [Weapon Stat] to 100.", points = 5,
    id = 13029, badge = "12917", published = "9/14/2014 8:26:45 PM", modified = "9/15/2014 5:15:45 AM",
    trigger = alex_weapon() >= 101 && alex_weapon() < 127
)

// Ticket 2315: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Hardy Alex", description = "Get Alex's [Defense Stat] to 100.", points = 5,
    id = 13030, badge = "12916", published = "9/14/2014 8:26:48 PM", modified = "9/15/2014 5:15:49 AM",
    trigger = alex_defense() >= 101 && alex_defense() < 127
)

// Ticket 2316: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Alex The Strong", description = "Get Alex's [Strength Stat] to 100.", points = 5,
    id = 13031, badge = "12919", published = "9/14/2014 8:26:50 PM", modified = "9/15/2014 5:15:51 AM",
    trigger = alex_strength() >= 101 && alex_strength() < 127
)

// Ticket 2317: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Alex The Fast", description = "Get Alex's [Agility Stat] to 100.", points = 5,
    id = 13032, badge = "12920", published = "9/14/2014 8:26:53 PM", modified = "9/15/2014 5:15:53 AM",
    trigger = alex_agility() >= 101 && alex_agility() < 127
)

// Ticket 2318: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Alex The Reflex", description = "Get Alex's [Jump Stat] to 100.", points = 5,
    id = 13033, badge = "12921", published = "9/14/2014 8:26:56 PM", modified = "9/15/2014 5:15:54 AM",
    trigger = alex_jump() >= 101 && alex_jump() < 127
)

// Ticket 2319: I seem to have gotten these achievements by starting a new game with just Ryan on crazy difficulty.
achievement(
    title = "Alex The Badass", description = "Get Alex's [Toughness Stat] to 100.", points = 5,
    id = 13034, badge = "12922", published = "9/14/2014 8:26:58 PM", modified = "9/15/2014 5:15:56 AM",
    trigger = alex_toughness() >= 101 && alex_toughness() < 127
)

achievement(
    title = "Alex The Vital", description = "Get Alex's [MAX Stamina Stat] to 200.", points = 5,
    id = 13035, badge = "12923", published = "9/14/2014 8:27:12 PM", modified = "5/3/2015 1:57:07 PM",
    trigger = byte(0x008420) >= 200 && byte(0x008420) < 255
)

achievement(
    title = "Ryan Punch!", description = "Get Ryan's [Punch Stats] to 100.", points = 5,
    id = 13036, badge = "12930", published = "9/14/2014 8:58:33 PM", modified = "9/15/2014 5:16:02 AM",
    trigger = ryan_punch() >= 101 && ryan_punch() < 127
)

// Ticket 2330: I seem to have unlocked these when I started a new game with just Alex on Crazy difficulty (similar to
//               getting Alex's achievements by starting with just Ryan)
achievement(
    title = "Ryan Kick!", description = "Get Ryan's [Kick Stat] to 100.", points = 5,
    id = 13037, badge = "12929", published = "9/14/2014 8:58:37 PM", modified = "9/15/2014 5:16:03 AM",
    trigger = ryan_kick() >= 101 && ryan_kick() < 127
)

achievement(
    title = "Dirty Ryan", description = "Get Ryan's [Weapon Stat] to 100.", points = 5,
    id = 13038, badge = "12926", published = "9/14/2014 8:58:39 PM", modified = "9/15/2014 5:16:06 AM",
    trigger = ryan_weapon() >= 101 && ryan_weapon() < 127
)

// Ticket 2331: I seem to have unlocked these when I started a new game with just Alex on Crazy difficulty (similar to
//               getting Alex's achievements by starting with just Ryan)
achievement(
    title = "Hardy Ryan", description = "Get Ryan's [Defense Stat] to 100.", points = 5,
    id = 13039, badge = "12933", published = "9/14/2014 8:58:42 PM", modified = "9/15/2014 5:16:08 AM",
    trigger = ryan_defense() >= 101 && ryan_defense() < 127
)

// Ticket 2332: I seem to have unlocked these when I started a new game with just Alex on Crazy difficulty (similar to
//               getting Alex's achievements by starting with just Ryan)
achievement(
    title = "Ryan The Strong", description = "Get Ryan's [Strength Stat] to 100.", points = 5,
    id = 13040, badge = "12927", published = "9/14/2014 8:58:45 PM", modified = "9/15/2014 5:16:10 AM",
    trigger = ryan_strength() >= 101 && ryan_strength() < 127
)

achievement(
    title = "Ryan The Fast", description = "Get Ryan's [Agility Stat] to 100.", points = 5,
    id = 13041, badge = "12928", published = "9/14/2014 8:58:47 PM", modified = "9/15/2014 5:16:11 AM",
    trigger = ryan_agility() >= 101 && ryan_agility() < 127
)

// Ticket 2333: I seem to have unlocked these when I started a new game with just Alex on Crazy difficulty (similar to
//               getting Alex's achievements by starting with just Ryan)
achievement(
    title = "Ryan The Reflex", description = "Get Ryan's [Jump Stat] to 100.", points = 5,
    id = 13042, badge = "12932", published = "9/14/2014 8:58:49 PM", modified = "9/15/2014 5:16:13 AM",
    trigger = ryan_jump() >= 101 && ryan_jump() < 127
)

// Ticket 2334: I seem to have unlocked these when I started a new game with just Alex on Crazy difficulty (similar to
//               getting Alex's achievements by starting with just Ryan)
achievement(
    title = "Ryan The Badass", description = "Get Ryan's [Toughness Stat] to 100.", points = 5,
    id = 13043, badge = "12931", published = "9/14/2014 8:58:52 PM", modified = "9/15/2014 5:16:14 AM",
    trigger = ryan_toughness() >= 101 && ryan_toughness() < 127
)

achievement(
    title = "Ryan The Vital", description = "Get Ryan's [MAX Stamina Stat] to 200.", points = 5,
    id = 13044, badge = "12924", published = "9/14/2014 8:58:54 PM", modified = "9/15/2014 5:16:16 AM",
    trigger = byte(0x0084BC) >= 201 && byte(0x0084BC) < 255
)

achievement(
    title = "The Best Money Can Buy", description = "Find [Merlin's Mystery].", points = 15,
    id = 13046, badge = "12943", published = "9/15/2014 1:24:17 AM", modified = "9/15/2014 8:00:23 AM",
    trigger = byte(0x004990) == 12 && byte(0x004991) == 0
)

achievement(
    title = "Appetizers", description = "Defeat the [Entrees] 5 times.", points = 5,
    id = 13088, badge = "12970", published = "9/15/2014 8:36:41 AM", modified = "9/15/2014 8:36:45 AM",
    trigger = byte(0x01908B) == 5
)

achievement(
    title = "Generalized", description = "Defeat the [Generic Dudes] 5 times.", points = 5,
    id = 13074, badge = "12955", published = "9/15/2014 8:20:33 AM", modified = "9/15/2014 8:21:04 AM",
    trigger = byte(0x01908C) == 5
)

achievement(
    title = "Fraternized", description = "Defeat the [Frat Boys] 5 times.", points = 5,
    id = 13075, badge = "12956", published = "9/15/2014 8:20:36 AM", modified = "9/15/2014 8:21:06 AM",
    trigger = byte(0x01908D) == 5
)

achievement(
    title = "Homeless", description = "Defeat the [Home-Boys] 5 times.", points = 5,
    id = 13080, badge = "12961", published = "9/15/2014 8:20:47 AM", modified = "9/15/2014 8:21:12 AM",
    trigger = byte(0x01908F) == 5
)

achievement(
    title = "De-Popular", description = "Defeat the [Jocks] 5 times.", points = 5,
    id = 13081, badge = "12962", published = "9/15/2014 8:20:49 AM", modified = "9/15/2014 8:21:14 AM",
    trigger = byte(0x01908E) == 5
)

achievement(
    title = "Subsidized", description = "Defeat the [Locals] 5 times.", points = 5,
    id = 13082, badge = "12964", published = "9/15/2014 8:20:52 AM", modified = "9/15/2014 8:21:15 AM",
    trigger = byte(0x019091) == 5
)

achievement(
    title = "De-Clawed", description = "Defeat the [Eagles] 5 times.", points = 5,
    id = 13079, badge = "12960", published = "9/15/2014 8:20:45 AM", modified = "9/15/2014 8:21:11 AM",
    trigger = byte(0x019088) == 5
)

achievement(
    title = "Rejected", description = "Defeat the [Rejects] 5 times.", points = 5,
    id = 13085, badge = "12967", published = "9/15/2014 8:20:58 AM", modified = "9/15/2014 8:21:19 AM",
    trigger = byte(0x019087) == 5
)

achievement(
    title = "Donned", description = "Defeat [The Mob] 5 times.", points = 5,
    id = 13076, badge = "12957", published = "9/15/2014 8:20:39 AM", modified = "9/15/2014 8:21:07 AM",
    trigger = byte(0x019090) == 5
)

achievement(
    title = "Life Down", description = "Defeat the [Gamers] 5 times.", points = 5,
    id = 13086, badge = "12968", published = "9/15/2014 8:21:00 AM", modified = "9/15/2014 8:21:20 AM",
    trigger = byte(0x019087) == 5
)

achievement(
    title = "Unionized", description = "Defeat the [Internationals] 5 times.", points = 5,
    id = 13084, badge = "12966", published = "9/15/2014 8:20:56 AM", modified = "9/15/2014 8:21:17 AM",
    trigger = byte(0x019092) == 5
)

achievement(
    title = "Unplugged", description = "Defeat the [Rockers] 5 times.", points = 5,
    id = 13078, badge = "12959", published = "9/15/2014 8:20:43 AM", modified = "9/15/2014 8:21:10 AM",
    trigger = byte(0x01908A) == 5
)

achievement(
    title = "Mortalized", description = "Defeat the [Dragons] 5 times.", points = 5,
    id = 13077, badge = "12958", published = "9/15/2014 8:20:41 AM", modified = "9/15/2014 8:21:09 AM",
    trigger = byte(0x019089) == 5
)

achievement(
    title = "Swamped", description = "Defeat the [Cowboys] 5 times.", points = 5,
    id = 13083, badge = "12965", published = "9/15/2014 8:20:54 AM", modified = "9/15/2014 8:21:16 AM",
    trigger = byte(0x019093) == 5
)

achievement(
    title = "Hospitalized", description = "Defeat the [Plague] 5 times.", points = 5,
    id = 13087, badge = "12969", published = "9/15/2014 8:25:13 AM", modified = "9/15/2014 8:25:16 AM",
    trigger = byte(0x019094) == 5
)

achievement(
    title = "River City", description = "Beat the game on [Normal Difficulty] or Higher.", points = 20,
    id = 13072, badge = "12952", published = "9/15/2014 5:12:59 AM", modified = "9/15/2014 5:16:28 AM",
    trigger = byte(0x00073C) == 182 && byte(0x00073E) == 13 && byte(0x000740) == 10 && byte(0x000742) == 4 && 
              byte(0x000744) == 12 && byte(0x000746) == 32 && byte(0x000748) == 20 && byte(0x00074A) == 6 && 
              byte(0x00074C) == 23 && byte(0x00074E) == 17 && byte(0x000750) == 2 && byte(0x000752) == 15 && 
              byte(0x000754) == 7 && byte(0x000756) == 5 && current_difficulty() >= 2
)

// Ticket 5215: Achievement did not trigger upon beating the game on Crazy Difficulty.
//               I've done it with Alex, Ryan, and the combination of the two teamed up, yet it didn't work
//               I've also made sure not to use any custom characters or cheats in the process.
// Ticket 3289: did many times on normal and crazy and never triggered for me.
achievement(
    title = "River City Crazy", description = "Beat the game on [Crazy Difficulty].", points = 25,
    id = 13073, badge = "12953", published = "9/15/2014 5:13:02 AM", modified = "9/15/2014 5:16:30 AM",
    trigger = byte(0x00073C) == 182 && byte(0x00073E) == 13 && byte(0x000740) == 10 && byte(0x000742) == 4 && 
              byte(0x000744) == 12 && byte(0x000746) == 32 && byte(0x000748) == 20 && byte(0x00074A) == 6 && 
              byte(0x00074C) == 23 && byte(0x00074E) == 17 && byte(0x000750) == 2 && byte(0x000752) == 15 && 
              byte(0x000754) == 7 && byte(0x000756) == 5 && current_difficulty() == 4
)
