// EarthBound
// #ID = 264
// md5: a864b2e5c141d2dec1c4cbed75a42a85 [Earthbound (USA)]
//      a5ee470ad753d22a1c493c7b4bae6779 [Earthbound Brazil patch - http://www.earthboundbrasil.com/2015/04/earthbound.html]
//      a086f6648288c2858329b1c9c6e49d82 [Mother 2 (JP)] -- not associated as of 2017-10-15

// [user=cirellio] (last login: 26 Jul 2016)
// 2017-10-07: 71 outstanding tickets
// 2017-10-15: 47 outstanding tickets
// 2017-10-16: 42 outstanding tickets
// 2017-10-17: 35 outstanding tickets
// 2017-10-18: 29 outstanding tickets
// 2017-10-19: 17 outstanding tickets
// 2017-10-20:  6 outstanding tickets
// 2017-10-21:  0 outstanding tickets

function current_primary_map() => word(0x0242)
function current_secondary_map() => word(0x0244)
function current_dialog_message() => word(0x5d62)
function current_dialog_message_pointer() => word(0x96c5)
function current_non_dialog_message_pointer() => word(0x96e0)
function current_check_dialog_message_pointer() => word(0x96fb)
function current_dialog_line() => word(0x1e70)
function current_prize() => word(0x1e5e)
function current_music() => byte(0xb53b)
function trigger_dialog_old(message, line) => current_dialog_message() == message && current_dialog_line() == line
function trigger_dialog(message, address) => current_dialog_message() == message && current_dialog_message_pointer() == address
function trigger_in_battle() => never(byte(0x009643) != 1)
function trigger_battle_won() => word(0x0098B9) > prev(word(0x0098B9))
function trigger_menu_no() => byte(0x1e2b) == 0x83
function last_item_used() => byte(0x870f)

// ========================================================
// Miscellaneous
// * That was easy (5) - get your first insta-win
// * Let's End This (5) - win a battle while suffering mortal damage
// * These are Free, Right (5) - eat a ketchup packet
// * Now That's How You Make an Exit (5) - use an Exit Mouse

achievement(
    title = "That Was Easy!", description = "Get your first insta-win", points = 5,
    id = 7864, published = "5/1/2014 1:32:09 AM", modified = "10/18/2014 5:46:45 PM",
    trigger = current_dialog_message_pointer() == 31283 && // EF7A37 = "You won!" without battle
              byte(0x96c7) == 239 &&
              never(word(0x009643) != 0) // never in battle
)

achievement(
    title = "Let's End This!!!", description = "Win a battle while suffering mortal damage", points = 5,
    id = 8311, published = "5/19/2014 1:40:37 AM", modified = "5/19/2014 4:54:04 AM",
    trigger = trigger_in_battle() &&               // in battle
              byte(0x00A22F) == 0 && // enemy 1 hp
              byte(0x00A27D) == 0 && // enemy 2 hp
              byte(0x00A2CB) == 0 && // enemy 3 hp
              byte(0x00A2CB) == 0 && // enemy 3 hp
              byte(0x00A319) == 0 && // enemy 4 hp
              byte(0x00A367) == 0 && // enemy 5 hp
              byte(0x00A3B5) == 0 && // enemy 6 hp
              byte(0x00A403) == 0 && // enemy 7 hp
              byte(0x00A451) == 0 && // enemy 8 hp
              ((word(0x009a15) <= 1 && word(0x009a13) < prev(word(0x009a13))) || // ness losing hp towards 0/1
               (word(0x009a74) <= 1 && word(0x009a72) < prev(word(0x009a72))) || // paula losing hp towards 0/1
               (word(0x009ad3) <= 1 && word(0x009ad1) < prev(word(0x009ad1))) || // jeff losing hp towards 0/1
               (word(0x009b32) <= 1 && word(0x009b30) < prev(word(0x009b30))))   // poo losing hp towards 0/1
)

achievement(
    title = "Now That's How you Make an Exit!", description = "Use an Exit Mouse", points = 5,
    id = 8273, published = "5/17/2014 4:43:36 PM", modified = "6/18/2014 8:43:10 PM",
    trigger = never(byte(0x001E9E) != 197) &&       // last item used not exit mouse
              last_item_used() == 197 &&            // last item used
              once(byte(0x000028) == 255)           // exit mouse used
)

// ========================================================
// New Game
// * Who Cares (5) - Use 'Don't Care' at least once
// * You'll catch cold dressed like that! (5) - Head out in your PJs
// * Earthbound gamers do it one handed (5) - investigate the meteor without pushing any buttons (except L to talk to Pokey)

// ========================================================
// 00 - Morning
// * Buzzkill (1) - Talk to Buzz Buzz after he's swatted by Pokey's mom

// ========================================================
// 01 - Going to Town
// * It's a secret to everybody (5) - enter the treehouse behind the library
// * Trashburger (5) - examine the garbage can next to the burger shop
// * Jumping the Sharks (1) - defeat Frank and Frankystein

// ========================================================
// 02 - First Sanctuary
// * Your Sanctuary I (1) - record the song of Giant Step

// ========================================================
// 03 - Police
// * Is This Legal (1) - defeat Captain Strong

// ========================================================
// 04 - Twoson
// * Ding-ding! (5) - get the bike from the store next to the hotel, use it, and press R.
// * If I Give You This, Will You Go Away (5) - talk to the man with glasses in the inn 17 times
// * Harvest Moon (5) - buy a fresh egg, grow it into a chicken, and sell it using the 'For Sale' sign.
// * Retro Achievement (5) - defeat a new age retro hippie (without auto-win)

// ========================================================
// 05 - Happy Happy
// * Caught Blue-Handed (5) - pay $0 for food from the sign, then talk to the man standing nearby
// * Happiness is a blue gun (5) - defeat Mr. Carpainter without using PP
// * Insane Killing Spree (5) - face many insane cultists in a single battle

achievement(
    title = "Caught Blue-handed", description = "Get caught stealing from the Happy Happy Village food stand", points = 5,
    id = 8312, published = "5/19/2014 3:11:02 AM", modified = "12/22/2014 3:08:39 AM",
    trigger = never(current_dialog_message() != 412) && 
              never(current_primary_map() != 27614) &&
              current_dialog_message_pointer() == 36335
)

achievement(
    id = 8313, published = "5/19/2014 4:47:20 AM", modified = "10/18/2014 2:28:53 PM",
    title = "Insane Killing Spree", description = "Defeat at least eight Insane Cultists in a single battle", points = 5,
    trigger = never(current_music() != 102) && trigger_in_battle() && 
              once(word(0xa43e) == 1) &&            // Insane Cultist H
              once(word(0xa451) == 94) &&           // 94 HP
              trigger_battle_won()                  // win battle
)

// ========================================================
// 06 - Second Sanctuary
// * Whac-a-mole (5) - defeat Mondo Mole without letting Paula die
// * Your Sanctuary II (1) - record the song of Lilliput Steps
// * Four Fried Chickens and a Coke (1) - watch the first 'Runaway Five' concert
// * Oh, come now, he's not all that bad (5) - invest in Orange Kid

achievement(
    title = "Four Fried Chickens and a Coke", description = "Watch your first 'Runaway Five' concert", points = 1,
    id = 8510, published = "5/24/2014 1:34:14 AM", modified = "1/7/2015 1:28:05 AM",
    trigger = never(current_primary_map() != 12730) && 
              current_secondary_map() == 12668 && 
              once(current_music() == 76) &&
              current_music() == 25
)

// ========================================================
// 07 - Threed
// * Uki Uki Kukyuki (1) - recruit the monkey in Winters
// * Supreme Ruler (5) - use the ruler on a monster
// ! Tales from the Cryptid (1) - spot Tessie in the loch  [BROKEN]

achievement(
    title = "Tales from the Cryptid", description = "Spot Tessie in the Loch", points = 1,
    id = 8552, published = "5/25/2014 5:53:31 PM", modified = "10/21/2014 3:19:15 AM",
    trigger = never(current_primary_map() != 27614) && 
              current_secondary_map() == 20312 && 
              current_music() == 86 && 
              current_dialog_message_pointer() == 33214
)

// ========================================================
// 08 - Brickroad
// * Brains vs. Brawn (5) - solo a cave boy with Jeff [BROKEN?]
// * Take to the Sky (1) - get in the spaceship

achievement(
    title = "Brains vs. Brawn", description = "Solo a Cave Boy with Jeff", points = 5,
    id = 8576, published = "5/25/2014 10:31:36 PM", modified = "5/26/2014 1:41:13 AM",
    trigger = never(byte(0x009891) != 2) && // npc party members
              never(byte(0x009892) != 0) && // current party members
              byte(0x009F8C) == 212 &&      // enemy
              current_music() == 102 &&     // music
              word(0x00A22E) == 0 &&        // enemy 1 hp
              word(0x00A27C) == 0           // enemy 2 hp
)

// ========================================================
// 09 - Saturn Valley
// * BOING! (5) - have dr. saturn operate on you
// * A Meditation in Patience (1) - wait for the secret passage behind the waterfall to open
// ! Fly Honey-Free (10) - defeat Master Belch without feeding him Fly Honey [TRIGGERS ON RESET] [Flash Beta - lv38 ness]
// * You've come far (1) - take a coffee break
//   [The problem is the checks on 0x001e72; the value seems to be radically different for everyone. It was fluctuating between 00e1 and caf6 for me.]

achievement(
    title = "A Meditation in Patience", description = "Successfully enter Belch's base", points = 1,
    id = 8770, published = "6/8/2014 1:32:50 PM", modified = "10/17/2014 2:25:42 AM",
    trigger = current_music() == 52 && 
              word(0x000BBE) <= 6383 &&       // x location
              never(word(0x000BFA) != 264) && // y location
              current_dialog_message_pointer() == 34975
)

// 12.5% for PSI Flash Beta (Lv38) to insta-kill him
// Pray until he gets confused and poisons himself, then survive until the poison kills him
achievement(
    title = "Fly Honey-Free", description = "Tame Master Belch without feeding him Fly Honey", points = 10,
    id = 8771, published = "6/8/2014 2:34:02 PM", modified = "10/20/2014 2:48:55 PM",
    trigger = never(word(0x009F8C) != 93) &&              // enemy = Belch
              byte(0x00B53B) == 99 &&                     // music = battle
              once(word(0x00A22E) == 35330) &&            // full HP
              once(byte(0x0096FC) == 120) &&              // belch's action - prevents reactivate if no damage in first round 
              never(byte(0x009FB4) == 105) &&             // ness never used honey
              never(byte(0x00A002) == 105) &&             // paula never used honey
              never(byte(0x00A050) == 105)                // jeff never used honey
)

achievement(
    title = "You've Come Far", description = "Chill out and enjoy a coffee break in Saturn Valley", points = 1,
    id = 8784, published = "6/8/2014 11:34:34 PM", modified = "2/11/2017 2:01:24 PM",
    trigger = never(current_primary_map() != 22396) && 
              current_secondary_map() == 31278 && 
              current_music() == 92 &&
              current_dialog_message_pointer() == 61050
)

// ========================================================
// 10 - Third Sanctuary
// * Fix it, Jeff (5) - fix the broken air gun
// * Your Sanctuary III (1) - record the song of Milky Well
// * Freed Threed (1) - return to Threed
// * Significant! (5) - return the Insignificant Item to the man in the Twosons hospital

achievement(
    title = "Fix it, Jeff!", description = "Repair a Broken Air Gun", points = 5,
    id = 8579, published = "5/26/2014 2:24:53 AM", modified = "5/26/2014 2:24:57 AM",
    trigger = byte(0x009AA7) >= 12 &&                                // jeff's IQ
              never(current_primary_map() != 0) && 
              current_secondary_map() == 0 &&
              ((prev(byte(0x009AAF)) == 6 && byte(0x009AAF) == 39) || 
               (prev(byte(0x009AB0)) == 6 && byte(0x009AB0) == 39) || 
               (prev(byte(0x009AB1)) == 6 && byte(0x009AB1) == 39) || 
               (prev(byte(0x009AB2)) == 6 && byte(0x009AB2) == 39) || 
               (prev(byte(0x009AB3)) == 6 && byte(0x009AB3) == 39) || 
               (prev(byte(0x009AB4)) == 6 && byte(0x009AB4) == 39) || 
               (prev(byte(0x009AB5)) == 6 && byte(0x009AB5) == 39) || 
               (prev(byte(0x009AB6)) == 6 && byte(0x009AB6) == 39) || 
               (prev(byte(0x009AB7)) == 6 && byte(0x009AB7) == 39) || 
               (prev(byte(0x009AB8)) == 6 && byte(0x009AB8) == 39) || 
               (prev(byte(0x009AB9)) == 6 && byte(0x009AB9) == 39) || 
               (prev(byte(0x009ABA)) == 6 && byte(0x009ABA) == 39) || 
               (prev(byte(0x009ABB)) == 6 && byte(0x009ABB) == 39) || 
               (prev(byte(0x009ABC)) == 6 && byte(0x009ABC) == 39))
)

// ========================================================
// 11 - Dusty Dunes
// * Fix it, Jeff II (5) - fix the broken laser
// * Fighter Pilot Eyes (5) - find both sesame seeds in the desert
// * Dusty Dunes Slot Trio (5) - get 7-7-7 on slots
 
// south facing (7s) => PSI caramel            96FB => 0x0A44 (2628)
// west facing (limes) => Can of Fruit Juice   96FB => 0x0AC9 (2761)
// east facing (bars) => Skip Sandwich         96FB => 0x09B6 (2486)
// north facing (lemons) => Chick              96FB => 0x0934 (2356)
achievement(
    title = "Dusty Dunes Slot Trio", description = "Get 7-7-7 on slots", points = 5,
    id = 9010, published = "6/15/2014 3:53:23 PM", modified = "10/28/2014 3:17:13 AM",
    trigger = current_secondary_map() == 17211 && never(current_primary_map() != 18398) &&
              current_music() == 51 && 
              current_dialog_message() == 779 &&
              current_check_dialog_message_pointer() == 2628
)

achievement(
    title = "Fighter Pilot Eyes", description = "Find both Sesame Seeds in the desert", points = 5,
    id = 8941, published = "6/14/2014 3:02:00PM", modified = "12/05/2014 01:42:00 AM",
    trigger = current_secondary_map() == 17211 && never(current_primary_map() != 18398) &&
              unless(current_music() != 51) &&
              current_music() == 51 &&
              (trigger_dialog(782, 3268) || // talk to black second
               trigger_dialog(783, 3432))    // talk to white second
)

// ========================================================
// 12 - Fourside
// * Eagle Eyes (5) - return the Contact Lens to the man upstairs in the bakery.
// * Dry White Toast (1) - watch the Runaway Five perform at the Topolla

achievement(
    id = 9104, published = "6/18/2014 5:59:18 PM", modified = "10/28/2014 1:52:10 AM",
    title = "Dry White Toast", description = "Catch the 'Runaway Five' at the Topolla Theater", points = 1,
    trigger = never(current_primary_map() != 11526) && 
              current_secondary_map() == 10246 && 
              prev(current_music()) == 78 && 
              current_music() == 140
)

// ========================================================
// 13 - Desert Mine
// * Roughly the Third Strongest, Give or Take (1) - defeat all five guardian moles [TRIGGERS EARLY] - music changes
// * Gettin' the Band Back Together (1) - watch the Runaway Five perform at the Topolla again
// * Project DIVA (5) - watch Venus' performance (re-enter stage)

achievement(
    title = "Roughly the Third Strongest, Give or Take", description = "Defeat all five Guardian Diggers", points = 1,
    id = 9105, published = "6/18/2014 8:29:17 PM", modified = "10/17/2014 2:27:03 AM",
    trigger = current_primary_map() == 0 && 
              current_secondary_map() == 0 && 
              once(current_music() == 40) &&             // underground music
              once(current_music() == 103) &&            // battle music
              current_music() == 51 &&                   // outside music
              once(word(0x00A21C) == 42) &&              // fighting a guardian mole
              high4(0x9C2A) == 15 && bit0(0x9C2B) == 1   // all five defeated
)

achievement(
    title = "Gettin' the Band Back Together", description = "One last performance from the Runaway Five!", points = 1,
    id = 9152, published = "6/19/2014 12:12:45 AM", modified = "10/28/2014 1:40:39 AM",
    trigger = never(current_primary_map() != 11526) && 
              current_secondary_map() == 10246 && 
              current_dialog_message_pointer() == 38040 && // van driving off stage
              current_music() == 140
)

// ========================================================
// 14 - Department Store
// * The Auto-Fight of Your Life (5) - defeat the Department Store Spook using auto-battle
// * Everdead (5) - make Everdred repeat himself twice
// * This is Madness (1) - check the cabinet behind the counter

achievement(
    title = "Everdead", description = "Try Everdred's patience as he shares his last words", points = 5,
    id = 9330, published = "6/23/2014 11:22:38 PM", modified = "12/7/2014 1:49:25 AM",
    trigger = never(current_primary_map() != 23543) && 
              current_secondary_map() == 17172 && 
              current_music() == 17 && 
              current_dialog_message() == 952 &&
              current_dialog_message_pointer() == 14678
)

achievement(
    title = "This is Madness!", description = "Welcome to Mooooonsiiiide", points = 1,
    id = 9332, published = "6/24/2014 12:43:56 AM", modified = "10/17/2014 2:27:22 AM",
    trigger = never(current_primary_map() != 0) && 
              current_secondary_map() == 0 && 
              current_music() == 50 && 
              current_dialog_message() == 65534 &&
              current_dialog_message_pointer() == 28207
)

// ========================================================
// 15 - Monkey Cave
// * The King Banana (1) - talk to Talah Rama

achievement(
    title = "The King Banana", description = "Meet his royal highness, the Talah Rama", points = 1,
    id = 9334, published = "6/24/2014 2:20:13 AM", modified = "10/17/2014 2:27:34 AM",
    trigger = never(current_primary_map() != 992) && 
              current_secondary_map() == 6578 && 
              current_music() == 119 && 
              trigger_dialog(829, 3699)
)

// ========================================================
// 16 - Monotoli Building
// * Metal Gear Solid (10) - skip past all the Robo Sentries on the 48th floor [TRIGGERED despite fighting sentries]

achievement(
    title = "Metal Gear Solid", description = "Skip past all the Robo Sentries on the 48th floor", points = 10,
    id = 9336, published = "6/24/2014 3:18:11 AM", modified = "10/20/2014 6:18:57 PM",
    trigger = never(current_music() == 96) &&      // battle music
              once(current_music() == 139) &&      // elevator at start of level
              current_music() == 17 &&             // clumsy robot room
              current_primary_map() == 9001 &&     // clumsy robot room
              current_secondary_map() == 18323 &&  // clumsy robot room
              current_non_dialog_message_pointer() == 61463 // encounter clumsy robot
)

// ========================================================
// 17 - Fourth Sanctuary
// * Trippy Wallpaper Man (5) - defeat Shrooom! with at least one character mushroomized
// * Your Sanctuary IV (1) - claim Rainy Circle

// ========================================================
// 18 - Summers
// * A Message from Eternity (1) - meditate as Poo

achievement(
    title = "A Message from Eternity", description = "Help Poo suffer through his Mu training", points = 1,
    id = 9502, published = "6/28/2014 3:14:48 AM", modified = "10/17/2014 2:27:45 AM",
    trigger = never(current_primary_map() != 0) && 
              current_secondary_map() == 0 && 
              once(current_music() == 59) && 
              current_non_dialog_message_pointer() == 10505 &&
              once(current_music() == 255) && 
              never(trigger_menu_no())
)

// ========================================================
// 19 - Museum
// [NOTE: leave one enemy alive to be able to get You Cannot Grasp the True Form of This Achievement at end of game]
// * Release the Kraken (1) - tame the Kraken
// * What a Turd (5) - find Pokey's black dots in Saraba

// ========================================================
// 20 - Fifth Sanctuary
// * Your Sanctuary V (1) - claim Magnet Hill
// * Feel the Thunder (5) - tame Thunder and Storm without the Franklin Badge
// * Your Sanctuary VI (1) - claim Pink Cloud
// * Kingly Regalia III (1) - give Poo the Bracer of Kings

// ========================================================
// 21 - Scarabia
// * Smooshed Criminal (5) - defeat a Master Criminal Catepiller (no auto-battle) [remove equipment to prevent auto-win]

// ========================================================
// 22 - Dungeon Man
// * Tearful Goodbye (1) - leave dungeon man behind

achievement(
    id = 13616, published = "9/22/2014 2:24:02 AM", modified = "12/14/2014 11:06:19 PM",
    title = "Tearful Goodbye", description = "After a long journey, a comrade departs", points = 1,
    trigger = never(current_primary_map() != 18398) && 
              current_secondary_map() == 15227 && 
              current_music() == 107 && 
              current_dialog_message_pointer() == 13344
)

// ========================================================
// 23 - Deep Darkness
// * Truffle Uppagus (5) - Sniff out a truffle [Poo has the piggy nose]
// * OHKO (5) - Defeat Master Barf with Psi Flash beta [seems like it should be watching a22f not a22e)

achievement(
    title = "Truffle Uppagus", description = "Sniff out a truffle", points = 5,
    id = 13678, published = "9/23/2014 2:51:17 AM", modified = "5/17/2015 6:54:02 PM",
    trigger = never(word(0x000242) != 23384) && // deep darkness
              last_item_used() == 162 && // piggy nose
              current_dialog_message_pointer() == 63813
)

// ========================================================
// 24 - Stonehenge
// ! Kingly Regalia I (10) - get the Sword of Kings from a Starman Supreme and give it to Poo
// ! Because I know something you don't know (5) - defeat Starman Super Deluxe Inigo Montoya Style??

// ========================================================
// 25 - Tenda
// * Insatiable Sweet Tooth (5) - eat a cookie with sugar
// * First-Time Homeowner (5) - buy the seaside property
// * Overcoming Shyness (1) - give the book to the chief of Tenda
// * You've Come Farther (1) - have tea with the Tenda near the chief

achievement(
    title = "You've Come Farther", description = "Chill out and reminisce again, you've earned it!", points = 1,
    id = 13931, published = "9/26/2014 2:48:57 AM", modified = "10/17/2014 2:28:34 AM",
    trigger = never(current_primary_map() != 21140) && 
              current_secondary_map() == 17408 && 
              current_music() == 92 &&
              current_dialog_message() == 1257 &&
              current_dialog_message_pointer() == 56363
)

// ========================================================
// 26 - Seventh Sanctuary
// ! Fix it, Jeff IV (5) - collect a parabolic antenna from an Uncontrollable Sphere and repair it
// * Kingly Regalia IV (1) - give Poo the Diadem of Kings [TRIGGERED EARLIER] [already collected in save 26]
// * Your Sanctuary VII (1) - claim Lumine Hall

// ========================================================
// 27 - Underworld
// * Kingly Regalia II (1) - give Poo the Cloak of Kings
// * Diamond Dogs (10) - defeat Diamond Dog with at least one character diamondized
// * Your Sanctuary VIII (1) - claim Fire Springs
// ! Fallen Star (5) - Give Ness a Star Pendant [drop from Major Psychic Psycho] 

achievement(
    title = "Diamond Dogs", description = "Tame Diamond Dog with at least one character Diamondized", points = 10,
    id = 14386, published = "10/3/2014 2:47:31 AM", modified = "10/17/2014 2:31:28 AM",
    trigger = never(word(0xa268) != 83) &&     // enemy = diamond dog (27 = carbon dog)
              current_music() == 103 &&
              trigger_battle_won() &&
              ((bit1(0x0099DC) == 1) ||         // diamondized
               (bit1(0x009A3B) == 1) ||         // diamondized 
               (bit1(0x009A9A) == 1) ||         // diamondized
               (bit1(0x009AF9) == 1))           // diamondized
)

// ========================================================
// 28 - Magicant
// * Who Needs Courage (5) - get all five Flying Men killed
// * Ness' Nightmare (5) - defeat Ness' Nightmare after it runs out of PP

// ========================================================
// 29 - Meteorite
// * Tendamart (5) - buy 7 Horn of Lifes from Saturn Valley and trade to Tenda merchant

// ========================================================
// 30 - Past
// * In the Bowels of Hell (5) - defeat Pokey without anyone dying
// * Time for an Off-Shore Bank Account (5) - Have $1,000,000 in the bank
// * On a Mission from God (5) - defeat Gigyas
// * Fuzzy Pickles! (10) - Get all event photos
// * Better Later Than Never (5) - get the book from the Tenda chief and return it to the Onett library
// * Polestar Reunion (5) - escort Paula back home
// * You Cannot Grasp the True Form of This Achievement (20) - die to Shattered Man in Summers Museum and use Town Map to return to world
// * Smiles and Tears (5) - Talk to Ness's mother and finish the ending
// * Kidnap Success (5) - Talk to Ness's mother with Paula
// ! Camera-shy (20) - Get only the three unavoidable photos
// ! The Cutest Ribbon of All (5) - Give Paula the Goddess Ribbon [dropped by Ghost of Starman]
// ! Bionic Slugger (5) - Give Ness the Gutsy Bat [drop from Bionic Kraken] 

achievement(
    title = "Polestar Reunion", description = "Ending - Escort Paula back home", points = 5,
    id = 15559, published = "10/16/2014 2:58:17 AM", modified = "11/2/2014 7:42:30 PM",
    trigger = never(current_primary_map() != 27614) && 
              current_secondary_map() == 22392 && 
              current_music() == 93 && 
              byte(0x00986F) == 1 &&        // character 1 = ness
              prev(byte(0x009870)) == 2 &&  // character 2 was paula
              byte(0x009870) == 0 &&        // character 2 is none
              byte(0x009871) == 0 &&        // character 3 is none
              byte(0x009872) == 0 &&        // character 4 is none
              current_non_dialog_message_pointer() == 64774
)

achievement(
    title = "Kidnap Success!", description = "Ending - Make sure Paula never goes home", points = 5,
    id = 15557, published = "10/16/2014 2:35:54 AM", modified = "11/2/2014 2:52:47 AM",
    trigger = never(current_primary_map() != 10100) && 
              current_secondary_map() == 28671 && 
              current_music() == 94 && 
              current_dialog_message() == 14 && 
              byte(0x00986F) == 1 && 
              byte(0x009870) == 2 && 
              byte(0x009871) == 0 && 
              byte(0x009872) == 0 &&
              current_dialog_message_pointer() == 22208
)

achievement(
    title = "Smiles and Tears", description = "Ending - Return home", points = 5,
    id = 15558, published = "10/16/2014 2:42:16 AM", modified = "11/2/2014 7:46:21 PM",
    trigger = never(current_primary_map() != 10100) && 
              current_secondary_map() == 28671 && 
              current_music() == 94 && 
              current_dialog_message() == 14 &&
              current_dialog_message_pointer() == 22208
)

achievement(
    title = "You Cannot Grasp the True Form of This Achievement", description = "Ending - Roam the Earth as ghost(s)", points = 20,
    id = 15451, published = "10/15/2014 1:53:21 AM", modified = "11/3/2014 2:51:49 AM",
    trigger = word(0x009A15) == 0 && // ness's HP
              bit0(0x009C63) == 1 && // after defeating gigyas
              byte(0x00986F) == 1 && // char1 = ness
              byte(0x009871) == 0 && // char3 = nobody
              byte(0x009872) == 0 && // char4 = nobody
              byte(0x00B53B) == 93 && // music
              ((byte(0x009870) == 2) || // char2 = paula 
               (byte(0x009870) == 0))   // char2 = nobody
)

