// Black Cauldron
// #ID=14478

// ======================================================================================
// woz-a-day

// MD5: 20521505afaa87bb93533172f0ab5467 - Disk 1 Front [woz-a-day] woz
// MD5: 7ee36f4258c655325bef305300bd6f6e - Disk 1 Back  [woz-a-day] woz
// MD5: db2d941216029330a9fe89a65dfdd459 - Disk 2 Front [woz-a-day] woz
// MD5: a3fad474e60da976c32c29bf7db7d7f7 - Disk 2 Back  [woz-a-day] woz
// MD5: 147464e241a0b6065c49e1880f0f6e0a - Disk 3       [woz-a-day] woz

// ======================================================================================
// 4am crack (ver 1.0H)

// MD5: 8899ad83dbda2e772393f98abefdc058 - Disk 1 Front [4am and san inc] dsk
//      6af43b5d837688b373529947d3fb04fc - Disk 1 Back  [4am and san inc] dsk
//      9214fdb0b3a53c5f4160ac681a2002bd - Disk 2 Front [4am and san inc] dsk
//      a7cea209c45dacf4474753a701b4229d - Disk 2 Back  [4am and san inc] dsk
//      3493f40aec829f98e4cf6ff739ff0f81 - Disk 3 Front [4am and san inc] dsk

// ======================================================================================
// The TOSEC nib files work for disks 1 and 2, but there isn't currently a
// TOSEC nib file for disk 3. The TOSEC dsk file for disk 3 is not recognized
// by the nib version of the game, and the two TOSEC disk 1s dsks won't load
// past the crack group intros, so none of the TOSEC disks are currently linked.

// MD5: 9bdd29ba1a2ea0dc693ab7b570bc6470 - Disk 1 Front [TOSEC] nib
//      3ed1e187e5337153e216a39f52843674 - Disk 1 Back  [TOSEC] nib
//      4270bb931ca1d18d2e64f5c4f5c674aa - Disk 2 Front [TOSEC] nib
//      02de27187fd6446daae8303066611f13 - Disk 2 Back  [TOSEC] nib
//      3f4cff2de283f486c4c1caf637403dff - Disk 3 Front [TOSEC] dsk

// MD5: e48d00342a916feac940b9b2b230773f - Disk 1 Front [TOSEC] dsk
//      8ecb35be4066cea48133d17ae7e67fbd - Disk 1 Back  [TOSEC] dsk
//      d14c95397c583e6938806769de01eab4 - Disk 2 Front [TOSEC] dsk
//      3e510a3d9f081b86fea270fc280f4635 - Disk 2 Back  [TOSEC] dsk
//      3f4cff2de283f486c4c1caf637403dff - Disk 3 Front [TOSEC] dsk

// ======================================================================================
// The set was made with these files from the BLACKCAULDRONFIXED_.ZIP at
// https://www.apple.asimov.net/images/games/rpg/black_cauldron/ 
// They are from 2001 and predate the TOSEC/4am files. (ver 1.0H)

// MD5: dbcc564fdd15795c4b994af26a01a09e - Disk 1 Front [?] nib
//      66f82e26d9417757ece6253dc140967c - Disk 1 Back  [?] nib
//      89d90b22588fc4217348e334c60c6900 - Disk 2 Front [?] nib
//      02de27187fd6446daae8303066611f13 - Disk 2 Back  [?] nib
//      0d0ef0cace8ccde940c06781efe2fd78 - Disk 3 Front [?] nib
//      ff48d45f7a1e7eea927d35137b5491d3 - Save Disk    [?] nib

// ======================================================================================
// These files are from apple2online.com (ver 1.0H). They seem to work, but I haven't 
// done a full playthrough using them, so they aren't currently linked.

// MD5: 829dd00b075e70c34d55aa07368f08f3 - Disk 1 Front [?] nib
//      e5d1731af96119aa80c7e3bbbd934a06 - Disk 1 Back  [?] nib
//      b055763267dbad4a855c7f91cd4e4579 - Disk 2 Front [?] nib
//      f3ce78f454a20eabed13dd9f3550ed76 - Disk 2 Back  [?] nib
//      3261ccf5fb2d352af5b9c5164d6e5a0d - Disk 3 Front [?] nib
//      3f18aea443e4be9627ed38595453340d - Disk 3 Back  [?] nib

// ======================================================================================
// https://archive.org/stream/the_black_cauldron_-_instructions/the_black_cauldron_-_instructions_djvu.txt
// ESC = Pause
// 1 = Toggle Sound
// 2 = Help
// 3 = Save
// 4 = Use
// 5 = Load
// 6 = Do (open/talk/get)
// 7 = Restart
// 8 = Look
// TAB = Status
// J = Examine
// A = Look at selected object

// ==============================================

// Ctrl+D -> debug mode, TP <enter> [sceneid] <enter>
function is_debug_mode() => byte(0x8985) == 1

function is_restoring_game() => byte(0x895F) == 1

function current_score() => byte(0xFC07)

function current_scene() => byte(0xFFE5)
scene_none = 0
scene_haunted_forest_northeast = 1  // 2F
scene_lute_tree = 2                 // 1B
scene_north_of_dallben = 3          // 1B
scene_north_of_henwen = 4           // 1B
scene_rocky_path = 5                // 2F
scene_haunted_forest_east = 6       // 2F
scene_west_of_dallben = 7           // 1B
scene_outside_dallbens_house = 8    // 1B
scene_henwens_pen = 9               // 1B
scene_haunted_forest_south = 10     // 2F
scene_haunted_forest_southeast = 11 // 2F
scene_river_west = 12               // 1B
scene_river_east = 13               // 1B
scene_river_bridge = 14             // 1B
scene_marsh_rocks = 15              // 2F
scene_marsh_edge = 16               // 2F
scene_briar_patch = 17              // 1B
scene_gurgi_field = 18              // 1B
scene_stone_wall = 19               // 1B
scene_witches_hut = 20              // 2F
scene_marsh_swamp = 21              // 2F
scene_henchmen_forest = 22          // 1B
scene_lake_rocks = 23               // 1B
scene_lake_waterfall = 24           // 1B

scene_cliff_bottom = 25             // 2B
scene_cliff_west = 26               // 2B
scene_cliff_east = 28               // 2B
scene_castle_overlook = 29          // 2B
scene_winding_path_west = 30        // 2B
scene_winding_path_east_ending = 31 // 2B
scene_winding_path_east = 32        // 2B
scene_drawbridge = 33               // 2B
scene_alligators = 34               // 2B
scene_wall_lower = 35               // 2B
scene_wall_upper = 36               // 2B
scene_castle_balcony = 37           // 3F

scene_castle_upstairs_west = 38     // 3F
scene_castle_upstairs_stairs = 39   // 3F
scene_castle_upstairs_east = 40     // 3F
scene_castle_kitchen = 41           // 3F
scene_castle_stairs = 42            // 3F
scene_castle_gargoyle = 43          // 3F
scene_castle_throne_room = 45       // 3F
scene_castle_barrels = 46           // 3F
scene_castle_entrance = 47          // 3F

scene_castle_dungeon_fflewddur = 48 // 3F
scene_castle_dungeon_stairs = 49    // 3F
scene_castle_dungeon_hall_n = 50    // 3F
scene_castle_dungeon_hall_s = 51    // 3F
scene_castle_dungeon_cell = 52      // 2B

scene_castle_crypt_tomb = 53        // 2B
scene_castle_crypt_nw = 54          // 2B
scene_castle_crypt_n = 55           // 2B
scene_castle_crypt_ne = 56          // 2B
scene_castle_crypt_sw = 57          // 2B
scene_castle_crypt_s = 58           // 2B
scene_castle_crypt_se = 59          // 2B
scene_castle_crypt_cauldron = 60    // 2B

scene_inside_dallbens_house = 61    // 1B
scene_fairy_kingdom = 62            // 1B
scene_cauldron_pile = 63            // 2F
scene_inside_witches_hut = 64       // 2F
scene_outside_gwystals_house = 65   // 1B
scene_inside_gwystals_house = 66    // 1B

scene_title = 67                    // 1F

scene_garbage_chute = 69            // 3F
scene_flying = 70                   // 1B
scene_epilogue = 71                 // 1F

scenes = {
    scene_outside_dallbens_house: "outside Dallben's house",
    scene_inside_dallbens_house: "inside Dallben's house",
    scene_henwens_pen: "at Hen Wen's pen",

    scene_fairy_kingdom: "in the Fairy Kingdom",

    scene_outside_gwystals_house: "outside Gwystal's house",
    scene_inside_gwystals_house: "inside Gwystal's house",

    scene_haunted_forest_northeast: "exploring the haunted forest",
    scene_haunted_forest_east: "exploring the haunted forest",
    scene_haunted_forest_south: "exploring the haunted forest",
    scene_haunted_forest_southeast: "exploring the haunted forest",
    
    scene_marsh_rocks: "exploring the Marshes of Morva",
    scene_marsh_edge: "exploring the Marshes of Morva",
    scene_marsh_swamp: "exploring the Marshes of Morva",   
    scene_witches_hut: "outside the witches' hut",
    scene_inside_witches_hut: "inside the witches' hut",
    scene_cauldron_pile: "inside the witches' hut",
    
    scene_rocky_path: "at the base of the cliff",
    scene_cliff_bottom: "scaling the cliff",
    scene_cliff_west: "scaling the cliff",
    scene_cliff_east: "scaling the cliff",
    scene_castle_overlook: "approaching the castle",
    scene_winding_path_west: "approaching the castle",
    scene_winding_path_east: "approaching the castle",

    scene_drawbridge: "outside the castle",
    scene_alligators: "outside the castle",
    scene_castle_balcony: "outside the castle",
    scene_wall_lower: "climbing the castle wall",
    scene_wall_upper: "climbing the castle wall",

    scene_castle_upstairs_west: "exploring the castle",
    scene_castle_upstairs_stairs: "exploring the castle",
    scene_castle_upstairs_east: "exploring the castle",
    scene_castle_kitchen: "exploring the castle",
    scene_castle_stairs: "exploring the castle",
    scene_castle_gargoyle: "exploring the castle",
    scene_castle_throne_room: "exploring the castle",
    scene_castle_barrels: "exploring the castle",
    scene_castle_entrance: "exploring the castle",

    scene_castle_dungeon_fflewddur: "exploring the castle dungeons",
    scene_castle_dungeon_stairs: "exploring the castle dungeons",
    scene_castle_dungeon_hall_n: "exploring the castle dungeons",
    scene_castle_dungeon_hall_s: "exploring the castle dungeons",
    scene_castle_dungeon_cell: "exploring the castle dungeons",

    scene_castle_crypt_tomb: "exploring the castle crypts",
    scene_castle_crypt_nw: "exploring the castle crypts",
    scene_castle_crypt_n: "exploring the castle crypts",
    scene_castle_crypt_ne: "exploring the castle crypts",
    scene_castle_crypt_sw: "exploring the castle crypts",
    scene_castle_crypt_s: "exploring the castle crypts",
    scene_castle_crypt_se: "exploring the castle crypts",
    scene_castle_crypt_cauldron: "exploring the castle crypts",
    
    scene_epilogue: "victorious",
}

rich_presence_conditional_display(current_scene() == scene_none, "Game not started")
rich_presence_conditional_display(current_scene() == scene_title, "Titles")

rich_presence_display("Taran is {0}, {1} of 230 points",
    rich_presence_lookup("Scene", current_scene(), scenes, "exploring Prydain"),
    rich_presence_value("Score", current_score())
)

item_knapsack = 0x28
item_gruel = 0x2A
item_foodwallet = 0x2B
item_bread = 0x2C
item_waterflask = 0x2D
item_water = 0x2E
item_apple = 0x2F
item_cookies = 0x30
item_rope = 0x31
item_dagger = 0x32
item_magicsword = 0x33
item_harp = 0x34
item_lute = 0x35
item_flyingdust = 0x36
item_keys = 0x37
item_cup = 0x38
item_magicword = 0x39
item_magicmirror = 0x3A
function in_inventory(id) => byte(0x1252 + id * 3)
function selected_item() => byte(0xFC12)

// https://archive.org/stream/the_black_cauldron_-_instructions/the_black_cauldron_-_instructions_djvu.txt
// ESC = Pause
// 1 = Toggle Sound
// 2 = Help
// 3 = Save
// 4 = Use
// 5 = Load
// 6 = Do (open/talk/get)
// 7 = Restart
// 8 = Look
// TAB = Status
// J = Examine
// A = Look at selected object

// ==============================================
//
//   5 - See Dallben's vision? [ALL]
//  10 - Leave Hen Wen in the protection of the fairies [MAX]
//  10 - Save Hen Wen from the castle [GURGI]
//  10 - Climb into the castle [GURGI]
//   5 - Smuggle yourself into the castle [MAX]
//  10 - Rescue the princess [ALL]
//   5 - Rescue Fflewdur Fflam [MAX]
//   5 - Cross the rocks to the Fairy Kingdom [GURGI]
//   5 - Use the Magic Word to access the Fairy Kingdom [MAX]
//   5 - Give the Lute to the Fairy King [GURGI]
//   5 - Give the Harp to the Fairy King [MAX]
//   5 - Reach the witch's hut without flying [MIN]
//  10 - Convince the witches to let you have the cauldron [ALL]
//  10 - Sacrifice yourself [MIN]
//  25 - Save Gurgi after he sacrifices himself [GURGI]
//  25 - Trick the Horned King into sacrificing himself [MAX]
//  25 - Complete the game with maximum points [MAX]
//  25 - Complete the game with minimum points [MIN]
// ---
// 200

function trigger_scene(scene) => current_scene() == scene && unless(once(is_debug_mode()))

function flag_achievement(points, title, description, scene, flag_address)
{
    achievement(title, description, points,
        trigger = trigger_scene(scene) &&
                  byte(flag_address) == 1 && prev(byte(flag_address)) == 0
    )
}

// ALL
flag_achievement(5, "The Vision", "Discover Hen Wen's magic power", scene_inside_dallbens_house, 0xFC6D)

// MAX
achievement("Safe House", "Leave Hen Wen in the protection of the fairies", 10,
    trigger = trigger_scene(scene_inside_gwystals_house) &&
              byte(0xFC33) == 1 &&                          // arrive with hen wen
              byte(0xFC24) == 0 && prev(byte(0xFC24)) != 0  // gwystal leaves
)

// MIN                  
flag_achievement(10, "When Pigs Fly", "Rescue Hen Wen from the castle (using the balcony)", scene_castle_balcony, 0xFC3A)

// MIN
flag_achievement(10, "Breaking and Entering", "Climb into the castle", scene_wall_upper, 0xFC42)

// MAX
achievement("Through the Front Door", "Smuggle yourself into the castle", 5,
    trigger = trigger_scene(scene_castle_entrance) &&
              once(byte(0xFC57) == 0) && byte(0xFC57) == 1 && // climb into cart
              never(current_scene() != scene_drawbridge && current_scene() != scene_castle_entrance) &&
              byte(0xFCE1) == 1
)    

// ALL
achievement("Damsel in Distress", "Rescue Princess Eilonwy", 10,
    trigger = trigger_scene(scene_castle_crypt_tomb) &&
              byte(0xFCA6) == 1 &&                             // bauble finds the tunnel
              byte(0xE189) >= 0x37 && byte(0xE189) <= 0x3B &&  // eilonwy X location
              byte(0xE18B) >= 0x68 && byte(0xE18B) <= 0x6C     // eilonwy Y location
)

// MAX
flag_achievement(5, "Storyteller, Minstrel, and Bard", "Rescue Fflewddur Fflam", scene_castle_dungeon_fflewddur, 0xFC52)

// MIN
achievement("Rock Jumping", "Cross the rocks to reach the Fairy Kingdom", 5,
    trigger = once(byte(0xFC20) == 0) &&                  // not triggered sinking rock
              once(byte(0xFC20) == 1) &&                  // triggered sinking rock
              trigger_scene(scene_fairy_kingdom) && 
              byte(0x0FC86) == 1 && byte(0xFC7E) == 0 &&  // land on floor
              never(current_scene() != scene_fairy_kingdom && current_scene() != scene_lake_rocks)
)

// MAX
achievement("What a Mouthful", "Use the Magic Word to access the Fairy Kingdom", 5,
    trigger = once(byte(0xFC1F) == 0) &&                  // not said magic word
              once(byte(0xFC1F) == 1) &&                  // said magic word 
              trigger_scene(scene_fairy_kingdom) && 
              byte(0x0FC86) == 1 && byte(0xFC7E) == 0 &&  // land on floor
              never(current_scene() != scene_fairy_kingdom && current_scene() != scene_lake_waterfall)
)

// MIN
achievement("Look What I Found", "Give the Lute to the Fairy King", 5, 
    trigger = trigger_scene(scene_fairy_kingdom) && 
              byte(0xFC4E) == 1 && prev(byte(0xFC4E)) == 0 &&
              prev(selected_item()) == item_lute
)

// MAX
achievement("Regifted", "Give the Harp to the Fairy King", 5, 
    trigger = trigger_scene(scene_fairy_kingdom) && 
              byte(0xFC4E) == 1 && prev(byte(0xFC4E)) == 0 &&
              prev(selected_item()) == item_harp
)

// MIN
flag_achievement(5, "Like a Frog", "Get across the Marsh of Morva without using the Flying Dust", scene_marsh_rocks, 0xFC1F)

// MAX
flag_achievement(10, "A Fair Trade", "Convince the witches to let you have the cauldron", scene_inside_witches_hut, 0xFC8C)

// MIN
achievement("A Noble Sacrifice", "Sacrifice yourself (in the castle)", 10,
    trigger = trigger_scene(scene_castle_crypt_cauldron) &&
              byte(0xFC36) == 0 && // not befriended Gurgi
              byte(0xFCA1) == 1 && prev(byte(0xFCA1)) == 0
)

// MAX (ALT)
achievement("A Debt Repaid", "Save Gurgi after he sacrifices himself", 25,
    trigger = trigger_scene(scene_river_west) &&
              byte(0xFC37) == 1 && // Gurgi sacrificed himself
              byte(0xFC20) == 3 && byte(0xFC22) == 4
)

// MAX
flag_achievement(25, "Watch Your Step", "Trick the Horned King into sacrificing himself", scene_castle_crypt_cauldron, 0xFC2D)

// MAX
achievement("The Full Story", "Complete the game with a perfect score", 25,
    trigger = trigger_scene(scene_epilogue) && 
              dword(0x8051) == 0x01010102 &&               // seems to indicate the appearance of "The End"
              byte(0x7f69) == 0 &&                         // ??
              current_score() >= 230
)

// Most of the stuff in the game has to be done one way or another to complete it, and all solutions reward
// the same number of points. The only really skippable stuff that awards points is rescuing Fflewddur,
// befriending Gurgi, and getting the best ending. As such, I really wanted to make a "Taran Wanderer"
// achievement where you complete the game without any of your companions, but they all magically show up in
// the epilogue anyway. For the lowest possible score (which I think is 179), you don't even get to see the
// epilogue, so I went that route.

achievement("Skipped a Few Chapters", "Complete the game with less than 195 points", 25, id=84702,
    trigger = current_score() < 195 &&
              !is_restoring_game() &&
            // -- jump in cauldron --
            ((trigger_scene(scene_castle_crypt_cauldron) &&
              word(0x8072) == 0x1EDB &&                    // text pointer - immediately following "We hope you'll try again and again."
              byte(0x7f69) == 1) ||                        // ??
            // -- use mirror, but don't accept sword --
             (trigger_scene(scene_epilogue) && 
              dword(0x8051) == 0x01010102 &&               // seems to indicate the appearance of "The End"
              byte(0x7f69) == 0))                          // ??
)

// ==============================================



// $12F1: 00 -> F9 pick up lute ->00 give lute to eiddileg

// $FC0E: paused?
// $FC1F: multi-use
// $FC20: see wallet under bridge
// $FC21: multi-use
// $FC23: multi-use
// $FC24: multi-use
// $FC2D: enter tomb
// $FC31: jump in cauldron (witches hut), also trick horned king to jump into cauldron
// $FC36: give apple to gurgi
// $FC37: gurgi jumps in cauldron
// $FC38: witness Hen-Wen's vision
// $FC39: feed gruel/corn to Hen-Wen
// $FC3A: throw Hen-Wen from the balcony
// $FC3B: feed gruel/corn to Hen-Wen
// $FC3E: multi-use
// $FC40: jump from balcony
// $FC42: cut vines into window
// $FC45: hen-wen scurries across the drawbridge
// $FC46: hen-wen scurries across the drawbridge
// $FC49: find Gwystal's house
// $FC4A: find Gwystal's house
// $FC4D: get wallet from under bridge
// $FC4E: give harp or lute to fairy king
// $FC52: free Fflewddur
// $FC54: fall into garbage chute
// $FC57: climb into cart
// $FC59: castle starts to collapse [temporary]
// $FC64: climb rope to cliffs (up/right)? [>2]
// $FC67: remaining water
// $FC68: is flying
// $FC69: flying dust charges remaining
// $FC6D: witness Hen-Wen's vision [multiuse]
// $FC7F: cauldron explodes
// $FC80: take corn (Hen-Wen's pen)
// $FC81: multi-use
// $FC82: multi-use
// $FC86: fall into fairy kingdom, jump from balcony
// $FC89: take lute
// $FC8A: take dagger
// $FC8C: leave hut after giving sword
// $FC8E: multi-use
// $FC90: make it through rock maze
// $FC92: break drawbridge chain with sword
// $FC94: throw rope (up/right)
// $FC95: take knapsack (Dallben's house)
// $FC96: items in cupboard (Dallben's house)
// $FC97: free Fflewddur (multi-use)
// $FC9A: take gruel (Dallben's house)
// $FC9C: get cookies (Gwystal's house)
// $FCA1: sacrifice self (castle)
// $FCA6: Eilonwy escapes
// $FCA7: turn gargoyle (crypt exit)
// $FCA8: see lute in tree [multiuse]
// $FCB0: open gate (Hen-Wen's pen)
// $FCB1: escape with Hen-Wen (through front gate)
// $FCC4: fall into garbage chute
// $FCC8: hen wen prophesized for horned king
// $FCC9: throw Hen-Wen from the balcony
// $FCCE: rescue hen wen from horned king (escape sequence)
// $FCD0: rescue hen wen from horned king (escape sequence)
// $FCD5: meet gurgi [multi-use]
// $FCDB: rescue hen wen from horned king (escape sequence)
// $FCDF: take keys
// $FCE0: break drawbridge chain with sword
// $FCE1: sneak into castle via cart
// $FCE2: get cup
// $FCE4: stones pushed (secret passage to tomb)
// $FCE6: take sword (tomb)
// $FCE7: talk to witches
// $FCF3: open chest (witches' hut)
// $FCF4: frogs escaping (witches' hut)
// $FCF6: give sword to witches
// $FCF7: open chest (witches' hut)

// ==============================================

// Maximum: https://gamerwalkthroughs.com/the-black-cauldron/
// optional paths: https://gamefaqs.gamespot.com/pc/564670-the-black-cauldron/faqs/75421

// ==============================================
// Maximum
//
// Walk east, then south
//   (6) GET FOOD WALLET from under the bridge
// Go north
//   (6) OPEN CORN SHED
//   (6) GET CORN
//   (6) OPEN GATE
//   (4) GIVE CORN to Hen Wen [5>5]
// Return to cottage
//   (6) OPEN DOOR
//   Watch Hen Wen's vision*
// Approach the fireplace
//   (6) TAKE GRUEL
// Approach the cupboard
//   (6) OPEN CUPBOARD
//   (6) GET SACK
//   (6) GET APPLE
//   (6) GET BREAD
//   (6) GET FLASK
// Leave the cottage
//   (4) USE FLASK on trough to fill it
// Walk west, then north 
//   If you see a gwythaint, leave and return
//   (8) LOOK in the hole in the tree
//   (6) GET LUTE {A}
// Walk north twice
//   If the thugs appear, quickly change screens and return
// Enter the hidden area behind the middle-back briar [4>9]
//   (6) OPEN DOOR
//   Gwystal will protect Hen Wen [20>29]*
//   (6) OPEN CUPBOARD
//   (6) GET COOKIES
// Leave, go south, west, then north
//   (6) GET DAGGER from tree
// Walk north, then west
//   shuffle through the rock maze to the black tree [5>34]
//   - Go right between the lowermost gray and blue rocks, then work your way up and left to the upper left side
//     of the screen, then go right behind the upper blue rocks and up the rocks in the back middle of the screen.
//   - https://gamerwalkthroughs.com/wp-content/uploads/2017/06/The-Black-Cauldron-Walkthrough-Rock-Maze-480x264.jpg
// Walk up to the left side of the branch/tree.
//   (4) USE ROPE
//   (6) CLIMB ROPE [5>39] (use diagonal button - ;)
// Climb to the top of the cliff [6>45], then go north.
// Continue north through the winding bridge [5>50]. Go west.
//   if the cart's not there, leave and return {B}
//   (6) HIDE IN THE CART [18>68]*
// Inside the castle:
//   (6) EXIT THE CART
// Walk north into the wine cellar
//   Stand between the back casks on the right and you'll fall into the dungeons [6>74]
//   Princess Eilonwy will talk to you [10>84]
// Go south, west twice, and north
//   (6) PUSH STONES on the far wall (repeat four times)
// Go north [10>94]
//   Princess will escape*
//   (6) GET SWORD [8>102]
// Go south twice and east
//   (4) USE STATUE
// Climb ladder, walk north
//   If the henchman in there (4) USE SWORD
//   (6) GET KEYS
//   (4) USE KEYS on northern door
// Head inside {C}
//   (4) USE KEYS to rescue Fflewddur Fflam [9>111]*, he'll give you a harp
//   Note: easter egg in the east wall, just above the bench - all you have to do is walk up to it
// Walk south, west, up the stairs, then east. Go south twice.
//   (4) USE SWORD on drawbridge chains
// Leave the castle [13>124]
// Descend back down the mountain, go east, south twice, and east twice (east of the brambles, south of the bridge).
//   if gurgi doesn't appear, go east - he's sometimes there. come back here afterwards.
//   (4) GIVE APPLE [10>134]
// Go south, cross the lower side of the screen and stand near the edge of the waterfall {D}
//   (4) USE MAGIC WORD
// Enter the cave, walk around until you fall in the hole [13>147]*
//   (6) TALK TO KING
//   (4) GIVE HARP [10>157]*
// The king will give you flying dust.
//   (4) USE FLYING DUST
// Leave through the hole
//   (4) USE MAGIC WORD
// Go west three times
//   (4) USE FLYING DUST
// Cross the water to the sandy beach on the left [15>172]
// Wait for the flying dust to wear off
//   (6) OPEN DOOR
// Go inside
//   (6) OPEN CHEST {E}
//   (6) TALK TO WITCHES (may need to approach them)
//       if you attempt to (4) USE SWORD before talking to them, a cauldron will fly at you. You can 
//       (4) USE SWORD to destroy it
//   (4) GIVE SWORD TO WITCHES [18>190]*
// You'll automatically go outside. Approach the cauldron {F}
//   (6) TAKE CAULDRON - a Gwythaint will steal it.
// Make your way back to the castle and go inside (using the dust to cross the swamp)
// Inside the castle, go north and take the secret path between the casks to fall to the crypts
// Walk south
//   SAVE {G}
// Walk east
//   When the Horned King approaches, (4) USE MIRROR [25>215]*
// The castle will collapse and you'll be washed down the stream
// Wait until the witches offer you the magic sword [15>230]
// You'll automatically pick it up and walk off into the sunset.

//   LOAD
// Walk west, climb the ladder, and walk north
//   (6) MOVE GRATE {H}
//   (6) JUMP IN CAULDRON - Gurgi will save you [20>210]
// Wait until the witches offer to resurrect Gurgi [15>225]*


// ==============================================
// Minimum
//
// Go east
//   (6) OPEN CORN SHED
//   (6) GET CORN
//   (6) OPEN GATE
//   (4) GIVE CORN to Hen Wen [5>5]
// Return to cottage
//   (6) OPEN DOOR
//   Watch Hen Wen's vision*
// Approach the cupboard
//   (6) OPEN CUPBOARD
//   (6) GET SACK
//   (6) GET APPLE
//   (6) GET BREAD
//   (6) GET FLASK
// Leave the cottage and walk south and jump in the water.
//   (4) FILL FLASK
// Swim west and go west again, then north, and west once more.
//   shuffle through the rock maze to the black tree [5>10]
//   (4) USE ROPE
//   (6) CLIMB ROPE [5>15]
// Climb to the top of the cliff [6>21], then go north [5>26].
// Hide in the cart [18>44]
// Inside the castle {I}, walk north into the wine cellar
//   Stand between the back casks on the right and you'll fall into the dungeons [6>50]
//   Princess Eilonwy will talk to you [10>60]
// Go south, west twice, and north
//   (6) PUSH STONES on the far wall (repeat four times) {J}
// Go north [10>70]
//   (6) GET SWORD [8>78]
//   Leave before the Princess escapes
// Go south twice and east
//   (6) USE STATUE
// Climb ladder, walk north
//   If the henchman in there (4) USE SWORD
// Go west, up the stairs twice, and east twice {K}
//   Wait for Hen Wen to start prophecizing
//   (6) JUMP OFF THE BALCONY
//   (6) TALK TO HEN WEN
// Go west twice, up, west twice {L}
//   (6) THROW HENWEN over balcony* [20>98]
//   (6) JUMP over balcony
// Go south twice, east, south, descend back down the mountain, east, south, east, north twice (near the right side of the screen)
//   (6) LOOK IN TREE
//   (6) GET LUTE from tree
// Go north, then east {M}
//   (6) JUMP ROCKS (R, R, D, R, U, R)
// Fall into the Fairy Kingdom [13>111]*
//   (6) TALK TO KING
//   (4) GIVE LUTE [10>121]*
//   (4) USE FLYING DUST and go up
// Go west twice, north, then west near the top of the screen {N}
//   Jump across rocks (L, D, R, D, R, D, D, L)*
// Go south [15>136]
//   (6) OPEN DOOR
// Go inside
//   (6) OPEN CHEST (must have seen eidelowg) {O}
//   (6) TALK TO WITCHES
//   (4) GIVE SWORD TO WITCHES [18>154]
// Approach the cauldron - a Gwythaint will steal it.
//   (4) USE FLYING DUST
// Fly north, then east, and wait for it to wear off. Then go north
//   (6) GET DAGGER
// Make your way back to the castle (north, west, up the cliff).
// Swim across the moat {P}, climb the wall
//   (6) USE DAGGER to break into window*
// Go east, downstairs twice, east {Q}
//   (6) MOVE GRATE
//   (6) JUMP IN CAULDRON [25>179]*

// Can also get minimum score by using the mirror, but taking one of the non-sword rewards from the witches
