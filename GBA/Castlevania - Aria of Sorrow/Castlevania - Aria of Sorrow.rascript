// Castlevania - Aria of Sorrow
// #ID = 510
// MD5: e7470df4d241f73060d14437011b90ce (U)

// $01B270: Poison Status
function is_poisoned() => byte(0x01B270)

// $01B279: Soma Lv
function soma_lv() => byte(0x01B279)

// $01B282: Soma STR
function soma_str() => word(0x01B282)

// $01B290: [4 Byte] Gold
function current_gold() => word(0x01B290)

// $01B2CD: Hand Claimh Solais Amount
function hand_claimh_solais() => byte(0x01B2CD)

// $01B2D8: Hand Excalibur Amount
function hand_excalibur() => byte(0x01B2D8)

// $01B2DB: Hand Death's Sickle Amount
function hand_death_sickle() => byte(0x01B2DB)

// $01B2E7: Hand Kaiser Knuckle Amount
function hand_kaiser_knuckle() => byte(0x01B2E7)

// $01B2EC: Hand Silver Gun Amount
function hand_silver_gun() => byte(0x01B2EC)

// $01B2ED: Hand Positron Rifle Amount
function hand_positron_rifle() => byte(0x01B2ED)

// $01B2EE: Hand Valmanway Amount
function hand_valmanway() => byte(0x01B2EE)

// $01B302: Body Death's Robe Amount
function body_death_robe() => byte(0x01B302)

// $01B308: Cape Amount
function body_cape() => byte(0x01B308)

// $01B314: Tear of Blood Amount
function tear_of_blood() => byte(0x01B314)

// $01B317: Soul Eater Ring Amount
function soul_eater_ring() => byte(0x01B317)

// $01B31B: Chaos Ring Amount
function chaos_ring() => byte(0x01B31B)

achievement(
    title = "Time Has Stopped", description = "Obtained Galamoth Ability", points = 5,
    id = 3072, badge = "03566", published = "10/1/2013 5:36:57 AM", modified = "10/4/2013 5:39:39 AM",
    trigger = bit4(0x01B394) >= 0x1
)

achievement(
    title = "Super Jump", description = "Obtained Hippogryph Ability", points = 5,
    id = 3073, badge = "03567", published = "10/1/2013 5:37:02 AM", modified = "10/4/2013 5:39:43 AM",
    trigger = bit0(0x01B394) >= 0x1
)

achievement(
    title = "Creaking Skull", description = "Defeated the 1st Boss as Soma", points = 5,
    id = 3074, badge = "03547", published = "10/1/2013 5:37:09 AM", modified = "9/24/2014 7:22:15 AM",
    trigger = bit1(0x01B3A4) >= 0x1
)

achievement(
    title = "Manticore", description = "Defeated the 2nd Boss as Soma", points = 10,
    id = 3075, badge = "03548", published = "10/1/2013 5:37:15 AM", modified = "10/4/2013 5:39:51 AM",
    trigger = bit6(0x01B3A6) >= 0x1
)

achievement(
    title = "Great Armor", description = "Defeated the 3rd Boss as Soma", points = 10,
    id = 3076, badge = "03549", published = "10/1/2013 5:37:20 AM", modified = "10/4/2013 5:39:55 AM",
    trigger = bit4(0x01B3A7) >= 0x1
)

achievement(
    title = "Big Golem", description = "Defeated the 4th Boss as Soma", points = 10,
    id = 3077, badge = "03550", published = "10/1/2013 5:37:25 AM", modified = "10/4/2013 5:39:59 AM",
    trigger = bit5(0x01B3A8) >= 0x1
)

achievement(
    title = "Headhunter", description = "Defeated the 5th Boss as Soma", points = 10,
    id = 3078, badge = "03551", published = "10/1/2013 5:37:29 AM", modified = "10/4/2013 5:40:03 AM",
    trigger = bit2(0x01B3AD) >= 0x1
)

achievement(
    title = "Death", description = "Defeated the 6th Boss as Soma", points = 10,
    id = 3079, badge = "03552", published = "10/1/2013 5:37:34 AM", modified = "10/4/2013 5:40:08 AM",
    trigger = bit3(0x01B3AD) >= 0x1
)

achievement(
    title = "Legion", description = "Defeated the 7th Boss as Soma", points = 10,
    id = 3080, badge = "03553", published = "10/1/2013 5:37:38 AM", modified = "10/4/2013 5:40:12 AM",
    trigger = bit4(0x01B3AD) >= 0x1
)

achievement(
    title = "Balore", description = "Defeated the 8th Boss as Soma", points = 10,
    id = 3081, badge = "03554", published = "10/1/2013 5:37:43 AM", modified = "10/4/2013 5:40:16 AM",
    trigger = bit5(0x01B3AD) >= 0x1
)

achievement(
    title = "Graham", description = "Defeated the 9th Boss as Soma", points = 10,
    id = 3082, badge = "03555", published = "10/1/2013 5:37:48 AM", modified = "10/4/2013 5:40:21 AM",
    trigger = bit7(0x01B3AD) >= 0x1
)

achievement(
    title = "J Who?", description = "Defeated the 10th Boss as Soma", points = 10,
    id = 3083, badge = "03556", published = "10/1/2013 5:37:54 AM", modified = "10/4/2013 5:40:26 AM",
    trigger = bit6(0x01B3AD) >= 0x1
)

achievement(
    title = "Sword of Light", description = "Obtained the Claimh Solais", points = 5,
    id = 3084, badge = "03557", published = "10/1/2013 5:37:58 AM", modified = "10/4/2013 5:40:30 AM",
    trigger = hand_claimh_solais() >= 0x01
)

// Ticket 13194: got nearly 100% entirely in thegame all bosses all souls didnt unlock
//               MD5: Unknown
//               Emulator: RAVBA
achievement(
    title = "Normal Chaos", description = "Beat the Game on Normal as Soma", points = 25,
    id = 3085, badge = "03569", published = "10/1/2013 5:38:03 AM", modified = "10/4/2013 5:40:34 AM",
    trigger = bit0(0x01B3AE) >= 0x1
)

achievement(
    title = "That Was Easy", description = "Obtain Your 1st Soul", points = 5,
    id = 3086, badge = "03570", published = "10/1/2013 6:16:30 AM", modified = "10/4/2013 5:40:39 AM",
    trigger = bit0(0x01B31C) >= 0x1
)

achievement(
    title = "Sword of Many Slashes", description = "Obtained the Valmanway", points = 5,
    id = 3087, badge = "03572", published = "10/2/2013 12:02:14 AM", modified = "10/4/2013 5:40:43 AM",
    trigger = hand_valmanway() >= 0x01
)

achievement(
    title = "Lazer Gun", description = "Obtained Positron Rifle", points = 5,
    id = 3088, badge = "03575", published = "10/2/2013 12:06:45 AM", modified = "10/4/2013 5:40:48 AM",
    trigger = hand_positron_rifle() >= 0x01
)

achievement(
    title = "Eater of Souls", description = "Obtained the Soul Eater Ring", points = 5,
    id = 3089, badge = "03573", published = "10/2/2013 12:06:56 AM", modified = "10/4/2013 5:40:52 AM",
    trigger = soul_eater_ring() >= 0x01
)

achievement(
    title = "Infinite MP!", description = "Obtained the Chaos Ring", points = 5,
    id = 3090, badge = "03574", published = "10/2/2013 12:07:06 AM", modified = "10/4/2013 5:40:56 AM",
    trigger = chaos_ring() >= 0x01
)

achievement(
    title = "The Sword in the Stone", description = "Obtained Excalibur", points = 5,
    id = 3091, badge = "03576", published = "10/2/2013 12:11:12 AM", modified = "10/4/2013 5:41:00 AM",
    trigger = hand_excalibur() >= 0x01
)

achievement(
    title = "Deep Pockets", description = "Obtained 200,000 Gold", points = 20,
    id = 3132, badge = "03600", published = "10/3/2013 2:10:58 AM", modified = "10/4/2013 5:41:06 AM",
    trigger = current_gold() >= 0x0D40 && word(0x01B292) >= 0x0003
)

// Ticket 11768: I was able to get the item, but the achievements does not unlock
//               MD5: e7470df4d241f73060d14437011b90ce
achievement(
    title = "HARD Exclusives", description = "Obtained all HARD Mode Exclusive Items", points = 10,
    id = 3134, badge = "03601", published = "10/3/2013 4:13:12 AM", modified = "10/5/2013 6:32:20 AM",
    trigger = hand_silver_gun() >= 0x01 && hand_kaiser_knuckle() >= 0x01 && body_death_robe() >= 0x01 && 
              tear_of_blood() >= 0x01 && hand_death_sickle() >= 0x01
)

achievement(
    title = "Level 50", description = "You've Reached Soma's LV50", points = 20,
    id = 3135, badge = "03611", published = "10/3/2013 4:41:08 AM", modified = "9/24/2014 11:24:02 AM",
    trigger = soma_lv() >= 0x32
)

achievement(
    title = "Level 40", description = "You've Reached Soma's LV40", points = 20,
    id = 3136, badge = "03610", published = "10/3/2013 4:41:12 AM", modified = "10/4/2013 5:41:19 AM",
    trigger = soma_lv() >= 0x28
)

achievement(
    title = "Level 30", description = "You've Reached Soma's LV30", points = 15,
    id = 3137, badge = "03609", published = "10/3/2013 4:41:16 AM", modified = "6/17/2015 7:43:11 PM",
    trigger = soma_lv() >= 0x1E
)

achievement(
    title = "Level 20", description = "You've Reached Soma's LV20", points = 10,
    id = 3138, badge = "03608", published = "10/3/2013 4:41:20 AM", modified = "10/4/2013 5:41:30 AM",
    trigger = soma_lv() >= 0x14
)

achievement(
    title = "Level 10", description = "You've Reached Soma's LV10 ", points = 5,
    id = 3139, badge = "03607", published = "10/3/2013 4:41:26 AM", modified = "10/4/2013 5:41:33 AM",
    trigger = soma_lv() >= 0x0A
)

achievement(
    title = "Stone", description = "You've Been Turned Into Stone!", points = 5,
    id = 3140, badge = "03615", published = "10/3/2013 5:04:23 AM", modified = "10/4/2013 5:41:38 AM",
    trigger = is_poisoned() == 0x04
)

achievement(
    title = "Curse", description = "You've Been Cursed!", points = 5,
    id = 3141, badge = "03614", published = "10/3/2013 5:04:27 AM", modified = "10/4/2013 5:41:42 AM",
    trigger = is_poisoned() == 0x02
)

achievement(
    title = "Poison", description = "You've Been Poisoned!", points = 5,
    id = 3142, badge = "03613", published = "10/3/2013 5:04:31 AM", modified = "10/4/2013 5:41:47 AM",
    trigger = is_poisoned() == 0x01
)

// Ticket 14271: Hello,
//               On my save I have on my Rpi3, these achievements didn't trigger even though I have the chaos ring and
//               the enemy index at 100%.
//               MD5: e7470df4d241f73060d14437011b90ce
// Ticket 8630: So, the only soul I missed was the Legion one, which I oticed was missable. I started over in New Game
//               to get that one soul, but after that, I didn't get the achievement. Help?
//               MD5: e7470df4d241f73060d14437011b90ce
// Ticket 7896: I got 100% souls but the 100% Red, Blue and Yellow souls achievements didn't trigger.
// Ticket 7153: In the list I acces through the emulator I can see the Red Soul Collector on for me...
//               But in the site it doesn't show or count at all. // For the Belmont Legend I killed all bosses,
//               and it just didn't trigger...
// Ticket 6977: Got all souls and got the chaos ring w/ the infinite MP achievement, but didn't get the achievements.
achievement(
    title = "Red Soul Collector", description = "Obtained all (RED) Souls", points = 25,
    id = 3144, badge = "03616", published = "10/3/2013 6:36:31 AM", modified = "9/24/2014 11:24:18 AM",
    trigger = low4(0x01B31C) >= 0x1 && high4(0x01B31C) >= 0x1 && low4(0x01B31D) >= 0x1 && high4(0x01B31D) >= 0x1 && 
              low4(0x01B31E) >= 0x1 && high4(0x01B31E) >= 0x1 && low4(0x01B31F) >= 0x1 && high4(0x01B31F) >= 0x1 && 
              low4(0x01B320) >= 0x1 && high4(0x01B320) >= 0x1 && low4(0x01B321) >= 0x1 && high4(0x01B321) >= 0x1 && 
              low4(0x01B322) >= 0x1 && high4(0x01B322) >= 0x1 && low4(0x01B323) >= 0x1 && high4(0x01B323) >= 0x1 && 
              low4(0x01B324) >= 0x1 && high4(0x01B324) >= 0x1 && low4(0x01B325) >= 0x1 && high4(0x01B325) >= 0x1 && 
              low4(0x01B326) >= 0x1 && high4(0x01B326) >= 0x1 && low4(0x01B327) >= 0x1 && high4(0x01B327) >= 0x1 && 
              low4(0x01B328) >= 0x1 && high4(0x01B328) >= 0x1 && low4(0x01B329) >= 0x1 && high4(0x01B329) >= 0x1 && 
              low4(0x01B32A) >= 0x1 && high4(0x01B32A) >= 0x1 && low4(0x01B32B) >= 0x1 && high4(0x01B32B) >= 0x1 && 
              low4(0x01B32C) >= 0x1 && high4(0x01B32C) >= 0x1 && low4(0x01B32D) >= 0x1 && high4(0x01B32D) >= 0x1 && 
              low4(0x01B32E) >= 0x1 && high4(0x01B32E) >= 0x1 && low4(0x01B32F) >= 0x1 && high4(0x01B32F) >= 0x1 && 
              low4(0x01B330) >= 0x1 && high4(0x01B330) >= 0x1 && low4(0x01B331) >= 0x1 && high4(0x01B331) >= 0x1 && 
              low4(0x01B332) >= 0x1 && high4(0x01B332) >= 0x1 && low4(0x01B333) >= 0x1 && high4(0x01B333) >= 0x1 && 
              low4(0x01B334) >= 0x1 && high4(0x01B334) >= 0x1 && low4(0x01B335) >= 0x1 && high4(0x01B335) >= 0x1 && 
              low4(0x01B336) >= 0x1 && high4(0x01B336) >= 0x1 && low4(0x01B337) >= 0x1
)

achievement(
    title = "Hey! Get Back Here!", description = "You've Defeated a Sky Fish as Soma", points = 5,
    id = 3154, badge = "03633", published = "10/4/2013 3:07:24 AM", modified = "10/4/2013 5:41:54 AM",
    trigger = bit1(0x01B3AA) >= 0x1
)

achievement(
    title = "Your Clock is Useless", description = "You've Defeated the Chronomage as Soma", points = 5,
    id = 3155, badge = "03634", published = "10/4/2013 3:18:30 AM", modified = "10/4/2013 5:41:58 AM",
    trigger = bit0(0x01B3A5) >= 0x1
)

// Ticket 14272: Hello,
//               On my save I have on my Rpi3, these achievements didn't trigger even though I have the chaos ring and
//               the enemy index at 100%.
//               MD5: e7470df4d241f73060d14437011b90ce
// Ticket 7897: I got 100% souls but the 100% Red, Blue and Yellow souls achievements didn't trigger.
// Ticket 6978: Got all souls and got the chaos ring w/ the infinite MP achievement, but didn't get the achievements.
achievement(
    title = "Yellow Soul Collector", description = "Obtained All (YELLOW) Souls", points = 25,
    id = 3156, badge = "03635", published = "10/4/2013 5:11:19 AM", modified = "10/4/2013 5:42:02 AM",
    trigger = high4(0x01B36E) >= 0x1 && low4(0x01B36E) >= 0x1 && high4(0x01B36F) >= 0x1 && low4(0x01B36F) >= 0x1 && 
              high4(0x01B370) >= 0x1 && low4(0x01B370) >= 0x1 && high4(0x01B371) >= 0x1 && low4(0x01B371) >= 0x1 && 
              high4(0x01B372) >= 0x1 && low4(0x01B372) >= 0x1 && high4(0x01B373) >= 0x1 && low4(0x01B373) >= 0x1 && 
              high4(0x01B374) >= 0x1 && low4(0x01B374) >= 0x1 && high4(0x01B375) >= 0x1 && low4(0x01B375) >= 0x1 && 
              high4(0x01B376) >= 0x1 && low4(0x01B376) >= 0x1 && high4(0x01B377) >= 0x1 && low4(0x01B377) >= 0x1 && 
              high4(0x01B378) >= 0x1 && low4(0x01B378) >= 0x1 && high4(0x01B379) >= 0x1 && low4(0x01B379) >= 0x1 && 
              high4(0x01B37A) >= 0x1 && low4(0x01B37A) >= 0x1 && high4(0x01B37B) >= 0x1 && low4(0x01B37B) >= 0x1 && 
              high4(0x01B37C) >= 0x1 && low4(0x01B37C) >= 0x1 && high4(0x01B37D) >= 0x1 && low4(0x01B37D) >= 0x1 && 
              high4(0x01B37E) >= 0x1 && low4(0x01B37E) >= 0x1 && low4(0x01B37F) >= 0x1
)

// Ticket 14273: Hello,
//               On my save I have on my Rpi3, these achievements didn't trigger even though I have the chaos ring and
//               the enemy index at 100%.
//               MD5: e7470df4d241f73060d14437011b90ce
// Ticket 7898: I got 100% souls but the 100% Red, Blue and Yellow souls achievements didn't trigger.
// Ticket 6979: Got all souls and got the chaos ring w/ the infinite MP achievement, but didn't get the achievements.
achievement(
    title = "Blue Soul Collector", description = "Obtained All (BLUE) Souls", points = 25,
    id = 3157, badge = "03636", published = "10/4/2013 5:30:33 AM", modified = "10/4/2013 5:42:07 AM",
    trigger = high4(0x01B354) >= 0x1 && low4(0x01B354) >= 0x1 && high4(0x01B355) >= 0x1 && low4(0x01B355) >= 0x1 && 
              high4(0x01B356) >= 0x1 && low4(0x01B356) >= 0x1 && high4(0x01B357) >= 0x1 && low4(0x01B357) >= 0x1 && 
              high4(0x01B358) >= 0x1 && low4(0x01B358) >= 0x1 && high4(0x01B359) >= 0x1 && low4(0x01B359) >= 0x1 && 
              high4(0x01B35A) >= 0x1 && low4(0x01B35A) >= 0x1 && high4(0x01B35B) >= 0x1 && low4(0x01B35B) >= 0x1 && 
              high4(0x01B35C) >= 0x1 && low4(0x01B35C) >= 0x1 && high4(0x01B35D) >= 0x1 && low4(0x01B35D) >= 0x1 && 
              high4(0x01B35E) >= 0x1 && low4(0x01B35E) >= 0x1 && high4(0x01B35F) >= 0x1 && low4(0x01B35F) >= 0x1
)

// Ticket 7670: I'm Beat the game defeating al bosses with Julius 3 times (2 in normal and 1 in hard) but don't
//               receive the achievement. I'm cleared boss rush with Julius and doesn't works too.
// Ticket 6907: 
achievement(
    title = "Party Like It's 1999", description = "Beat the Game on Julius Mode", points = 5,
    id = 13702, badge = "13520", published = "9/24/2014 7:24:43 AM", modified = "7/19/2015 9:59:44 AM",
    trigger = word(0x008088) == 0x2C54 && word(0x00808C) == 0x120E && word(0x008020) == 0x160B && 
              word(0x008022) == 0x0A0D && word(0x008024) == 0x1416 && word(0x008026) == 0x0000
)

// Ticket 12342: essa arquivement não desbloqueia ...
//               deve ter algum erro nela
//               fechei três vezes o game e nada de liberar
//               Emulator: RAVBA
// Ticket 7671: I'm Beat the game defeating al bosses with Julius 3 times (2 in normal and 1 in hard) but don't
//               receive the achievement. I'm cleared boss rush with Julius and doesn't works too.
// Ticket 7154: In the list I acces through the emulator I can see the Red Soul Collector on for me...
//               But in the site it doesn't show or count at all. // For the Belmont Legend I killed all bosses,
//               and it just didn't trigger...
// Ticket 6908: 
achievement(
    title = "Belmont Legend", description = "Beat All Bosses in Julius Mode then beat the game.", points = 10,
    id = 13704, badge = "13523", published = "9/24/2014 11:24:24 AM", modified = "7/19/2015 9:57:28 AM",
    trigger = word(0x008088) == 0x2C54 && word(0x00808C) == 0x120E && soma_str() == 0x00D7 && word(0x008020) == 0x160B && 
              word(0x008022) == 0x0A0D && word(0x008024) == 0x1416 && word(0x008026) == 0x0000
)

achievement(
    title = "Sliding", description = "Obtained Skeleton Blaze Ability", points = 5,
    id = 3068, badge = "03568", published = "10/1/2013 5:36:36 AM", modified = "10/4/2013 5:39:19 AM",
    trigger = bit4(0x01B392) >= 0x1
)

achievement(
    title = "Backdash", description = "Obtained Grave Keeper Ability", points = 5,
    id = 3069, badge = "03563", published = "10/1/2013 5:36:42 AM", modified = "10/4/2013 5:39:24 AM",
    trigger = bit0(0x01B392) >= 0x1
)

achievement(
    title = "Jumping Off Their Heads", description = "Obtained Kicker Skeleton Ability", points = 5,
    id = 3070, badge = "03564", published = "10/1/2013 5:36:47 AM", modified = "10/4/2013 5:39:30 AM",
    trigger = bit4(0x01B393) >= 0x1
)

achievement(
    title = "Double Jump", description = "Obtained Malphas Ability", points = 5,
    id = 3071, badge = "03565", published = "10/1/2013 5:36:52 AM", modified = "10/4/2013 5:39:34 AM",
    trigger = bit0(0x01B393) >= 0x1
)

achievement(
    title = "Pas de temps sans horloge", description = "Battez le Chronomage avec Soma", points = 5,
    id = 50116, badge = "03634", published = "6/29/2017 9:26:39 PM", modified = "6/29/2017 9:26:39 PM",
    trigger = bit0(0x01B3A5) >= 0x1
)

achievement(
    title = "Super saut", description = "Obtenir la capacitÃ© Hippogryphe", points = 5,
    id = 50117, badge = "03567", published = "6/29/2017 9:38:34 PM", modified = "6/29/2017 9:56:34 PM",
    trigger = bit0(0x01B394) >= 0x1
)

achievement(
    title = "Premier accessoire", description = "Obtiens la cape", points = 10,
    id = 50121, badge = "00231", published = "6/29/2017 10:21:12 PM", modified = "6/29/2017 10:21:30 PM",
    trigger = body_cape() == 0x01
)

difficulties = {
    0: "Normal",
    1: "Hard",
}

characters = {
    0: "Soma",
    1: "Julius",
}

// F0: Study
locations = {
    0: "Castle Corridor",
    1: "Chapel",
    2: "Study",
    3: "Dance Hall",
    4: "Inner Quarters",
    5: "Floating Garden",
    6: "Clock Tower",
    7: "Underground Reservoir",
    8: "Arena",
    9: "Top Floor",
    10: "Forbidden Area",
    11: "Chaotic Realm",
}

rich_presence_conditional_display(word(0x019DE6) == 0, "Titles")
rich_presence_conditional_display(word(0x019DE6) == 0x4E58, "Intro")
rich_presence_conditional_display(word(0x019DE6) == 0x6061, "File Select")
rich_presence_conditional_display(byte(0x8004) == 0x20, "Boss Rush ({0})",
    rich_presence_value("Time", dword(0x009260), format="FRAMES")
)

rich_presence_conditional_display(word(0x01B266) == 1, "Julius is in the {0} on {1} ({2})",
    rich_presence_lookup("Location", byte(0x809E), locations),
    rich_presence_lookup("Difficulty", high4(0x0080A1), difficulties),
    rich_presence_value("Time", dword(0x0080AC), format="FRAMES")
)

rich_presence_display("Level {0} Soma is in the {1} on {2} ({3})",
    rich_presence_value("Level", byte(0x01B279)),
    rich_presence_lookup("Location", byte(0x809E), locations),
    rich_presence_lookup("Difficulty", high4(0x0080A1), difficulties),
    rich_presence_value("Time", dword(0x0080AC), format="FRAMES")
)

