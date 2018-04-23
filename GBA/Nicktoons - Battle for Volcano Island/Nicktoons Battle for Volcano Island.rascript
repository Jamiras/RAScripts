// Nicktoons: Battle for Volcano Island
// #ID = 6407
// MD5: 07f3b7415eb3779ff11e51a38d0ad3f8

// bonus level locations: https://www.youtube.com/watch?v=tEayfscgqqg and https://www.youtube.com/watch?v=V4qKXw9h02I

// $0118: Stage Completion?

// $0134: What Character is in Use?
//        1=Sponge 2=Danny 3=Timmy 4=Patrick
function current_character() => byte(0x000134)
character_spongebob = 1
character_danny = 2
character_timmy = 3
character_patrick = 4

characters = {
    character_spongebob: "SpongeBob",
    character_danny: "Danny Phantom",
    character_timmy: "Timmy Turner",
    character_patrick: "Patrick",
}

// $0510: Screen
function current_screen() => byte(0x000514)
screen_logos = 1
screen_transition = 5
screen_in_game = 6
screen_file_select = 11
screen_story = 12
screen_title = 13
screen_options = 14
screen_credits = 15
screen_paused = 16
screen_complete_level = 17
screen_warning = 18

// $052E: Stage
function current_stage() => byte(0x00052E)
stages = {
    0xFFFF: "Title",
    0: "the Hub", // nexus
    1: "the Intro",
    2: "the Intro",
    3: "World 1-1",
    4: "World 1-2",
    5: "World 1-3",
    6: "World 1-4",
    7: "World 2-1",
    8: "World 2-2",
    9: "World 2-3",
    10: "World 2-4",
    11: "World 3-1",
    12: "World 3-2",
    13: "World 3-3",
    14: "World 3-4",
    15: "World 4-1",
    16: "World 4-2",
    17: "World 4-3",
    18: "World 4-4",
    19: "World 5-1",
    20: "World 5-2",
    21: "World 5-3",
    22: "World 5-4",
    24: "Bonus 1",
    25: "Bonus 2",
    26: "Bonus 3",
    27: "the Final Battle"
}

rich_presence_conditional_display(current_screen() != screen_in_game && current_screen() != screen_paused && 
                                  current_screen() != screen_story && current_screen() != screen_transition &&
                                  current_screen() != screen_complete_level, "Title")
rich_presence_display("{0} is in {1}",
    rich_presence_lookup("Character", byte(0x013A) + 1, characters),
    rich_presence_lookup("Location", current_stage(), stages)
)


// $054F: Active save game
function current_save_game() => byte(0x00054F)

// $0564: Main Character's Health
function current_hp() => byte(0x000564)

// $0565: Main Character's Current Golden Hearts
function current_hearts() => byte(0x000565)

// $0582: Total Rip-Zipper (First Game File)
// $0583: Total Golden Hearts (First Game File)
// $059A: Total Rip-Zippers (Second Game File)
// $059B: Total Golden Hearts (Second Game File)
// $05B2: Total Rip-Zippers (Game File Three)
// $05B3: Total Golden Hearts (Game File Three)

function trigger_in_game() => current_screen() == screen_in_game
function trigger_rip_zippers(count) => 
    (current_save_game() == 0 && byte(0x000582) >= count) || 
    (current_save_game() == 1 && byte(0x00059A) >= count) || 
    (current_save_game() == 2 && byte(0x0005B2) >= count)
function trigger_golden_hearts(count) =>
    (current_save_game() == 0 && byte(0x000583) >= count) || 
    (current_save_game() == 1 && byte(0x00059B) >= count) || 
    (current_save_game() == 2 && byte(0x0005B3) >= count)

achievement(
    title = "He Was Just Fourteen...", description = "Play as Danny Phantom", points = 10,
    id = 51487, badge = "52944", published = "8/5/2017 6:59:42 PM", modified = "8/5/2017 7:54:11 PM",
    trigger = trigger_in_game() && current_character() == character_danny
)

achievement(
    title = "Just An Average Kid", description = "Play as Timmy Turner", points = 20,
    id = 51488, badge = "52945", published = "8/5/2017 7:00:00 PM", modified = "8/5/2017 7:54:15 PM",
    trigger = trigger_in_game() && current_character() == character_timmy && trigger_rip_zippers(2)
)

achievement(
    title = "No, This Is Patrick", description = "Play as Patrick Star", points = 20,
    id = 51489, badge = "52947", published = "8/5/2017 7:00:05 PM", modified = "8/5/2017 7:54:18 PM",
    trigger = trigger_in_game() && current_character() == character_patrick
)

// Ticket 9374: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "What Is This?", description = "Obtain your first Rip-Zipper", points = 10,
    id = 51490, badge = "52953", published = "8/5/2017 7:00:08 PM", modified = "8/5/2017 7:54:22 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(1)
)

// Ticket 9375: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Ready For The New World", description = "Obtain your second Rip-Zipper and open the first barrier", points = 15,
    id = 51491, badge = "52959", published = "8/5/2017 7:00:12 PM", modified = "8/5/2017 7:54:26 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(2)
)

// Ticket 9376: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Stone Statue Pusher", description = "Obtain six Rip-Zippers and open the second barrier", points = 20,
    id = 51492, badge = "52971", published = "8/5/2017 7:00:15 PM", modified = "8/5/2017 7:54:29 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(6)
)

// Ticket 9377: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Time To Get Some Pants", description = "Obtain twelve Rip-Zippers and open the third barrier", points = 20,
    id = 51493, badge = "52958", published = "8/5/2017 7:00:18 PM", modified = "8/5/2017 7:54:31 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(12)
)

// Ticket 9378: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Prepare For Destruction", description = "Obtain eighteen Rip-Zippers and open the final barrier", points = 20,
    id = 51494, badge = "52955", published = "8/5/2017 7:00:20 PM", modified = "8/5/2017 7:54:33 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(18)
)

achievement(
    title = "An Official Rip-Zipper", description = "Obtain all Rip-Zippers in the game", points = 50,
    id = 51495, badge = "52980", published = "8/5/2017 7:00:23 PM", modified = "8/5/2017 7:54:36 PM",
    trigger = trigger_in_game() && trigger_rip_zippers(23)
)

achievement(
    title = "First Of A Hundred", description = "Obtain your first Golden Heart", points = 10,
    id = 51496, badge = "52975", published = "8/5/2017 7:00:25 PM", modified = "8/5/2017 7:54:38 PM",
    trigger = trigger_in_game() && current_hearts() == 1
)

// Ticket 9379: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Just Getting Started", description = "Obtain forty Golden Hearts", points = 20,
    id = 51497, badge = "52964", published = "8/5/2017 7:00:27 PM", modified = "8/5/2017 7:54:39 PM",
    trigger = trigger_in_game() && trigger_golden_hearts(40)
)

// Ticket 9380: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "Over Half Way There", description = "Obtain sixty Golden Hearts", points = 20,
    id = 51498, badge = "52966", published = "8/5/2017 7:00:29 PM", modified = "8/5/2017 7:54:41 PM",
    trigger = trigger_in_game() && trigger_golden_hearts(60)
)

// Ticket 9381: Triggered as I started game
//               MD5: 07f3b7415eb3779ff11e51a38d0ad3f8
achievement(
    title = "All Bonus Levels Unlocked", description = "Obtain eighty Golden Hearts", points = 25,
    id = 51499, badge = "52973", published = "8/5/2017 7:00:30 PM", modified = "8/5/2017 7:54:44 PM",
    trigger = trigger_in_game() && trigger_golden_hearts(80)
)

achievement(
    title = "That's Impressive!", description = "Obtain all Golden Hearts in the Game", points = 70,
    id = 51500, badge = "52977", published = "8/5/2017 7:00:32 PM", modified = "8/5/2017 7:54:46 PM",
    trigger = trigger_in_game() && trigger_golden_hearts(115)
)

achievement(
    title = "Five Of A Kind", description = "Obtain all five Golden Hearts in a level", points = 20,
    id = 51501, badge = "52968", published = "8/5/2017 7:00:34 PM", modified = "8/5/2017 7:54:48 PM",
    trigger = trigger_in_game() && current_hearts() == 5
)

achievement(
    title = "All Because Of A Hermit Crab", description = "Defeat Mawgu and finish the game", points = 50,
    id = 51502, badge = "52952", published = "8/5/2017 7:00:36 PM", modified = "8/5/2017 7:54:49 PM",
    trigger = word(0x000118) == 4777 && current_hearts() == 0 && trigger_rip_zippers(12)
)
