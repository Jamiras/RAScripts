// Kick Master
// #ID = 1776

function current_animation() => byte(0x00CD)
function current_level() => low4(0x00D3)
function current_mp() => low4(0x00EA)
function current_stage() => byte(0x00FA)
function current_quest() => byte(0x030C)
function current_lives() => byte(0x030E)
function current_skills() => byte(0x06BE)

function trigger_reach_stage(stage) => current_stage() == stage && never(current_stage() != stage) &&
                                       (current_animation() == 205 || current_animation() == 204)

achievement(
    title = "I don't even want to return!", description = "Reach Caverns of no Return", points = 5,
    id = 7891, badge = "07950", published = "5/2/2014 12:37:01 PM", modified = "5/4/2014 2:40:35 PM",
    trigger = trigger_reach_stage(136)
)

achievement(
    title = "First and Last", description = "Reach Belzed's first stronghold", points = 5,
    id = 7892, badge = "07951", published = "5/2/2014 12:37:03 PM", modified = "5/4/2014 2:40:57 PM",
    trigger = byte(0x0000FB) == 133 && never(byte(0x0000FB) != 133) && trigger_reach_stage(139)
)

achievement(
    title = "Better don't fall!", description = "Reach the bottomless crevasse", points = 5,
    id = 7893, badge = "07952", published = "5/2/2014 12:37:05 PM", modified = "5/4/2014 2:41:20 PM",
    trigger = trigger_reach_stage(141)
)

achievement(
    title = "Over the sea", description = "Aboard the ship of strife", points = 10,
    id = 7894, badge = "07953", published = "5/2/2014 12:37:06 PM", modified = "5/4/2014 2:41:37 PM",
    trigger = byte(0x0000FB) == 49 && never(byte(0x0000FB) != 49) && trigger_reach_stage(145)
)

achievement(
    title = "And now i'm dirty...", description = "Across the swamps", points = 15,
    id = 7895, badge = "07954", published = "5/2/2014 12:37:07 PM", modified = "5/4/2014 2:41:55 PM",
    trigger = byte(0x0000FB) == 99 && never(byte(0x0000FB) != 99) && trigger_reach_stage(147)
)

achievement(
    title = "I'm so close", description = "A long way from home", points = 15,
    id = 7896, badge = "07955", published = "5/2/2014 12:37:09 PM", modified = "5/4/2014 2:42:14 PM",
    trigger = byte(0x0000FB) == 171 && never(byte(0x0000FB) != 171) && trigger_reach_stage(149)
)

achievement(
    title = "Are you afraid of dark?", description = "Reach Belzed's haunted tower", points = 15,
    id = 7897, badge = "07958", published = "5/2/2014 12:37:11 PM", modified = "5/4/2014 3:08:10 PM",
    trigger = byte(0x0000FB) == 36 && never(byte(0x0000FB) != 36) && trigger_reach_stage(152)
)

achievement(
    title = "Peace returns", description = "Win the game", points = 25,
    id = 7898, badge = "07957", published = "5/2/2014 12:37:12 PM", modified = "5/3/2014 10:38:31 AM",
    trigger = once(byte(0x0000B6) == 229) && once(byte(0x0000B6) == 247) && once(byte(0x0000B6) == 238) && once(byte(0x0000B6) == 9) && once(byte(0x0000B6) == 27) && once(byte(0x0000B6) == 18) && current_stage() == 157 && never(current_stage() != 157) && byte(0x0000FB) == 220
)

achievement(
    title = "Jump down", description = "Learn Knee Drop", points = 2,
    id = 7924, badge = "07960", published = "5/3/2014 10:28:45 AM", modified = "5/6/2014 5:09:40 PM",
    trigger = current_level() == 1
)

achievement(
    title = "Falcon Kick", description = "Learn Slike Kick", points = 3,
    id = 7925, badge = "07959", published = "5/3/2014 10:28:46 AM", modified = "5/6/2014 5:09:41 PM",
    trigger = current_level() == 2
)

achievement(
    title = "Dance high!", description = "Learn Double Front Kick", points = 5,
    id = 7926, badge = "07961", published = "5/3/2014 10:28:47 AM", modified = "5/6/2014 5:09:43 PM",
    trigger = current_level() == 3
)

achievement(
    title = "Dancing like ballerina", description = "Learn High Kick To Roundhouse", points = 8,
    id = 7927, badge = "07965", published = "5/3/2014 10:28:49 AM", modified = "5/6/2014 5:09:44 PM",
    trigger = current_level() == 4
)

achievement(
    title = "Flying Falcon Kick!", description = "Learn Flying Kick", points = 10,
    id = 7928, badge = "07964", published = "5/3/2014 10:28:50 AM", modified = "5/6/2014 5:09:46 PM",
    trigger = current_level() == 5
)

achievement(
    title = "Aerial twine", description = "Learn Double Butterfly Kick", points = 12,
    id = 7929, badge = "07963", published = "5/3/2014 10:28:52 AM", modified = "5/6/2014 5:09:47 PM",
    trigger = current_level() == 6
)

achievement(
    title = "Flip Throw in", description = "Learn Blazing Flip Kick", points = 15,
    id = 7930, badge = "07962", published = "5/3/2014 10:28:54 AM", modified = "5/6/2014 5:15:53 PM",
    trigger = current_level() == 7 && 
              once(never(low4(0x0000EC) == 9)) && 
              once(never(low4(0x0000EC) == 8)) && 
              once(never(low4(0x0000EC) == 7)) && 
              low4(0x0000F0) == 7 && 
              low4(0x0000EF) == 0
)

achievement(
    title = "Bounce it!", description = "Find Bouncing Bulb Spirit", points = 5,
    id = 7931, badge = "07969", published = "5/3/2014 10:29:01 AM", modified = "5/4/2014 2:40:05 PM",
    trigger = current_stage() == 134 &&
              ((current_animation() == 204) ||
               (current_animation() == 205))
)

achievement(
    title = "Better boots than Nike's!", description = "Find Magic Boots", points = 5,
    id = 7932, badge = "07971", published = "5/3/2014 10:29:04 AM", modified = "5/6/2014 5:29:59 PM",
    trigger = current_stage() == 136 && byte(0x0000FB) == 42 &&
              ((current_animation() == 204) ||
               (current_animation() == 205))
)

achievement(
    title = "What's this?", description = "Find ??", points = 5,
    id = 7933, badge = "07970", published = "5/3/2014 10:29:07 AM", modified = "5/6/2014 5:33:56 PM",
    trigger = current_stage() == 142 && byte(0x0000FB) == 58 &&
              ((current_animation() == 205) ||
               (current_animation() == 204))
)

achievement(
    title = "Are you hurt?", description = "Find Life UP 2", points = 5,
    id = 7934, badge = "07972", published = "5/3/2014 10:29:09 AM", modified = "5/4/2014 2:39:10 PM",
    trigger = current_stage() == 143 && byte(0x0000FB) == 83 &&
              ((current_animation() == 205) ||
               (current_animation() == 204))
)

achievement(
    title = "Defending myself", description = "Find Force Shield", points = 5,
    id = 7935, badge = "07973", published = "5/3/2014 10:29:12 AM", modified = "5/4/2014 2:55:41 PM",
    trigger = current_stage() == 147 && byte(0x0000FB) == 206 &&
              ((current_animation() == 204) ||
               (current_animation() == 205))
)

achievement(
    title = "Element of Magic", description = "Find all Magic", points = 15,
    id = 7936, badge = "07974", published = "5/3/2014 10:29:14 AM", modified = "5/3/2014 10:30:04 AM",
    trigger = current_skills() == 255 && byte(0x0006BF) == 15
)

achievement(
    title = "Player want points!", description = "Get 100.000 Points", points = 10,
    id = 7937, badge = "07968", published = "5/3/2014 10:29:18 AM", modified = "5/6/2014 5:26:10 PM",
    trigger = low4(0x00030B) == 1 && 
              never(current_lives() == 10) && 
              once(current_stage() == 0) && 
              once(byte(0x0000FB) == 0)
)

// 10164: Didn't trigger, had 9999 EXP and 999 MP on the last stage.<br/>MD5: b167c3d23b3bd2f0759e5901d6ec7ebb
achievement(
    title = "Your magic is ready!", description = "Have 999 MP", points = 15,
    id = 7938, badge = "07987", published = "5/3/2014 10:29:20 AM", modified = "5/5/2014 10:42:17 AM",
    trigger = current_mp() == 9 && 
              low4(0x0000EB) == 9 && low4(0x0000EC) == 9 && 
              never(current_lives() == 10) && 
              once(current_stage() == 0) && once(byte(0x0000FB) == 0)
)

// 10199:  got 9,999 experience on the last level, killed the final boss and did not count the achievement. Unfortunately I did not make a screenshot, only saved the screenshot of the password after the game I had passed.<br/>MD5: b167c3d23b3bd2f0759e5901d6ec7ebb
// 10165: Didn't trigger, had 9999 EXP and 999 MP on the last stage.<br/>MD5: b167c3d23b3bd2f0759e5901d6ec7ebb
// 9577: This achievement doesn't work on all 4 quests!<br/>MD5: b167c3d23b3bd2f0759e5901d6ec7ebb
// 9387: <br/>MD5: b167c3d23b3bd2f0759e5901d6ec7ebb
// 4902: didn't unlocked with or without using password
achievement(
    title = "Over 9000!", description = "Have 9999 EXP", points = 15,
    id = 7939, badge = "07988", published = "5/3/2014 10:29:21 AM", modified = "5/5/2014 10:41:38 AM",
    trigger = low4(0x0000ED) == 9 && low4(0x0000EE) == 9 && low4(0x0000EF) == 9 && low4(0x0000F0) == 9 && 
              never(current_lives() == 10) && 
              once(current_stage() == 0) && once(byte(0x0000FB) == 0)
)

achievement(
    title = "Karate Kid", description = "Win the game on 4th Quest", points = 70,
    id = 7941, badge = "07967", published = "5/3/2014 10:29:25 AM", modified = "5/7/2014 11:21:41 AM",
    trigger = once(byte(0x0000B6) == 229) && once(byte(0x0000B6) == 247) && 
              once(byte(0x0000B6) == 238) && once(byte(0x0000B6) == 9) && 
              once(byte(0x0000B6) == 27) && once(byte(0x0000B6) == 18) && 
              current_stage() == 157 && byte(0x0000FB) == 220 && 
              current_quest() == 3 && 
              never(current_lives() == 10) && once(current_stage() == 0) && once(byte(0x0000FB) == 0)
)

achievement(
    title = "I don't know how to fight!", description = "Win the game on 0lvl", points = 100,
    id = 7940, badge = "07966", published = "5/3/2014 10:29:24 AM", modified = "5/5/2014 4:29:50 PM",
    trigger = once(byte(0x0000B6) == 229) && once(byte(0x0000B6) == 247) && once(byte(0x0000B6) == 238) && once(byte(0x0000B6) == 9) && once(byte(0x0000B6) == 27) && once(byte(0x0000B6) == 18) && current_stage() == 157 && never(current_stage() != 157) && byte(0x0000FB) == 220 && current_level() == 0 && never(current_level() != 0)
)

