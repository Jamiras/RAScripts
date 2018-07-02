// The Lion King
// #ID = 878

// $000A8B: valor de confirma????????o
// $000AC1: Boss Active
// $000AC3: valor expressivo
// $000ACD: Conclus????o de stage
// $000ACE: outro valor
// $001FF0: Boss active 3
// $002004: HP Lion
// $00B22F: Bug Toss
// $00B231: Bugg Toss tamb????m
// $00B259: Instante damage

// $01FF92: Difficulty 00= easy   01= normal   02= hard
function current_difficulty() => byte(0x01FF92)

// $01FF9E: Stage
function current_stage() => byte(0x01FF9E)

// $01FFA2: Morte
function current_health() => byte(0x01FFA2)

// $01FFA8: Continue

// $01FFAA: Lives
function current_lives() => byte(0x01FFAA)

function trigger_title_screen() => byte(0x0AC5) == 0x5F
function trigger_demo_mode() => bit7(0x1E04) == 1

// Ticket 8074: Achievement triggering during the demo
// Ticket 4309: game over on stage 2, let the demo play and the unlocked
achievement(
    title = "Singing and Jumping", description = "Complete the stage \"Can't wait to be king\" in Normal", points = 10,
    id = 12873, badge = "12582", published = "9/12/2014 2:53:48 AM", modified = "9/12/2014 6:44:30 PM",
    trigger = repeated(1000, current_stage() == 1) && // spend some time on stage 2
              current_difficulty() == 1 &&            // on normal
              byte(0x01FF9C) == 0 && 
              once(byte(0x000ACD) == 204) &&          // supposed to be complete stage, but happens a lot during stages...
              once(byte(0x000AC1) == 255) &&          // supposed to be boss active, but triggers when you die
              current_stage() == 2 &&                 // reach stage 3
              byte(0x000A8B) == 255 &&
              never(trigger_title_screen())           // reset hit counts to prevent triggering in demos
)

// Ticket 8069: Triggering in the demo
achievement(
    title = "Party in the Forest", description = "Complete the stage \"Hakuna Matata\" in Normal", points = 10,
    id = 12877, badge = "12679", published = "9/12/2014 3:12:14 AM", modified = "9/12/2014 6:44:39 PM",
    trigger = current_difficulty() == 1 && current_stage() == 5 && byte(0x01FF9C) == 0 && byte(0x000AC3) == 6 && 
              byte(0x000ACE) == 4 && !trigger_demo_mode()
)

// Ticket 4310: game over on stage 2, let the demo play and the unlocked
achievement(
    title = "Moving with style", description = "Beat the second stage without losing any life ", points = 10,
    id = 12903, badge = "12778", published = "9/12/2014 3:33:26 AM", modified = "9/12/2014 6:45:44 PM",
    trigger = once(current_stage() == 0) && 
              repeated(1000, current_stage() == 1) &&
              once(byte(0x000ACD) == 204) && 
              once(byte(0x000AC1) == 255) && 
              current_stage() == 2 && 
              byte(0x01FF9C) == 0 && 
              byte(0x000A8B) == 255 &&
              never(current_health() == 1) &&
              never(trigger_title_screen())
)

// Ticket 12356: I beat the game and i did not get the achievement
//               MD5:  I did not get the achievement
//               Emulator: RASnes9x
achievement(
    title = "The Lion King", description = "Beat the game without losing any life", points = 45,
    id = 12904, badge = "12779", published = "9/12/2014 3:33:38 AM", modified = "9/12/2014 6:45:46 PM",
    trigger = once(current_stage() == 0) && once(current_stage() == 1) && once(current_stage() == 2) && 
              once(current_stage() == 3) && once(current_stage() == 4) && once(current_stage() == 5) && 
              once(current_stage() == 6) && once(current_stage() == 7) && once(current_stage() == 8) && 
              current_stage() == 9 && byte(0x01FF9C) == 0 && byte(0x000A8B) == 0 && byte(0x000AC3) == 4 && 
              never(current_health() == 1) && never(trigger_title_screen())
)

stages = {
    0x00: "The Pridelands",
    0x01: "Can't Wait to Be King",
    0x02: "The Elephant Graveyard",
    0x03: "The Stampede",
    0x04: "Simba's Exile",
    0x05: "Hakuna Matata",
    0x06: "Simba's Destiny",
    0x07: "Be Prepared",
    0x08: "Simba's Return",
    0x09: "Pride Rock",
    0x0A: "Bug Toss",
    0x0B: "Bug Hunt I",
    0x0C: "Bug Hunt II",
    0x0D: "Bug Hunt III",
    0x0E: "Titles",
}

rich_presence_conditional_display(trigger_title_screen(), "Titles")
rich_presence_conditional_display(trigger_demo_mode(), "[Demo] {0}",
    rich_presence_lookup("Stage", current_stage(), stages)
)
rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", current_stage(), stages),
    rich_presence_value("Lives", current_lives())
)

