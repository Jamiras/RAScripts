// Super Mario Kart
// #ID = 232
// md5: 7f25ce5a283d902694c52fb1152fa61a (U)

function current_mode() => byte(0x00002C)
mode_gp = 0
mode_match = 2
mode_time_trial = 4
mode_battle = 6

function trigger_gp_mode() => current_mode() == mode_gp

function current_difficulty() => byte(0x000030)
difficulty_50cc = 0
difficulty_100cc = 2
difficulty_150cc = 4

function current_screen() => byte(0x000036)
screen_in_game = 2
screen_menus = 4
screen_drivers = 6
screen_difficulty = 8
screen_standings = 10
screen_battle_mode = 14
screen_course_select = 22
screen_podium = 24

function trigger_single_player() => byte(0x00002E) == 2 // == 0 for two player

function trigger_race_finished() => byte(0x00010B) == 0x40

function trigger_not_demo_mode() => word(0x000E32) == 0

function current_position() => byte(0x001040)
position_first = 0
position_second = 2
position_third = 4
position_fourth = 6
position_fifth = 8
position_sixth = 10
position_seventh = 12
position_eighth = 14

function current_lap() => byte(0x0010C1)
lap_starting_marks = 0x7F
lap_1 = 0x80
lap_2 = 0x81
lap_3 = 0x82
lap_4 = 0x83
lap_5 = 0x84
lap_finished = 0x85

function current_character() => byte(0x001012)
character_mario = 0
character_luigi = 2
character_bowser = 4
character_peach = 6
character_donkey_kong_jr = 8
character_koopa_troopa = 10
character_toad = 12
character_yoshi = 14

function trigger_win_race() => trigger_race_finished() && current_lap() == lap_finished &&
                               trigger_gp_mode() && trigger_single_player()

// 4745: got it coming in from 5th to 2nd
// 4353: after winning the 50cc, the game resets, and the achievement triggers...
// 3590: I started the final lap from 5th place, and finish only 2nd, but the achievement triggered.
// 2580: Poped when losing in last place. 
// 2176: triggered after pressing B on the title screen after beating 50CC Mushroom cup
// 1163: Triggered at main screen after I win a the mushroom cup 50cc.
achievement(
    title = "Epic Comeback", description = "On the final lap, start from 5th place or worse and finish in 1st", points = 10,
    id = 4172, badge = "04825", published = "12/24/2013 7:42:59 AM", modified = "12/14/2015 12:53:38 AM",
    trigger = current_character() != 85 &&      // ?
              trigger_win_race() &&
              current_screen() == screen_in_game &&
              current_difficulty() <= difficulty_150cc && 
              current_position() == position_first && 
              once(current_position() >= position_fifth) && 
              never(current_lap() < lap_5) &&
              never(current_lap() > lap_finished) &&
              never(current_lap() < prev(current_lap()))
)

// 10602: <br/>MD5: 7f25ce5a283d902694c52fb1152fa61a
achievement(
    title = "Mushroom Cup 50cc Gold", description = "Win the Mushroom Cup on 50cc or higher", points = 5,
    id = 4192, badge = "04790", published = "12/25/2013 6:07:46 PM", modified = "2/18/2016 10:24:30 PM",
    trigger = current_difficulty() <= 4 && 
              current_screen() != screen_in_game && 
              trigger_not_demo_mode() && 
              trigger_single_player() && 
              current_character() != 85 &&
              ((bit2(0x0207F2) == 1 && bit3(0x0207F2) == 0) ||
               (bit0(0x0207F2) == 1 && bit1(0x0207F2) == 0) ||
               (bit4(0x0207F2) == 1 && bit5(0x0207F2) == 0))
)

// 10603: <br/>MD5: 7f25ce5a283d902694c52fb1152fa61a
achievement(
    title = "Flower Cup 50cc Gold", description = "Win the Flower Cup on 50cc or higher", points = 5,
    id = 4195, badge = "04793", published = "12/25/2013 6:07:50 PM", modified = "2/16/2014 12:08:21 AM",
    trigger = current_difficulty() <= 4 && 
              current_screen() != screen_in_game && 
              trigger_not_demo_mode() && 
              trigger_single_player() && 
              current_character() != 85 &&
              ((bit2(0x0207F3) == 1 && bit3(0x0207F3) == 0) ||
               (bit0(0x0207F3) == 1 && bit1(0x0207F3) == 0) ||
               (bit4(0x0207F3) == 1 && bit5(0x0207F3) == 0))
)

function time_trial_leaderboard(id, name, course_id)
{
    leaderboard(name, "Time Trial, " + name + ". 5 laps!",
        start = word(0x000124) == course_id && byte(0x000147) == 0xFE && byte(0x00014E) == 0x10,
        cancel = byte(0x000036) == 0x02 || word(0x000E32) == 0xFFFF || word(0x000124) != 7 || word(0x000120) != 0xFFFF,
        submit = byte(0x000144) == 2,
        value = measured(bcd(byte(0x000F4E)) * 6000 + bcd(byte(0x000F4C)) * 100 + bcd(byte(0x000F4B)),
                         when = byte(0x000144) == 2) ||
                measured(bcd(byte(0x000104)) * 6000 + bcd(byte(0x000102)) * 100 + bcd(byte(0x000101)),
                         when = byte(0x000144) != 2)
    )
}

time_trial_leaderboard(19, "Mario Circuit 1", 7)