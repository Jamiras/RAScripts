// Doug's Big Game
// #ID = 4188
// MD5: 19e0d71a2a6090e0f59607ca4da9b156

// NOTE: $c176 seems to be an actual location enum, rather than whatever these are, 
// but these work so I'm not going to change things now.
function current_location() => word(0xc2ac)
location_dougs_block = 0x0000
location_funnie_house = 0x0513
location_funnie_house_upstairs = 0x0b1c
location_mr_dinks_house = 0x0a12

location_four_leaf_clover_mall = 0x0e0a
location_store = 0x1703
location_arcade = 0x0717

location_downtown_bluffington = 0x0520
location_sullys = 0x0815 // comic book store
location_moody_school = 0x0b15
location_costume_room = 0x0713

location_lucky_duck_park = 0x0c03
location_swirlys = 0x140c
location_hedge_maze_west = 0x0625
location_hedge_maze_east = 0x2b26

location_beebe_bluff_school = 0x0f02
location_first_classroom = 0x2217
location_second_classroom = 0x0e01
location_third_classroom = 0x160a

locations = {
    location_dougs_block: "in his neighborhood",
    location_funnie_house: "in the Funnie house",
    location_funnie_house_upstairs: "in the Funnie house",
    location_mr_dinks_house: "in Mr. Dink's garage",

    location_four_leaf_clover_mall: "at the mall",
    location_store: "at Racoon Records",
    location_arcade: "at the arcade",

    location_downtown_bluffington: "at Bullseye park",
    location_sullys: "in Sully's comic book shop",
    location_moody_school: "in the Moody school lab",
    location_costume_room: "in the costume room",

    location_lucky_duck_park: "at Lucky Duck park",
    location_swirlys: "in Swirly's",
    location_hedge_maze_west: "in the hedge maze",
    location_hedge_maze_east: "in the hedge maze",

    location_beebe_bluff_school: "at the school",
    location_first_classroom: "in the classroom",
    location_second_classroom: "in the detention room",
    location_third_classroom: "at the Weekly Beebe",
}

function current_screen() => word(0xc0ca)
screen_copyright = 0x1f27
screen_disney_interactive = 0x081f
screen_jumbo_pictures = 0x2d7b
screen_newkidco = 0x027f
screen_imagineengine = 0x2ed2
screen_mainmenu = 0x0878
screen_password = 0x3f39
screen_journal = 0x51e5
screen_map = 0x164a
screen_so_slow = 0x396a
screen_not_bad = 0x396a
screen_great_job = 0x0a3d
screen_downtown_bluffington = 0x0280
screen_phone_downtown_bluffington = 0x3d05
screen_inset_park = 0x036c
screen_sullys = 0x3df0
screen_inset_sullys = 0x55c5
screen_moody_school = 0x5948
screen_inset_moody_school = 0x0100
screen_costume_room = 0x021e
screen_beebe_bluff_school = 0x0156
screen_inset_beebe_bluff_school = 0x00b4
screen_phone_beebe_bluff_school = 0x3d05
screen_first_classroom = 0x4a52
screen_second_classroom = 0x4a54
screen_inset_second_classroom = 0x023f
screen_third_classroom = 0x51ee
screen_inset_third_classroom = 0x0139
screen_four_leaf_clover_mall = 0x562d
screen_inset_four_leaf_clover_mall = 0x1400
screen_phone_four_lead_clover_mall = 0x237f
screen_store = 0x4214
screen_inset_store = 0x7000
screen_arcade = 0x085d
screen_inset_arcade = 0x7c60
screen_lucky_duck_park = 0x7ffd
screen_inset_lucky_duck_park = 0x010e
screen_swirlys = 0x001f
screen_inset_swirlys = 0x4dbe
screen_hedge_maze_east = 0x7ffe
screen_phone_hedge_maze_east = 0x3d05
screen_hedge_maze_west = 0x06f9
screen_inset_hedge_maze_west = 0x000d
screen_dougs_block = 0x108a
screen_inset_dougs_block = 0x294a
screen_phone_dougs_block = 0x1e76
screen_mr_dinks_house = 0x35ae
screen_inset_mr_dinks_house = 0x4037
screen_funnie_house = 0x5da7
screen_inset_funnie_house = 0x2bbf
screen_upstairs_funnie_house = 0x01df
screen_inset_upstairs_funnie_house = 0x031b
screen_quailman_protector = 0x11eb
screen_quailman_intro = 0x010e
screen_quailman_failure = 0x0f2d // bob and dart like only quailman can, victor is within reach - fly away
screen_quailman_vs_meteor_shower = 0x2bc8
screen_quailman_vs_meteor_shower_victory = 0x01da
screen_quailman_vs_the_alien_invasion = 0x327f
screen_quailman_vs_the_alien_invasion_victory = 0x0c11
screen_quailman_vs_the_salmon = 0x156d
screen_quailman_vs_the_salmon_victory = 0x0c11
screen_quailman_vs_robo_roger = 0x2800
screen_quailman_vs_robo_roger_victory = 0x4066
screen_quailman_vs_klotzilla = 0x00dd
screen_quailman_vs_klotzilla_victory = 0x3abd
screen_quailman_vs_judydra = 0x00b7
screen_quailman_vs_judydra_victory = 0x0c11
screen_quailman_vs_dr_rubbersuit = 0x4d2d
screen_quailman_vs_dr_rubbersuit_victory = 0x0c11
screen_quailman_vs_robobone = 0x51ac
screen_quailman_vs_robobone_victory = 0x10ae
screen_quailman_rescues_super_sport = 0x55c0
screen_quailman_rescues_super_sport_victory = 0x0c11
screen_ending_shrug = 0x00f3
screen_ending_celebrate = 0x4d69
screen_credits = 0x0012

function coins_collected() => byte(0xc22e)

function current_quest() => byte(0xc216)
function current_quest_step() => byte(0xc228)
function quests_completed() => byte(0xc217)
function complete_quest(id) => quests_completed() > prev(quests_completed()) && prev(current_quest()) == id 

function trigger_in_game() => current_quest() != 0

function quest_achievement(name, id, location, description)
{
    achievement(title = name, description = description, points = 5,
        trigger = trigger_in_game() && complete_quest(id) && current_location() == location
    )
}

quest_none = 0

// ===== The Spaceship Part ===== (C1300493)
// [Find Al and Moo at the Moody School Science Fair]
// 0. Talk to Al at the Moody School lab (east of downtown Bluffington)
// 1. Talk to Moo at the arcade (last door at the mall)
//    [Quailman vs. Meteor Shower] Just dodge (or shoot) the meteors
// 2. Talk to Al at the Moody School lab
quest_spaceship_part = 1

// ===== Skeeter's Lost Shoes ===== (T130041F)
// [Skeeter was seen at Lucky Duck park]
// 0. Talk to Skeeter at Lucky Duck park
// 1. Talk to Skunky in the east hedge maze (east of Lucky Duck park)
// 2. Talk to Fentruck in Swirly's (south of Lucky Duck park)
// 3. Talk to Skeeter at Lucky Duck park
// 4. Talk to Mr. Dink in his garage (Doug's block)
// 5. Examine bucket of fish on pier at Lucky Duck park
//    [Quailman vs. the Salmon] Just dodge (or shoot) the fish
// 6. Talk to Skeeter at Lucky Duck park
quest_skeeters_shoes = 2

// ===== The Doodle ===== (413000FB)
// [Roger has a Doug's doodle of Mr. Bone]
// 0. Talk to Fentruck at the arcade (mall)
// 1. Talk to Mr. Bone at the school
// 2. Talk to Roger in the middle classroom at school
//    [Quailman vs. Klotzilla] Shoot the cracks on each side of the building
// 3. Talk to Roger
quest_doodle = 3

// ===== Farewell Concert ===== (813000F6)
// [The Beets' farewell concert is tonight]
// 0. Talk to Roger at the Weekly Beebe (last classroom at school)
// 1. Talk to Guy at Racoon Records (first door at mall)
// 2. Talk to Roger at the Weekly Beebe
//    [Quailman vs. Dr. Rubbersuit] Shoot both bandages on the blimp
// 3. Talk to Roger
quest_farewell_concert = 4

// ===== Missing Puppy =====
// [Al and Moo lost their puppy in the park]
// 0. Talk to Al and Moo at Lucky Duck park
// 1. Examine the puppy in the west hedge maze
// 2. Talk to Al and Moo at Lucky Duck park
//    [Qauilman vs the Alien Invasion] Just dodge the giant moths
// 3. Talk to Al and Moo at Lucky Duck park
// 4. Examine the puppy in the east hedge maze
// 5. Talk to Al and Moo at Lucky Duck park
quest_puppy = 5

// ===== Beebe's Invitations ===== (L1300162)
// [Patti was at the mall with Beebe. Big sale at Sequin World]
// 0. Talk to Beebe at the mall
// 1. Talk to Skunky in the western hedge maze (Lucky Duck park)
// 2. Talk to Roger at Lucky Duck park
//    [Quailman vs. Robo Roger] Shoot him in the face (limited ammo)
// 3. Talk to Roger
// 4. Talk to Beebe at Swirly's (south of Lucky Duck park)
quest_invitations = 6

// ===== Judy's Beret ===== {D6421F63}
// [Your sister is looking for you]
// 0. Talk to Judy upstairs in Doug's house
// 1. Talk to Beebe near the payphone at the mall
// 2. Talk to Mr. Dink at his garage (Doug's block)
// 3. Talk to Beebe near the payphone at the mall
// 4. Talk to Judy upstairs in Doug's house
//    [Quailman vs. Judy-Dra] Shoot her face three times (limited ammo)
// 5. Talk to Judy
quest_beret = 7

// ===== Poster Child ===== {N2600298}
// [Your Mom's looking for you]
// 0. Talk to Mom in the Funnie kitchen
// 1. Talk to Sully at Sully's (west of downtown Bluffington)
// 2. Talk to Mr. Swirly at Swirly's (south of Lucky Duck lake)
// 3. Talk to Judy in the costume room (east from downtown Bluffington, second door in lab)
// 4. Talk to Mr. Bone in the second classroom at school
//    [Quailman vs. RoboBone] Shoot his glasses three times (limited ammo)
// 5. Talk to Mom in the Funnie kitchen
quest_poster_child = 8

// ===== Moo's New Comic Book ===== (R130042G)
// [Moo's looking for you at the comic book store]
// 0. Talk to Moo at Sully's (west from downtown Bluffington)
// 1. Talk to Al at the arcade (eastmost door at the mall)
//    [Quailman vs. Meteor Shower] Just dodge (or shoot) the meteors
// 2. Talk to Al
// 3. Talk to Moo at Sully's
quest_comic_book = 9

// ===== Goat Emergency ===== 
// [Yaktoberfest is happening at Lucky Duck park]
// 0. Talk to Fentruck at Lucky Duck park
// 1. Examine the goat in the west hedge maze
// 2. Examine the goat near the pier at Lucky Duck park
// 3. Examine the goat in the east hedge maze
//    [Quailman rescues Super Sport] Shoot the large canisters near the bottom of the machine
// 4. Talk to Fentruck at Lucky Duck park
quest_goat = 10

// ===== Mr. Dink's New Invention ===== (513006B6)
// [Dink's totally excited about his new toy]
// 0. Talk to Mr. Dink in his garage (Doug's block)
//    [Quailman vs. the Salmon] Just dodge (or shoot) the fish
// 1. Talk to Al and Moo at the Moody school (east of downtown Bluffington)
// 2. Talk to Mr. Dink in his garage
// 3. Get the clamp from the Moody school lab
// 4. Talk to Mr. Dink in his garage
quest_dinks_toy = 11

// ===== Babysitting ===== (9128068F)
// [Patty was at Swirly's talking to Skunky]
// 0. Talk to Skunky at Swirly's (south of Lucky Duck park)
// 1. Talk to Mom at the mall
//    [Quailman vs. Meteor Shower] Just dodge (or shoot) the meteors
// 2. Talk to baby at the mall
// 3. Talk to Mom in the arcade
quest_babysitting = 12

// ===== Lost in Translation ===== (P13000BD)
// [Patty was seen playing soccer at the park]
// 0. Talk to Skeeter at Lucky Duck park
//    [Qauilman vs the Alien Invasion] Just dodge the giant moths
// 1. Talk to Beebe in the east hedge maze
// 2. Talk to Skeeter at Lucky Duck park
quest_translation = 13

// ===== The Matchmaker ===== (2130019H)
// [Beebe has plans with Patti and might be at Bullseye Park]
// 0. Talk to Beebe at downtown Bluffington (west of center)
// 1. Talk to Al and Moo at Lucky Duck park
// 2. Talk to Skeeter at the arcade
// 3. Examine the arcade machine
// 4. Talk to Beebe at downtown Bluffington (west of center)
//    [Qauilman vs the Alien Invasion] Just dodge the giant moths
// 5. Talk to Beebe
// 6. Examine the arcade machine at the arcade
// 7. Talk to Skeeter
// 8. Talk to Beebe at downtown Bluffington (west of center)
quest_matchmaker = 14

// ===== Just One More Thing ===== (H53209B3)
// [Al and Moo need your help at the park]
// 0. Talk to Al and Moo at Lucky Duck park
// 1. Talk to Mr. Swirly in Swirly's (south of Lucky Duck park)
// 2. Talk to Al and Moo at Lucky Duck park
// 3. Get picture from Judy's room (Funnie house)
// 4. Talk to Al and Moo at Lucky Duck park
// 5. Get CD from Racoon Records (first door at mall)
//    [Qauilman vs the Alien Invasion] Just dodge the giant moths
// 6. Talk to Al and Moo at Lucky Duck park
quest_one_more_thing = 15

// ===== The Wrong Package ===== {C260049H}
// [Patti might be at Bullseye Park]
// 0. Talk to Mom at downtown Bluffington (northwest of center)
// 1. Talk to Mr. Bone in the second classroom at school
//    [Quailman vs. RoboBone] Shoot his glasses three times (limited ammo)
// 2. Talk to Judy in the costume room
// 3. Talk to Chalky in downtown Bluffington (north of center)
// 4. Talk to Mr. Bone in the second classroom at school
quest_wrong_package = 16

// ===== Herman's Hunger ===== {K2321589}
// [Patti was seen near your house]
// 0. Talk to Judy in the Funnie house
//    [Quailman vs. Judy-Dra] Shoot her face three times (limited ammo)
// 1. Talk to Judy
// 2. Talk to Herman at the park
// 3. Talk to Al and Moo at the Moody School (east of downtown Bluffington)
// 4. Talk to Herman at the park
quest_hermans_hunger = 17

// ===== The Antidote =====
// [Patti was seen near Lucky Duck Lake]
// 0. Talk to Skeeter at Lucky Duck park
// 1. Get the pink potion from the science lab (east of downtown Bluffington)
// 2. Talk to Skeeter at Lucky Duck park
// 3. Get the blue potion from the science lab (east of downtown Bluffington)
// 4. Get the red potion from the science lab (east of downtown Bluffington)
//    [Quailman rescues Super Sport] Shoot the large canisters near the bottom of the machine
// 5. Get the red potion from the science lab (east of downtown Bluffington)
// 6. Talk to Al and Moo at the arcade (in the mall)
quest_antidote = 18

// ===== Garlic and Eggs =====
// [Patti was seen with an ice cream]
// 0. Talk to Skeeter at Swirly's (south of Lucky Duck park)
// 1. Talk to Roger at downtown Bluffington (west of center)
//    [Quailman vs. Dr. Rubbersuit] Shoot both bandages on the blimp
// 2. Talk to Roger
// 3. Talk to Skunky in Sully's (west of downtown Bluffington)
// 4. Talk to your mom (Funnie house)
quest_breath_mints = 19

// ===== Patti's Wacky Wizzer ===== (K1121988)
// [Chalky is looking for you]
// 0. Talk to Chalky in your neighboorhood (north of your house)
// 1. Talk to Mr. Swirly at Swirly's (south of Lucky Duck park)
// 2. Talk to Chalky in your neighborhood
//    [Quailman vs. Meteor Shower] Just dodge (or shoot) the meteors
// 3. Talk to Chalky
quest_wizzer = 20

// ===== Mr. Bone's Glasses ===== {825006FF}
// [Patti was seen at school]
// 0. Talk to Mr. Bone in the second classroom at school
// 1. Examine the desk
//    [Quailman vs. RoboBone] Shoot his glasses three times (limited ammo)
// 2. Talk to Mr. Bone
quest_glasses = 21

// ===== Judy's Errands ===== (F13006FC)
// [Mom wants you home ASAP]
// 0. Talk to Judy upstairs in the Funnie house (Doug's block)
// 1. Talk to Mr. Swirly at Swirly's (south of Lucky Duck park)
// 2. Get the book from the costume room (east from downtown Bluffington, second door in lab)
// 3. Get the CD from Racoon Records (first door in mall)
// 4. Talk to Judy upstairs in the Funnie house
//    [Quailman vs. Judy-Dra] Shoot her face three times (limited ammo)
// 5. Talk to Judy
quest_judys_errands = 22

// ===== Skeeter's Study Session ===== {H65216B2}
// [Skeeter was going to the park to study]
// 0. Talk to Skeeter at Lucky Duck park
// 1. Check the northwestern dresser in Doug's room
// 2. Talk to Judy in downtown Bluffington (northwest of center)
// 3. Get the cape from the costume room (east from downtown Bluffington, second door in lab)
// 4. Talk to Judy in downtown Bluffington
//    [Quailman vs. Judy-Dra] Shoot her face three times (limited ammo)
// 5. Talk to Judy in downtown Bluffington
// 6. Talk to Skeeter at Lucky Duck park
quest_study_session = 23

// ===== Roger's Limo =====
// [There might be someone at the mall who knows where Patti is]
// 0. Talk to Roger at the mall
// 1. Get the keys from the first classroom at the school
// 2. Talk to Roger at the mall
//    [Quailman vs. Klotzilla] Shoot the cracks on each side of the building
// 3. Talk to Roger
quest_rogers_limo = 24

// ===== Find Guy ==== (313003G7)
// [Guy was assigning stories]
// 0. Talk to Chalky in the hallway at school
// 1. Talk to Guy in the Weekly Beebe (last door in school)
// 2. Talk to Chalky in the hallway at school
// 3. Talk to Guy in the Weekly Beebe
//    [Quailman rescues Super Sport] Shoot the large canisters near the bottom of the machine
// 4. Talk to Guy
quest_beetball_game = 25

// ===== Save Sully's ===== {92581688}
// [Mr. Bone is trying to shut down Sully's]
// 0. Talk to Sully at Sully's (west of downtown Bluffington)
// 1. Talk to Mom in the kitchen at home
// 2. Talk to Judy upstairs at home
// 3. Talk to Skunky at Swirly's (south of Lucky Duck park)
// 4. Talk to Chalky in the east hedge maze (east of Lucky Duck park)
// 5. Talk to Beebe at the mall
// 6. Talk to Sully at Sully's
// 7. Talk to Mr. Bone at the school (second door)
//    [Quailman vs. RoboBone] Shoot his glasses three times (limited ammo)
// 8. Talk to Mr. Bone
quest_sullys = 26

// ===== Robodog ===== {6260005D}
// [Mr. Dink may have something to help]
// 0. Talk to Mr. Dink in his garage (Doug's block)
// 1. Examine the dog in the mall
// 2. Examine the lockers at school
//    [Quailman vs. RoboBone] Shoot his glasses three times (limited ammo)
// 3. Talk to Mr. Bone in the middle classroom
// 4. Talk to Mr. Dink in his garage
quest_robodog = 27

// ===== Beetsicles ===== (D1300267)
// [Patti was seen at Swirly's]
// 0. Talk to Mr. Swirly at Swirly's (south of Lucky Duck park)
// 1. Talk to Chalky at the Lucky Duck park pier 
// 2. Talk to Al & Moo at the Moody School (east of downtown Bluffington)
// 3. Talk to Roger at the record store (mall)
//    [Qauilman vs the Alien Invasion] Just dodge the giant moths
// 4. Talk to Roger
// 5. Talk to Fentruck at downtown Bluffington (northwest of center)
// 6. Talk to Mr. Swirly at Swirly's
quest_beetsicles = 28

// ===== Bug in a Rug ===== {5B530BB4}
// [Patti's bike was seen at the school]
// 0. Talk to Beebe at the Weekly Beebe (last classroom at school)
// 1. Get the CD at Racoon Records (first door at mall)
// 2. Talk to Roger at Racoon Records
//    [Quailman vs. Klotzilla] Shoot the cracks on each side of the building
// 3. Talk to Roger
// 4. Talk to Beebe in the mall (near the phone booth)
quest_bug_in_a_rug = 29

// ===== Good Ending (Movie Tickets) =====
// [I just saw Patti in your neighborhood]
quest_neighborhood_good_ending = 30 // race canyon

// ===== Good Ending (Swirly Extravaganza Tickets) =====
// [I just saw Patti at Racoon Records]
quest_store_good_ending = 31 // (R3900624)

// ===== Good Ending (Beets CD) =====
// [I just saw Patti in your neighborhood]
quest_neighborhood_good_ending = 32 // (R3900624)

// ===== Bad Ending (Supposed to meet tomorrow) =====
// [Patti had to do something for the Weekly Beebe]
quest_weekly_beebe_bad_ending = 33 // (97781G89)

// ===== Bad Ending (Wrong park) =====
// [I just saw Patti go into Swirly's]
quest_swirlys_bad_ending = 34 // (5C6311BB)

// ===== Bad Ending (Bumper Sticker parade) =====
// [I just saw Patti in your neighborhood]
quest_neighborhood_bad_ending = 35 // (K3621684)

// ===== Bad Ending (Roger told her to go to Swirly's) =====
// [Patti had to do something for the Weekly Beebe]
quest_school_bad_ending = 36

// ===== ??? =====
// [I just saw Patti at the mall]
quest_patti6 = 37


//      01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
// Ach   X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X  X
// Pass  X  X  X  X     X  +  +  X     X  X  X  X  X  +  +        X  +  X  +     X  +  +  X  + 
// 1st   6  3  6  3  6           8  4        2             17 16  2          11 11           5 100
// 2nd   4  9 11  4     4       10     7  9  9  3* 7              6     3        7        8    101
// 3rd                 10 15  2*                     10 10           7 13 12        9  5*    5 98

quest_achievement("The Antidote", quest_antidote, location_arcade, // First=common
                  "Find the cure for the Human Attraction Potion")

quest_achievement("Babysitting", quest_babysitting, location_arcade, // Second=common
                  "Watch Dirtbike while your mom does some shopping")

quest_achievement("Beebe's Invitations", quest_invitations, location_swirlys, // Second=uncommon, Third=common
                  "Delivery party invitations for Beebe")

quest_achievement("The Beetball Game", quest_beetball_game, location_third_classroom, // First=common, Second=uncommon
                  "Complete the Beetball Game reporting assignment")

quest_achievement("Beetsicles", quest_beetsicles, location_swirlys, // Second=common
                  "Hand out beetsicles for Mr. Swirly")

quest_achievement("Bug in a Rug", quest_bug_in_a_rug, location_four_leaf_clover_mall, // First=uncommon, Third=uncommon
                  "Get the new Beets CD for Patti")

quest_achievement("Dog Allergy", quest_wizzer, location_dougs_block, // First=rare, Second=uncommon
                  "Help Chalky retrieve the Wacky Whizzer")

quest_achievement("The Doodle", quest_doodle, location_second_classroom, // First=uncommon, Second=common
                  "Get your drawing of Mr. Bone back from Roger")

quest_achievement("The Farewell Concert", quest_farewell_concert, location_third_classroom, // First=uncommon, Second=uncommon
                  "Recover the missing press pass")

quest_achievement("Garlic and Eggs", quest_breath_mints, location_funnie_house, // First=common
                  "Eliminate your bad breath")

quest_achievement("Goat Emergency", quest_goat, location_lucky_duck_park, // First=uncommon
                  "Help Fentruck find his escaped goats")

quest_achievement("Herman's Hunger", quest_hermans_hunger, location_lucky_duck_park, // Third=common
                  "Find Herman something to eat")

quest_achievement("It'll Find Anything", quest_robodog, location_mr_dinks_house, // Third=uncommon
                  "Retrieve Mr. Dink's robot hunting dog")

quest_achievement("Judy's Beret", quest_beret, location_funnie_house_upstairs, // Third=common
                  "Return Judy's beret to her")

quest_achievement("Junk for Judy", quest_judys_errands, location_funnie_house_upstairs, // Second=rare, Third=common
                  "Complete Judy's errands")

quest_achievement("Just One More Thing", quest_one_more_thing, location_lucky_duck_park, // Second=uncommon
                  "Bring Al and Moo everything they ask for")

quest_achievement("Lost in Translation", quest_translation, location_lucky_duck_park, // First=rare, Second=common
                  "Locate the girl in the maze")

quest_achievement("Lost Puppy", quest_puppy, location_lucky_duck_park, // First=uncommon
                  "Find Al and Moo's missing youthful canine")

quest_achievement("The Matchmaker", quest_matchmaker, location_downtown_bluffington, // Second=uncommon
                  "Attempt to bribe Skeeter into asking Beebe to the dance")

quest_achievement("The Missing Shoes", quest_skeeters_shoes, location_lucky_duck_park, // Second=common
                  "Help Skeeter find his missing shoes")

quest_achievement("Moo's New Comic Book", quest_comic_book, location_sullys, // First=uncommon, Second=common
                  "Help Moo get the special edition of Man o' Steel Man")

quest_achievement("Mr. Bone's Glasses", quest_glasses, location_second_classroom, // Third=uncommon
                  "Help Mr. Bone find his missing glasses")

quest_achievement("Mr. Dink's New Invention", quest_dinks_toy, location_mr_dinks_house, // Second=common
                  "Help Mr. Dink fix a problem with his new invention")

quest_achievement("Poster Child", quest_poster_child, location_funnie_house, // Third=rare
                  "Deliver all of the posters for your mom")
                  
quest_achievement("Roger's Limo", quest_rogers_limo, location_four_leaf_clover_mall, // First=common
                  "Find Roger's keys for him")
                  
quest_achievement("Save Sully's", quest_sullys, location_second_classroom, // Third=common
                  "Convince Mr. Bone not to close Sully's")

quest_achievement("Skeeter's Study Session", quest_study_session, location_lucky_duck_park, // Third=common
                  "Attend the study session with Skeeter")

quest_achievement("The Spaceship Part", quest_spaceship_part, location_moody_school, // First=uncommon, Second=uncommon
                  "Make sure Al doesn't miss his ride")

quest_achievement("The Wrong Package", quest_wrong_package, location_second_classroom, // Third=common
                  "Return the packages to their rightful owners")

//  1: 24  12  23
//  2:  9   3  17
//  3: 18  11  29
//  4: 25   2  22
//  5: 19  15 [23]
//  6:[29] 13  27
//  7:  1 [ 3]  7
//  8:[ 1][ 3][ 7]
//  9:  5 [25] 16
// 10:[19][15][23]
// 11:[ 1][ 3][ 7]
// 12:[13]  4   8
// 13:[19][ 9]  6
// 14:[ 9][ 3][17]
// 15:[24][13] 21
// 16:[13][ 4][ 8]
// 17:[ 9][ 3][ 7]
// 18:[19][ 9][ 6]
// 19:[ 9][ 3][ 7]
// 20:[ 3] 20 [ 7]
// 21:[18][11][29]
// 22:[24][13][21]
// 23:[ 1][ 3][ 7]
// 24:[25][11][23]
// 25:[18][ 9][ 6]
// 26:[ 9][ 3][ 7]
// 27:[ 5][25][16]
// 28:[18][11][29]
// 29:[19] 28 [ 7]
// 30:[18][ 9][ 6]
// 31:[25][11][23]
// 32:[20][ 4][21]
// 33:[29][13][27]
// 34:[ 1] 14  26
// 35:[24][13][21]
// 36:[18][11][29]
// 37:[25][11][23]
// 38:[24][13][21]
// 39:[18][11][29]
// 40:[18][12][26]
// 41:[ 3][20][ 7]
// 42:[ 9][ 3][ 7]
// 43:[13][ 4][ 8]
// 41:[ 3][20][ 7]
// 42:[24][ 1][16]
// 43:[19][ 9][ 6]
// 44:[24][13][21]
// 45: 10 [ 6][22]

achievement("Found Patti", "Finally catch up to Patti", 5,
    trigger = quests_completed() == 3 &&
              current_quest() >= 30 && current_quest() <= 37 &&
              (current_screen() == screen_ending_shrug || // bad ending
               current_screen() == screen_ending_celebrate) // good ending
)

achievement("Happy Endings", "Earn a gift from Patti", 10,
    trigger = quests_completed() == 3 &&
              current_quest() >= 30 && current_quest() <= 37 &&
              (current_screen() == screen_ending_celebrate)
)

// "Power Briefs!" is in the upper left dresser in Doug's room
item_quail_underwear = 1
// "Super Vest!" is in the lower left dresser in Doug's room
item_quail_vest = 2
// "Protecto-shield!" is in the middle southern-most box in the costume room
item_quail_shield = 3

// "3rd Eye Seer!" is on the middle table in the Beebe Weekly room at school
item_quail_magnifier = 4
// "Power Latch!" is in the trees in the middle of the mall court
item_quail_buckle = 5
// "Stun Lamp!" is in the box next to the middle table in Mr. Dink's garage
item_quail_lamp = 6

// "Belt O' Steel" is in the third desk (from left) in the second row (from top) of the first classroom
item_quail_belt = 7
// "Beetball Stupefier!" is in the fish statue at downtown Bluffington
item_quail_football = 8
// "Snooze Supergizer!" is in fridge in the Funnie house
item_quail_fruit = 9 

achievement("Quail Stuff", "Collect three pieces of quail equipment in one game", 10,
    trigger = trigger_in_game() &&
              byte(0xc205) != 0 && byte(0xc209) == 0 && // first item
              byte(0xc206) != 0 && byte(0xc20d) == 0 && // second item
              byte(0xc207) != 0 && byte(0xc211) == 0    // third item
)

function quailman_health() => byte(0xc16b)
function quaileye_power() => byte(0xc16c)

achievement("Minigame Master", "Complete any minigame without taking damage", 5,
    trigger = once(current_screen() == screen_quailman_intro) &&    // initial condition = intro screen
              never(quailman_health() < prev(quailman_health())) && // disable if health drops
              unless(byte(0xc16f) != prev(byte(0xc16f))) &&         // don't disable when switching between quailman and quaildog
                                                                    // quaildog's health is not affected by quail stuff
              (current_screen() == screen_quailman_vs_meteor_shower_victory ||
               current_screen() == screen_quailman_vs_the_alien_invasion_victory ||
               current_screen() == screen_quailman_vs_the_salmon_victory ||
               current_screen() == screen_quailman_vs_robo_roger_victory ||
               current_screen() == screen_quailman_vs_klotzilla_victory ||
               current_screen() == screen_quailman_vs_dr_rubbersuit_victory ||
               current_screen() == screen_quailman_vs_judydra_victory ||
               current_screen() == screen_quailman_vs_robobone_victory ||
               current_screen() == screen_quailman_rescues_super_sport_victory)
)

achievement("Pocketful of Change", "Have 20 quarters in your inventory", 5,
    trigger = trigger_in_game() && coins_collected() == 20 && prev(coins_collected()) == 19
)


rich_presence_conditional_display(current_quest() == 0, "Titles")
rich_presence_display("Doug is {0}", rich_presence_lookup("Location", current_location(), locations))
