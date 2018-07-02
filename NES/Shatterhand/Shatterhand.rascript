// Shatterhand
// #ID = 1940

// $0002: screen
function current_screen() => byte(0x0002)
screen_gameover = 0x15
screen_scoring = 0x1C

// $0055: Funciona como Nivel  0-8
function current_stage() => byte(0x0055)

// $05C2: Tiempo de armadura
// $05C5: Vida del Dude
// $05C6: Dinero y funciona en 8b
// $05FD: Puntos y solo funcionan en 8b
// $05FE: Puntos y funcionan en 16b
// $060C: CaSI CREO QUE ES EL N????MERO DEL ROBOT
// $06F0: Vida del jefe -ed-
// $06FC: El Robot???

function trigger_area(stage) => current_stage() == stage && byte(0x0002) == screen_scoring // scoring screen

achievement(
    title = "Area A", description = "Complete the Area A", points = 10,
    id = 20134, badge = "19393", published = "1/18/2015 10:39:34 PM", modified = "1/25/2015 5:57:16 AM",
//  trigger_before = once(byte(0x000055) == 8) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(8)
)

// Ticket 9497: Did not triggered at all
//               MD5: 34320f1e332e3a8bbebd1a904597bfa9
achievement(
    title = "Area B", description = "Complete the Area B", points = 10,
    id = 20135, badge = "19398", published = "1/18/2015 10:39:39 PM", modified = "1/25/2015 5:57:19 AM",
//  trigger_before = once(byte(0x000055) == 14) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(14)
)

achievement(
    title = "Area C", description = "Complete the Area C", points = 10,
    id = 20136, badge = "19423", published = "1/18/2015 10:39:43 PM", modified = "1/25/2015 5:57:22 AM",
//  trigger_before = once(byte(0x000055) == 18) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(18)
)

achievement(
    title = "Area D", description = "Complete the Area D", points = 10,
    id = 20137, badge = "19863", published = "1/18/2015 10:39:47 PM", modified = "1/25/2015 5:57:25 AM",
//  trigger_before = once(byte(0x000055) == 17) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(17)
)

achievement(
    title = "Area E", description = "Complete the Area E", points = 10,
    id = 20138, badge = "19425", published = "1/18/2015 10:39:50 PM", modified = "1/25/2015 5:57:27 AM",
//  trigger_before = once(byte(0x000055) == 12) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(12)
)

achievement(
    title = "Area F", description = "Complete the Area F", points = 10,
    id = 20139, badge = "19865", published = "1/18/2015 10:39:52 PM", modified = "1/25/2015 5:57:31 AM",
//  trigger_before = once(byte(0x000055) == 17) && byte(0x000055) == 10 && word(0x0006F4) == 32639
    trigger = trigger_area(13)
)

achievement(
    title = "Area G", description = "Complete the Area G", points = 10,
    id = 20140, badge = "19902", published = "1/18/2015 10:39:56 PM", modified = "1/25/2015 5:57:35 AM",
//  trigger_before = byte(0x000055) == 19 && word(0x0006F4) == 32639 && word(0x0006F6) == 32639 && word(0x0006F8) == 32639 && 
//                   word(0x0006FA) == 32639
    trigger = current_stage() == 19 && current_screen() == 80 // "The End" screen                 
)

achievement(
    title = "Plasma Bot", description = "Summon a Plasma bot", points = 5,
    id = 20141, badge = "19384", published = "1/18/2015 10:40:02 PM", modified = "1/25/2015 5:57:38 AM",
    trigger = byte(0x00060C) == 1 && byte(0x0006FC) == 16
)

achievement(
    title = "Laser Stream Bot", description = "Summon a Laser stream bot", points = 5,
    id = 20142, badge = "19386", published = "1/18/2015 10:40:05 PM", modified = "1/25/2015 5:57:40 AM",
    trigger = byte(0x00060C) == 3 && byte(0x0006FC) == 16
)

achievement(
    title = "Sword Bot", description = "Summon a Sword bot", points = 5,
    id = 20143, badge = "19385", published = "1/18/2015 10:40:08 PM", modified = "1/25/2015 5:57:43 AM",
    trigger = byte(0x00060C) == 7 && byte(0x0006FC) == 16
)

achievement(
    title = "Bounce Bot", description = "Summon a Bounce bot", points = 5,
    id = 20144, badge = "19387", published = "1/18/2015 10:40:10 PM", modified = "1/25/2015 5:57:46 AM",
    trigger = byte(0x00060C) == 4 && byte(0x0006FC) == 16
)

achievement(
    title = "Mine Bot", description = "Summon a Mine bot", points = 5,
    id = 20145, badge = "19388", published = "1/18/2015 10:40:13 PM", modified = "1/25/2015 5:57:52 AM",
    trigger = byte(0x00060C) == 2 && byte(0x0006FC) == 16
)

achievement(
    title = "Flamethrower Bot", description = "Summon a Flamethrower bot", points = 5,
    id = 20146, badge = "19389", published = "1/18/2015 10:40:15 PM", modified = "1/25/2015 5:57:48 AM",
    trigger = byte(0x00060C) == 5 && byte(0x0006FC) == 16
)

achievement(
    title = "Boomerang Bot", description = "Summon a Boomerang bot", points = 5,
    id = 20147, badge = "19390", published = "1/18/2015 10:40:17 PM", modified = "1/25/2015 5:57:55 AM",
    trigger = byte(0x00060C) == 8 && byte(0x0006FC) == 16
)

achievement(
    title = "Sticky Bot", description = "Summon a Sticky bot", points = 5,
    id = 20148, badge = "19391", published = "1/18/2015 10:40:20 PM", modified = "1/25/2015 5:57:57 AM",
    trigger = byte(0x00060C) == 6 && byte(0x0006FC) == 16
)

achievement(
    title = "Double Punch Power", description = "Get the power-up for your punches", points = 5,
    id = 20149, badge = "19392", published = "1/18/2015 10:40:36 PM", modified = "1/25/2015 5:58:00 AM",
    trigger = once(byte(0x0005C8) == 0) && byte(0x0005C8) == 3
)

achievement(
    title = "No Without my Armor", description = "Get the robotic suit", points = 5,
    id = 20150, badge = "19396", published = "1/18/2015 10:40:42 PM", modified = "1/25/2015 5:58:04 AM",
    trigger = once(byte(0x0005C2) == 127) && byte(0x0005C2) == 126
)

achievement(
    title = "Below the Ceiling", description = "Beat the boss in Area A without taking damage", points = 15,
    id = 20151, badge = "19394", published = "1/18/2015 10:41:05 PM", modified = "1/25/2015 5:58:07 AM",
    trigger = byte(0x000055) == 8 && once(byte(0x0006F0) == 32) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Grounded Mines", description = "Beat the boss in Area C without taking damage", points = 15,
    id = 20153, badge = "19422", published = "1/18/2015 10:41:14 PM", modified = "1/25/2015 5:58:10 AM",
    trigger = byte(0x000055) == 18 && once(byte(0x0006F0) == 80) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Where's the Gravity?", description = "Beat the boss in Area E without taking damage", points = 15,
    id = 20154, badge = "19426", published = "1/18/2015 10:41:17 PM", modified = "1/25/2015 5:58:12 AM",
    trigger = byte(0x000055) == 12 && once(byte(0x0006F0) == 32) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Underwater Troubles", description = "Beat the boss in Area D without taking damage", points = 15,
    id = 20155, badge = "19862", published = "1/18/2015 10:41:20 PM", modified = "1/25/2015 5:58:15 AM",
    trigger = byte(0x000055) == 17 && once(byte(0x0006F0) == 64) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Sea of Fire", description = "Beat the boss in Area F without taking damage", points = 15,
    id = 20156, badge = "19866", published = "1/18/2015 10:41:25 PM", modified = "1/25/2015 5:58:18 AM",
    trigger = byte(0x000055) == 13 && once(byte(0x0006F0) == 64) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "The Secret Army", description = "Beat the boss in Area G without taking damage", points = 15,
    id = 20157, badge = "19903", published = "1/18/2015 10:41:55 PM", modified = "1/25/2015 5:58:22 AM",
    trigger = byte(0x000055) == 19 && once(byte(0x0006F0) == 64) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Coins Collector I", description = "Get more than 5000-G in Area A", points = 20,
    id = 20158, badge = "19395", published = "1/18/2015 10:42:26 PM", modified = "1/25/2015 5:58:25 AM",
    trigger = byte(0x000055) == 0 && word(0x0005C6) >= 500 && word(0x0005C6) <= 512
)

// Ticket 10156: I Made more than 10,000 G but the achievement still didn't trigger.
//               MD5: 96639d25a41e7563e4b6048984c796c3
// Ticket 1507: Hello, getting more than 8000g does not seem to trigger "Coins Collector II" achievement (even after
//               beating the boss with no damage taken), i tried different versions of the game but the problem is the
//               same.
achievement(
    title = "Coins Collector II", description = "Get more than 8000-G in Area C", points = 15,
    id = 20159, badge = "19417", published = "1/18/2015 10:42:41 PM", modified = "1/25/2015 5:58:27 AM",
    trigger = byte(0x000055) == 7 && word(0x0005C6) >= 800 && word(0x0005C6) <= 1024
)

achievement(
    title = "Coins Collector III", description = "Reach the boss room in Area D with more than 6000-G", points = 15,
    id = 20160, badge = "19861", published = "1/18/2015 10:42:46 PM", modified = "1/25/2015 5:58:30 AM",
    trigger = byte(0x000055) == 17 && word(0x0005C6) >= 600 && word(0x0005C6) <= 768
)

achievement(
    title = "Strongest Path", description = "Reach the boss room in Area F with more than 4000-G an full health", points = 15,
    id = 20161, badge = "19867", published = "1/18/2015 10:42:51 PM", modified = "1/25/2015 5:58:33 AM",
    trigger = word(0x0005C6) >= 400 && word(0x0005C6) <= 768 && byte(0x0005C5) == 8 && never(byte(0x0005C5) == 0) && 
              once(byte(0x000055) == 2) && byte(0x000055) == 13
)

// Ticket 5707: this  archievements are completly bugged and cant be obtained. please fix
achievement(
    title = "Strongest Path II", description = "Reach the boss room in Area G with more than 5500-G an full health", points = 15,
    id = 20162, badge = "19904", published = "1/18/2015 10:42:57 PM", modified = "1/25/2015 5:58:36 AM",
    trigger = word(0x0005C6) >= 550 && word(0x0005C6) <= 768 && byte(0x0005C5) == 8 && never(byte(0x0005C5) == 0) && 
              once(byte(0x000055) == 16) && byte(0x000055) == 19
)

achievement(
    title = "Alpha Generator", description = "Get 200,000 points", points = 5,
    id = 20163, badge = "19905", published = "1/18/2015 10:43:08 PM", modified = "1/25/2015 5:58:38 AM",
    trigger = byte(0x0005FE) >= 78 && byte(0x0005FF) >= 32 && byte(0x000055) != 19 && byte(0x0005FE) <= 96
)

achievement(
    title = "Beta Generator", description = "Get 300,000 points", points = 10,
    id = 20164, badge = "19868", published = "1/18/2015 10:43:11 PM", modified = "1/25/2015 5:58:41 AM",
    trigger = byte(0x0005FE) >= 117 && byte(0x0005FF) >= 48 && byte(0x000055) != 19 && byte(0x0005FE) <= 144
)

// Ticket 5708: this  archievements are completly bugged and cant be obtained. please fix
achievement(
    title = "Tokkyuu Shirei Soul Brain", description = "How many points can you get?", points = 10,
    id = 20165, badge = "19906", published = "1/18/2015 10:43:15 PM", modified = "1/25/2015 5:58:44 AM",
    trigger = byte(0x000055) != 19 && byte(0x0005FE) >= 140 && byte(0x0005FF) >= 2 && byte(0x0005FE) <= 170
)

// Ticket 10145: The series of 0-G achievements (Aside from Only with Skill) Triggered at the end
//               of the stage no matter how much G i had.
//               MD5: 96639d25a41e7563e4b6048984c796c3
function with_effort(first_stage, boss_stage) => word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && 
                                                 once(byte(0x000055) == first_stage) && byte(0x000055) == boss_stage &&
                                                 never(current_screen() == screen_scoring)
achievement(
    title = "Only with Effort I", description = "Reach the boss room in Area A with 0-G", points = 15,
    id = 20166, badge = "19908", published = "1/18/2015 10:43:30 PM", modified = "3/1/2015 4:11:21 PM",
//  trigger_before = word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && once(byte(0x000055) == 0) && byte(0x000055) == 8
    trigger = with_effort(0, 8)
)

// Ticket 10146: The series of 0-G achievements (Aside from Only with Skill) Triggered at the end
//               of the stage no matter how much G i had.
//               MD5: 96639d25a41e7563e4b6048984c796c3
achievement(
    title = "Only with Effort II", description = "Reach the boss room in Area B with 0-G", points = 15,
    id = 20167, badge = "19909", published = "1/18/2015 10:43:32 PM", modified = "3/1/2015 4:11:14 PM",
//  trigger_before = word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && once(byte(0x000055) == 0) && byte(0x000055) == 8
    trigger = with_effort(11, 14)
)

// Ticket 10147: The series of 0-G achievements (Aside from Only with Skill) Triggered at the end
//               of the stage no matter how much G i had.
//               MD5: 96639d25a41e7563e4b6048984c796c3
achievement(
    title = "Only with Effort III", description = "Reach the boss room in Area E with 0-G", points = 15,
    id = 20168, badge = "19910", published = "1/18/2015 10:43:34 PM", modified = "3/1/2015 4:11:02 PM",
//  trigger_before = word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && once(byte(0x000055) == 0) && byte(0x000055) == 8
    trigger = with_effort(7, 12)
)

// Ticket 10148: The series of 0-G achievements (Aside from Only with Skill) Triggered at the end
//               of the stage no matter how much G i had.
//               MD5: 96639d25a41e7563e4b6048984c796c3
achievement(
    title = "Only with Effort IV", description = "Reach the boss room in Area D with 0-G", points = 20,
    id = 20169, badge = "19911", published = "1/18/2015 10:43:36 PM", modified = "3/1/2015 4:10:53 PM",
//  trigger_before = word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && once(byte(0x000055) == 0) && byte(0x000055) == 8
    trigger = with_effort(5, 17)
)

achievement(
    title = "Only with Skill", description = "Reach the boss room in Area G with 0-G and full health", points = 15,
    id = 20170, badge = "19912", published = "1/18/2015 10:43:38 PM", modified = "1/25/2015 5:58:59 AM",
    trigger = word(0x0005C6) == 0 && never(byte(0x0005C5) == 0) && once(byte(0x000055) == 16) && byte(0x000055) == 19 && 
              byte(0x0005C5) == 8
)

achievement(
    title = "Long Trip", description = "Reach the boss in Area A with the robotic suit", points = 5,
    id = 20171, badge = "19397", published = "1/18/2015 10:43:41 PM", modified = "1/25/2015 5:59:02 AM",
    trigger = once(byte(0x000055) == 0) && byte(0x000055) == 8 && byte(0x0005C2) != 0 && byte(0x0005C2) <= 126
)

achievement(
    title = "Two in One", description = "Beat the boss in Area B without taking damage", points = 15,
    id = 20152, badge = "19399", published = "1/18/2015 10:41:10 PM", modified = "1/25/2015 6:00:36 AM",
    trigger = byte(0x000055) == 14 && once(byte(0x0006F0) == 6) && byte(0x0006F0) == 0 && 
              never(byte(0x0005C5) < prev(byte(0x0005C5))) && never(byte(0x0005C5) == 0)
)

achievement(
    title = "Shatter Soul", description = "Complete the game with the least amount of points that you can", points = 20,
    id = 20172, badge = "19907", published = "1/18/2015 10:43:43 PM", modified = "3/1/2015 4:06:24 PM",
    trigger = byte(0x000055) == 19 && once(byte(0x0006F0) == 64) && byte(0x0006F0) == 0 && byte(0x0005FE) <= 40
)

stages = {
    0x00: "Area A",
    0x08: "Area A", // boss
    0x0A: "Area B",
    0x0B: "Area B",
    0x0E: "Area B", // boss
    0x03: "Area C",
    0x09: "Area C",
    0x12: "Area C", // boss
    0x04: "Area D",
    0x05: "Area D",
    0x11: "Area D", // boss
    0x06: "Area E",
    0x07: "Area E",
    0x0C: "Area E", // boss
    0x01: "Area F",
    0x02: "Area F",
    0x0D: "Area F", // boss
    0x0F: "Area G",
    0x10: "Area G",
    0x13: "Area G", // boss
}

rich_presence_conditional_display(byte(0x0002) == 0x00, "{0}, {1} lives",
    rich_presence_lookup("Stage", byte(0x0055), stages),
    rich_presence_value("Lives", byte(0x071C))
)

rich_presence_conditional_display(byte(0x0002) == 0x1C, "{0}, {1} lives", // scoring
    rich_presence_lookup("Stage", byte(0x0055), stages),
    rich_presence_value("Lives", byte(0x071C))
)

rich_presence_conditional_display(byte(0x0002) >= 0x32 && byte(0x002) <= 0x3F, "{0}, {1} lives", // transition
    rich_presence_lookup("Stage", byte(0x0055), stages),
    rich_presence_value("Lives", byte(0x071C))
)
rich_presence_conditional_display(byte(0x0002) == 0x1A, "Stage Select")

rich_presence_conditional_display(byte(0x0002) >= 0x4D, "Epilogue")
rich_presence_conditional_display(byte(0x0002) == 0x23, "End Credits")

rich_presence_display("Titles")

