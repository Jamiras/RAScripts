// Pinball Quest
// #ID = 1492

// 0x085-0x086: enemy HP [text display]
// 0x08A      : state? 1f=in start launcher
//                     6f=in play
//                     8f=ball out, no ghost (if ghost, will be af)
//                     9f=in tunnel
//                     af=in dialog
//                     bf=hit by left paddle
//                     cf=in pop launcher
//                     ef=hit by right paddle
// 0x08B      : state? 01=ball out, touching paddle
//                     02=ball out
//                     03=stationary (in dialog, in pop launcher)
//                     05=in launcher
//                     06=in play
// 0x0AF      : state? FF=in launcher
//                     D8=in play
//                     D4=in play
//                     C8=ball out
//                     CC=ball out
// 0x0B4      : [Garden] number of gravestones knocked over 
//              [Castle] regenerator active
//              [Pop Pop] number of lower pins knocked over
// 0x0B5      : [Garden] number of skeletons killed
//              [Mines] number of guards killed
//              [Pop Pop] number of upper pins knocked over
// 0x0B6      : [Garden] goes to 2 when guard is killed
// 0x0B7      : [Garden] dialog window up
//              [Pop Pop] number of times four billiard balls sunk
//              [Golf] number of gophers hit 
//              [Circus] slots reel 1
// 0x0B8      : [Garden] spoke to ghost
//              [Circus] slots reel 2
// 0x0B9      : [Garden] spoke to ghost 
//              [Circus] slots reel 3
// 0x0BA      : [Garden] dialog window up
//              [Pop Pop] number of billiard balls sunk 
// 0x0BD      : [Circus] targets hit (0>1>2>3>4(all down)>5(lit)>6(hit)>0)
// 0x0BE      : [Garden] guard active
//              [Circus] all four seals lit
//              [Golf] number of side gophers hit
// 0x0C0      : attack guage (half circle increments)
// 0x100-0x105: low nibble = score x10
// 0x14B      : state? 90=in launcher
//                     9F=in play
//                     E3=left paddle
//                     A3=left paddle
//                     10=ball out/in pop launcher
//                     20=launched from pop launcher
// 0x175      : counter (set to various values, ticks down to 0, something happens)
// 0x176/0x177: 0000 initially
//              a4a9 ball out
//              bfa5 when leaving level 1
//              caa5 fade to black 1
//              d5a5 fade to black 2
//              dca5 fade to black 3
//              7da0 fade from black 1
//              87a0 fade from black 2
//              91a0 fade from black 3
// 0x190      : state? 00=in launcher
//                     1X=ball out
// 0x1AF      : [Garden] Guard HP
//              [Castle] familiar HP
// 0x24F      : [Basement] left candle 1
// 0x27F      : [Basement] left candle 2
// 0x2B5      : [Garden] gravestone 1 (0B = up, 01 = down)
// 0x29B      : [Circus mini-game] lions captured
// 0x2AF      : [Basement] left candle 3
// 0x2CB      : [Circus mini-game] tigers captured
// 0x2CF      : [Castle] Witch HP
// 0x2DF      : [Basement] left candle 4
// 0x2E5      : [Garden] gravestone 2 (0B = up, 01 = down)
// 0x2FB      : [Circus mini-game] alligators captured
// 0x30F      : [Basement] left candle 5
// 0x315      : [Garden] gravestone 3 (0B = up, 01 = down)
// 0x32F      : [Mines] Goblin King HP
// 0x32B      : [Circus mini-game] apes captured
// 0x33F      : [Basement] right candle 1
// 0x345      : [Garden] gravestone 4 (0B = up, 01 = down)
// 0x35B      : [Circus mini-game] seals captured
// 0x35F      : [Throne Roome] Harpy HP
// 0x36F      : [Basement] right candle 2
// 0x38B      : [Circus mini-game] pandas captured
// 0x39F      : [Basement] right candle 3
// 0x3B6/0x3B7: ?? garden wall (0000 = up, 82a6 = down)
// 0x3BB      : [Circus mini-game] snakes captured
// 0x3CF      : [Basement] right candle 4
// 0x3FF      : [Basement] right candle 5
// 0x42F      : [Basement] middle candle 1
// 0x44F      : [Garden] skeleton HP
// 0x45F      : [River] turtle HP
//              [Basement] middle candle 2
// 0x47F      : [Garden] skeleton HP
// 0x48F      : [River] turtle HP
//              [Throne Room] stopper 1 [495=B,494=Fx]
//              [Basement] middle candle 3
// 0x4AF      : [Garden] skeleton HP
//              [Castle] familiar HP
// 0x4BF      : [River] turtle HP
//              [Throne Room] stopper 2 [4C5=B,4C4=Fx]
// 0x4DF      : [Castle] familiar HP
//              [Basement] Dark Lord HP
// 0x4EF      : [River] turtle HP
//              [Throne Room] stopper 3 [4F5=B,4F4=Fx]
//              [Basement] stopper 1 [4F5=B,4F4=Fx]
// 0x50F      : [Castle] familiar HP
// 0x51F      : [Basement] stopper 2 [525=B,524=Fx]
// 0x53F      : [River] Knight HP
// 0x54F      : [Basement] stopper 3 [555=B,554=Fx]
// 0x57F      : [Garden] stopper 1 [585=B,584=Fx]
//            : [Castle] stopper 1 [585=B,584=Fx]
// 0x5AF      : [Garden] stopper 2 [5B5=B,5B4=Fx]
//            : [Castle] stopper 2 [5B5=B,5B4=Fx]
//            : [Mines] stopper 1 [5B5=B,5B4=Fx]
//            : [River] stopper 1 [5B5=B,5B4=Fx]
// 0x5DF      : [Garden] stopper 3 [5E5=B,5E4=Fx]
//            : [Castle] stopper 3 [5E5=B,5E4=Fx]
//            : [Mines] stopper 2 [5E5=B,5E4=Fx]
//            : [River] stopper 2 [5E5=B,5E4=Fx]
// 0x60F      : [Mines] stopper 3 [615=B,614=Fx]
//            : [River] stopper 3 [615=B,614=Fx]
// 0x6F8      : remaining balls

function table() => byte(0x0000C5)

table_none = 0
table_rpg_garden = 0
table_rpg_castle = 1
table_rpg_mines = 2
table_rpg_river = 3
table_rpg_throne_room = 4
table_rpg_basement = 5
table_viva_golf = 6
table_pop_pop = 7
table_circus = 8
table_rpg_shop = 10

function tileset() => byte(0x0003A)

tileset_title = 15
tileset_menu = 3
tileset_pop_pop = 0
tileset_pop_pop_score = 6
tileset_viva_golf = 2
tileset_viva_golf_score = 7
tileset_circus = 5
tileset_circus_score = 8
tileset_rpg_intro = 6
tileset_rpg_garden = 9
tileset_rpg_castle = 10
tileset_rpg_mines = 11 
tileset_rpg_river = 12
tileset_rpg_throne_room = 10
tileset_rpg_basement = 13
tileset_rpg_ending_magnet = 4
tileset_rpg_ending_credits = 14

table_activities = {}
function define_activity(table, tileset, description) {
    index = table * 16 + tileset
    table_activities[index] = description
}

define_activity(table_none, tileset_title, "At the title screen")
define_activity(table_none, tileset_menu, "At the main menu")
define_activity(table_none, tileset_rpg_intro, "Starting the quest")
define_activity(table_rpg_garden, tileset_rpg_garden, "Questing in the Garden")
define_activity(table_rpg_castle, tileset_rpg_castle, "Questing in the Castle")
define_activity(table_rpg_mines, tileset_rpg_mines, "Questing in the Mines")
define_activity(table_rpg_river, tileset_rpg_river, "Questing at the River")
define_activity(table_rpg_throne_room, tileset_rpg_throne_room, "Questing in the Throne Room")
define_activity(table_rpg_basement, tileset_rpg_basement, "Questing in the Basement")
define_activity(table_rpg_basement, tileset_rpg_ending_magnet, "Completed the Quest")
define_activity(table_rpg_basement, tileset_rpg_ending_credits, "Completed the Quest")
define_activity(table_pop_pop, tileset_pop_pop, "Playing Pop! Pop!")
define_activity(table_pop_pop, tileset_pop_pop_score, "Playing Pop! Pop!")
define_activity(table_viva_golf, tileset_viva_golf, "Playing Viva! Golf")
define_activity(table_viva_golf, tileset_viva_golf_score, "Playing Viva! Golf")
define_activity(table_circus, tileset_circus, "Playing Circus")
define_activity(table_circus, tileset_circus_score, "Playing Circus")
define_activity(table_pop_pop, tileset_menu, "At the main menu")
define_activity(table_viva_golf, tileset_menu, "At the main menu")
define_activity(table_circus, tileset_menu, "At the main menu")
define_activity(table_rpg_basement, tileset_menu, "At the main menu")

rich_presence_display("{0}", rich_presence_lookup("Activity", table() * 16 + tileset(), table_activities))

// ===============
// RPG Mode (220)
// ===============
//   5 I Need Your Help - Talk to the ghost to begin your quest.
//  10 The Skeletal Knight - Defeat the skeleton guard and enter the castle.
//  10 The Witch - Defeat the witch and enter the mines.
//  15 King of the Goblins - Defeat the goblin king and proceed to the river.
//  20 Reanimated Armor - Defeat the six knights and enter the throne room.
//  25 The Harpy - Defeat the harpy and enter the basement.
//  30 The Dark Lord - Defeat the dark lord and rescue the princess.
// ---
// 115

achievement(
    title = "I Need Your Help",
    description = "Talk to the ghost to begin your quest",
    points = 5,
    trigger = table() == table_rpg_garden && byte(0x0000B9) == 1
)

achievement(
    title = "The Skeletal Knight",
    description = "Defeat the skeleton guard and enter the castle",
    points = 5,
    trigger = table() == table_rpg_garden && byte(0x000176) == 0xBF
)

achievement(
    title = "The Witch",
    description = "Defeat the witch and enter the mines",
    points = 10,
    trigger = table() == table_rpg_castle && byte(0x000176) == 0x95
)

achievement(
    title = "King of the Goblins",
    description = "Defeat the goblin king and proceed to the river",
    points = 10,
    trigger = table() == table_rpg_mines && byte(0x000176) == 0xD3
)

achievement(
    title = "Reanimated Armor",
    description = "Defeat the suits of armor and enter the throne room",
    points = 10,
    trigger = table() == table_rpg_river && byte(0x000176) == 0x41
)

achievement(
    title = "The Harpy",
    description = "Defeat the harpy and enter the basement",
    points = 10,
    trigger = table() == table_rpg_throne_room && byte(0x000176) == 0xC0
)

achievement(
    title = "The Dark Lord",
    description = "Defeat the dark lord and rescue the princess",
    points = 25,
    trigger = table() == table_rpg_basement && byte(0x0004D6) == 0x6A
)

//   5 Graveyard Smash - Destroy all four tombstones in the garden.
//   5 Animal Control - Eliminate all of the witch's familiars.
//   5 Reptile Round-up - Eliminate all four turtles at the river.
//  30 Darkness - Extinguish all 13 candles in the basement.
// ---
//  45 (160)

achievement(
    title = "Graveyard Smash",
    description = "Destroy all four tombstones in the garden",
    points = 5,
    trigger = table() == table_rpg_garden && byte(0x0000B4) == 4
)

// witch initially starts with no familiars. can have up to four. require at least one to have been
// spawned before triggering the achievement.
achievement(
    title = "Animal Control",
    description = "Eliminate all of the witch's familiars",
    points = 10,
    trigger = table() == table_rpg_castle && tileset() == tileset_rpg_castle &&
              once(byte(0x0001AF) == 10) && never(tileset() != tileset_rpg_castle) &&
              byte(0x0001AF) == 0 && byte(0x0004AF) == 0 &&
              byte(0x0004DF) == 0 && byte(0x00050F) == 0
) 

// turtles don't actually have HP until a few frames into the level, have to use the once()/tileset trick again
achievement(
    title = "Reptile Round-up",
    description = "Eliminate all four turtles at the river",
    points = 10,
    trigger = table() == table_rpg_river && tileset() == tileset_rpg_river &&
              once(byte(0x00045F) == 1) && never(tileset() != tileset_rpg_river) &&
              byte(0x00045F) == 0 && byte(0x00048F) == 0 && 
              byte(0x0004BF) == 0 && byte(0x0004EF) == 0
)

achievement(
    title = "Darkness",
    description = "Extinguish all 13 candles in the basement",
    points = 50,
    trigger = table() == table_rpg_basement && tileset() == tileset_rpg_basement &&
              once(byte(0x00042F) == 1) && never(tileset() != tileset_rpg_basement) &&
              byte(0x00042F) == 0 && byte(0x00045F) == 0 && byte(0x00048F) == 0 && // middle three
              byte(0x00024F) == 0 && byte(0x00027F) == 0 && byte(0x0002AF) == 0 && // top three on left
              byte(0x0002DF) == 0 && byte(0x00030F) == 0 &&                        // bottom two on left
              byte(0x00033F) == 0 && byte(0x00036F) == 0 && byte(0x00039F) == 0 && // top three on right
              byte(0x0003CF) == 0 && byte(0x0003FF) == 0                           // bottom two on right
)
    
//  20 Gated Garden - Leave the garden without letting your ball fall off the bottom of the table
//  40 Confidence - Complete the quest without using stoppers.
// ---
//  60 (220)

function trigger_start_quest() => once(tileset() == tileset_rpg_intro) && never(tileset() == tileset_menu)
function trigger_complete_quest() => table() == table_rpg_basement && tileset() == tileset_rpg_ending_credits

// The only accurate way I could find to identify ball out was to watch for the Y position to be > 11C0, which 
// happens for ball out on every table. As such, this should only be used on a per-table basis, and since leaving 
// every table but the garden results in proceeding to the previous table, I can only reliably use this in the 
// garden. Also note that if you ball out in the garden and leave the game, upon returning the Y position will
// still be > 11C0 (see ticket 26333).
//function trigger_rpg_ball_out() => word(0x00006A) > 0x11C0 

// I'm not sure exactly what this means, but word(0x0176) becomes 0xA9A4 just before displaying the "Do you want 
// to try again?" message. Setting it to 0x0000 in the frame where it's set prevents the dialog from showing (and 
// softlocks the game). Once it's set, it remains set until the player advances to the next board, where it changes
// to 0xA5BF (regardless of whether or not the player ball'd out)
function trigger_rpg_ball_out() => byte(0x000176) == 0xA4

achievement(
    title = "Gated Garden",
    description = "Leave the garden without letting your ball fall off the bottom of the table",
    points = 10,
    trigger = trigger_start_quest() && byte(0x000176) == 0xBF && never(trigger_rpg_ball_out()) 
)    

achievement(
    title = "Confidence",
    description = "Complete the quest without using stoppers",
    points = 50,
    trigger = trigger_start_quest() && trigger_complete_quest() &&
              never(high4(0x000494) == 15) && // throne room stopper 1
              never(high4(0x0004C4) == 15) && // throne room stopper 2
              never(high4(0x0004F4) == 15) && // throne room stopper 3, basement stopper 1
              never(high4(0x000524) == 15) && // basement stopper 2
              never(high4(0x000554) == 15) && // basement stopper 3
              never(high4(0x000584) == 15) && // garden stopper 1, castle stopper 1
              never(high4(0x0005B4) == 15) && // garden stopper 2, castle stopper 2, mines stopper 1, river stopper 1
              never(high4(0x0005E4) == 15) && // garden stopper 3, castle stopper 3, mines stopper 2, river stopper 2
              never(high4(0x000614) == 15)    // mines stopper 3, river stopper 3
)   

// ===================================================================

function achievement_score_Xm(table, tileset, score, title, description, points) {
    score_1m = score / 1000000
    
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = table() == table && tileset() == tileset && low4(0x000100) >= score_1m
    )
}

function achievement_score_X00k(table, tileset, score, title, description, points) {
    score_100k = score / 100000
    
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = table() == table && tileset() == tileset &&
                 (low4(0x000100) > 0 || low4(0x000101) >= score_100k)
    )
}

function achievement_score_XX0k(table, tileset, score, title, description, points) {
    score_100k = score / 100000
    score_10k = (score % 100000) / 10000
    
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = table() == table && tileset() == tileset &&
                 (low4(0x000100) > 0 || (low4(0x000101) > score_100k) || (low4(0x000101) == score_100k && low4(0x000102) >= score_10k))
    )
}

function achievement_score_X0k(table, tileset, score, title, description, points) {
    score_10k = score / 10000
    
    achievement(
        title = title,
        description = description,
        points = points,
        trigger = table() == table && tileset() == tileset &&
                 (low4(0x000100) > 0 || low4(0x000101) > 0 || low4(0x000102) >= score_10k)
    )
}

function remaining_balls() => byte(0x0006F8)
 
// ===============
// Pop! Pop! (60)
// ===============
//  10 Beginner - Score 500,000 points
//  30 Expert - Score 5,000,000 points
//   5 Bowling for Billiards - Knock down all six bowling pins.
//   5 Rack 'em -  Sink all four balls on the billiards table.
//  10 Extra - Collect the extra bonus after sinking all four balls three times.

achievement_score_X00k(table_pop_pop, tileset_pop_pop, 500000, "Pop! Pop! Beginner", 
                       "Score at least 500,000 points on the Pop! Pop! table", 10)
achievement_score_Xm(table_pop_pop, tileset_pop_pop, 5000000, "Pop! Pop! Expert", 
                     "Score at least 5,000,000 points on the Pop! Pop! table", 25)

achievement(
    title = "Bowling for Billiards",
    description = "Knock down the six lower bowling pins on the Pop! Pop! table",
    points = 5,
    trigger = table() == table_pop_pop && tileset() == tileset_pop_pop && byte(0x0000B4) == 6 // six lower pins knocked over
)

achievement(
    title = "Rack 'em",
    description = "Sink all four billiard balls on the Pop! Pop! table",
    points = 5,
    trigger = table() == table_pop_pop && tileset() == tileset_pop_pop && byte(0x0000B7) == 2 // marker advances from 1K to 10K
)

// I couldn't find a reliable way to tell when the extra was hit, so just watch for the number of balls
// to increase. This also happens after leaving the table (to reset to original value), so ensure we're
// still on the table when this occurs (note: table value doesn't change, but tileset value does).
achievement(
    title = "Pop! Pop! Extra",
    description = "Collect the Extra marker on the Pop! Pop! table",
    points = 10,
    trigger = table() == table_pop_pop && tileset() == tileset_pop_pop && 
                         remaining_balls() > prev(remaining_balls())
)

// ===============
// Viva! Golf (55)
// ===============
//  10 Beginner - Score 30,000 points
//  30 Expert - Score 150,000 points
//   5 Whack-a-mole - Knock out the large gopher
//  10 Whack-another-mole - Knock out the small gopher near the upper paddle
 
achievement_score_X0k(table_viva_golf, tileset_viva_golf, 30000, "Viva! Golf Beginner", 
                      "Score at least 30,000 points on the Viva! Golf table", 10)
achievement_score_XX0k(table_viva_golf, tileset_viva_golf, 150000, "Viva! Golf Expert", 
                       "Score at least 150,000 points on the Viva! Golf table", 25)

// Similar to "Pop! Pop! Extra", this triggers when returning to the menu - add a tileset check to fix
achievement(
    title = "Whack-a-mole",
    description = "Get the big gopher to come out of his hole",
    points = 5,
    trigger = table() == table_viva_golf && tileset() == tileset_viva_golf &&
              byte(0x0006a5) == 0 && prev(byte(0x0006a5)) == 9
)

// this also needs a tileset check to prevent triggering if the player loses the ball while the gopher is out
achievement(
    title = "Whack-another-mole",
    description = "Hit the small gopher near the upper paddle",
    points = 10,
    trigger = table() == table_viva_golf && tileset() == tileset_viva_golf && byte(0x000691) == 3
)
 
// ===============
//  Circus (65)
//  ==============
//  10 Beginner - Score 50,000 points
//  30 Expert - Score 300,000 points
//   5 Light the Way - Activate all four upper gate lamps.
//   5 Target Practice - Knock down the indicated target once lit.
//   5 Slots - Match three symbols on the slot machine.
//  10 Animal Tamer - Capture four animals of any type in the bonus stage.

achievement_score_X0k(table_circus, tileset_circus, 50000, "Circus Beginner", 
                      "Score at least 50,000 points on the Circus table", 10)
achievement_score_XX0k(table_circus, tileset_circus, 250000, "Circus Expert", 
                       "Score at least 250,000 points on the Circus table", 25)

achievement(
    title = "Juggling Act",
    description = "Activate all four seal lamps on the Circus table",
    points = 5,
    trigger = table() == table_circus && tileset() == tileset_circus && byte(0x0000BE) == 1
)

achievement(
    title = "Target Practice",
    description = "Knock down the indicated target once lit on the Circus table",
    points = 10,
    trigger = table() == table_circus && tileset() == tileset_circus && byte(0x0000BD) == 6 // 5 = lit, 6 = triggered, then resets to 0 
)

function slots_match(id) => byte(0x0000B7) == id && byte(0x0000B8) == id && byte(0x0000B9) == id

achievement(
    title = "Three of a Kind",
    description = "Match three symbols on the Circus slot machine",
    points = 5,
    trigger = table() == table_circus && tileset() == tileset_circus &&
              (slots_match(1) || // gold - minigame accessible
               slots_match(2) || // clowns - all
               slots_match(3) || // seals - extra ball (lit?)
               slots_match(4) || // cherries - opens gate to plunger
               slots_match(5) || // plums - bumpers worth 500 points each
               slots_match(6))
) 
  
// byte XXB is how many of an animal have been caught. byte XXC is the location of the cage. have to check
// for XXC not being 0 or achievement triggers when the slots wheel is spinning
achievement(
    title = "Animal Tamer",
    description = "Collect four animals of any type in the Circus mini-game",
    points = 10,
    trigger = table() == table_circus && tileset() == tileset_circus &&
              ((byte(0x00029B) == 4 && byte(0x00029C) != 0) || // lions
               (byte(0x0002CB) == 4 && byte(0x0002CC) != 0) || // tigers
               (byte(0x0002FB) == 4 && byte(0x0002FC) != 0) || // alligators
               (byte(0x00032B) == 4 && byte(0x00032C) != 0) || // apes
               (byte(0x00035B) == 4 && byte(0x00035C) != 0) || // seals
               (byte(0x00038B) == 4 && byte(0x00038C) != 0) || // pandas
               (byte(0x0003BB) == 4 && byte(0x0003BC) != 0))   // snakes
)
