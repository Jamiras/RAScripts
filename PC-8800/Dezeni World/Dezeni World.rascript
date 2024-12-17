// Dezeni World
// #ID = 30826
// MD5: b951d24c58e13ce81267cfcac433c6d0 [Neo Kobe] (mkII)
// MD5: 283563f6202914596439481f86c7b42d [Neo Kobe]

// In Quasi88, make sure Sub-CPU is set to always.

// Press (RCtrl)+R to enter kana mode. Supposedly (Ctrl+R) will convert romaji to kana.


function screen_id() => byte(0x020b)
screen_recuitment = 0x00
screen_nagoya_welcome_sign = 0x01
screen_nagoya_station_sign = 0x02
screen_rental_shop_outside = 0x03
screen_rental_shop_desk = 0x04
screen_station_outside = 0x05
screen_station_ticket_machine = 0x06
screen_station_train = 0x07
screen_nagoya_crossroads = 0x08
screen_nagoya_street = 0x09
screen_nagoya_taxi = 0x0a
screen_nagoya_pumpkin_king = 0x0b
screen_nagoya_pumpkin_king_happy = 0x0c
screen_park_arch = 0x0d
screen_park_statue = 0x0e
screen_park_skeleton = 0x0f
screen_park_monkeys = 0x10
screen_park_monkey_closeup = 0x11
screen_park_restroom_outside = 0x12
screen_park_restroom_inside = 0x13
screen_park_restroom_ultraman = 0x14
screen_park_restroom_grafitti = 0x15
screen_nagoya_pub_outside = 0x16
screen_pub_inside = 0x17
screen_pub_bartender = 0x18
screen_pub_facing_phone_room = 0x19
screen_pub_phone_room = 0x1a
screen_pub_answer_phone = 0x1b
screen_pub_superman = 0x1c
screen_pub_pig_far = 0x1d
screen_pub_pig_close = 0x1e
screen_pub_register = 0x1f
screen_nagoya_pumpkin_king_happy2 = 0x20
screen_pub_phone_room_empty = 0x21
screen_station_train_leaving = 0x22

screen_dezeni_world_arch = 0x28
screen_dezeni_world_path_footprints = 0x29
screen_pavillion_outside = 0x2a
screen_pavillion_robots_1 = 0x2b
screen_pavillion_robots_2 = 0x2c
screen_pavillion_robots_3 = 0x2d
screen_pavillion_entryway = 0x2e
screen_pavillion_exit = 0x2f
screen_pavillion_hallway = 0x30
screen_pavillion_wall_writing = 0x31
screen_pavillion_table = 0x32
screen_pavillion_security_door = 0x33
screen_cosmo_outside = 0x34
screen_cosmo_dezeniman_glasses = 0x35
screen_cosmo_ship = 0x36
screen_cosmo_space_bus = 0x37
screen_cosmo_space_hauler = 0x38
screen_cosmo_space_shuttle = 0x39
screen_cosmo_projector = 0x3a
screen_cosmo_droid = 0x3b
screen_cosmo_droid_unplugged = 0x3c
screen_cosmo_entryway = 0x3d
screen_cosmo_terminal = 0x3e
screen_cosmo_security_door = 0x3f
screen_ssn_outside = 0x40
screen_ssn_terror_dog = 0x41
screen_ssn_akeruna_door = 0x42
screen_ssn_cracked_walls = 0x43
screen_ssn_doors = 0x44
screen_ssn_table = 0x45
screen_ssn_fish_statue = 0x46
screen_ssn_statue_moved = 0x47
screen_ssn_escape = 0x48
screen_ssn_crash = 0x49
screen_office_outside = 0x4a
screen_office_tables = 0x4b
screen_office_skeleton = 0x4c
screen_office_whiteboard = 0x4d
screen_office_large_desk = 0x4e
screen_office_desk_monitor = 0x4f
screen_office_shaking = 0x50
screen_hal_passage = 0x51
screen_hal_dezeniman = 0x52
screen_hal_big_door = 0x53
screen_hal_aquarium = 0x54
screen_hal_wave = 0x55
screen_hal_drain = 0x56
screen_hal_airduct_closeup = 0x57
screen_hal_airduct_closeup_open = 0x58
screen_hal_ladder = 0x59
screen_hal_captured = 0x5a
screen_hal_escort = 0x5b
screen_hal_prison_cell = 0x5c
screen_hal_prison_door = 0x5d
screen_hal_memory_room_door = 0x5e
screen_hal_memory_unit = 0x5f
screen_hal_shutter = 0x60
screen_hal_cpu = 0x61
screen_hal_terminal = 0x62
screen_hal_reset = 0x63
screen_hal_reset2 = 0x64
screen_hal_plug = 0x65
screen_hal_pulling_plug = 0x66
screen_hal_panel = 0x67
screen_hal_panel_closeup = 0x68
screen_hal_panel_open = 0x69
screen_hal_panel_cable_pulled = 0x6a
screen_hal_panel_cable_reconnected = 0x6b
screen_hal_cpu_reset = 0x6c
screen_hal_cpu_star = 0x6d
screen_hal_cpu_off = 0x6e
screen_hal_cpu_explosion = 0x6f
screen_hal_cpu_rubble = 0x70
screen_epilogue_relax = 0x71
screen_epilogue_butamaru_enter = 0x72
screen_epilogue_butamaru_machine = 0x73
screen_epilogue_butamaru_machine2 = 0x74
screen_epilogue_butamaru_busting_out = 0x75
screen_epilogue_butamaru_walking = 0x76
screen_epilogue_butamaru_underfoot = 0x77
screen_epilogue_butamaru_belly = 0x78
screen_epilogue_butamaru_deflated = 0x79
screen_epilogue_butamaru_fallen = 0x7a
screen_epilogue_soshite = 0x7b
screen_epilogue_interview = 0x7c
screen_epilogue_sunset = 0x7d

regions = {}
for i in range(0x00, 0x01) {
    regions[i] = "Intro"
}
for i in range(0x02, 0x29) {
    regions[i] = "In Nagoya"
}
for i in range(0x0d, 0x15) {
    regions[i] = "At the park"
}
for i in range(0x16, 0x1f) {
    regions[i] = "At the pub"
}
regions[0x21] = "At the pub"
for i in range(0x28, 0x29) {
    regions[i] = "At Dezeni World"
}
for i in range(0x2a, 0x33) {
    regions[i] = "At the Pavillion"
}
for i in range(0x34, 0x3f) {
    regions[i] = "At Cosmo Image"
}
for i in range(0x40, 0x49) {
    regions[i] = "In the Nagoya Starship"
}
for i in range(0x4a, 0x50) {
    regions[i] = "At the office"
}
for i in range(0x51, 0x5b) {
    regions[i] = "Infiltrating HAL3's lair"
}
for i in range(0x5c, 0x70) {
    regions[i] = "Fighting HAL3"
}
for i in range(0x71, 0x7b) {
    regions[i] = "Epilogue"
}
regions[screen_epilogue_interview] = "Victorious"
regions[screen_epilogue_sunset] = "Victorious"

function chapter() => byte(0x020a)

rich_presence_conditional_display(chapter() == 0, "Titles")
rich_presence_conditional_display(chapter() > 5, "Titles")
rich_presence_display("Chapter {0}: {1}",
    rich_presence_value("chapter", chapter()),
    rich_presence_lookup("location", screen_id(), regions)
)

function story_achievement(title, description, points, screen, mem)
{
    achievement(title, description, points,
        trigger = screen_id() == screen && byte(mem) == 1 && prev(byte(mem)) == 0        
    )
}

// Original walkthrough: http://www2.plala.or.jp/yasinoue/oldgame/dzw_p1.html

// When the game starts, it asks if you want to watch the introduction. [y/n]
// - If you select "Y", "Special News" gets plastered across the screen and the game hangs.
//   - The intro doesn't hang when using the non-mkII disk image.
// - If you select "N", the title screen shows up and you're asked if you want to load a game.
// - Select "N" again to start the game.

// The first screen is Dezeniman getting his mission: To stop HAL3. There are allies in Nagoya City, but
//   also spies from Saitama. After being given your mission, you'll end up at a giant sign saying "Welcome
//   to Nagoya".
// Go right twice to reach Pub Yoda
// > R
// > R
// Enter the pub
// > F
// Approach the bar and talk to the man.
// > F
// > TALK
// He'll send you to answer the phone.
// > L
// > F
// > F
story_achievement("It's For You", "Answer the phone at the bar", 1, screen_pub_superman, 0x0224)
// After the phone call, you'll bump into the person who was changing in the second booth.
// > TALK
// He mentions someone is looking at you. Approach the pig and talk to it.
// > F
// > TALK
// > TALK
// > TALK
// He warns you that those who have gone after HAL have failed, but wishes you luck. Leave the pub.
// > B
// > F
// > B
// Back at the crossroads, head to the park, then to the restroom.
// > L
// > F
// > F
// > F
// There's a sound coming from one of the stalls. Let's investigate!
// > OPEN DOOR
story_achievement("When You Gotta Go", "Find out what's making the noise in the park bathroom", 1, 
                  screen_park_restroom_ultraman, 0x21a)
// Well, that was awkward. We can leave now.
// > B
// > R
// There's a girl here. Let's talk to her.
// > TALK
// > TALK
// > TALK
// > TALK
// Apparently, she left some tools with the monkeys that we need.
// > L
// > B
// > L
// The monkeys are looking at the monolith. We need to get their attention.
// > CALL MONKEY
// A monkey offers you the tools.
// > GET BAG
story_achievement("Good Monkey", "Get the tools", 2, screen_park_monkeys, 0x0226)
// > B
// > R
// There's a skeleton here. But apparently, it's not quite dead.
// > TALK
// > TALK
// > TALK
// > TALK
// > TALK
// Apparently he went crazy trying to stop HAL and died laughing. Let's leave the park.
// > B
// > B
// > B
// > F
// > F
// There's a pumpkin man here.
// > TALK
// > TALK
// > TALK
// > TALK
// > TALK
// > TALK
// He also failed to defeat HAL and now he's poor.
// Dezeniman only has paper money, and the ticket booth only accepts coins. Somehow, you need to have the
//   Pumpkin King exchange the money. You can go directly to the Pumpkin King and give him the money, but
//   that doesn't allow the story to advance past the ticket booth. It's unclear whether or not buying the
//   ticket fails, but the game doesn't automatically switch to the train scene.
// > GIVE MONEY
story_achievement("A Happy Gourd", "Cheer up the Pumpkin King", 1, screen_nagoya_pumpkin_king_happy, 0x021D)
// > B
// > R
// There's a man here in a car. Talk to him.
// > TALK
// > TALK
// > TALK
// The taxi driver is afraid of Dezeni World and won't take us. Let's go somewhere else.
// > B
// > B
// > B
// > L
// > F
// It's a rental shop. Go in and try to rent a car.
// > F
// > BORROW CAR
// He won't let us take a car to Dezeni World, but suggests the rail line.
// > B
// > B
// > R
// > F
// We can buy a ticket with the coins from the Pumpkin King.
// > BUY TICKET
// > F
achievement("The Magical Kingdom?", "Arrive in Dezeni World", 5, type="progression",
    trigger = screen_id() == screen_dezeni_world_arch &&
              prev(screen_id()) == screen_station_train_leaving
)
// We've arrived at Dezeni world
// > F
// There are some footprints here, and a piece of paper.
// > GET PAPER
// > READ PAPER
// It's a message from Butumaru. He's taunting us.
// > F
// > F
// > F
// > R
// We're in the private part of the pavillion now.
// > L
// > GET HAMMER
// > B
// > R
// There's a sign here warning us not to continue. But we don't care...
// > F
// Odd writing on the wall. Probably need to remember 9164.
// > L
// > GET PAPER
// > READ PAPER
// The paper says the key is needed to stop HAL3. So, take it!
// > GET KEY
// > B
// > F
// > HIT DOOR
// > HIT DOOR
// > HIT DOOR
// > HIT DOOR
story_achievement("Hammer Time", "Break through the sturdy door", 3, screen_pavillion_security_door, 0x0233)
// > F
// Somewhere new. Let's go in.
// > F
// > F
// A spaceship. Might as well hop in.
// > F
// > F
// > F
// > F
// > F
// We seem to be in a loop. It's just a virtual environment provided by the glasses. Remove them.
achievement("Virtual Unreality", "End the space loop", 2, type="progression",
    trigger = screen_id() == screen_cosmo_projector &&
              prev(screen_id()) >= screen_cosmo_space_bus &&
              prev(screen_id()) <= screen_cosmo_space_shuttle
)
// > REMOVE GLASS
// There's a giant projecter. Let's investigate.
// > F
// > F
// The robot won't let us pass.
// > PULL CABLE
// > F
// We're in another building. Let's explore.
// > L
// A terminal.
// > READ PAPER
// It's out of order.
// > B
// > R
// A locked door. A note, and some footprints.
// > READ POSTER
// Butamaru is bragging about disabling the terminal.
// > PUSH BUTTON
// Apparently we have to enter a four digit code. Remember the number we wrote down earlier?
// > PUSH 9164
story_achievement("The Writing on the Wall", "Unlock the security door", 3, screen_cosmo_security_door, 0x0235)
// > F
// > F
// > LOOK STATUE
// It's a Terror Dog. Who ya gonna call? Noone. We don't have a phone. What else can we do?
// > HIT STATUE
// Well, that opened a door. Shall we proceed?
// > F
// > F
// That wall doesn't look like it's in very good shape.
// > HIT WALL
// That's not the part of the wall I thought would break. Oh, well. Go in.
// > F
// More doors. Front first.
// > F
// > LOOK TABLE
// > GET CARD
// > B
// > L
// A giant fish statue. Can we hit it? No, but we can move it.
// > MOVE STATUE
// > F
// The whole building is rolling. Run! It crashed into a lake.
achievement("Round Buildings Can Roll", "Escape from the Starship Nagoya", 3, type="progression",
    trigger = screen_id() == screen_ssn_crash &&
              prev(screen_id()) == screen_ssn_escape
)
// > R
// > F
// > F
// There's a message on the screen. HAL3 is taunting us.
// > B
// > L
// Another table with a piece of paper on it.
// > GET PAPER
// > READ PAPER
// "The number is 812".
// > L
// > F
// Butamaru's face is on the monitor.
// > INSERT CARD
// It tells me to say the number.
// > SAY 812
// The room starts to shake. It's an elevator, and it's going down!
achievement("Going Down", "Enter HAL3's Lair", 5, 
    trigger = screen_id() == screen_hal_passage &&
              prev(screen_id()) == screen_office_shaking
)
// > F
// > F
// Totally optional brush with death
// > PUSH BUTTON
// > F
// > STAND
achievement("Water Cooling", "Go for an unexpected swim and return", 2, type="missable", 
    trigger = screen_id() == screen_hal_big_door &&
              prev(screen_id()) == screen_hal_drain
)
// Brush with death over. Let's get out of here.
// > LOOK AIRDUCT
// > OPEN NET
// > F
// > F
// We're captured and taken to prison.
// > L
// > INSERT KEY
achievement("Jailbreak", "Escape from Prison", 2,
    trigger = screen_id() == screen_hal_memory_room_door &&
              prev(screen_id()) == screen_hal_prison_door
)
// > F
// There's a big sign that says "Don't Remove", so that's exactly what we should do.
// > REMOVE MEMORY
// > REMOVE MEMORY
// > REMOVE MEMORY
// > REMOVE MEMORY
// > REMOVE MEMORY
// > REMOVE MEMORY
// > REMOVE MEMORY
// Eventually HAL3 will retreat into a subsystem and we'll appear in front of door. Go in!
// > F
// > F
// Pushing the buttons here doesn't seem to do anything.
// > L
// There's a big button here, and some scribbles saying it's not connected.
// > PUSH BUTTON
// Nothing happens. (Supposedly, this is supposed to appear like the user's computer was reset).
// > R
// > R
// A power cable. Remember what we did to that robot?
// > PULL CABLE
// Apparently HAL3 thought of that too.
// > R
// > F
// HAL3 tells us to stop. We must be getting close to a solution.
// > OPEN PANEL
// > PULL CABLE
// > CONNECT CABLE
// > PUSH BUTTON
achievement("CPU Destroyed", "Destroy HAL3", 5, type="progression",
    trigger = screen_id() == screen_hal_cpu_rubble &&
              prev(screen_id()) == screen_hal_cpu_explosion
)
// > F
// Butamaru runs into the building.
// > F
// And gets trapped in a machine.
// > F
// > F
// The giant Butamaru is just standing there.
// > LOOK
// > TALK
// HAL3 has embedded himself into Butamaru. Approach him.
// > F
// > LOOK
// > LOOK NABEL
// > GET STOPPER
achievement("Size Doesn't Matter", "Defeat Butamaru", 5, type="win_condition",
    trigger = screen_id() == screen_epilogue_butamaru_fallen &&
              prev(screen_id()) == screen_epilogue_butamaru_deflated
)
