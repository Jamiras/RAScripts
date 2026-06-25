// Tass Times in Tonetown
// #ID = 31993

// MD5: cb2a4697676bc50fc604438da7247a46 | Tass Times in Tonetown side A.woz
//      286391da1be944aec2df3685343eaa3d | Tass Times in Tonetown side B.woz

// https://archive.org/details/Tass_Times-Newspaper/mode/2up

function current_picks() => byte(0xBE3D)

function current_scene() => byte(0xBE00)
function current_image() => byte(0x009C)
scene_none = 0xFF
scene_inventory = 0x00
scene_cabin_living_area = 0x01
scene_cabin_kitchen = 0x02
scene_cabin_hallway = 0x03
scene_cabin_bedroom = 0x04
scene_cabin_lab = 0x05
scene_cabin_portal = 0x06
scene_construction_site_south = 0x07
scene_floatfone = 0x08
scene_jamac_salon = 0x09
scene_clothing_boutique = 0x0A
scene_tonetown_times = 0x0B
scene_tonetown_times_editor = 0x0C
scene_tonetown_times_ennio = 0x0D
scene_card_closeup = 0x0E
scene_sidewalk = 0x0F
scene_construction_site_north = 0x10
scene_fast_freddies = 0x11
scene_town_square = 0x12
scene_pet_store = 0x13
scene_party_supplies = 0x14
scene_animal_sidewalk = 0x15
scene_park = 0x16
scene_trail_e = 0x17
scene_trail_ne = 0x18
scene_trail_n = 0x19
scene_trail_nw = 0x1A
scene_sandy_patch = 0x1B
scene_well = 0x1C
scene_well_bottom = 0x1D
scene_well_cages = 0x1E
scene_tunnel_south = 0x1F
scene_tunnel_middle = 0x20
scene_tunnel_north = 0x21
scene_tunnel_tube = 0x22
scene_jaws = 0x22 // Philbert, Jawdog, and Crocogator
scene_daglets = 0x23
scene_pet_store_snarl = 0x24
scene_snarl_face = 0x25
scene_well_cages_dark = 0x26
scene_tower_penthouse_empty = 0x27
scene_forest_west = 0x28
scene_picture = 0x28
scene_forest_midwest = 0x29
scene_forest_middle = 0x2A
scene_forest_mideast = 0x2B
scene_forest_east = 0x2C
scene_wall_southwest = 0x2D
scene_wall_center = 0x2E
scene_wall_southeast = 0x2F
scene_wall_east = 0x30
scene_wall_gate = 0x31
scene_wall_northeast = 0x32
scene_mushrooms = 0x33
scene_huge_mushrooms = 0x34
scene_dust_clouds = 0x35
scene_red_devils = 0x36
scene_red_devils2 = 0x37
scene_mossy_path = 0x38
scene_boat_landing = 0x39
scene_camp = 0x3A
scene_river_southwest = 0x3B
scene_river_south = 0x3C
scene_river_middle = 0x3D
scene_river_east = 0x3E
scene_river_northeast = 0x3F
scene_waterfall_south = 0x40
scene_waterfall_north = 0x41
// 0x42 (66) ??
scene_fence_south = 0x43
scene_marsh_south = 0x44
scene_marsh_east = 0x45
// 0x46 (70) ??
scene_fence_north = 0x47
scene_fence_rowboat = 0x48
scene_lake_south = 0x49
scene_lake_southeast = 0x4A
scene_lake_east = 0x4B
scene_tower_outside = 0x4C
// 0x4D (77) ??
// 0x4E (78) ??
scene_tower_entrance = 0x4F
scene_tower_elevator = 0x50
// 0x51 (81) ??
// 0x52 (82) ??
scene_tower_elevator_card = 0x53
scene_tower_penthouse = 0x54
scene_tower_hallway = 0x55
// 0x56 (86) ??
scene_estate_jawdog = 0x57
scene_estate_southeast = 0x58
scene_estate_gate = 0x59
scene_estate_lawn = 0x5A
scene_estate_cliff_middle = 0x5B
scene_estate_cliff_east = 0x5C
scene_estate_cliff_west = 0x5D
scene_estate_inside = 0x5E
scene_estate_lab = 0x5F
scene_marsh_west = 0x60
scene_marsh_middle = 0x61
scene_marsh_northeast = 0x62
scene_march_north = 0x63
scene_estate_lab_snarl = 0x64

scenes = {
    scene_none: "Titles",
    scene_cabin_living_area: "In grandfather's cabin",
    scene_cabin_kitchen: "In grandfather's cabin",
    scene_cabin_hallway: "In grandfather's cabin",
    scene_cabin_bedroom: "In grandfather's cabin",
    scene_cabin_lab: "In grandfather's lab",
    scene_cabin_portal: "In grandfather's lab",
    scene_construction_site_south: "At the construction site",
    scene_construction_site_north: "At the construction site",
    scene_jamac_salon: "At Jamac Salon",
    scene_clothing_boutique: "At Jamac Salon",
    scene_tonetown_times: "At Tonetown Times",
    scene_tonetown_times_editor: "At Tonetown Times",
    scene_tonetown_times_ennio: "At Tonetown Times",
    scene_fast_freddies: "At Fast Freddie's",
    scene_floatfone: "In Tonetown",
    scene_sidewalk: "In Tonetown",
    scene_town_square: "At the town square",
    scene_pet_store: "At Snarl Pets",
    scene_party_supplies: "At Party Supplies",
    scene_park: "At the park",
    scene_daglets: "At the park",
    scene_pet_store_snarl: "At Snarl Pets",
    scene_trail_e: "On the nature trail",
    scene_trail_ne: "On the nature trail",
    scene_trail_n: "On the nature trail",
    scene_trail_nw: "On the nature trail",
    scene_sandy_patch: "In the forest",
    scene_well: "At the well",
    scene_well_bottom: "At the well",
    scene_well_cages: "At the well",
    scene_tunnel_south: "In a tunnel",
    scene_tunnel_middle: "In a tunnel",
    scene_tunnel_north: "In a tunnel",
    scene_tunnel_tube: "In a tunnel",
    scene_well_cages_dark: "At the well",
    scene_tower_penthouse_empty: "In the tower",
    scene_forest_west: "In the forest",
    scene_forest_midwest: "In the forest",
    scene_forest_middle: "In the forest",
    scene_forest_mideast: "In the forest",
    scene_forest_east: "In the forest",
    scene_wall_southwest: "In the forest",
    scene_wall_center: "In the forest",
    scene_wall_southeast: "In the forest",
    scene_wall_east: "In the forest",
    scene_wall_gate: "At the gate",
    scene_wall_northeast: "In the forest",
    scene_mushrooms: "Walking among the mushrooms",
    scene_huge_mushrooms: "Walking among the mushrooms",
    scene_dust_clouds: "Walking among the mushrooms",
    scene_red_devils: "In the forest",
    scene_red_devils2: "Near the lake",
    scene_mossy_path: "Near the lake",
    scene_boat_landing: "Near the lake",
    scene_camp: "Near the lake",
    scene_river_southwest: "At the river",
    scene_river_south: "At the river",
    scene_river_middle: "At the river",
    scene_river_east: "At the river",
    scene_river_northeast: "At the river",
    scene_waterfall_south: "At the waterfall",
    scene_waterfall_north: "At the waterfall",
    scene_marsh_south: "In the marsh",
    scene_marsh_east: "In the marsh",
    scene_estate_jawdog: "Exploring Snarl's estate",
    scene_estate_southeast: "Exploring Snarl's estate",
    scene_estate_gate: "Exploring Snarl's estate",
    scene_estate_lawn: "Exploring Snarl's estate",
    scene_estate_cliff_middle: "Exploring Snarl's estate",
    scene_estate_cliff_east: "Exploring Snarl's estate",
    scene_estate_cliff_west: "Exploring Snarl's estate",
    scene_estate_inside: "Exploring Snarl's estate",
    scene_estate_lab: "Exploring Snarl's estate",
    scene_marsh_west: "In the marsh",
    scene_marsh_middle: "In the marsh",
    scene_fence_south: "Near the lake",
    scene_marsh_northeast: "In the marsh",
    scene_march_north: "In the marsh",
    scene_fence_north: "Near the lake",
    scene_fence_rowboat: "Near the lake",
    scene_lake_south: "On a rowboat in the lake",
    scene_lake_southeast: "On a rowboat in the lake",
    scene_lake_east: "On a rowboat in the lake",
    scene_tower_outside: "In the tower",
    scene_tower_entrance: "In the tower",
    scene_tower_elevator: "In the tower",
    scene_tower_elevator_card: "In the tower",
    scene_tower_penthouse: "In the tower",
    scene_tower_hallway: "In the tower",
    scene_estate_lab_snarl: "Exploring Snarl's estate",
}

function in_game() => current_scene() != scene_none
rich_presence_conditional_display(!in_game(), "Titles")

rich_presence_display("{0}, {1} picks",
    rich_presence_lookup("Scene", current_scene(), scenes),
    rich_presence_value("Picks", current_picks())
)

function bit_set(b) => b == 1 && prev(b) == 0

function item_location(i) => byte(0xbe69 + i)
item_picks = 0x00
item_blobo = 0x01
item_key = 0x02
item_book = 0x03
item_jumpsuit = 0x04
item_devil_in_jar = 0x05
item_shirt = 0x06
item_hooplet = 0x07
item_newspaper = 0x08
item_press_pass = 0x09
item_camera = 0x0A
item_picture = 0x0B
item_zagtone = 0x0C
item_card = 0x0D
item_mitts = 0x0E
item_burger = 0x0F
item_black_mask = 0x10
item_gold_mask = 0x11
item_jar = 0x12
item_mushroom = 0x13

// [ ] Defeat Snarl
//  [ ] Rescue Granpa
//   [ ] Card
//    [ ] Blobpet
//     [ ] Outfit
//   [ ] Zagtone
//    [ ] Pass
//     [ ] Outfit
//   [ ] Unlock gate
//    [ ] Put guards to sleep
//    [ ] Light source (burger/red devil)
//    [ ] Black mask
//  [ ] Book
//  [ ] Red Devil
//   [ ] Jar
//   [ ] Mitts

// ===== Grandfather's Cabin =====
// :S
// :GET KEY
// :N
// :W
// :UNLOCK DOOR
// :DROP KEY
// :GET BOOK
// :GET PICKS
// :E
// :THROW SWITCH
// :ENTER HOOP

achievement("Say 'Lo to Ennio", "Arrive in Tonetown", 3, type="progression",
    trigger = in_game() && bit_set(bit4(0xBE15)) &&
              (current_scene() == scene_cabin_portal || current_scene() == scene_construction_site_south)
)

// ===== Tonetown =====
// :E

// :SAVE GAME 0
// :USE PICK
// :USE PICK
// :USE PICK
// :USE PICK

achievement("What's Trending", "Listen to all the advice from the floatfone", 2,
    trigger = in_game() && measured(byte(0xBE3F) == 4, when = current_scene() == scene_floatfone) && 
                           prev(byte(0xBE3F)) == 3
)

// :LOAD GAME 0
// :E

// ===== Jamac Salon =====
// :DYE HAIR
// :CHOOSE PINK [pink:2p, glitter:3p, blue:4p, sparkle:5p, foil:10p]
//  - any of these work, so just get the cheapest [LOOK DYEORAMA to see choices]
// :E
// :BUY JUMPSUIT [5p]
//  - can also buy a shirt for another 5p
// :BUY HOOPLET [2p]
// :WEAR JUMPSUIT
// :WEAR HOOPLET

// :W
// :W
// :S

// ===== Tonetown Times =====
// :SAVE GAME 1
// :BUY NEWSPAPER [1p]
// :READ ARTICLE 1
// :READ ARTICLE 2
// :READ ARTICLE 3
// :READ ARTICLE 4
// :READ ARTICLE 5

achievement("That's News to Me", "Read all of the articles in the newspaper", 2,
    trigger = in_game() && measured(tally_of(range(1,5), 5, a => once(word(0xBE33) == a))) && 
              unless(current_scene() == scene_tower_elevator) && // elevator buttons also set the last read article
              unless(current_scene() == scene_tower_elevator_card)
)

// :LOAD GAME 1
// :S
// :TALK NUYU
//  - If you try to TALK EDITOR, the game specifically tells you to address him by name. As best as I can tell,
//    you have to extract that information from the newspaper included in the game box (i.e. copy protection).
//    > After visiting with ... and Nuyu, editor of the Times, Gramps ...

achievement("You're Hired!", "Get a job at the Tonetown Times", 5, type="progression",
    trigger = in_game() && current_scene() == scene_tonetown_times_editor && bit_set(bit7(0xBE0D))
)

// :GET CAMERA
// :E
// :TURN ON PRINTER
// :TURN ON COMPUTER
// :TYPE YOUR NAME
// :YES
// :GET PASS

// :W
// :N
// :N
// :N
// :N
// :N

// ===== Park =====
// :TALK STELGAD
//  - This is another copy protection check. (It's not even necessary)
//    > Daglets to play concert in park
//    > Is Stelgad, manager of the Daglets, going to start another fad? ... Now it's soft green features in intense
//      pink hair.
// :SAVE GAME 2
// :SHOW PASS TO WOMAN
// :TAKE PICTURE
// :TALK TO DAGLETS
// :TAKE ZAGTONE

achievement("Electrolic", "Get a Zagtone", 3, type="progression",
    trigger = in_game() && current_scene() == scene_daglets && 
              item_location(item_zagtone) == scene_inventory &&
              prev(item_location(item_zagtone)) != scene_inventory 
)

// - do whatever you want until you get kicked out back to the park
// :S
// :S
// :S
// :S
// :S

// ===== Tonetown Times =====
// :DROP PASS
// :DROP CAMERA
// :SAVE GAME 3
// :GIVE PICTURE
// - Delivering the picture isn't really necessary to complete the game. Getting the Zagtone is.

achievement("A Chance to Work with the Legend", "Complete the newspaper job", 5,
    trigger = in_game() && current_scene() == scene_tonetown_times_editor && bit_set(bit5(0xBE0D))
)

// :N
// :N
// :N
// :W

// ===== Construction Site =====
// :LOOK TRENCH
// :GET JAR

// :E
// :E

// ===== Fast Freddie's =====
// :TAKE MITTS
// :WEAR MITTS
// :SAVE GAME 4
// :BUY BURGER [2p]
// :EAT BURGER
//   The burger can be carried as a light source, but once eaten, it doesn't work any more.

achievement("Too Hot to Handle", "Eat a Glo Burger", 2,
    trigger = in_game() && current_scene() == scene_fast_freddies && bit_set(bit3(0xBE0F))
)

// :LOAD GAME 4
// :W
// :N
// :N
// :W
// :N
// :N
// :N
// :E
// :N
// :N

// ===== Gate =====
// :TAKE MUSHROOM
// :SAVE GAME 5
// :THROW MUSHROOM AT EYE (or AT NOSE)

achievement("Allergy Season", "Disable the guards at the gate", 3, type="progression",
    trigger = in_game() && current_scene() == scene_wall_gate && bit_set(bit6(0xBE13))
)

// :E
// :N
// :GET DEVIL

achievement("Lightning in a Bottle", "Catch a Red Devil", 3, type="progression",
    trigger = in_game() &&
              (current_scene() == scene_red_devils || current_scene() == scene_red_devils2) &&
              item_location(item_devil_in_jar) == scene_inventory && 
              prev(item_location(item_devil_in_jar)) == scene_none
)

// :S
// :S
// :S
// :S
// :S
// :S
// :W (park)
// :S
// :DROP MITTS
// :W

// ===== Pet Store =====
//   If Snarl isn't present, look at the clock to get an idea on when he'll return, then go W into the wall until he does.
// :BUY BLOBPET (5p)

// :E
// :E

// ===== Party Supplies =====
// :GET MASK
// :GET BLACK MASK
// :WEAR MASK

// :W
// :N (park)
// :W
// :N
// :W

// ===== Sandy Patch =====
// :SAVE GAME 6
// :TAKE CARD

achievement("Buried Treasure", "Get the metal card", 2, type="progression",
    trigger = in_game() && current_scene() == scene_sandy_patch &&
              item_location(item_card) == scene_inventory &&
              prev(item_location(item_card) == scene_sandy_patch)
)

// :E
// :S

// ===== Well =====
// :SAVE GAME 7
//   If Ennio says "I smell Snarlmeat", Snarl is not at his shop, and he'll attack you when you enter the well. 
//   If he does, just reload the game and wander around a bit until he's back at the shop.
// :D
// :W
//   If you're not wearing the black mask, or don't have a light source, the Philbert will attack you.
// :W
// :PUSH BUTTON
//   This frees the monsters from the cages, but traps you in the tunnel. If you don't do this now, Snarl
//   apparently does it when you rescue gramps, so you must bring Gramps in through the gate.
// :N
// :N
// :N
// :U

achievement("What Big Teeth You Have", "Sneak onto Snarl's Estate", 5, type="progression",
    trigger = in_game() && current_scene() == scene_estate_jawdog && prev(current_scene()) == scene_tunnel_tube
)

// ===== Snarl's Estate =====
// :E
// :N
// :UNLOCK GATE
// :OPEN GATE

// :E
// :E
// :S
// :S
// :E
// :E
// :E
// :E
// :N
// :N
// :GET IN BOAT
// :W
// :S
// :W
// :N
// :N

// ===== Tower =====
// :W
// :INSERT CARD
// :PUSH BUTTON 5
// :E
// :SAVE GAME 8
// :HIT CUFFS WITH ZAGTONE

achievement("The Sound of Freedom", "Free Gramps", 5, type="progression",
    trigger = in_game() && bit_set(bit5(0xBE14)) &&
              (current_scene() == scene_tower_penthouse || current_scene() == scene_tower_penthouse_empty)
)

// :W
// :PUSH BUTTON 1
// :E
// :S
// :GET IN BOAT
// :S
// :W
// :W
// :W
// :OPEN GATE
// :W
// :W
// :W
// :SAVE GAME 9
// :N
// :ENNIO ATTACK SNARL
// :GIVE BOOK TO GRAMPS
// :OPEN JAR
// :PUSH SNARL INTO HOOP

achievement("It is Undone", "Defeat Snarl", 10, type="win_condition",
    trigger = in_game() && current_scene() == scene_estate_lab_snarl &&
              current_image() == scene_animal_sidewalk 
)

// Must buy: Pink Hair Dye (2), Jumpsuit (5), Hooplet (2), Blobpet (5) - this leaves 36
// Don't buy: Floatfone messages (1@), Newspaper (1), Burger (2), more expensive hair dyes, Shirt (5)
achievement("Frugal Rescue", "Defeat Snarl with 35 or more picks remaining", 10, type="missable",
    trigger = in_game() && current_scene() == scene_estate_lab_snarl &&
              current_image() == scene_animal_sidewalk &&
              current_picks() >= 35
)

