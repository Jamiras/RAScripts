// Mind Castle II
// #ID=32653
// MD5: 936aecbb8fd34a410dc8ac6f153474f5 (woz-a-day)

// Manual: https://www.mocagh.org/miscgame/mindcastle2-manual.pdf

// This game has 44 puzzles spread across 7 floors. On each floor you have to complete half the puzzles (rounded
// down) to advance to the next floor.

// This is the advanced version of Mind Castle I (though both claim to be for ages 8+). The floor layouts are
// the same, but all of the puzzles are harder.
// There's one puzzle on the fourth floor that's an obvious play on words, but I have no idea how you're 
// supposed to come up with the expected solution (maybe it's an old joke or something), so I'll provide it
// here: "Marine band".
// The greenhouse puzzle on the top floor involves performing a square root. The game expects the final answer
// rounded to two digits after the decimal.

puzzles = {
// --------------------------------------------------------------------------------------------
    1: [      // basement                         N         S         E         W         ID
      0x53d0, // - coal      Blot                           pipes                         C1
      0x5da9, // - pipes     41                   coal                stairs              C3
      0x6476, // - stairs    8                    wine                laundry   pipes     C5
      0x5b3f, // - wine      110                            stairs                        C2
      0x625a, // - laundry   2                                                  stairs    C4
    ],        // => UP from stairs (2/5 puzzles required)
// --------------------------------------------------------------------------------------------
    2: [      // first floor                      N         S         E         W         ID
      0x6179, // - kitchen   1.25                           dining    supper    scullery  C6
      0x6381, // - scullery  any word starts G                        kitchen             C7
      0x6b7f, // - supper    Cards                          drawing             kitchen   CA
      0x67b2, // - drawing   A b                  supper                        entrance  C8
      0x6e52, // - entrance  B                                        drawing   dining    CB
      0x68d1, // - dining    26                   kitchen             entrance            C9
    ],        // => UP from main entrance hall (3/6 puzzles required)
// --------------------------------------------------------------------------------------------
    3: [      // second floor                     N         S         E         W         ID
      0x5755, // - hall      14                   ballroom  theater                       CC
      0x663d, // - theater   Captain hook         hall                                    D3
      0x5c82, // - ballroom  Rick                           hall      game      trophy    CE
      0x592e, // - game      Ul                             bath                ballroom  CD
      0x62d8, // - bath      6                    game                                    D0
      0x5e84, // - trophy    24                             music     ballroom            CF
      0x681c, // - music     76                   trophy                                  D4
    ],        // => UP from hall (3/7 puzzles required)
// --------------------------------------------------------------------------------------------
    4: [      // third floor                      N         S         E         W         ID
      0x54bc, // - hallwest  20                   butler    upmaid    halleast  guest     D5
      0x55f8, // - butler    18                             hallwest                      D6
      0x5b9f, // - upmaid    20                   hallwest                                D8
      0x66f5, // - guest     4                                        hallwest            E2
      0x5fa6, // - halleast  20                   macknzie  downmaid  sitting   hallwest  DA
      0x58ff, // - macknzie  129                            halleast                      D7
      0x5dd3, // - downmaid  Never million years  halleast                                D9
      0x62aa, // - sitting   Ham milk pie                                       halleast  E1 Helen Winn
    ],        // => UP from halleast (4/8 puzzles required)
// --------------------------------------------------------------------------------------------
    5: [      // fourth floor                     N         S         E         W         ID
      0x4c6f, // - westhall  Polite               playroom  girls     easthall  tom       E3
      0x5459, // - tom       13                                       westhall            E8
      0x5765, // - girls     Marine band          easthall                                E9
      0x5252, // - playroom  10                             westhall  schoolrm            E7
      0x5044, // - schoolrm  87912                          easthall  nanny     playroom  E6
      0x5de4, // - nanny     No e                           sitting             schoolrm  EB
      0x5ae2, // - sitting   16                   nanny                         easthall  EA
              // - easthall  (no puzzle)          schoolrm  guest     sitting   westhall  --
      0x65f4, // - guest     B c                  easthall            bath                EC
      0x683a, // - bath      Dirty double crosser                               guest     ED    
    ],        // => UP from easthall (4/9 puzzles required)
// --------------------------------------------------------------------------------------------
    6: [      // top floor                        N         S         E         W         ID
      0x51eb, // - gallery   200                  bedroom   balcony   grnhouse  sitting   EE
      0x53ad, // - sitting   296                                      gallery             EF
      0x6592, // - balcony   40                   gallery                                 F6
      0x6069, // - bedroom   300                            gallery   bath                F4
      0x63c5, // - bath      tonic                                    study     bedroom   F5
      0x55da, // - study     1760                                     billiard  bath      F0
      0x590c, // - billiard  16                             grnhouse            study     F7
      0x5aab, // - grnhouse  241.42               billiard                      gallery   F3
    ],        // => UP from gallery (4/8 puzzles required)
// --------------------------------------------------------------------------------------------
    7: [      // tower
      0x6c2b, // - winn
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

rich_presence_conditional_display(current_screen() == 0x7917, "Victorious")
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

floor_achievement(1, 2, 5)
floor_achievement(2, 3, 5)
floor_achievement(3, 5, 10)
floor_achievement(4, 5, 10)
floor_achievement(5, 5, 10)
floor_achievement(6, 10, 25)

achievement("Freedom for All", "Leave the castle", 10, type="win_condition",
    trigger = current_floor() == 7 && current_screen() == 0x7917
)

// Solution:

// P, Blot
// S, P, 41
// E, P, 8
// - [A = 2((A+2) - (A-2))] => [A=2(2+2)] => [A=2x4] => [A=8]
// N, P, 110
// S, E, P, 2
// W, U

// P, 1.25
// - [J+C=5.50] => [C=J+3] => [J+J+3=5.50] => [2J=2.50] => [J=1.25]
// W, P, Governor
// - Any word that starts with G
// E, E, P, Cards
// S, P, A b
// W, P, B
// - Angle keeps decreasing
// W, P, 26
// - [2x(number back two) - (number back one)]
// E, U

// P, 14
// - Numbers at each cross add up to the same value, so 9+11=6+X
// S, P, Captain Hook
// N, N, P, Rick
// - Steve can't be the archer. Bob can't be the painter. Bob can't be the fisherman. Rick and Jim can't be the 
//   painter. Therefore, Steve is the painter. Since the painter and Bob were friends, but never shared their
//   hobbies, and Steve (the painter) once practiced with the archer, Bob can't be the archer and must be the
//   poet. Since Rick hadn't met the painter (Steve) and Stave once practiced with the archer, Rick can't be the
//   archer and must be the fisherman.
// E, P, Ul
// - Playing in the middle or middle right positions gives you two opportunities to win. O can dodge both and you
//   would have to win. Playing in the upper right could lead to a draw. In the upper left, no matter where O plays
//   you still have a safe spot to play, and the O has to go in the center.
// S, P, 6
// N, W, W, P, 24
// - [3(M-12)=F-12] => [3M-36=F-12] => [3M=F+24], [F=2M] => [3M=2M+24] => [M=24]
// S, P, 76                  * hard
// - Four three-digit numbers requires 8 of each tile for the ones and tens position (i.e. 155 255 355 455)
// - 6 and 9 are interchangeable, so you only need 8 each of 9 numbers (0,1,2,3,4,5,6,7,8) = 72
// - You don't need hundreds tiles for leading zeroes, or for 5 or higher (because you can't have 555/666/777/etc)
//   but you will need one extra of each 1, 2, 3, and 4 for the hundreds position = 76
// - If you don't use multiple tiles of a single number in the hundreds position, they'll be pulled out of the
//   other positions, so 9 of them is still sufficient (i.e. 111 112 113 114)
// N, E, S, U

// P, 20
// - T and H must be 2 and 3. H and N must be 3 and 5. Therefore H must be 3, T must be 2, and N must be 5. 
//   With that information, you can determine that I is 4 and K is 6. 2+3+4+5+6 = 20
// N, P, 18
// - Son 1 = X, Son 2 = X+3, Son 3 = X+6, Son 4 = X+9, Son 5 = X+12. [3X=X+12] => [2X=12] => [X=6]. Son 5 = x+12 = 18
// S, S, P, 20
// - -3, +4, +5, -3, +4, +5
// N, W, P, 4
// - 12" diameter = 6" radius - 0.5" edge - 1.5" center radius = 4" of playable radius
// E, E, P, 20               * hard?
// - The hint shows the 6 crossing lines. Just count the triangles. 
//   6 separate triangles. 5 made from two polygons. 2 made from 3 polyons. 4 made from 4 polygons. 2 made from 
//   5 polygons. 1 made from 6 polygons. 6+5+2+4+2+1 = 20
//   The mathematical way to figure it out doesn't make sense to me. [(6x5x4)/(3x2x1) = 120/6 = 20]
// N, P, 129
// - +3 +9 +27 +81
// S, S, P, Never in a million years
// N, E, P, Milk ham pie
// - This mostly comes down to figuring out boys and girls. Joe and Gregory are Mr. Neal and Mr. Sharp.
//   Since Joe had coffee and Mr. Neal had tea, we know that Joe is Mr. Sharp and Gregory is Mr. Neal.
//   Similarly, Nancy, Nanny, and Helen are Miss White, Mrs. Winn, and Miss Smith. Nancy had tea, while
//   Miss White had coffee and Mrs. Winn had milk, so Nancy must be Miss Smith. Nanny is not Mrs. Winn,
//   so Nanny must be Miss White, and Helen must be Mrs. Winn. So, what did Mrs. Winn have? 
// W, U

// P, Polite
// W, P, 13
// E, S, P, Marine band      * WTF?
// N, N, P, 10
// - [M+S=22] => [M=22-S], [S+T=27] => [T=27-S], [M+T=25] => [22-S+27-S=25] => [24=2S] => [S=12] => [M=22-12=10]
// E, P, 87912               * hard
// - We need a combination of A, F, and E such that [AxF=E] and [(ExF)%10=A]:
//   If F is 1, A will equal E which violates the requirement that all letters have different values.
//   If A is 1 or E is 1, A will equal E which violates the requirement that all letters have different values.
//   If A is 2, F/E could be 3/6 or 4/8. (3*6%10)=8 [not 2], (4*8%10)=2 [works]
//   If A is 3, F/E must be 2/5. (2*5%10=0) [not 3]
//   If A is 4, F/E must be 2/8. (2*8%10=6) [not 4]
//   If A is greater than 4, E will be a two digit number.
//   Therefore A must be 2, F must be 4, and E must be 8.  2BCD8x4=8DCB2. 4*8=32, so we have a carry of 3,
//   and D cannot carry into E. Since we've already assigned 2 to A, B must be 1, which would make D 4, except
//   F is already 4 and 4*4+3 doesn't equal 1. To make (4*D+3)%10=1, D must be 7. Now we know that BxF=D is
//   1x4=7, and the carry from 4*D+3 is 3, so the result of Cx4+3 must be 30+C [4C+3=30+C] => [3C=27], C=9
// E, P, No e
// S, P, 16
// - [T=2(S-n)],[T-n=S] => [T=2(T-n-n)] => [T=2T-4n] => [T=4n]; [T+S=28] => [T+T-n=28] => [2T-n=28] =>
//   [2(4n)-n=28] => [8n-n=28] => [7n=28] => [n=4]; [T=4n] => [T=16]
// W, S, P, B c
// - D has a star in the shadow of the moon. For the top of the moon to be visible (A), the sun would have to be
//   out, and we're told that this these are pictures of the night sky.
// E, P, Dirty double crosser
// - Makes sense once you know the answer, but tricky to guess if you haven't heard it before.
// W, N, U

// P, 200
// - The men travel at a combined speed of 10mph, so it takes 5 hours to meet. The bee is constantly flying at
//   40mph, so after 5 hours it will have travelled 200 miles.
// W, P, 296
// - Just work backwards. H=10. G=(H-2)*2=16. F=(G-4)*2=24. E=(F-6)*3=54. D=(E-9)*2=90. C=(D-10)*2=160.
//   B=(C-12)*2=296. So 296 passengers arrived at B.
// E, S, P, 40
// - If a hill is 10 miles up and 10 miles down, it will take one hour to go up the hill and half an hour to go
//   down, so he can do two hills in three hours for a total of 40 miles.
// N, N, P, 300              * hard
// - 100 pennies and 0 half dollars would require 400 dimes, which is $40 by itself.
//   Similarly, 200 pennies and 0 half dollars would require 300 dimes, which is $30 by itself.
//   At 300 pennies, 200 dimes would be $20, for a total of $23, which is too low, so we need to exchange some
//   dimes for half-dollars. 10 dimes for 10 half dollars would be $19 + $3 + $5 = $27 - too much.
//   5 dimes for 5 half dollars is $19.50 + $3 + 2.50 = $25.
// E, P, Tonic
// - Just guess AAAAA, BBBBB, CCCCC, etc until you know which five letters are present (CINOT), then descramble it.
// E, P, 1760                * hard
// - The first time the boats meet, the total distance travelled by the boats is the width of the river. The next
//   time they meet, they will each have travelled the width of the river (to the opposite shore) and a combined
//   width of the river (to meet again) for a total of three river widths. We know one boat only went 720 yards of
//   the total river width the first time they met, so it will have travelled a total of 720x3 (2160) yards (of the
//   three total river widths) when they meet again. At that point, it's 400 yards from shore on its return trip,
//   so the river is 2160-400 yards wide. 
// E, P, 16
// - Net profit of 8 means he won 8 more games than he lost. If he lost 4 games, he won 12, and 12+4=16.
// S, P, 241.42              * very hard
// - Given an army of length L moving at a speed of U and the messenger moving at the speed of V, it will take
//   L/(V-U) time to reach the front of the line and L/(V+U) time to return to the end of the line. Since the army
//   is moving at the speed U, it will have covered L distance in L/U time. If the messenger finds he has travelled
//   L distance after running to the front and back, L/U time will have elapsed, so [L/(V-U) + L/(V+U) = L/U].
//   Multiply both sides by (U/L) and you get [U/(V-U) + U/(V+U) = 1]. Then get a common denominator on the left
//   side by multiplying the first fraction by (V+U)/(V+U) and the second fraction by (V-U)/(V-U), and you get
//   [(U(V+U)+U(V-U))/((V+U)*(V-U))]. The numerator is [UV+U²+UV-U²], which is just [2UV], and the denominator
//   is [V²+UV-UV+U²], which is just [V²-U²], so the whole equation is [2UV/(V²-U²)=1]. Multiply both sides of the
//   equation by the denominator to get [2UV=V²-U²]. Move everything to the right: [V²-2UV-U²=0]. Divide everything
//   by U²: [(V/U)² - 2(V/U) - 1 = 0]. Replace (V/U) with another variable (P) and you have [P²-2P-1=0], which you
//   can solve with the quadratic equation: [(2±√(2²-4*1*-1))/(2*1)] => [(2±√8)/2] => 2.4142 and -0.4142. These
//   values are (V/U), which gives the ratio of the messenger speed to the army speed. If the army went L distance,
//   then the messenger went 2.4142L or -0.4142L distance. It doesn't make sense to have travelled negative distance,
//   so the solution is 2.4142 times the length of the column (100) = 241.42
// W, U

// A, Winn
// - Everyone says someone else has the key, so only one of them can be telling the truth. Whoever it is must be
//   telling four true statements, because one person only tells the truth, and if the other four people are lying
//   about the key, they can't be the person who only tells the truth.
// - Bridget says both Gregory and Nanny have the key, so Bridget can't be the wholly truesome person.
// - Gregory can't be the wholly truesome person because he says Nanny is the wholly truesome person and there can't
//   be two.
// - We know the treasure was the master's, so neither Bridget nor Nanny is the complete liar. And since Nanny isn't
//   a complete liar, Nellie isn't a complete liar either.
// - Since Bridget is not the wholly truesome person, or a complete liar, Gregory is not a complete liar either.
//   This means that Winn is the complete liar. So either Nanny or Nellie is the wholly truesome person.
// - If Nanny is only telling the truth, Gregory and Bridget both have two truths and two falsehoods, which isn't
//   allowed, so Nellie must be the wholly truesome person, which means Mr. Winn has the key.
