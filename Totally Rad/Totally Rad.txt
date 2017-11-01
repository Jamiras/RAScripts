// Totally Rad
// #ID = 2041

function lives() => byte(0x05D4)
function stage() => byte(0x003A)

stages = {
    2: "Cutscene", // act title card
   92: "Stage 1-1",
  121: "Stage 1-2",
  112: "Stage 2-1", // above ground
   90: "Stage 2-1", // sewer
  168: "Stage 3-1",
   18: "Stage 3-2",
  116: "Stage 4-1",
    7: "Stage 4-2",
   80: "Stage 5-1",
   19: "Stage 5-2",
   32: "Stage 5-3", // cutscene/final battle

    8: "Cutscene",
    9: "Cutscene",
   11: "Cutscene",
   12: "Cutscene",
   13: "Cutscene",
   14: "Cutscene",
   15: "Cutscene", 
//   32: "Cutscene", 
}

rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", stage(), stages),
    rich_presence_value("Lives", lives())
)