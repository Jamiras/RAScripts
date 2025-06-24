// Knither: Demon Crystal II
// #ID=30913
// MD5: 01e64aaf482eabf2f0cedb6d5b6dc0e9 (Knither - Demon Crystal II.d88)

// Left Shift to bring up the inventory menu
// F: Fireball
// C: Cracker - fireball that explodes when it hits something
// T: Thunder Sword - penetrates through enemies until it hits a wall
// W: Wave of Fire - flames spread downwards for a while
// S: Spark Flash - kill all enemies on screen (not in unopened areas)
// P: Password (need three per world or you can't advance)

// 5 Worlds with 10 stages each, plus a battle with the witch
// * Need to find three Ps in each world to open the door to the next world
// To win in world 6, you need:
// * The crown (world 4) to make the shaman appear
// * The balance (world 5) to open the moon gate
//   - The crystal rod (world 3) to trade for the balance
// * The bright crystal (world 3) to enter the moon gate

// Walkthrough: http://ishigon.web.fc2.com/game/knither/
// Ending: https://www.youtube.com/watch?v=jwYO_u71mVY

// At its core, Knither is a puzzle game. You must explore each of five worlds to find the three [P] blocks
// that open the portal to the next world. Along the way, you may also find some special items. Most are helpful,
// some are even required to beat the game.

// Along the way, you'll encounter many enemies wandering around the levels. The Octopi and Eye Demons are
// immune to fire, so must be killed using the [T] or [S] weapons. The Black Knights can only be killed by
// the [S] weapons. Your weapons are limited, so you'll need to collect more as you progress through the game
// and use them sparingly.
// * [F] is your basic fireball attack. It will fly through the air until it hits something, then leave a flame
//   behind for a few seconds. Anything not immune to fire will die when it touches the flame. You can safely
//   stand in and pass through the fire, so it can be used to escape from enemies.
// * [C] is an exploding fireball. It flies through the air until it hits something, then explodes, killing
//   anything in the explosion radius. It's the only weapon you have that can kill you, so don't use it in
//   close quarters.
// * [W] is a wave of fire. The five spaces in front of you will briefly ignite, killing anything it touches.
// * [T] is a thrown sword. It will fly through the air until it hits a wall, killing anything it passes through.
//   These are best saved for Octopi and Eye Demons as they're immune to all of the fire weapons.
// * [S] is a magical grenade. It will kill every enemy visible on the current level (it does not affect enemies
//   still hidden behind locked doors). You will need at least three of these to kill the Black Knights in world 5.

// There are also several items in the game. Small keys unlock doors within a level. Big keys unlock the exit door.
// Once you have the big key, touching the exit door will end the level. There are some levels where important things
// are hidden beyond the exit door, so you have to wait to grab the big key until after collecting the important things.
// If you fail to collect all three [P] blocks in a world, you cannot advance to the next world. If you don't collect
// the items needed for the final battle, you can't finish the game. Fortunately, the level and world layouts are
// always the same, so you can take notes on what is where and when its important to loot before collecting the big key.

// Special items you may come across on your journey. Each can only be uses once.
// * Armor - your own [C] spells will no longer kill you. (lasts until GAME OVER).
// * Balance - [spoiler]makes the moon gate appear after defeating the final boss.[/spoiler]
// * Bright Crystal - [spoiler]used to open the moon gate after defeating the final boss.[/spoiler]
// * Crown - [spoiler]used to make the final boss appear.[/spoiler]
// * Crystal Rod - [spoiler]used to turn the fairy in World 5 into the Balance.[/spoiler]
// * Helmet - projectiles won't kill you (lasts until you die).
// * Lamp - reveals all hidden areas in a single level. Only usable in the first world.
// * Necklace - used to exit a level without using the exit door.
// * Mirror - doubles the number of [F], [C], [W], [T], and [S] items in your inventory.
// * Potion of Life - automatically resurrects you if you die.
// * Scroll - resets the level timer.

function remaining_time() => bcd(word(0x33a1)) * 10

function selected_item() => byte(0x3451)
item_keys = 1
item_bigkey = 2
item_password = 3
item_fireball = 4
item_cracker = 5
item_thunder_sword = 6
item_wave_of_fire = 7
item_spark_flash = 8
item_lamp = 9
item_potion_of_life = 10
item_helmet = 11
item_armor = 12
item_bright_crystal = 13
item_crown = 14
item_crystal_rod = 15
item_mirror = 16
item_scroll = 17

function item_count(item) => byte(0x33df + item)

function current_score() => bcd(word(0x3460)) * 100000 + bcd(word(0x3462)) * 10

function active_music() => byte(0xc922)
music_none = 0
music_title = 1
music_world_map = 2
music_in_level = 3
music_almost_out_of_time = 8
music_victory = 9
music_credits = 10
music_collected_special_item = 11
music_death = 12
music_not_enough_portal_items = 13
music_game_over = 14

function current_world() => byte(0x3392) + 1
function current_stage() => byte(0x3399)
function stages_completed() => byte(0x339b)
function completed_stage() => byte(0x3397) == 1 && prev(byte(0x3397)) == 0
function lives() => byte(0x3394)

function completed_game() => current_stage() == 0x33 && active_music() == music_victory
function game_over() => active_music() == music_game_over

rich_presence_conditional_display(active_music() == music_title, "Titles")
rich_presence_conditional_display(current_stage() == 0x33,
    "{0}{1}{2}{3}{4}{5}{6}0 | World 6 | {7} lives",
    rich_presence_value("digit", bcd(byte(0x3461))), // write out each digit separately to 0-pad the display
    rich_presence_value("digit", high4(0x3460)),
    rich_presence_value("digit", low4(0x3460)),
    rich_presence_value("digit", high4(0x3463)),
    rich_presence_value("digit", low4(0x3463)),
    rich_presence_value("digit", high4(0x3462)),
    rich_presence_value("digit", low4(0x3462)),
    rich_presence_value("lives", lives())
)
rich_presence_display("{0}{1}{2}{3}{4}{5}{6}0 | World {7} ({8}/10 stages) | {9}/3 [P] | {10} lives",
    rich_presence_value("digit", bcd(byte(0x3461))),
    rich_presence_value("digit", high4(0x3460)),
    rich_presence_value("digit", low4(0x3460)),
    rich_presence_value("digit", high4(0x3463)),
    rich_presence_value("digit", low4(0x3463)),
    rich_presence_value("digit", high4(0x3462)),
    rich_presence_value("digit", low4(0x3462)),
    rich_presence_value("world", current_world()),
    rich_presence_value("stages", stages_completed()),
    rich_presence_value("passwords", item_count(item_password)),
    rich_presence_value("lives", lives())
)

leaderboard("Progress Score", "Highest score upon reaching world 6 or game over",
    start = game_over() || current_stage() == 0x33,
    submit = always_true(),
    cancel = always_false(),
    value = current_score()
)

// NOTE: get 10 million for finishing game, and 1 million for each remaining life
leaderboard("Victory Score", "Highest score after completing world 6",
    start = completed_game(),
    submit = always_true(),
    cancel = always_false(),
    value = current_score()
)

function item_achievement(title, description, points, stage)
{
    achievement(title, description, points,
        trigger = current_stage() == stage && 
                  active_music() == music_collected_special_item
    )
}

function world_achievement(title, description, points, world)
{
    achievement(title, description, points, type="progression",
        trigger = current_world() == world + 1 && 
                  prev(current_world()) == world
    )
}

world_achievement("World 2", "Collect the three [P]s in world 1 and advance to world 2", 5, 1)
world_achievement("World 3", "Collect the three [P]s in world 2 and advance to world 3", 10, 2)
world_achievement("World 4", "Collect the three [P]s in world 3 and advance to world 4", 10, 3)
world_achievement("World 5", "Collect the three [P]s in world 4 and advance to world 5", 10, 4)

achievement("World 6", "Collect the three [P]s in world 5 and advance to world 6", 10, type="progression",
    trigger = current_stage() == 0x33 &&       // world 6 stage
              prev(current_stage()) >= 0x29 && // world 5 overworld
              prev(current_stage()) <= 0x32
)

achievement("The Moon Gate", "Defeat the dark storm and save the world", 25, type="win_condition",
    trigger = completed_game()
)

achievement("Explorer", "Complete all ten stages in any world", 10,
    trigger = stages_completed() == 10 &&
              prev(stages_completed() == 9)
)

// WORLD 1:
// * 0A|House 1 (N) : [S]
// * 02|House 2 (NE): [P]
// * 01|House 3 (NW): [P]
// * 04|House 4 (W) : Old Man  - "Balance and World"
// * 05|House 5 (C) : Chest (Lamp) - Reveals everything in hidden spaces (removed white squares from a single level)
// * 06|House 6 (E) : Chest (Scroll) - Resets remaining time to 30000
// * 08|House 7 (SW): Nothing
// * 07|House 8 (SE): Nothing
// * 03|House 9 (S) : [P]
// * 09|House 10(SE): [S]

item_achievement("A Light in the Dark", "Find the lamp in world 1", 3, 0x05)
item_achievement("Scroll of Time", "Find the scroll in world 1", 3, 0x06)
item_achievement("Balance and World", "Find the old man in world 1", 4, 0x04)

// WARNING: [F]s are your primary attack, and limited in supply, so use a [C] whenever you're attacking something
//          more than a third of the screen away.
// * Go to house 1 (N) [only necessary for "explorer" achievement]
//   - Collect the [C] and key, then go up to the 5th floor.
//   - Go down the right side, collecting two [F]s.
//   - Open the rightmost door on the 1st floor for two more keys.
//   - Return to the 5th floor and open the two doors on the right side for the big key and an [S].
//   - Go to the exit.
// * Go to house 3 (NW).
//   - Go up and left for the first key.
//   - Then up and left to get another key and the [P]
//   - Go all the way down and right for a [F] and another key.
//   - Go up to the 5th floor for another [F] and two keys.
//   - Go back down to the 4th floor for two more keys and an [F].
//   - Open the 3rd floor center area for the Big key and another little key.
//   - Open the 3rd floor right area for an [F] and the exit.
// * Go to house 4 (W).
//   - Grab the three keys on the left, opening the 3rd floor door for three [T]s.
//   - Go all the way around, using the [T]s to kill the two octopuses.
//   - Open the two doors on the 4th floor to find the Big Key and the old man.
//   - Leave
// * Go to house 5 (C)
//   - Go left, grabbing the key.
//   - Climb to the fourth floor and open the door. Collect two keys, two [F]s, and a [T].
//   - Go back to the start and up the ladder on the right.
//   - Open the door on the 2nd floor for a [F] and the big key.
//   - Open the next door on the 2nd floor for another key and the lamp.
//   - Go around to the left side of the 2nd floor and open the door 
// * Go to house 2 (NE). 
//   - Get the key on the 2nd floor.
//   - Open the nearby door and collect five [F]s and two keys.
//   - Go back and up to the 3rd floor. Open the door for a [C] and another key.
//   - Go up and open the 5th floor left side for the big key.
//   - Open the 4th floor left side and dodge/kill the octopus to get the [P].
//   - Open the 4th floor right side and dodge/kill the octopus to leave.
// * Go to house 6 (E).
//   - Climb up to the 5th floor, collecting both keys en route.
//   - Ready a [T]. Open the door and kill the octopus.
//   - Collect another key and the big key.
//   - Open the right door on the 3rd floor for the scroll.
//   - Return to the big door and leave.
// * Go to house 10 (SE).
//   - Grab the two keys on the right and work up the right side to the 5th floor.
//   - Ready a [T]. Open the door and kill the octopi. Collect the [S].
//   - Return to the start and grab the other two keys on the 1st floor.
//   - Proceed up the left side. The exit is behind the door on the 5th floor.
// * Go to house 8 (CSE) [only necessary for "explorer" achievement]
//   - Go up the left side to collect the two [F]s and the key, then return to the start.
//   - Go up the right side and open the rightmost door on the 2nd floor for an [F] and the big key.
//   - Go up to the 4th floor and open the door for another [F] and the exit.
// * Go to house 9 (S).
//   - Go up the right side, collecting the [W] (2nd floor), [F] (3rd floor), and key (4th floor).
//   - Open the two doors on the right side of the 4th floor for more keys and the final [P].
//   - Open the 3rd floor right side for the Big Key.
//   - Go back to the 1st floor and up the left side, collecting the two [F]s on the second floor.
//   - Open the 3rd floor left side to leave.
// * Go to house 7 (SW) [only needed for "explorer" achievement]
//   - Go up the left side and collect the key on the 3rd floor.
//   - Return to the first floor, ready a fireball, and open the left door for the big key.
//   - Go up the right side, grab the key, ready another fireball, and open the door for a [C] and another key.
//   - Follow the path around to the door on the 4th floor and leave.
// * Advance to world 2

// WORLD 2:
// * 0F|House 1 (N) : Potion of Life
// * 0C|House 2 (NE): [P] + [S] 
// * 12|House 3 (NW): [W] x2
// * 13|House 4 (NE): [S]
// * 10|House 5 (CW): Helmet
// * 0E|House 6 (E) : Fairy
// * 0B|House 7 (W) : [P]
// * 0D|House 8 (SE): [P] + Armor
// * 11|House 9 (SW): [W] x2
// * 14|House 10(SW): [S]

item_achievement("In Need of Help", "Find the fairy in world 2", 5, 0x0E)
item_achievement("Protection", "Find the helmet in world 2", 5, 0x10)
item_achievement("Flame Retardant", "Find the armor in world 2", 5, 0x0D)
item_achievement("A Little Insurance", "Find the potion of life in world 2", 5, 0x0F)

// * Go to house 8 (SE).
//   - Grab the key on the way to the 3rd floor.
//   - Proceed through the first door and use fireballs to kill the guard and plant.
//   - Go through the next door. As you pass the big door, a plant will appear.
//   - Use a Spark to kill the plant, the two octopuses, and any remaining guards. 
//     - Or [T]s for the octopuses, a [C] for the plant, and [F]s for the guards.
//   - Go up to the 4th floor and grab the small key (not the big key) and go down to the 2nd floor.
//   - Go through the right door for an [F], [P], and another key.
//   - Go through the left door for a chest containing Armor.
//   - Go back to the 4th floor and grab the big key, then leave.
// * Go to house 6 (E).
//   - Climb up to the 5th floor and open the door on the right. Kill the guard and take the big key.
//   - Go through the first two doors on the left.
//   - Climb down to the 1st floor on the left. Open the door and talk to the fairy.
//   - Go back to the 5th floor and down the middle to leave.
// * Go to house 4 (NEC).
//   - Get the key. Open the door immediately to the right for a [C].
//   - Go up to the 4th floor.
//   - Go left and collect the [F] on the 5th floor.
//   - Go all the way down and open the door on the 1st floor for an [F] and the big key.
//   - Go back to the 4th floor and up to the 5th floor on the right.
//   - Go left through both doors for an [F] and a [W].
//   - Go down to the 2nd floor on the right and open the door to leave.
// * Go to house 2 (NE).
//   - Step through the door on the right and immediately fire a fireball. Collect the [T] (1st floor)
//   - Go up to the 5th floor (don't pick up the big key) and open the right side for four keys.
//   - Ready a Cracker, then open the left door. Step right a couple spaces, turn and fire at the plant.
//     - Switch back to Fireball.
//   - Go left past the door and open the bottom two doors for a [S] and [P].
//   - Go back to get the big key, then leave.
// * Go to house 1 (N).
//   - Immediately shoot a fireball, and walk into it (you won't burn, but the other soldiers will as they approach you).
//   - Go up the right side, collect the [F], and [T], and open the door on the 5th floor for a [C].
//   - Go back to the second floor and go left through the door.
//   - Kill the guard and go left through the next door.
//   - Kill the guard and collect the two keys, then go back to the right, down to the 1st floor, and up the left
//     side to the 3rd floor.
//   - Go through the three doors to get the big key and Potion of Life, then leave.
// * Go to house 5 (just left of center).
//   - Grab the key and open the door on the bottom right (1st floor) for [C]x2 and another key.
//   - Use that to open the left door (1st floor) for an [F]. 
//   - Then go up to the 5th floor and open that door for a big key and the Helmet.
// * Go to house 7 (W below the water).
//   - Climb up the right side and grab the key.
//   - Go back to the 2nd floor and open the door for a [C] and two more keys.
//   - Go to the 1st floor and open the left door for another [C] and another key.
//   - Return to the 3rd floor and use a fireball to kill the plant next to the wall.
//   - Drop to the 2nd floor on the left side for the big key.
//   - Go up to the 4th floor, turn left and use a Cracker on the first plant.
//   - step right to make the second plant appear and use another Cracker on it.
//   - Go up to the 5th floor on the right and open the door for a [P] and [W], then leave.

// WORLD 3:
// * 15|House 1 (N) : [P] + Tree
// * 1E|House 2 (NE): Nothing
// * 18|House 3 (NW): Crystal Rod
// * 19|House 4 (NE): Bright Crystal
// * 17|House 5 (C) : [P]
// * 1B|House 6 (CW): Nothing
// * 1D|House 7 (WS): [F]x14
// * 0D|House 8 (ES): Nothing
// * 16|House 9 (SW): [P]
// * 1C|House 10(SE): [S]

item_achievement("Save! Fairies...", "Find the talking tree in world 3", 5, 0x15)
item_achievement("The Glass Sceptre", "Find the crystal rod in world 3", 5, 0x18)
item_achievement("A Shiny Jewel", "Find the bright crystal in world 3", 5, 0x19)

// * Go to house 10 (SE).
//   - Go up to the 5th floor and grab the key.
//   - Go down to the 2nd floor on the left for an [F] and another key.
//   - Go around to the other side of the 2nd floor and open the door for an [S], [W], [T], and [C].
//   - Drop down to the 1st floor and open the door on the left for the big key, then leave.
// * Go to house 9 (SW).
//   - Grab the key to the left on the 2nd floor.
//   - Go around to the right side of the 2nd floor and up to the 3rd floor for the [C].
//   - Get the other key on the 2nd floor and go through the center room on the 3rd floor where the exit door is.
//   - Go up to the 5th floor, ready a fireball, and open the door on the left for the [P].
//   - Go back to the 3rd floor and open the door on the left for a [C].
//   - Go past the door and down to the 2nd floor. Open the central door for the big key, then leave.
// * Go to house 7 (SW of the lake).
//   - Grab the key and [C] on each of the 2nd, 3rd, and 4th floors.
//   - Open the door on the fifth floor and collect the 14 [F]s.
//   - Go back to the first floor and into the closed room to find the big key and leave.
// * Go to house 3 (NW).
//   - Collect the first [F], then the three keys, second [F], and [T] on the 2nd floor.
//   - Go up to the 4th floor, killing the guard and octopus on the way.
//   - Collect the [F] and key, and go right through the door. Use a [W] to kill the plant.
//   - Open the next door and use another [W] to kill the other plant. Go up to collect the [W].
//   - Go down and continue all the way to the [W] on the right side, collecting the other [W], [F], and [C] on the way.
//   - Get the key next to where the [W] was then head down through the door on the right to the 1st floor.
//   - Open the door on the right collect the Crystal Rod from the chest before using a [F] to kill the plant.
//   - Open the door on the left for the big key, then go to the exit and leave.
// * Go to house 1 (N).
//   - Go up to the 2nd floor and collect the key on the left.
//   - Proceed to the 3rd floor on the left and open the door. Kill the bird and plant, then collect the big key, [T],
//     and little key.
//   - Go back to the 1st floor and open the door on the left for another key, a [P] and a [T].
//   - Open the door on the right side and talk to the tree. Grab the key.
//   - Head up to the 3rd floor and open the door on the right for an [F] and a key.
//   - Proceed up to the 5th floor and around to the exit (use a [W] on the plant).
//     - There's another plant just to the right of the exit. If you run into the exit, it won't have time to attack.
// * Go to house 5 (just right of center).
//   - Go right through the door, kill the bat, and up to the 5th floor.
//   - Follow the path all the way to the left side of the 5th floor, killing stuff as you go.
//     - There's a plant just on the other side of the last door on the 4th floor. Have a [W] ready.
//   - Open the door on the right for the [P] and big key.
//   - Go all the way back to the exit.
// * Go to house 4 (ENE - near the right wall).
//   - Collect the right key, then the left key and go up the ladder and left on the 3rd floor.
//   - Go all the way left, then down and right into a room with the Bright Crystal.
//   - Go back past the exit and through the door to get the big key. Then back to the exit to leave.
//     (You can't collect both the Bright Crystal and the [S])
// * Go to the portal.

// WORLD 4:
// * 26|House 1 (NW): Easy points
// * 22|House 2 (N) : Fairy
// * 27|House 3 (NE): nothing
// * 20|House 4 (W) : [P]
// * 1F|House 5 (E) : [P]
// * 24|House 6 (CW): Crown
// * 23|House 7 (CE): Fairy
// * 21|House 8 (CS): [P]
// * 25|House 9 (SW): Mirror
// * 28|House 10(S) : 5x[T], but you'll probably use 3 or 4 in the level

item_achievement("Fairy of the North", "Find the northern fairy in world 4", 5, 0x22)
item_achievement("Fairy of the East", "Find the eastern fairy in world 4", 5, 0x23)
item_achievement("Just Like Royalty", "Find the crown in world 4", 5, 0x24)
item_achievement("Magic Duplication", "Find the mirror in world 4", 5, 0x25)

// * Go to house 8 (CS).
//   - You need to kill both octopi. You can try to coerce them down to the bottom floor to use a [T] on them,
//     but it's much easier to just use an [S]. Climb partly up the right side so you can kill a few plants when
//     you trigger the [S].
//   - Once they're dead, go up the right side. There's plants across from each key, but you can kill them with 
//     [F]s since they're right next to walls.
//   - Then go up the middle area. You'll have enough keys to get the [P], but not enough for the final door. 
//     (Through the magic of modifying memory for extra keys, I know there's an [S] back there).
//   - The left side has plants on both sides of the ladder, but you can just race past them.
//     Grab the big key, then return to the exit.
// * Go to house 7 (CE).
//   - Grab the key on the 2nd floor, then go up to the 4th floor and grab that key.
//   - Continue to the 5th floor and open the first door. Blast the plants with a [W].
//   - Open the next door and rescue the fairy.
//   - Grab the key, and open the right door on the 1st floor. Get the big key.
//   - Open the leftmost door on the 4th floor and leave.
// * Go to house 5 (E).
//   - Proceed up to the 4th floor, and open the door on the left for an [F].
//     - You have to use [T]s to kill the roaming eyeballs.
//   - Open the door on the 5th floor for a [C].
//   - Go down the right ladder and grab the key on the 4th floor.
//   - Open the door on the 3rd floor for another [F] and the big key.
//   - Keep going down and around (use a [W] on the plant) to the rightmost door on the 2nd floor. Open it for a [P].
//   - Go back to the last door on the 3rd floor. Open it (there's one last eyeball behind it) and leave.
// * Go to house 2 (N).
//   - WARNING! You can't use a sword on the top floor, or it'll kill the fairy.
//   - Wait on the bottom floor for one of the eyes to wander down. Use a [T] to kill it.
//     - Wizards may teleport down there. Kill them with [F]s.
//   - If the other eye doesn't come all the way down the ladder, follow it up and kill it after talking to the fairy.
//   - Go around and open the door and leave.
// * Go to house 1 (NW).
//   - This is just easy points. Grab the big key and leave.
// * Go to house 4 (W - NW of lake).
//   - Grab the two keys and open the first door. Kill the ghost and open the second door.
//   - Grab the next key and open the third door. Kill the plant [F].
//   - Open the next door. Collect the three [F]s, [C], and two keys.
//   - Open the rightmost door on the 4th floor. Kill the guard.
//   - Open the next two doors and kill another plant [F].
//   - Open the next door and proceed down and left. Collect the four keys and the big key.
//   - Return to the 4th floor. Open the right door and grab the [P].
//   - Go up to the 5th floor and [W] the plant, then leave.
// * Go to house 9 (SW).
//   - Kill the ghosts and grab all four keys.
//   - You can only open one floor.
//     - There are 5x [C] and a chest with the Mirror on the 2nd floor.
//       When you USE the mirror, it doubles the count of all the weapons in your inventory (including [W] and [S]),
//       so it's probably the best overall floor to loot.
//     - The 3rd floor has 4x [T] and 5x [C], leaving two keys to get 2x [W] on the 5th floor, and either 3x [T] on the
//       5th floor or 5x [F] on the 4th floor.
//     - The 4th floor has 5x [F], a plant, and 4x [S].
//     - The 5th floor has 2x [W], 3x [T], 2x [W], and 2x [W] with a plant.
//   - After grabbing the loot, leave.
// * Go to house 6 (CW).
//   - Go right and up the ladders to collect the [T] on the 4th floor.
//   - Return to the 3rd floor and go right through the door to collect the two keys.
//   - Go up the nearby ladder and open the left door on the 4th floor for the Crown, then leave.
// * Enter the portal.

// WORLD 5:
// * 2D|House 1 (NW): [P]
// * 2B|House 2 (NE): Fairy + Balance
// * 2C|House 3 (N) : Necklace
// * 30|House 4 (W) :
// * 31|House 5 (CE):
// * 2A|House 6 (CW): [P]
// * 2E|House 7 (E) :
// * 2F|House 8 (SW):
// * 32|House 9 (S) :
// * 29|House 10(SE): [P]

// * Go to house 10 (SE)
//   - The black knights can only be killed by using [S]. If you have at least three, use one. Otherwise, you have
//     to dodge them.
//   - Go up the left side, grabbing the key. Use it on the left door of the 5th floor for a [T].
//   - Go down into the middle area, collecting the two keys, and unlocking the three doors for two [T]s, the [P],
//     and the big key.
//   - Get the three keys on the right side of the level.
//   - Use a key on the left door of the 1st floor for another [T].
//   - Use a key on the left door of the 2nd floor for an [S].
//   - Use a key on the left door of the 3rd floor for the exit.
// * Go to house 7 (E)
//   - More easy points. Get both keys, open the door, and leave.
// * Go to house 5 (CE - blue cave straight north of where house 10 was)
//   - Easy points. Just climb the ladder, get the key (watch out for the plant), then go back down and leave.
// * Go to house 2 (NE)
//   - Work your way up to the 5th floor, collecting two keys and killing the eyeballs.
//   - Open the first door on the 5th floor and collect two more keys.
//   - Go back to the fourth floor and open both doors, collecting the big key.
//   - Go down to the 1st floor on the right, collecting two more keys and killing the eyeballs.
//   - Open the door on the 1st floor, but DON'T talk to (or approach) the fairy.
//   - Use the Crystal Rod an the fairy will turn into a chest. Open it for the Balance.
//   - Return to the exit.
// * Go to house 3 (N)
//   - As quickly as you can, run around the outside of the level and collect the two small keys, BUT NOT THE BIG KEY!
//   - Go all the way back to the start of the level and open the two doors to find a chest containing the Necklace.
//   - Run back and collect the big key, then return to the exit.
//     - The timing on this is so tight that you'll have to use the necklace to automatically complete the level, or
//       the scroll to reset the timer.
// * Go to house 1 (NW)
//   - Grab the two small keys and the big key and go up to the 5th floor.
//   - Unlock the door on the left and collect two more keys.
//   - Use these to open the doors on the right side of the 4th floor for a [T] and five more keys.
//   - You have to use four of these to open the doors on the 5th floor. Behind the last door is a black
//     knight. Use an [S] to turn him into a [P].
//   - Use your last key on the right door of the 3rd floor for four [T]s, or the first door on the 2nd floor for an [S].
//   - Use the big door to leave.
// * Go to house 6 (CW - the castle looking thing, not the yellow hut)
//   - Dodge (or kill) the eyeballs to get the key on the 3rd floor.
//   - Return to the first floor and ready an [S]. Open the right door and fire it.
//   - Switch back to [F] or [T] and collect the [P] and whatever was dropped by the enemies.
//     Also collect the other key on the 5th floor and use it to open the left door on the first floor to leave.
// * Enter the portal

item_achievement("A Careful Balance", "Find the balance in world 5", 5, 0x2B)
item_achievement("A Mighty Amulet", "Find the necklace in world 5", 5, 0x2C)

// * World 6:
//   - You cannot use [S] on this level. You'll have to dodge the black knights and the randomly appearing wizards
//     while you try to kill the shaman.
//   - Use the Crown to make the shaman appear (dark blue robes)
//   - Kill the shaman ([T] works best because it goes through fireballs).
//     - When you kill the shaman, all other enemies will disappear.
//   - Use the Balance to make the moon gate appear.
//   - Enter it (must have the Bright Crystal?).

achievement("Knave", "Score 100,000 points", 5, low4(0x3460) == 1 && prev(low4(0x3460)) == 0)
achievement("Squire", "Score 250,000 points", 5, low4(0x3460) == 2 && high4(0x3463) >= 5 && prev(high4(0x3463)) < 5)
achievement("Journeyman", "Score 500,000 points", 10, low4(0x3460) == 5 && prev(low4(0x3460)) == 4)
//achievement("Knight", "Score 1,000,000 points", 25, high4(0x3460) == 1 && prev(high4(0x3460)) == 0)

