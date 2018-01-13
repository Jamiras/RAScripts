// Kingdom Hearts: Chain of Memories
// #ID=768
// MD5: d369f791d86a969778d2c3a5278d544c (E) (Eternity)

//           3d0b2 421cc 421cd 421ce
//                             Floor
// Title       1     4     1     0
// Traverse    0    10    11     0
// Agrabah     0     1     3     1
// Cutscene    0     0    12     1
// Olympus     0     3     6     2
// Cutscene    3     0    12     2
// Monstro     3     5     5     3
// Cutscene    3     0    12     3
// Wonderland  3     4     1     4
// Cutscene    3     0    12     4
// Halloween   3     6     7     5
// Cutscene    3     0    12     5
// Atlantica   3     2     4     6
// Cutscene    3     0    12     6
// Neverland   3     7     8     7
// Cutscene    3     0    12     7
// 100 Acre Wd 3    13    12     8
// H Bastion   3     8    10     9
// Twilight    1    11    13    10
// Destiny     1     9     9    11
// Oblivion    1    12    12    12

// Bastion     5     8    10     0

function current_location() => byte(0x421CC)
locations = {
    0: "Castle Oblivion",
    1: "Agrabah",
    2: "Atlantica",
    3: "Olympus Coliseum",
    4: "Wonderland",
    5: "Monstro",
    6: "Halloween Town",
    7: "Never Land",
    8: "Hollow Bastion",
    9: "Destiny Islands",
   10: "Traverse Town",
   11: "Twilight Town",
   12: "Castle Oblivion",
   13: "100-Acre Wood"
}

function sora_level() => byte(0x422C8)

// 0x42692: 06=sora, 9C=riku
function current_floor() => byte(0x421CE) + bit7(0x42692) * 16
floors = {
    0: "1F",
    1: "2F",
    2: "3F",
    3: "4F",
    4: "5F",
    5: "6F",
    6: "7F",
    7: "8F",
    8: "9F",
    9: "10F",
    10: "11F",
    11: "12F",
    12: "13F",
    
    16: "B12",
    17: "B11",
    18: "B10",
    19: "B9",
    20: "B8",
    21: "B7",
    22: "B6",
    23: "B5",
    24: "B4",
    25: "B3",
    26: "B2",
    27: "B1",
}

rich_presence_display("Level {0} in {1} ({2})",
    rich_presence_value("Level", sora_level()),
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_lookup("Floor", current_floor(), floors)
)