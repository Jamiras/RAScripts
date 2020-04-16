// Adventure Island
// #ID = 2265

// $C203: Player X
function player_x() => byte(0x00C203)

// $C400: 00-Title,01-map.02-select screen,03-game,
//        09-gameover
function current_mode() => byte(0x00C400)

// $C404: 00-in Menu,bonus
//        01-in level
function in_level() => byte(0x00C404)

// $C413: stage value
//        40 - game complete
function current_stage() => byte(0x00C413)

// $C416: score - 100,000s and 10,000s
function score_10k() => byte(0x00C416)

// $C417: score - 1,000s and 100s
function score_100() => byte(0x00C417)

// $C418: score - 10s and 1s
function score_1() => byte(0x00C418)

// $C419: Lives
function lives() => byte(0x00C419)

// $C41A: Items
function items() => byte(0x00C41A)

// $C41F: Hammer
function hammer() => byte(0x00C41F)

// $C427: 81-End of stage
function end_of_stage() => byte(0x00C427)

// $C428: 14-Skateboard
function skateboard() => byte(0x00C428)
function has_fairy() => bit7(0x00C428) == 1

// $DE52: Music?
function music() => byte(0x00DE52)

achievement(
    title = "Pteridophyta", description = "Beat Fern Island", points = 5,
    id = 9016, badge = "09492", published = "6/16/2014 11:42:33 AM", modified = "7/3/2014 10:51:24 AM",
    trigger = current_stage() == 8 && once(current_stage() == 6) && never(current_stage() == 0)
)

// Ticket 26378: https://www.twitch.tv/videos/582229312<br>MD5: d67e58bf5f39d5fb073fed85c3d9bede<br>Emulator: RetroArch
//               (1.8.5 - SameBoy (0.12.0 c9e547c))
// Ticket 24272: Played multiple times using just hammers, an achievement never triggers.<br>MD5: Unknown<br>Emulator:
//               RetroArch (gambatte_libretro.dll)
// Ticket 13958: Not works for me.
//               MD5: d67e58bf5f39d5fb073fed85c3d9bede
achievement(
    title = "Plantae", description = "Defeat 1st boss,hammers only!", points = 10,
    id = 9923, badge = "09586", published = "7/5/2014 3:35:31 PM", modified = "6/9/2015 1:09:56 PM",
    trigger = once(current_stage() == 4) && current_stage() == 6 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16) && hammer() == 1
)

achievement(
    title = "Much Cleaner", description = "Beat Lake Island", points = 5,
    id = 9017, badge = "09493", published = "6/16/2014 11:42:35 AM", modified = "1/31/2020 10:13:37 AM",
    trigger = current_stage() == 16 && once(current_stage() == 8) && never(current_stage() == 1)
)

achievement(
    title = "King Hermit Crab", description = "Defeat 2nd boss,hammers only!", points = 10,
    id = 9924, badge = "09587", published = "7/5/2014 3:35:32 PM", modified = "10/24/2019 2:24:02 AM",
    trigger = once(current_stage() == 12) && current_stage() == 14 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "Quicksands", description = "Beat Desert Island", points = 5,
    id = 9018, badge = "09494", published = "6/16/2014 11:42:36 AM", modified = "1/31/2020 10:13:39 AM",
    trigger = current_stage() == 24 && once(current_stage() == 16) && never(current_stage() == 1)
)

achievement(
    title = "Ant Lion", description = "Defeat 3rd boss,hammers only!", points = 10,
    id = 9925, badge = "09588", published = "7/5/2014 3:35:34 PM", modified = "7/22/2014 10:11:27 AM",
    trigger = once(current_stage() == 20) && current_stage() == 22 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "Ice Skating", description = "Beat Ice Island", points = 10,
    id = 9019, badge = "09495", published = "6/16/2014 11:42:39 AM", modified = "1/31/2020 10:13:41 AM",
    trigger = current_stage() == 32 && once(current_stage() == 24) && never(current_stage() == 1)
)

achievement(
    title = "Kraken", description = "Defeat 4th boss,hammers only!", points = 10,
    id = 9926, badge = "09589", published = "7/5/2014 3:35:35 PM", modified = "7/22/2014 10:33:48 AM",
    trigger = once(current_stage() == 28) && current_stage() == 30 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "Dark and groovy", description = "Beat Cave Island", points = 10,
    id = 9020, badge = "09496", published = "6/16/2014 11:42:40 AM", modified = "1/31/2020 10:13:43 AM",
    trigger = current_stage() == 40 && once(current_stage() == 32) && never(current_stage() == 1)
)

achievement(
    title = "Flying Fox", description = "Defeat 5th boss,hammers only!", points = 10,
    id = 9927, badge = "09590", published = "7/5/2014 3:35:36 PM", modified = "7/22/2014 10:12:31 AM",
    trigger = once(current_stage() == 36) && current_stage() == 38 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "Where did you learn to fly?", description = "Beat Cloud Island", points = 10,
    id = 9021, badge = "09497", published = "6/16/2014 11:42:42 AM", modified = "1/31/2020 10:13:46 AM",
    trigger = current_stage() == 48 && once(current_stage() == 40) && never(current_stage() == 1)
)

achievement(
    title = "Sky Lord", description = "Defeat 6th boss,hammers only!", points = 10,
    id = 9928, badge = "09591", published = "7/5/2014 3:35:38 PM", modified = "7/22/2014 10:12:23 AM",
    trigger = once(current_stage() == 44) && current_stage() == 46 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "Eruption", description = "Beat Volcano Island", points = 10,
    id = 9022, badge = "09498", published = "6/16/2014 11:42:43 AM", modified = "1/31/2020 10:13:49 AM",
    trigger = current_stage() == 56 && once(current_stage() == 48) && never(current_stage() == 1)
)

achievement(
    title = "Chela", description = "Defeat 7th boss,hammers only!", points = 10,
    id = 9929, badge = "09592", published = "7/5/2014 3:35:39 PM", modified = "7/22/2014 10:12:19 AM",
    trigger = once(current_stage() == 52) && current_stage() == 54 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

achievement(
    title = "One in a kind Island", description = "Beat Dinosaur Island", points = 10,
    id = 9023, badge = "09499", published = "6/16/2014 11:42:45 AM", modified = "1/31/2020 10:13:50 AM",
    trigger = current_stage() == 64 && once(current_stage() == 62) && never(current_stage() == 1)
)

achievement(
    title = "Diptera", description = "Defeat 8th boss,hammers only!", points = 10,
    id = 9930, badge = "09593", published = "7/5/2014 3:35:40 PM", modified = "7/22/2014 10:12:09 AM",
    trigger = once(current_stage() == 60) && current_stage() == 62 && never(skateboard() == 4) && music() == 109 && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

// Ticket 24999: Triggered in level 1-3. Was riding a dinosaur, found a fairy in an egg, and tripped over a skull just
//               after the fairy left. This triggered immediately.<br>MD5:
//               d67e58bf5f39d5fb073fed85c3d9bede<br>Emulator: RetroArch (VBA-M)
achievement( // F3
    title = "Spring Fun", description = "Find your first bonus level", points = 5,
    id = 9841, badge = "09531", published = "7/4/2014 3:26:29 PM", modified = "7/23/2014 4:42:34 PM",
    trigger = music() == 99 && never(has_fairy())
)

achievement(
    title = "Self-advertisement", description = "Find Hudson's logo", points = 5,
    id = 9842, badge = "09501", published = "7/4/2014 3:26:31 PM", modified = "7/5/2014 2:42:10 PM",
    trigger = byte(0x00C414) == 2 && byte(0x00C40F) == 27
)

achievement(
    title = "Omelette", description = "Get 1UP in Egg Roulette", points = 5,
    id = 9839, badge = "09502", published = "7/4/2014 3:26:26 PM", modified = "7/23/2014 1:19:43 PM",
    trigger = music() == 104 && lives() > prev(lives())
)

achievement(
    title = "Double Hit", description = "Trip over rock and die", points = 5,
    id = 9844, badge = "09526", published = "7/4/2014 3:26:35 PM", modified = "12/13/2019 2:15:40 AM",
    trigger = byte(0x00C421) == 1 && prev(byte(0x00C426)) == 4
)

achievement(
    title = "Skateboarding", description = "Finish any level on Skateboard", points = 5,
    id = 9838, badge = "09529", published = "7/4/2014 3:26:25 PM", modified = "7/23/2014 4:33:08 PM",
    trigger = player_x() >= 80 &&
              ((word(0x00C428) == 20) ||
               (word(0x00C428) == 21))
)

achievement(
    title = "Heady", description = "Have 9 Lives", points = 10,
    id = 9843, badge = "09528", published = "7/4/2014 3:26:33 PM", modified = "10/24/2019 2:24:02 AM",
    trigger = lives() == 9
)

achievement(
    title = "How to tame dinosaurs", description = "Have every item", points = 10,
    id = 9840, badge = "09527", published = "7/4/2014 3:26:28 PM", modified = "10/8/2019 10:15:01 PM",
    trigger = items() >= 1 && byte(0x00C41B) >= 1 && byte(0x00C41C) >= 1 && byte(0x00C41D) >= 1 && 
              byte(0x00C41E) >= 1
)

achievement(
    title = "Yummy!", description = "Get 150.000 points", points = 10,
    id = 9922, badge = "09585", published = "7/5/2014 2:50:06 PM", modified = "1/31/2020 10:14:08 AM",
    trigger = score_10k() >= 21 && current_stage() > 1 &&
              ((current_mode() == 3) ||
               (high4(0x00C400) == 4))
)

achievement(
    title = "Low Score", description = "Win any level without scoring any points!", points = 10,
    id = 9920, badge = "09530", published = "7/5/2014 2:11:43 PM", modified = "1/31/2020 10:14:10 AM",
    trigger = never(score_100() != prev(score_100())) && end_of_stage() == 129 && once(in_level() == 0) && 
              never(score_1() != prev(score_1()))
)

achievement(
    title = "Harmless", description = "Win any level in World 8 without using items", points = 10,
    id = 9919, badge = "09582", published = "7/5/2014 2:11:41 PM", modified = "1/31/2020 10:14:11 AM",
    trigger = current_stage() >= 56 && end_of_stage() == 129 && hammer() == 0 && skateboard() == 0
)

achievement(
    title = "Dinosaur pilot", description = "Get to the last boss on Pterodactyl \"Don-Don\"", points = 25,
    id = 9921, badge = "09583", published = "7/5/2014 2:37:14 PM", modified = "1/31/2020 10:14:12 AM",
    trigger = current_stage() == 62 && skateboard() == 16
)

achievement(
    title = "Dinosaurs are dangerous", description = "Win the game without riding on dinosaurs", points = 50,
    id = 9845, badge = "09584", published = "7/4/2014 3:26:39 PM", modified = "1/31/2020 10:14:14 AM",
    trigger = current_stage() == 64 && once(current_stage() == 0) && never(skateboard() == 4) && 
              never(skateboard() == 8) && never(skateboard() == 12) && never(skateboard() == 16)
)

