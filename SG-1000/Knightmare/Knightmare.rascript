// ~Unlicensed~ Knightmare | Mo Yu Chuanqi
// #ID = 14030

// $2000: Stage
function current_state() => byte(0x002000)
state_title = 1
state_demo = 2
state_starting = 3
state_stage_card = 4
state_in_level = 5
state_game_over = 7
state_victory = 9

function not_in_demo() => never(current_state() == state_demo)
function without_dying() => never(current_state() == state_stage_card)

// $2056: [24-bit] Score
function current_score() => bcd(tbyte(0x002056))
function without_scoring() => never(word(0x002056) != prev(word(0x002056)))

// $2061: Stage Number (1-NN - does not loop)
function current_stage() => bcd(byte(0x002061))

// $2062: Stage ID (0-7 - loops)
function stage_id() => byte(0x002062)

// $2091: Y Pos (Global)
function y_pos() => byte(0x002091)

// $23B0: Boss State
function boss_state() => byte(0x0023B0)

// $23D1: Boss HP
function boss_hp() => byte(0x0023D1)

achievement(
    title = "Stage 1", description = "Clear Stage 1", points = 10,
    id = 74418, badge = "79725", published = "3/27/2019 6:07:01 AM", modified = "7/15/2019 3:35:12 AM",
    trigger = not_in_demo() && never(stage_id() != 0) && boss_state() == 7
)

achievement(
    title = "Stage 2", description = "Clear Stage 2", points = 10,
    id = 74419, badge = "79726", published = "3/27/2019 6:07:06 AM", modified = "9/26/2019 5:18:01 AM",
    trigger = not_in_demo() && never(stage_id() != 1) && boss_state() == 7
)

achievement(
    title = "Stage 3", description = "Clear Stage 3", points = 10,
    id = 74420, badge = "79729", published = "3/27/2019 6:07:11 AM", modified = "7/15/2019 3:35:20 AM",
    trigger = not_in_demo() && never(stage_id() != 2) && boss_state() == 7
)

achievement(
    title = "Stage 4", description = "Clear Stage 4", points = 10,
    id = 74421, badge = "79730", published = "3/27/2019 6:07:36 AM", modified = "7/15/2019 3:35:24 AM",
    trigger = not_in_demo() && never(stage_id() != 3) && boss_state() == 7
)

achievement(
    title = "Stage 5", description = "Clear Stage 5", points = 10,
    id = 74422, badge = "79731", published = "3/27/2019 6:07:48 AM", modified = "7/15/2019 3:35:28 AM",
    trigger = not_in_demo() && never(stage_id() != 4) && boss_state() == 7
)

achievement(
    title = "Stage 6", description = "Clear Stage 6", points = 10,
    id = 74423, badge = "79732", published = "3/27/2019 6:07:52 AM", modified = "7/15/2019 3:35:32 AM",
    trigger = not_in_demo() && never(stage_id() != 5) && boss_state() == 7
)

achievement(
    title = "Stage 7", description = "Clear Stage 7", points = 10,
    id = 74424, badge = "79733", published = "3/27/2019 6:07:58 AM", modified = "7/15/2019 3:35:36 AM",
    trigger = not_in_demo() && never(stage_id() != 6) && boss_state() == 7
)

achievement(
    title = "Stage 8", description = "Clear Stage 8", points = 10,
    id = 74425, badge = "79734", published = "3/27/2019 6:08:03 AM", modified = "7/15/2019 3:35:41 AM",
    trigger = not_in_demo() && never(stage_id() != 7) && boss_state() == 7
)


achievement(
    title = "Avoidant Knight I", description = "Reach the boss in Stage 1 without getting any points", points = 25,
    id = 74426, badge = "79727", published = "3/27/2019 6:08:43 AM", modified = "9/29/2019 5:17:01 AM",
    trigger = not_in_demo() && never(current_score() != 0) && never(byte(0x002058) != 0) && 
              never(stage_id() != 0) && once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight II", description = "Reach the boss in Stage 2 without getting any points", points = 10,
    id = 74430, badge = "79727", published = "3/27/2019 6:09:12 AM", modified = "3/30/2019 1:21:48 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 1) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight III", description = "Reach the boss in Stage 3 without getting any points", points = 10,
    id = 74434, badge = "79727", published = "3/27/2019 6:09:32 AM", modified = "3/30/2019 1:22:06 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 2) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight IV", description = "Reach the boss in Stage 4 without getting any points", points = 10,
    id = 74438, badge = "79727", published = "3/27/2019 6:09:52 AM", modified = "3/30/2019 1:22:27 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 3) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight V", description = "Reach the boss in Stage 5 without getting any points", points = 10,
    id = 74442, badge = "79727", published = "3/27/2019 6:10:15 AM", modified = "3/30/2019 1:22:57 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 4) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight VI", description = "Reach the boss in Stage 6 without getting any points", points = 10,
    id = 74446, badge = "79727", published = "3/27/2019 6:10:35 AM", modified = "3/30/2019 1:23:18 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 5) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight VII", description = "Reach the boss in Stage 7 without getting any points", points = 25,
    id = 74450, badge = "79727", published = "3/27/2019 6:11:05 AM", modified = "7/15/2019 3:34:08 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 6) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Avoidant Knight VIII", description = "Reach the boss in Stage 8 without getting any points", points = 10,
    id = 74455, badge = "79727", published = "3/27/2019 6:11:42 AM", modified = "3/30/2019 1:24:24 AM",
    trigger = not_in_demo() && without_scoring() && never(stage_id() != 7) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight I", description = "Reach the boss in Stage 1 without dying", points = 10,
    id = 74427, badge = "79728", published = "3/27/2019 6:08:57 AM", modified = "3/30/2019 1:21:33 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 0) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight II", description = "Reach the boss in Stage 2 without dying", points = 10,
    id = 74431, badge = "79728", published = "3/27/2019 6:09:17 AM", modified = "9/26/2019 5:18:02 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 1) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight III", description = "Reach the boss in Stage 3 without dying", points = 10,
    id = 74435, badge = "79728", published = "3/27/2019 6:09:37 AM", modified = "3/30/2019 1:22:11 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 2) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight IV", description = "Reach the boss in Stage 4 without dying", points = 10,
    id = 74439, badge = "79728", published = "3/27/2019 6:09:58 AM", modified = "3/30/2019 1:22:33 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 3) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight V", description = "Reach the boss in Stage 5 without dying", points = 10,
    id = 74443, badge = "79728", published = "3/27/2019 6:10:20 AM", modified = "3/30/2019 1:23:03 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 4) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight VI", description = "Reach the boss in Stage 6 without dying", points = 10,
    id = 74447, badge = "79728", published = "3/27/2019 6:10:40 AM", modified = "3/30/2019 1:23:22 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 5) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight VII", description = "Reach the boss in Stage 7 without dying", points = 10,
    id = 74451, badge = "79728", published = "3/27/2019 6:11:10 AM", modified = "3/30/2019 1:23:42 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 6) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Not a DeathKnight VIII", description = "Reach the boss in Stage 8 without dying", points = 10,
    id = 74456, badge = "79728", published = "3/27/2019 6:11:47 AM", modified = "3/30/2019 1:24:29 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 7) && 
              once(y_pos() == 0) && y_pos() == 201
)

achievement(
    title = "Patient Knight I", description = "Beat the boss in Stage 1 without attacking", points = 10,
    id = 74428, badge = "79725", published = "3/27/2019 6:09:02 AM", modified = "9/26/2019 5:18:02 AM",
    trigger = not_in_demo() && never(stage_id() != 0) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 14) &&
              repeated(14, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 4 && byte(0x0023C0) == 4
)

achievement(
    title = "Patient Knight II", description = "Beat the boss in Stage 2 without attacking", points = 10,
    id = 74432, badge = "79726", published = "3/27/2019 6:09:22 AM", modified = "7/15/2019 3:32:50 AM",
    trigger = not_in_demo() && never(stage_id() != 1) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 13) && repeated(13, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 5
)

achievement(
    title = "Patient Knight III", description = "Beat the boss in Stage 3 without attacking", points = 10,
    id = 74436, badge = "79729", published = "3/27/2019 6:09:42 AM", modified = "3/30/2019 1:22:16 AM",
    trigger = not_in_demo() && never(stage_id() != 2) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 28) && repeated(27, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 5
)

achievement(
    title = "Patient Knight IV", description = "Beat the boss in Stage 4 without attacking", points = 25,
    id = 74440, badge = "79730", published = "3/27/2019 6:10:05 AM", modified = "7/15/2019 3:33:12 AM",
    trigger = not_in_demo() && never(stage_id() != 3) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 28) &&
              repeated(27, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 5
)

achievement(
    title = "Patient Knight V", description = "Beat the boss in Stage 5 without attacking", points = 10,
    id = 74444, badge = "79731", published = "3/27/2019 6:10:25 AM", modified = "3/30/2019 1:23:08 AM",
    trigger = not_in_demo() && never(stage_id() != 4) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 28) &&
              repeated(27, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 5
)

achievement(
    title = "Patient Knight VI", description = "Beat the boss in Stage 6 without attacking", points = 25,
    id = 74448, badge = "79732", published = "3/27/2019 6:10:50 AM", modified = "7/15/2019 3:34:03 AM",
    trigger = not_in_demo() && never(stage_id() != 5) && never(boss_hp() != 0) && 
              once(y_pos() == 216) && once(byte(0x0023B2) == 28) &&
              repeated(27, byte(0x0023B2) < prev(byte(0x0023B2))) && 
              boss_state() == 5
)

achievement(
    title = "Patient Knight VII", description = "Avoid the boss in Stage 7 without attacking for 2 minutes", points = 10,
    id = 74453, badge = "79733", published = "3/27/2019 6:11:30 AM", modified = "3/30/2019 1:23:53 AM",
    trigger = not_in_demo() && never(stage_id() != 6) && never(boss_hp() != 0) && 
              never(y_pos() != 216) && repeated(7200, always_true())
)

achievement(
    title = "Patient Knight VIII", description = "Avoid the boss in Stage 8 without attacking for 2 minutes", points = 10,
    id = 74458, badge = "79734", published = "3/27/2019 6:11:59 AM", modified = "3/30/2019 1:24:38 AM",
    trigger = not_in_demo() && never(stage_id() != 7) && never(boss_hp() != 0) && 
              never(y_pos() != 216) && repeated(7200, always_true())
)

achievement(
    title = "Witches get Stitches", description = "Defeat the boss in Stage 1 without dying", points = 10,
    id = 74429, badge = "79725", published = "3/27/2019 6:09:07 AM", modified = "9/26/2019 5:18:02 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 0) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(4, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 20 && boss_state() == 4 && byte(0x0023C0) == 4
)

achievement(
    title = "The Ghost is Toast", description = "Defeat the boss in Stage 2 without dying", points = 10,
    id = 74433, badge = "79726", published = "3/27/2019 6:09:27 AM", modified = "9/26/2019 5:18:02 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 1) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(8, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 30 && boss_state() == 5
)

achievement(
    title = "Brat the Bat", description = "Defeat the boss in Stage 3 without dying", points = 10,
    id = 74437, badge = "79729", published = "3/27/2019 6:09:46 AM", modified = "3/30/2019 1:22:22 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 2) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(8, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 30 && boss_state() == 5
)

achievement(
    title = "Giving an Eyeful", description = "Defeat the boss in Stage 4 without dying", points = 10,
    id = 74441, badge = "79730", published = "3/27/2019 6:10:10 AM", modified = "3/30/2019 1:22:52 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 3) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(16, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 46 && boss_state() == 5
)

achievement(
    title = "Axed Knight", description = "Defeat the boss in Stage 5 without dying", points = 10,
    id = 74445, badge = "79731", published = "3/27/2019 6:10:30 AM", modified = "3/30/2019 1:23:14 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 4) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(8, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 46 && boss_state() == 5
)

achievement(
    title = "Scrawny Oni", description = "Defeat the boss in Stage 6 without dying", points = 10,
    id = 74449, badge = "79732", published = "3/27/2019 6:10:56 AM", modified = "3/30/2019 1:23:32 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 5) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(8, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 46 && boss_state() == 5
)

achievement(
    title = "Fifty is Nifty", description = "Defeat 50 Blue Knights before defeating the Grey Knight in Stage 7", points = 25,
    id = 74452, badge = "79735", published = "3/27/2019 6:11:24 AM", modified = "7/15/2019 3:34:12 AM",
    trigger = not_in_demo() && never(stage_id() != 6) && never(y_pos() != 216) && 
              repeated(50, byte(0x002057) > prev(byte(0x002057)))
)

achievement(
    title = "Mini Me the Enemy", description = "Defeat the boss in Stage 7 without dying", points = 10,
    id = 74454, badge = "79733", published = "3/27/2019 6:11:37 AM", modified = "3/30/2019 1:24:15 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 6) && 
              y_pos() == 216 && once(boss_hp() == 0) && repeated(10, boss_hp() > prev(boss_hp())) && 
              boss_hp() == 60 && boss_state() == 5
)

achievement(
    title = "Dese Eyes Despise De Sais", description = "Defeat the boss in Stage 8 without dying", points = 25,
    id = 74457, badge = "79734", published = "3/27/2019 6:11:53 AM", modified = "7/15/2019 3:34:28 AM",
    trigger = not_in_demo() && without_dying() && never(stage_id() != 7) && 
              y_pos() == 216 && once(y_pos() == 210) && boss_state() == 6
)

rich_presence_conditional_display(byte(0x2000) < 4, "Titles")

rich_presence_display("{0} points, stage {1}", 
    rich_presence_value("Score", current_score()),
    rich_presence_value("Stage", current_stage())
)

leaderboard("High Score", "Highest score at game over",
    start = current_state() == state_game_over,
    submit = current_state() == state_game_over,
    cancel = always_false(),
    value = current_score()
)
