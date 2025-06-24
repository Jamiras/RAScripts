// Mind Castle I
// #ID=32652
// MD5: 7869888adaca87239fced64787fb6aed (woz-a-day)

// Manual: https://archive.org/details/A2_Mind_Castle_I_manual

// This game has 45 puzzles spread across 7 floors. On each floor you have to complete half the puzzles (rounded
// down) to advance to the next floor.

// Of those 45 puzzles, there's only three that I found particularly challenging. 
// * The first was essentially a Wordle puzzle in the guest room on the third floor. 
// * The second is in the guest room on the fourth floor. It's easy enough to decode the message, but the
//   game doesn't want the decoded message; it wants what the decoded message is describing.
// * The third is in the nanny's room on the fourth floor. This was by far the hardest puzzle for me because
//   I was trying to use the numbers as some sort of cypher. It turns out it's just a simple rebus puzzle
//   where it's "(things on the left) and (things on the right)".
// That's not to say that all the other puzzles were easy. I just didn't have to resort to scratch paper
// or the in game hint system for them. And if you like these types of puzzles, you've probably already
// encountered at least half of the puzzles in this game (or puzzles very similar to them).

puzzles = {
// --------------------------------------------------------------------------------------------
    1: [      // basement                         N         S         E         W         ID
      0x5fe4, // - coal      1                              pipes                         C1
      0x5466, // - pipes     5                    coal                shelf               C3
      0x64e8, // - shelf     S                    wine                laundry   pipes     C5
      0x613f, // - wine      16                             shelf                         C2
      0x62a9, // - laundry   9                                                  shelf     C4
    ],        // => UP from shelf puzzle (2/5 puzzles required)
// --------------------------------------------------------------------------------------------
    2: [      // first floor                      N         S         E         W         ID
      0x69a4, // - kitchen   U                              dining    cozy      scullery  C6
      0x5cf9, // - scullery  No                                       kitchen             C7
      0x6e27, // - cozy      Breakfast lunch                parlor              kitchen   CA
      0x5fbc, // - parlor    C                    cozy                          entrance  C8
      0x6f0f, // - entrance  I V                                      parlor    dining    CB
      0x6b7a, // - dining    B                    kitchen             entrance            C9
    ],        // => UP from main entrance hall (3/6 puzzles required)
// --------------------------------------------------------------------------------------------
    3: [      // second floor                     N         S         E         W         ID
      0x69a3, // - hall      C                    ballroom  theater                       D0
      0x5fd7, // - theater   any word starts J    hall                          piano     D3
      0x69ce, // - piano     A E                  trophy              theater             D4
      0x64e8, // - trophy    1                              piano     ballroom            CE
      0x565f, // - ballroom  Union                          hall      game      trophy    CD
      0x63eb, // - game      Double cross                   bath                ballroom  CC
      0x6732, // - bath      It                   game                                    CF
    ],        // => UP from hall (3/7 puzzles required)
// --------------------------------------------------------------------------------------------
    4: [      // third floor                      N         S         E         W         ID
      0x64fb, // - hallwest  Noon                 butler    upmaid    halleast  guest     DA
      0x4b10, // - butler    T                              hallwest                      D5
      0x617b, // - upmaid    9                    hallwest                                D7
      0x66a8, // - guest     Brown                                    hallwest            E2
      0x634c, // - halleast  76                   hskeeper  downmaid  servant   hallwest  D9
      0x5ef5, // - hskeeper  12                             halleast                      D6
      0x6207, // - downmaid  Wrong                halleast                                D8
      0x6677, // - servant   5                                                  halleast  E1
    ],        // => UP from halleast (4/8 puzzles required)
// --------------------------------------------------------------------------------------------
    5: [      // fourth floor                     N         S         E         W         ID
              // - westhall  (no puzzle)          playroom  girls     easthall  tom       XX
      0x5ef0, // - tom       90                                       westhall            E7
      0x6124, // - girls     Yes                  easthall                                E8
      0x4df2, // - playroom  Susan                          westhall  schoolrm            E3
      0x4a79, // - schoolrm  7                              easthall  nanny     playroom  E6
      0x5774, // - nanny     Odds and ends                  sitting             schoolrm  E4
      0x5359, // - sitting   15                   nanny                         easthall  EA
      0x4926, // - easthall  South                schoolrm  guest     sitting   westhall  E9
      0x5ab3, // - guest     Civil war            easthall            bath                EB
      0x615a, // - bath      3                                                  guest     EC      
    ],        // => UP from easthall (4/9 puzzles required)
// --------------------------------------------------------------------------------------------
    6: [      // top floor                        N         S         E         W         ID
      0x48e5, // - gallery   C                    bedroom   balcony   grnhouse  sitting   EF
      0x5b33, // - sitting   C                                        gallery             EE
      0x57ee, // - balcony   100                  gallery                                 F8
      0x620d, // - bedroom   Son                            gallery   bath                F5
      0x643d, // - bath      1                    dressing            study     bedroom   F7
      0x62e0, // - dressing  39                             bath                          F6
      0x4b2c, // - study     any word starts G                        billiard  bath      F0
      0x5dcf, // - billiard  55                             grnhouse            study     F3
      0x6081, // - grnhouse  1                    billiard                      gallery   F4
    ],        // => UP from gallery (4/9 puzzles required)
// --------------------------------------------------------------------------------------------
    7: [      // tower
      0x778c, // - blue in upper left
      0x7824, // - orange in upper left
    ],
}

floor_names = {
    1: "Basement",
    2: "First Floor",
    3: "Second Floor",
    4: "Third Floor",
    5: "Fourth Floor",
    6: "Top Floor",
    7: "Tower",
}

floor_names_lowercase = {
    1: "basement",
    2: "first floor",
    3: "second floor",
    4: "third floor",
    5: "fourth floor",
    6: "top floor",
    7: "tower",
}

  
function correct_answer() => word(0x8bae) == 0x0200
function current_floor() => byte(0x03c2)
function current_screen() => word(0x03ca)

function puzzles_completed_floor(floor) => never(current_screen() == 0) // reset at title screen
      && unless(current_screen() != 0 &&  // allow reset
                (current_floor() != floor || // only on correct floor (64e8 is shared)
                 !correct_answer())) // only count puzzles when correct answer displayed
      && measured(tally_of(puzzles[floor], length(puzzles[floor]), p => once(current_screen() == p)))

function floor_rich_presence(floor)
{
    message = floor_names[floor] + ", {0}/" + length(puzzles[floor]) + " puzzles solved"
    rich_presence_conditional_display(current_floor() == floor, message,
        rich_presence_value("Number", puzzles_completed_floor(floor))
    )
}

rich_presence_conditional_display(current_screen() == 0, "Titles")

floor_rich_presence(1) // Basement
floor_rich_presence(2) // First floor
floor_rich_presence(3) // Second floor
floor_rich_presence(4) // Third floor
floor_rich_presence(5) // Fourth floor
floor_rich_presence(6) // Top floor

rich_presence_conditional_display(current_screen() == 0x7f23, "Victorious")
rich_presence_display("Tower, 0/1 puzzles solved")

function floor_achievement(floor, normal_points, sleuth_points)
{
    achievement(floor_names[floor] + " Puzzler", "Advance to the " + floor_names_lowercase[floor + 1],
                points = normal_points, type="progression",
                trigger = current_floor() == floor + 1 && prev(current_floor()) == floor
    )
    
    description = "Solve all " + length(puzzles[floor]) + " puzzles "
    if (floor == 1)
        description = description + "in"
    else
        description = description + "on"
    description = description + " the " + floor_names_lowercase[floor]
     
    achievement(floor_names[floor] + " Sleuth", description, sleuth_points,
        trigger = puzzles_completed_floor(floor)
    )
}

floor_achievement(1, 1, 3)
floor_achievement(2, 2, 4)
floor_achievement(3, 5, 5)
floor_achievement(4, 5, 5)
floor_achievement(5, 5, 5)
floor_achievement(6, 5, 5)

// complete game: 0x3ca - 7b98 => 7bd6 => 7f23

achievement("A Cherished Treasure", "Leave the castle", 10, type="win_condition",
    trigger = current_floor() == 7 && current_screen() == 0x7f23
)

// Solution:
// P, 1
// S, P, 5
// E, P, S
// N, P, 16
// S, E, P, 9
// W, U

// P, U
// - On each jar, the second letter if four after the first
// W, P, No
// E, E, P, Breakfast lunch
// S, P, C
// W, P, I V
// W, P, B
// E, U

// P, C
// - Each card has one new symbol with an extra number of lines. The fifth card will have a pentagon
//   in addition to all of the existing symbols.
// S, P, Jumpers
// - or any word that starts with J. 
// W, P, A e
// N, P, 1
// E, P, Union
// - Tom can't be from Marango, and Rod has to be from Cal, so Tom is from Union
// E, P, Double cross
// S, P, It
// N, W, S, U

// P, Noon
// N, P, T
// - First letters of Two, Four, Six, Eight, Ten
// S, S, P, 9
// - "She has both brothers and sisters" implies at least two of each. So, at a minimum, there are three girls.
//   And twice as many sons would be six boys. 6+3 = 9
// N, W, P, Brown            * hard
// - Four of the letters in OWNER as valid. Only one in TREES, so that means either the E or R is not valid in OWNER.
//   O, W, and N are valid, so C and L are not valid in CLOWN and S and Y are not valid in SNOWY. N and either E or R
//   is valid in NEVER, so V is not valid. Only E or R is valid in TREES, so S and T are not valid. All that leaves
//   is BEACH. If E was valid, none of the other letters in BEACH would be valid, and we'd only have four letters for
//   the final word. As a result, the fourth letter of OWNER has to be R. Since CLOWN eliminated C, the fifth letter
//   must be B, A, or H. Unforunately, there's no way to narrow it down any farther, so what can be built from O, W,
//   N, R, and B, A, or H?
// E, E, P, 76
//   +1, +2, +1, +2, +1
// N, P, 12
// S, S, P, Wrong
// N, E, P, 5
// W, U

// W, P, 90
// E, S, P, Yes
// N, N, P, Susan
// - Tom is in Molly's chair doing Susan's puzzle, Tom's puzzle can't be at Tom's chair, so it must be Molly's
//   puzzle, and therefore Susan must be the one doing it.
// E, P, 7
// E, P, Odds and ends       * misleading
// S, P, 15
// - (S+M=20) => (S=20-M), (M+T=30) => (T=30-M), (S+T=40) => (20-M+30-M=40) => (50-2M=40) => (10=2M) => (M=5)
//   (S=20-M) => (S=20-5) => S=15
// W, P, South
// - Susan and Molly contradict each other, so Tom must be telling the truth.
// S, P, Civil war           * external knowledge
// - Puzzle decodes to "war between Alabama and Ohio", which was the Civil War
// E, P, 3
// - 2 like + 1 different allows for 2 different
// W, N, U

// P, C
// W, P, C
// - red dots decrease, blue lines increase, sides alternate
// E, S, P, 100
// - 100 yards for each vowel
// N, N, P, Son
// E, P, 1
// - If 3 is true, all three must be true. It doesn't matter which of the other two is true, either being true points
//   at the first bottle.
// N, P, 39
// - +1 x3, +1 x3, +1 x3
// S, E, P, Girl
// - Any word that starts with G
// E, P, 55
// - 10+9+8+7+6+5+4+3+2+1 or (n*(n+1))/2
// S, P, 1
// - (O=P+4) => (O+P=6) => (P+P+4=6) => (2P=2) => (P=1)
// W, U

// Freedom (wealth send you back to the basement if you're right. any wrong answer sends you back a floor or two)
// - If the orange and green chests talk about where Mr Winn is from, choose Blue
//   - If blue is T/T, neither orange nor green can be F/F.
//   - If green is T/T, orange must be T/F, so blue would be F/F and the key is in blue
//   - If orange is T/T, green must be T/F, so blue would be F/F and the key is in blue
// - If the blue and orange chests talk about Molly and Susan, choose Green
// - If the chests only talk about the key's location, choose Orange

