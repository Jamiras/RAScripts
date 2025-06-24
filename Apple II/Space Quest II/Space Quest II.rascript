// Space Quest II: Vohaul's Revenge
// #ID=18958
//
// woz-a-day
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 1A
// MD5: c98952f0fbb1c27a92dbf053a875f721 - disk 1B
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 2A
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 2B
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 3A
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 3B
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 4A
// MD5: 37323a3833c87cf78344621cb6f07050 - disk 4B

// ========================================================

// FF = in inventory
function item_location(item_id) => byte(0x1162 + item_id * 3)
item_order_form = 20
item_supporter = 21
item_berries = 22
item_spore = 23
item_glowing_gem = 24
item_rope = 25
item_whistle = 26
item_stone = 27
item_plunger = 28
item_toilet_paper = 29
item_waste_basket = 30
item_basket_with_paper = 31
item_glass_cutter = 32
item_lighter = 33
item_cage_key = 34
item_translator = 35
item_keycard = 36
item_puzzle_cube = 37
item_empty_spore = 38
item_oxgen_mask = 39


scene_none = 0
scene_orbital_station_exterior = 1  // 1A
scene_outside_airlock = 2           // 1B
scene_airlock = 3                   // 1B
scene_control_room = 4              // 1B
scene_shuttle_bay = 5               // 1B
scene_shuttle_vohaul = 6            // 1B
scene_asteroid_exterior = 7         // 1B
scene_labion_landing_pad = 8        // 1B
scene_labion_escort = 9             // 1B
scene_labion_crash_site = 10        // 2A
scene_labion_large_trees = 11       // 2A
scene_labion_snared_alien = 12      // 2A
scene_labion_swamp_west = 13        // 2A
scene_labion_swamp_center = 14      // 2A
scene_labion_swamp_east = 15        // 2A
scene_labion_canyon_tree = 16       // 2B
scene_labion_east_of_canyon = 17    // 2B
scene_labion_overlook = 18          // 2B
scene_labion_hunters_camp = 19      // 2B
scene_labion_mailbox = 20           // 2A
scene_labion_vine_maze = 21         // 2A
scene_labion_chasm_monster = 22     // 2B
scene_labion_rock_pile = 23         // 2B
scene_labion_chasm_cave = 24        // 2B
scene_labion_chasm_cave_dark = 25   // 2B
scene_labion_swamp_underwater1 = 26 // 2A
scene_labion_swamp_underwater2 = 27 // 2A

scene_labion_dwellers_rock = 29     // 2B
scene_labion_chasm_cave2b = 30      // 2B
scene_labion_chasm_cave2d = 31      // 2B
scene_labion_chasm_cave2e = 32      // 2B
scene_labion_chasm_cave2c = 33      // 2B
scene_labion_chasm_cave2f = 34      // 2B
scene_labion_chasm_cave2a = 35      // 2B
scene_labion_chasm_cave2g = 36      // 2B
scene_labion_chasm_cave2h = 37      // 2B
scene_labion_chasm_cave2i = 38      // 2B
scene_labion_cave_lake = 39         // 3A
scene_labion_cave_lake2 = 40        // 3A
scene_labion_cave_lake3 = 41        // 3A
scene_labion_cave_lake4 = 42        // 3A
scene_labion_cave_lake_outlet = 43  // 3A
scene_labion_cave_devil_wall = 44   // 3A
scene_labion_landing_pad_base = 45  // 3A
scene_labion_ship_interior = 46     // 3A
scene_labion_mushrooms = 47         // 2A
scene_asteroid_docking = 48         // 3A
scene_asteroid_landing_pad = 49     // 3B,4B
scene_asteroid_east_elevator = 50   // 3B,4B
scene_asteroid_west_elevator = 51   // 3B,4B
scene_asteroid_escape_corridor3 = 52// 4B
scene_asteroid_escape_corridor1 = 53// 4B
scene_asteroid_escape_corridor2 = 54// 4B
scene_asteroid_escape_corridor5 = 55// 4B
scene_asteroid_escape_corridor6 = 56// 4B
scene_asteroid_escape_corridor7 = 57// 4B
scene_asteroid_escape_corridor8 = 58// 4B
scene_asteroid_escape_corridor4 = 59// 4B
scene_asteroid_corridor_east_end=60 // 3B
scene_asteroid_corridor_generic=61  // 3B
scene_asteroid_corridor_unused1 = 62// Apple II version uses generic rooms for most of the station
scene_asteroid_corridor_unused2 = 63 // These values come from the DOS version
scene_asteroid_corridor_unused3 = 64 //
scene_asteroid_corridor_west_end=65 // 3B
scene_asteroid_corridor_stairs = 66 // 3B
scene_asteroid_robots_west = 67     // 3B
scene_asteroid_robots_east = 68     // 3B
scene_asteroid_elevator_interior=69 // 3B
scene_asteroid_corridor_unused4 = 70//
scene_asteroid_corridor_unused5 = 71//
scene_asteroid_corridor_unused6 = 72//
scene_asteroid_corridor_unused7 = 73//
scene_asteroid_corridor_unused8 = 74//
scene_asteroid_corridor_unused9 = 75//
scene_asteroid_bathroom = 76        // 3B

scene_asteroid_corridor_unused10=80 //
scene_asteroid_corridor_unused11=81 //
scene_asteroid_corridor_unused12=82 //
scene_asteroid_corridor_unused13=83 //
scene_asteroid_corridor_unused14=84 //
scene_asteroid_corridor_unused15=85 //
scene_vohaul_room = 86              // 4A
scene_vohaul_mini_jar = 87          // 4A
scene_vohaul_mini_inside = 88       // 4A
scene_vohaul_mini_keyboard = 89     // 4A
scene_asteroid_escape1 = 90         // 4A
scene_asteroid_escape2 = 91         // 4A
scene_asteroid_escape_jettison = 92 // 4B
scene_escape_pod = 93               // 4B

scene_insurance_salesman = 95       //
scene_watch_closeup = 96            // 1B
scene_enter_name = 97               // 1A,4A
scene_intro_title = 140             // 1A
scene_intro_space = 141             // 1A
scene_intro_chapter_2 = 142         // 1A

scene_labion_ship_console = 146     // 3A
scene_labion_asteroid_exterior = 147// 3A
scene_labion_landing_pad_ship = 148 // 3A


scenes = {
    scene_enter_name: "using a terminal",
    scene_orbital_station_exterior: "at Orbital Station 4",
    scene_outside_airlock: "at Orbital Station 4",
    scene_watch_closeup: "at Orbital Station 4",
    scene_airlock: "at Orbital Station 4",
    scene_control_room: "at Orbital Station 4",
    scene_shuttle_bay: "at Orbital Station 4",
    scene_shuttle_vohaul: "at Orbital Station 4",
    scene_asteroid_exterior: "on Labion",
    scene_labion_landing_pad: "on Labion",
    scene_labion_escort: "on Labion",
    scene_labion_crash_site: "on Labion",
    scene_labion_mushrooms: "on Labion",
    scene_labion_large_trees: "on Labion",
    scene_labion_mailbox: "on Labion",
    scene_labion_vine_maze: "navigating the vine maze on Labion",
    scene_labion_snared_alien: "on Labion",
    scene_labion_swamp_west: "in the Labion swamp",
    scene_labion_swamp_center: "in the Labion swamp",
    scene_labion_swamp_east: "in the Labion swamp",
    scene_labion_swamp_underwater1: "in the Labion swamp",
    scene_labion_swamp_underwater2: "in the Labion swamp",
    scene_labion_canyon_tree: "on Labion",
    scene_labion_east_of_canyon: "on Labion",
    scene_labion_overlook: "on Labion",
    scene_labion_hunters_camp: "at the hunter's camp on Labion",
    scene_labion_chasm_monster: "on Labion",
    scene_labion_chasm_cave_dark: "exploring a cave on Labion",
    scene_labion_chasm_cave: "exploring a cave on Labion",
    scene_labion_rock_pile: "on Labion",
    scene_labion_dwellers_rock: "on Labion",
    scene_labion_chasm_cave2a: "exploring a cave on Labion",
    scene_labion_chasm_cave2b: "exploring a cave on Labion",
    scene_labion_chasm_cave2c: "exploring a cave on Labion",
    scene_labion_chasm_cave2d: "exploring a cave on Labion",
    scene_labion_chasm_cave2e: "exploring a cave on Labion",
    scene_labion_chasm_cave2f: "exploring a cave on Labion",
    scene_labion_chasm_cave2g: "exploring a cave on Labion",
    scene_labion_chasm_cave2h: "exploring a cave on Labion",
    scene_labion_chasm_cave2i: "exploring a cave on Labion",
    scene_labion_cave_lake: "exploring a cave on Labion",
    scene_labion_cave_lake2: "exploring a cave on Labion",
    scene_labion_cave_lake3: "exploring a cave on Labion",
    scene_labion_cave_lake4: "exploring a cave on Labion",
    scene_labion_cave_lake_outlet: "on Labion",
    scene_labion_cave_devil_wall: "on Labion",
    scene_labion_landing_pad_base: "on Labion",
    scene_labion_landing_pad_ship: "on Labion",
    scene_labion_ship_interior: "stealing a ship",
    scene_labion_ship_console: "stealing a ship",
    scene_labion_asteroid_exterior: "exploring the asteroid base",
    scene_asteroid_docking: "exploring the asteroid base",
    scene_asteroid_landing_pad: "exploring the asteroid base",
    scene_asteroid_east_elevator: "exploring the asteroid base",
    scene_asteroid_west_elevator: "exploring the asteroid base",
    scene_asteroid_elevator_interior: "exploring the asteroid base",
    scene_asteroid_corridor_west_end: "exploring the asteroid base",
    scene_asteroid_corridor_generic: "exploring the asteroid base",
    scene_asteroid_corridor_east_end: "exploring the asteroid base",
    scene_asteroid_corridor_unused1: "exploring the asteroid base",
    scene_asteroid_corridor_unused2: "exploring the asteroid base",
    scene_asteroid_corridor_unused3: "exploring the asteroid base",
    scene_asteroid_corridor_unused4: "exploring the asteroid base",
    scene_asteroid_corridor_unused5: "exploring the asteroid base",
    scene_asteroid_corridor_unused6: "exploring the asteroid base",
    scene_asteroid_corridor_unused7: "exploring the asteroid base",
    scene_asteroid_corridor_unused8: "exploring the asteroid base",
    scene_asteroid_corridor_unused9: "exploring the asteroid base",
    scene_asteroid_corridor_unused10: "exploring the asteroid base",
    scene_asteroid_corridor_unused11: "exploring the asteroid base",
    scene_asteroid_corridor_unused12: "exploring the asteroid base",
    scene_asteroid_corridor_unused13: "exploring the asteroid base",
    scene_asteroid_corridor_unused14: "exploring the asteroid base",
    scene_asteroid_corridor_unused15: "exploring the asteroid base",
    scene_asteroid_bathroom: "exploring the asteroid base",
    scene_asteroid_corridor_stairs: "exploring the asteroid base",
    scene_asteroid_robots_west: "exploring the asteroid base",
    scene_asteroid_robots_east: "exploring the asteroid base",
    scene_vohaul_room: "in Vohaul's chamber",
    scene_vohaul_mini_jar: "in Vohaul's chamber",
    scene_vohaul_mini_inside: "in Vohaul's chamber",
    scene_vohaul_mini_keyboard: "in Vohaul's chamber",
    scene_insurance_salesman: "in Vohaul's chamber",
    scene_asteroid_escape1: "exploring the asteroid base",
    scene_asteroid_escape2: "exploring the asteroid base",
    scene_asteroid_escape_corridor1: "exploring the asteroid base",
    scene_asteroid_escape_corridor2: "exploring the asteroid base",
    scene_asteroid_escape_corridor3: "exploring the asteroid base",
    scene_asteroid_escape_corridor4: "exploring the asteroid base",
    scene_asteroid_escape_corridor5: "exploring the asteroid base",
    scene_asteroid_escape_corridor6: "exploring the asteroid base",
    scene_asteroid_escape_corridor7: "exploring the asteroid base",
    scene_asteroid_escape_corridor8: "exploring the asteroid base",
    scene_asteroid_escape_jettison: "in an escape pod",
    scene_escape_pod: "in an escape pod",
}

function current_scene() => byte(0xFED3)
function current_score() => byte(0xFF03)

function needed_disk() => byte(0x92CE)
function in_intro() => current_scene() >= scene_intro_title && current_scene() <= scene_intro_chapter_2

// type BACKSTAGE to enter debug mode. you'll see version information as confirmation, then coordinates (and room) info
// TP <enter> [sceneid] <enter> - to teleport to another room
// SHOW PRI <enter> - to see screen depth information. ESC to return to normal
//
// NOTE: The debug mode flag gets cleared when the player leaves the room. As such, we have to use a pauselock to
//       disable all achievements once the cheat has been activated. We clear the pauselock if they restart the game,
//       but that doesn't prevent them from cheating, saving, restarting, and loading.
function is_debug_mode() => bit7(0xFEE8) == 1 // resets when leaving room
function in_game_general() => current_scene() != scene_none &&
                              disable_when(is_debug_mode(), until=current_scene() == scene_none)
function in_game() => in_game_general() &&
                      byte(0xB7EB) != 0 // zero when resetting, and during screen transitions


// ========================================================

rich_presence_conditional_display(current_scene() == scene_none, "Game not started")
rich_presence_conditional_display(in_intro(), "Titles")


rich_presence_conditional_display(once(is_debug_mode()) && never(current_scene() == scene_none), 
   "Roger is {0}, {1}* of 250 points",
   rich_presence_lookup("Scene", current_scene(), scenes, "somewhere uncharted"),
   rich_presence_value("Score", current_score())
)

rich_presence_display("Roger is {0}, {1} of 250 points",
   rich_presence_lookup("Scene", current_scene(), scenes, "somewhere uncharted"),
   rich_presence_value("Score", current_score())
)

// ========================================================

function story_achievement(scene, flag, points, title, description, type="")
{
    achievement(title, description, points, type=type,
        trigger = current_scene() == scene &&
                  flag == 1 && prev(flag) == 0 &&
                  in_game()
    )
}

function item_achievement(scene, item, points, title, description)
{
    achievement(title, description, points,
        trigger = current_scene() == scene &&
                  item_location(item) == 0xFF && prev(item_location(item)) == 0 &&
                  in_game()
    )
}

// $FEE5:80 - THE END
// $FEE5:40 - THROW SPORE
// $FEE5:20 - THROW SPORE
// $FEE6:20 - enter orbital station [1pt]
// $FEE7:10 - GET BERRIES, RUB BERRIES ON BODY (Temp)
// $FEE7:04 - vohaul speech (temp)
// $FEE8:80 - debug mode
// $FEE8:10 - hide from hovercraft (temp)
// $FEE8:01 - flashes roughly once a second
// $FEF9:80 - HOLD BREATH
// $FEE9:04 - RUB BERRIES ON BODY
// $FEE9:02 - enter room north of crash, USE GEM
// $FEEA:08 - disable homing beacon in crashed pod [1pt]
// $FEEB:40 - TIE ROPE TO LOG
// $FEEB:20 - reach water room of cave
// $FEEB:04 - THROW SPORE
// $FEEE:80 - PUSH BUTTON (vohaul)
// $FEEE:40 - PULL LEVER (keyboard)
// $FEEE:20 - vohaul's dying speech
// $FEEE:10 - SHSR
// $FEEE:08 - ENTER POD
// $FEEE:04 - SLING ROCK AT GUARD
// $FEEF:02 - PUT KEYCARD IN SLOT
// $FEF0:80 - (temp)
// $FEF0:10 - enter shuttle (temp), vohaul speech (temp)
// $FEF9:40 - PRESS C on watch [1pt]
// $FEF8:01 - RUB BERRIES ON BODY
// $FEF9:20 - GET SPORES
// $FEF9:10 - GET BERRIES
// $FEF9:08 - escape with berries
// $FEF9:01 - reach water room of cave
// $FEFA:80 - BLOW WHISTLE
// $FEFA:10 - PUT PLUNGER ON WALL
// $FEFA:01 - USE CUTTER
// $FEFC:02 - steal ship and leave Labion
// $FEFD:80 - alligator appears (temp)
// $FEFD:08 - hovercraft enters screen (temp)
// $FEFD:04 - hovercraft finds Roger
// $FEFD:02 - hovercraft catched Roger
// $FEFD:01 - hovercraft searching for Roger
// $FF13:0D - enter shuttle (temp)
// $FF1E:E0 - THROW ROCK (to distract guard)
// $FF32:04 - WEAR MASK
// $FF35:60 - enter shuttle

// ========================================================

// * LOOK WATCH, PRESS C [1>1]*
// Walk left, up the wall, and onto the airlock. [1>2]
// Appraoch the clothes on the wall.
// * GET UNIFORM [1>3]
// Walk to the right side of the screen (third locker is yours)
// * OPEN LOCKER
// * GET CUBE [1>4]
// * GET SUPPORTER [1>5]
// Exit the room to the left.
// Step on the lift (yellow stripey thing). Enter the tube.
// Go down the stairs {A}, then up the ramp into the shuttle. [5>10]
// After a lengthy exposition, you're sent to the mines of Labion, but don't quite make it.
// * SEARCH BODY
// * GET KEYCARD [3>13]
// Walk over to the pod.
// * SEARCH POD
// * PRESS BUTTON [1>14]
// Walk into the background and left behind the tree, then north into the next scene.
// Walk right into the next scene.
// Approach the pink creature.
// * UNTIE ROPE [5>19]
// Go back to the west. 
// Stand behind the right tree {B} and wait for the hovercraft to go through [5>24]

story_achievement(scene_labion_large_trees, bit4(0xFEE8), 5, "They'll Never Look For You There",
                  "Avoid being recaptured after the crash")

// Proceed to the northwest corner of the scene and exit left.
// Walk up to the mailbox.
// * MAIL ORDER FORM [2>26]
// * GET WHISTLE [2>28]
// Jump off the cliff, and walk to the little blue balls.
// * GET SPORES [4>32]
// Walk towards the northwest side of the scene and head north.
// {C} Walk through the vine maze under the arch and to the bushes in the back. Use temp saves {D} as necessary.
// * GET BERRIES [4>36]

story_achievement(scene_labion_vine_maze, bit4(0xFEF9), 5, "Watch Your Step",
                  "Navigate the vine maze and collect your reward")

// Work your way back through the vine mazeusing temp saves {D} as necessary. [4>40]
// Go south and east (back to where you hid) around the trees and leave from the top right.
// Approach the water.
// * RUB BERRIES ON BODY [3>43]
// Go east into the next scene. 
// Continue east. The underwater monster will attack you and be repelled by the berries.
// Head towards the upper right area of the screen. When you sink up to your shoulders, save {D}.
// * HOLD BREATH [2>45]
// Quickly work your way left, then up into the shafts of light. [2>47]
// Walk to the pulsing stone.
// * GET GEM [3>50]

item_achievement(scene_labion_swamp_underwater2, item_glowing_gem, 5, "What Lies Beneath",
                 "Collect the glowing gem")

// Walk back into the water.
// * HOLD BREATH [2>52]
// Quickly work your way back to the surface of the swamp.
// Continue east, back onto land, and and east into the next scene.
// Walk up to the dead tree.
// * CLIMB TREE [3>55]
// Continue east into the next scene.
// Walk towards the right side of the scene and get caught in a trap. {E}
// * CALL
// * CALL
// Wait for him to approach.
// * THROW SPORE [5>60]
// Walk to the southernmost part of the cage.
// * SEARCH BODY
// * GET KEY [2>62]
// * UNLOCK DOOR
// * OPEN DOOR

// $FF1F goes from 00->01->03 when opening the cage door
story_achievement(scene_labion_hunters_camp, bit1(0xFF1F), 10, "Freedom",
                  "Escape from the hunter's cage", type="progression")

// Walk to the rock with the yellow stuff on it.
// * GET ROPE [2>64]
// Walk north through the bushes and west twice to get back to the chasm.
// * CLIMB ON LOG
// Move to the center of the log.
// * TIE ROPE TO LOG [2>66]
// * CLIMB ROPE {F}
// Climb to the bottom of the rope (there should still be a couple lines of pixels below your feet).
// * SWING [2>68]
// Just let Roger rock back and forth until the monster grabs at you, then press Ctrl+Z to release on the 
//   other side. [5>73]
// Enter the cave.
// Take a couple steps so Roger is in the shadows
// * USE GEM [2>75]
// Head west (behind the first two rocks). You'll fall into a hole just before you reach the next scene.
// After the dwellers run away, walk up to the green square near the cave
// * GET GEM [1>76]
// Go to the right side of the screen and walk south.
// After the chieftain's speech, approach the remaining dwellers.
// * SAY THE WORD [3>79]
// Climb the ladder. {G}
// * PUT GEM IN MOUTH
// Climb down until you get off the ladder, then crawl right into the next scene.
// Continue right until you reach the next ladder.
// Descend it, getting off as soon as you can on the right (near the bottom of the screen).
// Go right into the next scene.
// Crawl to the ladder, and go down.
// At the bottom of the ladder, head right to the next ladder.
// Climb down to the bottom, and head left.
// When you reach the next ladder, keep heading left into the next scene.
// Head left to a ladder, then left to another ladder. Then head down.
// In the middle of the screen, get off the ladder, going right. {H}
// Head right until you get out of the cave. [20>99]

story_achievement(scene_labion_cave_lake, bit0(0xFED2), 10, "Crawling through the Cave",
                  "Reach the watery room of the cave")

// Enter the water and proceed east.
// Follow the stream around and go into the right fork to get sucked into a whirlpool [5>104].
// Go east into the next scene, but don't leave the water {I}.
// * BLOW WHISTLE [5>109]

story_achievement(scene_labion_cave_devil_wall, bit7(0xFEFA), 5, "Mail-Order Doorway",
                  "Summon the Labion Terror Beast to create an opening in a giant boulder", type="progression")

// [can avoid beast by leaving and coming back]
// Ready the following command, then step onto land and press ENTER.
// * THROW PUZZLE TO BEAST [10>119]
// Walk into the hole
// * GET ROCK [2>121]
// Walk into the next scene. {J}

// When the guard is walking right (after looking down at you, move to the second bush, then behind the left pillar.
// Walk over next to the right pillar.
// [at this point, you can just sneak up to the door when the guard's not looking and PUT KEYCARD IN SLOT]
// * THROW ROCK [10>131]
// Step behind the pillar and wait for the guy to come down.
// When he's close to the bush, get into the elevator.

achievement("He Thought He Heard Something", "Make the shuttle guard leave", 5, type="missable",
    trigger = current_scene() == scene_labion_landing_pad_base &&
              byte(0xff1e) == 0x19 && prev(byte(0xff1e)) == 0x18 &&
              in_game()
)

// [Reload {J}]
// When the guard is in the middle of his patrol route:
// * SLING ROCK AT GUARD [20>141] (requires supporter)

achievement("You Could Put an Eye Out", "Knock out the guard at the shuttle platform", 5, type="missable",
    trigger = current_scene() == scene_labion_landing_pad_base &&
              byte(0xff1e) == 0x0D && prev(byte(0xff1e)) == 0x0C &&
              in_game()
)

// Walk to the door in the right pillar.
// * PUT KEYCARD IN SLOT [5>146]
// Enter the elevator.
// Walk behind the ship
// * OPEN HATCH
// * PUSH POWER BUTTON
// * TURN DIAL
// * PUSH THRUSTER BUTTON
// * PULL LEVER
// When the view switches to the close up of the console, press DOWN to ascend.
// When the view switches back to the cockpit, just wait [20>166].
// When the tone sounds indicating an adequate altitude has been achieved: {K}
// Vohaul will arrive and capture Roger again.

story_achievement(scene_labion_ship_interior , bit1(0xFEFC), 5, "A New Ship",
                  "Commandeer a ship and get off the planet", type="progression")

// After the ship lands, and the doors close, walk east.
// Enter the elevator.
// * PUSH THREE {L}
// If you encounter any floor cleaning robots, run back to the most recent closet/elevator and get out of their way.
// Walk east three times. Approach the button to the side of the door.
// * PUSH BUTTON
// Enter the closet.
// * GET PLUNGER [1>167]
// Continue east twice more and enter the elevator.
// * PUSH FOUR
// Go west twice and approach the button.
// * PUSH BUTTON
// Enter the closet.
// * GET CUTTER [1>168]
// Go west again and enter the bathroom (either door).
// Walk up to the third stall.
// * OPEN DOOR
// Enter the stall.
// * GET PAPER [1>169] {M}

// * READ WALL several times
achievement("Are You Stall-ing?", "Read several messages in the species-neutral restroom", 5, type="missable",
    trigger = never(current_scene() != scene_asteroid_bathroom) &&
              repeated(6, byte(0xff35) != prev(byte(0xff35))) &&
              in_game()
)

// Leave the bathroom, and head left a couple times and enter the elevator.
// * PUSH FIVE
// Walk right twice and approach the button.
// * PUSH BUTTON
// Enter the closet.
// * GET OVERALLS
// * LOOK FLOOR
// * GET LIGHTER [1>170]
// * GET BASKET [1>171]
// Go left back to the elevator.
// * PUSH ONE
// Go west to the shuttle, then south down the ramp. {N}
// Step left. A wall will appear.
// Step right. Another wall will appear.
// The floor will start to move (with you on it). When you're near the left wall:
// * PUT PLUNGER ON WALL [10>181]

story_achievement(scene_asteroid_corridor_stairs, bit4(0xfefa), 5, "Hanging On for Dear Life",
                  "Avoid the acid trap", type="progression")

// The floor will recede [10>191]. You'll let go, and the walls will disappear.
// * PUT PAPER IN BASKET [1>192]
// * DROP BASKET [1>193]
// * LIGHT FIRE [10>203]

achievement("Controlled Burn", "Disable the wallbots", 5,
    trigger = current_scene() == scene_asteroid_corridor_stairs &&
              bit5(0xfee6) == 0 && prev(bit5(0xfee6)) == 1 &&
              in_game()
)

// Go east twice to find Vohaul's command chamber.
// Go up the stairs. {O}
// * USE CUTTER [5>208]
// Walk to the left wall.
// * ENTER VENT
// Walk up to the red circle behind the bellows.
// * PUSH BUTTON [10>218]
// Walk back to the vents
// * EXIT

story_achievement(scene_vohaul_mini_jar, bit5(0xfeee), 10, "Small But Mighty",
                  "Defeat Vohaul", type="progression")

// You now have 10 minutes to get off the asteroid.
// Go left. Walk to the lever.
// * PULL LEVER
// * TYPE ENLARGE
// Walk back to the jar and enter it.
// Approach Vohaul's corpse. {P}
// * SEARCH BODY
// Walk up to the flashing monitor
// * LOOK MONITOR
// * SHSR [10>228]
// [NOTE: if you don't do this, when you get in the chamber at the end of the game, you'll get a bad ending where
//        civilization is doomed.]

story_achievement(scene_enter_name, bit4(0xfeee), 5, "Like the Back of His Hand",
                  "Abort the Clone Launch", type="progression")

// CTRL-Z to exit the monitor screen.
// Go up the stairs to the right. {Q}
// Approach the box near the entrance.
// * GET MASK [2>230]
// * WEAR MASK 
// Walk through the tube to the next screen.
// Keep walking to the next screen, then left twice.
// Head to the left side of the screen and save. {R}
// Ready PUSH BUTTON and walk into the next screen.
// Quickly approach the button and press enter.
// While the door is opening, type ENTER POD.
// When the door finishes opening, press enter. [10>240]
// [NOTE: You're supposed to get the robot's attention, then run all the way around the base back to this room
//        from the other side, but this takes a lot of extra time, and there's a small chance you'll get caught
//        each time the screen transitions.]

story_achievement(scene_asteroid_escape_corridor2, bit3(0xfeee), 5, "Faster Than the Mech", "Get into an escape pod")

// * PUSH BUTTON
// After you find out about your dire situation:
// * LOOK
// Walk to the back right. {S}
// * OPEN CHAMBER
// * GET IN CHAMBER [10>250]

story_achievement(scene_escape_pod, bit1(0xff0a), 25, "Some Well-Deserved Rest", 
                  "Finish the game", type="win_condition")

achievement("Sanitary Savior", "Finish the game with 250 points", 25,
    trigger = current_scene() == scene_escape_pod &&
              bit1(0xff0a) == 1 && prev(bit1(0xff0a)) == 0 &&
              current_score() == 250 &&
              in_game()
)


// There's only one puzzle with multiple solutions in this game. One of the solutions is worth up to 33 points less
// than the other. Additionally, another 11 points can be avoided by despawning the Terror Beast. And there's 7 other
// points that could be skipped, for a total of 51 skippable points. While I could potentially do a "less than 200
// points" achievement, having 2/3 of it tied into one puzzle, and another 20% tied into what could be described as
// a glitch, I've chosen not to have a "low score run" achievement in this set. The lack of choices also dictates
// that this set have fewer points than the other Sierra games on this system. If not for a couple of easily overlooked
// 1 pointers, I might not have even needed a perfect score achievement.

// skippable points (51 - speedrun was short 60):
// 1 - look watch
// 1 - disable beep?
// 5 - hide from hovercraft

// 1 - get cube
// 10 - throw puzzle to beast

// 1 - get jockstrap
// 2 - get rock
// 5 - get keycard
// 5 - put keycard in slot
// 20 - sling rock at guard
