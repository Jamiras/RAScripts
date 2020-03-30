// Clay Fighter
// #ID = 857

// $2008: game difficulty- hard = 2
// $3A7F: player total wins in a game(whole game) resets if you use a continue
//        
//        24= total wins beating game and not using continue
// $3A80: player total damage? resets if you use continue
// $3A83: opponent total wins in a round(resets after round)
// $3A84: opponent total damage 1
// $3A85: opponent total damage 2
// $3A8B: player wins in single round?
// $3A8D: opponent wins in single round
// $3A8F: player health
// $3A93: opponent health
// $3BD1: level code?
// $3C17: character code

function p1_fighter() => byte(0x3C15)
function p2_fighter() => byte(0x3C19)
fighters = {
    0: "Bad Mr. Frosty",
    1: "Taffy",
    2: "Tiny",
    3: "The Blob",
    4: "Blue Suede Goo",
    5: "Ickybod Clay",
    6: "Helga",
    7: "Bonker",
    8: "N. Boss",
}

function difficulty() => byte(0x2008)
difficulties = {
    0: "easy",
    1: "medium",
    2: "hard",
}

function opponent_is_cpu() => byte(0x3C43) == 1
function round() => byte(0x3BD1)

rich_presence_conditional_display(opponent_is_cpu(), "{0} vs. {1} (fight {2} on {3})",
    rich_presence_lookup("fighter", p1_fighter(), fighters),
    rich_presence_lookup("fighter", p2_fighter(), fighters),
    rich_presence_value("round", round() + 1),
    rich_presence_lookup("difficulty", difficulty(), difficulties)
)

rich_presence_conditional_display(byte(0x20E8) == 1, "{0} vs. {1} (vs mode)",
    rich_presence_lookup("fighter", p1_fighter(), fighters),
    rich_presence_lookup("fighter", p2_fighter(), fighters)
)

rich_presence_display("Titles")

achievement(
    title = "Clay Beater", description = "Beat the Game", points = 10,
    id = 17809, badge = "17229", published = "11/25/2014 12:31:25 AM", modified = "11/25/2014 1:31:36 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B)
)

achievement(
    title = "Clay Harder", description = "Beat the Game on Hard Mode", points = 20,
    id = 17817, badge = "17238", published = "11/25/2014 12:36:18 AM", modified = "11/25/2014 1:36:11 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x002008) == 0x02) && never(byte(0x002008) < 0x02) && never(byte(0x002008) > 0x02)
)

// Ticket 15739: essa conquista nao funcionou na minha conta antiga tb teve que ser dada manualmente
//               MD5: 90e90f2aae4770ee98130580a594e2bb
// Ticket 13408: //               MD5: 90e90f2aae4770ee98130580a594e2bb
achievement(
    title = "Broccoli and Water", description = "Beat the Game on Hard Mode using no continues", points = 50,
    id = 17821, badge = "17242", published = "11/25/2014 12:44:01 AM", modified = "11/25/2014 1:32:12 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x002008) == 0x02) && never(byte(0x002008) < 0x02) && never(byte(0x002008) > 0x02) && 
              once(byte(0x003A7F) == 0x24) && never(byte(0x003A7F) < 0x24) && never(byte(0x003A7F) > 0x24)
)

achievement(
    title = "Snowplow", description = "Beat the Game as Mr Frosty", points = 10,
    id = 17822, badge = "17243", published = "11/25/2014 12:58:12 AM", modified = "11/25/2014 1:41:46 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x00) && never(byte(0x003C17) > 0x00)
)

achievement(
    title = "Candyman", description = "Beat the Game as Taffy", points = 10,
    id = 17823, badge = "17244", published = "11/25/2014 12:58:15 AM", modified = "11/25/2014 1:41:49 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x01) && never(byte(0x003C17) < 0x01) && never(byte(0x003C17) > 0x01)
)

achievement(
    title = "Flexing", description = "Beat the Game as Tiny", points = 10,
    id = 17824, badge = "17245", published = "11/25/2014 12:58:19 AM", modified = "11/25/2014 1:41:53 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x02) && never(byte(0x003C17) < 0x02) && never(byte(0x003C17) > 0x02)
)

achievement(
    title = "Claymaker", description = "Beat the Game as The Blob", points = 10,
    id = 17825, badge = "17246", published = "11/25/2014 12:58:22 AM", modified = "11/25/2014 1:41:56 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x03) && never(byte(0x003C17) < 0x03) && never(byte(0x003C17) > 0x03)
)

achievement(
    title = "Oh Baby!", description = "Beat the Game as Blue Suede Goo", points = 10,
    id = 17826, badge = "17247", published = "11/25/2014 12:58:25 AM", modified = "11/25/2014 1:41:59 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x04) && never(byte(0x003C17) < 0x04) && never(byte(0x003C17) > 0x04)
)

achievement(
    title = "Fright", description = "Beat the Game as Ickybod Clay", points = 10,
    id = 17827, badge = "17248", published = "11/25/2014 12:58:28 AM", modified = "11/25/2014 1:42:03 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x05) && never(byte(0x003C17) < 0x05) && never(byte(0x003C17) > 0x05)
)

achievement(
    title = "Eat!!!!", description = "Beat the Game as Helga", points = 10,
    id = 17828, badge = "17249", published = "11/25/2014 12:58:31 AM", modified = "11/25/2014 1:42:07 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x06) && never(byte(0x003C17) < 0x06) && never(byte(0x003C17) > 0x06)
)

achievement(
    title = "Clowning", description = "Beat the Game as Bonker", points = 10,
    id = 17829, badge = "17250", published = "11/25/2014 12:58:35 AM", modified = "11/25/2014 1:42:10 AM",
    trigger = once(byte(0x003A8B) == 0x02) && never(byte(0x003A8B) < 0x02) && never(byte(0x003A8B) > 0x02) && 
              once(byte(0x003BD1) == 0x0B) && never(byte(0x003BD1) < 0x0B) && never(byte(0x003BD1) > 0x0B) && 
              once(byte(0x003C17) == 0x07) && never(byte(0x003C17) < 0x07) && never(byte(0x003C17) > 0x07)
)

function trigger_damageless_level(level) => byte(0x3BD1) == level && // on correct stage
                                            word(0x3A84) == 0 && // no damage taken
                                            byte(0x3A8B) == 2 && // win two fights
                                            opponent_is_cpu()

achievement(
    title = "Opera House", description = "Beat Level 1 without being hit ", points = 20,
    id = 17833, badge = "17251", published = "11/25/2014 1:28:26 AM", modified = "11/25/2014 1:35:01 AM",
    trigger = trigger_damageless_level(0) && word(0x3A80) > 0 // damage done (prevents trigger on starting game after playing vs)
)

achievement(
    title = "Haunted House", description = "Beat Level 2 without being hit ", points = 20,
    id = 17834, badge = "17252", published = "11/25/2014 1:28:30 AM", modified = "11/25/2014 1:35:05 AM",
    trigger = trigger_damageless_level(1)
)

achievement(
    title = "Taffy Factory", description = "Beat Level 3 without being hit ", points = 20,
    id = 17835, badge = "17253", published = "11/25/2014 1:28:33 AM", modified = "11/25/2014 1:35:08 AM",
    trigger = trigger_damageless_level(2)
)

achievement(
    title = "Sideshow", description = "Beat Level 4 without being hit ", points = 20,
    id = 17836, badge = "17255", published = "11/25/2014 1:28:37 AM", modified = "11/25/2014 1:35:12 AM",
    trigger = trigger_damageless_level(3)
)

achievement(
    title = "Boxing Ring", description = "Beat Level 5 without being hit ", points = 20,
    id = 17837, badge = "17256", published = "11/25/2014 1:28:40 AM", modified = "11/25/2014 1:35:16 AM",
    trigger = trigger_damageless_level(4)
)

achievement(
    title = "Elvis In Town", description = "Beat Level 6 without being hit ", points = 20,
    id = 17838, badge = "17259", published = "11/25/2014 1:28:43 AM", modified = "11/25/2014 1:35:19 AM",
    trigger = trigger_damageless_level(5)
)

achievement(
    title = "Taffy Factory Again...", description = "Beat Level 7 without being hit ", points = 20,
    id = 17839, badge = "17260", published = "11/25/2014 1:28:47 AM", modified = "11/25/2014 1:35:24 AM",
    trigger = trigger_damageless_level(6)
)

achievement(
    title = "It's Christmas", description = "Beat Level 8 without being hit ", points = 20,
    id = 17840, badge = "17262", published = "11/25/2014 1:28:50 AM", modified = "11/25/2014 1:35:28 AM",
    trigger = trigger_damageless_level(7)
)

achievement(
    title = "A Day At The Swamp", description = "Beat Level 9 without being hit ", points = 20,
    id = 17841, badge = "17263", published = "11/25/2014 1:28:54 AM", modified = "11/25/2014 1:35:32 AM",
    trigger = trigger_damageless_level(8)
)

achievement(
    title = "Colosseum", description = "Beat Level 10 without being hit ", points = 20,
    id = 17842, badge = "17264", published = "11/25/2014 1:28:58 AM", modified = "11/25/2014 1:35:35 AM",
    trigger = trigger_damageless_level(9)
)

achievement(
    title = "A Cute Duck!", description = "Beat Level 11 without being hit ", points = 20,
    id = 17843, badge = "17266", published = "11/25/2014 1:29:02 AM", modified = "11/25/2014 1:35:41 AM",
    trigger = trigger_damageless_level(10)
)

achievement(
    title = "The Boss With No Name", description = "Beat Level Final Level without being hit ", points = 20,
    id = 17844, badge = "17267", published = "11/25/2014 1:29:06 AM", modified = "11/25/2014 1:35:45 AM",
    trigger = trigger_damageless_level(11)
)
