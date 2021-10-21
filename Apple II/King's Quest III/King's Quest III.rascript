// King's Quest III: To Heir is Human
// #ID=17931

// apple2online [nib] - 2.0A 3/13/88
// * Disk1 Front: 672bc970b2fb7ce5196aaea5f352db0a
// * Disk1 Back : 5f7173c2f1b83c1d3f1689d2e6828527
// * Disk2 Front: 39defab9848473f907ae74014bf3043d
// * Disk2 Back : f852ac1bc5dd5399fa4643498e6b3676
// * Disk3 Front: 2a46afecdc07d35ccec48ab1d599a9c1
// * Disk3 Back : 4d9e6c26013dbfd5cc69b7d2f6cf64f4
// * Disk4 Front: eecff1ef24c4e4a6c127d6dc75266cdb
// * Disk4 Back : ae274568a27e15729cc50a0251e57ca7
// * Disk5 Front: 56ee4e9df35fc0a381b429229d56b0a6
// * Disc5 Back : 7d9c8e44565f77a456edec06a7ab7522

// archive.org (4am and san inc crack) [dsk] - 2.0A 3/13/88
// * Disk1 Front: 6797501abd69a5ebf43a0afd7a1a123a
// * Disk1 Back : f35cf26bef5a3e60e5a0cbedfe39a038
// * Disk2 Front: a728e92049696db5e164d95ef3fdb7cc
// * Disk2 Back : e1a71ac3ac8bbb76054985608d17ecae
// * Disk3 Front: 3988249f343013a5f6b77f7849768c5c
// * Disk3 Back : 22eec53103e160640d4dddfa5241ef59
// * Disk4 Front: bf8e0f8706328c2bd14caf31d4bf1375
// * Disk4 Back : 4c139a3f6766f3c3e18d60fef7395fc3
// * Disk5 Front: 60002b432259775ae0ebaa570d9028b8
// * Disk5 Back : 1ca154925f519bbed3e71d2819088cb7

// planetemu (first class crack) [nib] - 2.0A 3/13/88
// wowroms [nib]
// tosec 2014
// * Disk1 Front: 1779d336cadfce76ba5073f9636fd284
// * Disk1 Back : b23950713a2b00ccc69e65ac5d034e9e
// * Disk2 Front: 5d1431c132d1a170f7ce1ba9451aa62b
// * Disk2 Back : 8b1a863f31a731ce17427cae5cdc6692
// * Disk3 Front: cecb5bf6edbe537cd6c0baea44708010
// * Disk3 Back : !!!      does not exist      !!!
// * Disk4 Front: 4552adc62bf2a2c44845fcc9e0955cf2
// * Disk4 Back : a99385a985f8c5368892dc0e7e954919
// * Disk5 Front: 02234bf36278ec7de03a25f7535ba670
// * Disc5 Back : 120e6adf384c31820e605c1319653fd0


// archive.org (IIGS) woz - unusuable due to size
// * Disk1: 60246448500776ce9bc758ce6cdaee18

// push 0 for version information

// ========================================================
// SEMI    UP    APOSTROPHE      1 Sound      Ctrl+E repeat
// LEFT    +     RIGHT           3 Save       Ctrl+C cancel
// PERIOD  DOWN  SLASH           5 Restore
//                               7 Restart
// EQUALS=swim
// ========================================================

// To create a save disk, once the game has started:
// * Click on the drive 2 icon. When it prompts you to select a disk, enter a name for the save disk - 
//   i.e. "Save Disk.dsk" (extension must match disk in drive 1) - and press Open
// * Type INIT DISK and press return.
// * Press 2 to select the second drive.
// * Press return - expect "The disk has been initialized"
// * Press return

// ITEMS
// -----
// 
// 1   Chicken Feather*      18  Dried Acorns*        35  Empty Lard Jar
// 2   Cat Hair*             19  Empty Pouch*         36  Invisibility Ointment
// 3   Dog Hair*             20  Sleep Powder         37  Magic Wand
// 4   Snakeskin*            21  Mandrake Root        38  Brass Key*
// 5   Powdered Fish Bone*   22  Fish Oil             39  Magic Rose Essence
// 6   Thimble               23  Cat Cookie*          40  Bowl
// 7   Thimble & Dew*        24  Porridge             41  Spoon
// 8   Dough in Ears         25  Poisoned Porridge    42  Empty Cup
// 9   Eagle Feather*        26  Cup & Ocean Water*   43  Mirror*
// 10  Fly Wings*            27  Spoonful of Mud*     47  Empty Purse
// 11  Saffron               28  Toadstool Powder*    48  Purse & Gold Coins*
// 12  Rose Essence*         29  Empty Jar*           49  Bread
// 13  Salt*                 30  Storm Brew           50  Fruit
// 14  Amber Stone           31  Toad Spittle*        51  Mutton
// 15  Mistletoe             32  Lard*                52  Shovel
// 16  Magic Stone           33  Knife                53  Treasure Chest
// 17  Nightshade Juice*     34  Cactus*              54  Magic Map*

// $1099 bread in inventory [FF=yes, 04=under bed]
// $109c fruit in inventory [FF=yes, 04=under bed]
// $10A8 magic map in inventory [FF=yes, 04=under bed]
function item_location(item_id) => byte(0x1006 + item_id * 3)

item_chicken_feather = 1
item_cat_hair = 2
item_dog_hair = 3
item_snakeskin = 4
item_powdered_fish_bone = 5
item_thimble = 6
item_thimble_and_dew = 7
item_dough_in_ears = 8
item_eagle_feather = 9
item_fly_wings = 10
item_saffron = 11
item_rose_essence = 12
item_salt = 13
item_amber_stone = 14
item_mistletoe = 15
item_magic_stone = 16
item_nightshade_juice = 17
item_acorns = 18
item_empty_pouch = 19
item_sleep_powder = 20
item_mandrake_root = 21
item_fish_oil = 22
item_cat_cookie = 23
item_porridge = 24
item_poisoned_porridge = 25
item_ocean_water = 26
item_mud = 27
item_toadstool_powder = 28
item_empty_jar = 29
item_storm_brew = 30
item_toad_spittle = 31
item_lard = 32
item_knife = 33
item_cactus = 34
item_empty_lard_jar = 35
item_invisibility_ointment = 36
item_magic_wand = 37
item_brass_key = 38
item_magic_rose_essence = 39
item_bowl = 40
item_spoon = 41
item_empty_cup = 42
item_mirror = 43
item_empty_purse = 47
item_purse_and_gold_coins = 48
item_bread = 49
item_fruit = 50
item_mutton = 51
item_shovel = 52
item_treasure_chest = 53
item_magic_map = 54



// LOCATIONS
// ---------
// 
// 1   Manannan's house telescope tower      48  Beach on west side of island
// 2   Mannanan's house wizard's bedroom     49  Beach on east side of island
// 3   Mannanan's house hallway              50  West side of path on island
// 4   Manannan's house Gwydion's bedroom    51  East side of path on island
// 5   Mannanan's house study                52  Path through forest on island
// 6   Manannan's house kitchen              53  Path near waterfall on island
// 7   Manannan's house entry room           54  West side of mountain on island
// 8   Manannan's house dining room          55  Outside abominable snowman cave
// 9   Manannan's house laboratory steps     56  East side of mountain on island
// 10  Manannan's house laboratory           57  Cave maze
// 11  Desert west from ruins                58  Mountain path
// 12  Ruins                                 59  Mountain path
// 13  Forest                                60  Abominable snowman's cave
// 14  Outside the spider's cave             61  Daventry ruins
// 15  Beach east from spider's cave         62  Steps in cave
// 16  Desert north from cactus              63  Steps in cave
// 17  Forest north from acorn tree          64  Steps in cave
// 18  Mountain path                         65  Land of the Clouds west side
// 19  River with mud                        66  Land of the Clouds dragon
// 20  Beach east from river                 67  Land of the Clouds east side
// 21  Desert with cactus                    68  Daventry well
// 22  Acorn tree                            69  Land of the Clouds gnome house
// 23  Path west from town                   70  Storm in the ocean
// 24  Town                                  71  Daventry castle path west side
// 25  Dock east from town                   72  Daventry castle path east side
// 26  Desert north from snake skin          73  Daventry castle hall
// 27  Forest west from bears' house         74  Daventry castle throne room
// 28  Bears' house exterior                 75  Dock middle
// 29  Mistletoe                             76  Dock east side
// 30  Beach south from dock                 77  Ocean with ship in background
// 31  Ocean                                 78  Pirate ship crow's nest
// 32  Desert                                79  Pirate ship galley
// 33  Mountain Path                         80  Pirate ship upper deck
// 34  Manannan's house exterior             81  Pirate ship lower deck
// 35  Inside the tree trunk                 82  Pirate ship aft
// 36  Oracle's cave                         83  Pirate ship captain's cabin
// 37  Ladder outside bandits' hideout       84  Pirate ship crew's cabin
// 38  Bandits' hideout interior             85  Pirate ship cargo hold west side
// 39  Store interior                        86  Pirate ship cargo hold east side
// 40  Tavern interior                       87  Storm clouds
// 41  Three bears' house bottom floor       89  Magic map
// 42  Three bears' house top floor          94  Dock with pirate ship
// 43  Spell book                            95  East side of path on island

scene_none = 0
scene_telescope_tower = 1
scene_wizards_bedroom = 2
scene_hallway = 3
scene_gwydions_bedroom = 4
scene_study = 5
scene_kitchen = 6
scene_entry_room = 7
scene_dining_room = 8
scene_laboratory_steps = 9
scene_laboratory = 10
scene_desert1 = 11
scene_ruins = 12
scene_forest1 = 13
scene_spider_cave = 14
scene_beach1 = 15
scene_desert2 = 16
scene_forest2 = 17
scene_lower_mountain_path = 18
scene_river = 19
scene_beach2 = 20
scene_desert3 = 21
scene_acorn_tree = 22
scene_path = 23
scene_town = 24
scene_dock1 = 25
scene_desert4 = 26
scene_forest4 = 27
scene_outside_bears_house = 28
scene_mistletoe = 29
scene_beach4 = 30
scene_ocean_infinite = 31
scene_desert_infinite = 32
scene_upper_mountain_path = 33
scene_outside_house = 34
scene_inside_tree = 35
scene_oracle_cave = 36
scene_outside_bandit_hideout = 37
scene_inside_bandit_hideout = 38
scene_inside_store = 39
scene_inside_tavern = 40
scene_inside_bears_house = 41
scene_upstairs_bears_house = 42
scene_spell_book = 43
scene_intro_title = 45
scene_intro_manannan = 46
scene_intro_credits = 47
scene_island_beach1 = 148
scene_island_beach2 = 49
scene_island_path1 = 50
scene_island_path2 = 51
scene_island_path3 = 52
scene_island_path4 = 53
scene_mountainside_west = 54
scene_mountainside_cave = 55
scene_mountainside_east = 56
scene_cave_maze = 57
scene_mountain_path1 = 58
scene_mountain_path2 = 59
scene_snowmans_cave = 60
scene_daventry_ruins = 61
scene_daventry_stairs1 = 62
scene_daventry_stairs2 = 63
scene_daventry_stairs3 = 64
scene_clouds_west = 65
scene_clouds_dragon = 66
scene_clouds_east = 67
scene_daventry_well = 68
scene_clouds_gnome = 69
scene_ocean_storm = 70
scene_daventry_castle_west = 71
scene_daventry_castle_east = 72
scene_daventry_castle_hall = 73
scene_daventry_castle_throne = 74
scene_dock2 = 75
scene_dock3 = 76
scene_ocean_ship = 77
scene_ship_crows_nest = 78
scene_ship_galley = 79
scene_ship_upper_deck = 80
scene_ship_lower_deck = 81
scene_ship_aft = 82
scene_ship_captains_cabin = 83
scene_ship_crew_cabin = 84
scene_ship_cargo_hold_west = 85
scene_ship_cargo_hold_east = 86
scene_storm_clouds_ship = 87
scene_storm_clouds_dragon = 88
scene_magic_map = 89
scene_dock_with_pirate_ship = 94
scene_island_path5 = 95
scene_map_llewdor = 131
scene_map_ocean = 132
scene_map_island = 133
scene_map_daventry = 134
scene_dragon_dead = 166
scene_inventory = 255

scenes = {
    scene_telescope_tower: "in Manannan's house",
    scene_wizards_bedroom: "in Manannan's house",
    scene_hallway: "in Manannan's house",
    scene_gwydions_bedroom: "in Manannan's house",
    scene_study: "in Manannan's house",
    scene_kitchen: "in Manannan's house",
    scene_entry_room: "in Manannan's house",
    scene_dining_room: "in Manannan's house",
    scene_laboratory_steps: "in Manannan's laboratory",
    scene_laboratory: "in Manannan's laboratory",
    scene_desert1: "exploring Llewdor",
    scene_ruins: "exploring Llewdor",
    scene_forest1: "exploring Llewdor",
    scene_spider_cave: "exploring Llewdor",
    scene_beach1: "exploring Llewdor",
    scene_desert2: "exploring Llewdor",
    scene_forest2: "exploring Llewdor",
    scene_lower_mountain_path: "exploring Llewdor",
    scene_river: "exploring Llewdor",
    scene_beach2: "exploring Llewdor",
    scene_desert3: "exploring Llewdor",
    scene_acorn_tree: "exploring Llewdor",
    scene_path: "exploring Llewdor",
    scene_town: "exploring Llewdor",
    scene_dock1: "exploring Llewdor",
    scene_desert4: "exploring Llewdor",
    scene_forest4: "exploring Llewdor",
    scene_outside_bears_house: "exploring Llewdor",
    scene_mistletoe: "exploring Llewdor",
    scene_beach4: "exploring Llewdor",
    scene_ocean_infinite: "exploring Llewdor",
    scene_desert_infinite: "exploring Llewdor",
    scene_upper_mountain_path: "outside Manannan's house",
    scene_outside_house: "outside Manannan's house",
    scene_inside_tree: "exploring Llewdor",
    scene_oracle_cave: "exploring Llewdor",
    scene_outside_bandit_hideout: "exploring Llewdor",
    scene_inside_bandit_hideout: "exploring Llewdor",
    scene_inside_store: "exploring Llewdor",
    scene_inside_tavern: "exploring Llewdor",
    scene_inside_bears_house: "exploring Llewdor",
    scene_upstairs_bears_house: "exploring Llewdor",
    scene_spell_book: "casting spells",
    scene_island_beach1: "exploring a deserted island",
    scene_island_beach2: "exploring a deserted island",
    scene_island_path1: "exploring a deserted island",
    scene_island_path2: "exploring a deserted island",
    scene_island_path3: "exploring a deserted island",
    scene_island_path4: "exploring a deserted island",
    scene_mountainside_west: "exploring a mountain",
    scene_mountainside_cave: "exploring a mountain",
    scene_mountainside_east: "exploring a mountain",
    scene_cave_maze: "exploring a mountain",
    scene_mountain_path1: "exploring a mountain",
    scene_mountain_path2: "exploring a mountain",
    scene_snowmans_cave: "exploring a mountain",
    scene_daventry_ruins: "exploring Daventry",
    scene_daventry_stairs1: "exploring Daventry",
    scene_daventry_stairs2: "exploring Daventry",
    scene_daventry_stairs3: "exploring Daventry",
    scene_clouds_west: "exploring Daventry",
    scene_clouds_dragon: "exploring Daventry",
    scene_clouds_east: "exploring Daventry",
    scene_daventry_well: "exploring Daventry",
    scene_clouds_gnome: "exploring Daventry",
    scene_ocean_storm: "exploring a pirate ship",
    scene_daventry_castle_west: "exploring Daventry",
    scene_daventry_castle_east: "exploring Daventry",
    scene_daventry_castle_hall: "exploring Daventry",
    scene_daventry_castle_throne: "exploring Daventry",
    scene_dock2: "exploring Llewdor",
    scene_dock3: "exploring Llewdor",
    scene_ocean_ship: "exploring a pirate ship",
    scene_ship_crows_nest: "exploring a pirate ship",
    scene_ship_galley: "exploring a pirate ship",
    scene_ship_upper_deck: "exploring a pirate ship",
    scene_ship_lower_deck: "exploring a pirate ship",
    scene_ship_aft: "exploring a pirate ship",
    scene_ship_captains_cabin: "exploring a pirate ship",
    scene_ship_crew_cabin: "exploring a pirate ship",
    scene_ship_cargo_hold_west: "exploring a pirate ship",
    scene_ship_cargo_hold_east: "exploring a pirate ship",
    scene_storm_clouds_ship: "exploring a pirate ship",
    scene_storm_clouds_dragon: "exploring Daventry",
    scene_dock_with_pirate_ship: "exploring a pirate ship",
    scene_island_path5: "exploring a deserted island",
    scene_magic_map: "looking at a map",
    scene_map_llewdor: "exploring Llewdor",
    scene_map_ocean: "exploring a pirate ship",
    scene_map_island: "exploring a deserted island",
    scene_map_daventry: "exploring Daventry",
    scene_dragon_dead: "exploring Daventry",
}

function current_scene() => byte(0xFED3)
function current_score() => byte(0xFF03)

function needed_disk() => byte(0x92CE)
function in_intro() => current_scene() >= scene_intro_title && current_scene() <= scene_intro_credits

// Option+F -> debug mode (RAlt = option)
// Ctrl+D -> debug mode, TP <enter> [sceneid] <enter>
// type RATS ASS to enter debug mode
// type FAST TALK to enter debug mode
function is_debug_mode() => always_false() // TBD
function in_game() => current_scene() != scene_none &&
                      byte(0xB7EB) != 0 && // zero when resetting
                      // byte(0xB7EA) != 0x0F && // 0x0F when loading - also 0x0F after saving (need better solution)
                      !is_debug_mode()

function timer_seconds() => byte(0xFF73)
function timer_minutes() => byte(0xFF74)
function timer_hours() => byte(0xFF75)

function manannan_state() => byte(0xFF7F)
manannan_awake = 1
manannan_journey = 2
manannan_hungry = 3
manannan_asleep = 4

function scene_loading() => byte(0x5468) == 0xFF

function trigger_get_item(item, scene) => in_game() &&
                                          current_scene() == scene && 
                                          item_location(item) == scene_inventory && 
                                          prev(item_location(item)) != scene_inventory

function bit_changed(flag) => flag == 1 && prev(flag) != 1
function trigger_flag(flag) => in_game() && bit_changed(flag)

function flag_achievement(title, description, points, scene, flag)
{
    achievement(title, description, points,
        trigger = in_game() && current_scene() == scene && trigger_flag(flag)
    )
}

// $FED4:01 - fly into oak tree
// $FEE4:20 - room loaded? [resets during room transitions]
// $FEE4:10 - fly eagle into spiderweb, lower rope
// $FEE4:06 - ??? [manannan kill]
// $FEE6:80 - multiple [temp]
// $FEE6:04 -                                   room 61 on map
// $FEE6:02 - room 11 on map / room 49 on map
// $FEE6:01 - room 12 on map
// $FEE7:80 - room 13 on map / room 51 on map
// $FEE7:40 - room 14 on map / room 52 on map
// $FEE7:20 - room 15 on map / room 53 on map
// $FEE7:10 - room 16 on map / room 54 on map
// $FEE7:08 - room 17 on map / room 55 on map
// $FEE7:04 - room 18 on map / room 56 on map
// $FEE7:02 - room 19 on map / room 57 on map
// $FEE7:01 - room 20 on map / room 58 on map
// $FEE8:80 - room 21 on map / room 59 on map
// $FEE8:40 - room 22 on map
// $FEE8:20 - room 23 on map
// $FEE8:10 - room 24 on map
// $FEE8:08 - room 25 on map
// $FEE8:04 - room 26 on map
// $FEE8:02 - room 27 on map
// $FEE8:01 - room 28 on map
// $FEE9:80 - room 29 on map
// $FEE9:40 - room 30 on map
// $FEE9:10 - ??? [at river] [temp]
// $FEE9:04 - land ho, captain! [temp]
// $FEE9:02 - ?? bandits stolen loot
// $FEE9:01 - give money to pirates
// $FEEB:80 - ??? [in manannan's room] [temp]
// $FEEC:40 - fly into oak tree
// $FEEC:20 - start of game [temp]
// $FEEC:10 - manannan on screen
// $FEEC:02 - get water
// $FEEC:01 - get dew
// $FEED:A0 - ??? [mannanan kill]
// $FEED:10 - ??? [manannan kill]
// $FEED:08 - ??? [manannan kill]
// $FEED:04 - ??? [manannan kill]
// $FEED:02 - get mud
// $FEED:01 - use mirror on medusa
// $FEEE:80 - lower rope ladder
// $FEEE:20 - fly into oak tree
// $FEEE:10 - fly into spiderweb
// $FEEE:08 - enter manannan's room [temp] (cat present?)
// $FEEF:20 - clean office [temp]
// $FEF0:40 - mannanan first appearance
// $FEF0:20 - mannanan second appearance
// $FEF2:04 - input hidden
// $FEF2:04 - ??? [manannan kill]
// $FEF2:01 - complete talking to animals spell
// $FEF3:80 - complete flight spell
// $FEF3:40 - complete teleportation spell
// $FEF3:20 - complete sleep spell
// $FEF3:10 - complete animal cookie spell
// $FEF3:08 - complete storm brew spell
// $FEF3:04 - complete invisibility spell
// $FEF3:01 - fly into oak tree
// $FFE5:10 - avoid abominable snowman
// $FEF5:08 - abominable snowman appears
// $FEF6:80 - listen to prophecy, get amber stone
// $FEF6:04 - put pirates to sleep
// $FEF6:02 - untie rosella
// $FEF6:01 - defeat dragon
// $FEF7:40 - inventory in chest
// $FEF7:20 - get shovel
// $FEF7:08 - open chest
// $FEF7:02 - eagle flying
// $FEF7:01 - eagle feather dropped
// $FEF8:40 - hear rats talk about treasure
// $FEF8:20 - hear rats talk about treasure again
// $FEF8:10 - hear rats talk about gwydion
// $FEF8:08 - hear rats talk about cat
// $FEF8:04 - climb ladder at treehouse
// $FEF9:80 - eagle on screen
// $FEF9:10 - pirate sleeping?
// $FEF9:08 - climb ladder in ship
// $FEF9:04 - get purse
// $FEF9:02 - get inventory from chest
// $FEF9:01 - get treasure
// $FEFB:04 - [temp]
// $FEFC:02 - manannan's closet opening
// $FEFD:10 - [temp]
// $FEFE:10 - [temp] cat animation active
// $FEFE:02 - [temp] smoke animation active
// $FEFF:80 - [temp] bird animation active
// $FEFF:20 - [temp] squirrel animation active
// $FEFF:10 - [temp] squirrel animation active
// $FF3E:01 - listen to prophecy, get amber stone
// $FF5B:19 - transformed into fly
// $FF5B:1A - transformed into eagle
// $FF5D:01 - not transformed into fly
// $FF80:14 - feed poisoned porridge to manannan

// ==============================================

// completing a chore will set the chore timer to 0 and the pending chore to 0 in the same frame.
// failing a chore will set the pending chore to 0 several frames after the chore timer reaches 0.
// watch for the pending chore going to 0 in the same frame as the timer.
// * GOOD for chamber pot, clean office, feed manannan
// MIN/MAX
function pending_chore() => byte(0xFF89)
achievement("Following Orders", "Complete Manannan's chore", 5,
    trigger = in_game() &&
              pending_chore() == 0 && prev(pending_chore()) != 0 && 
              prev(word(0xFF6D)) > 0 // still had time to complete chore
)

// * GOOD
// MIN
achievement("My Best Behavior", "Don't collect any magical items before Manannan leaves", 5,
    trigger = in_game() &&
              word(0xB7EA) != 0x0F02 && // prevent trigger when loading game
              manannan_state() == manannan_journey &&
              item_location(item_chicken_feather) == scene_outside_house &&
              item_location(item_cat_hair) == scene_none &&
              item_location(item_fly_wings) == scene_telescope_tower &&
              item_location(item_rose_essence) == scene_wizards_bedroom &&
              item_location(item_brass_key) == scene_wizards_bedroom &&
              item_location(item_mirror) == scene_wizards_bedroom &&
              item_location(item_magic_map) == scene_wizards_bedroom
)

// * GOOD
// MAX
achievement("Oh, The Places You'll Go", "Find the map", 5,
    trigger = trigger_get_item(item_magic_map, scene_wizards_bedroom)
)

// MAX
achievement("Cartographer", "Fully fill in the map for Llewdor", 5,
    trigger = in_game() &&
              bit1(0xFEE6) == 1 && bit0(0xFEE6) == 1 &&
              byte(0xFEE7) == 0xFF && byte(0xFEE8) == 0xFF &&
              bit7(0xFEE9) == 1 && bit6(0xFEE9) == 1 &&
              (prev(bit1(0xFEE6)) != 1 || prev(bit0(0xFEE6)) != 1 ||
               prev(byte(0xFEE7)) != 0xFF || prev(byte(0xFEE8)) != 0xFF ||
               prev(bit7(0xFEE9)) != 1 || prev(bit6(0xFEE9)) != 1)             
)

// MIN/MAX
achievement("Gwydion's Day Out", "Walk away from the mountain", 5,
    trigger = !is_debug_mode() &&
               // room 17 map flag gets set before leaving the first scene
              ((current_scene() == scene_lower_mountain_path && 
                bit_changed(bit3(0xFEE7))) || // enter room 17
               // room 19 map flag gets set after entering the new scene
               (prior(current_scene()) == scene_lower_mountain_path &&
                bit_changed(bit1(0xFEE7))) || // enter room 19
               // room 23 map flag doesn't get set until after entering the new scene
               (prior(current_scene()) == scene_lower_mountain_path && 
                current_scene() == scene_path &&
                bit_changed(bit5(0xFEE8))))   // enter room 23
)

// MIN/MAX
function stoned_medusa_scene() => byte(0xff61)
achievement("Stony Gaze", "Defeat Medusa", 5,
    trigger = in_game() &&
              stoned_medusa_scene() == current_scene() && 
              prev(stoned_medusa_scene()) == scene_none
)

// MAX
// chicken feather, dog fur, snakeskin, powdered fish bone (@), thimble of dew
flag_achievement("It's No Babel Fish", "Complete the Understanding the Language of Creatures spell", 5,
    scene_spell_book, bit0(0xFEF2)
)

// MIN/MAX
// eagle feather/fly wings, pinch of saffron, rose petal essence
flag_achievement("Look Ma, No Hands", "Complete the Flight spell", 5,
    scene_spell_book, bit7(0xFEF3)
)

// MAX
// spoonful of salt ($), mistletoe, amber stone
flag_achievement("Hither and Yon", "Complete the Teleportation at Random spell", 5,
    scene_spell_book, bit6(0xFEF3)
)

// MAX
// acorns, nightshade juice (@), empty pouch ($)
flag_achievement("Pleasant Dreams", "Complete the Sleeping Powder spell", 5,
    scene_spell_book, bit5(0xFEF3)
)

// MIN/MAX
// mandrake root powder (@), cat hair, fish oil ($)
flag_achievement("Kitty Cookie", "Complete the Transforming Another spell", 5,
    scene_spell_book, bit4(0xFEF3)
)

// MIN/MAX
// ocean water (cup), mud (spoon), toadstool powder (@), empty jar
flag_achievement("Lightning in a Bottle", "Complete the Brewing a Storm spell", 5,
    scene_spell_book, bit3(0xFEF3)
)

// MIN/MAX
// lard ($), cactus, toad spittle (@)
flag_achievement("Now You See Me, Now You Don't", "Complete the Becoming Invisible spell", 5,
    scene_spell_book, bit2(0xFEF3)
)

// MIN
// can only be done with the Flight spell - all others require ingredients from below
achievement("House of Magic", "Complete a spell before going down the mountain", 5,
    trigger = in_game() &&
              current_scene() == scene_spell_book && 
              trigger_flag(bit7(0xFEF3)) && // complete Flight spell
              bit2(0xFEE7) == 0             // no spaces revealed on magic map
)

// MIN/MAX
function trigger_defeat_manannan() => in_game() &&
                                      current_scene() == scene_dining_room &&
                                      byte(0xFF80) == 0x14 && prev(byte(0xFF80)) != 0x14
achievement("Command Me, No More", "Defeat Manannan", 10,
    trigger = trigger_defeat_manannan()
)

// MIN/MAX
achievement("Everything in One Trip", "Defeat Manannan in under 35 minutes", 10,
    trigger = trigger_defeat_manannan() && timer_minutes() <= 35 && timer_hours() == 0
)

// MIN/MAX
flag_achievement("The Prophecy", "Hear the Oracle's Tale", 5,
    scene_oracle_cave, bit7(0xFEF6)
)

// MIN/MAX
achievement("This Isn't What I Paid For", "Board the Boat", 5,
    trigger = in_game() && 
              current_scene() == scene_ship_cargo_hold_west && 
              prev(current_scene()) == scene_ocean_infinite
)

// MIN/MAX
achievement("Overboard", "Escape from the pirates", 10,
    trigger = !is_debug_mode() &&
              prior(current_scene()) == scene_ocean_infinite &&
              (bit_changed(bit1(0xFEE6)))   // enter room 148
)

// MAX
flag_achievement("Arrrrr", "Find the buried treasure", 10,
    scene_island_beach2, bit0(0xFEF9)
)

// MAX (detour)
// use the teleportation stone to reach the caves without triggering the "successfully eluded" dialog
// (The areas in the game are: Manannan's house, Llewdor, pirate ship, mountains, and Daventry.)
achievement("Far Thither", "Reach the far side of the mountain without eluding the abominable snowman", 5,
    trigger = in_game() &&
              prev(current_scene()) == scene_mountain_path1 &&
              current_scene() == scene_mountain_path2 &&
              bit4(0xFEF5) == 0   // without getting points for eluding the abominable snowman
)

// MIN/MAX
achievement("A Kingdom of Disrepair", "Arrive in Daventry", 5,
    trigger = in_game() &&
              prior(current_scene()) == scene_mountain_path2 &&
              (trigger_flag(bit2(0xFEE6)))   // enter room 61
)

// MIN/MAX
flag_achievement("Three Heads Are Not Better Than One", "Defeat the dragon", 10,
    scene_storm_clouds_dragon, bit0(0xFEF6)
)

function complete_game() => current_scene() == scene_daventry_castle_throne &&
                            trigger_flag(bit2(0xFEFB))

// MIN/MAX
achievement("A Family Reunited", "Return home with your sister", 10,
    trigger = complete_game()
)

// MAX
achievement("The Complete Quest", "Complete the game with a perfect score", 25,
    trigger = complete_game() && current_score() >= 210
)

// MIN
achievement("The Minimal Quest", "Complete the game with less than 145 points", 25,
    trigger = complete_game() && current_score() < 145
)

// ==============================================

rich_presence_conditional_display(current_scene() == 0, "Game not started")
rich_presence_conditional_display(in_intro(), "Titles")

rich_presence_display("Gwydion is {0}, {1} of 210 points",
   rich_presence_lookup("Scene", current_scene(), scenes, "exploring Llewdor"),
   rich_presence_value("Score", current_score())
)

leaderboard("Fastest Completion", "Complete the game as fast as possible",
   start = word(0xFF28) != 0 && // gwydion has a location
           byte(0xFED8) == 1,   // user can type
   cancel = always_false(),
   submit = complete_game(),
   value = timer_hours() * 360000 + timer_minutes() * 6000 + timer_seconds() * 100,
   format = "MILLISECS"
)

// MAX ==========================================
// * Wait for Manannan to issue task. If it's feed chickens, restart (press 9).
//   - If it's clean office, go north, CLEAN OFFICE, and return south
//     <#:  Following Orders  :#>
// * Walk east
//   > GET CUP [1>1] (for water)
// * Walk north
//   > GET FOOD [3>4] (could get individually for one point each)
//     - GET BREAD [1>2]
//     - GET MUTTON [1>3]
//     - GET FRUIT [1>4]
//   > GET KNIFE [1>5]
//   > GET SPOON [1>6] (for mud)
//   > GET BOWL [1>7]
//   > (SWEEP) (if task)
//     <#:  Following Orders  :#>
// * Walk south, west, up, then north
//   > (EMPTY CHAMBER POT) (if task)
//     <#:  Following Orders  :#>
//   > LOOK ON TOP OF CLOSET (get brass key*) [3>10]
//   > OPEN CLOSET, LOOK BEHIND CLOTHES (get map*) [7>17]
//     <#:  Oh, the Places You'll Go  :#>
//   > OPEN DRAWER (of the dresser) (get rose petal essence*) [1>18]
//   > OPEN DRAWER (below the mirror) (get mirror*) [1>19]
// * Walk south, then east
//   > HIDE ALL [4>23] {A}
// * Walk west, and wait for Manannan to leave
// * Walk east
//   > GET ALL
// * Walk west, then up
//   > GET FLY* [1>24]
// * Walk down twice, and north. Leave and return until the cat is there.
//   > GET CAT (repeat until caught), GET CAT HAIR [1>25]
// * Walk south twice
//   > OPEN GATE, GET CHICKEN, GET FEATHER [1>26], OPEN GATE
// * Walk south {B}
// * Walk south twice (carefully), then east
//     <#:  Gwydion's Day Out  :#>
//   > GET MUD [1>27]
// * Walk east, onto the beach, then south, step into the water
//   > GET WATER [1>28]
// * Walk south again to get the bottom right scene on the map
//   > LOOK MAP
// * Teleport back to the base of the mountain and go west twice {C}
//   - Turn right and wait for Medusa to arrive. When she gets close, USE MIRROR [5>33]
//     <#:  Stony Gaze  :#>
// * Walk south
//   > GET CACTUS [1>34]
// * Walk south twice (this goes through one screen on disk 3A, but helps fill out the map)
//   > GET SNAKE SKIN [1>35]
// * Walk east twice. Exit and return until the eagle flies through and drops a feather
//   - consider making a temporary save and if it takes more than four tries, reload to avoid wasting timer time
//   - the eagle also appears in the screens left and right of the waterfall, but I'm not sure if it drops feathers there
//   > GET FEATHER [2>37]
// * Walk east and north
//   > GET MISTLETOE [1>38]
// * Walk west. If you see any bears, leave and return.
//   > OPEN DOOR
// * Walk inside {D}
//   > GET BOWL [2>40]
//   - Save here - the next room sometimes bugs out and you can't leave it.
// * Walk upstairs
//   > OPEN DRAWER, GET THIMBLE [1>41]
//   - If it says you're not close enough, leave and return and try again.
// * Walk downstairs, exit house
//   > GET DEW from flowerbed [1>42]
// * Walk west, then north
//   > GET ACORNS [1>43] (repeat until you find dried acorns)
//   > REACH INTO HOLE [3>46]
// * Climb up [2>48] {E}
//   > LOOK INTO SHACK - if someone is moving, climb down and back up and try again
// * Enter shack 
//   > GET PURSE [4>52]
// * Leave, climb down, and walk east twice (watch out for bandits in middle scene)
//   > OPEN DOOR
// * Enter shop
//   > GET FUR from dog [1>53]
//   > BUY FISH OIL [1>54]
//   > BUY LARD [1>55]
//   > BUY POUCH [1>56]
//   > BUY SALT [1>57]
//   > LOOK MAP
// * Teleport to the base of the mountain {F}, then climb back up to Manannan's house.
//   > OPEN DOOR
// * Enter the house and walk north.
//   > OPEN CABINET (get wand) [4>61]
//   > MOVE BOOK, MOVE LEVER [5>66]
// * Walk down the steps to the laboratory
//   > GET MANDRAKE ROOT POWDER [1>67]
//   > GET NIGHTSHADE JUICE [1>68]
//   > GET POWDERED FISH BONE [1>69]
//   > GET TOAD SPITTLE [1>70]
//   > GET TOADSTOOL POWDER [1>71]
//   > GET SAFFRON [1>72]
// * Approach the book on the table {G}
//   > LOOK PAGE XXV
//     PUT MANDRAKE ROOT POWDER IN BOWL
//     PUT CAT HAIR IN BOWL
//     PUT TWO SPOONS OF FISH OIL IN BOWL
//     STIR MIXTURE
//     PUT DOUGH ON TABLE
//     PAT DOUGH INTO COOKIE
//     - MANDRAKE ROOT AND HAIR OF CAT
//     - MIX OIL OF FISH AND GIVE A PAT
//     - A FELINE FROM THE ONE WHO EATS
//     - THIS APPETIZING MAGIC TREAT
//     WAVE WAND [10>82]
//     <#:  Kitty Cookie  :#>
// * Walk up twice to return to the study
//   > MOVE LEVER
//   > MOVE BOOKS
//   > OPEN CABINET to replace wand
// * Walk south, up and east
//   > PUT COOKIE IN PORRIDGE
//   > HIDE ALL
//   > GET PORRIDGE
// * Walk west and down {H}. Wait for Manannan to return (~30:00). Walk east.
//   > GIVE PORRIDGE TO MANANNAN [12>94]
//     <#:  Command Me, No More  :#>
//     <#:  Everything in One Trip  :#>
// * Walk west, up, and east
//   > GET ALL
// * Walk west, down, and north
//   > OPEN CABINET (get wand)
//   > MOVE BOOK, MOVE LEVER
// * Walk down the steps to the laboratory and approach the book {I}
//   > LOOK PAGE II
//     PUT CHICKEN FEATHER IN BOWL
//     PUT DOG FUR IN BOWL
//     PUT DRIED SNAKE SKIN IN BOWL
//     PUT POWDERED FISH BONE IN BOWL
//     PUT THIMBLEFUL OF DEW IN BOWL
//     MIX WITH HANDS
//     SEPARATE MIXTURE INTO TWO PIECES
//     PUT DOUGH IN EARS
//     - FEATHER OF FOWL AND BONE OF FISH
//     - MOLDED TOGETHER IN THIS DISH
//     - GIVE ME WISDOM TO UNDERSTAND
//     - CREATURES OF AIR SEA AND LAND
//     WAVE WAND [10>104]
//     <#:  It's No Babel Fish  :#>
//   > LOOK PAGE IV
//     PUT A PINCH OF SAFFRON IN ESSENCE
//     - OH WINGED SPIRITS SET ME FREE
//     - OF EARTHLY BINDINGS JUST LIKE THEE
//     - IN THIS ESSENCE BEHOLD THE MIGHT
//     - TO GRANT THE PRECIOUS GIFT OF FLIGHT
//     WAVE WAND [10>114]
//     <#:  Look Ma, No Hands  :#>
//   > LOOK PAGE XIV
//     GRIND DRIED ACORNS IN MORTAR
//     PUT ACORN POWDER IN BOWL
//     PUT NIGHTSHADE JUICE IN BOWL
//     STIR MIXTURE
//     LIGHT BRAZIER
//     HEAT MIXTURE ON BRAZIER
//     SPREAD MIXTURE ON TABLE
//     - ACORN POWDER GROUND SO FINE
//     - NIGHTSHADE JUICE LIKE BITTER WINE
//     - SILENTLY IN DARKNESS YOU CREEP
//     - TO BRING A SOPORIFIC SLEEP
//     WAVE WAND
//     PUT SLEEP POWDER IN POUCH [10>124]
//     <#:  Pleasant Dreams  :#>
//   > LOOK PAGE LXXXIV
//     PUT CUP OF OCEAN WATER IN BOWL
//     LIGHT BRAZIER
//     HEAT BOWL ON BRAZIER
//     PUT MUD IN BOWL
//     PUT PINCH OF TOADSTOOL POWDER IN BOWL
//     BLOW BOWL
//     - ELEMENTS FROM THE EARTH AND SEA
//     - COMBINE TO SET THE HEAVENS FREE
//     - WHEN I STIR THIS MAGIC BREW
//     - GREAT GOD THOR I CALL ON YOU
//     WAVE WAND
//     POUR STORM BREW INTO JAR [10>134]
//     <#:  Lightning in a Bottle  :#>
//   > LOOK PAGE CLXIX
//     CUT CACTUS WITH KNIFE
//     SQUEEZE CACTUS ON SPOON
//     PUT CACTUS JUICE IN BOWL
//     PUT LARD IN BOWL
//     PUT TOAD SPITTLE IN BOWL
//     STIR MIXTURE WITH SPOON
//     - CACTUS PLANT AND HORNY TOAD
//     - I NOW START DOWN A DANGEROUS ROAD
//     - COMBINE WITH FIRE AND MIST TO MAKE
//     - ME DISAPPEAR WITHOUT A TRACE
//     WAVE WAND
//     PUT OINTMENT IN JAR [10>144]
//     <#:  Now You See Me, Now You Don't  :#>
//   > LOOK MAP
// * Teleport to the tavern (one square south and one east from Manannan's house)
//   > OPEN DOOR
// * Enter tavern. Exit and return until two bandits are sitting at the table. {J}
//   > DIP FLY WINGS IN ESSENCE, then wait for bandits to talk about their hideout. [3>147]
// * Leave, fly west two screens, fly into the hole of the oak tree [5>152]
// * Exit the tree
//   > FLY BEGONE, MYSELF RETURN
//   > LOOK MAP
// * Teleport to the beach (two spaces east from Manannan's house), walk north
//     <#:  Cartographer  :#>
// * Walk west
//   > DIP EAGLE FEATHER IN ESSENCE
// * Fly into the cave with the giant spider [4>156]. 
// * After dropping the spider in the ocean, enter the cave.
//   > TALK TO ORACLE [3>159]
//     <#:  The Prophecy  :#>
//   > LOOK MAP
// * Teleport back to Manannan's house. Walk up the mountain.
//   > OPEN DOOR
// * Enter the house and walk north. Walk down twice to the laboratory, approach the book
//   > LOOK PAGE VII
//     GRIND SALT IN MORTAR
//     GRIND MISTLETOE IN MORTAR
//     RUB STONE IN MIXTURE
//     KISS STONE
//     - WITH THIS KISS I THEE IMPART
//     - POWER MOST DEAR TO MY HEART
//     - TAKE ME NOW FROM THIS PLACE HITHER
//     - TO ANOTHER PLACE FAR THITHER
//     WAVE WAND [10>169]
//     <#:  Hither and Yon  :#>
//   > LOOK MAP
// * Teleport to the tavern (one square one east and one south).
//   > OPEN DOOR
// * Enter the tavern {K}
//   > TALK SAILORS
//   > COUNT COINS
//   > GIVE GOLD [3>172]
// * Exit the tavern, walk east twice and board the ship [2>174]
//     <#:  This Isn't What I Paid For  :#>
// * {L} Walk east. If the rats aren't here, leave and return. Wait for them to talk about the treasure (twice)
//   > GET CRATE
// * Walk west
//   > DROP CRATE next to the larger crate
//   > JUMP ON CRATE
//   > JUMP ON CRATE
//   > JUMP
// * Climb the ladder [2>176] and go east. If a crewman is here, leave and return.
//   > GET SHOVEL [1>177]
// * Walk west. If the captain is here, leave and return. Enter the cabin.
//   > OPEN CHEST
//   > GET ALL [3>180]
// * Climb down the ladder and return to the hold. Walk east. If the rats are here, leave and return. No need to
//   listen to their chatter while we wait.
// * Wait until the boat approaches land. (One of the pirates will shout "Land Ho").
//   > POUR SLEEP POWDER ON FLOOR
//   > SLUMBER HENCEFORTH
// * Walk west
//   > JUMP ON CRATE
//   > JUMP ON CRATE
//   > JUMP
// * Climb up two screens then east. Drop off the north side of the ship and swim east (near the bottom of 
//   the screen) to the island. [5>185]
//   - Use a temporary save in case the shark gets you.
//     <#:  Overboard  :#>
// * Walk east
//   > DIG to find a buried treasure five steps east of the palm tree. [7>192]
//     <#:  Arrrrr  :#>
// * Walk north, then east. Follow the path west and climb up the rock. {M} 
// * [Detour]: RUB STONE (repeat until prompted to enter disk 5). If you get teleported to the screen with
//             the abominable snowman, reload game {M}. Once you reach disk 5, climb through the maze and walk east twice.
//     <#:  Far Thither  :#>
// * Reload game {M}. Walk east to the next screen and north. Continue to follow the path to the waterfall, 
//   and climb it. Then walk east twice.
// * Stop as soon as you enter the room. Type "PUT FLY WINGS IN ESSENCE" but don't hit enter. As soon as you start
//   walking, the abominable snowman will appear. Then hit enter.
//   > PUT FLY WINGS IN ESSENCE (push enter)
//   > FLY BEGONE, MYSELF RETURN
// * Walk down the south-west path {N} [4>196].
// * Climb down the icy wall. Enter the top-left cave. Walk left, then climb down
//   and enter the bottom-middle cave. Climb up the wall and enter the middle cave. 
//   Walk east two screens and south to fall into Daventry.
//     <#:  A Kingdom in Disrepair  :#>
// * Climb up the two screens of stairs and walk west to exit the cave. {O}
//   > RUB OINTMENT ON BODY
// * Walk west
//   > STIR STORM BREW WITH FINGER
//   > BREW OF STORMS, CHURN IT UP. [7>203]
//     <#:  Three Heads Are Not Better Than One  :#>
//   > UNTIE ROSELLA [3>206]
// * Walk east twice, down the stairs, and west to the old well. Walk north twice to reach the castle.
//   Then the game will take over for the ending [4>210]
//     <#:  A Family Reunited  :#>
//     <#:  The Complete Quest  :#>

// MINIMUM (56 points less = 210-68 = 142)
// - don't get fly [1 point]
// - don't get food [3 points]
// - don't get map [7 points]
// - don't listen to bandits as fly [3 points]
// - don't fly into tree as fly [5 points]
// - don't make talking to animals spell (no chicken feather, dog fur, snakeskin, fishbone, thimble, or dew) [16 points]
// - don't make the sleeping spell (acorns, nightshade juice, pouch) [13 points]
// - don't make the teleportation spell (salt, amber stone, mistletoe) [12 points]
// - don't find the treasure (shovel) [8 points]

// I think you can get down to 138 points by not collecting any magic items not needed for the cat cookie in the first
// trip down the mountain, as you can hide the brass key under the bed without gaining points. But then you have to go
// down the mountain again to collect the rest of the magic ingredients, and come back to create the other spells.

// MINIMUM ==========================================
// * Wait for Manannan to issue task. If it's feed chickens, restart.
//   - If it's clean office, go north, CLEAN OFFICE, and return south
//     <#:  Following Orders  :#>
// * Walk east
//   > GET CUP [1>1] (for water for storm spell)
// * Walk north
//   > GET KNIFE [1>2] (for ointment spell)
//   > GET SPOON [1>3] (for mud for storm spell)
//   > GET BOWL [1>4] (for ointment spell)
//   > (SWEEP) (if task)
//     <#:  Following Orders  :#>
// * Walk south, west, up
//   - If task is empty chamber pot, walk north, EMPTY CHAMBER POT, walk south
//     <#:  Following Orders  :#>
// * Wait for Manannan to leave
//     <#:  My Best Behavior  :#>
// * Walk north
//   > LOOK ON TOP OF CLOSET (get brass key) [3>7]
//   > OPEN DRAWER (of the dresser) (get rose petal essence) [1>8]
//   > OPEN DRAWER (below the mirror) (get mirror*) [1>9]
// * Walk south, down, and north. Leave and return until the cat is there.
//   > GET CAT (repeat until caught), GET CAT HAIR [1>10]
//   > OPEN CABINET (get wand) [4>14]
//   > MOVE BOOK, MOVE LEVER [5>19]
// * Walk down the steps to the laboratory
//   > GET MANDRAKE ROOT POWDER (for cookie) [1>20]
//   > GET TOAD SPITTLE (for ointment spell) [1>21]
//   > GET TOADSTOOL POWDER (for storm spell) [1>22]
//   > GET SAFFRON (for flight spell) [1>23]
// * Approach the book {P}
//   > LOOK PAGE IV
//     PUT A PINCH OF SAFFRON IN ESSENCE
//     - OH WINGED SPIRITS SET ME FREE
//     - OF EARTHLY BINDINGS JUST LIKE THEE
//     - IN THIS ESSENCE BEHOLD THE MIGHT
//     - TO GRANT THE PRECIOUS GIFT OF FLIGHT
//     WAVE WAND [10>33]
//     <#:  Look Ma, No Hands  :#>
//     <#:  House of Magic  :#>
// * Walk up twice to return to the study
// * Walk south twice to leave the house
// * Walk south
// * Walk south twice (carefully), then west
//     <#:  Gwydion's Day Out  :#>
// * Walk west again
//   - Turn right and wait for Medusa to arrive. When she gets close, USE MIRROR [5>38]
//     <#:  Stony Gaze  :#>
// * Walk south
//   > GET CACTUS (for ointment spell) [1>39]
// * Walk east
//   > REACH INTO HOLE [3>42]
// * Climb up [2>44] {Q}
//   > LOOK INTO SHACK - if someone is moving, climb down and back up and try again
// * Enter shack 
//   > GET PURSE [4>48]
// * Leave, climb down, and walk south, then east. If you see any bears, leave and return.
//   > OPEN DOOR
// * Walk inside
//   > GET BOWL [2>50]
// * Exit house, walk east, then north
//   > OPEN DOOR
// * Enter shop
//   > BUY FISH OIL (for cookie) [1>51]
//   > BUY LARD (for ointment spell) [1>52]
// * Leave shop, walk east, climb down the ladder and step into the water
//   > GET WATER (for storm spell) [1>53]
// * Walk north, then west
//   > GET MUD (for storm spell) [1>54]
// * Leave and return until the eagle shows up.
//   > GET FEATHER (for flight spell) [2>56]
// * Walk north
//   > DIP EAGLE FEATHER IN ESSENCE
// * Fly into the cave with the giant spider [4>60]. 
// * After dropping the spider in the ocean, enter the cave.
//   > TALK TO ORACLE [3>63]
//     <#:  The Prophecy  :#>
// * Leave cave, walk south, west, then climb back up to Manannan's house.
// * Enter the house, walk north, then down into the basement. Approach the book. {R}
//   > LOOK PAGE XXV
//     PUT MANDRAKE ROOT POWDER IN BOWL
//     PUT CAT HAIR IN BOWL
//     PUT TWO SPOONS OF FISH OIL IN BOWL
//     STIR MIXTURE
//     PUT DOUGH ON TABLE
//     PAT DOUGH INTO COOKIE
//     - MANDRAKE ROOT AND HAIR OF CAT
//     - MIX OIL OF FISH AND GIVE A PAT
//     - A FELINE FROM THE ONE WHO EATS
//     - THIS APPETIZING MAGIC TREAT
//     WAVE WAND [10>73]
//     <#:  Kitty Cookie  :#>
// * Walk up twice to return to the study
//   > MOVE LEVER
//   > MOVE BOOKS
//   > OPEN CABINET to replace wand
// * Walk south, up and east
//   > PUT COOKIE IN PORRIDGE
//   > HIDE ALL [4>77]
//   > GET PORRIDGE
// * Walk west and down. Wait for Manannan to return (~30:00). Walk east. {S}
//   > GIVE PORRIDGE TO MANANNAN [12>89]
//     <#:  Command Me, No More  :#>
//     <#:  Everything in One Trip  :#>
// * Walk west, up, and east
//   > GET INVENTORY
// * Walk west, down, and north
//   > OPEN CABINET
//   > MOVE BOOKS
//   > MOVE LEVER
// * Walk down into the basement and approach the book.
//   > LOOK PAGE LXXXIV
//     PUT CUP OF OCEAN WATER IN BOWL
//     LIGHT BRAZIER
//     HEAT BOWL ON BRAZIER
//     PUT MUD IN BOWL
//     PUT PINCH OF TOADSTOOL POWDER IN BOWL
//     BLOW BOWL
//     - ELEMENTS FROM THE EARTH AND SEA
//     - COMBINE TO SET THE HEAVENS FREE
//     - WHEN I STIR THIS MAGIC BREW
//     - GREAT GOD THOR I CALL ON YOU
//     WAVE WAND
//     POUR STORM BREW INTO JAR [10>99]
//     <#:  Lightning in a Bottle  :#>
//   > LOOK PAGE CLXIX
//     CUT CACTUS WITH KNIFE
//     SQUEEZE CACTUS ON SPOON
//     PUT CACTUS JUICE IN BOWL
//     PUT LARD IN BOWL
//     PUT TOAD SPITTLE IN BOWL
//     STIR MIXTURE WITH SPOON
//     - CACTUS PLANT AND HORNY TOAD
//     - I NOW START DOWN A DANGEROUS ROAD
//     - COMBINE WITH FIRE AND MIST TO MAKE
//     - ME DISAPPEAR WITHOUT A TRACE
//     WAVE WAND
//     PUT OINTMENT IN JAR [10>109]
//     <#:  Now You See Me, Now You Don't  :#>
// * Leave the basement, then leave the house. Climb down the mountain, then go east, then south, and enter the tavern. {T}
//   > TALK SAILORS
//   > COUNT COINS
//   > GIVE GOLD [3>112]
// * Exit the tavern, walk east twice and board the ship [2>114]
//     <#:  This Isn't What I Paid For  :#>
// * Walk east
//   > GET CRATE
// * Walk west
//   > DROP CRATE next to the larger crate
//   > JUMP ON CRATE
//   > JUMP ON CRATE
//   > JUMP
// * Climb the ladder [2>116] and enter the cabin.
//   > OPEN CHEST
//   > GET ALL [3>119]
// * Wait for a pirate to shout "Land Ahoy" {U}, then go up and right and jump off the boat.
// * Swim east (near the bottom of the screen) to the island. [5>124]
//     <#:  Overboard  :#>
// * Walk east
// * Walk north, then east. Follow the path west and climb up the rock.
// * Walk east to the next screen and north. Continue to follow the path to the waterfall, 
//   and climb it. {V} 
// * Type "PUT EAGLE FEATHER IN ESSENCE" but don't hit enter.
// * Head east twice. At some point, the abominable snowman will appear.
//   > PUT EAGLE FEATHER IN ESSENCE (push enter)
// * In the third screen, if you haven't changed back yet
//   > EAGLE BEGONE, MYSELF RETURN
// * Walk down the south-west path [4>128]. {W}
// * Climb down the icy wall. Enter the top-left cave. Walk left, then climb down
//   and enter the bottom-middle cave. Climb up the wall and enter the middle cave. 
// * Walk east two screens and south to fall into Daventry. {X}
//     <#:  A Kingdom in Disrepair  :#>
// * Climb up the two screens of stairs and walk west to exit the cave. {Y}
//   > RUB OINTMENT ON BODY
// * Walk west
//   > STIR STORM BREW WITH FINGER
//   > BREW OF STORMS, CHURN IT UP. [7>135]
//     <#:  Three Heads Are Not Better Than One  :#>
//   > UNTIE ROSELLA [3>138]
// * Walk east twice, down the stairs, and west to the old well. Walk north twice to reach the castle. {Z}
//   Then the game will take over for the ending [4>142]
//     <#:  A Family Reunited  :#>
//     <#:  The Minimal Quest  :#>


// GLITCH?
// Before climbing up the waterfall at the end of the cliff path, type the phrase LOOK MAP but don't hit [ENTER].
// Follow the path and if a message appears stating the Abominable Snowman's presence, press [ENTER]. Push [F8] to
// stop looking at the map, and the Snowman will likely disappear. If not, hit [ENTER] then quickly press [F3](redo
//  command) and [F8] until he does.
