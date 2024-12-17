// New Addams Family Series, The
// #ID = 28642
// MD5: 2d2a8314f789d490bf83ed3c44538fe3 

// A = action, B = examine, D-Pad to move, Start to open inventory, Select to save from inventory
// Down on D-Pad to advance dialog

function current_scene() => byte(0xc535)

scene_entryway = 0x00 // south of morticia painting
scene_morticia_painting = 0x01
scene_carnivorous_plant = 0x02 // right from morticia painting
scene_library = 0x03 // door where morticia is painting
scene_torture_wheel = 0x04 // south from hallway
scene_greenhouse = 0x05 // north of carnivorous plant
scene_suit_of_armor = 0x06 // right of torture wheel
scene_treasury = 0x07
scene_grannys_room = 0x08 // north from dungeon
scene_electric_chair = 0x09 // east from dungeon
scene_dungeon = 0x0a // below gargoyle stairs
scene_hallway = 0x0b
scene_pugsleys_bedroom = 0x0c
scene_wednesdays_bedroom = 0x0d
scene_attic = 0x0e
scene_gargoyle_balcony = 0x0f // left from hallway
scene_graveyard = 0x10
scene_front_door = 0x12
scene_neighbor_fence = 0x13
scene_greenhouse2 = 0x14
scene_outside_greenhouse = 0x15
scene_outside_woodworms = 0x16
scene_outside_swamp = 0x17
scene_outside_bud = 0x18
scene_tomb_coffin = 0x19
scene_graveyard2 = 0x1a
scene_tomb_entrance = 0x1b
scene_tomb_ghost = 0x1c
scene_tomb_ruby = 0x1d
scene_halloween_entrance = 0x1e
scene_halloween_mayor = 0x1f
scene_halloween_door = 0x20
scene_halloween_potion_room = 0x21
scene_halloween_duster_room = 0x22
scene_halloween_jackolantern = 0x23
scene_halloween_mr_pumpkin = 0x24
scene_halloween_mayors_office = 0x25
scene_gargoyle_stairs = 0x26 // west from morticia painting
scene_outside_swamp_stick = 0x27
scene_outside_crocodile = 0x31
scene_outside_possums = 0x32
scene_outside_bugs = 0x33
scene_outside_snake = 0x34
scene_halloween_crevice = 0x35
scene_tomb_crevasse = 0x39
scene_tomb_plumes = 0x3a
scene_tomb_spit = 0x3b
scene_tomb_zombie_hands = 0x3c
scene_tomb_bats = 0x3d
scene_halloween_pumpkins = 0x3e
scene_halloween_pumpkin_crows = 0x3f
scene_halloween_witch = 0x40
scene_halloween_plumes = 0x41

scenes = {
    scene_entryway: "in the entryway",
    scene_front_door: "wandering outside",
    scene_neighbor_fence: "wandering outside",
    scene_morticia_painting: "in the foyer",
    scene_carnivorous_plant: "near the carnivorous plant",
    scene_library: "in the library",
    scene_torture_wheel: "near the torture wheel",
    scene_greenhouse: "in the greenhouse",
    scene_greenhouse2: "in the greenhouse",
    scene_suit_of_armor: "near the suit of armor",
    scene_grannys_room: "visiting Granny",
    scene_electric_chair: "visiting Fester",
    scene_dungeon: "in the dungeon",
    scene_hallway: "in the hallway",
    scene_pugsleys_bedroom: "in Pugsley's bedroom",
    scene_wednesdays_bedroom: "in Wednesday's bedroom",
    scene_attic: "in the attic",
    scene_gargoyle_balcony: "on the balcony",
    scene_gargoyle_stairs: "near the dungeon",
    scene_outside_greenhouse: "wandering outside",
    scene_outside_snake: "wandering outside",
    scene_outside_crocodile: "wandering outside",
    scene_outside_possums: "wandering outside",
    scene_outside_bugs: "wandering outside",
    scene_outside_woodworms: "wandering outside",
    scene_outside_swamp: "wandering outside",
    scene_outside_swamp_stick: "wandering outside",
    scene_graveyard: "in the graveyard",
    scene_graveyard2: "in the graveyard",
    scene_tomb_entrance: "in the tomb",
    scene_tomb_bats: "in the tomb",
    scene_tomb_zombie_hands: "in the tomb",
    scene_tomb_ghost: "in the tomb",
    scene_tomb_crevasse: "in the tomb",
    scene_tomb_ruby: "in the tomb",
    scene_tomb_spit: "in the tomb",
    scene_tomb_plumes: "in the tomb",
    scene_tomb_coffin: "in the tomb",
    scene_treasury: "in the treasury",
    scene_halloween_entrance: "in the land of Halloween",
    scene_halloween_mayor: "at the Halloween party",
    scene_halloween_crevice: "in the land of Halloween",
    scene_halloween_plumes: "in the land of Halloween",
    scene_halloween_witch: "in the land of Halloween",
    scene_halloween_door: "in the land of Halloween",
    scene_halloween_potion_room: "in the witch's house",
    scene_halloween_pumpkins: "at the pumpkin patch",
    scene_halloween_jackolantern: "at the pumpkin patch",
    scene_halloween_duster_room: "in a crypt",
    scene_halloween_pumpkin_crows: "at the pumpkin patch",
    scene_halloween_mr_pumpkin: "at the pumpkin patch",
    scene_halloween_mayors_office: "in the mayor's office",
}

function current_character() => byte(0xc5d2)
character_pugsley = 0
character_wednesday = 1

characters = {
    character_pugsley: "Puglsey",
    character_wednesday: "Wednesday",
}

rich_presence_conditional_display(word(0xc52a) == 0, "Titles")
rich_presence_display("{0} is {1}",
    rich_presence_lookup("Who", current_character(), characters),
    rich_presence_lookup("Where", current_scene(), scenes)
)


function item_picked_up(id) => bit5(0xa000 + id) == 0 && prev(bit5(0xa000 + id)) == 1

item_oil = 0x0020
item_pump = 0x0021
item_leaf = 0x0024
item_tomato = 0x0025
item_document = 0x006f // 0x00a1 in inventory
item_spellbook = 0x007f
item_statue = 0x008b
item_scalp = 0x0082
item_cable = 0x0084
item_kite = 0x008c
item_candle = 0x008d
item_greenhouse_key = 0x0095
item_cigar = 0x0097
item_sword = 0x0099
item_weed_killer = 0x009d
item_first_deed = 0x00a1
item_pump_weed_killer = 0x00a3
item_paintbrush = 0x00a5
item_paintbrush_rotten_wood = 0x00a6
item_can = 0x00a9
item_can_clean = 0x00aa
item_can_woodworms = 0x00ac
item_branch = 0x00ae
item_doll = 0x00c3
item_antenna = 0x00c5
item_kite_cable = 0x00c7
item_kite_antenna = 0x00c8
item_kite_lightning_rod = 0x00c9
item_torch = 0x00e0
item_lit_torch = 0x00e2
item_combined_skeleton = 0x00e5
item_skeleton = 0x00e6
item_ruby = 0x00e7
item_skull = 0x00e8
item_second_deed = 0x00f1
item_bag = 0x00fe
item_key = 0x100
item_thing = 0x0102
item_duster = 0x0140
item_can = 0x0142
item_dandruff = 0x0144
item_fan = 0x0145
item_potion = 0x0147
item_powder = 0x0148
item_baby_octopus = 0x0149
item_axe = 0x014c
item_pumpkin_scalp = 0x14d
item_mr_pumpkin = 0x14f
item_screaming_skull = 0x0150
item_mr_pumpkin_burned_down = 0x0155
item_screamer = 0x0157
item_top = 0x0165
item_screamer_closed = 0x0167
item_mayors_key = 0x0168
item_dynamite = 0x016f
item_horn = 0x173
item_third_deed = 0x0174

function dialog_message() => word(0xcb02)

// ==== NEW GAME ====
// * Walk through the door.
// * Go up the stairs to the attic.
//   Take the [statue]
// * Go back downstairs and to the southwest.
//   Take the [cigar] from Gomez.
// * Walk right near the fireplace.
//   Take the [sword] from the wall.
// * Go left and down to return to the hallway. Go down the stairs barely visible in the lower right.
//   Give the [statue] to [Morticia].
//   - put the cursor on Morticia. Press start to open the inventory. Select the statue. Then press 
//     the lightbulb.
//   Talk to [Morticia] again to get the [paintbrush].

achievement("Lost My Motivation", "Get the paintbrush", 2, 
    trigger = current_scene() == scene_morticia_painting &&
              item_picked_up(item_paintbrush)
)

// * Go left, down the stairs, and into the door at the back.
// * Talk to Grandma twice. She'll tell you to get the key from Lurch.
// * Return to Morticia (south, up, east). Then go south.
//   Pull the [string]. Lurch will give you the greenhouse key.
// * Go north, then east. You can enter the door without even needing to explicitly use the key.
//   Take the [oil] and the [pump]
// * Walk right.
//   Take the [leaf] and the [tomato]
// * Go left three times and up the stairs. Enter Wednesday's room (the door on the left).
// * Talk to Wednesday. The [oil] will lubricate the guillotine, but the string will break.

achievement("A Well Oiled Machine", "Lubricate the guillotine", 3,
    trigger = current_scene() == scene_wednesdays_bedroom &&
              bit0(0xa06c) == 1 && prev(bit0(0xa06c)) == 0 // TODO
)

// * Leave the room and go back downstairs. Enter the door behind Morticia.
//   Attempt to get [string]
// * Return to Wednesday (south, up, left door).
// * Talk to her, and you'll automatically return to the library, collect the string and return to her room.
// * Go back to the library
//   Get the [document]
// * Return to Grandma (south, west, down, back door).
//   Use [leaf] on Grandma
// * Talk to Grandma to get the [weed killer]
//   Combine it with the [pump]
//   - open inventory. select either item, then the hand, then the other item.
//   Use the [paintbrush] on the [can]
// * Go to the carnivorous plant (south, up, east, east). It will steal the [document] and you'll be
//   booted out of the room.
// * Talk to Morticia.
// * Go right, enter the door, and right again.
//   Use the [pump] on the [roots]. The [pump] will be replaced with a [can].
//   Use the [can] on the [water].
// * Go through the door, and walk right.

// * This is an action sequence. Just walk under the snake when it has its head up.
// * In the next screen, jump (A button) onto the crocodile after he closes his mouth twice. Jump again
//   to his tail, then jump across the water.
// * In the next screen, just move past the first when it's at the top. Wait a moment before moving as
//   they sometimes immediately drop after going up. Repeat with the other two, which have to be passed
//   together at the same time.
// * In the next screen, there's two bugs on the ground and one flying. Jump over the ground bugs and
//   duck (press down) under the flying bug.

achievement("Is This an Action-Adventure?", "Get through the action scenes in the woods", 5,
    trigger = once(current_scene() == scene_outside_snake) &&
              current_scene() == scene_outside_woodworms &&
              never(current_scene() < scene_outside_crocodile && current_scene() != scene_outside_woodworms)
)

// * The next screen is a normal screen.
//   Use the [can] on the [woodworms]

// * Then go back through the bugs, possums, crocodile and snake to get just outside the greenhouse.
// * Use the [paintbrush] with the [branch]
// * Use the [can] with the [branch]
// * Pick up the [branch]
// * Go back through the snake, crocodile, possums and bugs. Then east again.
// * Use the [branch] with the [swamp]

achievement("A Tiny Bridge", "Figure out how to cross the swamp", 3,
    trigger = current_scene() == scene_outside_swamp_stick &&
              prev(current_scene()) == scene_outside_swamp
)

// * Cross the stick and proceed to the next room.
//   Look at the [bud]
// * Go all the way back to the dungeon (left 9 times and down stairs). Enter the room on the right.
//   Talk to Fester and Propose a Dare!

achievement("A Bright Idea", "Recover the first document", 5, type="progression",
    trigger = current_scene() == scene_electric_chair &&
              item_picked_up(item_document)
)

// * Go to the libray (upstairs, east, door behind Morticia)
//   Read the open [book] on the right. There's three main sections with a secondary subsection.
// * Go back to Grandma (south, west, down, door at back)
//   Talk to [grandma]. Interrupt her.
// * Go to the graveyard (south, up, east, south, west, south)
//   Look (B button) at the large [statue] head.
// * Go back to Gomez (east, inside, north, upstairs, southwest)
//   Talk to [Gomez]
// * Go back to the library (south, downstairs, door behind Morticia)
//   Read the [books] on the left side.
// * Go to Fester (south, west, downstairs, door on right)
//   Talk to [Fester]. Receive a [cable].
// * Go to the greenhouse (west, upstairs, east twice, door)
//   Use the [sword] on the [saw]. It becomes an [antenna].
// * Go to the attic (west twice, upstairs, upstairs)
//   Take the [kite]
//   Combine the [kite] with the [antenna]
//   Combine the [kite] with the [cable]
// * Go to the balcony (south, west)
//   Use the [kite] on the [support]. Lightning brings the gargoyles to life.

achievement("It's Alive!", "Zap a gargoyle with a lot of electricity", 5,
    trigger = current_scene() == scene_gargoyle_balcony &&
              bit0(0xa09b) == 1 && prev(bit0(0xa09b)) == 0
)

//   Talk to the [gargoyle]s. After asking about their owner and their builder, you can ask where the
//   builder is, and they'll give you clues about the graveyard.
//   - The first step is the shadow of who flies black as night but is not a bird
//   - The second is marked by that which blinds and builds greatness
//   - The third leads all things to their end
//   - Find a key that's not a key to open a door without a door that hides mortals' eyes by taking on
//     diverse shapes.
// * Go back to Grandma (door, downstairs, west, downstairs, door at back)
//   Talk to [Grandma]
//   Take the [book]
// * Go to Wednesday's room (south, upstairs, east, upstairs, door on left)
//   Use the [book] on the [doll]. Select the second option: discovering the true nature of things.
// * Go back to Grandma (door, downstairs, west, downstairs, door at back)
//   Talk to [Grandma] about the [doll]
// * Go to the attic (south, upstirs, east, upstairs, upstairs)
//   Get the [candle]
// * Go to Wednesday's room (downstairs, door on left)
//   Use the [candle] on the [guillotine]
//   Use the [cigar] on the [candle]
//   Use the [doll] on the [guillotine]

achievement("Breaking the Seal", "Perform a magic ritual of decapitation", 5,
    trigger = current_scene() == scene_wednesdays_bedroom &&
              bit0(0xa0de) == 1 && prev(bit0(0xa0de)) == 0
)

// * Go to the cemetary (door, downstairs, south, west, south)
//   Interact with the following tombstones:
//   - Skull (left side, left screen)
//   - Bat (next to skull)
//   - Sand (left side, right screen)
//   - Hourglass (middle, right screen)
// * Go left and into the [entrance]
//   Take the [torch]
//   Combine it with the [cigar]
// * Go left for another set of action scenes.
//   Duck under the bats
//   Jump over the zombie hands
// * Talk to the [ghost]. Say you're looking for Klauss (option 1)
//   Stop talking to her and use the [book] on the [ghost]. Select option 1: see the invisible
//   Take the [skull]
// * Enter the [crevice] for another action scene.
//   Just jump across while avoiding them.
//   Use the [skull] on the [skeleton] on the floor.
// * Go back to the tomb entrance (past the wisps, hands, and bats)
//   Place the completed [skeleton] in the [burial cell].

achievement("Rest in Peace", "Eliminate the tombkeeper", 5,
    trigger = current_scene() == scene_tomb_entrance &&
              bit0(0xa037) == 1 && prev(bit0(0xa037)) == 0
)

// * Go back to the room with the ruby (past the bats, hands, and wisps)
//   Take [ruby]
//   Use the [book] on the [writings] on the floor. Select option 3: read the magic
// * Go back to the ghost's room (past the wisps).
//   Enter the large door. More action scenes.
//   Duck under the spit
//   Dodge the gas plumes - there's a pattern: step on the first after it fires, then stand on the pair
//   waiting for the next to fire twice. Then step on it, and advance the rest of the way when the last goes.
// * Place the [ruby] on the ashes.
//   Use the [tomato] on the [ruby]

achievement("What a Curse", "Recover the second document", 5, type="progression",
    trigger = current_scene() == scene_tomb_coffin &&
              item_picked_up(item_second_deed)
)

// * Leave Wednesday's room.
//   - Get control of Wednesday.
// * Just right of the door, open the [casket] to get the [bag].
// * Leave the room. Go downstairs and west.
//   Talk to [Thing].
// * Go to the attic (east, up, up)
//   Thing will introduce his family, then join you on your quest.

achievement("A Helping Hand", "Get Thing to join you", 3,
    trigger = current_scene() == scene_attic &&
              bit7(0xadd9) == 0 && prev(bit7(0xadd9)) == 1
)

// * Go down to the dungeon (down, down, west, down)
//   Look at the [skeleton] (B button)
//   Use [Thing] on the [skeleton]
// * Go into Grandma's room (middle door)
//   Take the [scalp].
//   Combine the [scalp] and the [bag].
// * Go to Pugsley's room (south, up, right, up, right door)
//   Put the [baby octopus] in with the [octopus].
//   Take the [key].
//   Use the [key] to unlock the [trunk].
//   Take the [dynamite] from the [trunk].

achievement("Cephalopod Subterfuge", "Get the dynamite from Pugsley's room", 3,
    trigger = current_scene() == scene_pugsleys_bedroom &&
              item_picked_up(item_dynamite)
)

// * Go to the library (leave room, down, door behind Morticia).
//   Pull the [book] on the bottom left.
// * Go to the balcony (leave room, up stairs, west).
//   Talk to [Pugsley].
// * Go to the suit of armor (up the stairs, southwest, east). Step into the fireplace.
//   Open the [trunk] in the lower left corner.
//   Step into the [passageway].

achievement("A Dismal Place", "Visit the land of Halloween", 5, type="progression",
    trigger = current_scene() == scene_halloween_entrance &&
              prev(current_scene()) == scene_treasury
)

// * Walk north.
//   Talk to [mayor]. Ask about documents (1), and say you'll help (1).
// * Walk right.
//   Throw the [dynamite] in the [crevice].
// * Walk right. Another action sequence.
//   - dodge the pillars of fire.
//   - duck under the first mouse. jump over the second. then wait for the third and jump over it. run right
// * Walk through the door.
//   Take the [potion]
// * Go back to the mayor.
//   Pour the [potion] onto the [horn].
// * Go left
//   Use the [potion] on the [axe] hanging above the gate.
//   Take the [axe].
// * Walk north, then north again. Another action sequence.
//   - Follow the bouncing pumpkin. Jump over the rolling one.
//   Use the [axe] on the [pumpkin head].
//   Use the [axe] on the [padlock].
// * Enter the building.
//   Take the [duster].
//   Take the [can].
// * Return to the mayor.
//   Use the [duster] on the [dandruff] on the Mayor's shoulder.
// * Go back to the room where you got the potion.
//   Put the [dandruff] in the [grinder].
//   Put the [pumpkin head] in the [grinder].
//   Use the [powder] on the [fan].

achievement("Powerful Powder", "Animate the fan", 5,
    trigger = current_scene() == scene_halloween_potion_room &&
              item_picked_up(item_fan)
)

// * Go back to the room where you got the duster.
//   Use the [powder] on the [skull].
//   Use the [potion] on the [skull].
//   Combine the [skull] with the [can].
// * Step outside and walk right for another action sequence.
//   - Just don't get hit by the pumpkin bombs.
//   Talk to [Mr. Pumpkin].
//   Use the [fan] on [Mr. Pumpkin].
//   Take [Mr. Pumpkin]'s head.
// * Go back to the room where you got the duster.
//   Use [Mr. Pumpkin]'s head on the lower right [candle].

achievement("Change of Mind", "Convince Mr. Pumpkin to return to work", 3,
    trigger = current_scene() == scene_halloween_duster_room &&
              item_picked_up(item_mr_pumpkin_burned_down)
)

// * Return to the mayor.
//   Give [Mr. Pumpkin] to the [mayor].
// * Go back to the room where you got the potion.
//   Talk to the [witch].
//   - If she's not there, go back and talk to the mayor again, and return.
//   Give the [horn] to the [witch].
//   Combine the [top] with the [screamer].

achievement("Can of Screams", "Complete the screamer", 3,
    trigger = current_scene() >= scene_halloween_entrance &&
              current_scene() <= scene_halloween_plumes &&
              item_picked_up(item_screamer_closed)
)

// * Return to the mayor.
//   Give the [screamer] to the [mayor].
// * Enter the door on the right.
//   Use the [power] on the [papers].

achievement("It's Me, Doll", "Find the third deed", 5, type="progression",
    trigger = current_scene() == scene_grannys_room && // scene changes before item is awarded
              item_picked_up(item_third_deed)
)

// * Go up to the balcony (south, up, east, up, west).
//   Talk to [Pugsley].

achievement("Dear Sweet Neighbour", "Save the Addams house", 10, type="win_condition",
    trigger = current_scene() == scene_gargoyle_balcony &&
              dialog_message() == 0x340 // start of credits - "Developed and Produced by:"
)


