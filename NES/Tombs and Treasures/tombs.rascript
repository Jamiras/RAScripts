// Tombs and Treasures
// #ID=2036
// MD5: 5c7222553020ae8940e4ab9de5cb9342

// look at ixmol jewel to get password

function current_portrait() => byte(0x0625)
portrait_boy = 0
portrait_girl = 1
portrait_jose = 2
portrait_secretary = 3

function current_location() => byte(0x0613)
location_el_caracol = 0x00
location_nunnery = 0x01
location_tomb_hipriest = 0x02
location_ball_court = 0x03
location_castillo_pyramid = 0x04
location_temple_of_warriors = 0x05
location_court_of_columns = 0x06
location_well_of_sacrifice = 0x07
location_well_of_paradise = 0x08
location_shrine_of_tentacula = 0x09
location_laboratory = 0x0A

// 0x614 gets set to the scene/picture being loaded, and 0x615 gets set once the scene has loaded
function current_scene() => byte(0x0615)
scene_laboratory_main = 0x01
scene_laboratory_jose = 0x02
scene_nunnery_statues = 0x03
scene_tomb_hipriest_entrance = 0x04
scene_tomb_hipriest_coffin = 0x05
scene_tomb_hipriest_coffin_open = 0x06
scene_tomb_hipriest_skeleton_closeup = 0x07
scene_tomb_hipriest_skull_moved = 0x08
scene_tomb_hipriest_coffin_moved = 0x09
scene_tomb_hipriest_maze = 0x0A
scene_el_caracol_entrance = 0x0B
scele_el_caracol_window = 0x0C // can see court of columns
scene_el_caracol_upstairs = 0x0D
scene_el_caracol_lit_brick = 0x10
scene_el_caracol_pink_brick = 0x11
scene_castillo_entrance = 0x12
scene_castillo_deadend = 0x14
scene_castillo_treasure_room = 0x15
scene_castillo_basement = 0x16
scene_castillo_mechanism = 0x17
scene_temple_of_warriors_statues = 0x18
scene_temple_of_warriors_hole = 0x19
scene_temple_of_warriors_jaguar = 0x1A
scene_court_of_columns_entrance = 0x1B
scene_court_of_columns_glowing_column = 0x1C
scene_well_of_paradise_lake = 0x1D
scene_well_of_paradise_wave = 0x1E
scene_well_of_sacrifice = 0x1F
scene_well_of_sacrifice_entrance = 0x20
scene_well_of_sacrifice_coffin = 0x21
scene_well_of_sacrifice_coffin_closeup = 0x23
scene_ball_court_entrance_no_pawl = 0x24
scene_ball_court_hallway = 0x25
scene_ball_court_blue_block_closeup = 0x26
scene_ball_court_akbal_jewel_trapped = 0x27
scene_ball_court_temple_peek_at_sub_key = 0x29
scene_ball_court_temple_closeup = 0x2A
scene_ball_court_temple_sun_key = 0x2B
scene_ball_court_temple_open = 0x2C
scene_shrine_of_tentacula = 0x2D
scene_shrine_of_tentacula_girl_closeup = 0x2E
scene_shrine_of_tentacula_girl_awake = 0x2F
scene_inv_one_eyed_mask = 0x31
scene_inv_two_eyed_mask = 0x32
scene_inv_golden_pipes_broken = 0x33
scene_inv_shallow_bowl = 0x35
scene_inv_sun_necklace = 0x36
scene_inv_sword = 0x37
scene_castillo_men_drinking_at_night = 0x38
scene_castillo_jaguar_at_noon = 0x39
scene_castillo_men_digging = 0x3A
scene_tomb_hipriest_open_door = 0x3B
scene_ball_court_akbal_jewel = 0x3C
scene_el_caracol_smashed_brick = 0x3D
scene_castillo_entrance_trapdoor = 0x3F
scene_court_of_columns_ground_smashed = 0x41
scene_well_of_sacrifice_drained = 0x42
scene_well_of_sacrifice_entrance_statue_moved = 0x43
scene_well_of_sacrifice_coffin_door_open = 0x44
scene_ball_court_entrance = 0x45
scene_ball_court_hallway_tunnel = 0x46
scene_ball_court_hallway2_tunnel = 0x47
scene_ball_court_akbal_jewel_taken = 0x49
scene_ball_court_temple_closed = 0x4A
scene_inv_golden_pipes = 0x4B
scene_shrine_of_tentacula_girl_sitting = 0x4C
scene_shrine_of_tentacula_girl_closeup_awake = 0x4D
scene_ball_court_temple = 0x4E
scene_el_caracol_pedestal_moved = 0x4F
scene_inv_two_eyed_mask_both_gems = 0x51
scene_el_caracol_silver_censer = 0x52
scene_castillo_statue_restored = 0x53
scene_girl_putting_on_ring = 0x54
scene_ball_court_hallway2 = 0x55
scene_tomb_hipriest_skorpor = 0x5A
scene_castillo_twobeak = 0x5B
scene_el_caracol_snakemaster = 0x5C
scene_court_of_columns_el_slug = 0x5D
scene_temple_of_warriors_cadaver = 0x5E
scene_ball_court_hornskull = 0x5F
scene_well_of_sacrifice_venum = 0x60
scene_ball_court_tezcat = 0x61
scene_ball_court_scareface = 0x62
scene_shrine_of_tentacula_tentacula = 0x63

locations = {
    location_laboratory: "the Professor's laboratory",
    location_nunnery: "the Nunnery",
    location_tomb_hipriest: "the Tomb of Hi-Priest",
    location_castillo_pyramid: "the Castillo Pyramid",
    location_well_of_paradise: "the Well of Paradise",
    location_el_caracol: "El Caracol",
    location_court_of_columns: "the Court of Columns",
    location_ball_court: "Ball Court",
    location_temple_of_warriors: "the Temple of Warriors",
    location_well_of_sacrifice: "the Well of Sacrifice",
    location_shrine_of_tentacula: "the Shrine of Tentacula",
}

// level is only calculated when entering battle, at which point it's stored at $063A.
// to display in RP, we have to manually calculate it ourselves. Levels are attributed
// to actions as listed at ...
function current_level() {
    return 1 +                // start at level 1
           1 - bit4(0x06AC) + // defeat Skorpor
           1 - bit5(0x06AC) + // defeat Two-Beak
           1 - bit3(0x069A) + // find red jewel
           bit6(0x069F) +     // read tablets
           bit6(0x0694) +     // join red jewel and sword
           bit1(0x069C) +     // wash gold mirror
           1 - bit6(0x06AC) + // defeat Snake Master
           1 - bit7(0x06AC) + // defeat El Slug
           1 - bit5(0x069B) + // get golden globe
           1 - bit6(0x0697) + // get silver censer
           1 - bit0(0x06AD) + // defeat Cadaver
           1 - bit1(0x069B) + // get sun necklace
           bit0(0x069C) * 2 + // wash sun necklace
           bit7(0x0690) +     // get blue jewel
           bit7(0x0694) +     // join blue jewel and sword
           1 - bit1(0x06AD) + // defeat Hornskull
           1 - bit6(0x069A) + // move stone handle
           1 - bit2(0x06AD) + // defeat Venum
           1 - bit2(0x069D) + // take two-eyed mask
           2 - bit3(0x06AD) * 2 + // defeat Tezcat
           1 - bit4(0x06AD) + // defeat Scareface
           bit0(0x069F) +     // use silver key
           bit6(0x0691) * 5 + // take sun key
           0
}

// 0x613 is location, 0 = El Caracol, 0x614 is scene, 0 = unknown
rich_presence_conditional_display(word(0x0613) == 0, "Titles")

rich_presence_conditional_display(byte(0x040F) == 0, "Exploring the overworld at level {0}",
    rich_presence_value("Level", current_level())
)

rich_presence_conditional_display(current_location() == 0xFF, "Exploring {0} at level {1}",
    rich_presence_lookup("Location", prior(current_location()), locations),
    rich_presence_value("Level", current_level())
)

// Assume defeating Tentacula grants 1 level. When you use the Sun Key to end the game, it's
// removed from your inventory, which lowers your level by 5. Since Tentacula is the last thing
// that gives a level and just fix the level at 31.
rich_presence_conditional_display(bit5(0x06AD) == 0, "Exploring {0} at level 31",
    rich_presence_lookup("Location", current_location(), locations)
)


rich_presence_display("Exploring {0} at level {1}",
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Level", current_level())
)

function fight_achievement(title, description, points, scene)
{
    achievement(title, description, points,
        trigger = current_scene() == scene && byte(0x0617) == 0xA4
    )    
}

function flag_achievement(title, description, points, scene, bit, value)
{
    achievement(title, description, points,
        trigger = current_scene() == scene && bit == value && prev(bit) != value
    )
}

function delayed_flag_achievement(title, description, points, location, scene, bit, value)
{
    // wait a second and a half (90 frames) for scene to render
    achievement(title, description, points,
        trigger = repeated(90, current_scene() == scene) &&
                  never(current_location() != location) &&
                  bit == value && once(prev(bit) != value)
    )
}


// =====================================
// [Laboratory] {New Game}
// * ANYTHING - secretary will greet you
// * TAKE LIGHTER
// * TAKE SILVER KEY
// * TAKE SWORD
// * GO BACKWARD
// * ANYTHING - Jose will greet you
// * GO FORWARD
// (go north one screen and enter the temple)

// [Nunnery]
// * TAKE IXMOL JEWEL
// * GO BACKWARD
// (go north three screens and west two)

// [Tomb of Hi-Priest]
// * ANYTHING - Skorpor will attack
// (defeat Skorpor) {Level 2}
fight_achievement("The First Guardian", "Defeat Skorpor", 2, scene_tomb_hipriest_skorpor)
// * CHANGE, CHANGE (to Jose)
// * PUSH RIGHT WALL
// * GO RIGHT
// * TAKE MOSAIC TILE
// * TAKE ONE-EYE MASK
// * GO LEFT
// * GO BACK
// (go east three screens)

// [Castillo Pyramid]
//  John____ Joyce___ 26%l Ptp8 Lt7* k##B 35!L x=&0 ?hL: X4yH
// * ANYTHING - Two-Beak will attack
// (defeat Two-Beak) {Level 3}
fight_achievement("The Second Guardian", "Defeat Two-Beak", 3, scene_castillo_twobeak)
// * GO FORWARD
// * USE MOSAIC TILE
// * TAKE SILVER GLOBE
// * SMASH TALL FLASK
// * TAKE GOLD MIRROR
// * TAKE GOLD STAND
// * TAKE SHALLOW BOWL
// * MOVE PILE OF GOLD {Level 4}
// * LOOK FLASK (get small rod)
// * LOOK STONE BOX
// * JOIN RED JEWEL AND ONE-EYE MASK
// * USE ONE-EYE MASK {Level 5}
delayed_flag_achievement("The Riddle", "View the pictographs in Castillo Pyramid", 5, 
                         location_castillo_pyramid, scene_castillo_men_digging, bit6(0x69F), 1)
// * JOIN RED JEWEL AND SWORD {Level 6}
// * GO BACK
// * GO BACK
// (go south two screens and east one)

// [Well of Paradise]
//  John____ Joyce___ Vb^, dNQ= !]qr z]h4 mWj: Xj., VLzb J!k+
// * WASH GOLDEN MIRROR {Level 7}
// * TAKE GOLDEN PIPES
// * JOIN BANDAGE AND GOLDEN PIPES
// * GO BACK
// (go left three screens)
 
// [El Caracol]
// (defeat Snake Master) {Level 8}
fight_achievement("The Third Guardian", "Defeat Snake Master", 3, scene_el_caracol_snakemaster)
// * PUT SILVER GLOBE on pedestal
// * CHANGE to girl
// * USE GOLDEN PIPES
// * GO BACK
// (go east three screens, then north four screens)

// [Court of Columnns]
// (defeat El Slug) {Level 9}
fight_achievement("The Fourth Guardian", "Defeat El Slug", 3, scene_court_of_columns_el_slug)
// * LOOK COLUMN
// * SMASH GROUND
// * TAKE GOLDEN GLOBE {Level 10}
// * GO BACK
// * GO BACK
// (go south four times and west three times)

// [El Caracol]
//  John____ Joyce___ -QqV .L'V qWwB yTbB ZDKm -,!Q RKtN z^"j
// * TAKE SILVER GLOBE
// * PUT GOLDEN GLOBE on pedestal
// * CHANGE to girl
// * USE GOLDEN PIPES
// * GO BACK
// (go east three screens, then north four screens)

// [Court of Columnns]
//  John____ Joyce___ G4=0 .p^' qV]D [K+d Z9tl -YLR R-Tk /Pt:
// * LOOK COLUMN
// * SMASH GROUND
// * TAKE SILVER HEAD
flag_achievement("Follow the Light", "Acquire the Silver Head", 5, 
                 scene_court_of_columns_ground_smashed, bit6(0x0693), 1)
// * GO BACK
// * GO BACK
// (go south twice and west once)

// [Castillo Pyramid]
// * GO FORWARD
// * PUT SILVER HEAD
// * GO DOWNSTAIRS
// * TAKE SMALL FLASK
// * TAKE LARGE FLASK
// * LOOK STONE BOX
// * GO UPSTAIRS
// * GO BACK
// * GO BACK
// (go west twice and south twice)

// [El Caracol]
// * TAKE GOLDEN GLOBE
// * CHANGE to guide
// * PUSH PEDESTAL
// * GO UPSTAIRS
// * PUT GOLDEN GLOBE
// * WAIT (repeat until light reflects off globe)
// * LOOK WALL
// * SMASH WALL
// * TAKE CRYSTAL KEY
// * GO BACK
// * TAKE GOLDEN GLOBE
// * PUT GOLD STAND
// * PUT GOLDEN GLOBE
// * CHANGE to girl
// * USE GOLDEN PIPES
// * LOOK WALL
// * SMASH WALL
// * TAKE CENSER {Level 11}
flag_achievement("Follow the Light 2", "Acquire the Silver Censer", 5,
                 scene_el_caracol_silver_censer, bit6(0x0697), 0)
// * GO BACK
// * TAKE GOLD STAND (and golden globe)
// * GO BACK
// * GO BACK
// (go north four screens, then east two)

// [Temple of Warriors]
// (defeat Cadaver) {Level 12}
fight_achievement("The Fifth Guardian", "Defeat Cadaver", 3, scene_temple_of_warriors_cadaver)
//  John____ Joyce___ Zj]2 2%v4 ?r]h QLx: R46G WbKR'#6G Yt5d
// * TAKE SUN NECKLACE {Level 13}
// * TAKE BLUE JEWEL
// * GO BACK
// (go south four times and east once)

// [Well of Paradise]
// * WASH SUN NECKLACE {Level 15}
delayed_flag_achievement("The Colors of the Day", "Learn how to tell the position of the sun", 2,
                         location_well_of_paradise, scene_well_of_paradise_wave, bit0(0x069C), 1)
// * GO BACK
// (go west once and north four times)

// [Temple of Warriors]
//  John____ Joyce___ 3:^, k*\= !]R% 5p,Z pZ.: Xj.3 VL1[ Jn1+
// * WAIT (until indicator turns red)
// * GO BACK
// (reenter)
// * LOOK HOLE
// * USE SMALL ROD
// * GO BACK
// * WAIT (until jaguar returns)
// * CHANGE (to girl)
// * USE GOLDEN PIPES
// * TAKE BLUE JEWEL {Level 16}
flag_achievement("Jewel of the Jaguar", "Acquire the Blue Jewel", 5, 
                 scene_temple_of_warriors_statues, bit7(0x0690), 1)
// * JOIN BLUE JEWEL AND SWORD {Level 17}
// * GO BACK
// (go west, then south, then west, climb the stairs, then go north and west)

// [Ball Court]
// (defeat Hornskull) {Level 18}
fight_achievement("The Sixth Guardian", "Defeat Hornskull", 3, scene_ball_court_hornskull)
// * GO FORWARD
// * TAKE BLUE BLOCK
// * GO BACK
// * GO BACK
// (go west, south twice, and east)

// [Tomb of Hi-Priest]
// * GO RIGHT
// * LOOK SKELETON
// * MOVE SKULL
// * USE IRON KEY
// * GO DOWNSTAIRS
// * JOIN SHALLOW BOWL AND SMALL ROD
// * USE SHALLOW BOWL

// [Ball Court]
//  John____ Joyce___ Pl7. *&.w PRm# !m/, ^n1L ,Y/Z dZ%8 10'=
// * TAKE AKBAL JEWEL
// * GO LEFT
// * GO BACK
// * TAKE STONE PAWL
// * GO BACK
// (go south once, east once, south again, then east twice)

// [Castillo Pyramid]
// * PUT BLUE BLOCK
// * GO DOWNSTAIRS
// * PUT STONE PAWL
// * CHANGE (to guide)
// * MOVE STONE HANDLE {Level 19}
flag_achievement("It Sounds Like Water", "Activate the mechanism below Castillo Pyramid", 5,
                 scene_castillo_mechanism, bit6(0x069A), 0)
// * GO UPSTAIRS
// * GO BACK
// (go east twice, then north twice)

// [Well of Sacrifice]
// * GO DOWNSTAIRS
// * GO DOWNSTAIRS
// (defeat Venum [USE AKBAL JEWEL]) {Level 20}
fight_achievement("The Seventh Guardian", "Defeat Venum", 3, scene_well_of_sacrifice_venum)
// * MOVE RIGHT STATUE
// * GO FORWARD
// * USE GOLD MIRROR
// * LOOK COFFIN
// * USE CRYSTAL KEY
// * TAKE TWO-EYED MASK
// * GO BACK
// * GO FORWARD

// [Castillo Pyramid]
// * GO UPSTAIRS
// * GO BACK
// * GO BACK
// (go east twice, then north twice)

// [Well of Sacrifice]
//  John____ Joyce___ Xt[T YMy3 qxqn LG?n ?z5- M??? R"h, znhj
// * LOOK GUIDE
// * LOOK GUIDE
flag_achievement("Can't Be Left Alone", "Reunite with Jose", 3, 
                 scene_well_of_sacrifice_drained, bit5(0x069C), 1)
// * GO BACK
// (go south twice, then west five times)

// [Tomb of Hi-Priest]
// * GO RIGHT
// * GO DOWNSTAIRS
// * USE SHALLOW BOWL

// [Ball Court]
// * GO LEFT
// * GO FORWARD
// * JOIN RED JEWEL AND TWO-EYED MASK
// * JOIN BLUE JEWEL AND TWO-EYED MASK
// * USE TWO-EYED MASK
// * PUSH WHITE BLOCK
// * JOIN BLUE JEWEL AND SWORD
//  John____ Joyce___ J/r^ jrXW ?r%h Q[^: q3bK V0^- 'JL! YQTd
// * GO LEFT
// (defeat TezCat) {Level 23}
fight_achievement("The Eighth Guardian", "Defeat TezCat", 5, scene_ball_court_tezcat)
// * USE LARGE FLASK
// (defeat Scareface [USE AKBAL JEWEL]) {Level 24}
fight_achievement("Betrayed", "Defeat Scareface", 5, scene_ball_court_scareface)
// * WAIT (until necklace is black)
// * USE LARGE FLASK
// * GO FORWARD
// John____ Joyce___ Wt=% DR.n pTmk L+q? '!hz lQ&' QLKl zPXH
// * USE SILVER KEY {Level 25}
// * GO BACK
// * USE SMALL FLASK
// * MOVE TEMPLE
// * TAKE SUN KEY {Level 30}

// [Shrine of Tentacula]
// (defeat Tentacula [USE AKBAL JEWEL, USE RING OF ITZA]) {Level 31}
fight_achievement("King of the Underworld", "Defeat Tentacula", 5, scene_shrine_of_tentacula_tentacula)
//  John____ Joyce___ 0&=% hrzn LtNk pyR? 42jz 6V.' ?+j? XpbH
// * LOOK STAND
// * LOOK FACE
// * GO BACK
// * PUT CENSER
// * PUT INCENSE
// * USE LIGHTER
// * USE SUN KEY

achievement("Heroes for Another Time", "Rescue the girl and escape", 10, 
    trigger = current_scene() == scene_shrine_of_tentacula_girl_sitting &&
              byte(0x05E0) == 9 // THE END screen
)

// Go to the south-east edge of the map. Go north one screen. Go west one screen. Walk into
// the trees at the first curve in the trees. This is a hidden path. Find the path that leads
// to the the middle of the west side of the screen. Go west one screen. Proceed west into
// the secret path to the Nunnery. The god of Kukulcan will give you a hint to solve your
// current puzzle.
// https://www.ign.com/wikis/nes-cheats/Tombs_&_Treasure_Cheats

achievement("With a Little Help from My God", "Follow the secret path of Kukulcan", 5,
    trigger = byte(0x040F) != 0 && // in dungeon
              prev(byte(0x040F)) == 0 && // was on overworld
              prev(byte(0x060B)) == 0x65 // was in map 6,5
)

function bit_watch(title, bit)
{
    achievement(title, "DEBUG", 0, bit != prev(bit))
}
bit_watch("bit0(0x0690)", bit0(0x0690))
bit_watch("bit7(0x0693)", bit7(0x0693))
bit_watch("bit5(0x0693)", bit5(0x0693))
bit_watch("bit1(0x0693)", bit1(0x0693))
bit_watch("bit2(0x0694)", bit2(0x0694))
bit_watch("bit1(0x0694)", bit1(0x0694))
bit_watch("bit7(0x0695)", bit7(0x0695))
bit_watch("bit3(0x0695)", bit3(0x0695))
bit_watch("bit2(0x0699)", bit2(0x0699))
bit_watch("bit5(0x069D)", bit5(0x069D))
bit_watch("bit1(0x069E)", bit1(0x069E))
bit_watch("bit7(0x069F)", bit7(0x069F))
bit_watch("bit2(0x069F)", bit2(0x069F))
bit_watch("bit1(0x06AC)", bit1(0x06AC))

achievement("New Room", "DEBUG", 0,
    any_of([0x0E, 0x0F, 0x13, 0x22, 0x28, 0x30, 0x34, 0x3E,
            0x40, 0x48, 0x50, 0x56, 0x57, 0x58, 0x59], a => current_scene() == a)    
)
