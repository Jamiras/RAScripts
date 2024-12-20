// Nante Tantei Idol: The Jigsaw Puzzle
// #ID = 9241

// $06144d: 00 - in puzzle
//          02 - selecting puzzle
//          04 - clear
//          05 - give up
function game_state() => byte(0x06144d)
function puzzle_complete() => byte(0x06144d) == 4

// $0614A1: 01 = Had computer place pieces
function computer_placed_pieces() => byte(0x0614A1) == 1

// $0614E0: This tells what puzzle is selected after selecting it. Starts with the Anime puzzles and continues to the idols
function selected_puzzle() => byte(0x0614E0)

// $06150C: 01 = In Time Attack mode
//          00 = Endless
//          02 - Collection
//          03 - Save/Load
//          04 - Options
function mode() => byte(0x06150C)
modes = {
    0: "Endless",
    1: "Time Attack",
    2: "Viewing Collection",
    3: "Loading",
    4: "Changing Options",
}

function solving_puzzle() => byte(0x61548) == 1

// $1FC124: This value tell us how many piece the puzzle is
//          16 (4x4)
//          36 (6x6)
//          64 (8x8)
//          100 (10x10)
function puzzle_size() => byte(0x1FC124)

size_4x4 = 16
size_6x6 = 36
size_8x8 = 64
size_10x10 = 100

sizes = {
    size_4x4: "4x4",
    size_6x6: "6x6",
    size_8x8: "8x8",
    size_10x10: "10x10",
}

rich_presence_conditional_display(solving_puzzle() && puzzle_size() != 0 && selected_puzzle() < 50, "Solving [{0} - {1}] Anime No.{2}",
    rich_presence_lookup("Mode", mode(), modes),
    rich_presence_lookup("Size", puzzle_size(), sizes),
    rich_presence_value("Number", selected_puzzle() + 1)
)

rich_presence_conditional_display(solving_puzzle() && puzzle_size() != 0, "Solving [{0} - {1}] Idol No.{2}",
    rich_presence_lookup("Mode", mode(), modes),
    rich_presence_lookup("Size", puzzle_size(), sizes),
    rich_presence_value("Number", selected_puzzle() - 49)
)

rich_presence_conditional_display(game_state() == 2, "Selecting puzzle")

rich_presence_display("Titles")

achievement(
    title = "[Time Attack] Anime No.01-05 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.01 through 05 in Time Attack",
    id = 89012, badge = "96453", published = "11/24/2019 3:05:06 AM", modified = "11/24/2019 3:05:06 AM",
    trigger = byte(0x174208) == 2 && byte(0x17420A) == 2 && byte(0x17420C) == 2 && byte(0x17420E) == 2 &&
              byte(0x174210) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174208)) == 1) ||
               (prev(byte(0x17420A)) == 1) ||
               (prev(byte(0x17420C)) == 1) ||
               (prev(byte(0x17420E)) == 1) ||
               (prev(byte(0x174210)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.06-10 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.06 through 10 in Time Attack",
    id = 89013, badge = "96454", published = "11/24/2019 3:05:09 AM", modified = "11/24/2019 3:05:09 AM",
    trigger = byte(0x174212) == 2 && byte(0x174214) == 2 && byte(0x174216) == 2 && byte(0x174218) == 2 &&
              byte(0x17421A) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174212)) == 1) ||
               (prev(byte(0x174214)) == 1) ||
               (prev(byte(0x174216)) == 1) ||
               (prev(byte(0x174218)) == 1) ||
               (prev(byte(0x17421A)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.11-15 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.11 through 15 in Time Attack",
    id = 89014, badge = "96455", published = "11/24/2019 3:05:13 AM", modified = "11/24/2019 3:05:13 AM",
    trigger = byte(0x17421C) == 2 && byte(0x17421E) == 2 && byte(0x174220) == 2 && byte(0x174222) == 2 &&
              byte(0x174224) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x17421C)) == 1) ||
               (prev(byte(0x17421E)) == 1) ||
               (prev(byte(0x174220)) == 1) ||
               (prev(byte(0x174222)) == 1) ||
               (prev(byte(0x174224)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.16-20 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.16 through 20 in Time Attack",
    id = 89015, badge = "96456", published = "11/24/2019 3:05:16 AM", modified = "11/24/2019 3:05:16 AM",
    trigger = byte(0x174226) == 2 && byte(0x174228) == 2 && byte(0x17422A) == 2 && byte(0x17422C) == 2 &&
              byte(0x17422E) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174226)) == 1) ||
               (prev(byte(0x174228)) == 1) ||
               (prev(byte(0x17422A)) == 1) ||
               (prev(byte(0x17422C)) == 1) ||
               (prev(byte(0x17422E)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.21-25 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.21 through 25 in Time Attack",
    id = 89016, badge = "96457", published = "11/24/2019 3:05:18 AM", modified = "11/24/2019 3:05:18 AM",
    trigger = byte(0x174230) == 2 && byte(0x174232) == 2 && byte(0x174234) == 2 && byte(0x174236) == 2 &&
              byte(0x174238) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174230)) == 1) ||
               (prev(byte(0x174232)) == 1) ||
               (prev(byte(0x174234)) == 1) ||
               (prev(byte(0x174236)) == 1) ||
               (prev(byte(0x174238)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.26-30 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.26 through 30 in Time Attack",
    id = 89017, badge = "96458", published = "11/24/2019 3:05:21 AM", modified = "11/24/2019 3:05:21 AM",
    trigger = byte(0x17423A) == 2 && byte(0x17423C) == 2 && byte(0x17423E) == 2 && byte(0x174240) == 2 &&
              byte(0x174242) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x17423A)) == 1) ||
               (prev(byte(0x17423C)) == 1) ||
               (prev(byte(0x17423E)) == 1) ||
               (prev(byte(0x174240)) == 1) ||
               (prev(byte(0x174242)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.31-35 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.31 through 35 in Time Attack",
    id = 89018, badge = "96459", published = "11/24/2019 3:05:24 AM", modified = "11/24/2019 3:05:24 AM",
    trigger = byte(0x174244) == 2 && byte(0x174246) == 2 && byte(0x174248) == 2 && byte(0x17424A) == 2 &&
              byte(0x17424C) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174244)) == 1) ||
               (prev(byte(0x174246)) == 1) ||
               (prev(byte(0x174248)) == 1) ||
               (prev(byte(0x17424A)) == 1) ||
               (prev(byte(0x17424C)) == 1))
)

achievement(
    title = "[Time Attack] Anime No.36-40 Clear", points = 5, type="progression",
    description = "Clear Anime Puzzles No.36 through 40 in Time Attack",
    id = 89019, badge = "96460", published = "11/24/2019 3:05:27 AM", modified = "11/24/2019 3:05:27 AM",
    trigger = byte(0x17424E) == 2 && byte(0x174250) == 2 && byte(0x174252) == 2 && byte(0x174254) == 2 &&
              byte(0x174256) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x17424E)) == 1) ||
               (prev(byte(0x174250)) == 1) ||
               (prev(byte(0x174252)) == 1) ||
               (prev(byte(0x174254)) == 1) ||
               (prev(byte(0x174256)) == 1))
)

achievement(
    title = "[Time Attack] Idol No.01-05 Clear", points = 5, type="progression",
    description = "Clear Idol Puzzles No.01 through 05 in Time Attack",
    id = 89020, badge = "96461", published = "11/24/2019 3:05:30 AM", modified = "11/24/2019 3:05:30 AM",
    trigger = byte(0x17426C) == 2 && byte(0x17426E) == 2 && byte(0x174270) == 2 && byte(0x174272) == 2 &&
              byte(0x174274) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x17426C)) == 1) ||
               (prev(byte(0x17426E)) == 1) ||
               (prev(byte(0x174270)) == 1) ||
               (prev(byte(0x174272)) == 1) ||
               (prev(byte(0x174274)) == 1))
)

achievement(
    title = "[Time Attack] Idol No.06-10 Clear", points = 5, type="progression",
    description = "Clear Idol Puzzles No.06 through 10 in Time Attack",
    id = 89021, badge = "96462", published = "11/24/2019 3:05:33 AM", modified = "11/24/2019 3:05:33 AM",
    trigger = byte(0x174276) == 2 && byte(0x174278) == 2 && byte(0x17427A) == 2 && byte(0x17427C) == 2 &&
              byte(0x17427E) == 2 && unless(mode() != 1) &&
              ((prev(byte(0x174276)) == 1) ||
               (prev(byte(0x174278)) == 1) ||
               (prev(byte(0x17427A)) == 1) ||
               (prev(byte(0x17427C)) == 1) ||
               (prev(byte(0x17427E)) == 1))
)

size_points = {
    size_4x4: 5,
    size_6x6: 5,
    size_8x8: 10,
    size_10x10: 25,
}

function endless_puzzles(type, first_index, first_puzzle_id, size, id, badge)
{
    if (first_index >= 10) {
        first_index_str = "" + first_index
        last_index_str = "" + (first_index + 4)
    } else {
        first_index_str = "0" + first_index
    
        if (first_index == 6)
            last_index_str = "10"
        else
            last_index_str = "05"
    }

    achievement(
        title = format("[Endless - {0}] {1} No.{2}-{3}", sizes[size], type, first_index_str, last_index_str),
        description = format("Clear {0} Puzzles from No.{1}-{2} in one session on Endless [{3}]",
                             type, first_index_str, last_index_str, sizes[size]),
        points = size_points[size], id = id, badge = badge,
        trigger = unless(puzzle_size() != size) &&
                  all_of(range(first_puzzle_id, first_puzzle_id + 4), 
                         p => once(selected_puzzle() == p && puzzle_complete())) &&
                  unless(computer_placed_pieces())
    )
}

endless_puzzles("Anime", 1, 0, size_4x4, 89022, "96463")
endless_puzzles("Anime", 6, 5, size_4x4, 89023, "96464")
endless_puzzles("Anime", 11, 10, size_4x4, 89024, "96493")
endless_puzzles("Anime", 16, 15, size_4x4, 89025, "96466")
endless_puzzles("Anime", 21, 20, size_4x4, 89026, "96467")
endless_puzzles("Anime", 26, 25, size_4x4, 89027, "96468")
endless_puzzles("Anime", 31, 30, size_4x4, 89028, "96469")
endless_puzzles("Anime", 36, 35, size_4x4, 89029, "96460")
endless_puzzles("Idol", 1, 50, size_4x4, 89030, "96470")
endless_puzzles("Idol", 6, 55, size_4x4, 89031, "96471")

endless_puzzles("Anime", 1, 0, size_6x6, 89032, "96472")
endless_puzzles("Anime", 6, 5, size_6x6, 89033, "96473")
endless_puzzles("Anime", 11, 10, size_6x6, 89034, "96474")
endless_puzzles("Anime", 16, 15, size_6x6, 89035, "96475")
endless_puzzles("Anime", 21, 20, size_6x6, 89036, "96476")
endless_puzzles("Anime", 26, 25, size_6x6, 89037, "96477")
endless_puzzles("Anime", 31, 30, size_6x6, 89038, "96478")
endless_puzzles("Anime", 36, 35, size_6x6, 89039, "96460")
endless_puzzles("Idol", 1, 50, size_6x6, 89040, "96479")
endless_puzzles("Idol", 6, 55, size_6x6, 89041, "96480")

endless_puzzles("Anime", 1, 0, size_8x8, 89042, "96481")
endless_puzzles("Anime", 6, 5, size_8x8, 89043, "96482")
endless_puzzles("Anime", 11, 10, size_8x8, 89044, "96483")
endless_puzzles("Anime", 16, 15, size_8x8, 89045, "96484")
endless_puzzles("Anime", 21, 20, size_8x8, 89046, "96485")
endless_puzzles("Anime", 26, 25, size_8x8, 89047, "96486")
endless_puzzles("Anime", 31, 30, size_8x8, 89048, "96487")
endless_puzzles("Anime", 36, 35, size_8x8, 89049, "96460")
endless_puzzles("Idol", 1, 50, size_8x8, 89050, "96488")
endless_puzzles("Idol", 6, 55, size_8x8, 89051, "96489")

endless_puzzles("Anime", 1, 0, size_10x10, 89052, "96491")
endless_puzzles("Anime", 6, 5, size_10x10, 89053, "96492")
endless_puzzles("Anime", 11, 10, size_10x10, 89054, "96494")
endless_puzzles("Anime", 16, 15, size_10x10, 89055, "96495")
endless_puzzles("Anime", 21, 20, size_10x10, 89056, "96496")
endless_puzzles("Anime", 26, 25, size_10x10, 89057, "96497")
endless_puzzles("Anime", 31, 30, size_10x10, 89058, "96498")
endless_puzzles("Anime", 36, 35, size_10x10, 89059, "96460")
endless_puzzles("Idol", 1, 50, size_10x10, 89060, "96499")
endless_puzzles("Idol", 6, 55, size_10x10, 89061, "96500")
