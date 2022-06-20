// Harvest Moon 3
// #ID = 5143
//
// MD5: 0ff9df46aca45161d1dfa7eee8509c1f (U)

// $C0A9: 8-bit Global Game State
//        
//        02 - Main Farm
//        04 - In Stables
//        05 - Area North of Farm
//        07 - Grassland
//        0b - PC House
//        0c - Map
//        0d - Village
//        0e - Cliff / Mountains
//        10 - Forest
//        12 - Shipping Bin
//        30 - Game Submenu (When Active)
//        32 - New Game
//        36 - Title Screen / Cutscene
//        37 - Main Menu + SubMenus (After Title Screen)
//        38 - Demo / Tutorial Video
function current_location() => byte(0x00C0A9)
location_main_farm = 0x02
location_field = 0x03
location_in_stables = 0x04
location_pasture = 0x05
location_hot_spring = 0x06
location_grasslands = 0x07
location_farmers_union = 0x08
location_aquarium = 0x09
location_shopping_mall = 0x0A
location_in_house = 0x0B
location_map = 0x0C
location_village = 0x0D
location_cliff = 0x0E
location_forest = 0x10
location_cave = 0x11
location_storage_shed = 0x12
location_mainland_port = 0x14
location_mermaid_cave = 0x15
location_mainland = 0x16
location_boat = 0x17
location_submenu = 0x30
location_snowboarding = 0x31
location_new_game = 0x32
location_cutscene = 0x36 // intro, marriage
location_mainmenu = 0x37
location_demo = 0x38

// $C0AB: 8-bit Rooms
//        
//        [Stables]
//        00-01 - Sheep
//        02-03 - Chicken
//        04-05 - Cow
//        06-07 - Horse
//        
//        [Cutscene]
//        03 - Elder's House
function current_room() => byte(0x00C0AB)
room_sheep1 = 0
room_sheep2 = 1
room_chicken1 = 2
room_chicken2 = 3
room_cow1 = 4
room_cow2 = 5
room_horse1 = 6
room_horse2 = 7
function is_in_sheep_room() => (current_room() >= room_sheep1 && current_room() <= room_sheep2)
function is_in_chicken_room() => (current_room() >= room_chicken1 && current_room() <= room_chicken2)
function is_in_cow_room() => (current_room() >= room_cow1 && current_room() <= room_cow2)
function is_in_horse_room() => (current_room() >= room_horse1 && current_room() <= room_horse2)

// $C700: 8-bit Local State
//        
//        [Title Screen / Main Menu]
//        00 - During Transition
//        01 - Default
//        
//        [New Game]
//        02 - Loading in from Title Screen
//        01 - Boy/Girl
//        02 - Enter Name
//        03 - Outfit Color
//        04 - Birthday
//        05 - Blood Type
//        06 - Pet
//        07 - Pet Name
//        08 - Spouse Name
//        09 - Final Confirmation
//        
//        [Play]
//        01 - Cutscene / Credits Playing

// $C512: planted seeds in horse pasture?

// $C74E: state
function current_state() => byte(0xC74E)
state_game = 0x05
state_intro = 0x06
state_credits = 0x08
state_titles = 0x09
state_marriage = 0x0A
state_demo = 0x0D

// $D406: big gold [total max money = 99000 (pocket) + 990000 (shares) = 10890000]
function current_money() => tbyte(0xD405) + byte(0xD49F) * 10000

function gender() => byte(0xD408)
gender_boy = 0
gender_girl = 1

// $D43E: bits 0 1 2 are all rugs  bit4-yarn maker
//        but5-mayo maker  bit3-sweater maker
//        bit8-
// $D43F: bit3-vase bit4-shelves
// $D443: Saddle and snowboard are somewhere in here
//        bit1=snowboard
// $D444: items around here
//        ff= all 4 medicine,
//        shjampoo, clippers, sprinkler, scarecrow
//        0-clippers, 1=shampoo, 2=horse med 3-sheep med
//        4-med, 5-med, 6-scarecrow, 7-sprinkler
// $D44B: c0=monster egg?
// $D457: more items
//        bit 6 = shovel bit 7=rod

// $D471: Year
function current_year() => byte(0xD471)

// $D472: Season
function current_season() => byte(0xD472)
season_spring = 0
season_summer = 1
season_fall = 2
season_winter = 3

// $D473: Day of season (0-29)
function current_day() => byte(0xD473)

// $D474: Day of week
function current_day_of_week() => byte(0xD474)
day_monday = 0
day_tuesday = 1
day_wednesday = 2
day_thursday = 3
day_friday = 4
day_saturday = 5
day_sunday = 6

// $D475: Hour (time)
function current_hour() => byte(0xD475)

// $D4A3: reputation

// $D4A4: power berries from farming
function power_berries_from_farming() => byte(0xD4A4)

// $D4A5: power berries from other sources
function power_berries_from_other_sources() => byte(0xD4A5)

// $D55F: sickle level
function sickle_level() => byte(0xD55F)

// $D560: hoe level
function hoe_level() => byte(0xD560)

// $D561: axe level
function axe_level() => byte(0xD561)

// $D562: hammer level
function hammer_level() => byte(0xD562)

// $D563: watering can level
function watering_can_level() => byte(0xD563)

// $D564: turnip seed amount
// $D565: potato seeds
// $D566: asparagus seeds
// $D567: tomato seeds
// $D568: corn seeds
// $D569: watermelon seeds
// $D56A: eggplant seeds
// $D56B: peanut seeds
// $D56C: sweet potato seeds
// $D56D: rice seeds
// $D56E: wheat seeds
// $D56F: stardust seeds
// $D570: cherry f. seeds
// $D571: primerose seeds
// $D572: moonlight seeds
// $D573: s.star seeds
// $D574: comet seeds
// $D575: full moon seeds
// $D576: s.dream seeds
// $D577: Grass seed
// $D57A: lumber
function stored_lumber() => word(0xD57A)

// $D57D: fodder
function stored_fodder() => word(0xD57D)

// $D580: item held ?
// $D581: start of bag
// $D590: end of bag
// $D6D6: star of calttle
// $D6FE: start of horses
// $D873: berries
// $D8F5: rice
// $D8F7: golden egg
// $D8FA: Large wool
// $DB7D: carp
// $DB7E: king carp
// $DB7F: Snakehead
// $DB80: Black Bass
// $DB81: bluegill
// $DB82: King salmon
// $DB83: parrotfish
// $DB84: blowfish
// $DB85: dorado
// $DB86: sailfish
// $DB87: coelacanth
// $DB88: archerfish
// $DB89: horned shark
// $DB8A: blue maomao
// $DB8B: pink maomao
// $DB8C: King of Lake

function in_titles() => current_state() == state_titles || current_state() == state_demo || 
                        current_location() == location_mainmenu

// a lot of the fields are initialized in the frame where current_location() changes from
// location_mainmenu to location_in_house when loading a game, so make sure the previous
// frame wasn't in the main menu
function trigger_in_game() => prev(current_location()) < 0x30

function trigger_bitflag(bit) => trigger_in_game() && bit == 1 && prev(bit) == 0

achievement(
    title = "Summer!", description = "A new season arrives", points = 5,
    id = 17404, badge = "16856", published = "11/18/2014 7:00:44 PM", modified = "11/18/2014 7:00:52 PM",
    trigger = current_location() == location_in_house &&
              current_season() == season_summer && current_day() == 0 && current_hour() == 6 &&
              prev(current_day()) == 29
)

achievement(
    title = "Fall!", description = "A new season arrives", points = 5,
    id = 17405, badge = "16857", published = "11/18/2014 7:00:46 PM", modified = "11/18/2014 7:00:53 PM",
    trigger = current_location() == location_in_house &&
              current_season() == season_fall && current_day() == 0 && current_hour() == 6 &&
              prev(current_day()) == 29
)

achievement(
    title = "Winter!", description = "A new season arrives", points = 5,
    id = 17406, badge = "16859", published = "11/18/2014 7:00:48 PM", modified = "11/18/2014 7:00:55 PM",
    trigger = current_location() == location_in_house &&
              current_season() == season_winter && current_day() == 0 && current_hour() == 6 &&
              prev(current_day()) == 29
)

achievement(
    title = "New Year's Resolution", description = "Worked on the farm for a year", points = 10,
    id = 17408, badge = "16861", published = "11/18/2014 7:06:54 PM", modified = "11/18/2014 7:06:56 PM",
    trigger = current_location() == location_in_house &&
              current_year() == 1 && 
              current_season() == season_spring && current_day() == 0 && current_hour() == 6 &&
              prev(current_day()) == 29
)

// NOTE: Girl cannot level up tools!
achievement(
    title = "Grass Slasher", description = "Upgrade your sickle to level 3", points = 10,
    id = 17261, badge = "16786", published = "11/17/2014 6:04:13 AM", modified = "11/20/2014 6:10:33 AM",
    trigger = trigger_in_game() && sickle_level() == 2 && prev(sickle_level()) == 1
)

achievement(
    title = "Dirt Mulcher", description = "Upgrade your hoe to level 3", points = 10,
    id = 17262, badge = "16787", published = "11/17/2014 6:04:15 AM", modified = "11/20/2014 6:07:07 AM",
    trigger = trigger_in_game() && hoe_level() == 2 && prev(hoe_level()) == 1
)

achievement(
    title = "Stump Slayer", description = "Upgrade your ax to level 3", points = 10,
    id = 17263, badge = "16788", published = "11/17/2014 6:04:17 AM", modified = "11/20/2014 6:07:16 AM",
    trigger = trigger_in_game() && axe_level() == 2 && prev(axe_level()) == 1
)

achievement(
    title = "Rock Bopper", description = "Upgrade your hammer to level 3", points = 10,
    id = 17264, badge = "16789", published = "11/17/2014 6:04:18 AM", modified = "11/20/2014 6:07:25 AM",
    trigger = trigger_in_game() && hammer_level() == 2 && prev(hammer_level()) == 1
)

// Ticket 13195: Two times I've tried getting this, no luck yet
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3129: Tried twice to trigger this. Watering can is leveled to 3 but no achievement
// Ticket 2990: I'm gonna check the other upgrade and tell you if it's only the watering can.
achievement(
    title = "Life Bringer", description = "Upgrade your watering can to level 3", points = 10,
    id = 17265, badge = "16790", published = "11/17/2014 6:04:20 AM", modified = "11/20/2014 6:07:33 AM",
    trigger = trigger_in_game() && watering_can_level() == 2 && prev(watering_can_level()) == 1
)

achievement(
    title = "Lumber-Jack", description = "Chop and stash 200 planks of wood", points = 5,
    id = 17411, badge = "16863", published = "11/18/2014 7:14:57 PM", modified = "11/18/2014 7:14:59 PM",
    trigger = trigger_in_game() && stored_lumber() >= 200 && prev(stored_lumber()) < 200
)

achievement(
    title = "Silage Feed", description = "Stash 100 bales of fodder", points = 5,
    id = 17422, badge = "16868", published = "11/18/2014 8:21:29 PM", modified = "11/18/2014 8:21:34 PM",
    trigger = trigger_in_game() && stored_fodder() >= 100 && prev(stored_fodder()) < 100
)

achievement(
    title = "Backyard Sauna", description = "Dig the hot spring", points = 5,
    id = 17420, badge = "16867", published = "11/18/2014 8:15:36 PM", modified = "11/18/2014 8:15:39 PM",
    trigger = current_location() == location_hot_spring &&
              trigger_bitflag(bit6(0xD448))
)

achievement(
    title = "Let's Go Fishing!", description = "Get the fishing rod", points = 5,
    id = 17426, badge = "16872", published = "11/18/2014 9:06:59 PM", modified = "11/18/2014 9:07:03 PM",
    trigger = trigger_bitflag(bit7(0xD457))
)

function chicken_sprite(index) => byte(0xD6B0 + index * 5)
chicken_sprite_golden = 1

achievement(
    title = "Poultry Commodity", description = "Get a golden chicken", points = 10,
    id = 17462, badge = "16924", published = "11/20/2014 1:34:03 AM", modified = "11/20/2014 6:03:49 AM",
    trigger = trigger_in_game() && 
              byte(0xD43F) != 255 && byte(0xD6AE) > 191 &&
              any_of(range(0,7), i => chicken_sprite(i) == chicken_sprite_golden && 
                                      prev(chicken_sprite(i)) != chicken_sprite_golden)
)

// Ticket 29851: Triggers as soon as you start the game as the girl. Probably because she starts the game 
//               with a full grown cow.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
//               Emulator: RetroArch (Gamebatte)
function is_cow_in_stable(index) => byte(0xD6D6 + index * 5)
function have_no_cows() => sum_of(range(0,7), i => is_cow_in_stable(i)) == 0
function cow_sprite(index) => byte(0xD6D7 + index * 5)
cow_sprite_adult = 0
cow_sprite_older_calf = 1
cow_sprite_newborn_calf = 2
cow_sprite_pregnant = 3
function cow_status(index) => byte(0xD6DA + index * 5)
cow_status_unfed = 0x00
cow_status_birth_tomorrow = 0x1D
cow_status_older_tomorrow = 0x0C
cow_status_adult_tomorrow = 0x14
function cow_becomes_adult(index) => is_cow_in_stable(index) != 0 &&
                                     once(cow_sprite(index) == cow_sprite_older_calf) &&
                                     once(prev(cow_status(index)) == cow_status_adult_tomorrow &&
                                     cow_status(index) == cow_status_unfed &&
                                     cow_sprite(index) == cow_sprite_adult)
achievement(
    title = "COW!", description = "Raise a calf into an adult cow", points = 5,
    id = 17464, badge = "16927", published = "11/20/2014 2:20:17 AM", modified = "11/22/2020 12:36:38 AM",
    trigger = current_location() == location_in_stables && is_in_cow_room() && 
              never(have_no_cows()) &&
              any_of(range(0,7), i => cow_becomes_adult(i))
)

// Ticket 29850: Triggered as soon as I started the game as the girl. 
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
//               Emulator: RetroArch (Gamebatte)
achievement(
    title = "Kickstart My Funds", description = "Find the secret savings on the first day", points = 5,
    id = 17460, badge = "16916", published = "11/19/2014 11:54:28 PM", modified = "11/21/2020 10:05:59 AM",
    trigger = current_location() == location_in_house &&
              current_year() == 0 && current_season() == season_spring && current_day() == 0 && 
              trigger_bitflag(bit7(0xD445))
)

// Ticket 13183: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3126: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2991: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 853: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Custom Crib", description = "Buy the crib", points = 5,
    id = 17451, badge = "16896", published = "11/18/2014 10:22:29 PM", modified = "11/18/2014 10:22:34 PM",
    trigger = trigger_bitflag(bit5(0xD43F))
)

// Ticket 13184: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3127: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2992: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 854: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Massive Storage", description = "Buy the kitchen cabinet", points = 5,
    id = 17452, badge = "16895", published = "11/18/2014 10:22:30 PM", modified = "11/18/2014 10:22:36 PM",
    trigger = trigger_bitflag(bit4(0xD43F))
)

achievement( // F4
    title = "Spruce Up the Place", description = "Buy the vase", points = 5,
    id = 17453, badge = "16894", published = "11/18/2014 10:22:32 PM", modified = "11/20/2014 6:24:55 AM",
    trigger = trigger_bitflag(bit3(0xD43F))
)

// Ticket 13185: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3128: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2993: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 855: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Compost", description = "Buy the fertilizer machine", points = 5,
    id = 17454, badge = "16897", published = "11/18/2014 10:26:16 PM", modified = "11/18/2014 10:39:29 PM",
    trigger = trigger_bitflag(bit6(0xD43F))
)

achievement(
    title = "Entertainment System", description = "Buy the television", points = 5,
    id = 17455, badge = "16898", published = "11/18/2014 10:26:18 PM", modified = "11/20/2014 5:51:18 AM",
    trigger = trigger_bitflag(bit7(0xD43F))
)

achievement(
    title = "Carpet Connoisseur", description = "Buy all three rugs", points = 5,
    id = 17456, badge = "16900", published = "11/18/2014 10:40:44 PM", modified = "11/20/2014 6:25:21 AM",
    trigger = bit0(0xD43E) == 1 && bit1(0xD43E) == 1 && bit2(0xD43E) == 1 &&
              (trigger_bitflag(bit0(0xD43E)) ||
               trigger_bitflag(bit1(0xD43E)) ||
               trigger_bitflag(bit2(0xD43E)))
)

achievement(
    title = "Full Coop", description = "Have a full barn of 8 chickens", points = 10,
    id = 17463, badge = "16925", published = "11/20/2014 1:45:12 AM", modified = "11/20/2014 4:09:07 AM",
    trigger = trigger_in_game() &&
              all_of(range(0,7), i => bit7(0xD6AE + i * 5) == 1) &&    // all chickens alive
              any_of(range(0,7), i => prev(bit7(0xD6AE + i * 5)) == 0) // at leave one previously not alive
)

achievement(
    title = "Full Barn", description = "Have a full barn of 8 cattle", points = 10,
    id = 17465, badge = "16928", published = "11/20/2014 2:20:19 AM", modified = "11/20/2014 2:20:23 AM",
    trigger = trigger_in_game() &&
              all_of(range(0,7), i => bit7(0xD6D6 + i * 5) == 1) &&    // all sheep alive
              any_of(range(0,7), i => prev(bit7(0xD6D6 + i * 5)) == 0) // at leave one previously not alive
)

achievement(
    title = "Racing Arsenal", description = "Have a full stable of 8 horses", points = 10,
    id = 17471, badge = "16949", published = "11/20/2014 4:03:06 AM", modified = "11/20/2014 4:03:10 AM",
    trigger = trigger_in_game() &&
              all_of(range(0,7), i => bit7(0xD6FE + i * 5) == 1) &&    // all chickens alive
              any_of(range(0,7), i => prev(bit7(0xD6FE + i * 5)) == 0) // at leave one previously not alive
)

achievement(
    title = "Flock Family", description = "Have a full barn of 8 sheep", points = 10,
    id = 17472, badge = "16956", published = "11/20/2014 4:03:08 AM", modified = "11/20/2014 4:03:12 AM",
    trigger = trigger_in_game() &&
              all_of(range(0,7), i => bit7(0xD686 + i * 5) == 1) &&    // all sheep alive
              any_of(range(0,7), i => prev(bit7(0xD686 + i * 5)) == 0) // at leave one previously not alive
)

achievement(
    title = "Prize Chicken", description = "Collect and store a golden egg", points = 5,
    id = 17466, badge = "16929", published = "11/20/2014 2:45:25 AM", modified = "11/20/2014 6:26:08 AM",
    trigger = trigger_in_game() && 
              byte(0xD8F7) > prev(byte(0xD8F7))
)

achievement(
    title = "Prize Sheep", description = "Collect and store a large wool", points = 5,
    id = 17467, badge = "16930", published = "11/20/2014 2:53:30 AM", modified = "11/20/2014 6:11:24 AM",
    trigger = trigger_in_game() && 
              byte(0xD8FA) > prev(byte(0xD8FA))
)

achievement(
    title = "Tangy Zip", description = "Buy the mayonnaise maker", points = 5,
    id = 17468, badge = "16937", published = "11/20/2014 3:29:38 AM", modified = "11/20/2014 6:27:55 AM",
    trigger = trigger_bitflag(bit5(0xD43E))
)

achievement(
    title = "Weave It", description = "Buy the yarn maker", points = 5,
    id = 17469, badge = "16938", published = "11/20/2014 3:35:27 AM", modified = "11/20/2014 6:27:58 AM",
    trigger = trigger_bitflag(bit4(0xD43E))
)

achievement(
    title = "Winter-Proof", description = "Buy the sweater maker", points = 5,
    id = 17470, badge = "16939", published = "11/20/2014 3:35:29 AM", modified = "11/20/2014 6:28:00 AM",
    trigger = trigger_bitflag(bit3(0xD43E))
)

achievement(
    title = "Gastolen!", description = "Buy the butter churn", points = 5,
    id = 17474, badge = "16962", published = "11/20/2014 5:33:46 AM", modified = "11/20/2014 6:28:02 AM",
    trigger = trigger_bitflag(bit7(0xD43E))
)

achievement(
    title = "Nacho Farmer", description = "Buy the cheese maker", points = 5,
    id = 17475, badge = "16964", published = "11/20/2014 5:33:48 AM", modified = "11/20/2014 6:28:05 AM",
    trigger = trigger_bitflag(bit6(0xD43E))
)

achievement(
    title = "Make It Rain... Literally", description = "Purchase the sprinkler", points = 10,
    id = 17267, badge = "16792", published = "11/17/2014 6:22:03 AM", modified = "11/20/2014 6:28:07 AM",
    trigger = trigger_bitflag(bit7(0xD444))
)

achievement(
    title = "Yard Creeper", description = "Purchase the scarecrow", points = 10,
    id = 17268, badge = "16793", published = "11/17/2014 6:22:04 AM", modified = "11/20/2014 6:28:14 AM",
    trigger = trigger_bitflag(bit6(0xD444))
)

achievement(
    title = "Communications Monster", description = "Gain the ability to speak with your animals", points = 10,
    id = 17476, badge = "16965", published = "11/20/2014 5:50:50 AM", modified = "11/20/2014 5:57:23 AM",
    trigger = trigger_in_game() && byte(0xD44B) >= 0xFC && prev(byte(0xD44B)) < 0xFC
)

achievement(
    title = "Take Some Time Off", description = "Get the snowboard", points = 5,
    id = 17459, badge = "16915", published = "11/19/2014 11:40:58 PM", modified = "11/20/2014 6:28:29 AM",
    trigger = trigger_bitflag(bit1(0xD443))
)

achievement(
    title = "Starting the Secret Garden", description = "Dig up a power berry", points = 5,
    id = 17461, badge = "16918", published = "11/20/2014 12:01:25 AM", modified = "11/20/2014 6:28:38 AM",
    trigger = trigger_in_game() && 
              power_berries_from_farming() > prev(power_berries_from_farming())
)

achievement(
    title = "Power Berries", description = "Fill the secret garden", points = 25,
    id = 17418, badge = "16866", published = "11/18/2014 7:28:21 PM", modified = "11/20/2014 4:09:53 AM",
    trigger = trigger_in_game() && 
              prev(byte(0xD4A4)) + prev(byte(0xD4A5)) == 9 &&
              measured(byte(0xD4A4) +      // power berries from farming
                       byte(0xD4A5) == 10) // other power berries
)

// Ticket 17845: Triggered after loading my game in the farm field(the place where you plant plants). 
//               it was the first time i loaded a game.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
//               Emulator: RAVBA
// Ticket 36722: Playing as the Boy, married to the Girl on Fall 10 of the first year, and the achievement 
//               didn't trigger.  I didn't notice until after I'd already saved, now it's Fall 21 and it 
//               still hasn't triggered.
//               MD5: Unknown
//               Emulator: RetroArch (Game Boy Advance (VBA-M))
// Ticket 36780: Boy marries Girl.  Does not trigger.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
//               Emulator: RetroArch (mGBA)
achievement(
    title = "Holy Matrimony", description = "Get married", points = 25,
    id = 17473, badge = "16957", published = "11/20/2014 4:08:19 AM", modified = "11/21/2020 7:29:56 PM",
    trigger = current_location() == location_cutscene &&
              current_state() == state_marriage &&
              word(0xC76E) == 0x0502 // kissing frame of animation
)

function trigger_aquarium(addr, count) => trigger_in_game() && byte(addr) == count && prev(byte(addr)) == count - 1

achievement(
    title = "Carp", description = "Have 2 carp at the aquarium", points = 5,
    id = 17435, badge = "16874", published = "11/18/2014 9:52:57 PM", modified = "11/18/2014 9:53:34 PM",
    trigger = trigger_aquarium(0xDB7D, 2)
)

achievement(
    title = "King Carp", description = "Have 3 king carp at the aquarium", points = 5,
    id = 17436, badge = "16875", published = "11/18/2014 9:52:59 PM", modified = "11/18/2014 9:53:35 PM",
    trigger = trigger_aquarium(0xDB7E, 3)
)

achievement(
    title = "Bluegill", description = "Have 3 bluegill at the aquarium", points = 5,
    id = 17437, badge = "16876", published = "11/18/2014 9:53:02 PM", modified = "11/18/2014 9:53:36 PM",
    trigger = trigger_aquarium(0xDB81, 3)
)

achievement(
    title = "Snakehead", description = "Have 3 snakehead at the aquarium", points = 5,
    id = 17438, badge = "16877", published = "11/18/2014 9:53:04 PM", modified = "11/18/2014 9:53:38 PM",
    trigger = trigger_aquarium(0xDB7F, 3)
)

achievement(
    title = "Black Bass", description = "Have 3 black bass at the aquarium", points = 5,
    id = 17439, badge = "16878", published = "11/18/2014 9:53:06 PM", modified = "11/18/2014 9:53:40 PM",
    trigger = trigger_aquarium(0xDB80, 3)
)

achievement(
    title = "Parrotfish", description = "Have 3 parrotfish at the aquarium", points = 5,
    id = 17440, badge = "16881", published = "11/18/2014 9:53:08 PM", modified = "11/18/2014 9:53:41 PM",
    trigger = trigger_aquarium(0xDB83, 3)
)

achievement(
    title = "Blowfish", description = "Have 3 blowfish at the aquarium", points = 5,
    id = 17441, badge = "16880", published = "11/18/2014 9:53:11 PM", modified = "11/18/2014 9:53:42 PM",
    trigger = trigger_aquarium(0xDB84, 3)
)

achievement(
    title = "Blue Maomao", description = "Have 3 blue maomao at the aquarium", points = 5,
    id = 17442, badge = "16891", published = "11/18/2014 9:53:15 PM", modified = "11/18/2014 9:53:44 PM",
    trigger = trigger_aquarium(0xDB8A, 3)
)

achievement(
    title = "Pink Maomao", description = "Have 3 pink maomao at the aquarium", points = 5,
    id = 17443, badge = "16890", published = "11/18/2014 9:53:18 PM", modified = "11/18/2014 9:53:45 PM",
    trigger = trigger_aquarium(0xDB8B, 3)
)

achievement(
    title = "Dorado", description = "Have 3 dorado at the aquarium", points = 5,
    id = 17444, badge = "16882", published = "11/18/2014 9:53:20 PM", modified = "11/18/2014 9:53:47 PM",
    trigger = trigger_aquarium(0xDB85, 3)
)

achievement(
    title = "Horned Shark", description = "Have 3 horned shark at the aquarium", points = 5,
    id = 17445, badge = "16883", published = "11/18/2014 9:53:22 PM", modified = "11/18/2014 9:53:49 PM",
    trigger = trigger_aquarium(0xDB89, 3)
)

achievement(
    title = "Sailfish", description = "Have 3 sailfish at the aquarium", points = 5,
    id = 17446, badge = "16885", published = "11/18/2014 9:53:24 PM", modified = "11/18/2014 9:53:50 PM",
    trigger = trigger_aquarium(0xDB86, 3)
)

achievement(
    title = "Archerfish", description = "Have 3 archerfish at the aquarium", points = 5,
    id = 17447, badge = "16886", published = "11/18/2014 9:53:26 PM", modified = "11/18/2014 9:53:51 PM",
    trigger = trigger_aquarium(0xDB88, 3)
)

achievement(
    title = "Coelacanth", description = "Have 3 coelacanth at the aquarium", points = 5,
    id = 17448, badge = "16888", published = "11/18/2014 9:53:28 PM", modified = "11/18/2014 9:53:53 PM",
    trigger = trigger_aquarium(0xDB87, 3)
)

achievement(
    title = "King Salmon", description = "Have 1 king salmon at the aquarium", points = 5,
    id = 17449, badge = "16892", published = "11/18/2014 9:53:29 PM", modified = "11/18/2014 10:02:57 PM",
    trigger = trigger_aquarium(0xDB82, 1)
)

achievement(
    title = "King of the Lake", description = "Have 1 king of the lake at the aquarium", points = 5,
    id = 17450, badge = "16893", published = "11/18/2014 9:53:31 PM", modified = "11/18/2014 10:03:05 PM",
    trigger = trigger_aquarium(0xDB8C, 1)
)

achievement(
    title = "River Legend", description = "Have at least one of every species of fish at the aquarium", points = 10,
    id = 17428, badge = "16873", published = "11/18/2014 9:12:05 PM", modified = "11/20/2014 6:01:26 AM",
    trigger = trigger_in_game() &&
              bit7(0xD457) == 1 && // have fishing pole
              never(in_titles()) &&
              measured(tally_of(range(0xDB7D,0xDB8C), 16, addr => once(byte(addr) > 0))) &&
              any_of(range(0xDB7D,0xDB8C), addr => prev(byte(addr)) == 0)
)

SeasonLookup = {
    season_spring: "Spring",
    season_summer: "Summer",
    season_fall: "Fall",
    season_winter: "Winter",
}

DayLookup = {
    0x00: "1st",
    0x01: "2nd",
    0x02: "3rd",
    0x03: "4th",
    0x04: "5th",
    0x05: "6th",
    0x06: "7th",
    0x07: "8th",
    0x08: "9th",
    0x09: "10th",
    0x0a: "11th",
    0x0b: "12th",
    0x0c: "13th",
    0x0d: "14th",
    0x0e: "15th",
    0x0f: "16th",
    0x10: "17th",
    0x11: "18th",
    0x12: "19th",
    0x13: "20th",
    0x14: "21st",
    0x15: "22nd",
    0x16: "23rd",
    0x17: "24th",
    0x18: "25th",
    0x19: "26th",
    0x1a: "27th",
    0x1b: "28th",
    0x1c: "29th",
    0x1d: "30th",
}

ActivityLookup = {
    location_new_game: "Starting a new game",
    location_main_farm: "At the farm",
    location_field: "Tending the field",
    location_in_stables: "In the stables",
    location_pasture: "In the pasture",
    location_hot_spring: "At the hot spring",
    location_grasslands: "At the grasslands",
    location_farmers_union: "At the Farmers' Union",
    location_aquarium: "At the aquarium",
    location_shopping_mall: "At the shopping mall",
    location_in_house: "In the house",
    location_map: "Travelling",
    location_village: "Visiting the village",
    location_cliff: "At the mountainside", // cliff and outside cave
    location_forest: "In the forest",
    location_cave: "In a cave",
    location_storage_shed: "In the storage shed",
    location_cutscene: "Watching a cutscene",
    location_mainland_port: "On the mainland",
    location_mainland: "On the mainland",
    location_mermaid_cave: "Visiting the mermaid",
    location_boat: "Travelling",
    location_snowboarding: "Snowboarding",
}

DayOfWeekLookup = {
    day_monday: "Monday",
    day_tuesday: "Tuesday",
    day_wednesday: "Wednesday",
    day_thursday: "Thursday",
    day_friday: "Friday",
    day_saturday: "Saturday",
    day_sunday: "Sunday",
}

TimeOfDayLookup = {
    6: "6AM",
    7: "7AM",
    8: "8AM",
    9: "9AM",
    10: "10AM",
    11: "11AM",
    12: "12PM",
    13: "1PM",
    14: "2PM",
    15: "3PM",
    16: "4PM",
    17: "5PM",
    18: "6PM",
    19: "7PM",
    20: "8PM",
    21: "9PM",
    22: "10PM",
    23: "11PM",
    24: "12AM",
}

rich_presence_conditional_display(in_titles(), "Titles")

rich_presence_conditional_display(current_location() >= location_new_game && current_state() <= state_intro, 
                                  "Starting a new game")

rich_presence_conditional_display(current_location() == location_submenu, "{0}, {1}G | {2} of {3}, Year {4}",
    rich_presence_lookup("Activity", prior(current_location()), ActivityLookup),
    rich_presence_value("Money", current_money()),
    rich_presence_lookup("Day", current_day(), DayLookup),
    rich_presence_lookup("Season", current_season(), SeasonLookup),
    rich_presence_value("Year", current_year() + 1)
)

rich_presence_display("{0}, {1}G | {2} of {3}, Year {4}",
//rich_presence_display("{0}, {1}G | {2} of {3}, Year {4} | {5} {6}",
    rich_presence_lookup("Activity", current_location(), ActivityLookup),
    rich_presence_value("Money", current_money()),
    rich_presence_lookup("Day", current_day(), DayLookup),
    rich_presence_lookup("Season", current_season(), SeasonLookup),
    rich_presence_value("Year", current_year() + 1),
    rich_presence_lookup("DayOfWeek", current_day_of_week(), DayOfWeekLookup),
    rich_presence_lookup("TimeOfDay", current_hour(), TimeOfDayLookup)
)

// --------------------------------------------------------
// Day 1
// [girl starts with 2000g, cow, and 1 each of carp and king carp already donated to aquarium]
// * Kickstart My Funds - examine the fireplace
// * Backyard Sauna - dig the hot springs
// * Planting the Secret Garden - find a power berry by hoeing the ground

// 15 Spring [Save A]
// * Yard Creeper - buy a scarecrow

// 30 Spring [Save B]
// * Summer! - reach first day of summer

// 30 Summer [Save C]
// * Fall! - reach first day of fall
// * Silage Feed - chop down all the grass behind the chicken coop

// 18 Fall [Save D]
// * Full Coop - have 8 chickens

// 30 Fall [Save E]
// * Winter! - reach first day of winter

// 30 Winter [Save F]
// * New Year's Resolution - reach first day of spring
// * Let's Go Fishing - towards the end of the season, lend your hammer to Billy. He'll give you the
//                      fishing pole when he returns the hammer.

// 5 Summer [Save G]
// * Snakehead - donate 3 snakeheads to aquarium
// * Black Bass - donate 3 black bass to aquarium
// * King Salmon - donate 1 king salmon to aquarium
// * King of the Lake - donate 1 king of the lake to the aquarium

// 8 Summer [Save H]
// * Blue Maomao - donate 3 blue maomao to the aquarium
// * Pink Maomao - donate 3 pink maomao to the aquarium
// * Blowfish - donate 3 blowfish to the aquarium
// * Parrotfish - donate 3 parrotfish to the aquarium

// 15 Summer [Save I] - only have 58000, can't do all of these
// * Make it Rain... Literally - buy the sprinkler (50000)
// * Tangy Zip - buy mayonaisse maker (30000)
// * Carpet Conossieur - buy all three carpets (3000 + 6000 + 9000)
// * Entertainment System - buy the TV (10000)

// 30 Summer [Save J]
// * Compost - buy the fertilizer machine (95% of money) and wait three days

// 12 Fall [Save K]
// * Prize Chicken - collect and store a golden egg

// 29 Fall [Save L]
// * COW! - raise a calf into a cow
// * Take Some Time Off - buy the snowboard (go into town any day in winter, 30000g)

// 11 Winter [Save M]
// * Bluegill - donate 3 bluegill to the aquarium
// * Horned Shark - donate 3 horned sharks to the aquarium
// * Archerfish - donate 3 archerfish to the aquarium
// * Coelacanth - donate 3 coelacanth to the aquarium
// * Dorado - donate 3 dorado to the aquarium

// 15 Winter [Save N]
// * Sailfish - donate 3 sailfish to the aquarium
// * River Legend - have at least one of every species of fish at the aquarium

// 19 Winter [Save O]
// * Power Berries - talk to the mermaid to collect the last power berry

// 20 Winter [Save P]
// * Wedding - get married (automatic after sleep)

// --------------------------------------------------------
// Day 1
// [boy starts with 1000g, and 1 each of turnip, potato, and asparagus seeds]
// * Kickstart My Funds - examine the fireplace
// * Backyard Sauna - dig the hot springs
// * Planting the Secret Garden - find a power berry by hoeing the ground
// * Dirt Mulcher - hoe up most of the field
// * Yard Creeper - buy a scarecrow

// 30 Spring [Save Q]
// * Summer! - reach first day of summer
// * Silage Feed - stash 100 bails of silage (harvest the sheep pasture)

// 19 Summer [Save R]
// * Let's Go Fishing - talk to Billy and get the fishing rod
// * Lumber-Jack - chop down a stump
// * Grass Slasher - use the sickle on some weeds
// * Rock Bopper - use the hammer on a rock

// 30 Summer [Save S]
// * Fall! - reach first day of fall
// * Stump Slayer - chop down a stump

// 7 Fall [Save T]
// * Snakehead - donate 3 snakeheads to aquarium
// * Black Bass - donate 3 black bass to aquarium
// * Bluegill - donate 3 bluegill to the aquarium
// * King Salmon - donate 1 king salmon to aquarium

// 16 Fall [Save U]
// * Holy Matrimony- automatic in the morning
// on 18 Fall: (can fish from town)
// * Blue Maomao - donate 3 blue maomao to the aquarium
// * Pink Maomao - donate 3 pink maomao to the aquarium
// * Blowfish - donate 3 blowfish to the aquarium
// * Parrotfish - donate 3 parrotfish to the aquarium
// * Spruce Up the Place - buy the vase (3000)
// * Entertainment System - buy the TV (10000)
// * Carpet Conossieur - buy all three carpets (3000 + 6000 + 9000)

// 30 Fall [Save V]
// * Winter! - reach first day of winter
// * Horned Shark - donate 3 horned sharks to the aquarium
// * Archerfish - donate 3 archerfish to the aquarium
// * Coelacanth - donate 3 coelacanth to the aquarium
// * Dorado - donate 3 dorado to the aquarium
// * Sailfish - donate 3 sailfish to the aquarium

// 8 Win [Save W]
// * Compost - buy the fertilizer machine (95% of money) and wait three days
// * Custom Crib - buy the crib (30000)

// 25 Win [Save X]
// * COW! - raise a calf into a cow
// * Take Some Time Off - buy the snowboard (15000g)
// * New Year's Resolution - reach first day of spring
// * King of the Lake - donate 1 king of the lake to the aquarium (get quest from aquarium on or after 1 Spr)
// * River Legend - have at least one of every species of fish at the aquarium

// 11 Fall [Save Y]
// * Flock Family - have 8 sheep in the barn
// * Full Barn - have 8 cows in the barn
// * Prize Sheep - have partner do "anything", then visit the sheep's pen
// * Tangy Zip - buy mayonaisse maker (30000)
// * COW! - raise a calf into a cow [14th Fall]
// * Racing Arsenal - buy one horse, and a baby will be born on 16th Fall

// 18 Fall [Save Z]
// * Prize Chicken - collect and store a golden egg
// * Full Coop - have 8 chickens (26 Fall)

// 30 Winter [Save ZA]
// * Power Berries - hit at least 20 logs or trees while snowboarding at the grasslands

// Good Ending Requirements (https://www.speedrun.com/hm3gbc/guide/gki1o)
// * 3 of each animal, at least 300 items shipped, married, farmer reputation of at least 50.
//   have to do farmer union jobs to raise reputation

// 30 Spring [Save ZB]
// * Gastolen - buy the butter churn
// * Nacho Farmer - buy the cheese maker
// * Weave It - buy the yarn maker
// * Winter-Proof - but the sweater maker
// * Make It Rain... Literally - buy the sprinkler

// * Massive Storage
