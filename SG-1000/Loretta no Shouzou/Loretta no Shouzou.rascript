// Loretta no Shouzou: Sherlock Holmes
// [Loretta's Portrait]
// #ID = 25827
// MD5: 8dcdd83e58be634a3735911a1af05bb3 (JP)
// MD5: 21a7d483d75b71eb0997a5c0fdd8544b (EN 1.0)

// https://web.archive.org/web/20201008082032/https://gamefaqs.gamespot.com/sms/916339-sherlock-holmes-loretta-no-shouzou/faqs/58912

function current_day() => byte(0x01a9)
function current_hour() => bcd(byte(0x01a8))
function current_minute_tens() => byte(0x01a7)

function current_scene() => byte(0x01be)
scene_revell_hallway = 0x00
scene_holmes = 0x01
scene_street = 0x02
scene_lagrande = 0x03
scene_stobart = 0x04
scene_katrina = 0x05
scene_philip = 0x06
scene_norwood = 0x07
scene_neil = 0x08
scene_train_station = 0x09
scene_reigate = 0x0a
scene_revell = 0x0b
scene_reigate_river = 0x0c
scene_redhill = 0x0d
scene_inn = 0x0e
scene_revell_richard = 0x0f
scene_revell_piano = 0x10
scene_revell_oscar = 0x11
scene_revell_edward = 0x12
scene_revell_neil = 0x13
scene_revell_patricia = 0x14
scene_revell_julia = 0x15
scene_farm_shed = 0x16
scene_regent_theatre = 0x17
scene_revell_basement = 0x18
scene_map = 0x19
scene_painting = 0x1a
scene_train = 0x1b
scene_game_over = 0x1c
scene_garden_maze = 0x1d
scene_gallery = 0x1e

scenes = {
    scene_revell_hallway: "inside Revell's mansion",
    scene_holmes: "at his house",
    scene_street: "wandering around London",
    scene_stobart: "in Count Stobart's house",
    scene_lagrande: "in LaGrande's house",
    scene_katrina: "in Katrina's house",
    scene_philip: "in Philip's house",
    scene_norwood: "in Norwood",
    scene_neil: "in Neil's house",
    scene_train_station: "at the train station",
    scene_reigate: "in Reigate",
    scene_revell: "at Revell's mansion",
    scene_reigate_river: "in Reigate",
    scene_redhill: "in Redhill",
    scene_inn: "in the Baron Inn",
    scene_revell_richard: "inside Revell's mansion",
    scene_revell_piano: "inside Revell's mansion",
    scene_revell_oscar: "inside Revell's mansion",
    scene_revell_edward: "inside Revell's mansion",
    scene_revell_neil: "inside Revell's mansion",
    scene_revell_patricia: "inside Revell's mansion",
    scene_revell_julia: "inside Revell's mansion",
    scene_revell_basement: "inside Revell's mansion",
    scene_farm_shed: "in a shed",
    scene_regent_theatre: "at the Regent Theatre",
    scene_map: "wandering around London",
    scene_painting: "admiring a painting",
    scene_train: "on a train",
    scene_garden_maze: "in the flower garden",
    scene_game_over: "inside Revell's mansion", // possible to get a game over without misidentifying Stobart?
    scene_gallery: "at the gallery",
}

rich_presence_conditional_display(current_day() == 0, "Titles")
rich_presence_display("Holmes is {0} | Nov {1}, {2}:{3}0",

    rich_presence_lookup("Location", current_scene(), scenes),
    rich_presence_value("Day", current_day()),
    rich_presence_value("Hour", current_hour()),
    rich_presence_value("Minute", current_minute_tens())
)

function flag_set(b) => b == 1 && prev(b) == 0
function flag_clear(b) => b == 0 && prev(b) == 1

// ===== 221B Baker Street =====
// * Ask Painting
// * Ask Gallery
// * Ask Mr.Evans
// * Take Violin
// * Take Gun
// * Take Walking Stick
// * Take Whistle (from right drawer)
// * Take Money (from left drawer)
// * Take Pipe (from fireplace)

achievement("Will This Be a Three-Pipe Problem?", "Get Holmes's pipe.", 2,
    trigger = current_scene() == scene_holmes && flag_set(bit3(0x016c))              
)

// * Go London
// * Go B-5

// ===== Clay's Gallery =====
// * Ask Painting
// * Call Clerk
// * Ask Painting
// * Go London
// * Go B-1

// ===== 221B Baker Street =====
// * Call Mrs.Hudson
// * Take Newspaper
// * Look Article 1

achievement("A Couple More Leads", "Identify other people that Evans painted", 4, type="progression",
    trigger = current_scene() == scene_holmes && flag_set(bit4(0x0167))
)

// * Go London
// * Go D-2

// ===== Katrina's =====
// * Enter green door
// * Ask Mr.Evans
// * Go London
// * Go E-6

// ===== Philip's =====
// * Enter left door (behind Watson)
// * Use Money

achievement("The Painter's Home", "Find out where Neil Evans lives", 4, type="progression",
    trigger = current_scene() == scene_philip && flag_set(bit0(0x0148))
)

// * Go London
// * Go C-4

// ===== Train Station =====
// * Go Norwood

// ===== Norwood =====
// * Ask Mr.Evans
// * Go Evans House

// ===== Evans House =====
// * Use Walking Stick
// * Take hole

achievement("The Girl in the Red Hat", "Find the missing portrait", 5, type="progression",
    trigger = current_scene() == scene_neil && flag_set(bit3(0x01a4))
)

// * Ask painting
// * Ask gallery
// * Ask letter
// * Ask Leticia
// * Ask 3 years ago
// * Ask letter
// * Go Reigate

// ===== Reigate =====
// * Click the button. Instead of the menu opening, you'll decide to take a break.
// >> Password [HABHTLYJAY] [QAFHCLTYAY] [VAYHTHYJAY]
// * Use Newspaper
// * Go Revell

// ===== Revell Mansion =====
// * Enter Mansion
// * Ask Painting
// * Ask Daughter
// * Look very left part of cabinet (below wine glasses)

achievement("It's Over There", "Find the bloody shoe", 5, type="progression",
    trigger = current_scene() == scene_revell_richard && flag_set(bit5(0x0121))
)

// * Go Hallway
// * Look anywhere three times. A letter will "arrive".
// * Go outside
// * Go town

// ===== Redhill =====
// * Ask
// * Ask
// * Go Baron Inn

// ===== Baron Inn =====
// * Look painting
// * Ask painting
// * Ask daughter
// * Go outside

achievement("Come Again Soon!", "Receive a brandy", 2, type="progression",
    trigger = current_scene() == scene_inn && byte(0x0299) == 0x5F && prev(byte(0x0299)) == 0
)

// * Go Norwood
// * Go Evans House

// ===== Evans House =====
// * Call Letitia
// * Look Hair
// * Look Neck
// * Look open drawer
// * Take open drawer
// * Move bottom of left leg of easel

achievement("The Other Shoe", "Find the second shoe", 5, type="progression",
    trigger = current_scene() == scene_neil && flag_set(bit0(0x015c))
)

// * Take bottom of left leg of easel
// * Take Letitia
// * Go Reigate
// * Go Revell

// ===== Revell Mansion =====
// * Enter mansion
// * Show shoes
// * Show handkerchief

achievement("Reunited", "Confirm the relationship between Richard and Loretta", 3, type="progression",
    trigger = current_scene() == scene_revell_richard && flag_set(bit4(0x0117))
)

// * Go Hallway
// * Take bone
// * Take lamp
// - look at stuff until the maid arrives
// * Go Hallway
// - use the controller to navigate 
//   you start in the lower right corner at 1, and want to get to 5
//
//       +--------+-----------------------------------------------------+
//       | LEGEND | ! = Door, # = Secret Door, 1 = Dining Room,         |
//       |        | 2 = Edward, 3 = Julia, 4 = Evans, 5 = Patricia,     |
//       |        | 6 = Richard, 7 = Oscar, 8 = Sculpture, 9 = Basement |
//       +--------+-----------------------------------------------------+
//
//
//           -----***-------------------------*******-------------****
//           |   | # | 8                     |*******|           |****
//           |   |***-------------   -----   ---------   -----   -----
//           |   |***************|   |***|               |***|       |
//           |   ---------***-----   -------------   -----***-----   |
//           |         8 | # |           |*******|   |***********|   |
//           |   ---------***|   -----   |*******-----***---------   |
//           |   |***********|   |***|   |***************|           |
//           |   ---------***|   |***|   |***---------***|   ---------
//           |           |***| 8 |***| 8 |***|       |***| 9 |********
//           -----   -------------------------   -----------------****
//           ****|   |***| 7 |***| 5 |***|       |***| 4 | # | 2 |****
//           ****|   |***| ! |***| ! |***|   -----***| ! |***| ! |****
//           ****|   |***|   |***|   |***|   |*******|   |***|   |****
//           -----   |***|   -----   -----   ---------   -----   -----
//           |       |***|                                           |
//           |   ---------   ---------   ---------   -----   -----   |
//           |   |***|       |*******|   |*******|   |***|   |***|   |
//           |   -----   -------------   ---------   |***| ! |***| ! |
//           |           |***| 6 !                   |***| 3 |***| 1 |
//           -------------***-------------------------***-----***-----
//
// * Forward, left, forward 8 times, right, forward.
// * Enter door

// ===== Patricia's room =====
// * Look Patricia
// * Move Patricia
// * Go Hallway
//   go back to the dining room: forward, left, forward 8 times, right, forward.

// ===== Dining room =====
// * Call Maid
// * Ask Patricia
// * Go Hallway
//   go to the entrance: forward, left, forward 4 times, left, forward twice, right, forward 4 times.

// ===== Entrance =====
// * Use Brandy

achievement("Wake Up!", "Help Richard regain conciousness", 5, type="progression",
    trigger = current_scene() == scene_revell_richard && flag_set(bit0(0x0123))
)

// * Look Letter
// * Ask Documents
// * Go Hallway
//   go to Edward's room: forward four times, left, forward twice, right, forward 3 times, left, forward.

// ===== Edward's room =====
// * Ask Loretta
// * Ask Loretta
// * Go Hallway
//   go to Oscar's room: forward, right, forward 9 times, right, forward.

// ===== Oscar's room =====
// * Ask Patricia
// * Ask Loretta
// >> Password [QQHHCLYAAK] [MQKHMHKAAK] [SQVHDHYYAK] [HQKHTLYKAY]

// * Use Bone
// * Look Dog
// - Now you get to navigate the garden maze. You can't walk on the flowers, but you can step over the
//   small plants. You'll almost always want to step over them when you see them as the prints will jump
//   through a diagonal you won't be able to follow.
// - Make sure not to push the left button or you'll go back to the start!

achievement("Tiptoe Through the Tulips", "Make your way through the garden", 5, type="progression",
    trigger = current_scene() == scene_farm_shed && prev(current_scene()) == scene_garden_maze
)

// ===== Shed =====
// * Look Knife
// * Look Body
// * Take Knife
// * Go Revell

// ===== Revell Mansion =====
// * Go Hallway
//   go to Neil's room: forward, left, forward 3 times, right, forward.
// * Enter Door
// * Ask Oscar
// * Show Knife
// * Go Hallway
//   go to Oscar's room: forward, right, forward 7 times, right, forward.
// * Enter Door.
// * Look Drawer (of back table)
// * Look Diary
// * Go Hallway
//   back to the dining room: forward, left, forward 10 times, right, forward.
// * Enter Door.
//   the maid will deliver a note.
// * Go Hallway
//   walk past all the rooms until you find a statue: forward, left, forward 10 times, left, forward,
//   right, forward, left, forward, right, forward twice, right, forward twice, right, forward, left,
//   forward three times, left, forward, right, forward twice, right, forward.
// * Move Sculpture

achievement("Every Mansion has a Hidden Passage", "Find the entrance to the basement", 3, type="progression",
    trigger = current_scene() == 0 && byte(0x01c5) == 5 && prev(byte(0x01c5)) < 5
)

// * Enter Door
//   follow the passage: forward, left, forward twice, right, forward twice, right, forward, left,
//   forward three times, left, forward, right, forward twice, right, forward, left, forward, right,
//   forward twice, right, forward twice, left.
// * Hit Sculpture
// * Enter Door

// ===== Revell Basement =====
// * Use Lamp
// * Look Bottle
// * Take Bottle
// * Look Photo
// * Take Photo
// * Look Photo
// * Go Hallway
//   I don't understand this part, just push right three times and down twice and end up outside.
// * Go Revell

// ===== Revell Mansion =====
// * Call Maid
// * Take Hairpin
// * Go Outside
// * Go Town
// * Go London
// * Go C-3

// ===== Regent Theatre =====
// * Show Photo
// * Ask Brenda
// * Enter Entrance
// * Go London
// * Go B-7

// ===== LaGrande's house =====
// * Enter second white door
// * Ask Brenda
// * Ask Stobart
// * Show Photo
// * Go London
// * Go A-4

// ===== Count Stobart's house =====
// * Hit blue door
// * Use hairpin

achievement("The Missing Girl", "Find Loretta", 5, type="progression",
    trigger = current_scene() == scene_stobart && prev(current_scene()) == scene_street
)

// * Go London
// * Go C-4
// * Go Reigate
// * Go Revell
// * Enter Mansion

// ===== Revell Mansion =====
// * Use Violin
//   - Puppy Waltz

achievement("One Memory at a Time", "Help Loretta remember", 2, type="progression",
    trigger = current_scene() == scene_revell_piano && flag_set(bit5(0x0116))
)

// * Go Hallway
//   go to Richard's room: forward, left, forward four times, left, forward twice, right, forward four times
// * Enter Door
// * Show Bottle
// * Butler
// * Enter Hallway
//   back to the hidden basement: forward, left, forward twice, left, forward three times, left, forward,
//   right, forward, left, forward, right, forward twice, right, forward twice, right, forward, left,
//   forward three times, left, forward, right, forward twice, right, forward.
// * Move Sculpture
// * Enter Door
//   continue to the dark room: forward, left, forward twice, right, forward twice, right, forward, left,
//   forward three times, left, forward, right, forward twice, right, forward, left, forward, right,
//   forward twice, right, forward twice, left
// * Hit Sculpture
// * Enter Door
// * Use Lamp
//   Stobart will fire at you and run. Right three times and down twice to run into him again.
// * Use Gun

achievement("Stobart's Defeat", "Solve the mystery", 10, type="win_condition",
    trigger = current_scene() == scene_revell_basement && flag_set(bit1(0x0199))
)
