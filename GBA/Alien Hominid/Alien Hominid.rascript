// Alien Hominid
// #ID = 5068
// MD5: 18ef4ec828a4bf14b6fd241230bb349a (E)

// $000110: screen
function current_screen() => byte(0x000110)

// $000114: level?
function current_level() => byte(0x000114)
levels = {
    0: "Level 1-1",
    1: "Level 1-2",
    2: "Level 1-3",
    3: "Level 1-4",
    4: "Level 2-1",
    5: "Level 2-2",
    6: "Level 2-3",
    7: "Level 2-4",
    8: "Level 3-1",
    9: "Level 3-2",
    10: "Level 3-3",
    11: "Level 3-4",
    12: "Victorious",
}

// $000126: difficulty?
function current_difficulty() => byte(0x000126)
difficulty_easy = 1
difficulty_normal = 2
difficulty_hard = 3
difficulties = {
    difficulty_easy: "Easy",
    difficulty_normal: "Medium",
    difficulty_hard: "Hard",
}

// $000130: ,lives
function current_lives() => byte(0x000130)

// $000132: continues
function current_continues() => byte(0x000132)

// $0003DA: difficulty?
function selected_difficulty() => byte(0x0003DA)

// $0003F6: enemy health
function enemy_hp() => byte(0x0003F6)

// $00177C: chicken
// $001848: soviet 255

// $0100A4: enemy health2
function enemy_hp2() => byte(0x0100A4)

rich_presence_conditional_display(current_screen() < 0x0D, "Titles")
rich_presence_conditional_display(current_screen() == 0x16, "Credits")
rich_presence_conditional_display(current_screen() == 0x17, "Titles") // score

rich_presence_conditional_display(current_screen() == 0x28, "Playing Chicken Lickin'")
rich_presence_conditional_display(current_screen() == 0x29, "Playing Missile Mastar")

rich_presence_display("{0}, {1}, {2} Continues",
    rich_presence_lookup("Level", current_level(), levels),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties),
    rich_presence_value("Continues", current_continues())
)


achievement(
    title = "Fire Shot", description = "Collect the Orange Power-up.", points = 5,
    id = 15517, badge = "15093", published = "10/15/2014 7:50:03 PM", modified = "10/15/2014 7:50:14 PM",
    trigger = byte(0x000470) == 2
)

achievement(
    title = "Acid Blast", description = "Collect the Green Power-up.", points = 5,
    id = 15518, badge = "15094", published = "10/15/2014 7:50:04 PM", modified = "10/15/2014 7:50:15 PM",
    trigger = byte(0x000470) == 1
)

achievement(
    title = "Ice Ray", description = "Collect the Blue Power-up.", points = 5,
    id = 15519, badge = "15095", published = "10/15/2014 7:50:06 PM", modified = "10/15/2014 7:50:16 PM",
    trigger = byte(0x000470) == 3
)

achievement(
    title = "Laser Pulse", description = "Collect the Red Power-up.", points = 5,
    id = 15520, badge = "15096", published = "10/15/2014 7:50:07 PM", modified = "10/15/2014 7:50:18 PM",
    trigger = byte(0x000470) == 4
)

achievement(
    title = "Megu Cannon", description = "Collect the Yellow Power-up.", points = 5,
    id = 15521, badge = "15097", published = "10/15/2014 7:50:09 PM", modified = "10/15/2014 7:50:19 PM",
    trigger = byte(0x000470) == 5
)

achievement(
    title = "Photon Burst", description = "Collect the Purple Power-up.", points = 5,
    id = 15522, badge = "15098", published = "10/15/2014 7:50:10 PM", modified = "10/15/2014 7:50:21 PM",
    trigger = byte(0x000470) == 6
)

achievement(
    title = "Spread Shot", description = "Collect the White Power-up.", points = 5,
    id = 15523, badge = "15099", published = "10/15/2014 7:50:12 PM", modified = "10/15/2014 7:50:22 PM",
    trigger = byte(0x000470) == 7
)

achievement(
    title = "Chickin Lickin'", description = "Play Chicken Lickin'.", points = 5,
    id = 15350, badge = "14948", published = "10/14/2014 7:02:20 AM", modified = "10/14/2014 7:02:26 AM",
    trigger = byte(0x00177C) == 1
)

achievement(
    title = "That Was Painful", description = "Hit a dozen.", points = 5,
    id = 15351, badge = "14949", published = "10/14/2014 7:02:23 AM", modified = "10/14/2014 7:02:28 AM",
    trigger = byte(0x00177C) == 12
)

function trigger_mastar(score) => word(0x18E8) >= score && current_screen() == 41

achievement(
    title = "U.S.S.MASTA.R", description = "Play Super Soviet Missile Mastar", points = 5,
    id = 15225, badge = "14845", published = "10/12/2014 10:24:15 PM", modified = "10/12/2014 10:31:52 PM",
    trigger = trigger_mastar(1)
)

// Ticket 1682: I already have 3000KM achievement but i can't get the 1020KM achievement.
achievement(
    title = "Soviet Score System", description = "Travel more than 1000 KM in Super Soviet Missile Mastar.", points = 5,
    id = 15226, badge = "14846", published = "10/12/2014 10:24:17 PM", modified = "10/12/2014 10:32:04 PM",
    trigger = trigger_mastar(1000)
)

achievement(
    title = "Soviet Nuke Master", description = "Travel more than 3000 KM in Super Soviet Missile Mastar.", points = 15,
    id = 15227, badge = "14849", published = "10/12/2014 10:30:10 PM", modified = "10/12/2014 10:53:44 PM",
    trigger = trigger_mastar(3000)
)

achievement(
    title = "Crash Landing", description = "Clear Level 1-1", points = 20,
    id = 15212, badge = "14842", published = "10/12/2014 8:33:41 PM", modified = "10/12/2014 10:30:26 PM",
    trigger = current_level() == 1 && current_difficulty() < 4
)

achievement(
    title = "Frantic", description = "Clear Level 1-2", points = 20,
    id = 15213, badge = "14842", published = "10/12/2014 8:33:42 PM", modified = "10/12/2014 10:30:30 PM",
    trigger = current_level() == 2 && current_difficulty() < 4
)

achievement(
    title = "Tank", description = "Clear Level 1-3", points = 20,
    id = 15214, badge = "14842", published = "10/12/2014 8:33:44 PM", modified = "10/12/2014 10:30:37 PM",
    trigger = current_level() == 3 && current_difficulty() < 4
)

achievement(
    title = "Get To The Choppa!", description = "Clear Level 1-4", points = 20,
    id = 15215, badge = "14842", published = "10/12/2014 8:33:46 PM", modified = "10/12/2014 10:30:41 PM",
    trigger = current_level() == 4 && current_difficulty() < 4
)

achievement(
    title = "Blade", description = "Clear Level 2-1", points = 20,
    id = 15216, badge = "14842", published = "10/12/2014 8:33:48 PM", modified = "10/12/2014 10:30:45 PM",
    trigger = current_level() == 5 && current_difficulty() < 4
)

achievement(
    title = "Mammoth", description = "Clear Level 2-2", points = 20,
    id = 15217, badge = "14842", published = "10/12/2014 8:33:50 PM", modified = "10/12/2014 10:30:49 PM",
    trigger = current_level() == 6 && current_difficulty() < 4
)

achievement(
    title = "Puzzle", description = "Clear Level 2-3", points = 20,
    id = 15218, badge = "14842", published = "10/12/2014 8:33:52 PM", modified = "10/12/2014 10:30:52 PM",
    trigger = current_level() == 7 && current_difficulty() < 4
)

achievement(
    title = "Shield Spawner", description = "Clear Level 2-4", points = 20,
    id = 15219, badge = "14842", published = "10/12/2014 8:33:53 PM", modified = "10/12/2014 10:30:56 PM",
    trigger = current_level() == 8 && current_difficulty() < 4
)

achievement(
    title = "Scorpion Horde", description = "Clear Level 3-1", points = 20,
    id = 15220, badge = "14842", published = "10/12/2014 8:33:55 PM", modified = "10/12/2014 10:31:02 PM",
    trigger = current_level() == 9 && current_difficulty() < 4
)

achievement(
    title = "Dig And Be Eaten", description = "Clear Level 3-2", points = 20,
    id = 15221, badge = "14842", published = "10/12/2014 8:33:56 PM", modified = "10/12/2014 10:31:05 PM",
    trigger = current_level() == 10 && current_difficulty() < 4
)

achievement(
    title = "Crushers", description = "Clear Level 3-3", points = 20,
    id = 15222, badge = "14842", published = "10/12/2014 8:33:58 PM", modified = "10/12/2014 10:31:09 PM",
    trigger = current_level() == 11 && current_difficulty() < 4
)

// Ticket 12870: Cheevo didn't triggered after doing the requisites, more than 3 times.
//               MD5: 18ef4ec828a4bf14b6fd241230bb349a
achievement(
    title = "Phone Home", description = "Complete Alien Hominid.. It's Harder than you think.", points = 30,
    id = 15223, badge = "14843", published = "10/12/2014 8:33:59 PM", modified = "5/17/2018 10:00:25 PM",
    trigger = current_level() == 11 && current_difficulty() < 4 && enemy_hp() < 3 && enemy_hp() != 0 && 
              byte(0x000485) > 0
)

// Ticket 12871: Cheevo didn't triggered after doing the requisites, more than 3 times.
//               MD5: 18ef4ec828a4bf14b6fd241230bb349a
// Ticket 4371: I have beat the game on hard one time when i have already finish in normal
//               And i finish it a second time by deleting my save and restart the game and it did'nt trigger at all
// Ticket 4067: in hard mode was not unlocked
achievement(
    title = "The Behemoth", description = "Beat Alien Hominid on Hard Difficulty.", points = 80,
    id = 15224, badge = "14841", published = "10/12/2014 8:34:03 PM", modified = "5/17/2018 10:00:27 PM",
    trigger = current_level() == 11 && current_difficulty() == 3 && enemy_hp() < 3 && enemy_hp() != 0 && 
              byte(0x000485) > 0
)
