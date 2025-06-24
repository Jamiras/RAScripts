// Hamepane - Tokyo Mew Mew
// #ID = 10775

// L=rotate piece
// R=move cursor faster while holding panel
// B=submit puzzle
// A=grab/release panel
// SELECT=barrier (use when rat appears - costs 3 cats)
// START=pause

// A+B+SELECT+START=return to title

// === MENU ===
// * はじめから - From the beginning
//   - カフェ ミュウミュウ - Story Mode
//     - プロローグを見る。 - Watch the prologue
//     - プロローグを見ない。 - Don't watch the prologue
//   - たいいくかん - Multiplayer
//   - きょうしつ - Free play
//   - あそびかた - Instructions
// * つづきから - Continue from
// * おまけ - Extras
//   - びじゅつしつ - Art Room
//   - おれがくしつ - Sound
//   - うらない - Fortune Telling

// You start with pictures 6, 10, 19, 29, 37, 47, 55, 57, 58, 59, 61 unlocked (11/70)
// To unlock additional pictures, play through Free Play mode.
// - Three require completing Free Play mode without ever asking for additional time
// Each picture appearing in story mode can be unlocked by stopping the scrolling with the
//   desired picture entirely visible. You'll see "omedetou" (congratulations) if done correctly.
//   "kuria" (clear) appears if you miss, or already have the picture unlocked.
// As several story mode nodes have three pictures, and there are multiple branches through story mode,
//   you'll need to do story mode a minimum of six times to unlock all of the pictures. You only have to
//   do Free Play mode once, as long as you never ask for more time.
// If the rat appears on screen, press Select to use 3 cats to scare it away or it will do bad things
//   like rearrange your placed tiles or obscure the screen. Cats are randomly awarded for playing pieces
//   in the correct spots.
// Clear story mode to unlock fortune telling.
// For your convienence, I've created a mosaic of all the unlockable pictures that you can use as a checklist:
// - https://github.com/Jamiras/RAScripts/blob/master/GBA/Hamepane%20-%20Tokyo%20Mew%20Mew/Art%20Room.png

function elapsed_frames() => dword(0x1908)
function clear_percent() => byte(0x33A2)
function story_puzzle_index() => byte(0x5184)
function is_cutscene() => byte(0x33ea) == 2
function free_play_puzzle_index() => byte(0x341a) + 1
function free_play_puzzle_count() => sum_of(range(0x1938,0x193e), a => bitcount(a))
                                   + bit0(0x193f) + bit1(0x193f) + bit2(0x193f) + bit3(0x193f)

function mode() => byte(0x335b)
mode_story = 0
mode_freeplay = 2

function screen() => byte(0x54f6)
screen_end_credits = 8

function title_page() => byte(0x54b8)
title_page_extras = 0x07
title_page_fortune = 0x0c
title_page_sound = 0x0d
title_page_credits = 0x44 // ??

title_pages = {
    title_page_extras: "Browsing extras",
    title_page_sound: "Listening to game sounds",
    title_page_fortune: "Getting a fortune",
}

function menu_selection() => byte(0x5424)
menu_selection_instructions = 0x03


// start with pictures 6, 10, 19, 29, 37, 47, 55, 57, 58, 59, 61 unlocked (11/70)

unlocks = {
    01: bit0(0x48000), // Story 10a - red
    02: bit1(0x48000), // Story 1 - pink
    03: bit2(0x48000), // Story 12 - pink
    04: bit3(0x48000), // Story 11b - red
    05: bit4(0x48000), // Free Play 36-40
    06: bit5(0x48000), // Start with
    07: bit6(0x48000), // Free Play 41-45
    08: bit7(0x48000), // Free Play 46-50
    09: bit0(0x48001), // Story 11a - pink
    10: bit1(0x48001), // Start with
    11: bit2(0x48001), // Free Play 1-5
    12: bit0(0x48020), // Story 5 (also bit1 - double tall)
    13: bit2(0x48020), // Story 12 (also bit3 - double tall)
    14: bit4(0x48020), // story 9 (also bit5 - double tall)
    15: bit0(0x48002), // Story 3a - face
    16: bit1(0x48002), // Story 4 - blue
    17: bit2(0x48002), // Story 3a - posing 
    18: bit3(0x48002), // Story 10b - blue
    19: bit4(0x48002), // Start with
    20: bit5(0x48002), // Story 3a - face
    21: bit0(0x48022), // Story 2a (also bit1 - double tall)
    22: bit2(0x48022), // Free Play 6-10 (also bit3 - double tall)
    23: bit0(0x48004), // Story 3b - maid
    24: bit1(0x48004), // Story 4 - green maid
    25: bit2(0x48004), // Story 3b - dress
    26: bit3(0x48004), // Story 10b - green
    27: bit4(0x48004), // Free Play 26-30
    28: bit5(0x48004), // Free Play 11-15
    29: bit6(0x48004), // Start with
    30: bit7(0x48004), // Story 3b - vest
    31: bit0(0x48024), // Story 2b (also bit1 - double tall)
    32: bit0(0x48006), // Story 7b - maid
    33: bit1(0x48006), // Story 8 - yellow maid
    34: bit2(0x48006), // Story 7b - dress
    35: bit3(0x48006), // Story 11b - yellow
    36: bit4(0x48006), // Story 7b - vest
    37: bit5(0x48006), // Start with
    38: bit0(0x48026), // Story 6b (also bit1 - double tall)
    39: bit2(0x48026), // Free Play 16-20
    40: bit0(0x48008), // Story 7a - somber left
    41: bit1(0x48008), // Story 8 - purple maid
    42: bit2(0x48008), // Story 7a - wistful right
    43: bit3(0x48008), // Story 11b - purple
    44: bit4(0x48008), // Story 7a - double
    45: bit5(0x48008), // Free Play 31-35
    46: bit6(0x48008), // Free Play 21-25
    47: bit7(0x48008), // Start with
    48: bit0(0x48028), // Story 6a (also bit1 - double tall)
    49: bit0(0x4800A), // Story 12 - purple
    50: bit1(0x4800A), // Story 4 - red
    51: bit2(0x4800A), // Story 8 - purple vest
    52: bit3(0x4800A), // Story 11a - blue
    53: bit4(0x4800A), // Story 10a - blue
    54: bit5(0x4800A), // Story 1 - blue
    55: bit6(0x4800A), // Start with
    56: bit7(0x4800A), // Story 13 - orange
    57: bit0(0x4800B), // Start with
    58: bit1(0x4800B), // Start with
    59: bit2(0x4800B), // Start with
    60: bit3(0x4800B), // Story 13 - green
    61: bit4(0x4800B), // Start with
    62: bit5(0x4800B), // Story 11a - both
    63: bit6(0x4800B), // Story 12 - group
    64: bit7(0x4800B), // Story 13 - blue
    65: bit0(0x4802A), // Story 13 (also bit1 - double )
    66: bit2(0x4802A), // Free Play 56-60 (also bit3 - double wide)
    67: bit4(0x4802A), // Free Play 51-55 (also bit5 - double wide)
    68: bit0(0x4800C), // Free Play 56-60 [no time extension]
    69: bit1(0x4800C), // Free Play 56-60 [no time extension]
    70: bit6(0x4802A), // Free Play 56-60 [no time extension] (also bit7 - double wide)
}

// Fortune telling mode: bit7(0x4803F)
function num_unlocked_pictures() => sum_of(unlocks, i => unlocks[i])

story_puzzles = {
    0x01: "1",
    0x02: "2a",
    0x03: "3a",
    0x04: "4",
    0x05: "5",
    0x06: "6b",
    0x07: "7b",
    0x08: "8",
    0x09: "9",
    0x0A: "10a",
    0x0B: "11a",
    0x0C: "12",
    0x0D: "13",
    0x0E: "13", // epilogue gets its own ID
    0x0F: "2b",
    0x10: "3b",
    0x11: "6a",
    0x12: "7a",
    0x13: "10b",
    0x14: "11b",
}

// ============================================

// Mode isn't cleared when returning the the title screen, but this bit gets set.
// It's not set until the first time the user reaches the title screen, so there's
// another check later against another address that's not set until entering story mode
rich_presence_conditional_display(byte(0x5509) == 1 && mode() != mode_freeplay, "{0} | {1}/70 pictures",
    rich_presence_lookup("TitlePage", title_page(), title_pages, fallback="Titles"),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

rich_presence_conditional_display(menu_selection() == menu_selection_instructions, "Learning how to play")

// free play check gets priority over non-story title check
rich_presence_conditional_display(mode() == mode_freeplay && is_cutscene(), 
    "Free Play between puzzles | {0} completed | {1}/70 pictures",
    rich_presence_value("Count", free_play_puzzle_count()),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

rich_presence_conditional_display(mode() == mode_freeplay, "Free Play puzzle {0} | {1}% | {2}/70 pictures",
    rich_presence_value("Index", free_play_puzzle_index()),
    rich_presence_value("Progress", clear_percent()),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

// non-story title check
rich_presence_conditional_display(byte(0x33e8) == 0, "{0} | {1}/70 pictures",
    rich_presence_lookup("TitlePage", title_page(), title_pages, fallback="Titles"),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

// story mode
rich_presence_conditional_display(mode() == mode_story && is_cutscene(), "Story puzzle {0} | Cutscene | {1}/70 pictures",
    rich_presence_lookup("Puzzle", story_puzzle_index(), story_puzzles),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

rich_presence_conditional_display(mode() == mode_story && screen() == screen_end_credits, 
                                  "Story complete | {0}/70 pictures",
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

rich_presence_conditional_display(mode() == mode_story, "Story puzzle {0} | {1}% | {2}/70 pictures",
    rich_presence_lookup("Puzzle", story_puzzle_index(), story_puzzles),
    rich_presence_value("Progress", clear_percent()),
    rich_presence_value("Unlocks", num_unlocked_pictures())
)

// should never get here
rich_presence_display("Unknown")

// ============================================

// Characters: Ichigo (Strawberry), Minto (Mint), Retasu (Lettuce), Bu-Ling (Pudding), Zakuro (Pomegranate)

// Story Mode (6 playthroughs to unlock everything):
// 1 (pink=2) > 2a (21) > 3a (maid=15) 
//            > 4 (blue=16) > 5 (12) > 6a (48) > 7a (double=44)
//            > 8 (purple background with vest=51) > 9 (14) > 10a (blue=53) > 11a (pink=9)
//            > 12 (13 + purple=49)
// 1 (blue=54) > 2b (31) > 3b (maid=23) [B-B-B route required to access event 13]
//             > 4 (green maid=24) > 5 > 6b (38) > 7b (maid=32)
//             > 8 (purple maid=41) > 9 > 10b (blue=18) > 11b (yellow=35)
//             > 12 (group=63) > 13 (65 + orange=56)
// 1 > 2a > 3a (face=20)
//        > 4 (red=50) > 5 > 6a > 7a (somber left=40)
//        > 8 (yellow maid=33) > 9 > 10a (red=1) > 11a (blue=52)
//        > 12 (pink=3) > 13 (green=60)
// 1 > 2a > 3a (posing=17)
//        > 4 > 5 > 6a > 7a (wistful right=42)
//        > 8 > 9 > 10a > 11a (both=62)
//        > 12 > 13 (blue=64)
// 1 > 2b > 3b (vest=30)
//        > 4 > 5 > 6b > 7b (vest=36)
//        > 8 > 9 > 10b (green=26) > 11b (purple=43) > 12 > 13
// 1 > 2b > 3b (dress=25)
//        > 4 > 5 > 6b > 7b (dress=34)
//        > 8 > 9 > 10b > 11b (red=4) > 12 > 13

// Story Mode:
// 1 - Part 1 "Is it dangerous? Strawberry"
//     #01 - 2x2 puzzle, 2:00 (picture 2 [pink] or picture 54 [blue])
// [CHOICE]
//   - Go to Minto's place (-> 2a)
//   - Go to Retasu's place (-> 2b)

// 2a - Part 2 "Lady"
//      #02 - 2x2 puzzle, 0:45 (picture 21)
//    -> 3a

// 2b - Part 2 "The lettuce is the lettuce"
//      #0F - 2x2 puzzle, 0:45 (picture 31)
//    -> 3b

// 3a - Part 3 "The usual mint"
//      #03 - 2x2 puzzle, 0:30 (picture 15 [maid] or picture 20 [face] or picture 17 [posing])
//    -> 4a

// 3b - Part 3 "Lettuce is a gentle color"
//      #10 - 22 puzzle, 0:30 (picture 23 [maid] or picture 30 [vest] or picture 25 [dress])
//    -> 4

// 4 - Part 4 "Little Devil"
//     #04 - 3x3 puzzle, 2:00 (picture 16 [blue] or picture 24 [green maid] or picture 50 [red])
//   -> 5

// 5 - Part 5 "Strawberry Burdock"
//      #05 - 3x3 puzzle, 2:00 (picture 12)
// [CHOICE]
//   - Go see Zakuro (-> 6a)
//   - Go see Buling (-> 6b)

// 6a - Part 6 "Light Purple"
//      #11 - 3x3 puzzle, 1:45 (picture 48)
//    -> 7a

// 6b - Part 6 "The Yellow Guy"
//      #06 - 3x3 puzzle, 1:45 (picture 38)
//    -> 7b

// 7a - Part 7 "Profile of Cherry Blossoms"
//      #12 - 3x3 puzzle, 1:30 (picture 44 [double] or picture 40 [somber left] or picture 42 [wistful right])
//    -> 8

// 7b - Part 7 "Feeling of Pudding"
//      #07 - 3x3 puzzle, 1:30 (picture 32 [maid] or picture 36 [vest] or picture 34 [dress])
//    -> 8

// 8 - Part 8 "Cold Eyes"
//     #08 - 4x4 puzzle, 3:30 (picture 51 [purple vest] picture 41 [purple maid] or picture 33 [yellow maid])
//   -> 9

// 9 - Part 9 "Red Data Animal Girls"
//     #09 - 4x4 puzzle, 3:30 (picture 14)
// [CHOICE]
//    - Chase after Aoyama (-> 10a)
//    - Don't chase after Aoyama (-> 10b)

// 10a - Part 10 "Mew Mew Power"
//       #0A - 4x4 puzzle, 3:15 (picture 53 [blue] or picture 1 [red])
//     -> 11a

// 10b - Part 10 "Me and Everyone"
//       #13 - 4x4 puzzle, 3:15 (picture 18 [blue] or picture 26 [green])
//     -> 11b

// 11a - Part 11 "Blue Mountain"
//       #0B - 4x4 puzzle, 3:00 (picture 9 [pink] or picture 52 [blue] or picture 62 [both])
//     -> 12

// 11b - Part 11 "Troublemaker"
//       #14 - 4x4 puzzle, 3:00 (picture 35 [yellow] or picture 43 [purple] or picture 4 [red])
//     -> 12

// 12 - Part 12 "Quiche and Strawberries"
//      #0C - 5x5 puzzle, 4:30 (picture 13 and fortune telling mode)
//                        also (picture 49 [purple] or picture 63 [group] or picture 3 [pink])
//    -> victory (first time)
//    -> 13 (every other time)
// [CHOICE]
//    - Restart at chapter 1
//    - Return to title screen

// 13 - Last Part "Important People, Important Thoughts"
//      #0D - 5x5 puzzle, 4:30 (picture 65)
//                        also (picture 56 [orange] or picture 64 [blue] or picture 60 [green])
// [CHOICE]
//    - Restart at chapter 1
//    - Return to title screen

achievement("Story Mode", "Complete Story Mode", 10, type="win_condition",
    trigger = mode() == mode_story && screen() == screen_end_credits
)

// 14 - Epilogue - "The Present Leading to the Future"
//      #0E

// Free Play:
// NOTE: pressing B on the level select screen takes you back to the title and all unsaved progress is lost!
//  1- 5 - 2x2 puzzles (picture 11)
//  6-10 - 2x2 puzzles (picture 22)
// 11-15 - 2x2 puzzles (picture 28)
// 16-20 - 2x2 puzzles (picture 39)
// 21-25 - 3x3 puzzles (picture 46)
// 26-30 - 4x4 puzzles (picture 27)
// 31-35 - 5x5 puzzles (picture 45)
// 36-40 - 5x5 puzzles (picture 5)
// 41-45 - 5x5 puzzles (picture 7)
// 46-50 - 5x5 puzzles (picture 8)
// starting at round 51, you have to start rotating the tiles!
// 51-55 - 5x5 puzzles (picture 67)
// 56-60 - 5x5 puzzles (pictures 66)(also 68,69,70 if no time extensions)

function free_play_achievement(title, description, points, last_puzzle)
{
    base = last_puzzle - 10
    offset = 0

    if (base > 24) {
        base = base - 24
        offset = offset + 3
    }
    if (base > 24) {
        base = base - 24
        offset = offset + 3        
    }

    achievement(title, description, points,
        mode() == mode_freeplay &&
        sum_of(range(0,9), i => bit(i + base, 0x1938 + offset)) == 10 &&
        sum_of(range(0,9), i => prev(bit(i + base, 0x1938 + offset))) == 9
    )    
}

free_play_achievement("Free Play I", "Complete Free Play puzzles 1-10", 2, 10)    // 22
free_play_achievement("Free Play II", "Complete Free Play puzzles 11-20", 3, 20)  // 39
free_play_achievement("Free Play III", "Complete Free Play puzzles 21-30", 5, 30) // 27
free_play_achievement("Free Play IV", "Complete Free Play puzzles 31-40", 10, 40) // 05
free_play_achievement("Free Play V", "Complete Free Play puzzles 41-50", 10, 50)  // 08
free_play_achievement("Free Play VI", "Complete Free Play puzzles 51-60", 10, 60) // 66

function unlocks_achievement(title, description, points, unlocks)
{
    achievement(title, description, points,
        measured(num_unlocked_pictures() >= unlocks) &&
        prev(num_unlocked_pictures()) < unlocks &&
        prev(num_unlocked_pictures()) > unlocks - 5
    )
}

unlocks_achievement("Art I", "Unlock 30 pictures in the art room", 5, 30)     // 63
unlocks_achievement("Art II", "Unlock 40 pictures in the art room", 10, 40)    // 10
unlocks_achievement("Art III", "Unlock 50 pictures in the art room", 10, 50)   // 42
unlocks_achievement("Art IV", "Unlock 60 pictures in the art room", 10, 60)    // 56
unlocks_achievement("Art V", "Unlock all 70 pictures in the art room", 25, 70) // 64

