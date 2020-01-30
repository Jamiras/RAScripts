// StarTropics II - Zoda's Revenge
// #ID = 1984

function current_chapter() => byte(0x0001)
function current_tetrads() => bit0(0x0110) + bit1(0x0110) + bit2(0x0110) + bit3(0x0110) + bit4(0x0110) + bit5(0x0110)
function current_hearts() => byte(0x0111)
function current_lives() => byte(0x0117)

rich_presence_conditional_display(current_chapter() == 0, "Titles")
rich_presence_display("Chapter {0}, {1} lives, {2} Tetrad pieces",
    rich_presence_value("Chapter", current_chapter()),
    rich_presence_value("Hearts", current_lives()),
    rich_presence_value("Tetrads", current_tetrads())
)