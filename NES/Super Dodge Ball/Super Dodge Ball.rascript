// Super Dodge Ball
// #ID = 1991

// $0080: layers left n ther team
function opponent_members() => byte(0x000080)

// $0081: player's players left...
function player_members() => byte(0x000081)

// $015A: level?
//        d8 = win vs shadows
function level() => byte(0x00015A)

// $0181: 0e=blaster?,0f=wave,10=tsunami
//        
//        1a=slug attack?, 17=boomerang
function special() => byte(0x000181)

// $06EA: menu skill level
function difficulty() => byte(0x0006EA)
difficulty_easy = 0
difficulty_medium = 1
difficulty_hard = 2

function mode() => byte(0x006B1)
mode_world_cup = 0
mode_versus = 1
mode_bean_ball = 2

function player_team() => low4(0x007B)
function opponent_team() => low4(0x007A)
teams = {
    0: "Team USA",
    1: "Team All-Stars",
    2: "Team England",
    3: "Team India",
    4: "Team Iceland",
    5: "Team China",
    6: "Team Japan",
    7: "Team Kenya",
    8: "Team USSR",
}

difficulties = {
    difficulty_easy: "easy",
    difficulty_medium: "normal",
    difficulty_hard: "difficult",
}

rich_presence_conditional_display(word(0x0080) == 0, "Menu") // no players on either team

rich_presence_conditional_display(mode() == mode_world_cup && byte(0x0071) == 7, "{0} vs Team Shadow ({1}v{2}) [{3}]",
    rich_presence_lookup("Team", player_team(), teams),
    rich_presence_value("Players", player_members()),
    rich_presence_value("Players", opponent_members()),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)

rich_presence_conditional_display(mode() == mode_world_cup, "{0} vs {1} ({2}v{3}) [{4}]",
    rich_presence_lookup("Team", player_team(), teams),
    rich_presence_lookup("Team", opponent_team(), teams),
    rich_presence_value("Players", player_members()),
    rich_presence_value("Players", opponent_members()),
    rich_presence_lookup("Difficulty", difficulty(), difficulties)
)

rich_presence_conditional_display(mode() == mode_versus, "{0} vs {1} ({2}v{3}) [versus]",
    rich_presence_lookup("Team", player_team(), teams),
    rich_presence_lookup("Team", opponent_team(), teams),
    rich_presence_value("Players", player_members()),
    rich_presence_value("Players", opponent_members())
)

rich_presence_display("{0} vs {1} ({2}v{3}) [bean ball]",
    rich_presence_lookup("Team", player_team(), teams),
    rich_presence_lookup("Team", opponent_team(), teams),
    rich_presence_value("Players", player_members()),
    rich_presence_value("Players", opponent_members())
)



achievement(
    title = "In a Slump", description = "Beat Team India in World Cup on Difficult", points = 10,
    id = 16872, badge = "16341", published = "11/6/2014 3:02:33 PM", modified = "7/4/2020 8:44:22 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 768) && never(word(0x000070) < 768) && never(word(0x000070) > 768) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "The Real All Stars", description = "Beat Team Shadow on Difficult with all 3 players remaining [Note: Must use the DEFAULT lineup]", points = 50,
    id = 23671, badge = "16347", published = "6/12/2015 7:17:30 AM", modified = "4/27/2021 11:10:50 PM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 2048) && never(word(0x000070) < 2048) && never(word(0x000070) > 2048) && 
              once(player_members() > 0) && never(player_members() == 0) && once(level() == 216) && never(level() < 216) && 
              never(level() > 216) && once(difficulty() == 2) && never(difficulty() < 2) && never(difficulty() > 2) && 
              once(player_members() == 3) && never(player_members() < 3) && never(player_members() > 3)
)

achievement(
    title = "Lucky Team America", description = "Beat Team Shadow on Difficult with only 1 team member remaining", points = 25,
    id = 23670, badge = "16347", published = "6/12/2015 7:17:27 AM", modified = "7/4/2020 8:44:44 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && never(once(word(0x000070) != 2048)) && 
              never(once(level() != 216)) && never(once(difficulty() != 2)) && never(player_members() != 1)
)

achievement(
    title = "BOom!", description = "use or see a Boomerang attack", points = 5,
    id = 23669, badge = "24089", published = "6/12/2015 7:14:20 AM", modified = "7/4/2020 8:44:59 AM",
    trigger = once(special() == 23) && never(special() < 23) && never(special() > 23)
)

achievement(
    title = "Across The Room", description = "use or see a slug attack", points = 5,
    id = 23668, badge = "24088", published = "6/12/2015 7:14:17 AM", modified = "7/4/2020 8:46:04 AM",
    trigger = once(special() == 26) && never(special() < 26) && never(special() > 26)
)

achievement(
    title = "Former Shadows", description = "Beat Team Shadow on Difficult", points = 25,
    id = 16878, badge = "16347", published = "11/6/2014 3:02:52 PM", modified = "7/4/2020 8:45:12 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 2048) && never(word(0x000070) < 2048) && never(word(0x000070) > 2048) && 
              once(player_members() > 0) && never(player_members() == 0) && once(level() == 216) && never(level() < 216) && 
              never(level() > 216) && once(difficulty() == 2) && never(difficulty() < 2) && never(difficulty() > 2)
)

achievement(
    title = "Miracle On Concrete", description = "Beat Team USSR in World Cup on Difficult and win cup", points = 10,
    id = 16877, badge = "16346", published = "11/6/2014 3:02:49 PM", modified = "7/4/2020 8:46:33 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 2048) && never(word(0x000070) < 2048) && never(word(0x000070) > 2048) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Tokyo Nights", description = "Beat Team Japan in World Cup on Difficult", points = 10,
    id = 16876, badge = "16345", published = "11/6/2014 3:02:46 PM", modified = "7/4/2020 8:45:42 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1792) && never(word(0x000070) < 1792) && never(word(0x000070) > 1792) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Track Meet", description = "Beat Team Kenya in World Cup on Difficult", points = 10,
    id = 16875, badge = "16344", published = "11/6/2014 3:02:42 PM", modified = "7/4/2020 8:46:46 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1536) && never(word(0x000070) < 1536) && never(word(0x000070) > 1536) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Great Wall of Dodge", description = "Beat Team China in World Cup on Dificult", points = 10,
    id = 16874, badge = "16343", published = "11/6/2014 3:02:39 PM", modified = "7/4/2020 8:47:17 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1280) && never(word(0x000070) < 1280) && never(word(0x000070) > 1280) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Icey Pole", description = "Beat Team Iceland in World Cup on Difficult", points = 10,
    id = 16873, badge = "16342", published = "11/6/2014 3:02:36 PM", modified = "7/4/2020 8:46:56 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1024) && never(word(0x000070) < 1024) && never(word(0x000070) > 1024) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Taste of Success", description = "Beat Team Pro All-Stars in World Cup", points = 10,
    id = 16861, badge = "16325", published = "11/6/2014 8:40:17 AM", modified = "6/12/2015 7:17:37 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 256) && never(word(0x000070) < 256) && never(word(0x000070) > 256) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Little Ben", description = "Beat Team England in World Cup on Difficult", points = 10,
    id = 16871, badge = "16340", published = "11/6/2014 3:02:30 PM", modified = "7/4/2020 8:47:28 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 512) && never(word(0x000070) < 512) && never(word(0x000070) > 512) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "Paper Champions", description = "Beat Team Pro All-Stars in World Cup on Difficult", points = 10,
    id = 16870, badge = "16339", published = "11/6/2014 3:02:27 PM", modified = "7/4/2020 8:47:48 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 256) && never(word(0x000070) < 256) && never(word(0x000070) > 256) && 
              once(player_members() > 0) && never(player_members() == 0) && once(difficulty() == 2) && never(difficulty() < 2) && 
              never(difficulty() > 2)
)

achievement(
    title = "My Shadow", description = "Beat Team Shadow", points = 25,
    id = 16869, badge = "16333", published = "11/6/2014 8:40:42 AM", modified = "7/4/2020 8:47:57 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 2048) && never(word(0x000070) < 2048) && never(word(0x000070) > 2048) && 
              once(player_members() > 0) && never(player_members() == 0) && once(level() == 216) && never(level() < 216) && 
              never(level() > 216)
)

achievement(
    title = "Best of the Rest", description = "Beat Team USSR in World Cup and win the cup", points = 10,
    id = 16868, badge = "16332", published = "11/6/2014 8:40:39 AM", modified = "7/4/2020 8:48:21 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 2048) && never(word(0x000070) < 2048) && never(word(0x000070) > 2048) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Tokyo Drift", description = "Beat Team Japan in World Cup", points = 10,
    id = 16867, badge = "16331", published = "11/6/2014 8:40:36 AM", modified = "6/12/2015 7:17:56 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1792) && never(word(0x000070) < 1792) && never(word(0x000070) > 1792) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Sprint", description = "Beat Team Kenya in World Cup", points = 10,
    id = 16866, badge = "16330", published = "11/6/2014 8:40:33 AM", modified = "7/4/2020 8:48:33 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1536) && never(word(0x000070) < 1536) && never(word(0x000070) > 1536) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Take Out", description = "Beat Team China in World Cup", points = 10,
    id = 16865, badge = "16329", published = "11/6/2014 8:40:30 AM", modified = "7/4/2020 8:48:45 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1280) && never(word(0x000070) < 1280) && never(word(0x000070) > 1280) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Ice Ice Baby...", description = "Beat Team Iceland in World Cup", points = 10,
    id = 16864, badge = "16328", published = "11/6/2014 8:40:26 AM", modified = "6/12/2015 7:17:47 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 1024) && never(word(0x000070) < 1024) && never(word(0x000070) > 1024) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "Yoga Dodge", description = "Beat Team India in World Cup", points = 10,
    id = 16863, badge = "16327", published = "11/6/2014 8:40:23 AM", modified = "7/4/2020 8:49:00 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 768) && never(word(0x000070) < 768) && never(word(0x000070) > 768) && 
              once(player_members() > 0) && never(player_members() == 0)
)

achievement(
    title = "London Dodgeball Falling Down", description = "Beat Team England in World Cup", points = 10,
    id = 16862, badge = "16326", published = "11/6/2014 8:40:20 AM", modified = "7/4/2020 8:49:18 AM",
    trigger = once(opponent_members() == 0) && never(opponent_members() > 0) && once(byte(0x0003CB) == 0) && 
              never(byte(0x0003CB) > 0) && once(byte(0x000403) == 0) && never(byte(0x000403) > 0) && once(byte(0x00043B) == 0) && 
              never(byte(0x00043B) > 0) && once(word(0x000070) == 512) && never(word(0x000070) < 512) && never(word(0x000070) > 512) && 
              once(player_members() > 0) && never(player_members() == 0)
)
