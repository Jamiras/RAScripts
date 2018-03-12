// Super Puzzle Fighter II Turbo
// #ID = 535

// $2D82: Button
// $2FD8: Warning, caution, danger
// $2FE8: Give cristal
// $3055: Chain
// $45B4: Select in main menu

// $45D6: Difficulty (0-7)
function current_difficulty() => byte(0x0045D6)

// $45D7: Damage Level

// $45E5: Game speed
function current_speed() => byte(0x0045E5)

// F2 = morrigan victory

// $5081: Top
// $8CA0: 0a- win game?
// $90AB: Morrigan
// $90AC: Chun-li
// $90AD: Ryu star
// $90AE: Ken SuperStar
// $90AF: Hsien ko s
// $90B0: Donovan s
// $90B1: Felicia s
// $90B2: Sakura s
// $91BD: End?

// $922B: Character

function current_character() => byte(0x002E28) // was $922B
function current_opponent() => byte(0x00922E)
character_morrigan = 0
character_chunli = 1
character_ryu = 2
character_ken = 3
character_hsienko = 4
character_donovan = 5
character_felicia = 6
character_sakura = 7
character_devilot = 8
character_akuma = 9
character_dan = 10

// $9235: Level select in arcade mode
function arcade_difficulty() => byte(0x009235)
difficulty_easy = 0
difficulty_normal = 1
difficulty_hard = 2
difficulty_master = 3

// $924E: Score but in game over
// $9E54: 1e - music end and game over

characters = {
    character_morrigan: "Morrigan",
    character_chunli: "Chun-Li",
    character_ryu: "Ryu",
    character_ken: "Ken",
    character_hsienko: "Hsien-Ko",
    character_donovan: "Donovan",
    character_felicia: "Felicia",
    character_sakura: "Sakura",
    character_devilot: "Devilot",
    character_akuma: "Akuma",
    character_dan: "Dan",
}

function trigger_arcade_victory(character) => 
    arcade_difficulty() >= difficulty_normal && 
    current_character() == character &&
    byte(0x0045B4) == 0 &&         // arcade mode selected in menu (does this really work?)
    byte(0x009E54) == 30 &&        // victory music
    byte(0x0045B0) == 5            // victory screen

achievement(
    title = "Ryu SuperStar", description = "Complete Ryu with all star in Puzzle Mode", points = 10,
    id = 6144, badge = "06546", published = "3/12/2014 1:28:56 AM", modified = "3/12/2014 1:29:36 AM",
    trigger = byte(0x0090AD) == 63
)

achievement(
    title = "Ken SuperStar", description = "Complete Ken with all star in Puzzle Mode", points = 10,
    id = 6145, badge = "06547", published = "3/12/2014 1:28:58 AM", modified = "3/12/2014 1:29:38 AM",
    trigger = byte(0x0090AE) == 63
)

achievement(
    title = "Chun-li SuperStar", description = "Complete Chun-li with all star in Puzzle Mode", points = 10,
    id = 6146, badge = "06548", published = "3/12/2014 1:29:00 AM", modified = "3/12/2014 1:29:39 AM",
    trigger = byte(0x0090AC) == 63
)

achievement(
    title = "Sakura SuperStar", description = "Complete Sakura with all star in Puzzle Mode", points = 10,
    id = 6147, badge = "06549", published = "3/12/2014 1:29:01 AM", modified = "3/16/2014 2:08:23 AM",
    trigger = byte(0x0090B2) == 63
)

achievement(
    title = "Morrigan SuperStar", description = "Complete Morrigan with all star in Puzzle Mode", points = 10,
    id = 6148, badge = "06550", published = "3/12/2014 1:29:03 AM", modified = "3/12/2014 1:29:43 AM",
    trigger = byte(0x0090AB) == 63
)

achievement(
    title = "Felicia SuperStar", description = "Complete Felicia With all star in Puzzle Mode", points = 10,
    id = 6149, badge = "06551", published = "3/12/2014 1:29:05 AM", modified = "3/12/2014 1:29:44 AM",
    trigger = byte(0x0090B1) == 63
)

achievement(
    title = "Hsien-Ko SuperStar", description = "Complete Hsien-Ko with all star in Puzzle Mode", points = 10,
    id = 6150, badge = "06552", published = "3/12/2014 1:29:07 AM", modified = "3/12/2014 1:29:46 AM",
    trigger = byte(0x0090AF) == 63
)

achievement(
    title = "Donovan SuperStar", description = "Complete Donovan with all star in Puzzle Mode", points = 10,
    id = 6151, badge = "06553", published = "3/12/2014 1:29:10 AM", modified = "3/12/2014 1:29:48 AM",
    trigger = byte(0x0090B0) == 63
)

achievement(
    title = "I'm Master Puzzle", description = "Beat Game any character in Master Arcade", points = 40,
    id = 6152, badge = "06554", published = "3/12/2014 1:29:11 AM", modified = "3/13/2014 2:26:56 PM",
    trigger = arcade_difficulty() == 3 && byte(0x009E54) == 30 && byte(0x0045B4) == 0 && byte(0x0045B0) == 5
)

// Ticket 3230: I played as Dan in Master Arcade but I didn't finished it.
achievement(
    title = "I'm Cool, dude!!!", description = "Beat Game with Dan in Master Arcade", points = 50,
    id = 6153, badge = "06555", published = "3/12/2014 1:29:13 AM", modified = "3/18/2014 8:49:07 PM",
    trigger = arcade_difficulty() == 3 && trigger_arcade_victory(character_dan)
)

// Ticket 11626: This achievement was unlocked upon loading Super Puzzle Fighter II (U)(Independent) in
//               RAVisualBoyAdvance 0.054.
//               MD5: 14d0771c15676e2b3b75c4c149879586
achievement(
    title = "Danger Gems!!", description = "Drop 31 or more gems to the enemy", points = 15,
    id = 6157, badge = "06559", published = "3/12/2014 10:00:14 PM", modified = "5/4/2015 5:41:39 AM",
    trigger = byte(0x002FE8) >= 31 && byte(0x0045B0) == 2 && byte(0x045DB) != 0
)

achievement(
    title = "Yes! I'm Rock", description = "Get 5 combo chain", points = 15,
    id = 6158, badge = "06560", published = "3/12/2014 10:00:17 PM", modified = "5/4/2015 5:41:43 AM",
    trigger = once(byte(0x003055) >= 5) && never(byte(0x0045B4) == 6)
)

achievement(
    title = "Too easy!", description = "Beat game in Beginner without lost", points = 10,
    id = 6159, badge = "06562", published = "3/12/2014 10:00:19 PM", modified = "3/12/2014 10:00:25 PM",
    trigger = arcade_difficulty() == 0 && byte(0x009E54) == 90 && byte(0x009E88) == 16 && never(byte(0x009E54) == 30) && 
              once(arcade_difficulty() == 1)
)

achievement(
    title = "You are Best Player", description = "Beat Highest Score in Ranking Score", points = 10,
    id = 6160, badge = "06565", published = "3/12/2014 10:40:04 PM", modified = "3/12/2014 10:40:11 PM",
    trigger = byte(0x005081) == 1 && never(byte(0x005088) == 2) && word(0x005059) == 0
)

// Ticket 969: i beat the game with dan but the ryu achievement trigger instead
achievement(
    title = "Ryu", description = "Complete Arcade Mode as Ryu in Normal or Hard", points = 15,
    id = 6133, badge = "06535", published = "3/12/2014 1:28:33 AM", modified = "3/12/2014 8:49:47 PM",
    trigger = trigger_arcade_victory(character_ryu)
)

achievement(
    title = "Chun-Li", description = "Complete Arcade Mode as Chun-Li in Normal or Hard", points = 15,
    id = 6134, badge = "06536", published = "3/12/2014 1:28:37 AM", modified = "3/14/2014 3:36:26 PM",
    trigger = trigger_arcade_victory(character_chunli)
)

achievement(
    title = "Sakura", description = "Complete Arcade Mode as Sakura in Normal or Hard", points = 15,
    id = 6135, badge = "06537", published = "3/12/2014 1:28:39 AM", modified = "3/12/2014 8:49:43 PM",
    trigger = trigger_arcade_victory(character_sakura)
)

achievement(
    title = "Ken", description = "Complete Arcade Mode as Ken in Normal or Hard", points = 15,
    id = 6136, badge = "06538", published = "3/12/2014 1:28:41 AM", modified = "3/12/2014 8:49:41 PM",
    trigger = trigger_arcade_victory(character_ken)
)

// Ticket 11642: I received the Dan achievement instead of this one when I beat Arcade Mode with Morrigan on the Normal
//               difficulty.
//               MD5: 14d0771c15676e2b3b75c4c149879586
// Ticket 2784: The end with morrigan unlock Dan trophy, and Dan end unlock nothing, so Morrigan trophy is broken.
achievement(
    title = "Morrigan ", description = "Complete Arcade Mode as Morrigan in Normal or Hard", points = 15,
    id = 6137, badge = "06539", published = "3/12/2014 1:28:43 AM", modified = "3/21/2014 9:40:06 PM",
    trigger = trigger_arcade_victory(character_morrigan)
)

achievement(
    title = "Hsien-Ko", description = "Complete Arcade Mode as Hsien-Ko in Normal or Hard", points = 15,
    id = 6138, badge = "06540", published = "3/12/2014 1:28:45 AM", modified = "3/12/2014 8:49:35 PM",
    trigger = trigger_arcade_victory(character_hsienko)
)

achievement(
    title = "Donovan", description = "Complete Arcade Mode as Donovan in Normal or Hard", points = 15,
    id = 6139, badge = "06541", published = "3/12/2014 1:28:47 AM", modified = "3/12/2014 8:49:34 PM",
    trigger = trigger_arcade_victory(character_donovan)
)

achievement(
    title = "Felicia", description = "Complete Arcade Mode as Felicia in Normal or Hard", points = 15,
    id = 6140, badge = "06542", published = "3/12/2014 1:28:49 AM", modified = "3/12/2014 8:49:32 PM",
    trigger = trigger_arcade_victory(character_felicia)
)

// Ticket 11641: I received this achievement instead of Morrigan when I beat Arcade Mode with Morrigan on the Normal
//               difficulty.
//               MD5: 14d0771c15676e2b3b75c4c149879586
// Ticket 3229: It triggered when i finished normal arcade mode with Morrigan, i didn't play as Dan.
// Ticket 3059: Triggered when finishing with Morrigan in Normal Mode. :)
achievement(
    title = "Dan", description = "Complete Arcade Mode as Dan in Normal or Hard", points = 30,
    id = 6141, badge = "06543", published = "3/12/2014 1:28:50 AM", modified = "5/5/2015 12:26:27 AM",
    trigger = trigger_arcade_victory(character_dan)
)

// Ticket 9276: //               MD5: 14d0771c15676e2b3b75c4c149879586
achievement(
    title = "Akuma", description = "Complete Arcade Mode as Akuma in Normal or Hard", points = 15,
    id = 6142, badge = "06544", published = "3/12/2014 1:28:52 AM", modified = "5/5/2015 12:26:31 AM",
    trigger = trigger_arcade_victory(character_akuma)
)

// Ticket 9279: //               MD5: 14d0771c15676e2b3b75c4c149879586
achievement(
    title = "Devilot", description = "Complete Arcade Mode as Devilot in Normal or Hard", points = 15,
    id = 6143, badge = "06545", published = "3/12/2014 1:28:54 AM", modified = "5/4/2015 5:41:48 AM",
    trigger = trigger_arcade_victory(character_devilot)
)


arcade_difficulties = {
    difficulty_easy: "Easy",
    difficulty_normal: "Normal",   
    difficulty_hard: "Hard",
    difficulty_master: "Master",
}

rich_presence_conditional_display(byte(0x045B0) == 0, "Demo Mode")
rich_presence_conditional_display(byte(0x045B0) == 1, "In a Menu") // main menu
rich_presence_conditional_display(byte(0x045B0) == 4, "In a Menu") // Tutorial, Victory
rich_presence_conditional_display(byte(0x045B0) == 5, "In a Menu") // Changing options, End credits
rich_presence_conditional_display(byte(0x045B0) == 6, "In a Menu") // Continue screen
rich_presence_conditional_display(byte(0x045B0) == 8, "Viewing Results")

// puzzle mode
rich_presence_conditional_display(byte(0x045CF) == 1, "{0} vs {1} (Puzzle)",
    rich_presence_lookup("Character", current_character(), characters),
    rich_presence_lookup("Character", current_opponent(), characters),
    rich_presence_lookup("Difficulty", byte(0x9230), arcade_difficulties)
)

// vs mode
rich_presence_conditional_display(byte(0x045DB) == 3, "{0} vs {1} (Versus)",
    rich_presence_lookup("Character", current_character(), characters),
    rich_presence_lookup("Character", current_opponent(), characters),
    rich_presence_lookup("Difficulty", byte(0x9230), arcade_difficulties)
)

// arcade mode
rich_presence_display("{0} vs {1} on {2} (Stage {3})",
    rich_presence_lookup("Character", current_character(), characters),
    rich_presence_lookup("Character", current_opponent(), characters),
    rich_presence_lookup("Difficulty", byte(0x9235), arcade_difficulties),
    rich_presence_value("Stage", byte(0x3432)+1)
)
    
    