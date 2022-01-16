// Simpsons, The: Road Rage
// #ID = 2540
// MD5: 8f0fdaeda361783ee74abd980b418388

function current_car() => byte(0x1c11)
car_homer_sedan = 3
car_lisa_taurus = 4
car_bart_racer = 5
car_marge_canyonero = 6
car_grandpa_cart = 7
car_krusty_klown_kar = 8
car_snake_bandit = 9
car_willie_tractor = 10
car_frink_flying_car = 11
car_otto_bus = 12
car_barney_plow_king = 13
car_moe_sedan = 14
car_wiggum_cop_car = 15
car_apu_pontiac = 16
car_burns_limo = 17
car_homer_homer = 18

drivers = {
    car_homer_sedan: "Homer",
    car_lisa_taurus: "Lisa",
    car_bart_racer: "Bart",
    car_marge_canyonero: "Marge",
    car_grandpa_cart: "Grandpa",
    car_krusty_klown_kar: "Krusty",
    car_snake_bandit: "Snake",
    car_willie_tractor: "Willie",
    car_frink_flying_car: "Frink",
    car_otto_bus: "Otto",
    car_barney_plow_king: "Barney",
    car_moe_sedan: "Moe",
    car_wiggum_cop_car: "Chief Wiggum",
    car_apu_pontiac: "Apu",
    car_burns_limo: "Mr. Burns",
    car_homer_homer: "Homer",
}

function current_map() => byte(0x1c10)
map_evergreen_terrace = 1
map_entertainment_district = 2
map_springfield_dam = 5
map_down_town = 4
map_country_road = 6
map_springfield_mountains = 3

map_names = {
    map_evergreen_terrace: "Evergreen Terrace",
    map_entertainment_district: "Entertainment District",
    map_springfield_dam: "Springfield Dam",
    map_down_town: "Down Town",
    map_country_road: "Country Road",
    map_springfield_mountains: "Springfield Mountains",    
}

maps = {
    map_evergreen_terrace: "in Evergreen Terrace",
    map_entertainment_district: "in the Entertainment District",
    map_springfield_dam: "at Springfield Dam",
    map_down_town: "in Down Town",
    map_country_road: "on a Country Road",
    map_springfield_mountains: "in the Springfield Mountains",
}

function current_passenger() => byte(0x1c5c)
passenger_none = 255
passenger_homer = 0
passenger_krusty = 1
passenger_jasper = 2
passenger_skinner = 3
passenger_hans_moleman = 4
passenger_krabappel = 5
passenger_ned = 6
passenger_kent_brockman = 7
passenger_sea_captain = 8
passenger_bart = 9
passenger_wiggum = 10
passenger_moe = 11
passenger_lisa = 12
passenger_willie = 13
passenger_otto = 14
passenger_frink = 15
passenger_barney = 16
passenger_snake = 17
passenger_apu = 18
passenger_grandpa = 19
passenger_milhouse = 20
passenger_generic_boy_blond_hair = 21
passenger_generic_boy_white_hair = 22
passenger_generic_boy_brown_hair = 23
passenger_generic_man_black_hair = 24
passenger_generic_man_brown_hair = 25
passenger_generic_man_blue_hair = 26
passenger_generic_woman_brown_hair = 27
passenger_generic_woman_pink_hair = 28
passenger_generic_woman_black_hair = 29

passengers = {
    passenger_homer: " Homer",
    passenger_krusty: " Krusty",
    passenger_jasper: " Jasper",
    passenger_hans_moleman: " Hans Moleman",
    passenger_skinner: " Principal Skinner",
    passenger_krabappel: " Mrs. Krabappel",
    passenger_ned: " Ned",
    passenger_kent_brockman: " Kent Brockman",
    passenger_sea_captain: " the Sea Captain",
    passenger_bart: " Bart",
    passenger_wiggum: " Chief Wiggum",
    passenger_moe: " Moe",
    passenger_lisa: " Lisa",
    passenger_willie: " Willie",
    passenger_otto: " Otto",
    passenger_frink: " Frink",
    passenger_barney: " Barney",
    passenger_snake: " Snake",
    passenger_apu: " Apu",
    passenger_grandpa: " Grandpa",
    passenger_milhouse: " Milhouse",
    passenger_generic_boy_blond_hair: " a boy",
    passenger_generic_boy_white_hair: " a boy",
    passenger_generic_boy_brown_hair: " a boy",
    passenger_generic_man_black_hair: " a man",
    passenger_generic_man_brown_hair: " a man",
    passenger_generic_man_blue_hair: " a man",
    passenger_generic_woman_brown_hair: " a woman",
    passenger_generic_woman_pink_hair: " a woman",
    passenger_generic_woman_black_hair: " a woman",
}

function current_difficulty() => byte(0x1cf1)
difficulty_easy = 0
difficulty_normal = 1
difficulty_hard = 2

function current_screen() => byte(0x0c08)
screen_driving = 0x10
screen_main_menu = 0x20
screen_titles = 0x30
screen_driver_select = 0x40 // also location select
screen_post_driving = 0x50 // rating and progress
screen_mission_summary = 0x70
screen_options = 0x90
screen_get_password = 0xa0
screen_set_password = 0xb0
screen_new_vehicle = 0xc0
screen_performance_passenger_select = 0xd0
screen_ending = 0xe0
screen_color_edit = 0xf0

function current_mode() => byte(0x0c20)
mode_road_rage = 0
mode_performance = 1
mode_sunday_drive = 2
mode_mission = 3

function selected_background() => byte(0x1cf4)
background_burns = 0
background_simpsons = 1
background_school = 2

function in_game() => byte(0x1d00) == 1
function current_money() => dword(0x38f0)
function total_money() => dword(0x1c94)
function missions_completed() => byte(0x1ced)
function current_mission() => byte(0x0c60)
function current_fare_time() => byte(0x38f8)

function in_mode(mode) => in_game() && current_mode() == mode

function fare_complete() => byte(0x3905) == 1 && prev(byte(0x3905)) == 0
function complete_fares(count) => repeated(count, fare_complete()) && never(current_screen() != screen_driving)  
function completed_fares() => measured(fare_complete()) && never(current_screen() != screen_driving)

rich_presence_conditional_display(in_mode(mode_road_rage), 
    "{0} is driving{1} {2} | Current trip: {3} passengers, ${4} | Total: ${5}",
    rich_presence_lookup("Driver", current_car(), drivers),
    rich_presence_lookup("Passenger", current_passenger(), passengers),
    rich_presence_lookup("Location", current_map(), maps),
    rich_presence_value("Number", completed_fares()),
    rich_presence_value("Money", current_money()),
    rich_presence_value("Money", total_money())
)

rich_presence_conditional_display(in_mode(mode_mission), 
    "{0} is driving in Mission {1} | Total: ${2}",
    rich_presence_lookup("Driver", current_car(), drivers),
    rich_presence_value("Mission", current_mission()),
    rich_presence_value("Money", total_money())    
)

rich_presence_conditional_display(in_mode(mode_performance), 
    "{0} is driving{1} {2} | Performance Mode: ${3} | Total: ${4}",
    rich_presence_lookup("Driver", current_car(), drivers),
    rich_presence_lookup("Passenger", current_passenger(), passengers),
    rich_presence_lookup("Location", current_map(), maps),
    rich_presence_value("Money", current_money()),
    rich_presence_value("Money", total_money())    
)

rich_presence_conditional_display(in_mode(mode_sunday_drive), 
    "{0} is driving{1} {2} | Sunday Drive | Total: ${3}",
    rich_presence_lookup("Driver", current_car(), drivers),
    rich_presence_lookup("Passenger", current_passenger(), passengers),
    rich_presence_lookup("Location", current_map(), maps),
    rich_presence_value("Money", total_money())    
)

rich_presence_display("In menu | Total: ${0}",
    rich_presence_value("Money", total_money())
)

// ------------------------------------------------------------

function road_rage_leaderboard(map)
{
    leaderboard(map_names[map], "Highest " + map_names[map] + " earnings in Road Rage mode on Normal",
        start = current_mode() == mode_road_rage &&
                current_map() == map &&
                current_difficulty() == difficulty_normal &&
                current_screen() == screen_post_driving &&
                prev(current_screen()) == screen_driving,
        cancel = always_false(),
        submit = always_true(),
        value = current_money()
    )
}

road_rage_leaderboard(map_evergreen_terrace)
road_rage_leaderboard(map_entertainment_district)
road_rage_leaderboard(map_springfield_dam)
road_rage_leaderboard(map_down_town)
road_rage_leaderboard(map_country_road)
road_rage_leaderboard(map_springfield_mountains)

// ------------------------------------------------------------
// Missions (51 points)

function mission_achievement(mission_number, title, points)
{
    achievement(title, "Complete mission " + mission_number, points,
        trigger = in_mode(mode_mission) && 
                  current_mission() == mission_number &&
                  byte(0x38fe) == 1 && prev(byte(0x38fe)) == 0 // mission completed
    )
}

function mission_achievement2(mission_number, title, points)
{
    achievement(title, "Complete mission " + mission_number, points,
        trigger = in_mode(mode_mission) && 
                  current_mission() == mission_number &&
                  byte(0x3902) == 1 && prev(byte(0x3902)) == 0 // mission completed
    )
}

// mission 1: destroy 12 newspaper boxes (Willie)
mission_achievement(1, "Paper Shredder", 2)

// mission 2: bounce on clouds for 5 seconds (Frink) - unlock selectable backgrounds
mission_achievement(2, "Lighter than Air", 5)

// mission 3: destroy 12 mascots (Barney)
mission_achievement(3, "Mascot Mayhem", 3)

// mission 4: collect 20 flags and finish race (Otto)
mission_achievement2(4, "Licensed to Drive", 5)

// mission 5: complete race (Snake) - unlock course layout (view maps)
mission_achievement(5, "Canyon Crossing", 4)

// mission 6: complete race/maze (Moe)
mission_achievement(6, "Moe's Maze", 4)

// mission 7: collect 3500 points worth of donuts (Wiggum)
mission_achievement(7, "Donut Rain", 3)

// mission 8: destroy 8 piles of wood (Lisa) - unlock color edit
mission_achievement(8, "I Speak for the Trees", 5)

// mission 9: complete three minigames and finish race (Krusty)
mission_achievement(9, "Circus Training", 10)

// mission 10: destroy 10 statues (Homer) - unlock The Homer car
mission_achievement2(10, "Springfield Gladiator", 10)

// ------------------------------------------------------------
// Road Rage challenges (58 points)

function delivery_speed_bonus() => byte(0x3900)
delivery_speed_bonus_fast = 0
delivery_speed_bonus_average = 1
delivery_speed_bonus_slow = 2
delivery_speed_bonus_safe = 3
delivery_speed_bonus_road_rage = 4

function delivery_distance_bonus() => byte(0x3902)
delivery_distance_bonus_satisfaction_max = 2
delivery_distance_bonus_just = 6
delivery_distance_bonus_near = 7
delivery_distance_bonus_average = 8
delivery_distance_bonus_far = 9

achievement("Target Practice", "Get a Road Rage! delivery bonus in Road Rage mode", 3,
    trigger = in_mode(mode_road_rage) &&
              fare_complete() &&
              delivery_speed_bonus() == delivery_speed_bonus_road_rage
)

achievement("Safe and Prudent", "Get a Safe Bonus! delivery bonus in Road Rage mode", 3,
    trigger = in_mode(mode_road_rage) &&
              fare_complete() &&
              delivery_speed_bonus() == delivery_speed_bonus_safe
)

achievement("Spot On", "Get a Just! delivery bonus in Road Rage mode", 2,
    trigger = in_mode(mode_road_rage) &&
              fare_complete() &&
              delivery_distance_bonus() == delivery_distance_bonus_just
)

achievement("Is the Seat Still Clean?", "Help 10 people reach their destination in a single Road Rage outing", 10,
   trigger = in_mode(mode_road_rage) &&
             never(current_screen() != screen_driving) &&
             measured(repeated(10, fare_complete()))
)

// Destructive rating
achievement("Three Counsellors Are Missing, and Presumed Scared", "Earn $10,000 in a single Road Rage outing", 10, 
   trigger = in_mode(mode_road_rage) &&
             current_screen() == screen_driving &&
             current_money() > 10000
)

achievement("If Something's Hard to Do, Then It's Not Worth Doing", "Earn $25,000 in a single Road Rage outing", 25,
   trigger = in_mode(mode_road_rage) &&
             current_screen() == screen_driving &&
             current_money() > 25000
)

achievement("Let Us Never Speak of the Shortcut Again",
            "Complete a delivery in Road Rage mode with more than 30 seconds remaining on the delivery timer", 5,
   trigger = in_mode(mode_road_rage) &&
             fare_complete() &&
             current_fare_time() > 30
)

// ------------------------------------------------------------
// Monetary rewards (106 points)

function unlock_achievement(title, description, points, bit)
{
    achievement(title, description, points,
        trigger = // award is unlocked on the post driving screen
                  once(current_screen() == screen_post_driving && bit == 1 && prev(bit) == 0) &&
                  // wait for the "Exit" button to appear on the reward screen
                  current_screen() == screen_new_vehicle &&
                  byte(0x36e4) == 1 && prev(byte(0x36e4)) == 0
    )
}

// $10,000 - Groundskeeper Willie [Homer, Bart, Grandpa, Snake, Burns, Bart, Moe, Maggie]
unlock_achievement("You Can Always Go... Ach! Doontoon!", "Unlock Groundskeeper Willie", 2, bit5(0x1c90))
// $50,000 - Entertainment District [Homer, Marge, Krusty, Homer, Burns, Bart, Frink, Maggie]
unlock_achievement("A Night Out on the Town", "Unlock the Entertainment District", 4, bit1(0x1cec))
// $100,000 - Krusty [Snake, Lisa, Grampa, Barney, Maggie, Wiggum, Bart, Marge]
unlock_achievement("I Heartily Endorse This Event and/or Product!", "Unlock Krusty the Clown", 5, bit6(0x1c90))
// $150,000 - Springfield Dam [Snake, Grampa, Bart, Wiggum, Homer, Wiggum, Burns, Homer]
unlock_achievement("I'm Thinking of Jumping Off", "Unlock the Springfield Dam", 5, bit2(0x1cec))
// $200,000 - Snake [Apu, Frink, Krusty, Willie, Bart, Wiggum, Otto, Grampa]
unlock_achievement("She Needs Premium, Dude. Premium!", "Unlock Snake", 5, bit7(0x1c90))
// $250,000 - Down Town [Moe, Maggie, Lisa, Bart, Bart, Wiggum, Snake, Krusty]
unlock_achievement("Do You Know Any Good Places to Eat a Meal?", "Unlock Down Town", 5, bit3(0x1cec))
// $300,000 - Frink [Frink, Marge, Homer, Burns, Lisa, Wiggum, Grampa, Krusty]
unlock_achievement("We Found That Drivers Move the Fastest Through Yellow Lights", "Unlock Professor Frink", 5, bit0(0x1c91))
// $350,000 - Country Road [Krusty, Barney, Maggie, Wiggum, Marge, Wiggum, Krusty, Moe]
unlock_achievement("Look at the City Slicker Pulling Up in His Fancy German Car", "Unlock Country Road", 5, bit4(0x1cec))
// $400,000 - Otto
unlock_achievement("Fifteen Crashes and Not a Single Fatality", "Unlock Otto", 5, bit1(0x1c91))
// $450,000 - Barney [Snake, Maggie, Marge, Homer, Grampa, Wiggum, Krusty, Snake]
unlock_achievement("Natural Light! Get It Off Me!", "Unlock Barney", 5, bit2(0x1c91))
// $500,000 - Springfield Mountains [Willie, Willie, Maggie, Maggie, Willie, Bart, Burns, Marge]
unlock_achievement("It's an Avalanche of Fun!... and Ice!", "Unlock Springfield Mountains", 5, bit5(0x1cec))
// $600,000 - Moe [Wiggum, Frink, Lisa, Krusty, Snake, Moe, Moe, Wiggum]
unlock_achievement("Don't Steal Any Beer While I'm Gone", "Unlock Moe", 10, bit3(0x1c91))
// $700,000 - Wiggum [Maggie, Frink, Snake, Maggie, Frink, Moe, Homer, Bart]
unlock_achievement("Let's Roll Boys", "Unlock Chief Wiggum", 10, bit4(0x1c91))
// $800,000 - Apu [Moe, Snake, Burns, Snake, Otto, Bart, Lisa, Otto]
unlock_achievement("If You Survive, Please Come Again", "Unlock Apu", 10, bit5(0x1c91))
// $1,000,000 - Burns [Snake, Barney, Otto, Frink, Apu, Moe, Apu, Apu]
unlock_achievement("Out of My Way! I'm a Motorist", "Unlock Mr. Burns", 25, bit7(0x1c91))
//achievement("Public Transportation Belongs to the Public", "Unlock Mr. Burns", 25,
//    trigger = current_mode() == mode_road_rage &&
//              // award is unlocked on the post driving screen
//              once(current_screen() == screen_post_driving && bit7(0x1c91) == 1 && prev(bit7(0x1c91)) == 0) &&
//              // wait for the bag to drop
//              current_screen() == screen_ending &&
//              byte(0x35a4) == 1 && prev(byte(0x35a4)) == 0
//)

// ------------------------------------------------------------
// Performance Mode (N points)

function current_combo() => byte(0x1c60)
function satisfaction_needed() => word(0x1c5e)

achievement("It's My Job to Be Repetitive", "Get a Combo x5 in Performance Mode", 5,
    trigger = current_mode() == mode_performance &&
              current_screen() == screen_driving &&
              current_combo() == 5
)

achievement("Every Vandalism Spree Needs an Obnoxious Laugher", "Get a Combo x10 in Performance Mode", 10,
    trigger = current_mode() == mode_performance &&
              current_screen() == screen_driving &&
              current_combo() == 10
)

achievement("P-p-please H-hurry...", "Earn $5,000 in a single Performance Mode outing", 10,
   trigger = in_mode(mode_performance) &&
             current_screen() == screen_driving &&
             current_money() > 5000
)

// Willie + Wiggum + Entertainment District - run over stuff, but not cars
achievement("Satisfaction Max!", "Completely fill the happiness meter in Performance Mode", 10,
   trigger = in_mode(mode_performance) &&
             current_screen() == screen_driving &&
             satisfaction_needed() == 0 &&
             byte(0x38f6) == 1
)

leaderboard("Performance Mode", "Highest earnings in Performance Mode on Normal",
    start = current_mode() == mode_performance &&
            current_difficulty() == difficulty_normal &&
            current_screen() == screen_post_driving &&
            prev(current_screen()) == screen_driving,
    cancel = always_false(),
    submit = always_true(),
    value = current_money()
)
