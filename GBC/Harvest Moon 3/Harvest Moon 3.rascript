// Harvest Moon 3
// #ID = 5143
//
// MD5: 0ff9df46aca45161d1dfa7eee8509c1f (U)

// $C512: planted seeds in horse pasture?
// $D406: big gold
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

// $D472: Season?
//        00=spring, etc.
function current_season() => byte(0x00D472)

// $D473: Day display
//        1d=30th

// $D473: Day display
//        1d=30th
function current_day() => byte(0x00D473)

// $D474: Day of week
function current_day_of_week() => byte(0x00D474)

// $D475: Hour (time)
function current_hour() => byte(0x00D475)

// $D4A3: reputation

// $D562: hammer level
function hammer_level() => byte(0x00D562)

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
//        !!!!!
// $D57A: lumber
// $D57D: fodder
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

function trigger_in_game() => word(0x00D000) != 0 && current_hour() > 5 && current_day_of_week() < 8

achievement(
    title = "Summer!", description = "A new season arrives.", points = 5,
    id = 17404, badge = "16856", published = "11/18/2014 7:00:44 PM", modified = "11/18/2014 7:00:52 PM",
    trigger = current_season() == 1 && current_day() == 0 && current_hour() == 6
)

achievement(
    title = "Fall!", description = "A new season arrives.", points = 5,
    id = 17405, badge = "16857", published = "11/18/2014 7:00:46 PM", modified = "11/18/2014 7:00:53 PM",
    trigger = current_season() == 2 && current_day() == 0 && current_hour() == 6
)

achievement(
    title = "Winter!", description = "A new season arrives.", points = 5,
    id = 17406, badge = "16859", published = "11/18/2014 7:00:48 PM", modified = "11/18/2014 7:00:55 PM",
    trigger = current_season() == 3 && current_day() == 0 && current_hour() == 6
)

achievement(
    title = "New Year's Resolution", description = "Worked on the farm for a year.", points = 10,
    id = 17408, badge = "16861", published = "11/18/2014 7:06:54 PM", modified = "11/18/2014 7:06:56 PM",
    trigger = byte(0x00D471) == 1 && current_season() == 0 && current_day() == 0 && current_day_of_week() >= 0 && 
              current_day_of_week() < 9 && current_hour() == 6
)

achievement(
    title = "Grass Slasher", description = "Upgrade your Sickle to Level 3.", points = 10,
    id = 17261, badge = "16786", published = "11/17/2014 6:04:13 AM", modified = "11/20/2014 6:10:33 AM",
    trigger = byte(0x00D55F) == 2 && trigger_in_game()
)

achievement(
    title = "Dirt Mulcher", description = "Upgrade your Hoe to Level 3.", points = 10,
    id = 17262, badge = "16787", published = "11/17/2014 6:04:15 AM", modified = "11/20/2014 6:07:07 AM",
    trigger = byte(0x00D560) == 2 && trigger_in_game()
)

achievement(
    title = "Stump Slayer", description = "Upgrade your Axe to Level 3.", points = 10,
    id = 17263, badge = "16788", published = "11/17/2014 6:04:17 AM", modified = "11/20/2014 6:07:16 AM",
    trigger = byte(0x00D561) == 2 && trigger_in_game()
)

achievement(
    title = "Rock Bopper", description = "Upgrade your Hammer to Level 3.", points = 10,
    id = 17264, badge = "16789", published = "11/17/2014 6:04:18 AM", modified = "11/20/2014 6:07:25 AM",
    trigger = hammer_level() == 2 && trigger_in_game()
)

// Ticket 13195: Two times I've tried getting this, no luck yet
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3129: Tried twice to trigger this. Watering can is leveled to 3 but no achievement
// Ticket 2990: I'm gonna check the other upgrade and tell you if it's only the watering can.
achievement(
    title = "Life Bringer", description = "Upgrade your Watering Can to Level 3.", points = 10,
    id = 17265, badge = "16790", published = "11/17/2014 6:04:20 AM", modified = "11/20/2014 6:07:33 AM",
    trigger = byte(0x00D563) == 2 && trigger_in_game()
)

achievement(
    title = "Lumber-Jack", description = "Chop and stash 200 planks of wood.", points = 5,
    id = 17411, badge = "16863", published = "11/18/2014 7:14:57 PM", modified = "11/18/2014 7:14:59 PM",
    trigger = byte(0x00D57A) > 199 && byte(0x00D57A) < 207 && hammer_level() < 4
)

achievement(
    title = "Silage Feed", description = "Stash 100 bales of fodder.", points = 5,
    id = 17422, badge = "16868", published = "11/18/2014 8:21:29 PM", modified = "11/18/2014 8:21:34 PM",
    trigger = byte(0x00D577) < 20 && byte(0x00D57D) == 64
)

achievement(
    title = "Backyard Sauna", description = "Dig the Hot Spring.", points = 5,
    id = 17420, badge = "16867", published = "11/18/2014 8:15:36 PM", modified = "11/18/2014 8:15:39 PM",
    trigger = byte(0x00DA54) == 3 && byte(0x00DA55) == 3 && byte(0x00DA56) == 3 && byte(0x00DA57) == 3 && 
              byte(0x00DA58) == 3 && byte(0x00DA59) == 3 && byte(0x00DA5A) == 3 && byte(0x00DA5B) == 3 && 
              byte(0x00DA5C) == 1 && bit6(0x00D457) == 1
)

achievement(
    title = "Let's Go Fishing!", description = "Get the Fishing Rod.", points = 5,
    id = 17426, badge = "16872", published = "11/18/2014 9:06:59 PM", modified = "11/18/2014 9:07:03 PM",
    trigger = bit7(0x00D457) == 1 && trigger_in_game()
)

achievement(
    title = "Poultry Commodity", description = "Get a Golden Chicken.", points = 10,
    id = 17462, badge = "16924", published = "11/20/2014 1:34:03 AM", modified = "11/20/2014 6:03:49 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D6AE) > 191 &&
              ((byte(0x00D6B0) == 1) ||
               (byte(0x00D6B5) == 1) ||
               (byte(0x00D6BA) == 1) ||
               (byte(0x00D6BF) == 1) ||
               (byte(0x00D6C4) == 1) ||
               (byte(0x00D6C9) == 1) ||
               (byte(0x00D6CE) == 1) ||
               (byte(0x00D6D3) == 1))
)

achievement(
    title = "COW!", description = "Raise a Calf into an Adult Cow.", points = 5,
    id = 17464, badge = "16927", published = "11/20/2014 2:20:17 AM", modified = "11/20/2014 2:20:21 AM",
    trigger = trigger_in_game() && bit7(0xD6D6) == 1 && // have cow
                                   byte(0xD6D7) == 0    // adult
)

achievement(
    title = "Kickstart My Funds", description = "Find the Secret Savings on Spring - Day 1.", points = 5,
    id = 17460, badge = "16916", published = "11/19/2014 11:54:28 PM", modified = "11/19/2014 11:54:30 PM",
    trigger = current_season() == 0 && current_day() == 0 && current_day_of_week() == 0 && byte(0x00D406) == 7 && 
              byte(0x00D405) == 208 && current_hour() > 5
)

// Ticket 13183: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3126: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2991: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 853: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Custom Crib", description = "Buy the [Crib].", points = 5,
    id = 17451, badge = "16896", published = "11/18/2014 10:22:29 PM", modified = "11/18/2014 10:22:34 PM",
    trigger = bit5(0x00D43F) == 1 && trigger_in_game() && current_season() < 4 && current_day() < 30
)

// Ticket 13184: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3127: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2992: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 854: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Massive Storage", description = "Buy the [Shelves].", points = 5,
    id = 17452, badge = "16895", published = "11/18/2014 10:22:30 PM", modified = "11/18/2014 10:22:36 PM",
    trigger = bit4(0x00D43F) == 1 && trigger_in_game() && current_season() < 4 && current_day() < 30
)

achievement( // F4
    title = "Spruce Up The Place", description = "Buy the [Vase].", points = 5,
    id = 17453, badge = "16894", published = "11/18/2014 10:22:32 PM", modified = "11/20/2014 6:24:55 AM",
    trigger = bit3(0x00D43F) == 1 && trigger_in_game() && current_season() < 4 && current_day() < 30
)

// Ticket 13185: Triggered among others at the same time while opening the menu.
//               MD5: 0ff9df46aca45161d1dfa7eee8509c1f
// Ticket 3128: Custom Crib unlocked when loading a save, the other2 as I was walking through a barn.
// Ticket 2993: triggered when I woke up the first saturday spring 6 after passing midnight
// Ticket 855: Activate when I enter in the Cow's Barn for first time
achievement(
    title = "Compost", description = "Buy the [Fertilizer Machine].", points = 5,
    id = 17454, badge = "16897", published = "11/18/2014 10:26:16 PM", modified = "11/18/2014 10:39:29 PM",
    trigger = bit6(0x00D43F) == 1 && trigger_in_game() && current_season() < 4 && current_day() < 30
)

achievement(
    title = "Entertainment System", description = "Buy the [TV].", points = 5,
    id = 17455, badge = "16898", published = "11/18/2014 10:26:18 PM", modified = "11/20/2014 5:51:18 AM",
    trigger = current_season() < 4 && current_day() < 30 && bit7(0x00D43F) == 1 && byte(0x00D43F) != 255
)

achievement(
    title = "Carpet Connoisseur", description = "Buy all three [Rugs].", points = 10,
    id = 17456, badge = "16900", published = "11/18/2014 10:40:44 PM", modified = "11/20/2014 6:25:21 AM",
    trigger = current_season() < 4 && current_day() < 30 && bit0(0x00D43E) == 1 && byte(0x00D43F) != 255 && 
              bit1(0x00D43E) == 1 && bit2(0x00D43E) == 1 && current_day_of_week() < 8 && current_hour() > 5 && 
              byte(0x00D470) == 0
)

achievement(
    title = "Full Coop", description = "Have a full pen of 8 chickens.", points = 10,
    id = 17463, badge = "16925", published = "11/20/2014 1:45:12 AM", modified = "11/20/2014 4:09:07 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D6AE) > 0 &&
              ((byte(0x00D6D1) == 128) ||
               (byte(0x00D6D1) == 192))
)

achievement(
    title = "Full Barn", description = "Raise a family of 8 Cattle. (Any combination of Calves, Cows, or Bulls).", points = 10,
    id = 17465, badge = "16928", published = "11/20/2014 2:20:19 AM", modified = "11/20/2014 2:20:23 AM",
    trigger = trigger_in_game() && 
              ((byte(0x00D6F9) == 128) ||
               (byte(0x00D6F9) == 192))
)

achievement(
    title = "Racing Arsenal", description = "Have a full family of 8 Horses.", points = 10,
    id = 17471, badge = "16949", published = "11/20/2014 4:03:06 AM", modified = "11/20/2014 4:03:10 AM",
    trigger = trigger_in_game() &&
              ((byte(0x00D721) == 128) ||
               (byte(0x00D721) == 192))
)

achievement(
    title = "Flock Family", description = "Have a full barn of 8 Sheep.", points = 10,
    id = 17472, badge = "16956", published = "11/20/2014 4:03:08 AM", modified = "11/20/2014 4:03:12 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D6A9) > 191 &&
              ((byte(0x00D6A9) == 128) ||
               (byte(0x00D6A9) == 192))
)

achievement(
    title = "Prize Chicken", description = "Store_Ship a [Golden Egg].", points = 5,
    id = 17466, badge = "16929", published = "11/20/2014 2:45:25 AM", modified = "11/20/2014 6:26:08 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D8F7) > 0 && 
              byte(0x00D8F7) < 16 && current_hour() > 5 && byte(0x00D470) == 0 && current_day_of_week() < 8
)

achievement(
    title = "Prize Sheep", description = "Store_Ship a [Large Wool].", points = 5,
    id = 17467, badge = "16930", published = "11/20/2014 2:53:30 AM", modified = "11/20/2014 6:11:24 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D8FA) > 0 && 
              byte(0x00D8FA) < 16 && current_hour() > 5 && current_day_of_week() < 8
)

achievement(
    title = "Tangy Zip", description = "Buy the [Mayonnaise Maker].", points = 5,
    id = 17468, badge = "16937", published = "11/20/2014 3:29:38 AM", modified = "11/20/2014 6:27:55 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && bit5(0x00D43E) == 1 && 
              current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Weave It", description = "Buy the [Yard Maker].", points = 5,
    id = 17469, badge = "16938", published = "11/20/2014 3:35:27 AM", modified = "11/20/2014 6:27:58 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && bit4(0x00D43E) == 1 && 
              current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Winter-Proof", description = "Buy the [Sweater Maker].", points = 5,
    id = 17470, badge = "16939", published = "11/20/2014 3:35:29 AM", modified = "11/20/2014 6:28:00 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && bit3(0x00D43E) == 1 && 
              current_hour() > 5 && byte(0x00D470) == 0 && current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Gastolen!", description = "Buy the [Butter Chern].", points = 5,
    id = 17474, badge = "16962", published = "11/20/2014 5:33:46 AM", modified = "11/20/2014 6:28:02 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && bit7(0x00D43E) == 1 && 
              byte(0x00D470) == 0 && current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Nacho Farmer", description = "Buy the [Cheese Maker].", points = 5,
    id = 17475, badge = "16964", published = "11/20/2014 5:33:48 AM", modified = "11/20/2014 6:28:05 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && bit6(0x00D43E) == 1 && 
              byte(0x00D470) == 0 && current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Make It Rain... Literally", description = "Purchase the Sprinkler.", points = 10,
    id = 17267, badge = "16792", published = "11/17/2014 6:22:03 AM", modified = "11/20/2014 6:28:07 AM",
    trigger = bit7(0x00D444) == 1 && trigger_in_game() && byte(0x00D470) == 0
)

achievement(
    title = "Yard Creeper", description = "Purchase the Scarecrow.", points = 10,
    id = 17268, badge = "16793", published = "11/17/2014 6:22:04 AM", modified = "11/20/2014 6:28:14 AM",
    trigger = bit6(0x00D444) == 1 && trigger_in_game() && byte(0x00D470) == 0
)

achievement(
    title = "Communications Monster", description = "Gain the ability to speak with your animals.", points = 10,
    id = 17476, badge = "16965", published = "11/20/2014 5:50:50 AM", modified = "11/20/2014 5:57:23 AM",
    trigger = trigger_in_game() && byte(0x00D44B) >= 0xFC
)

achievement(
    title = "Take Some Time Off", description = "Get The [Snowboard].", points = 5,
    id = 17459, badge = "16915", published = "11/19/2014 11:40:58 PM", modified = "11/20/2014 6:28:29 AM",
    trigger = current_season() < 4 && trigger_in_game() && bit1(0x00D443) == 1 && byte(0x00D470) == 0
)

achievement(
    title = "Planting The Secret Garden", description = "Find a [Power Berry].", points = 5,
    id = 17461, badge = "16918", published = "11/20/2014 12:01:25 AM", modified = "11/20/2014 6:28:38 AM",
    trigger = current_season() < 4 && current_day() < 30 && byte(0x00D43F) != 255 && byte(0x00D4A4) == 1 && 
              current_hour() > 5 && byte(0x00D470) == 0
)

achievement(
    title = "Power Berries", description = "Fill the Secret Garden.", points = 20,
    id = 17418, badge = "16866", published = "11/18/2014 7:28:21 PM", modified = "11/20/2014 4:09:53 AM",
    trigger = trigger_in_game() && byte(0x00D4A4) == 6 && // power berries from farming
              byte(0x00D4A5) == 4                         // other power berries
)

achievement(
    title = "Holy Matrimony", description = "Get Married.", points = 25,
    id = 17473, badge = "16957", published = "11/20/2014 4:08:19 AM", modified = "11/20/2014 4:08:22 AM",
    trigger = trigger_in_game() && 
              dword(0xdb94) != 0 // wedding date (year, season, day)
)

achievement(
    title = "Carp", description = "Catch and donate 2 [Carp] to the Aquarium.", points = 5,
    id = 17435, badge = "16874", published = "11/18/2014 9:52:57 PM", modified = "11/18/2014 9:53:34 PM",
    trigger = byte(0x00DB7D) == 2 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "King Carp", description = "Catch and donate 3 [King Carp] to the Aquarium.", points = 5,
    id = 17436, badge = "16875", published = "11/18/2014 9:52:59 PM", modified = "11/18/2014 9:53:35 PM",
    trigger = byte(0x00DB7E) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Blue-Gill", description = "Catch and donate 3 [Bluegill] to the Aquarium.", points = 5,
    id = 17437, badge = "16876", published = "11/18/2014 9:53:02 PM", modified = "11/18/2014 9:53:36 PM",
    trigger = byte(0x00DB81) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Snakehead", description = "Catch and donate 3 [Snakehead] to the Aquarium.", points = 5,
    id = 17438, badge = "16877", published = "11/18/2014 9:53:04 PM", modified = "11/18/2014 9:53:38 PM",
    trigger = byte(0x00DB7F) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Black Bass", description = "Catch and donate 3 [Black Bass] to the Aquarium.", points = 5,
    id = 17439, badge = "16878", published = "11/18/2014 9:53:06 PM", modified = "11/18/2014 9:53:40 PM",
    trigger = byte(0x00DB80) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Parrot-Fish", description = "Catch and donate 3 [Parrotfish] to the Aquarium.", points = 5,
    id = 17440, badge = "16881", published = "11/18/2014 9:53:08 PM", modified = "11/18/2014 9:53:41 PM",
    trigger = byte(0x00DB83) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Blow-Fish", description = "Catch and donate 3 [Blowfish] to the Aquarium.", points = 5,
    id = 17441, badge = "16880", published = "11/18/2014 9:53:11 PM", modified = "11/18/2014 9:53:42 PM",
    trigger = byte(0x00DB84) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Blue Mao-Mao", description = "Catch and donate 3 [Blue Maomao] to the Aquarium.", points = 5,
    id = 17442, badge = "16891", published = "11/18/2014 9:53:15 PM", modified = "11/18/2014 9:53:44 PM",
    trigger = byte(0x00DB8A) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Pink Mao-Mao", description = "Catch and donate 3 [Pink Maomao] to the Aquarium.", points = 5,
    id = 17443, badge = "16890", published = "11/18/2014 9:53:18 PM", modified = "11/18/2014 9:53:45 PM",
    trigger = byte(0x00DB8B) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Dorado", description = "Catch and donate 3 [Dorado] to the Aquarium.", points = 5,
    id = 17444, badge = "16882", published = "11/18/2014 9:53:20 PM", modified = "11/18/2014 9:53:47 PM",
    trigger = byte(0x00DB85) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Horned Shark", description = "Catch and donate 3 [Horned Shark] to the Aquarium.", points = 5,
    id = 17445, badge = "16883", published = "11/18/2014 9:53:22 PM", modified = "11/18/2014 9:53:49 PM",
    trigger = byte(0x00DB89) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Sail-Fish", description = "Catch and donate 3 [Sailfish] to the Aquarium.", points = 5,
    id = 17446, badge = "16885", published = "11/18/2014 9:53:24 PM", modified = "11/18/2014 9:53:50 PM",
    trigger = byte(0x00DB86) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Archer-Fish", description = "Catch and donate 3 [Archerfish] to the Aquarium.", points = 5,
    id = 17447, badge = "16886", published = "11/18/2014 9:53:26 PM", modified = "11/18/2014 9:53:51 PM",
    trigger = byte(0x00DB88) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "Coelacanth", description = "Catch and donate 3 [Coelacanth] to the Aquarium.", points = 5,
    id = 17448, badge = "16888", published = "11/18/2014 9:53:28 PM", modified = "11/18/2014 9:53:53 PM",
    trigger = byte(0x00DB87) == 3 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "King Salmon", description = "Catch and donate 1 [King Salmon] to the Aquarium.", points = 5,
    id = 17449, badge = "16892", published = "11/18/2014 9:53:29 PM", modified = "11/18/2014 10:02:57 PM",
    trigger = byte(0x00DB82) == 1 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "King of The Lake", description = "Catch and donate 1 [King of Lake] to the Aquarium.", points = 5,
    id = 17450, badge = "16893", published = "11/18/2014 9:53:31 PM", modified = "11/18/2014 10:03:05 PM",
    trigger = byte(0x00DB8C) == 1 && current_season() < 4 && trigger_in_game()
)

achievement(
    title = "River Legend", description = "Catch at least one of every species of fish.", points = 10,
    id = 17428, badge = "16873", published = "11/18/2014 9:12:05 PM", modified = "11/20/2014 6:01:26 AM",
    trigger = byte(0x00DB7D) > 0 && byte(0x00DB7E) > 0 && byte(0x00DB7F) > 0 && byte(0x00DB80) > 0 && byte(0x00DB81) > 0 && 
              byte(0x00DB82) > 0 && byte(0x00DB83) > 0 && byte(0x00DB84) > 0 && byte(0x00DB85) > 0 && byte(0x00DB86) > 0 && 
              byte(0x00DB87) > 0 && byte(0x00DB88) > 0 && byte(0x00DB89) > 0 && byte(0x00DB8A) > 0 && byte(0x00DB8B) > 0 && 
              byte(0x00DB8C) == 1 && byte(0x00DB8B) != 255 && byte(0x00DB7D) != 255 && current_season() < 4 && 
              byte(0x00DB7D) < 6 && byte(0x00DB7E) < 6 && byte(0x00DB7F) < 6 && byte(0x00DB81) < 6 && byte(0x00DB85) < 6 && 
              bit7(0x00D457) == 1
)
