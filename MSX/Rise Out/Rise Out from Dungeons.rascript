// Rise Out from Dungeons
// #ID=34513
// MD5=53025aa48a41a6a1b7fab88b93074d6f

// Ctrl+P in level brings up password input
// Ctrl+Shift+3: instantly complete level
// Ctrl+Shift+2: increase lives
// Ctrl+R: restart level

// NOTE: blueMSX does not expose memory correctly in MSX2 mode. Addresses are offset by -C000.
//       To address this, we look at address $FC48, which should be 0x8000. If it's 0xFFFF, we're
//       in the bad state and have to apply the offset. Luckily, we can do that with a simple
//       multiplication against the least significant bit of $FC48. Because the "auto" setting
//       loads the game in msx2 mode, all of the code notes are associated to the msx2 addresses.
function is_real_mode() => ~bit0(0xFC48)
function msx_address(msx2_address) => is_real_mode() * 0xC000 + msx2_address

function player_x() => byte(msx_address(0x2c00))
function player_y() => byte(msx_address(0x2c01))
function player_sprite() => byte(msx_address(0x2c0b))

// score is decomposed from 0x2c53 to 0x2c5f
function score() => bcd(byte(msx_address(0x2c04))) * 100 + bcd(byte(msx_address(0x2c05))) * 10000

function remaining_lives() => byte(msx_address(0x2c06))
function key_found() => byte(msx_address(0x2c11)) == 0xff

function stage() => byte(msx_address(0x2c66)) // also 0x2c62, 0x2c64, 0x2c65, and 0x2c66
function coins_remaining() => byte(msx_address(0x2c6e))

function player_count() => byte(msx_address(0x2c86)) // 0=1, 1=2, 2=3, 3=4
function speed() => byte(msx_address(0x2c87))
speed_low = 1
speed_normal = 2
speed_high = 3

rich_presence_conditional_display(stage() == 0, "Titles")
rich_presence_conditional_display(stage() == 0xFF, "Titles")
rich_presence_display("{0} | Level {1} | {2} {3}",
    rich_presence_value("Score", score(), format="SCORE"),
    rich_presence_value("Level", stage()),
    rich_presence_value("Lives", bcd(remaining_lives())),
    rich_presence_lookup("Men", remaining_lives(), {1: "man"}, fallback="men")
)

function complete_level(level, exit_x) => stage() == level &&
                                          //player_x() == exit_x &&
                                          prev(player_y()) == 2 && // Ctrl+Shift+3 warps player to Y=1
                                          player_y() == 1
                                          //byte(msx_address(0x2dc3)) == 3 // completion flag

// video solution: https://www.youtube.com/watch?v=xTf_QRWD4qc

// LEVEL 1: UNDERGROUND [UNDR]
// * Climb the first ladder, then slightly up the second ladder so you're even with the rope.
// * Cross the rope and climb the next ladder. Cross another rope and start to climb the leftmost ladder.
// * Jump off the ladder and fall through the rope.
// * Grab the coin, then drop and grab the other coin. Drop back to the start.
// * Climb the first ladder, then go all the way up the second ladder.
// * Grab the coin on the right, then go left to the next ladder.
// * Take it up one floor and go right. After a small fall, grab the coin.
//   You'll see a key appear and start flashing. You have to find the key to open the door, but you can't take the
//   key with you.
// * Drop again, and grab the coin on the left. Go right and fall.
// * Fall right again three times to land on the bottomrightmost coin.
// * Take the ladders up to the other right coin.
// * Continue climbing up the ladders until you're even with the rope. Cross it to the left.
// * Grab the last coin, then run back to the right and climb the ladder to the door.
// * Go through the door and up the final ladder.

achievement("Underground", "Complete the first level", 2, type="progression",
    trigger = complete_level(1, 0x1c)
)

// LEVEL 2: SNAKE [SNAK]
// Now we get to deal with the red guy.
// * Go up the first ladder and grab the coin.
// * Go up the next ladder and drop off the right side of the platform to land on the other lower coin.
//   - The red guy will fall in the water around now, causing him to respawn at the top. When you move
//     right to the long ladder, he'll also move right and fall towards you. You have to grab the coin
//     and climb the next ladder before he can touch you.
// * Climb up the long ladder and go left for the next coin.
// * Run right and drop twice to get to the bottom right, then climb the ladder and grab the next coin.
// * Climb another ladder and cross the rope.
// * Drop down, grab the coin, drop down again, then climb the next ladder and get another coin.
//   - Wait here for the red guy to respawn again. Fall off the right edge of the platform and wait for
//     him to be right over you. Then step left and fall off the platform so he'll fall off the upper
//     platform. Step to the ladder to get him to fall down another level, then climb up the left ladder.
// * Continue to the exit, grabbing the last coin on the way.

achievement("Snake", "Complete the second level", 3, type="progression",
    trigger = complete_level(2, 0x1a)
)

// LEVEL 3: BEGIN [BIGI]
// * Wait for the red guy to start climbing down the ladder, then climb up the first two ladders.
//   - The red guy should fall into the small pool of water.
// * When he does, quickly climb up the third ladder and step out onto the rope on the left.
// * Drop left off the rope for a coin, then right three times for two more coins.
// * Wait for the red guy to respawn, then go right onto the ropes so you're directly under the
//   ladder at the top. When the red guy comes down the ladder, step across the rope for a coin.
//   The red guy will fall into a corner where he'll be stuck for a little while.
// * Go back to the ladder. Go up it and the next ladder, then halfway up the third ladder for another coin.
// * Continue up the ladder, then up another ladder. Go right to the next ladder and down for a coin (key).
// * Go back up and continue right for a coin.
//   - The red guy will drop into water at this point.
// * Run all the way left before the red guy respawns, so you fall into a corner near the middle left of the level.
// * When the red guy starts climbing the ladder, quickly drop right twice and climb up the two ladders.
// * Run right until you fall onto a ladder.
//   - The red guy should fall into the water again.
// * Go down and collect the coin, then back up and right into the lower right corner.
//   - The red guy should be stuck in another corner (with a coin).
// [This is tricky]
// * Climb halfway up the ladder so you're two levels below the gap.
// * Face left and shoot out one block. When it starts to reform, shoot out the block next to it.
// * Quickly go up one more level and shoot out the two blocks next to the rope.
// * Go up one more level and shoot out the two blocks under the red guy.
// * Wait for all the blocks to reform.
//   - The red guy should be encased in the wall (but he'll step out when he goes left).
// * Go to the top level and shoot out the two blocks between the ladder and rope.
// * Go down two levels and wait for the top blocks to start reforming. Then shoot out the two blocks under the coin.
// * Go back to the top level and shoot out the block between the two ropes.
// * When the first two blocks reform, run across and fall between the ropes. Fall again to get the coin, then
//   run back to the ladder before the blocks reform.
//   - The red guy will respawn and get trapped is his corner again.
// [End of tricky section]
// * Climb up four ladders until you're in a small alcove.
// * Face right and shoot. Get the coin and come back out.
// * Climb down the ladder and shoot left. Run through the new hole and up the next three ladders
//   to the door. Go through and leave the level.

achievement("Begin", "Complete the third level", 5, type="progression",
    trigger = complete_level(3, 0x1c)
)

achievement("Laser Mining", "Complete the third level after collecting all boxes", 5,
    trigger = complete_level(3, 0x1c) && coins_remaining() == 0
)

// LEVEL 4: GRASP [GRAS]
// * Wait for the red guy to start falling, then just start climbing across the ladder/ropes.
//   - Note that you can't fall onto a rope, so you do have to climb down the ladders instead of
//     jumping off them.
// * When you reach the upper right corner, walk out off the end of the rope and fall down to the ladder.
// * Jump down to the right again, and climb up the zig zag to the coin at the end.
// * Cross the rope to the right, climb the rope, and jump off to the right to collect three more coins.
// * Go back to the top right and jump off the left side, then climb up the zig zag in the middle.
// * Jump off to the left, duck down for the coin.
// * Climb up the ladders so you're over the block for the lower row with five coins. Drop down.
// * Run to the right and climb the ladders back into the middle.
// * Repeat the ladder climb so you can fall on the block for the row with six coins.
//   - You need to have the red guy on the lower ropes here, or he'll get in the way for the escape.
// * Collect the coins, then drop off the left side for another coin.
// * Climb up the ladder, grabbing the last coin, then go through the door and up the escape ladder.

achievement("Grasp", "Complete the fourth level", 4, type="progression",
    trigger = complete_level(4, 0x04)
)

// LEVEL 5: LADDER [LADR]
// * Climb up the ladder to the first row of coins.
// * Run through them, then climb up to the next row of coins.
// * Run through them too, then step back a bit and climb up to the next row of coins.
// * Wait at the intersection until the two red guys are right above you and start climbing into
//   your row. Then run through the row and continue climbing and running for the rest of the level.

achievement("Ladder", "Complete the fifth level", 2, type="progression",
    trigger = complete_level(5, 0x1d)
)

// LEVEL 6: TWIN TOWERS [2TOW]
// * Run through the door BEFORE the red guys start moving.
// * Wait there until they're both above the first tower.
// * Step left and they'll start to fall. Then run to the ladder.
// * Climb up to just under the top and shoot out a couple blocks on the left tower.
// * Cross the rope and drop onto the platform with the coins.
// * Collect the coins, then shoot out the block on either side.
// * Fall down, turn around and shoot out another block.
// * Repeat this all the way down the tower.
// * At the bottom floor, break the leftmost brick and stand where it was.
// * When the red guys are below you, break the right block, run to the ladder and climb it.
// * Just before the top, turn right and break a block on the right tower.
// * Stay at the top as the red guys climb. Just before the get to the top, run right and they'll fall.
// * Drop into the broken block and do the alternating row thing again.
// * At the bottom, just break the right block, drop, run through the door and up the ladder.

achievement("Twin Towers", "Complete the sixth level", 2, type="progression",
    trigger = complete_level(6, 0x1e)
)

// LEVEL 7: ASCII [ASCI]
// * Climb the alternating ladders and grab as many coins as you can before the right red guy gets
//   too close. Then dive to the floor and run under him.
// * Climb up the alternating ladders so you can get onto the long ladder on the right.
// * Climb up to the top row of coins, then wait for the two red guys to be right below you.
// * Step left once, then back to the right. Repeat until the red guys start climbing the ladder.
// * Just before they reach you, run across to the left. The red guys will fall.
// * Try to grab the first couple coins nearest you before the red guys reach you.
// * Climb up the left ladder and trick the red guys into following you.
// * When they reach the top, run to the other side and drop down that line of coins.
// * Drop to the floor and wait for the red guys to be above you.
// * Run past them, then up the alternating ladders and grab as many coins as you can before
//   escaping up one of the long ladders.
// * Keep repeating this, grabbing the remaining coins in the bottom row as you are able.
// * Climb the left ladder, go through the door, and exit.

achievement("ASCII", "Complete the seventh level", 3, type="progression",
    trigger = complete_level(7, 0x10)
)

// LEVEL 8: LOOPS [LOOP]
// * Climb up the left ladder and run across the block to fall down through two ropes.
// * As soon as the first red guy starts to fall, run across. Both should get trapped by the ladder.
// * Climb up the other ladder and run across the rope.
// * Fall down, climb the ladder, and grab a coin.
// [Tricky part]
// * There's three breakable blocks on the left side of the ladder.
// * Climb down the ladder and face left into the middle breakable block.
// * Shoot it out and the block that is on the right side of the upperleftmost coin.
// * Step down, and shoot out the other breakable block and the block above the other coin on the
//   left side.
// * Quickly step left and fall though two ropes.
// * Run left and fall again. Climb the long ladder.
// * Shoot out the block on the left side of the upperleftmost coin.
// * Run through it and fall down onto the other coin.
// [End tricky part]
// * Step left to fall onto the ladder, then walk right and fall off the rope.
// * Stand next to the three stacked ropes. Wait for both red guys to fall through them.
// * As the second red guy starts to fall underneath you (into the water), run right.
//   Quickly climb the short ladder and step left to fall through yourself.
//   Stand under the short ladder and wait for the two red guys to get stuck there.
// * Run right across the rope and fall.
// * Shoot the rock and climb up the next ladder.
// * Three levels from the top, face left and shoot out the blocks under the coin.
// * Shoot out the three blocks above the coin. Run left, fall, and collect the coin.
// * Step left and land safely on the solid wall.
// * Face right, shoot out the block above the coin, drop, blast the wall, and climb up the ladder
//   to shoot out the two blocks so you can drop onto the next coin.
// * Climb up the ladder again so you're level with the coin directly under the water.
// * Shoot right through two blocks and go grab it.
// * Go back to the ladder and climb up two more levels. Blast the right wall and fall through the rope.
// * Shoot a block on the right, fall, and another block on the right to fall and get the coin.
// * Face left and blast through the wall so you can fall safely on the left side of the water.
// * Climb up a couple levels and cross the rope.
// * Climb up to the next long rope and cross it.
// * Climb up the next ladder so you're level with the last coin.
// * Shoot through the wall, then run over and grab it.
// * Run back to the ladder and down one level.
// * Shoot through three blocks and run across so you fall level with the door.
// * Go through the door and exit.

achievement("Loops", "Complete the eighth level", 5, type="progression",
    trigger = complete_level(8, 0x1c)
)

// LEVEL 9: ROOMS [ROOM]
// * Climb up into the second chamber and shoot out the right wall.
// * Use the ladder to get the coin (making sure the red guy above you doesn't get on his ladder),
//   then go back to the left. Climb up and open the first door.
// * Trick the red guy into coming down the ladder and following you to the lower left chambers.
//   Let him follow you all the way to the bottom floor, but climb the right ladder and step left
//   before he can start climbing.
// * Shoot the wall, and climb up. Head right when the red guy is at the top of the first chamber
//   so it gets stuck in the upper right corner (above the rope in the lowerleft chamber).
// * Climb the nearby ladder, open the door on the left, and grab the two coins (don't let the red guy out).
// * Open the next door. When the red guy falls into the water, run across and open the next door.
// * Run back to the ladder and climb down it, then fall to the right.
// * Shoot the right wall, run through the coin, and climb the ladder for another coin.
// * Climb down the ladder and blast through the wall until you fall onto another coin.
// * Climb down the ladder and run across the rope for the next coin.
// * Assuming you trapped the red guy correctly, you can now drop onto the lower floor and 
//   shoot through the blocks until you reach the two ladders.
// * Climb up the left one, shoot the block, and down the next one.
// * Go through the door, climb the ladder and grab the coin.
// * Climb a bit down the ladder and step left.
// * Blast the two blocks next to the coin, then step down and blast another block to get to the
//   ladder and the block below the coin. Climb the ladder, grab the coin and step onto the left ladder.
// * Run left, blasting blocks as you go.
// * Stop under the short upper ladder so the red guy comes down it.
// * Step right, trapping the red guy in the pit.
// * Keep running through the blocks, then up the longer ladder. Shoot the left wall, then go up the
//   next two ladders so you're back on the top half of the level.
// * Climb up the first long, grabbing the coin on the way up.
// * Shoot out blocks all the way to the leftmost ladder.
// * Climb down and run left, shooting through the wall, for four coins.
// * Shoot the right wall for three more coins, then climb the ladder.
// * Shoot right to the next ladder and go down it.
// * Shoot right through the wall for three more coins, then come back to the ladder.
// * Shoot the block under the coin, then climb partly up the ladder and shoot the block between the
//   chambers. Shoot the blocks above the rope so you can fall into the gap between the chambers.
// * Drop right to collect the coin and fall to the middle level.
// * Run right and climb out.

achievement("Rooms", "Complete the ninth level", 5, type="progression",
    trigger = complete_level(9, 0x1d)
)

// LEVEL 10: AMIDA [AMID]
// * Climb the ladder and grab the two coins.
// * Climb back down and move to the third ladder. The red guy should get stuck in the ladder above you.
// * Snake through the next sets of ladders for four more coins along the bottom.
// * Go left, up, left twice, up, left so you're just right of the trapped red guy.
// * Climb up the ladder to free him and then all the way down.
//   Climb up the second ladder, right twice and down. Let the red guy get to the shorter ladder.
// * As you head to the upper left corner of the level, the red guy will get stuck on the short ladder.
// * Go to the upper left corner and drag the second guy all the way back to the loop. 
// * Go down the right side of the loop, so you can run up the left side when the first red guy gets freed.
// * Get back to the upper left corner and run right before the red guys can follow you up.
// * Casually collect the remaining coins and exit the level.

achievement("Amida", "Complete the tenth level", 4, type="progression",
    trigger = complete_level(10, 0x1d)
)

// LEVEL 11: FIFTH TOWER [5TOW]
// * Climb the ladder and cross the rope to the tower, stepping off the right side twice before the red guys
//   can start climbing the ladder.
// * Turn left and blast through to the main part of the building.
// * Step off and fall onto the coin, shoot the left wall and go through it, keeping them in the bottom
//   chamber.
// * Step left twice more. You should be below two sets of coins.
// * Face right and blast into the tower. Fall into the third chamber.
// * Wait for the walls to reform.
// * Get the other coin, then climb the ladder and get another coin. Wait for the red guys to get stuck
//   together again on the bottom level.
// * Grab the other coin, climb up and get another coin. Wait for the red guys again.
// * Grab the other coin and climb up to the top of the tower.
// * Wait for the red guys to be in the second chamber, blast the left wall and go through and fall
//   once. The red guys should be stuck in the first and/or second chamber.
// * Fall again, blast back into the tower and run down to collect the last two coins.
// * Blast through the right wall, go through the door, and exit the level.

achievement("Fifth Tower", "Complete the eleventh level", 5, type="progression",
    trigger = complete_level(11, 0x1c)
)

// LEVEL 12: IN THE LAKE [LAKE]
// * Climb the right ladder and get the first coin.
// * Climb the left ladder, waiting for the red guy to get into the long corridor. Then run to the next
//   ladder and up to the top for two coins.
// * Go across the upper corridor and let the red guy start climbing the ladder. Lead him back into the
//   same corridor, then run around him using the lower corridor. He should be trapped in the little elbow.
// * Climb the long ladder, and he should remain stuck on his ladder.
// * Get the upper coin, waiting for him to get off this ladder and stuck in the upper chamber.
// * Climb down to the bottom, grabbing the three coins along the way.
// * The second red guy has to be led all the way back to the loop. Go in through the upper corridor
//   and get both red guys trapped in the elbow.
// * Then you're clear to collect the remaining coins and exit the level.

achievement("In the Lake", "Complete the twelvth level", 3, type="progression",
    trigger = complete_level(12, 0x1c)
)

// LEVEL 13: GRAVEYARD [GOLG]
// * Climb the ladder and cross the rope for a coin.
// * Blast through the bottom of the tower and climb all the way up the next series of ladders.
// * Blast through the top row of the tower.
// * When the red guys start falling again, run across the rope, drop into the tower and fall all the
//   way to the bottom.
// * Blast through the right wall and climb up the ladders again, stopping just below where the red
//   guys appear.
// * Blast out the two upper blocks of the middle area so the red guys will cross the rope and fall
//   onto the little island.
// * Blast out the the first five blocks of the top of the middle area.
//   NOTE: once you've started shooting left, you can press up to climb and continue shooting left
//   without having to press left again.
// * When the first starts to reform, blast out the last block, then go up a space and blast out the
//   block above it. Climb to the top and blast out the block left of the rope. Run across and drop,
//   then drop right and step left to fall into the middle area.
// * Run right and wait for the blocks to reform.
// * Collect the remaining coins, then blast the right wall and run through it and across the rope.
// * Blast the wall, go through the door and exit the level.

achievement("Graveyard", "Complete the thirteenth level", 4, type="progression",
    trigger = complete_level(13, 0x1e)
)

// LEVEL 14: PYRAMID-2 [PYR2]
// * The first thing to do on this level is trap the two red guys in the top of the pyramid.
// * Blast open the left side of the top of the pyramid and grab the coin.
// * Go left to the long ladder so the red guy will start following you up.
// * Go to the top of the ladder. When he's on the level with the trap, run above the trap.
// * Wait for him to go inside, then for the wall to reform.
// * Lure the right red guy up to the level above the trap in the same manner. He should get stuck
//   just above and right of the first red guy.
// * Go to the left and shoot the square above the first guy. The second will fall in.
// * Now shoot out the two walls to the RIGHT of the second coin. Climb onto the ladder above where
//   the walls were and fall to the lower ladder.
// * Collect the two coins accessible from the right side (one is the key, which is why we did that
//   side first), then fall next to the door.
// * Go back to the left side and shoot out the two blocks to the left of the second coin.
// * Climb onto the ladder above those and fall down.
// * Collect the two coins and go through the left door.
// * Blast one block left of the remaining coin. Climb the ladder above it and step off to the left
//   to fall onto the other block. Run through and collect it.
// * Blast through the right wall and proceed to the exit.

achievement("Pyramid-2", "Complete the fourteenth level", 4, type="progression",
    trigger = complete_level(14, 0x1d)
)

// LEVEL 15: PYRAMID-3 [PYR3]
// * Climb three quarters up the ladder (so you've even with the 2-1-1-2 row). Wait for the red guys to
//   fall off that level, then shoot out the first three blocks. Climb up twice and shoot out two
//   blocks. Climb up twice more and shoot out two more. The red guys should be climbing the ladder now.
// * Run across the rope. The red guys should fall off the ladder and jump into the water.
// * Before they respawn, you need to fall through the two coins. You might land on a third, or a
//   reformed block. Either is okay.
// * Continue dropping and collecting coins. Run left back to the start and climb the ladder again.
// * Shoot out the third and second lines (three of the four single 1 blocks on the 1-1-1-1 row, and three
//   of the four blocks in the 2-2 row).
// * Climb back up the ladder and across the rope. Fall right, then left, collecting three coins.
// * Continue dropping and collecting coins, then go through the door and exit the level.

achievement("Pyramid-3", "Complete the fifteenth level", 4, type="progression",
    trigger = complete_level(15, 0x1d)
)

// LEVEL 16: PERVERSE [OOBA]
// * Climb up the ladders so you're level with the long line of breakable blocks.
// * Shoot out the first block. Climb up and get the coin. This will let the red guy out. 
// * Climb out on the rope so you can lure the red guy to fall through the broken block.
// * Cross the rope. The red guy should get stuck near the door.
// * Go up the ladder and down the other side for a coin.
// * Climb the arch of ladders for two more coins.
// * Climb up the long ladder to the left of the arch.
// * Walk left until the red guy jumps in the water.
// * Run back to the arch. Stand in the second column so the red guy drops to the ledge near the small puddle of water.
// * Step left so it falls down near the L-shaped ladders.
// * Climb back up the long ladder to the left of the arch. Go all the way left and onto the tiny ladder.
// * Face right and shoot out two blocks. Just before they reform, shoot out a third.
// * Run across the reformed blocks and fall onto the coin. Grab the other two coins.
// * Drop down on the left, run right, and climb through the ladders to the arch of ladders.
// * Cross the arch so the red guy falls all the way to the bottom.
// * From the left side of the arch, step right and fall, then left to fall again, then right to land on a ladder.
// * Grab the coin, then climb down a step and shoot out the block. Step right and fall to the next coin.
// [Tricky part]
// * Shoot out all the blocks in the top row.
// * Climb down on the left side and shoot out the first two blocks in the second row.
// * Climb down into the middle of the bottom row and nearly shoot out all the blocks on both sides.
//   The blocks holding back the red guys should each have one piece left.
// * When the rightmost block on the top row has fully reformed, shoot out the last remaining bits of
//   both sides and climb up and right to the top. The red guys should get trapped in the middle of the bottom row.
// [End tricky part]
// * Shoot your way back to the left side. Climb down the ladder, shoot the block to the right, down again, and
//   shoot the block to the left. Grab the coin and get back up before the blocks reform.
// * Shoot across the top row, drop down, and climb up the long ladder.
// * Cross the rope and drop right, back to the L-shaped ladder.
// * Shoot out the two blocks to the left and jump down, shooting while you fall.
//   Repeat this a couple times to break the block above the right ladder. When that happens, climb it.
// * Break the next two blocks and climb down the tiny ladder to the rope. Collect the four coins.
// * Go back to the long ladder on the right. Climb up it, cross the rope, and cross the little rope.
// * Collect the two coins.
// * Shoot out the long wall and fall to the left. Fall right twice to land near the door.
// * Go through, run to the very long ladder, and leave the level.

achievement("Perverse", "Complete the sixteenth level", 10, type="progression",
    trigger = complete_level(16, 0x1d)
)

achievement("Digging While You Drop", "Complete the sixteenth level after collecting all boxes", 5,
    trigger = complete_level(16, 0x1d) && coins_remaining() == 0
)

// LEVEL 17: PYRAMID-1 [PYR1]
// * Climb up the ladder one level. Blast out the first block and do 2/3 of the second block.
// * Go up another level and blast 2/3 of that block.
// * Go up another level and blast 2/3 of that block.
// * Go up two move levels and blast out the block next to the rope.
// * Finish blasting the other three blocks you partially blasted before. 
//   This should trap the red guy in the lower left alcove.
// * Prepare those same blocks again (2/3 block for the three in the column above the red guy).
// * 2/3 blast the block near the lower rope, then free the upper red guy by blasting the block next to him.
// * Finish blasting the other four blocks you partially blasted before and both should be in the alcove.
// * Climb all the way up and go to the right side.
// * Shoot out the blocks just above and below the rope so you can run off the left side, then the right side.
// * Shoot through the wall and grab the first coin.
// * Keep shooting and drop off the left side.
// * Shoot through the wall and grab the second coin.
// * Climb all the way back around to the left side.
// * Shoot out the first block below the lower rope, then 2/3 break the second block.
// [Tricky part - not hard, just timing critical]
// * Shoot out the two blocks above the rope, then finish the right block below the rope.
// * Quickly run all the way back to the right side and go down both ladders (drop through the gap).
// * Shoot through the wall and drop into the space you blasted from the left side.
// [End tricky part]
// * Step right and land on the ladder. Grab the nearby coin and the lower coin.
// * Hanging from the lowest part of the ladder, shoot out the wall, freeing the two red guys.
// * Climb up one level and shoot out the block above the rope.
// * Climb up another level and shoot out the two blocks.
// * Climb up the rest of the way and shoot out the two blocks, then run through and drop down to the rope.
// * Run across and up the ladder.
// * Trap the two red guys in the same alcove they were in earlier using the same strategy as before.
// * Shoot out the two blocks under the lower middle rope, and then a third block on the far side (same row).
// * Run around and shoot out the block above the last block you shot out and fall into the hole.
// * Step onto the ladder and grab the last coin.
// * Climb down two levels and shoot out the block on the right.
// * Go up one level and shoot out two blocks.
// * Climb up to the top of the ladder and shoot out two blocks. Drop right through the other broken blocks
// * Run across the rope to the exit and leave.

achievement("Pyramid-1", "Complete the seventeenth level", 5, type="progression",
    trigger = complete_level(17, 0x1e)
)

// LEVEL 18: PYRAMID-4 [PYR4]
// * The only hard part of this level is getting the two red guys trapped.
// * Climb up the ladders and stand on the space one left of the lowest green door.
// * The two guys should get stuck next to the door.
// * Run across the rope and drop right.
// * Grab the coin and drop left. Drop right and left for two more coins
// * Climb down and open the door.
// * Run left and drop for two more coins.
// * Drop right, then left back to the bottom floor.
// * Run under the red guys and quickly climb the ladder. 
// * Go across the rope and zig zag down the right side of the level: Right, Left, Right, Right, Left, Right.
// * Hold left and drop down the last two levels, you should land right in front of the red guys.
// * Keep running and get back on the ladders.
// * Zig zag down the left side again and fall through the door you opened earlier.
// * Grab the last coin and run for the exit.

achievement("Pyramid-4", "Complete the eighteenth level", 5, type="progression",
    trigger = complete_level(18, 0x1d)
)

// LEVEL 19: TRAPS [TRAP]
// * Run up the first three ladders and grab a coin.
// * Step under the right ladder until the red guy starts down it.
// * Step left to get the red guy to fall, then climb the next two ladders and grab the coin.
// * Fall off to the right. Run left and open the door before the red guy respawns.
// * Climb up the next series of ladders then run left across the long rope.
// * Fall all the way down through the door you opened earlier.
// * Run left and fall through where you started.
// * Climb the long ladder and grab the next coin.
// * Go back to the ladder and step out on the ledge. Drop to the ladder.
// * Run across the rope and drop down to a coin.
// * Run left to another coin.
// * Go back to the right and climb DOWN the right ladder. Fall DOWN to another ladder.
// * Step down and shoot out the block under the coin. Climb up and run across the rope and fall through two coins.
// * Run right and up the zig zagging ladders (watch out for the other red guy).
// * Climb down the middle ladders until you get the last coin, then fall off to the right.
// * Open the door and climb down to the rope at the bottom. Run all the way left for a coin.
// * Come back to the nearest ladder and go up between the doors.
// * Open the right door and run through for two coins.
// * Go back to the bottom level and make the the red guy jump off. Quickly run through the other door and back to
//   the start.
// * Climb up the long ladder and step over the ledge.
// * Go down and collect the coin. Climb down and collect the next coin.
// * Hang from the ladder and step right to fall onto another ladder.
// * Trick the red guy off the next ladder like you did at the start of the level.
// * Run up the ladders and off the rope.
// * Shoot through the ladder on the right to break a block. Climb up the ladder and fall through the broken block.
// * Run right across a coin.
// * Step down onto the ladder and break the block on the left. Climb up and fall through the broken block.
// ! Important: make sure to trap the red guy somewhere near where he spawns. If he gets to the lower levels, he'll
//   be in the way later.
// * Run all the way back to the long ladder and climb up it again.
// * Fall off the right side to get the coin on the island.
// * Fall off it to the right and start climbing the ladder.
// * Shoot out the block under the middle coin, then collect the two coins at the top. Hang from the ladder and step
//   left to fall through two more coins.
// * Step left and run back to the start and up the long ladder. Step off the ledge and run across the rope.
// * Climb down two ladders and run across some ropes. Zig zag up to the final door.
// * Run through and collect the upper coin.
// * Run back to the short ladder. Go down and left for the final coin and exit.

achievement("Traps", "Complete the nineteenth level", 5, type="progression",
    trigger = complete_level(19, 0x07)
)

// LEVEL 20: WATER TANK [TANK]
// * Climb up the ladders on the right, stopping halfway up the rightmost ladder.
// * Shoot out two blocks. Go to the top row and shoot out two blocks. Step through and fall through six coins.
// * Go up to the top again. Shoot out two blocks. Go back to the middle and shoot out three. Go back to the top
//   and shoot out another. When the first two reform, jump and collect 6 more coins.
// * Repeat again for the last column of coins (shoot out three at top, four in middle, last at top, jump).
// * Climb back to the bottom and then up the left side. Repeat the process to collect all the coins there.
// * Blast through the middle row again, then jump off the right side. While falling, shoot the one square next 
//   to the ladder. Repeat so the square has two chunks missing.
// * Run to the bottom and stand under the center. Step left and right to kill both red guys.
// * Run back to the left side so one of the red guys gets on the left-middle ladder.
// * Blast through the middle row again. The red guy should be at the top of the left-middle ladder.
// * Jump off the right side and shoot the one square next to the ladder.
// * Lure the red guy across the bottom. Stop in the middle to kill the other red guy.
// * As you climb the ladders, the one following you will jump in the water. Or, if you're fast enough, will get
//   stuck at the top of the lower ladder.
// * Before he can respawn, shoot out two blocks on the top row, then the one on the left. Run across the rope
//   and fall into the middle. Climb the ladder before the red guys can get you.

achievement("Water Tank", "Complete the twentieth level", 10, type="win_condition",
    trigger = complete_level(20, 0x07)
)
