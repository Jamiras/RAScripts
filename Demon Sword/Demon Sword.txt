// Demon Sword
// #ID = 1648

function lives() => byte(0x007D)
function stage() => byte(0x0057)

stages = {
    0: "Stage 1-1",
    1: "Stage 1-2",
    2: "Stage 2-1",
    3: "Stage 2-2",
    4: "Stage 3-1",
    5: "Stage 3-2",
    6: "Stage 4",
    7: "Mystic Realm",
    8: "Dungeon",
   16: "Menu"
}

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", bit0(0x01FF)*16 + stage(), stages),
    rich_presence_value("Lives", lives())
)