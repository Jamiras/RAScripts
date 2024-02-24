// Bonanza Bros.
// #ID = 4123

// $17B0: 02 = Title Screen (Pereira's checkpoint)
function title_screen_pereira_s_checkpoint() => byte(0x0017B0)

// $1826: level complete (boolean)
//        (valid for both 1P & 2P mode)
function level_complete_boolean() => byte(0x001826)

// $6C4B: Timer: Milliseconds
function timer_milliseconds() => byte(0x006C4B)

// $C04E: difficulty
//        0 = easy
//        1 = normal
//        2 = hard
function difficulty() => byte(0x00C04E)

// $C054: Life
function life() => byte(0x00C054)

// $C05A: stage
//        0x01 = company
//        0x02 = millionaires mansion
//        0x03 = casino
//        0x04 = cutscene after beating casino
//        0x05 = mint
//        0x06 = underground gold bars
//        0x07 = jewelry store
//        0x08 = cutscene after beating jewelry store
//        0x09 = laboratory
//        0x0a = deluxe liner
//        0x0b = art museum
//        0x0c = cutscene after beating art museum
//        0x0d = pyramid
//        0x0e = the end (congratulations screen)
function stage() => byte(0x00C05A)

// $C078: Number of Continues remaining
function number_of_continues_remaining() => byte(0x00C078)

// $C0F4: score
function score() => byte(0x00C0F4)

achievement(
    title = "Rejecting Company", points = 5, type="progression",
    description = "Beat Company on any difficulty",
    id = 8522, badge = "297246", published = "5/25/2014 5:15:19 PM", modified = "8/15/2023 4:21:40 PM",
    trigger = stage() == 1 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "How to Steal a Million", points = 5, type="progression",
    description = "Beat Millionaire's Mansion on any difficulty",
    id = 8523, badge = "297247", published = "5/25/2014 5:15:22 PM", modified = "8/15/2023 4:21:41 PM",
    trigger = stage() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Casinot See me", points = 5, type="progression",
    description = "Beat Casino on any difficulty",
    id = 8524, badge = "297248", published = "5/25/2014 5:15:24 PM", modified = "8/15/2023 4:21:41 PM",
    trigger = stage() == 3 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Minted Treasure", points = 5, type="progression",
    description = "Beat Mint on any difficulty",
    id = 8525, badge = "297249", published = "5/25/2014 5:15:26 PM", modified = "8/15/2023 4:21:42 PM",
    trigger = stage() == 5 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Stealing My Weight in Gold", points = 5, type="progression",
    description = "Beat  Underground Gold Bars on any difficulty",
    id = 8526, badge = "297250", published = "5/25/2014 5:15:28 PM", modified = "8/15/2023 4:21:42 PM",
    trigger = stage() == 6 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Heist of AGES", points = 5, type="progression",
    description = "Beat Jewelry on any difficulty",
    id = 8527, badge = "297251", published = "5/25/2014 5:15:29 PM", modified = "8/15/2023 4:21:43 PM",
    trigger = stage() == 7 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Professor of Crime", points = 5, type="progression",
    description = "Beat Laboratory on any difficulty",
    id = 8528, badge = "297252", published = "5/25/2014 5:15:31 PM", modified = "8/15/2023 4:21:43 PM",
    trigger = stage() == 9 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Mutiny!", points = 5, type="progression",
    description = "Beat Deluxe Liner on any difficulty",
    id = 8529, badge = "297253", published = "5/25/2014 5:15:33 PM", modified = "8/15/2023 4:21:43 PM",
    trigger = stage() == 10 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Portrait of a Thief", points = 5, type="progression",
    description = "Beat Art Museum on any difficulty",
    id = 8530, badge = "297254", published = "5/25/2014 5:15:35 PM", modified = "8/15/2023 4:21:44 PM",
    trigger = stage() == 11 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Pyramid Plunder", points = 5, type="progression",
    description = "Beat Pyramid on any difficulty",
    id = 8531, badge = "297255", published = "5/25/2014 5:15:38 PM", modified = "8/15/2023 4:21:44 PM",
    trigger = stage() == 13 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Expert Thief", points = 10, type="win_condition",
    description = "Beat the game on any difficulty",
    id = 8532, badge = "297256", published = "5/25/2014 5:15:39 PM", modified = "8/15/2023 4:21:45 PM",
    trigger = prev(stage()) == 13 && stage() == 14
)

achievement(
    title = "Nice Score", points = 10,
    description = "Achieve a score of 50,000",
    id = 8548, badge = "297269", published = "5/25/2014 5:16:06 PM", modified = "8/15/2023 4:21:45 PM",
    trigger = score() >= 5
)

achievement(
    title = "Good Score", points = 10,
    description = "Achieve a score of 150,000",
    id = 8549, badge = "297270", published = "5/25/2014 5:16:09 PM", modified = "8/15/2023 4:21:45 PM",
    trigger = score() >= 21
)

achievement(
    title = "Awesome Score", points = 25,
    description = "Achieve a score of 300,000",
    id = 8550, badge = "297271", published = "5/25/2014 5:16:11 PM", modified = "8/15/2023 4:21:46 PM",
    trigger = score() >= 48
)

achievement(
    title = "Legendary Score", points = 25,
    description = "Achieve a score of 450,000",
    id = 8551, badge = "297272", published = "5/25/2014 5:16:12 PM", modified = "8/15/2023 4:21:46 PM",
    trigger = score() >= 69
)

achievement(
    title = "Rejecting Company (Hard)", points = 10,
    description = "Beat Company on hard difficulty",
    id = 8534, badge = "297257", published = "5/25/2014 5:15:43 PM", modified = "8/15/2023 4:21:47 PM",
    trigger = stage() == 1 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "How to Steal a Million (Hard)", points = 10,
    description = "Beat Millionaire's Mansion on hard difficulty",
    id = 8535, badge = "297258", published = "5/25/2014 5:15:44 PM", modified = "8/15/2023 4:21:47 PM",
    trigger = stage() == 2 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Casinot See Me (Hard)", points = 10,
    description = "Beat Casino on hard difficulty",
    id = 8536, badge = "297259", published = "5/25/2014 5:15:46 PM", modified = "8/15/2023 4:21:48 PM",
    trigger = stage() == 3 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Minted Treasure (Hard)", points = 10,
    description = "Beat Mint on hard difficulty",
    id = 8537, badge = "297260", published = "5/25/2014 5:15:48 PM", modified = "8/15/2023 4:21:48 PM",
    trigger = stage() == 5 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Stealing My Weight in Gold (Hard)", points = 10,
    description = "Beat Underground Gold Bars on hard difficulty",
    id = 8538, badge = "297261", published = "5/25/2014 5:15:49 PM", modified = "8/15/2023 4:21:49 PM",
    trigger = stage() == 6 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Heist of AGES (Hard)", points = 10,
    description = "Beat Jewelry Store on hard difficulty",
    id = 8539, badge = "297262", published = "5/25/2014 5:15:51 PM", modified = "8/15/2023 4:21:49 PM",
    trigger = stage() == 7 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Professor of Crime (Hard)", points = 10,
    description = "Beat Laboratory on hard difficulty",
    id = 8540, badge = "297263", published = "5/25/2014 5:15:53 PM", modified = "8/15/2023 4:21:49 PM",
    trigger = stage() == 9 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Mutiny! (Hard)", points = 10,
    description = "Beat Deluxe Liner on hard difficulty",
    id = 8541, badge = "297264", published = "5/25/2014 5:15:55 PM", modified = "8/15/2023 4:21:50 PM",
    trigger = stage() == 10 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Portrait of a Thief (Hard)", points = 10,
    description = "Beat Art Museum on hard difficulty",
    id = 8542, badge = "297265", published = "5/25/2014 5:15:57 PM", modified = "8/15/2023 4:21:50 PM",
    trigger = stage() == 11 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Pyramid Plunder (Hard)", points = 10,
    description = "Beat Pyramid on hard difficulty",
    id = 8543, badge = "297266", published = "5/25/2014 5:15:58 PM", modified = "8/15/2023 4:21:51 PM",
    trigger = stage() == 13 && difficulty() == 2 && prev(level_complete_boolean()) == 0 && level_complete_boolean() == 1
)

achievement(
    title = "Master Thief (Hard)", points = 25,
    description = "Beat the game on hard difficulty",
    id = 8544, badge = "297267", published = "5/25/2014 5:16:00 PM", modified = "8/15/2023 4:21:52 PM",
    trigger = prev(stage()) == 13 && stage() == 14 && difficulty() == 2
)

achievement(
    title = "Legendary Thief", points = 50,
    description = "Beat the game on hard difficulty without having lost a continue",
    id = 8546, badge = "297268", published = "5/25/2014 5:16:03 PM", modified = "9/18/2023 5:01:53 PM",
    trigger = once(title_screen_pereira_s_checkpoint() == 2) && never(number_of_continues_remaining() == 3) && stage() == 14 && difficulty() == 2
)

achievement(
    title = "Two Thief", points = 15,
    description = "Beat The game in 2 player",
    id = 8533, badge = "08469", published = "5/25/2014 5:15:41 PM", modified = "5/25/2014 5:16:45 PM",
    trigger = stage() == 14 && once(byte(0x00C076) == 3)
)

achievement(
    title = "Two Thief [hard]", points = 25,
    description = "Beat The game with 2 player with Hard difficulty",
    id = 8545, badge = "08481", published = "5/25/2014 5:16:01 PM", modified = "5/28/2020 5:52:56 AM",
    trigger = stage() == 14 && difficulty() == 2 && once(byte(0x00C076) == 3)
)

achievement(
    title = "Two Thief Legendary", points = 40,
    description = "Beat the game 2 player without lost continue and with hard difficulty",
    id = 8547, badge = "08484", published = "5/25/2014 5:16:04 PM", modified = "5/25/2014 5:17:06 PM",
    trigger = once(title_screen_pereira_s_checkpoint() == 2) && never(number_of_continues_remaining() == 2) && stage() == 14 && once(byte(0x00C076) ==
               3) && difficulty() == 2
)

leaderboard(
    id = 31984, title = "Best Time - Easy",
    description = "",
    start  = difficulty() == 0 && stage() == 1,
    cancel = life() == 0,
    submit = stage() == 14,
    value = measured(tally(0, timer_milliseconds() < prev(timer_milliseconds()))),
    format = "FRAMES"
)

leaderboard(
    id = 31985, title = "Best Time - Normal",
    description = "",
    start  = stage() == 1 && difficulty() == 1,
    cancel = life() == 0,
    submit = stage() == 14,
    value = measured(tally(0, timer_milliseconds() < prev(timer_milliseconds()))),
    format = "FRAMES"
)

leaderboard(
    id = 31986, title = "Best Time - Hard",
    description = "",
    start  = stage() == 1 && difficulty() == 2,
    cancel = life() == 0,
    submit = stage() == 14,
    value = measured(tally(0, timer_milliseconds() < prev(timer_milliseconds()))),
    format = "FRAMES"
)

function total_score() => bcd(word(0xc0f4)) * 10000 + bcd(word(0xc0f6))

difficulties = {
    0: "Easy",
    1: "Normal",
    2: "Hard",
}

stages = {
    1: "Stage 1",
    2: "Stage 2",
    3: "Stage 3",
    4: "Stage 4", // cutscene after stage 3
    5: "Stage 4",
    6: "Stage 5",
    7: "Stage 6",
    8: "Stage 7", // cutscene after stage 6
    9: "Stage 7",
    10: "Stage 8",
    11: "Stage 9",
    12: "Stage 10", // cutscene after stage 9
    13: "Stage 10",
    14: "Victorious",
}

rich_presence_conditional_display(number_of_continues_remaining() > 4, "Titles")
rich_presence_display("{0} ({1}) | {2} | {3} lives, {4} credits",
    rich_presence_lookup("Stage", stage(), stages),
    rich_presence_lookup("Difficulty", difficulty(), difficulties),
    rich_presence_value("Score", total_score(), format="SCORE"),
    rich_presence_value("Lives", life() - 1),
    rich_presence_value("Credits", number_of_continues_remaining())
)