// Where in the World is Carmen Sandiego
// #ID = 1315
// MD5: dfccfa0a4411bb0bfb29f777cac53858 (U)

function current_dossier() => byte(0x1FB0)

function is_demo() => byte(0xA117) == 1

function location1_text() => byte(0xA163)
function location2_text() => byte(0xA173)
function location3_text() => byte(0xA183)
text_found = 2
text_tracking = 3
text_unknown = 4

function location1_searched() => byte(0xA12D) == 0
function location2_searched() => byte(0xA12F) == 0
function location3_searched() => byte(0xA131) == 0

function current_day() => byte(0xA19E)
days = {
    0: "Monday",
    1: "Tuesday",
    2: "Wednesday",
    3: "Thursday",
    4: "Friday",
    5: "Saturday",
    6: "Sunday",
}

function current_location() => word(0xA5C2)
locations = { // 100 bytes each - Athens = 10003, Baghdad = 10103
    0x2713: "Athens",         // 0
    0x2777: "Baghdad",        // 1
    0x27DB: "Bamako",         // 2
    0x283F: "Bangkok",        // 3
    0x28A3: "Budapest",       // 4
    0x2907: "Buenos Aires",   // 5
    0x296B: "Cairo",          // 6
    0x29CF: "Colombo",        // 7
    0x2A33: "Istanbul",       // 8
    0x2A97: "Kathmandu",      // 9
    0x2AFB: "Kigali",         // 10
    0x2B5F: "Lima",           // 11
    0x2BC3: "London",         // 12
    0x2C27: "Mexico City",    // 13
    0x2C8B: "Montreal",       // 14
    0x2CEF: "Moroni",         // 15
    0x2D53: "Moscow",         // 16
    0x2DB7: "New Delhi",      // 17
    0x2E1B: "New York",       // 18
    0x2E7F: "Oslo",           // 19
    0x2EE3: "Paris",          // 20
    0x2F47: "Peking",         // 21
    0x2FAB: "Port Moresby",   // 22
    0x300F: "Reykjavik",      // 23
    0x3073: "Rio de Janeiro", // 24
    0x30D7: "Rome",           // 25
    0x313B: "San Marino",     // 26
    0x319F: "Singapore",      // 27
    0x3203: "Sydney",         // 28
    0x3267: "Tokyo",          // 29
}

// $A5C2             : determines flavor text
// $A5C8 = $A5C2 - 2 : determines text in lower left corner
// $A5D0 = $A5C2 - 3 
// $A5D2 = $A5C2 + 1

function current_mode() => byte(0xA5C6)
mode_login = 0
mode_searching = 1
mode_briefing = 2
mode_escaped = 3
mode_captured = 4
mode_summary = 5

function mission_started() => byte(0xA5D6) != 0

function warrant_for() => byte(0xA5D8)

function warrant_sex() => byte(0xA5E6)
sex_none = 0
sex_male = 1
sex_female = 2

function warrant_hobby() => byte(0xA5E7)
hobby_none = 0
hobby_tennis = 1
hobby_music = 2
hobby_mountain_climbing = 3
hobby_skydiving = 4
hobby_swimming = 5
hobby_croquet = 6

function warrant_hair() => byte(0xA5E8)
hair_none = 0
hair_brown = 1
hair_blond = 2
hair_red = 3
hair_black = 4

function warrant_feature() => byte(0xA5E9)
feature_none = 0
feature_limp = 1
feature_ring = 2
feature_tattoo = 3
feature_scar = 4
feature_jewelry = 5

function warrant_vehicle() => byte(0xA5EA)
vehicle_none = 0
vehicle_convertible = 1
vehicle_limo = 2
vehicle_race_car = 3
vehicle_motorcycle = 4

//  0|Carmen Sandiego |  F  | Tennis      | Brown    | Jewelry  | Convertible | Fond of Tacos
//  1|Merey LaRoc     |  F  | Mt Climbing | Brown    | Jewelry  | Limo        | Loves Spicy Foods
//  2|Dazzle Annie    |  F  | Tennis      | Blond    | Tattoo   | Limo        | Craves Shellfish
//  3|Lady Agatha     |  F  | Tennis      | Red      | Ring     | Convertible | Mexican Restaurants
//  4|Len Bulk        |  M  | Mt Climbing | Red      | Tattoo   | Convertible | Loves Seafood
//  5|Scar Graynolt   |  M  | Croquet     | Red      | Ring     | Limo        | Tall servent; loves tacos
//  6|Nick Brunch     |  M  | Mt Climbing | Black    | Ring     | Motorcycle  | Mexican food; crimefighter ring
//  7|Fast Eddie B.   |  M  | Croquet     | Black    | Jewelry  | Convertible | Mexican food; impecibly dressed
//  8|Ihor Ihorovich  |  M  | Croquet     | Blond    | Tattoo   | Limo        | Loves Lobsters; cartoons; marsupials
//  9|Katherine Drib  |  F  | Mt Climbing | Brown    | Tattoo   | Motorcycle  | Seafood chef; health/fitness
function suspect() => byte(0xA5EB)
suspect_carmen_sandiego = 0
suspect_merey_laroc = 1
suspect_dazzle_annie = 2
suspect_lady_agatha = 3
suspect_len_bulk = 4
suspect_scar_graynolt = 5
suspect_nick_brunch = 6
suspect_fast_eddie_b = 7
suspect_ihor_ihorovich = 8
suspect_katherine_drib = 9

function current_case() => byte(0xA64B) + 1
function current_rank() => byte(0xA64D)

function trigger_before_mission() => current_mode() == mode_briefing
function trigger_find_suspect() => location1_text() == text_found && word(0xA049) == 0x6C96 && byte(0xA125) == 3
function trigger_arrest_suspect() => current_mode() == mode_captured
function trigger_wrong_location() => location1_text() == text_unknown
function trigger_second_clue_in_location() => byte(0x0000) == 0

rich_presence_conditional_display(current_mode() == mode_login, "Titles")

rich_presence_conditional_display(is_demo() && current_mode() == mode_briefing, "Demo Briefing",
    rich_presence_lookup("Day", current_day(), days),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_conditional_display(is_demo(), "Demo, {0}: {1}",
    rich_presence_lookup("Day", current_day(), days),
    rich_presence_lookup("Location", current_location(), locations)
)

rich_presence_conditional_display(current_mode() == mode_briefing, "Case {0} Briefing",
    rich_presence_value("Case", current_case())
)

rich_presence_conditional_display(current_mode() == mode_summary, "Case {0} Debriefing",
    rich_presence_value("Case", current_case() - 1)
)

rich_presence_display("Case {0}, {1}: {2}",
    rich_presence_value("Case", current_case()),
    rich_presence_lookup("Day", current_day(), days),
    rich_presence_lookup("Location", current_location(), locations)
)

// === Complete Missions (70) ===
// 10 - no incorrect locations
// 20 - one clue per location
// 15 - correct warrant before leaving first city
// 10 - by end of Wednesday 
// 15 - by end of Thursday as Ace Detective

achievement(title = "Hot on the Trail", points = 10,
    description = "Find the suspect without visiting any incorrect locations",
    trigger = once(trigger_before_mission()) && never(is_demo()) &&
              trigger_find_suspect() &&
              never(trigger_wrong_location())
)

// $A12D, $A12F, and $A131 are 1 when arriving in a new area, and 0 after searching. If no locations have been searched, the sum will be 3.
// one location searched sums to 2, two locations searched sums to 1, and all three searched sums to 0.
// TODO: can you apprehend the suspect without searching multiple locations?
achievement(title = "Trust Your Intuition", points = 10,
    description = "Find the suspect using one clue at each location",
    trigger = once(trigger_before_mission()) && never(is_demo()) &&
              trigger_find_suspect() &&
              (always_true() ||                                           // dummy alt group
               (never(byte(0xA12D) + byte(0xA12F) + byte(0xA131) < 2) &&  // more than one clue used
                unless(location3_text() == 0)))                           // no text selected for location 3
)

// sum of the three bytes will be 3 when first visiting a city, 2 after the first interrogation, and 1 after the second
// have to allow 0 or the before mission trigger won't get set
// TODO: need to pause when starting the mission - the bytes aren't populated in the same frame
achievement(title = "Trust Your Intuition II", points = 25,
    description = "Find the suspect using one clue at each location as an Ace Detective",
    trigger = once(trigger_before_mission()) && never(is_demo()) &&
              trigger_find_suspect() && current_rank() == 4 &&
              (always_true() ||                                           // dummy alt group
               (never(byte(0xA12D) + byte(0xA12F) + byte(0xA131) < 2) &&  // more than one clue used
                unless(location3_text() == 0)))                           // no text selected for location 3
)

// warrant_for ($A5D8) is 0xFF if no warrant has been chosen.
// the two alt clauses reset the start flag
// alt 1) dummy clause since other two should be paused when the achievemnt triggers
// alt 2) if the warrant changes after leaving the first city
// alt 3) if the player leaves the first city without a warrant
function in_first_city() => byte(0x9bb0) == 1
achievement(title = "I Knew It Was You All Along", points = 10,
            description = "Arrest the suspect with a warrant collected before leaving the first city",
            trigger = once(trigger_before_mission()) && never(is_demo()) &&
                      trigger_arrest_suspect() && 
                      (always_true() ||
                       (never(!in_first_city()) && unless(warrant_for() == prev(warrant_for())) ||
                       (never(!in_first_city()) && unless(warrant_for() != 255))))
)

achievement(title = "Rapid Recovery", points = 10,
    description = "Arrest the suspect before the end of Wednesday",
    trigger = trigger_arrest_suspect() && current_day() <= 2 && never(is_demo())
)

achievement(title = "Rapid Recovery II", points = 10,
    description = "Arrest the suspect before the end of Friday as an Ace Detective",
    trigger = trigger_arrest_suspect() && current_day() <= 4 && current_rank() == 4 && never(is_demo())
)

// === Promotions (55) ===
//  5 - first case
//  5 - five cases
// 10 - twelve cases
// 15 - twenty cases
// 20 - thirty cases

function achievement_promotion(title, missions_completed, points)
{
    achievement(title = title, points = points,
                description = "Be promoted to " + title,
                trigger = current_case() == missions_completed + 1 && never(is_demo()) &&
                          current_mode() == mode_summary &&
                          current_rank() > prev(current_rank()))
}

achievement_promotion("Sleuth", 1, 5)          // new game
achievement_promotion("Private Eye", 5, 5)     // kbB
achievement_promotion("Investigator", 12, 10)  // vbb
achievement_promotion("Ace Detective", 20, 10) // HbN
 
achievement(title = "Retirement", points = 25, // WbL
            description = "Complete your final mission",
            trigger = trigger_arrest_suspect() && never(is_demo()) &&
                      current_case() == 30
)

// === Other (15) ===
//  5 - view all dossiers
// 10 - warrant with only two features

achievement(title = "Getting to Know Your Suspects", points = 5,
            description = "View all of the dossiers",
            trigger = once(current_dossier() == suspect_carmen_sandiego) &&
                      once(current_dossier() == suspect_merey_laroc) &&
                      once(current_dossier() == suspect_dazzle_annie) &&
                      once(current_dossier() == suspect_lady_agatha) &&
                      once(current_dossier() == suspect_len_bulk) &&
                      once(current_dossier() == suspect_scar_graynolt) &&
                      once(current_dossier() == suspect_nick_brunch) &&
                      once(current_dossier() == suspect_fast_eddie_b) &&
                      once(current_dossier() == suspect_ihor_ihorovich) &&
                      once(current_dossier() == suspect_katherine_drib) &&
                      unless(byte(0x1FBF) != 3) &&    // not in data
                      unless(word(0x1FA9) != 0xA6B9)  // not viewing dossier
)

// some examples (many more - if you ignore gender, the number of valid pairs is much higher)
// female, blond hair => Dazzle Annie (2)
// female, red hair => Lady Agatha (3)
// male, blond hair => Ihor Ihorovich (8)
// female, ring => Lady Agatha (3)
// male, jewelry => Fast Eddie B. (7)
// female, motorcycle => Katherine Drib (9)
// male, motorcycle => Nick Brunch (6)
achievement(title = "The One Armed, One Legged Man", points = 5,
            description = "Get a warrant with only two pieces of information",
            trigger = never(warrant_for() == prev(warrant_for())) && // ignore unless warrant is changing
                      warrant_for() != 255 && current_mode() == mode_searching &&
                      repeated(3, once(warrant_sex() == sex_none) ||
                                  once(warrant_hobby() == hobby_none) ||
                                  once(warrant_hair() == hair_none) ||
                                  once(warrant_feature() == feature_none) ||
                                  once(warrant_vehicle() == vehicle_none))
)

// --- 0 cases solved, Rank: ???            - 5 cities (4 travels)
// dbt	1 case solved, Rank: Sleuth
// fbs	2 cases solved, Rank: Sleuth
// gbr	3 cases solved, Rank: Sleuth
// kbB	4 cases solved, Rank: Sleuth         - 6 cities (5 travels)
// mbz	5 cases solved, Rank: Private Eye
// nbx	6 cases solved, Rank: Private Eye
// pbw	7 cases solved, Rank: Private Eye
// rbg	8 cases solved, Rank: Private Eye
// sbf	9 cases solved, Rank: Private Eye
// tbd	10 cases solved, Rank: Private Eye
// vbb	11 cases solved, Rank: Private Eye   - 7 cities (6 travels)
// wbp	12 cases solved, Rank: Investigator  
// xbn	13 cases solved, Rank: Investigator
// zbm	14 cases solved, Rank: Investigator
// Bbk	15 cases solved, Rank: Investigator
// DbS	16 cases solved, Rank: Investigator
// FbR	17 cases solved, Rank: Investigator
// GbP	18 cases solved, Rank: Investigator
// HbN	19 cases solved, Rank: Investigator  - 8 cities (7 travels)
// JbZ	20 cases solved, Rank: Ace Detective - 9 cities (8 travels)
// KbX	21 cases solved, Rank: Ace Detective
// LbW	22 cases solved, Rank: Ace Detective
// MbT	23 cases solved, Rank: Ace Detective
// NbH	24 cases solved, Rank: Ace Detective
// PbG	25 cases solved, Rank: Ace Detective
// RbF	26 cases solved, Rank: Ace Detective
// SbD	27 cases solved, Rank: Ace Detective
// TbM	28 cases solved, Rank: Ace Detective - 9 cities (8 travels)
// WbL	Final level                          - 9 cities (8 travels)

