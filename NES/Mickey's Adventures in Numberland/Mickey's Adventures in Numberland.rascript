// Mickey's Adventures in Numberland
// #ID = 1834
// MD5: ab9bb7f5e79ef096311110d0178de36c

function current_screen() => byte(0x0205)
screen_brand = 0
screen_intro = 1
screen_title = 2
screen_difficulty = 3
screen_map = 4
screen_level_intro = 5
screen_level = 6
screen_deliver_tiles = 7
screen_continue = 8
screen_puzzle = 9
screen_donald_face = 10
screen_ending = 11
screen_score = 15
screen_credits = 16

function current_difficulty() => byte(0x0216)
difficulty_normal = 0
difficulty_advanced = 1
difficulty_super_advanced = 2

difficulties = {
    difficulty_normal: "Normal",
    difficulty_advanced: "Advanced",
    difficulty_super_advanced: "Super Advanced"
}

function current_location() => byte(0x0213)
location_number_city = 0
location_number_factory = 1
location_space_center = 2
location_number_museum = 3
location_petes_hideout = 4 //?

locations = {
    location_number_city: "Numberland City",
    location_number_factory: "the Numberland Factory",
    location_space_center: "the Space Center",
    location_number_museum: "the Number Museum",
    location_petes_hideout: "Pete's Hideout"
}

function invincibility_timer() => byte(0x044F)

function current_gumballs() => byte(0x0674)
function current_hearts() => byte(0x0675)
function current_stars() => byte(0x0676)
function target_number() => byte(0x0678)

function current_state() => byte(0x0440)
state_normal = 0
state_dusting_off = 1
state_elevator = 3
state_tripped = 4
state_sliding = 6
state_crawling = 7
state_complete_level = 8
state_skipping_level = 9
state_fail_level = 14
state_leave_without_tile = 15
state_right_number = 16
state_blowing_bubble = 17
state_wrong_number = 18

function trigger_right_number() => current_state() == state_right_number
function trigger_wrong_number() => current_state() == state_wrong_number
function trigger_fail_level() => current_state() == state_fail_level
function trigger_in_demo() => byte(0x020D) == 0

function trigger_start_level() => never(current_screen() == screen_map) &&
                                 (once(current_screen() == screen_level_intro) || once(current_screen() == screen_donald_face)) // donald face if forget tile
function trigger_in_level() => current_screen() == screen_level && !trigger_in_demo()
function trigger_skip_level() => current_state() == state_skipping_level // press select
function trigger_complete_level() => current_state() == state_complete_level && once(trigger_right_number()) && 
                                     never(trigger_skip_level()) && never(current_screen() != screen_level)
function trigger_score_level() => current_screen() == screen_score && once(current_state() == state_complete_level) && never(trigger_skip_level())
function trigger_damage_taken() => invincibility_timer() == 0x80 // actually starts at 0x8B, can't check for non-zero because it's -1 between levels
function trigger_complete_puzzle() => byte(0x055E) == 1

rich_presence_conditional_display(current_screen() < screen_map, "Titles")

rich_presence_conditional_display(current_screen() == screen_level && trigger_in_demo(), "Watching Mickey look for the number {0} in {1}",
    rich_presence_value("Number", target_number()),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_conditional_display(current_screen() == screen_map, "Mickey is looking for the missing numbers on {0}",
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

rich_presence_display("Mickey is looking for the number {0} in {1} on {2}",
    rich_presence_value("Number", target_number()),
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_lookup("Difficulty", current_difficulty(), difficulties)
)

achievement(
    title = "Gum Collector", points = 3,
    description = "Complete a level with 9 gumballs",
    trigger = trigger_start_level() && trigger_score_level() && current_gumballs() >= 9
)

achievement(
    title = "Agile Mouse", points = 5,
    description = "Find the magic number and complete a level without being hit (advanced or super advanced)",
    trigger = trigger_start_level() && trigger_complete_level() &&
              never(trigger_damage_taken()) && current_difficulty() >= difficulty_advanced
)

achievement(
    title = "Careful Counter", points = 4,
    description = "Find the magic number and complete a level without touching an incorrect number",
    trigger = trigger_start_level() && trigger_complete_level() && never(trigger_wrong_number())
)

achievement(
    title = "Very Careful Counter", points = 5,
    description = "Find the magic number and complete a level without touching an incorrect number (advanced or super advanced)",
    trigger = trigger_start_level() && trigger_complete_level() && never(trigger_wrong_number()) && current_difficulty() >= difficulty_advanced
)

achievement(
    title = "Stargazer", points = 3,
    description = "Collect two or more stars in a single level (advanced or super advanced)",
    trigger = trigger_start_level() && trigger_score_level() && current_stars() >= 2 && current_difficulty() >= difficulty_advanced
)

achievement(
    title = "Super Star", points = 4,
    description = "Collect three or more stars in a single level (advanced or super advanced)",
    trigger = trigger_start_level() && trigger_score_level() && current_stars() >= 3 && current_difficulty() >= difficulty_advanced
)

achievement(
    title = "All-Star", points = 5,
    description = "Collect four or more stars in a single level (advanced or super advanced)",
    trigger = trigger_start_level() && trigger_score_level() && current_stars() >= 4 && current_difficulty() >= difficulty_advanced
)

// stars aren't counted across levels, and if you fail a level, you can recollect the stars in it.
//achievement(
//    title = "All-Star", points = 20,
//    description = "Collect at least twenty stars in a single playthrough (advanced or super advanced)",
//    trigger = once(current_stars() == 0) && repeated(20, current_stars() != prev(current_stars())) &&
//              never(current_screen() < 4) && current_screen() == screen_ending && 
//              current_difficulty() >= difficulty_advanced
//)

achievement(
    title = "Math is Easy", points = 2,
    description = "Complete a number puzzle",
    trigger = current_screen() == screen_puzzle && trigger_complete_puzzle()
)

achievement(
    title = "Rail Grinder", points = 2,
    description = "Slide down a banister in the city stage",
    trigger = trigger_in_level() && current_state() == state_sliding && current_location() == location_number_city
)

achievement(
    title = "All Heart", points = 5,
    description = "Have five hearts", // advanced only
    trigger = trigger_in_level() && current_hearts() == 5 && current_difficulty() == difficulty_super_advanced
)

//achievement(
//    title = "Bad Beaker", points = 5,
//    description = "Blast the beaker in the Space Center",
//    trigger = trigger_in_level() && byte(0x0000) == 0 && current_location() == location_space_center
//)

function zone_achievement(zone_name, points, location)
{
    times_completed = byte(0x021B + location)
    achievement(
        title = zone_name, points = points,
        description = "Complete both levels in " + locations[location] + " (no skipping levels)",
        trigger = current_location() == location &&
                  once(times_completed == 0) && times_completed == 2 &&
                  (current_difficulty() >= difficulty_advanced ||   // can't skip in advanced or super-advanced, allow restart via select
                   never(trigger_skip_level()))
    )
}

zone_achievement("The City", 3, location_number_city)
zone_achievement("The Number Factory", 3, location_number_factory)
zone_achievement("The Space Center", 3, location_space_center)
zone_achievement("The Museum", 3, location_number_museum)
zone_achievement("Bad Pete's Hideout", 5, location_petes_hideout)

function trigger_complete_game() => once(current_screen() == screen_ending) && current_screen() == screen_credits && 
                                    never(current_screen() < 4)

achievement(
    title = "Way to Go!", points = 10,
    description = "Return all the number molds on super advanced difficulty",
    trigger = trigger_complete_game() && current_difficulty() == difficulty_super_advanced
)

