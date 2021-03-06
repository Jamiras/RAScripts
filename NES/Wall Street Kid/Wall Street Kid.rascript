// Wall Street Kid
// #ID = 2063
// md5: 9c82ab408b77c29c2a2469879c6384b7

function current_month() => byte(0x03D7)
function current_day() => byte(0x03D8)
function current_cash() => dword(0x03DF)
function current_stock_value() => dword(0x040E)

function current_picture() => dword(0x0305) // really only three bytes, fourth is always 0F
picture_none = 0x0F0F0F0F
picture_sofel = 0x0F123C2C
picture_title = 0x0F161030
picture_office = 0x0F3B0F2B
picture_cars = 0x0F103016
picture_house = 0x0F213727
picture_av_store = 0x0F20003B
picture_newspaper = 0x0F063015
picture_dogs = 0x0F3B2730
picture_kid_and_lawyer = 0x0F273736
picture_phone = 0x0F103015
picture_connies_office = 0x0F3B2737
picture_arthouse = 0x0F302731
picture_bank = 0x0F051737
picture_game_over = 0x0F28301A
picture_harbor = 0x0F263027
picture_marriage = 0x0F373630
picture_honeymoon = 0x0F313021
picture_living_room = 0x0F073717
picture_dress_boutique = 0x0F213035
picture_auction = 0x0F162630
picture_jewelers = 0x0F303600
picture_house_party = 0x0F303630
picture_castle = 0x0F1A3010
picture_triumph = 0x0F212836

function no_cheating() => current_cash() < 20000000 // 20M is unreasonable for a player to collect

// ==== Milestones (75) ====
// 10 - Purchase a House (4/29 - $1M)  [429 - House]
// 15 - Purchase a Yacht (5/26 - $700K)  [527 - Harbor]
// 20 - Win the auction (7/1 - 10% of bid)  [701 - Auction]
// 30 - Purchase the Castle (7/28)  [XXX - Castle]

function milestone_achievement(title, description, points, event_picture, month, day)
{
    when_clause = current_month() == month
    if (day > 0) {
        when_clause = when_clause && current_day() <= day
    }
    
    achievement(title = title, description = description, points = points,
                trigger = current_picture() == event_picture &&
                          when_clause && no_cheating())
}

function spending_achievement(title, description, points, event_picture, month, day)
{
    achievement(title = title, description = description, points = points,
                trigger = current_picture() == event_picture &&        // event start
                          current_month() == month &&                  // date (many events have two possible days)
                          current_cash() < prev(current_cash())        // purchased something
    )
}

milestone_achievement("A Place of Your Own", "Purchase the house", 10, picture_house, 4, 0)
milestone_achievement("O Captain! My Captain!", "Purchase the yacht", 10, picture_harbor, 5, 0)
spending_achievement("That's Just the Down Payment", "Win the auction", 10, picture_auction, 7, 1)
milestone_achievement("A Room for Every Day of the Year", "Purchase the castle", 25, picture_castle, 7, 0)

// ==== Frivolous Spending (35) ====
// 5 - Buy a dog (4/15)  [415 - Dog]
// 5 - Buy a car (4/22)  [422 - Car]
// 5 - Buy an entertainment center (5/13)  [513 - Entertainment Center]
// 5 - Buy some art (5/20)  [520 - Art]
// 5 - Buy a dress (6/24)  [624 - Dress Boutique]
// 5 - Buy some jewelry (7/8)  [708 - Jeweler]
// 5 - Throw a party (7/22)  [722 - Party]

spending_achievement("How Much is That Doggy in the Window", "Buy a dog for Prisila", 5, picture_dogs, 4, 15)
spending_achievement("A Brand New Car!", "Buy a car for Prisila", 5, picture_cars, 4, 22)
spending_achievement("A Little Mood Music", "Buy an entertainment center for the new house", 5, picture_av_store, 5, 13)
spending_achievement("Masterful Strokes", "Buy a painting for the new house", 5, picture_arthouse, 5, 20)
spending_achievement("Something Elegant", "Buy a dress for Prisila", 5, picture_dress_boutique, 6, 24)
spending_achievement("Diamonds Are Forever", "Buy jewelry for Prisila", 5, picture_jewelers, 7, 8)

// money is spent before the picture changes, so can't call spending_achievement.
achievement(
    title = "All Your Friends are Invited", 
    description = "Have a housewarming party", 
    points = 5,
    trigger = current_picture() == picture_house_party &&
              current_month() == 7
)
    
// ==== Challenges (90) ====
// 20 - Purchase a Yacht very early (5/12 - $700K)  [604 - Honeymoon] - second milestone [easy with loan, but will likely fail game]
// 20 - Purchase the Castle very early (7/15)  [XXX - Triumph] - outstanding loans don't prevent winning the game
// 20 - Purchase the Castle without any outstanding loans [XXX - Bank] - outstanding loans don't prevent winning the game
// 10 - Have at least 30 shares of one company  [XXX - Office2]
// 10 - Have at least 3 shares of five different companies  [XXX - Newspaper]
// 10 - Complete the game without Prisila ever reminding you to spend time with her or work out [603 - Marriage]

milestone_achievement("You Must Have Really Wanted That Boat", "Purchase the yacht on or before 5-15", 10, picture_harbor, 5, 15)
milestone_achievement("Early Retirement", "Purchase the castle on or before 7-15", 25, picture_castle, 7, 15)

function trigger_no_loan() => bit7(0x03DE) == 0
achievement(
    title = "Debt-free Castle", 
    description = "Purchase the castle without any outstanding loans",
    points = 25,
    trigger = current_picture() == picture_castle &&
              current_month() == 7 &&
              trigger_no_loan() && no_cheating()
)

function share_type(index) => byte(0x03EA + index * 5)
function share_count(index) => word(0x03EB + index * 5)

achievement(
    title = "Concentrated Investment",
    description = "Have at least 30 shares of one company",
    points = 5,
    trigger = no_cheating() &&
              current_month() != 255 &&                          // prevent trigger on initial load
              ((share_count(0) >= 30 && share_type(0) != 255) ||
               (share_count(1) >= 30 && share_type(1) != 255) ||
               (share_count(2) >= 30 && share_type(2) != 255) ||
               (share_count(3) >= 30 && share_type(3) != 255) ||
               (share_count(4) >= 30 && share_type(4) != 255))
)

achievement(
    title = "Diversified Portfolio",
    description = "Have at least 3 shares of five different companies",
    points = 10,
    trigger = no_cheating() &&
              share_count(0) >= 3 && share_type(0) != 255 &&
              share_count(1) >= 3 && share_type(1) != 255 &&
              share_count(2) >= 3 && share_type(2) != 255 &&
              share_count(3) >= 3 && share_type(3) != 255 &&
              share_count(4) >= 3 && share_type(4) != 255
)

achievement(
    title = "Keeping the Wife Happy",
    description = "Play from the wedding to the end without Prisila reminding you to spend time with her or exercise",
    points = 10,
    trigger = once(word(0x03D7) == 0x0306) &&     // wedding day
              never(byte(0x03E5) <= 1) &&         // relationship level drops to a point where she'll call
              never(byte(0x03E6) <= 1) &&         // exercise level drops to a point where she'll call
              current_picture() == picture_castle
)

// Picnic (2 hours) - watch out for insect raid
// Shopping (4 hours) - 
// Carnival (8 hours) - watch out for equipment failures

// Swimming (2 hours) - watch out for contaminated pool
// Workout (4 hours) - 
// Hiking (8 hours) - watch out for ticks

// 00 ATNT            blue chip       
// 01 AMED            growth          
// 02 BETHLEHAM       speculative     
// 03 BOING           blue chip       
// 04 CARNIVORE       cyclical        
// 05 CENTIPEDE       cyclical        
// 06 CHRYER          speculative     
// 07 COUGHMAN        cyclical        
// 08 EXCONRAIL       growth          
// 09 FIREDMAN'S      growth          
// 0A MARRINOT        cyclical        
// 0B PAN MAM         speculative     
// 0C RATTEL TOYS     cyclical        
// 0D REEBUCKS        growth          
// 0E C. SCHLOB       growth          
// 0F STRAYHOUND      speculative     
// 10 TERADRYING      speculative     
// 11 XEAROX          blue chip       
// 12 YBM             blue chip       
// 13 YAPPLE          blue chip       

// 4/3:  fully invest in stocks of whatever category is mentioned in the "market data" section of the newspaper:
//       * cyclical: CARNIVORE, RATTEL TOYS, CENTIPEDE, COUGHMAN, MARRINOT
//       * growth: FIREDMAN'S, AMED, REEBUCKS, C.SCHLOB, EXCONRAIL
//       * speculative: CHRYER, TERADRYING, PAN MAM, STRAYHOUND, BETHLEHAM
//       * blue chip: BOING, YBM, XEAROX, YAPPLE, ATNT
//       - it's usually best to buy many shares of cheaper stocks, particularly if they're on the "hot stocks" list
//       - prefer cyclical over blue chip
//       - prefer growth over blue chip
//       - prefer growth over speculative
//       - prefer speculative over blue chip
// 4/10: decline house, adjust investments [TARGET: $600K]
// 4/12: go hiking - typically, you should go hiking any day where your barometer is below half full unless the
//       newspaper reports ticks. I won't explicitly state when you should do this in the future.
// 4/14: go to carnival - you should go to the carnival with your fiancee within a couple days of going hiking
//       unless the newspaper reports equipment failures. I won't explicitly state when you should do this in the future.
// 4/15: buy dog ($2000)
// 4/17: decline house, adjust investments [TARGET: $720K]
// 4/22: buy car ($25000)
// 4/24: accept house, adjust investments [TARGET: $860K]
// 4/28: sell all stocks [TARGET: $1M]
// 4/29: buy house ($1000000)
// 5/1:  get loan, adjust investments [TARGET: $850K (with loan)]
// 5/8:  decline doc, adjust investments [TARGET: $1000K]
// 5/13: buy stereo ($3000)
// 5/15: decline doc, adjust investments [TARGET: $1180K]
// 5/20: buy art ($50000)
// 5/22: agree to meet doc, adjust investments [TARGET: $1380K]
// 5/26: sell all stocks [TARGET: $1600K], repay loan, takeout loan
// 5/27: buy yacht ($700000)
// 5/30: adjust investments [TARGET: $900K]
// 6/3:  get married
// 6/12: adjust investments [TARGET: $1150K]
// 6/17: plan housewarming party (no money needed, just planning)
// 6/19: adjust investments [TARGET: $1350K]
// 6/24: buy dress ($20000)
// 6/26: repay loan, take out loan, adjust investments [TARGET: $1600K]
// 6/30: sell all stocks [TARGET:$1900K], pay off loan - the minimum winning bid is determined by cash+stocks at 
//       time of auction
// 7/01: win auction - bid 2x your cash+stocks (i.e. $1M = $2M bid, $1.1M = $2.2M bid). any lower and you'll be in a bidding war
// 7/03: get loan, buy stocks [TARGET: $1850K]
//       note: with the loan, you might be able to buy the castle now! But it's not an option until 7/05
// 7/07: buy jewelry ($50000)
// 7/10: adjust investments [TARGET: $2200K]
// 7/17: adjust investments [TARGET: $2800K]
// 7/21: sell enough stocks to cover cash specified on 6/17
// 7/22: have party
// 7/24: adjust investments [TARGET: $3500K]
// 7/28: sell all stocks [TARGET: $4300K], repay loan, buy castle

// RP: 4/27 - Cash:$10000 Stocks:$670000
rich_presence_display("{0}/{1} - Cash:${2} Stocks:${3}", 
    rich_presence_value("Month", current_month()),
    rich_presence_value("Day", current_day()),
    rich_presence_value("Cash", current_cash()),
    rich_presence_value("Stocks", current_stock_value())
)

leaderboard(
    title = "Final Assets",
    description = "Total cash and stock value after buying the castle (deducts for unpaid loan)",
    start = current_picture() == picture_castle && no_cheating(),
    cancel = current_cash() >= 20000000,
    submit = current_picture() == picture_triumph,
    value = current_cash() + current_stock_value() + (bit7(0x03DE) * -840000)
)