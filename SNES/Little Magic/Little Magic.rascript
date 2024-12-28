// Little Magic
// #ID = 23308

// 781258044fde962357232be69e845e34 : Europe (PROTO)
// 0c0fe140c1851b2d80148118f1de9b02 : Japanese
// e1963d748672ace4074bdf24347cc340 : T+Eng 1.00B Aeon Genesis 

// 7c50b66f54f4aa48109558c1e9b34275 : T+Eng 1.00B Aeon Genesis + DEBUG mode
// DEBUG mode: edit ROM - change first byte to 0xFF. Press Select+Start in game
// see https://tcrf.net/Little_Magic_(SNES)

// [ ] test JP
// [ ] test EU
//   [ ] Select + Start accesses level select even without patching
//       https://tcrf.net/Proto:Little_Magic_(SNES)

function remaining_lives() => byte(0x0059)

function tileset() => byte(0x003A)

tileset_titles = 1
tileset_intro = 2
tileset_grass = 3
tileset_lava = 4
tileset_ice = 6
tileset_tower = 7
tileset_dark = 8
tileset_metal = 9
tileset_completed = 10

function current_stage() => byte(0x0058) + 1

rich_presence_conditional_display(tileset() < tileset_grass, "Titles")
rich_presence_conditional_display(byte(0x0058) >= 0x80, "Demo")
rich_presence_conditional_display(current_stage() == 101, "Ending")
rich_presence_display("Stage {0} | {1} lives", 
    rich_presence_value("Stage", current_stage()),
    rich_presence_value("Lives", remaining_lives())
)

function game_over() => byte(0x006d) == 0x0e

function complete_stage(stage) => 
    current_stage() == stage && 
    tileset() == tileset_completed &&
    prev(tileset()) != tileset_completed // current_stage changes while tileset is tileset_completed
    
function deathless() => never(remaining_lives() < prev(remaining_lives()))
function without_continuing() => never(game_over())
function without_resetting() => never(byte(0x003a) == 0)

function complete_stage_range(first_stage, last_stage) =>
    once(current_stage() < first_stage) &&   // title screen or level before the first level
    once(current_stage() == first_stage) &&  // require first stage
    current_stage() >= first_stage &&        // prevent challenge icon from appearing when
    current_stage() <= last_stage &&         //   not in the associated levels
    trigger_when(complete_stage(last_stage)) // show challenge icon until completed

function complete_stage_range_deathless(first_stage, last_stage) =>
    complete_stage_range(first_stage, last_stage) &&
    deathless()
    
function complete_stage_range_without_continuing(first_stage, last_stage) =>
    complete_stage_range(first_stage, last_stage) &&
    without_continuing() && without_resetting()

// -- [TimeForest] --
// Stage 1 - 372025
// * Just push the stone up, then go to the stairs

// Stage 2 - 053127
// * Push the stone up, then left into the water. Use magic to shoot it onto the space.

// Stage 3 - 919310
// * Push the stone onto the water.
// * Use magic to push it once, then a small bubble to push it again.
// * Push it around to the next water, and use magic and a small bubble to get it onto the space.

// Stage 4 - 441234
// * Use magic to push the stone, then a small bubble to push it again.
// * Create another small bubble, then use magic to push that. It'll pop and move the stone.

achievement("Learning the Basics", "Complete stage 4", 2, type="progression",
    trigger = complete_stage(4) 
)

// -- [Flame Cave] --
// Stage 5 - 907138
// * Walk all the way around, push the stone onto the space, then leave.

// Stage 6 - 716464
// * Push the stone up and almost all the way left.
// * Put a bubble in the alcove, then push the stone below the bubble.
// * After the bubble pops, push the stone all the way down.

// Stage 7 - 265919
// * Use a bubble to push the stone up into the lava.
// * Then use magic and a bubble to push the stone onto the space.

// Stage 8 - 851710
// * Push the stone all the way right, then use a bubble to push it all but one space left.
// * Push it down, then left, then down all the way and right all but one space.
// * Place a bubble in the upper alcove, then go around and puth the stone up.
// * When the bubble pops, push the stone onto the space, then dodge the snake to leave.

// Stage 9 - 242035
// * Move the stone to the lower right.
// * Go around and place a large bubble in the upper right alcove.
// * Push the stone up, then left when the bubble pops.
// * Push it down, then right onto the space, and leave.

achievement("A Little Warm Up", "Complete stage 9", 3, type="progression",
    trigger = complete_stage(9)
)

achievement("No Sweat", "Complete stages 5-9 without dying or restarting a level", 5,
    trigger = complete_stage_range_deathless(5, 9)
)

// -- [Ice Palace] --
// Stage 10 - 334211
// * Use magic and a bubble to push the stone twice.
// * Create a large bubble, then use magic and a bubble to push it twice.
// * When the large bubble pops, the stone will beon the space, and you can leave.

// Stage 11 - 622898
// * Push the stone down and left. Use a bubble in the water to push it down again.
// * Push the stone right and down onto the water. Use magic to push it down again.
// * Push the stone left of the water.
// * Create a bubble on the water, then push the stone back above the water.
// * Push the stone up next to the stairs, then back down one and left onto the water.
// * Use magic and bubbles to push the stone down to the space, then leave.

// Stage 12 - 335170
// * Push the stone up and right to the center of the upper right area.
// * Push it left and down into the water. Use magic and a bubble to get it across.
// * Push it left onto the space and walk over to the ice.
// * Create a bubble and push it down. You'll slide on the ice, but the bubble will stop you
//   at the path. Leave.

// Stage 13 - 984427
// * Push the stone down, left, up, left onto the ice columnn.
// * Push it up to the next area, but not onto the ice.
// * Go around, push it left and down, then use a bubble to move it onto the next column.
// * Push it left once, and use a bubble to push it left again.
// * Then push it up the next column.
// * Go around again and push it all the way down onto the space and leave.

// Stage 14 - 025959
// * Push the stone left and down onto the water.
// * Use magic to push it down one more, then create a large bubble.
// * Run around into the lower left alcove.
// * Push it right, then leave.

// Stage 15 - 359905
// * Push the stone right, then up and right onto the ice.
// * Use magic and a bubble to push it across the ice.
// * Go across the arrow and around. Push it all the way to the left wall and onto the first ice.
// * Use magic to push it onto the second ice, then create a large bubble.
// * Run around to the alcove. Push it right once.
// * Step onto the ice and use a bubble to push it down.
// * Push it onto the space then leave.

// Stage 16 - 653126
// * Step right, then create a big bubble.
// * Use magic and a small bubble to move the big bubble right.
// * Create another small bubble and use magic to move it next to the big bubble.
// * The chain reaction should move the stone right.
// * Push the stone down, then use magic and a bubble to move it down twice more.
// * Repeat the bubble chain to push it onto the space and leave.

achievement("Relax and Chill", "Complete stage 16", 5, type="progression",
    trigger = complete_stage(16)
)

achievement("Slick Moves", "Complete stages 10-16 without dying or restarting a level", 5,
    trigger = complete_stage_range_deathless(10, 16)
)

// -- [Tower] --
// Stage 17 - 119697
// * Push the stone up and use a bubble chain to move it onto the space.
// * Take the teleporter and walk up between the two down arrows, then left, up, right, up to leave.

// Stage 18 - 461932
// * Walk up near the broken floor and step LEFT from the first space.
// * Go up twice, trapping the first snake on the left. 
// * Go up again, trapping the second snake on the left.
// * Go right and push the stone down.
// * Dodging the last snake, push the stone left and down into the main area.
// * Put a large bubble in the upper right alcove, then push the stone below the bubble and leave.

// Stage 19 - 451783
// * Use a medium bubble to trap the snake.
// * Quickly move the stone onto the space and leave.

// Stage 20 - 046627
// * Pop a bubble to the left of the stone to move it right one.
// * Put a medium bubble next to the stairs, then a small bubble above it to push the medium one down.
// * Pop a bubble left of the stone to push it right, then one above it to push it down.
// * Use a complex bubble chain to push it right across the gap.
//   - Large bubble, magic.
//   - Popped bubble! (go past large)
//   - Small bubble, magic.
//   - When it pops, small bubble, magic, popped bubble.
// * Repeat the complex bubble chain in the lower row yo get the stone up onto the space.
// * Leave

achievement("Watch Your Step", "Complete stage 20", 5, type="progression",
    trigger = complete_stage(20)
)

achievement("Careful Footing", "Complete stages 17-20 without dying or restarting a level", 10,
    trigger = complete_stage_range_deathless(17, 20)
)

// -- [Flame Cave] --
// Stage 21 - 248586
// * Go right, Face Down. Bubble, magic, popped bubble to push the stone left.
// * Step left, Face Down. Bubble, magic to push it down.
// * Bubble, magic, popped bubble to push it down again.
// * Go around and Magic, Popped bubble to push it right twice.
// * Bubble, magic to push it right again.
// * Bubble, magic, popped bubble to put it onto the floor space.
// * Bubble, magic, popped bubble, large bubble, magic to push it again.
// * Bubble, magic, popped bubble, large bubble, magic.
//   - When it starts to flash: Large bubble, magic, popped bubble.

// Stage 22 - 250195
// * Bubble, magic to push the stone left.
// * Popped bubble. Bubble, magic to push it down twice.
// * Bubble, magic, popped bubble to push it down again.
// * Push it right twice.
// * Go back to the left side, up, face right. 
// * Bubble, magic, popped bubble, large bubble, magic to push it down.
// * Use magic to push it down, then go all the way around (you can't use bubble on the weird tiles).
// * Bubble, magic, popped bubble to push it down. Then pop a bubble to push it down again.
// * Magic it down again, then push it past the stairs and use magic to finish the level.

// Stage 23 - 773059
// * Push ths stone up and use magic to get it on the inner bridge.
// * Push it right and magic it onto the outer bridge.
// * Push it up into the lava, then magic it one more space up.
// * Step left, then face up. Bubble, magic to push it right once.
// * Bubble, magic. Step left. Large bubble, magic. Leave.

achievement("Restricted Bubble Zone", "Complete stage 23", 5, type="progression",
    trigger = complete_stage(23)
)

achievement("Too Hot to Handle", "Complete stages 21-23 without dying or restarting a level", 5,
    trigger = complete_stage_range_deathless(21, 23)
)

// -- [Time Forest] --
// Stage 24 - 181779
// * Push the stone into the water.
// * When the octopus is on the left side, use magic to push the stone.
//   - The octopus will push the stone for you.

// Stage 25 - 935500
// * Use magic and bubbles to get the stone to the right side. Then push it down.
// * Use magic and bubbles to get it to the left side 
//   - Make sure to have a bubble in the alcove to push it down at the end.
// * Use magic and bubbles to get the stone to the right of the octopus.
//   - It will push it into the water.
// * Bubble, magic to push it right onto the space.

// Stage 26 - 451500
// * Push the stone around so it's on the collapsing tile.
// * Use magic to push it past the collapsing tile.
// * Face down. Large bubble. Step right. Face down. Popped bubble. Step left. Face down. Popped bubble.
// * Step across the collapsed tile. Use magic to push the stone onto the space.

// Stage 27 - 514064
// * Use the green blocks to trap the snakes in the alcoves in each of their columns.
// * Magic, popped bubble. Bubble, magic. Bubble, magic, popped bubble.
//   Medium bubble, magic, popped bubble, bubble, magic to get the bubble across the first land.
// * Repeat to get to the second land. Then push right under the next water column.
// * Push up, and repeat twice to get the stone to the space.

// Stage 28 - 231906
// * Put a large bubble in the water space between the trees right at the start of the level.
// * Very quickly run around and push the stone up, then move to it's left.
// * Magic. Popped bubble. Stand on the next collapsing bridge facing right.
// * Magic. Popped bubble. The very first bubble should pop, pushing the stone up.
// * Bubble, Magic, Popped bubble. The stone will get pushed up again.
// * Push it up again and left to the space and leave.

// Stage 29 - 193444
// * Push the stone around so it's next to the mine. Use magic to push it through the arrow.
// * Go around and push it to the right, then cross the arrow.
// * Push it up to the second row, then back down and left onto the space.

// Stage 30 - 211747
// * Trap the first snake below the collapsing tile.
// * Run past the second snake when it's up, and try to time it so you can follow the third
//   snake as it heads right.
// * For the fourth snake, as soon as it starts its downward journey, run to the little opening
//   on the left. When it passes you going up, continue to the bottom.
// * Advance past the last snake one alcove at a time.
// * Push the stone into place and then repeat the process going backwards.
//   - Use a medium bubble to trap the fourth snake near the water.
//   - After going through the left-facing arrow, go up. When the third snake is going right,
//     make a break for the other tunnel and use another bubble to trap the second snake.

// Stage 31 - 725681
// * Push the stone down a bit. Go around it and put a bubble in the alcove, then push it down
//   next to the bubble.
// * Push it left of the gap, then go down and prep another bubble. Put the stone next to it.
// * Push it left again, leaving room to get around it.
// * Place a large bubble in the upper left alcove and a medium bubble in the lower left alcove.
// * Push the stone left. When the first bubble pops, quickly push it up to the second bubble.
// * Push the stone up near the last tree. Put a bubble in the alcove below the steps and then
//   position to the stone above the bubble.

// Stage 32 - 069319
// * Push the green block up
// * Put a bubble in the lower left alcove, then go around and push the stone above the bubble.
// * Put a bubble in the upper left alcove and push the stone next to it.
// * Put a bubble in the middle alcove and push the stone above it.
// * Push the stone up and right to the space.

// Stage 33 - 090583
// * When the snake starts going right, use a bubble, magic, popped bubble to get the bubble to
//   the left of the stone.
// * Push the stone down, then right onto the water.
// * Go around and put a large bubble in the alcove below the stairs.
// * Quickly run back to the left side of the stone and use magic, popped bubble to move it right.
//   Run back around and push it in front of the bubble. Cross the collapsible bridge and wait
//   on the exit for the bubble to pop.

achievement("Critters of the Forest", "Complete stage 33", 5, type="progression",
    trigger = complete_stage(33)
)

achievement("Helpful Cephalopods", "Complete stages 24-28 without dying or restarting a level", 5,
    trigger = complete_stage_range_deathless(24, 28)
)

achievement("I'm One With the Trees", "Complete stages 29-33 without dying or restarting a level", 10,
    trigger = complete_stage_range_deathless(29, 33)
)

// -- [Ice Palace] --
// Stage 34 - 526074
// * Use magic to temporarily put out the fire.
// * Use magic on the second fire, then use a popped bubble and a bubble, magic to push the stone
//   past the fire. Then go around and push the stone up.
//   - If you're concerned, you can wait and then put out the fire again.
// * Put out the first fire again and leave.

// Stage 35 - 983712
// * Step on the ice and slide up to the space.
//   [Time critical section]
// * Drop a large bubble, then quickly move the stone onto the space.
// * Go back down and off the ice. Create a small bubble and push it up to the stone before the
//   first bubble pops.
// * Step onto the collapsing tile, then off again so you're facing right.
//   [End time critical section]
// * Wait for the first bubble to pop, then use a bubble + magic to push the stone back onto it's space.
// * Create a small bubble and slide to the right and then head down to leave.

// Stage 36 - 597726
// * Push the stone up to the first ice space.
// * Go around onto the first of the upper snow spaces. Face the water.
// * Large bubble, right, up, popped bubble, left, up, popped bubble, run around and push the
//   stone up and right onto the first ice space of the next corner.
// * Repeat the process to get the stone to the lower right.
// * Step around below the stone and push it up two spaces so it's right of the more upper water space.
// * Use a popped bubble to its right to push it onto the water, then magic and popped bubble it
//   left onto the next ice patch.
// * Use a bubble, magic, popped bubble to get a bubble below the stone so it gets moved up.
// * Go around (using a bubble to get to the southern path) and push it to its space and leave.

// Stage 37 - 475420
// * Step onto the collapsing tile.
// * Large bubble, magic, popped bubble. Small bubble, magic. Wait for it to pop.
// * Large bubble, magic, popped bubble. Step onto ice. The double bubble will stop the slide.
// * Go down, move the stone onto the space and leave.

// Stage 38 - 125573
// * Walk toward the ice. Use a bubble to step onto the ice and then down onto the collapsing tile.
// * Magic the stone into the water, then step down and magic it again into the next row.
// * Step right, face down. Bubble, magic. Wait for it to pop and push the stone left.
// * Use a popped bubble to push it down.
// * Use the double-bubble trick to get onto the next collapsing tile. Walk to the stone.
// * Magic. Popped bubble. Bubble, magic to get the stone onto the first ice square.
// * Use the double-bubble trick to get onto the next collapsing tile.
// * Use a bubble to get on the ice, then head right.
// * Use magic to push the stone right, then pop a bubble above it to push it down.
// * Put another bubble above it so it'll pop and push it onto the space. Leave.

// Stage 39 - 187879
// * Pop a bubble next to the turrets so they'll sink into the ground.
// * Push the stone into the water and use a bubble chain to push it to the space.
// * Go around and pop a bubble near the turrets again and leave.

// Stage 40 - 190251
// * Go around and push the stone down onto the water. Magic it onto the ice.
// * Push it right, then up into the next area.
// * Go around and put a bubble in the water left of the receptacle.
// * Push the stone up and let the bubble push it onto the space.
// * Go around and use a bubble to lower the turrent and leave.

// Stage 41 - 835610
// * Place a large bubble near the right turret, then go all the way around to the left side.
// * To get the left turret, you have to push a bubble across the water.
// * Quickly push the stone to the right and onto it's space (before the first turret returns).
// * Go around to the bottom and magic a large bubble onto the ice.
// * Magic another small bubble below the first to push the first up to the turret.
// * Without waiting for the bubbles to pop, go back around and push the stone up one so
//   you can face left and put up another bubble for the turret. 
// * Put the stone back on it's space, then make a break for the exit using a bubble to stop your slide.

achievement("Trudging Through the Snow and Ice", "Complete stage 41", 5, type="progression",
    trigger = complete_stage(41)
)

achievement("No Trouble with the Double Bubble", 
            "Complete stages 34-41 without dying or restarting a level", 10,
    trigger = complete_stage_range_deathless(34, 41)
)

// -- [Flame Cave] --
// Stage 42 - 488631
// * The flower thing will shoot at you. Otherwise, this is a pretty straightforward level.
// * Put a medium bubble straight below the receptacle, then push the stone above the bubble.
// * After it pushes the stone up, push it up again.
// * Quickly step left of the flower and it'll start flashing. Run around it's right side
//   while it shoots left.

// Stage 43 - 471441
// * Use a large bubble to block the left flower, then quickly push the stone right twice,
//   down, and right onto the space.
// * Go back around and leave.

// Stage 44 - 275095
// * Quickly run through the grass and around the top of the level.
// * Walk onto the next field of grass so you're between the stone and the pillar.
// * Drop a large bubble and step to the right side of the stone and push it left into the lava.
// * Use magic to push it across the lava, then push it down to the space.
// * Just run through the grass to the exit - you'll beat the flower shots.

// Stage 45 - 278393
// * Pop a bubble to the left of the stone to move it right.
// * Use a bubble chain to push the stone down next to the mine.
// * Run around the right side and push the right block down one.
// * Stand on the collapsable tile.
//   [Time critical section]
// * Face up and create a small bubble and Magic it up.
// * Quickly step left, face up, create a large bubble and push it up. It'll pop, pushing the
//   other bubble right.
// * While the bubble is growing, push the leftmost block down one, and the middle block right
//   three times and down all the way.
//   [End time critical section]
// * Push the stone left into the lava, then push the middle-right block up, right, and down.
// * Stand left of the stone. Create a small bubble up, then step left and pop a bubble to force
//   the stone down.
// * Push it right twice, then left and down onto the space.

// Stage 46 - 975893
// * Push the stone right, then magic it and pop a bubble to get it in the rightmost lava space.
// * Put a medium bubble next to the bottom-right mine, then pop a couple bubbles and push the
//   stone so it's above the first bubble.
// * Push the stone up and left into the lava.
// * Magic. Pop. Bubble, magic. Bubble, magic, pop to get the stone onto the island.
// * Pop a bubble to move the stone down one.
// * Move to the left side. Bubble, magic, pop to move it right once.
// * Bubble, magic, pop, large bubble, magic to move it right again.
// * Go back to the right side and use small bubble, magic, pop to position a bubble above it.
// * Then run as quickly as possible to the exit.

// Stage 47 - 254443
// * Create a large bubble to hold off the lizard, then push the stone all the way down.
// * When the lizard starts moving down, pop the bubble and run through to the grass.
// * Turn around and use a large bubble to trap it near the top, then move to the exit.
//   - You can also try to outrun the lizard, stopping in the alcove near the exit.

// Stage 48 - 027808
// * When the bottom lizard passes below you to the left, step left, face down and create a 
//   bubble to trap it. 
// * Move through the middle and drop a large bubble in the top row, trapping the upper 
//   lizard on the left.
// * Move over to the stone and push it down all the way down, then left so you're under the pillar.
// * Magic. Popped bubble. Bubble, magic to push the stone onto the place.
// * As the lower lizard moves right, step left out of the safe spot, turn up and create a
//   bubble. Push it up to block the lizard, then run for the exit.

// Stage 49 - 637648
// * Go around to the right. 
//   [Time critical section]
// * On the upper normal tile, create a small bubble to the left.
// * On the lower normal tile, face left, create a large bubble, and push it left with magic.
// * It will pop and push the other bubble up onto the rune track.
// * Push the bubble left to the collapsible tile.
// * When it shrinks to the smallest size, use magic to push it into the lava, then run all
//   the way around and push the stone down onto the collapsible tile.
//   [End time critical section]
// * Go back to the normal tiles and repeat the process of getting a bubble onto the rune track.
// * When it shrinks to small, pop a bubble below the bubble on the rune track to push it into
//   the lava (above the rune track), then run around and push the stone below the bubble in 
//   the lava.
// * Use magic to push the stone left one and down one.
// * On the upper normal tile, create a bubble and magic it. It'll push the stone down.
// * On the lower normal tile, create a bubble, magic it, then pop a bubble. The stone will go
//   down again.
// * On the lower normal tile, create a bubble, magic it, then pop a bubble. Create a large bubble
//   and push it. Step onto the upper normal tile. Large bubble, magic, popped bubble. The first
//   bubble should now be on the island.
// * Return to the lower normal tile. Medium bubble. Magic. Popped bubble. Large bubble. Magic.
//   The new bubble should push the first bubble down and it'll push the stone right.

achievement("Bubble Juggler", "Complete stage 49", 10, type="progression",
    trigger = complete_stage(49)
)

achievement("Hot Stuff", 
            "Complete stages 42-49 without continuing", 10,
    trigger = complete_stage_range_without_continuing(42, 49)
)

// -- [Tower of Ordeals] --
// Stage 50 - 094850
// * Create a large bubble under the long column of pillars (not under the green thing).
// * Step left twice, face right, and create a medium bubble.
// * Book it around the rest of the level. The left bubble should pop, pushing the right bubble
//   to the right and the monster will charge at the bubble. You can run past it as it crawls
//   back to its starting location.

// Stage 51 - 403584
// * Face up. Place a medium bubble next to the turret.
// * Run down and face right. Large bubble, magic into the alcove.
// * Run up to the right. Face left, medium bubble. Push left to trap snake.
// * Push stone down into pit before bubble pops and it'll push the stone left.
// * Push the stone down into the other pit, then magic it across when the snake is on the left.
// * Pop a bubble next to the turret and run up next to the teleporter.
// * When the lower snake has moved off the lower teleporter, jump in and run to the right. 
//   Duck down onto the stairs.
// * When the lower snake is out of the way, push the stone up, then leave.

// Stage 52 - 195190
// * Take the teleporter, then run all the way around to the bottom left. Face right, create a
//   bubble, and push it right to trap the snake. You'll step on the collapsing tile, and it'll
//   hold the snake after you step off.
// * Push the stone left twice. Create a medium bubble left of the T, then push the stone into it.
// * After the bubble pushes the stone right, go around and put a bubble in the lower right
//   alcove, then push the bubble over it.
// * Put a bubble in the upper right alcove and push the stone up next to it.
// * Push the stone left and up so it's next to the top of the pit. Then push it in.
// * Magic. Popped bubble. Bubble, magic to move it above the pillar in the pit.
// * Go around to the top and create a large bubble next to the stone. Magic it down into the 
//   alcove in the pit.
// * Come back and small bubble, magic, popped bubble. The bubbles will push the stone right and up.
// * Push the stone right and down into the next pit.
// * Take the teleporter and put a large bubble in the lower alcove.
// * Take the teleporter back. Magic and popped bubble to move the stone down.
// * Take the teleporter again. Push the stone onto the exit, then step aside.
// * The bubble will push the stone back up. Put it on it's place, then leave.

// Stage 53 - 698582
// * Push the stone into the pit, then magic it so the octopus will push it left.
// * Take the lower teleporter. Bubble, magic to get the stone pushed into the next pit.
// * Take the teleporter back and get the octopus to push a large bubble below the stone.
// * Wait for it to pop, then give the octopus another large bubble. While it's pushing it,
//   take the lower teleporter. As the octopus moves left from under the pit, create a small 
//   bubble and Magic it across the pit. It should push the first bubble up, causing the
//   stone to get pushed up again.
// * Take the teleporter back, then take the other teleporter.
// * Push the stone up and across the pit, letting the other octopus push it right onto the space.

achievement("Teleporter Training", "Complete stage 53", 5, type="progression",
    trigger = complete_stage(53)
)

achievement("Sneaking Around the Snakes",
            "Complete stages 50-53 without dying or restarting a level", 5,
    trigger = complete_stage_range_deathless(50, 53)
)

// Stage 54 - 885059 (so hard!)
// * Take the teleporter. Put a bubble in front of the turret and go back. Push the stone over the
//   turret and into the pit. Use magic to push it left onto the first rune tile.
// * Push the stone up into the pit, then magic it up another space.
// * Put a small bubble next to the turret. Take the teleport and stand on the turret. Create
//   a large bubble and magic it left. Take the teleport and push the bubble up. It'll pop and
//   push the stone up.
//   [Time critical section]
// * Put a small bubble next to the turret. Take the teleport and stand on the turret. 
// * Create a large bubble and take the teleport. Push it up, then pop a bubble to push it up again.
// * Create a small bubble and magic it up. 
// * Stand on the crumbling tile. 
// * Face up and Magic to put out the fire. The first bubble should push the stone left.
// * Magic the stone onto the teleporter. Wait for the fire to come back.
//   [End time critical section, being new time critical section - this is very hard]
// * Put out the fire, step onto the fire space, but not the teleporter!
// * Magic. Popped bubble. Bubble, magic. 
// * When the bubble starts to flash: Bubble, magic, popped bubble. 
// * When the bubble starts to flash: Medium bubble, magic.
// * When the flashing bubble pops: Popped bubble.
// * Small bubble, push it up (stepping on teleporter)
//   [End time critical section]
//   --- The stone should be one space below the collapsible tile ---
// * Step across and pop a bubble to push the stone right once.
// * Use large bubbles to hold the snakes back. Unfortunately, you can't permanently trap them,
//   so you can to keep re-inflating the bubbles.
// * Push the stone right:
//   - Bubble, magic (refresh snake bubbles)
//   - Bubble, magic, popped bubble (refresh snake bubbles)
//   - Medium bubble, magic, popped bubble, bubble, magic (refresh snake bubbles)
//   - Large bubble, magic, popped bubble, bubble, magic (refresh snake bubbles)
//     bubble, magic, popped bubble (run to arrow tile)
// * Let the snake bubbles pop. When the right snake goes up, make a run for the exit.

// Stage 55 - 527718
// * Go down to the space between the snake path and the green monster path.
// * Create a bubble to trigger the green monster. When he starts back, go down and follow him.
//   - Create a bubble behind him and push it to trap him then step up next to the green block.
// * Push the green block right, then step into the teleporter.
// * Put out the fire and step on the next teleporter when the left snake is going left.
// * Follow the snake, then go up and push the stone right.
// * When you hit the teleporter, step off and back on to teleport back.
// * Push the stone down, then step on the teleporter again.
// * Step off and back on the teleporter again, then exit the level.

// Stage 56 - 050825
// * Step up onto the middle teleporter.
// * Push the stone down one, then magic it down another space.
// * Walk along the arrow tiles to the gap on the left.
// * Walk around the outside to the green block on the right. Push it down four spaces then
//   go around it and push the other green block left to trap the snake.
// * Step on the lower teleporter. Step right onto the middle teleporter.
// * Walk around again and push the block down one and left two (onto the arrow).
// * Take the upper right teleport.
// * Step down, and push the stone left twice. Magic, popped bubble to push it left twice more.
// * Step in the left teleporter. Go around and push the stone up into the pit.
// * Step on the left penninsula and bubble, magic so it pops and pushes the stone right.
// * Pop a bubble to the left of the stone, and push it right next to the teleporter (not on).
// * Magic a bubble above the stone to push it down.
// * Push it right, step on the teleporter, step off and back on, then push the stone down
//   onto the stairs. Pop a bubble to its right to push it onto its space.

// Stage 57 - 560036
// * Pop a bubble above the turret. Approach the teleporter.
// * When the lizard is left of the stone, step on the teleporter.
// * Magic the stone up, then step right twice. When the lizard turns to shoot, step left once.
//   When it turns to shoot again, step right. While it's running left, go put a bubble under
//   the stone. Dodge the lizard some more, then use a magic'd bubble to push the stone up again.
// * Bubble, magic, popped bubble to push the stone up again.
// * Large bubble, magic, popped bubble (to trap the lizard on the left)
// * Run up the right side and cross the collapsing tile.
// * Push the stone left one space, then magic it left another.
// * As the lizard gets free, create a small bubble, then run up and all the way left.
//   - if you go around before the lizard is freed, he might shoot the stone.
// * Put a medium bubble in front of the turret, then work your way around so that you can push
//   the stone left while the lizard is going right.
// * When the bubble pots and the turret drops, push the stone into the spot above the turret
//   and go back to the spot next to the two pillars. Face left, bubble, magic, popped bubble.
//   The stone should go down, then push it down onto the teleport.
// * Face left, bubble, up, left, popped bubble to push the bubble down and the stone right.
// * Step on the teleporter, off, and back on (being careful to avoid the lizard).
// * Push the stone right twice, then magic it onto the stairs.
// * Take a quick trip onto the teleporter and back and go down this time.
// * Face right. Medium bubble. Magic. Popped Bubble. Bubble. Magic.
// * Take another quick trip onto the teleporter and back and go right to leave.

achievement("Teleporter Trials", "Complete stage 57", 10, type="progression",
    trigger = complete_stage(57)
)

achievement("Crumbling Floor Conquerer",
            "Complete stages 54-57 without continuing", 10,
    trigger = complete_stage_range_without_continuing(54, 57)
)

// -- [Dark Space] --
// Stage 58 - 431978
// * Drop a large bubble in the left alcove.
// * Run around to the top and pop a bubble above the turret.
// * Push the stone down and let the bubble push it right.
// * Push the stone right onto the rune tile, then go stand on the steps.
// * Bubble, magic. Walk around and push the flame into the pit. Magic it across.
// * Go stand on the steps again.
// * Large bubble, Magic, Popped bubble. Small bubble, Magic.
// * Run around and push the bubble up before it pops.
// * Go to the stairs.

// Stage 59 - 395969
// * Walk around so you're standing on the receptacle facing up.
// * Create a medium bubble above you. Push it right, magic, then push it down.
// * Step up in the leftmost column so the octopus turns towards you.
// * Run all the way down. When the octopus reaches the bottom, run back up and around to leave.

// Stage 60 - 460226
// * Put a bubble to the right of the stone, then one to the left. The right bubble will drop the
//   turret, then the left bubble will push it right. Push it down near the bottom.
// * Go around. Put a large bubble in the right alcove, and a medium bubble in the lower alcove.
// * Push the stone next to the lower bubble, then up to the upper bubble. It should end up in
//   the long pit.
// * Stand beneath it. Magic. Popped bubble. Bubble, magic.
// * Go up the left side and leave a medium bubble next to the stone. Run to the exit.

// Stage 61 - 113419
// * Step right, face down. Large bubble, magic, popped bubble.
// * Left twice. Bubble, magic.
// * From the left side: Magic. Popped bubble. Bubble, magic. Bubble, magic, popped bubble.
// * Push the stone into the next pit. Magic. Popped bubble.
// * Use popped bubbles to push it down so it's at the lowest space of the pit.
// * Use a bubble to drop the turret. Then put a large bubble in the lower alcove.
// * Use a popped bubble to push the stone down, then move it above the bubble.
// * After the bubble pops, push it into the pit below the stairs.
// * Put a large bubble to the right of the stone, then cross the collapsible tile.
// * Face down and create another large bubble and magic it down.
// * Step on the exit and wait for the bubbles to do their jobs.

// Stage 62 - 498435
// * Use a bubble to push the stone left. Wait for the octopus to start left/right.
// * Push the stone left twice more and magic it down.
// * Push the green square up one. Down twice, up, so you're facing where the green square was.
// * When the octopus starts going right, create a large bubble and step across the upper
//   collapsable tile and then down. When the octopus turns down, step left. As soon as the
//   octopus reaches the bottom square, book it down and around. Push the other green square down
//   to trap the octopus.
// * Go up to the stone, face right, medium bubble. Down, face right, popped bubble.
// * Push the stone left one more, then go stand below it. Popped bubble to push it up.
// * Stand on the purple stuff under it. Magic, popped bubble. Then push it left onto the receptacle.
// * Run to the exit.

achievement("Escaped the Darkness", "Complete stage 62", 5, type="progression",
    trigger = complete_stage(62)
)

achievement("Dancing in the Dark", 
            "Complete stages 58-62 without dying or restarting a level", 10,
    trigger = complete_stage_range_deathless(58, 62)
)

// -- [Time Forest] --
// Stage 63 - 481482
// * Push the stone all the way up. Use a popped bubble to push it left.
// * Push it left so it's just right of the arrow. Go down, left twice, down, and up. Drop a
//   medium bubble, magic it, then push the stone left again.
// * Pop a bubble above the stone to push it down again. Then push it down another space.
// * Up, Right twice, Left. Put a large bubble on the arrow above the stone. Up, Left, Popped bubble
//   to push it down to the stone. Quickly go around and place a large bubble in the left alcove,
//   then run all the way right and back up to the top while waiting for the bubbles to push the 
//   stone down and right.
// * Push the stone right twice, up and right three times and down TWICE. Magic it down next to
//   the arrow.
// * Go to the top left and around to pop a bubble on the arrow to push the stone left.
// * Bubble, magic to push it again.
// * Go back around and magic it down, then push it to the receptacle and leave.

// Stage 64 - 089618
// * Pop a bubble at the lower left turret.
// * Put a large bubble in the lower left alcove, then push the stone right and down next to it.
// * Wait for the bubble to pop, then push the stone right to the middle area.
// * Pop a bubble below the next turret, then put a medium bubble in the lower alcove.
// * Push the stone above the bubble, then up into the water when it pops.
// * Pop a bubble in front of the double turrets, then magic and push the stone onto the octopus's
//   island.
// * After the octopus pushes the stone down, create a bubble and push it onto the island.
// * Pop another bubble to drop the turrets again and head to the exit.

// Stage 65 - 642266
// * Push the first block around to trap the first snake in the left alcove.
// * Use the next two blocks to trap the next two snakes on either side.
// * Push the stone around so it's under the last two snakes on the right side.
// * Drop a large bubble above you, trapping the two snakes on the left.
// * Push the flame around the bubble and onto the space, then leave.

// Stage 66 - 292713
// * Pop a bubble near the lower left turret, then magic a bubble up to the right side of the stone.
//   [Time critical section]
// * Place a large bubble at the lower right turret, then pop a bubble at the upper left turret.
// * Magic, popped bubble to get the stone on the lower path.
// * Pop a bubble at the lower left turret.
// * When the lower right turret goes down, push the stone through to the next water strip.
//   [End time critical section]
// * Pop a series of bubbles to push the stone down, then push it onto the space. Leave.

// Stage 67 - 628791
//   [This whole level is about timing. Pause when you need to read ahead.]
// * Pop a bubble under the first turret, then one at the second turret.
// * Run back and place a large bubble below the first turret.
// * Run through the second turret, turn around and place a large bubble there too.
// * Pop a bubble under the third turret, and quickly push the stone down through the gap.
// * Go back and reset the large bubbles for the first two turrets.
// * Push the stone right, up, and right to the mine.
// * Reset the large bubble for the first turret.
// * Push the stone down, left, down, and right onto the space. Leave.

// Stage 68 - 721337
// * Pop a bubble left of the stone to move it right.
// * Go to the middle of the first bend and push a bubble up next to it to move it right again.
// * Push it right once, then face up and create a bubble. Step left, face up, popped bubble.
// * Push it down once, then go to its left side and move it right: popped bubble. bubble, magic. 
// * Push it down, then magic it down again.
// * Go back to the lower right corner of the grass section, facing right.
// * Large bubble. Magic. Popped bubble. Bubble, magic. Run around to push the first bubble down
//   when it's above the stone.
// * Repeat the above, using magic after pushing the bubble down. The stone should be just above
//   a tree.
// * Run around to the collapsible tiles. Stop on the second one (next to the stairs).
// * Turn up and a create a large bubble. Run to the left of the stone and pop a bubble to move
//   it right. Use bubble+magic to move it right again and the first bubble will push it down.
// * Large bubble. Magic. Popped bubble. Bubble, magic.
// * Quickly drop a bubble in front of the turret, then run to the right side before the stone
//   gets moved down.
// * Push the stone left, then go to the exit.

// Stage 69 - 559422
// * Push the stone up twice, then run down to the arrow tile.
//   [Time critical section]
// * Go up and pop a bubble near the turret. Step through. 
// * Turn around and place a large bubble below the turret.
// * Run over to the stone and push it up and right (above the turret).
// * Left, Up, Right. Small bubble, Magic.
// * The first bubble will drop the turret, and the stone will get pushed down.
// * Push it down again past the snake (when the snake is on the left).
//   [End time critical section]
// * Go back through the turret and around to the arrow tile. Push the stone onto the space,
//   pop another bubble at the turret and return to water left of the arrow tile.
// * Large bubble. Magic. Small bubble. Then run up, across the collapsing tile and down to where
//   the turret was. As soon as the snake is in the space right of the turret, run for the exit.

// Stage 70 - 351269
// * You need to place bubbles in the first three alcoves. Large in the farthest, medium in the 
//   middle one, and small in the first alcove. Then push the stone through the zig-zag using the
//   bubbles at each bend.
// * Push the stone up twice. Place a large bubble in the water, then push the stone below the
//   the water. Quickly run down and put a large bubble in the alcove above the collapsing tiles,
//   and a medium bubble in the right alcove. Run back to the top before the first bubble pops,
//   then push the stone down and left using the bubbles at each bend.
// * Push the stone down onto the first collapsing tile, then go left. Place a large bubble in
//   the water left of the stairs, and a medium one in the alcove by the trees. Go around the
//   stone and push it left, using the bubbles to navigate it to the final space.

achievement("Fantastic Journey through the Forest", "Complete stage 70", 5, type="progression",
    trigger = complete_stage(70)
)

achievement("Blasting Barricades with Bubbles", 
            "Complete stages 63-70 without continuing", 10,
    trigger = complete_stage_range_without_continuing(63, 70)
)

// -- [Ice Palace] --
// Stage 71 - 845818
// * Magic the stone up, then push it below the receptical.
// * On the leftmost snow space, face up.
// * Large bubble. Magic. Popped bubble. Bubble, magic.
// * Push the bubble up under the stone.
// * After it pops, push the stone onto the receptical and leave.

// Stage 72 - 711856
// * Up, Up. Down. Medium bubble. Up, Left, Down, Right. Popped bubble. The first bubble should get
//   pushed up and push the stone left when it pops.
// * Right, Left. Small bubble. Left. Push the stone up onto the collapsing tile.
// * Use a bubble to trap the snake to the right.
// * Step on the right collapsing tile, then step back down. Face up and pop a bubble to move the
//   stone left. Left, Down, Up and pop another bubble to push it left again.
// * Put a small bubble on the collapsing tile. Refresh the snake bubble. Pop a bubble to the right
//   of the small bubble. When the small bubble pops, the stone will move left again.
// * Refresh the snake bubble. Put another small bubble on the collapsing tile and pop a bubble to
//   its right. Step on the collapsing tile and push the bubble left.
// * When it pops: Bubble, Magic. Bubble, Magic, Popped bubble.
//   Quickly use the bubble to get between the mine and pillar. 
//   When it pops, the stone should be next to a leftmost mine.
// * Dodge the snakes, crossing the collapsing tile. In the last row, use a bubble to trap the 
//   snake as you go around the mine.
// * Go up the snow and push the stone all the way up.
// * Step on the collapsible tile and face up. Pop a bubble to move the stone right.
// * Step across the ice, then back, then down (watch out for snake), and back up. 
// * Then push the stone right into the water. 
// * Magic. Popped bubble. Bubble, Magic. Bubble, Magic, Popped bubble.
// * Go down past the first two snakes. When the second snake is fully on the ice, step up and
//   right across the arrow and up to get back on the main ice row.
// * Duck back in the gap near where you started, and when the last snake is fully left of you,
//   make a run for the exit.

// Stage 73 - 261853
// * Push the stone left into the water, then magic it across.
// * Push it up, left, and up onto the first ice space.
// * Magic. Popped bubble. Bubble, Magic.
// * Create a bubble. Go up, then push the bubble left into the water. Wait for it to pop.
// * Create anoter bubble in the water, step right, down, left. Popped bubble. The first bubble
//   will push the stone right when it pops.
// * Go right to the space left of the mine under the pillar. Face down.
//   [Time critical section]
// * Create a large bubble.
// * Go back and quickly push the stone right to the first ice space. Magic it right again. 
// * Go above it and push it down against the bubble.
// * Left twice, Right. Bubble, Right. Down. Push the stone right before the first bubble pops.
//   [End time critical section]
// * Push it right twice more. Go around and put a bubble on the stairs, then push it above the
//   bubble. When it pops, push the stone up to the receptacle.

// Stage 74 - 550072
// * Put a large bubble in the far right alcove, then a small bubble in the water down and left 
//   from the stone.
// * Quickly run around and push the stone down so the small bubble will push it right.
// * Face the water and pop a bubble to push the stone down, then push it down again next
//   to the first bubble, which will pop and push it left.
// * Push it left into the water. 
// * Magic. Popped bubble. Bubble, magic. Bubble, magic, popped bubble.
// * Go around and magic it left once more.
// * From above: Popped bubble. Bubble, magic. Bubble, magic, popped bubble.
// * Go around the stone to the four snow squares. 
//   [Time critical section]
// * Create a large bubble and push it all the way right. Let it shrink and then reinflate it.
// * Quickly return to the left of the stone. Face it.
// * Popped bubble. Bubble, magic.
// * Move below the stone while waiting for the bubble to pop, then push it all the way right to
//   the first bubble.
//   [End time critical section]
// * Left, Down, Right, Up, Face Left. Pop a bubble in the water above the stone to push it down.
// * Go left into the snow row. Turn right. Create a large bubble and push it right.
// * Go back to the snow row and create a small bubble and push it right. It'll pop and push the
//   stone down again.
// * Create a large bubble in the water above the stone and repeat the snow row bubble chain to 
//   get another bubble above the stone and push it down again.
// * Go to the right-most snow space and face down. Create a bubble and slide down, then push
//   the stone left.
// * Go to the left-most snow space and face down. Create a bubble and slide down then step on
//   the exit.

// Stage 75 - 222492
// * Put a bubble on the arrow tile, then move around below where the stone will end up.
// * Push the stone up three and left onto the ice. Magic, Popped bubble to move it left twice.
// * Push it down once.
// * Go around past the lower arrow tile. Left, Right. Create a large bubble and push it right.
//   Go back and push the stone down and right. Stay there until the bubble pops.
// * Go back to the upper right area. Face the stone across the water.
// * Bubble, Magic, Popped bubble. Large bubble, Magic, Popped bubble, Bubble, Magic.
// * Go back to the lower right and push the stone left. Use magic and a popped bubble
//   to move it over the collapsing tiles.
// * Leave (by sliding over the collapsing tiles).
    
achievement("Dancing on Ice", "Complete stage 75", 5, type="progression",
    trigger = complete_stage(75)
)

achievement("Permafrost Patience", 
            "Complete stages 71-75 without continuing", 10,
    trigger = complete_stage_range_without_continuing(71, 75)
)

// Stage 76 - 556444
// * Go down to the lower right part of the screen. Slide left, create a bubble, and slide left
//   more. Turn up and slide to the upper left.
// * Step right, up. Large bubble. Up, right, up, left. Push the stone down. Then magic it down.
// * Slide up and down the left column, then create a bubble and magic it. It'll push the
//   stone right.
// * Slide up and down the second column, then create a bubble and magic it. It'll push the
//   stone right again.
// * Slide up and down the left column again. Create a bubble and step down, then right to end
//   up above the stone. Push it down. Magic. Popped bubble.
// * Slide up and down the second column again. Create a large bubble and push it down. Go back
//   up, and up again, and down. Create another bubble and push it down. Face right to push the
//   stone onto the collapsible tiles.
// * Magic. Popped bubble. Bubble, magic.
// * Go down below the stone and push it up to the mine and then right into the water.
// * Pop a bubble below it to move it up. And do it again.
// * Put another bubble in the water, and pop a bubble below that to get it up another space.
// * Go stand under it and magic, popped bubble it up two more spaces.
// * Push it left onto the space and go back to the exit, using a bubble in the lower left to
//   stop the sliding.

// Stage 77 - 106075
// * Take the long ice slide to the left side.
// * Move up across from the turret, making sure not to get the octopus's attention.
// * Bubble, magic to pop the turret.
// * Run around the top and pop a bubble in front of the right turret. Push the stone into the water.
// * Pop a bubble above the stone to push it down. Repeat so the stone is below the ice rocks.
// * Magic, popped bubble to push it right.
// * Take the ice slide to the right side and stand below the pair of mines. The octopus will push
//   the stone onto the water.
// * Right, down twice, then face up. 
//   [Time critical section]
// * Create a large bubble.
// * Left, Up, Face down. Drop a large bubble on the ice.
// * Run around to the left side (making sure not to draw the octopus's attention) and place a
//   medium bubble in the water just above the ice.
// * Pop a bubble above it, then quickly step down and push it right. You should be below the right turret.
//   [End time critical section]
// * Face up. Bubble, magic. It'll pop and push the stone right once.
// * Medium bubble, magic. The octopus will push it onto the water. It'll pop and move the stone right.
// * Right, up, right, down. (You'll be next to the bottom right mine).
// * Small bubble. Up, Up, Down, Large bubble. Left.
// * When the small bubble pops, the large bubble will get moved up a space. Go right (bubble will stop you)
//   then push the stone up to the receptacle. Then head to the exit.

// Stage 78 - 245568
// * Go to the middle right snow space, facing up (down and right of the water).
//   [Time critical section]
// * Large bubble (next to the water).
//   Popped Bubble in the water. Small bubble on the ice below the first bubble.
// * Run around to the top middle snow space. 
// * Bubble, right, then push the stone down (it'll stop at the first bubble).
//   [End time critical section]
// * Push the stone left into the water. Magic it left once. 
// * Go back to the middle right snow space and put another large bubble next to the water and pop a bubble
//   in the water to move it right. Then push it up.
// * Go back down and repeat that so there's a bubble between the two ice stones.
// * When the first bubble pops, refill the second bubble, and repeat the process again.
// * With a bubble in the third row, step right. The second bubble will pop, pushing the third bubble down,
//   then push it all the way left so it pops next to the stone.
// * Push the stone down onto the next water, then magic it across.
// * Go up above the ice, turn around, create a bubble and push it down. It'll push the stone down.
// * Go down to the lower left and face the stone.
// * Magic. Popped bubble. Bubble, Magic. Bubble, Magic, Popped bubble.
// * Large bubble, Magic, Popped bubble, Bubble, Magic.
// * Large bubble, Magic, Popped bubble, Bubble, Magic, (wait for flashing), Bubble, Magic, Popped bubble.
// * The stone should be under the mine now.
// * Bubble, right. Bubble will pop and push the stone below the stairs.
//   [Tricky part]
// * Large bubble, Right. Face Down, Large bubble, Left. Left, Right, Small Bubble, Right.
//   Face down, Popped bubble. Face right, Pop existing bubble, Right, Face down. Popped Bubble.
//   Face right, reinflate bubble before it pops. Bubble in water will push stone up.
//   Push bubble right. When it pops, stone will get pushed into receptacle. Step on the stairs.

// Stage 79 - 974994
// * Move up twice, right past the stone, and down. Push the stone left onto the first ice square.
// * Down, Up, Medium bubble. Right, Down, Up, Popped bubble.
// * Pop a bubble above the stone.
// * Up, Down, Medium bubble. Right, Up, Down, Popped bubble.
// * Left, Up, Down, Medium bubble. Right, Up, Down, Popped bubble. Left, Popped bubble.
// * Down, Medium bubble. Up, Right, Down, Bubble, Magic.
// * Up, Left. Up, Down. Large bubble. Right, Up, Down, Popped bubble.
//   Left, Large bubble, Magic, Popped bubble. Small bubble, Left, Down.
//   Bubble should stop next to stone, then push the stone down when it pops.
// * Go back up and stand on the rightmost square of the middle snowfield.
// * Large bubble, Magic, Popped bubble. Small bubble, Right, Down.

// Stage 80 - 596435
// * Down, Magic. Right, Down, Left, Up, Right, Up, Left, Magic. Up, Left, Down, Popped bubble.
// * Bubble, Magic. Medium bubble, Magic, Popped bubble. 
// * Large bubble, Magic, Popped bubble, Small bubble, Magic.
// * Run around to the space below the stone and face up
//   - the other bubble will stop you from pushing the stone.
// * Face left. Medium bubble. Down, Left, Popped bubble. Stone should end up between the mines.
// * Go back to the top left part, facing down on the left side.
// * Large bubble, Magic, Popped bubble. Small bubble, Magic.
// * When the small bubble starts flashing: Large bubble, Magic. Popped bubble.
// * Quickly run around to the left size of the stone, then push it right next to the water.
// * Push it up. Magic. Popped bubble. Small bubble, Magic.
// * Run around above it and place a large bubble in the alcove. Pop a bubble below the stone.
// * Run up to the pedestal. Face down and drop a large bubble, then stand on the stairs and wait.

achievement("Bubbles Stop Sliding", "Complete stage 80", 5, type="progression",
    trigger = complete_stage(80)
)

achievement("Safely Sliding in Circles", 
            "Complete stages 76-80 without continuing", 10,
    trigger = complete_stage_range_without_continuing(76, 80)
)

// -- [Tower of Ordeals] --
// Stage 81 - 521215
// * Walk up and take the upper teleport. Then the lower teleport.
// * Walk down and push the stone into the pit. Then go around to the top and Bubble, Magic to push it down.
// * Bubble, Magic, Popped bubble. 
//   [Time critical section]
// * Large bubble, Magic, Popped bubble. Small bubble, Magic.
// * Quickly run around and put a small bubble on the collapsing tile, then step right under the
//   arrow and down.
//   [End time critical section]
// * Push the stone right, up, and magic it onto the receptable.
// * Cross the collapsing tile, and take the upper teleport, then the lower teleport to the stairs.

// Stage 82 - 531272
// * Put a large bubble in the nearby pit. Run left and magic the stone down, then push it under the bubble.
// * Push it down into the next pit. Pop a bubble on the right to push it left. Repeat twice more, then
//   Magic it down. 
// * Step right, Face down, Bubble, Magic to push it left.
// * When the snake starts moving left, put a small bubble next to the snake's path, and pop a bubble to its
//   right. The small bubble will get pushed below the teleporter, then push the stone down.
// * Standing next to the teleporter: Face down, Large bubble, Magic, Right, Down, Small bubble, magic.
// * Take the teleporter. Face right, Small bubble, Magic.
// * Step down, Face right, Small bubble, Magic.
// * Down, Down, Face right. Popped bubble. Bubble, Magic. Bubble, Magic, Popped bubble. 
// * Medium bubble, Magic, Popped bubble, Bubble, Magic.
// * Walk around and step on the teleporter, then the other teleporter.
// * Pop a bubble to push the stone right, then push the stone right again and leave.

// Stage 83 - 610631
// * Walk around the snake and Magic the flame.
// * Cross over, push the green square down, and take the central teleporter.
// * Push the stone down into the pit, Face right, Small bubble, Up, Right, Popped bubble.
// * Down, Popped bubble. Step onto the teleporter and back.
// * Push the stone left to trap the snake, then Magic it into the pit. Popped bubble.
// * Walk down and left below the stone and Magic, Popped bubble it up. Bubble, Magic.
// * Bubble, Magic, Popped bubble. Medium bubble, Magic, Popped bubble, Small bubble, Magic.
// * The stone should be on the arrow now. Magic it up once.
// * Stand on the left of the pit, face right and create a Large bubble. Magic it so it traps
//   the snake above it.
// * When the second snake starts moving down, run to the other teleporter.
// * Push the stone right into the pit, then stand above it and Magic it down.
// * Move to the left side and Magic the stone onto the stairs.
// * Up, Right, Small bubble, Magic.
// * Left teleporter, Middle right teleporter, Upper right teleporter, Stairs.

// Stage 84 - 839137
// * Push the stone left.
// * Take the teleporter, then Middle teleporter. Push the stone up one.
// * Take the teleporter, then Right teleporter. Push the green block all the way right.
// * Place a large bubble next to the green block, then quickly take the teleporter back and push the
//   stone up twice.
// * When the bubble pops, push the stone left to trap the snake above it, then push the stone up.
// * Pop a bubble next to the stone to push it left.
//   [Time critical section]
// * Put another large bubble in the same space, and pop a bubble in the pit to push the first bubble left.
// * Quickly run to the teleporter. Take the right teleporter. 
// * Stand on the receptacle. Face up, Medium bubble.
// * Run to the stairs and wait for the stone to get pushed onto the receptacle.

// Stage 85 - 231696
// * Teleport and back, then step down. Magic the flames, run through, and take the next teleporter.
// * Push the green block left and head down onto the next teleporter.
// * Push the green block all the way down and take the last teleporter back to the upper left.
// * Put a large bubble to the left of the stone. Take the teleporter. Step right to push the green block,
//   then teleport back. Step down.
// * Just before the bubble pops, use Magic to put out the flame, then step on the teleporter.
// * After the bubble pops, step back and push the stone down three times, right and down onto the arrow.
// * Take the teleporter and run around the snake. Use a bubble to trap it on the right. Place a Small 
//   bubble in the alcove and run around the stone and Magic it down.
// * Stand above the stone and Popped bubble the stone down (before the first bubble pops).
// * Small bubble, Magic to push it down again.
// * Take the teleporter and run around the snake and stone. Push it right, up, and right onto the arrow.
// * Magic. Popped bubble.
// * Take the teleporter. Take the next teleporter and come back so you can get under the stone.
// * Push it up onto the arrow and magic it onto the receptacle.
// * Go through the left arrow and take the middle teleporter. Then head to the stairs.

// Stage 86 - 628976
// * Stand to the right of the teleporter, then step on it so you're facing left at a flame.
// * Magic it, move to the next flame and magic it too. Run around to the snakes.
// * When the right snake starts going up, step left, up two, left, and up to the teleporter.
// * Stand on the left arrow (the one pointing up) and use a Popped bubble to move the stone right.
// * Stand under the right arrow (the one pointing down) and Popped bubble. Small bubble, Magic.
// * Take the left teleporter (watch the middle teleporter so you don't get snake'd) and return.
// * Push the stone up one onto the arrow tile.
// * Step down onto the other arrow tile. Face up and make a Large bubble.
// * Quickly take the teleporter, run across the stairs and create a Large bubble above the stone.
//   Magic it right.
// * Take the teleporter back around and stand on the middle arrow (by the two crumbling tiles).
// * Popped bubble to move the stone left. Teleport back to the stairs.
// * When the snake moves onto the teleporter, run around the stone and push it left once.
// * When the snake moves above the arrow tile, step up and push the stone down to complete the level.

// Stage 87 - 224331
// * Push the stone right as you work down to the teleporter.
// * When the snake is on the right, push the upper-left green block down.
// * When the snake reaches the leftmost spot, go around the wall and push the left of the pair of
//   green blocks down two.
// * Go around it and push it up one. Then push the right green block up one.
// * Step across the crumbling tile and push the upper green block left, then the lower green block 
//   down two.
// * Go up, take the teleporter, and stand left of the stone. Magic, Popped bubble.
// * Take the teleporter again and pop a bubble to push the stone down.
// * When the snake crosses the arrow, push the stone the rest of the way down and then right onto the pit.
// * Magic. Popped bubble. Go around and push the stone down and right onto the next pit. Magic it across.
// * Take the final teleporter. Push the green block left.
// * Worm around and push the stone onto the receptacle and leave.

// Stage 88 - 908356
// * Push the stone right (above the teleporter).
// * Pop a bubble on the teleporter to push the stone up. Go stand below the left pit.
//   [Time critical section]
// * Put a large bubble in the left pit. Magic it up when the octopus goes all the way left.
// * Run back to the stone and Magic it up. Large bubble. Left twice, Right. Medium bubble.
//   ^ This must be done as quickly as possible, or the medium bubble will pop when the octopus is in the way
// * Step on the teleporter and go right onto the crumbling tile. The stone should still be on the 
//   teleporter.
// * Step right and push the green block down.
//   The first bubble should push the stone right. When it does, drop a large bubble in front of the turret.
//   The third bubble should push the second up, which will push the stone right again (so it's above you).
// * When the fourth bubble pops, push the stone up onto the anti-magic tile.
// * Right, Up, Push stone left. Right, push green block all the way up.
// * Step on the teleporter and run up through the turret before it pops back up.
//   [End time-critical section]
// * Step onto the right arrow tile (pointing up), then face left. As the snake passes in front of the 
//   green thing, push the stone left to the next anti-magic tile. Repeat for all three green things.
// * As the snake starts going right, go up and push the stone down to the receptacle, then run to the exit.

achievement("Snakes and Teleporters", "Complete stage 88", 5, type="progression",
    trigger = complete_stage(88)
)

achievement("Back and Forth to Change Directions", 
            "Complete stages 81-88 without continuing", 10,
    trigger = complete_stage_range_without_continuing(81, 88)
)

// -- [Flame Cave] --
// Stage 89 - 617544
// * Go around to the left side (one row above the stone).
// * Large bubble, Magic, Popped bubble.
// * Go down and around and push the second green block up twice. Magic the stone left.
// * Stand below the stone and Large Bubble, Magic to push the stone up.
// * Right, Up, Medium Bubble, Magic, Popped bubble. Large bubble, Magic.
// * Go to the left side (below the stone). Use a Popped bubble to push the stone up.
// * Use another Popped bubble to push the stone next to the mine (not onto the path).
// * Put a small bubble above the green tile, then come back and use a Popped bubble to push the stone
//   onto the path. Push it right onto the green tile.
// * Step onto the green tile, push the stone down. Magic it down another space.
//   [Time-critical section]
// * Place a small bubble above the stone, then walk over the crumbling tiles and push the right green
//   block down two and left.
// * Put a small bubble to the right of the stone, then push the upper green block left twice.
// * When the first bubble pops, push the stone right. The second bubble will push it down, then you can
//   push it onto the receptacle and leave.

// Stage 90 - 394600
// * Walk around to the left side of the lava and face the stone.
// * Large bubble, Magic. Large bubble, Magic, Popped bubble.
// * Medium bubble, Magic, Popped bubble, Large bubble, Magic.
// * Small bubble, Magic, Popped bubble, Large bubble, Magic, (wait), Large bubble, Magic, Popped bubble.
// * Go down to the other lava, facing the turret.
//   [Time-critical section]
// * Large bubble, Magic. Right, Down. Small bubble, Magic.
// * Left, Down. Large bubble. Right, Down. Popped bubble.
// * Don't wait for anything to pop. Run around to the stairs and push the stone down so there's still one
//   collapsible tile south of it (in line with the lava row).
// * Face right. Large bubble. Down. Face right. Large bubble.
// * When the stone gets pushed left, push it so it's above the receptacle.
// * Face up. Large bubble. Right, Up. Popped bubble. Run across the turret and around to the stairs.

// Stage 91 - 916762
// * Run down past the snakes and the flowers.
// * Put a large bubble in the lower left alcove. Run up and around and push the stone down near the bubble.
// * When it pops, push it right once more.
//   [Time-critical section]
// * Put a large bubble in the upper alcove. Down twice, Up. Large bubble.
// * Go around and push the stone right one. Left twice, Right. Small bubble. Run to the exit.

// Stage 92 - 118547
// * Go left across the crumbling tile and around above the stone. Popped bubble to push it down.
// * Go back down and right to the other crumbling tile. Face left. 
// * Magic. Popped bubble. Large bubble, Magic.
// * Move to the next path and face the stone. Magic. Popped bubble. Push the stone up.
// * On the lower path one space right of the stone: Face up. Large bubble, Magic. (wait)
// * Cross to the upper part of the level using the left inner collapsible tile.
// * Push the upper left green block left, then the upper middle green block down twice.
// * Go back to the lower left (using the other collapsing tile).
// * Pop a bubble below the stone.
// * Push the stone up one (so you're standing on the collapsing tile), then magic it up another space.
// * Face left. Large bubble. Up, Left. Large bubble.
// * When the stone gets pushed into the lava, go up and push the green block up.
// * Go around and put a Large bubble to the right of the stone, then Magic it down.
//   Quickly run around and Magic the stone right.
// * When the bubble pops, Large bubble, Magic. Then run back around to the middle.
// * Small bubble below the stone. Run around so you'll be left of the stone when the bubble pops.
// * Push the stone right onto the lava.
// * Put a Small bubble in the lava above the green tile (below you). Run back to the left side of 
//   the stone. Magic it right. Popped bubble. Then push it above the first bubble.
// * When it pops, Magic the stone up, then Popped bubble it onto the receptacle and leave.

achievement("Burning Bridges", "Complete stage 92", 5, type="progression",
    trigger = complete_stage(92)
)

achievement("Timing is Everything", 
            "Complete stages 89-92 without continuing", 10,
    trigger = complete_stage_range_without_continuing(89, 92)
)

// -- [Final Exam] --
// Stage 93 - 195320
// * Right. Down. Push the stone left twice. Magic it.
// * When the octopus comes up and starts left. Go up. When it starts up, go right and down across the ?.
// * Wait for it to start going up and down in the rightmost ice column.
//   [Time critical section]
// * Left. Up. When the octopus starts going up: Large bubble. Magic it onto the ice.
// * Go left and across the second question mark. Step left and put a bubble on the ice.
// * Step left (pushing the bubble), then go up, right and down below the stone.
//   - The octopus should start pushing the bubble as you're going up the ice slide.
// * After the octopus pushes the bubble into the water, it'll push the stone above you.
//   [End time critical section]
// * Push the stone up three spaces and left one.
// * Go down and left and face up. 
// * Large bubble onto the water. Magic. Popped bubble. Push the stone onto the ice.
// * After the bubble pops, step left and Magic the stone down, then Popped bubble it down again.
// * Go around and push the stone down the ice.
// * Go back to the upper left ice. Face down. Large bubble, Magic, Popped bubble. Go around and push
//   it down the ice. Push it left. Right, Up, Left, Down so it pushes the stone right when it pops.
// * Right. Down (pushing the stone onto the water), then Magic it when the octopus is on its left. 
// * When the octopus moves left again, create a Large bubble and Magic it when the octopus is fully left.
// * Stand between the two anti-magic tiles. Large bubble, Magic, Popped bubble. Small bubble, Magic.
// * When the first bubble is above the stairs: Large bubble, push Right. Down. Popped bubble.
// * When the octopus starts moving left: Create another Large bubble on the water space. Run up/left 
//   and create a Medium bubble above the octopus. Magic it down when the octopus is fully left.
// * Stand between the two anti-magic tiles. Large bubble, Magic, Popped bubble. Small bubble, Magic.
// * When the first bubble is above the stairs, Large bubble, push Right. Down. Right onto the stairs.

achievement("Final Exam I", "Complete stage 93", 5, type="progression",
    trigger = complete_stage(93)
)

// Stage 94 - 961645
// * Push the left green block left.
// * When the snake starts moving down, follow it and jump on the teleporter.
// * When that first snake starts going up, step off and onto the teleporter again and head down and left.
// * Go past the stone and step on the four ? tiles, revealing ice underneath.
//   [Time critical section]
// * Stand under the stone, facing left. Large bubble. 
// * Slide up the newly revealed ice, then back down. Large bubble.
// * Slide back up and take the teleporter. Off and back into the teleporter.
// * Large bubble. Push it into the alcove, then back into the teleporter.
// * Push the stone down. When the first bubble pops, push it right over the second bubble.
// * When the second bubble pops, push it up next to the third bubble.
//   [End time critical section]
// * Push the stone left, getting teleported in the process.
// * Go around to the snakes on the left side. When the leftmost snake is going up, take the leftmost
//   teleporter and go to the stairs to complete the level.

achievement("Final Exam II", "Complete stage 94", 5, type="progression",
    trigger = complete_stage(94)
)

// Stage 95 - 330083
// * Step left into the corner. When the octopus starts moving up, move right and wait for it to start
//   chasing you again. Continue to lure it over to the ice field. Sneak around it and go back to the
//   left side of the level.
// * Stand on the left side of the stone facing up. Small bubble. Push the stone left.
// * When the bubble pops, push the stone down, right, and down onto the water next to the ?.
// * Magic it across, then cross the ?. Push it right into the water. Magic. Popped bubble.
// * Working across the path below the stone, use Popped bubbles to move it above the teleporter.
// * Take the teleporter and return, then face Up. Magic. Popped bubble. Large bubble, Magic.
// * Small bubble, Magic, Popped bubble.
// * Large bubble, Magic, Popped bubble, Large bubble, Magic.
// * Large bubble, Magic, Popped bubble, Large bubble, Magic, (wait), Small bubble, Magic, Popped Bubble.
// * Go through the teleporter. Go up the left side of the ice and around to the water.
// * Pop a bubble in the water to drop the turret and run to the stairs.

achievement("Final Exam III", "Complete stage 95", 5, type="progression",
    trigger = complete_stage(95)
)

// Stage 96 - 673597
// * Go down and push the top and bottom green blocks on the left to the left. Then the middle one down.
// * Pop the nearest collapsible tile (bottom of the L), then push the upper right green block right.
// * Go up near the two ? tiles. Drop a bubble and the green thing will charge.
// * While it's creeping back, step on the two upper ?s to collapse them.
// * Step onto the right ? tile and face up.
//   [Time critical section]
// * Small bubble. Left, Up. Small bubble. These will keep the green thing distracted.
// * Run across the three connected ?s, using two popped bubbles to push the stone left twice.
// * Magic, Popped bubble the stone up twice. Go to the side and Pop another bubble to push it up again.
// * Magic, Popped bubble it up twice more.
// * When the green thing charges at the remaining bubble on the far right, sneak past it on the left.
//   [End time critical section]
// * Magic the stone right, then cross the upper left ? tile.
// * Use popped bubbles to move the stone right 6 times (one past the ice square).
// * Face it. Magic. Popped bubble. Large bubble, Magic. Small bubble, Magic, Popped bubble.
// * Medium bubble, Magic, Popped bubble, Large bubble, Magic.
// * Large bubble, Magic, Popped bubble, Large bubble, Magic, when it starts flashing: Small bubble, 
//   Magic, Popped bubble.
// * Large bubble, Magic, Popped bubble, Large bubble, Magic. Run around to the right side and put a Large
//   bubble in the singular middle lava space. Magic it in front of the other bubbles.
//   [Time critical section]
// * After the stone lands in the lava, create a Large bubble and Magic it above the stone.
// * Push the rightmost green block down and run left to the green block.
// * Face up and put a small bubble in the lava. Go down and left and put a large bubble on the stairs.
// * Run back to the lower right. When the first bubble pops, push the stone left to the next bubble.
// * When it pops, push the stone left to the stairs. The final bubble will push it onto the receptacle,
//   and then you can leave.

achievement("Final Exam IV", "Complete stage 96", 5, type="progression",
    trigger = complete_stage(96)
)

achievement("Honor Roll", 
            "Complete stages 93-96 without continuing", 10, // 235
    trigger = complete_stage_range_without_continuing(93, 96)
)

// Stage 97 - 219682
// * Push the left green block up (dodging the flower shot) and go right and push the rightmost green block
//   down into the alcove.
// * Run past the flowers to the right side of the stone. Magic the stone left.
// * Stand below the stone. Magic. Popped bubble. Large bubble, Magic to move the stone past the flower.
// * Run back to the middle section and up to the anti-magic tiles. Left, Up, Left, Down to face the fire.
//   [Time critical section]
// * Magic through the fires. Quickly pop a bubble below the stone to move it up one. Then pop another
//   bubble to move it up again.
// * Push it up to the anti-magic rune. Face left, Large bubble. Down, Left. Popped bubble.
// * Down, Up (so you're standing between the second and third flames, facing up). Wait for the flames to
//   reignite.
//   [End time critical section, start another time critical section]
// * Magic the second flame, then the first. Popped bubble to move the stone right.
// * Left, Large bubble. Down, Left, Popped bubble. Up, Small bubble.
// * Run around so you're standing above the stone.
//   [End time critical section]
// * When the bubble pops, push the stone between the column and the second green block, then go stand 
//   above the third green block and face up.
// * Small bubble, Magic, Popped bubble. Small bubble, Magic.
// * Left, Up. When the first bubble pops, step around the green block and push the stone into the lava.
// * Wait for the other bubble to pop, then Pop another bubble to push the stone down again.
// * Go around the green block and push it up. Stand above the stone and magic it down.
// * Run around to the right side. Put a small bubble below the anti-magic tile and pop a bubble below that
//   to move it onto the anti-magic tile. Pop a bubble below it to move it up into the lava.
// * Run around and push/Magic the stone below the bubble. When it pops, the stone will get pushed down.
// * Go back around and stand on the anti-magic tile. Face down. Magic the stone down.
//   [Time critical section]
// * Place a large bubble between the lower flower and the receptacle.
// * Pop a bubble above the stone to move it down.
// * Magic it left. Popped bubble. Small bubble, Magic.
// * Go down the to bottom edge of the level and wait for the bubble to pop.
//   [End time critical section, start another time critical section]
// * Face up one column right of the stone. Small Bubble, Magic, Popped bubble.
// * Left, Up. When the first bubble becomes medium: Small Bubble, Magic, Medium bubble.
// * Run across the receptacle and turn around. Large bubble.
// * Right, Up. Small bubble.
// * Step onto the stairs and wait.

achievement("Final Exam V", "Complete stage 97", 5, type="progression",
    trigger = complete_stage(97)
)

// Stage 98 - 500292
//   [Time critical section - feel free to Pause spam to ensure the timing works]
// * Face up. Medium bubble, Magic (1). Right, Right, Up.
// * As soon as the octopus pushes it into the lava: Medium bubble, Magic (2). Down. Medium bubble (3).
// * Right, Up. Large bubble, Magic (4). Medium bubble.
//   The fourth bubble will pop and push the second bubble left. 
// * Medium bubble, Magic (5).
//   The first bubble will pop and push second bubble up.
// * Right, Left. Medium bubble, Magic (6).
//   The third bubble will pop and push the sixth bubble up.
// * Small bubble, Magic (7).
//   It'll pop, pushing the sixth bubble up again, then the fifth bubble will push it left, and it'll push
//   the first bubble up, which will push the stone up.
//   [End time critical section]
// * Run through all the collapsing tiles so you're below the stone. Down, Up to face the stone.
// * Step onto the first collapsing tile, pushing the stone up. Magic. Popped bubble.
// * Go around to the top row and push the stone between the stairs and receptacle.
// * Step on the upper collapsing tile and face left.
// * Small bubble, Magic, Popped bubble. Wait for it to pop, then complete the level.

achievement("Final Exam VI", "Complete stage 98", 5, type="progression",
    trigger = complete_stage(98)
)

// Stage 99 - 328309
// * Up, Right three times.
//   [Time critical section]
// * Large bubble, Magic. Medium bubble.
// * Down, Right, Down three times. Right twice. Large bubble.
// * Go up all the way, right all the way, down, left, up to the arrow tile. Push the stone left.
// * When the first bubble pops, left, then push the stone down.
//   [End time critical section]
// * When the bubble pops, use another popped bubble to push the stone left again.
// * Up, left twice, down, pushing the stone across the collapsing tiles and into the water.
// * Magic. Popped bubble. When the octopus starts moving left: Small bubble, magic.
//   It should pop and push the stone in front of the octopus while the octopus is turning around on the
//   left side. The octopus will push the stone right into the water.
// * Right, Down. 
// * Just before the octopus passes into the square below you going left: Large bubble, Magic, Popped bubble.
//   The octopus will push the bubble next to the stone. It'll pop and push the stone onto the receptacle.
// * Turn right. Bubble. Push it right and get on the teleporter. Run to the exit.

achievement("Final Exam VII", "Complete stage 99", 5, type="progression",
    trigger = complete_stage(99)
)

// Stage 100 - 992221
// * Left, Up. Magic.
//   [Time critical section]
// * Medium bubble. Right, Up. Popped bubble.
// * Up, Left, Up, Down. Popped bubble. Right, Down.
//   The first bubble will push the stone up.
// * Large bubble. Left. Medium bubble. Up, Left, Down, Up. Small bubble, Up. Right, Down.
//   Create a Large bubble and push it down before the turret reappears. (You need to be on the turret now).
// * When the left bubble pushes the stone up, step left, then push the stone up so you're on the safe space
//   [End time critical section]
// * Magic. Popped bubble. Right, Up. Small bubble, Magic. Popped bubble.
// * Left, Down, Up. Small bubble, Magic, Popped bubble.
// * Medium bubble, Magic, Popped bubble. Right, Up. Small bubble, Magic, Popped bubble.
// * When the bubbles pop: Left, Up, Left, Down. Popped bubble.
// * Right, Down. When the lizard passes the stone moving down:
//   Up, Left, Down. Medium bubble. Up, Right, Down. Small bubble. Right, Down.
//   When the bubbles pop, the lizard should be trapped by the stone (easier if he's trapped below).
// * Down, Up. Bubble, Up, Left (facing stone). Medium bubble, Magic. Popped bubble. Small bubble, Magic.
// * Go up and push the green block left once. Face down.
// * As the lizard passes the row with the other green thing (going down):
//   Medium bubble. Left, Down. Large bubble.
// * After the bubble pops, when the lizard is going down: Up, Left, Down (pushing the green block 
//   and dodging the flower).
// * Continue pushing the green block down twice to the space left of the other green thing, making a
//   quick step left and up after doing so to dodge the flower. The lizard must be fully out of the
//   space you're pushing the block into or you can't push the block and you might step off the
//   collapsing tile prematurely.
// * Go up to the collapsing tile and face left. Popped bubble.
// * Down, Left. Popped bubble.
// * Down twice (dodging the flower). Push the stone left and quickly step right again to dodge the flower.
// * Quickly: Up, Left, Small bubble, Magic, Down. If the flower pops the bubble, repeat.
// * Quickly: Left, Small bubble, Right.
// * Quickly: Left, Medium bubble. Right, Up, Left, Small bubble. Magic. Down.
// * Quickly: Left, Large bubble. Right, Up, Left, Small bubble. Magic. Down. When the second bubble pops,
//   quickly: Left, Small bubble, Right. The stone should end up in the water.
// * Left twice, Down. 
//   [Time critical section]
// * Large bubble. Down, Left (facing opposite ?). Large bubble. Up, Left, Popped bubble.
// * Down, Left, Popped bubble. Down, reinflate bubble to large. Right, Down, Right (pushing green block)
// * Down twice, Left, Large bubble. Up all the way, Left, Down (facing stone).
// * When stone gets pushed right: Popped bubble. Right, Down. Remaining bubble will push stone right again.
//   [End time critical section]
// * Down, Right. Magic. Popped bubble. Small bubble, Magic.
// * Down, Right. Medium bubble, Magic, Popped bubble. Small bubble, Magic.
// * Up, Right. Medium bubble, Magic, Popped bubble. Small bubble, Magic.
// * Large bubble, Magic, Popped bubble. Small bubble, Magic. 
// * Down, Right. Medium bubble, Magic, Popped bubble. Small bubble, Magic.
//   The stone will be pushed onto the receptacle and you can leave.

achievement("Final Exam VIII", "Complete stage 100", 10, type="win_condition",
    trigger = complete_stage(100)
)

achievement("Top of the Class", 
            "Complete stages 97-100 without continuing", 25,
    trigger = complete_stage_range_without_continuing(97, 100)
)


