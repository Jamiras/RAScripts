// Boogerman: A Pick and Flick Adventure
// #ID = 441

// $0216: Lives (Dec=Hex)
function current_lives() => byte(0x000216)

// $021A: Plungers (Dec=Hex)
function current_plungers() => byte(0x00021A)

// $021E: Score (000,0XX)
function score() => byte(0x00021E)

// $021F: Score (00X,X00)
function score_hundreds() => byte(0x00021F)

// $0220: Score (XX0,000)
function score_tenthousands() => byte(0x000220)

// $0224: Boogers (up to 0x20)
function current_boogers() => byte(0x000224)

// $0226: Burps (up to 0x20)
function current_burps() => byte(0x000226)

// $0228: Milk
// $022A: Carrot

// $022E: Scene (Stages/Screens)
function current_scene() => byte(0x00022E)
function trigger_in_demo() => current_scene() >= 0x32

// $0EF8: Player Health
function current_health() => byte(0x000EF8)

// $0EFA: (Random Variable, Boss Health)?

// $0F22: Boss Health
function boss_health() => byte(0x000F22)
function trigger_defeat_boss(scene) => never(current_scene() != scene) && boss_health() == 0 && once(boss_health() >= 1)

// Ticket 13407: Triggered just before boss fight starts. On screen "Hickboy". RASnes, Hardcore mode, no passwords.
//               MD5: 148dbe529816bb0721190b1d4b7af4f4
// Ticket 13359: Triggered at start of boss fight.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Hickboy", description = "Defeat Hickboy, the first game boss", points = 30,
    id = 30618, badge = "31365", published = "12/5/2015 2:55:18 PM", modified = "12/6/2015 10:33:42 PM",
    trigger = trigger_defeat_boss(9)
)

// Ticket 13395: Activated when I beat 2-4 and was going to the boss stage
//               MD5: 148dbe529816bb0721190b1d4b7af4f4
// Ticket 7992: Both triggered before the fight
achievement(
    title = "Revolta", description = "Defeat Revolta, the second game boss", points = 30,
    id = 30619, badge = "31366", published = "12/5/2015 3:21:25 PM", modified = "12/6/2015 10:33:45 PM",
    trigger = trigger_defeat_boss(15)
)

// Ticket 7993: Both triggered before the fight
achievement(
    title = "Flyboy", description = "Defeat Flyboy, the third game boss", points = 30,
    id = 30620, badge = "31368", published = "12/5/2015 3:59:17 PM", modified = "12/6/2015 10:33:47 PM",
    trigger = trigger_defeat_boss(21)
)

// Ticket 13390: Triggered at start of boss fight
//               MD5: 148dbe529816bb0721190b1d4b7af4f4
//               Emulator: RetroArch ()
achievement(
    title = "Deodor Ant", description = "Defeat Deodor Ant, the fourth game boss", points = 35,
    id = 30621, badge = "31369", published = "12/5/2015 4:18:00 PM", modified = "12/6/2015 10:33:49 PM",
    trigger = trigger_defeat_boss(28)
)

// Ticket 13394: Triggered at start of boss fight
//               MD5: 148dbe529816bb0721190b1d4b7af4f4
//               Emulator: RetroArch ()
achievement(
    title = "Booger King", description = "Defeat Booger Meister and beat the game", points = 40,
    id = 30622, badge = "31370", published = "12/5/2015 4:27:08 PM", modified = "12/6/2015 10:33:51 PM",
    trigger = current_scene() == 33 && boss_health() <= 0 && once(boss_health() >= 1)
)

// Ticket 13360: Triggered at demo.
//               MD5: Unknown
//               Emulator: RetroArch ()
achievement(
    title = "Red Hot Chili Pepper", description = "Collect a pepper", points = 20,
    id = 30650, badge = "31391", published = "12/6/2015 10:32:06 PM", modified = "12/6/2015 10:35:38 PM",
    trigger = byte(0x00022A) >= 1 && !trigger_in_demo()
)

modes = {
    0: "", // normal play
    1: "[Demo] ",
    0xFF: "[Demo] ", // between demos
}

scenes = {
    0x00: "Titles", // Interplay
    0x00: "Titles", // Title screen
    0x02: "Titles", // Password screen
    0x03: "Intro",
    0x04: "Flatulent Swamps 1",
    0x05: "Flatulent Swamps 2",
    0x06: "Flatulent Swamps 3",
    0x07: "Flatulent Swamps 4",
    0x08: "Flatulent Swamps", // Scoring
    0x09: "Flatulent Swamps 5", // Boss fight
    0x0A: "The Pits 1",
    0x0B: "The Pits 2",
    0x0C: "The Pits 3",
    0x0D: "The Pits 4",
    0x0E: "The Pits", // Scoring
    0x0F: "The Pits 5", // Boss
    0x10: "Boogerville 1",
    0x11: "Boogerville 2",
    0x12: "Boogerville 3",
    0x13: "Boogerville 4",
    0x14: "Boogerville", // Scoring
    0x15: "Boogerville 5", // Boss fight
    0x16: "Mucous Mountains 1",
    0x17: "Mucous Mountains 2",
    0x18: "Mucous Mountains", // Scoring
    0x19: "Nasal Caverns 1",
    0x1A: "Nasal Caverns 2",
    0x1B: "Nasal Caverns", // Scoring
    0x1C: "Nasal Caverns 3", // Boss
    0x1D: "Pus Palace 1",
    0x1E: "Pus Palace 2",
    0x1F: "Pus Palace 3",
    0x20: "Pus Palace 4",
    0x21: "Pus Palace 5", // Boss
    0x22: "Flatulent Swamps 1", // Toilet
    0x23: "Flatulent Swamps 2", // Toilet
    0x24: "Flatulent Swamps 3", // Toilet
    0x25: "Flatulent Swamps 4", // Toilet
    0x26: "The Pits 1", // Toilet
    0x27: "The Pits 2", // Toilet
    0x28: "The Pits 3", // Toilet
    0x29: "The Pits 4", // Toilet
    0x2A: "Boogerville 1", // Toilet
    0x2B: "Boogerville 2", // Toilet
    0x2C: "Boogerville 3", // Toilet
    0x2D: "Boogerville 4", // Toilet
    0x2E: "Mucous Mountains 1", // Toilet
    0x2F: "Nasal Caverns 1", // Toilet
    0x30: "Mucous Mountains 2", // Toilet
    0x31: "Nasal Caverns 2", // Toilet
    0x32: "[Demo] Flatulent Swamps 1",
    0x33: "[Demo] The Pits 1",
    0x34: "[Demo] Boogerville 1",
    0x35: "[Demo] Mucous Mountains 1",
    0x36: "Victorious"
}

rich_presence_conditional_display(current_scene() <= 2, "{0}",
    rich_presence_lookup("Stage", current_scene(), scenes)
)

rich_presence_conditional_display(trigger_in_demo(), "{0}",
    rich_presence_lookup("Stage", current_scene(), scenes)
)

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", current_scene(), scenes),
    rich_presence_value("Lives", byte(0x0216))
)
