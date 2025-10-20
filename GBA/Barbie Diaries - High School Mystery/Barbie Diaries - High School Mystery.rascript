// The Barbie Diaries: High School Mystery
// #ID=7959
// MD5=85bbf8a6f95b9d2d463d0a55f2b69d35 [USA]
// MD5=8e1c2672225640d441932424b5e11243 [EU]

function in_game() => dword(0x1a854) == 1
function current_progress() => dword(0x1bc2c)

item_progress = {}
for i in range(0, 15)
    item_progress[i] = "0 items"
for i in range(16, 29)
    item_progress[i] = "1 item"
for i in range(30, 42)
    item_progress[i] = "2 items"
for i in range(43, 50)
    item_progress[i] = "3 items"
for i in range(51, 58)
    item_progress[i] = "4 items"
for i in range(59, 63)
    item_progress[i] = "5 items"
for i in range(64, 75)
    item_progress[i] = "6 items"
for i in range(76, 86)
    item_progress[i] = "7 items"
for i in range(87, 93)
    item_progress[i] = "8 items"
for i in range(94, 103)
    item_progress[i] = "9 items"
for i in range(104, 114)
    item_progress[i] = "10 items"
for i in range(115, 124)
    item_progress[i] = "11 items"
for i in range(125, 131)
    item_progress[i] = "12 items"
for i in range(132, 139)
    item_progress[i] = "13 items"
for i in range(140, 144)
    item_progress[i] = "14 items"
for i in range(145, 160)
    item_progress[i] = "15 items"
    
function current_room() => dword(0x19e90)
room_warning = 0x57626741           // AgbWarning
room_legal = 0x6167654c             // Legal
room_mattel = 0x7474614d            // Mattel
room_gorilla = 0x69726f47           // Gorilla
room_title = 0x6c746954             // Title
room_minigame_menu = 0x696e694d     // Minigame
room_minigame_image = 0x44636950    // PicDecoderMini
room_minigame_word = 0x64726f57     // WordPuzzleMini
room_menu = 0x6974704f              // Options

room_intro = 0x49747543             // CutIntro
room_av_room = 0x6f525641           // AVRoom
room_hallway_a = 0x6c6c6148         // HallwayA / HallwayB / HallwayC
room_art_room = 0x52747241          // ArtRoom
room_chemistry_lab = 0x65696353     // ScienceLab
room_principals_office = 0x6966664f // Office
room_cafeteria = 0x65666143         // Cafeteria
room_auditorium = 0x69647541        // Auditorium
room_soccer_field = 0x63636f53      // SoccerField
room_school_store = 0x6f686353      // SchoolStore
room_library = 0x7262694c           // Library
room_yearbook = 0x72616559          // YearbookRoom
room_shop_class = 0x706f6853        // ShopClass
room_roof = 0x666f6f52              // Roof
room_teachers_bathroom = 0x68746142 // Bathroom
room_gymnasium = 0x6e6d7947         // Gymnasium
room_equipment = 0x69757145         // EquipmentRoom
room_teachers_lounge = 0x6e756f4c   // Lounge
room_lie_detector = 0x4465694c      // LieDetector / LieDetector1 / LieDetector2 / 
                                    // LieDetector3 / LieDetector4 / LieDetectorFalse
room_questions_done = 0x73657551    // QuestionsDone
room_ending = 0x45747543            // CutEnding
room_credits = 0x64657243           // Credits

rooms = {
    room_av_room: "in the AV Room",
    room_hallway_a: "in the Hallway",
    room_art_room: "in the Art Room",
    room_chemistry_lab: "in the Chemistry Lab",
    room_principals_office: "in the Principal's Office",
    room_cafeteria: "in the Cafeteria",
    room_auditorium: "in the Auditorium",
    room_school_store: "in the School Store",
    room_library: "in the Library",
    room_soccer_field: "at the Soccer Field",
    room_yearbook: "in the Yearbook Room",
    room_shop_class: "in the Shop Classroom",
    room_roof: "on the School Roof",
    room_teachers_bathroom: "in the Teacher's Bathroom",
    room_gymnasium: "in the Gymnasium",
    room_equipment: "in the Equipment Room",
    room_teachers_lounge: "in the Teacher's Lounge",
}

rich_presence_conditional_display(in_game(), "Barbie is {0} | {1} recovered",
    rich_presence_lookup("Location", current_room(), rooms),
    rich_presence_lookup("ItemsRecovered", current_progress(), item_progress)
)

non_game_rooms = {
    room_lie_detector: "Barbie is confronting the suspect",
    room_questions_done: "Barbie is confronting the suspect",
    room_ending: "Barbie has found the culprit",
    room_credits: "Watching the credits",
    room_minigame_menu: "Playing minigames",
    room_minigame_image: "Playing minigames",
    room_minigame_word: "Playing minigames",
    room_intro: "Barbie is starting a new game",
}

rich_presence_display("{0}",
    rich_presence_lookup("NonGameStates", current_room(), non_game_rooms, fallback="Titles")
)

function progress_achievement(title, description, points, room, prev_state, state)
{
    achievement(title, description, points, type="progression",
        trigger = in_game() &&
                  current_room() == room &&
                  current_progress() == state &&
                  prev(current_progress()) == prev_state
    )
}

// ----- AV Room -----
// 0. Talk to Kevin.
// 1. Learn about the PDA
//    Follow the paint spatters into Hallway A.

// ----- Hallway A -----
// 2. Follow the paint spatters to the smoke cloud.
// 3. Return to the AV Room.

// ----- AV Room -----
// 4. Talk to Kevin.
// 5. Take Fan.
// 6. Return to the smoke.

// ----- Hallway A -----
//    Find the silhouette near the smoke and Place Fan.
// 7. Wait for the smoke to clear.
// 8. Follow the paint splatters to the Art Room.

// ----- Art Room -----
//    Wander near the portrait art at the far right side of the room. Barbie mentions her BDA and Kevin.
// 9. Leave

// ----- Hallway A -----
// 10. [Minigame: Stop the light on the space labelled A]
//     Go back to the AV Room.

// ----- AV Room -----
//     Talk to Kevin.
// 11. [Minigame: Descramble the picture of a door]
// 12. "That door looks familiar."
// 13. Go back to the art room.

// ----- Art Room -----
//     Examine the red cabinet.
// 14. Take the Handbag.

progress_achievement("The Handbag", "Recover the first missing auction item", 2, room_art_room, 14, 16)

// 16. Barbie describes the Handbag
// 20. Examine the Handbag
//     Examine the note
// 21. Go back to the hallway, then into the chemistry lab.

// ----- Chemistry Lab -----
// 22. Talk to Mr. Bennet
//     Examine the chemistry lab kit.
// 24. Go back to the AV Room.

// ----- AV Room -----
//     Talk to Kevin.
// 26. Go back to the Chemistry Lab.

// ----- Chemistry Lab -----
// 28. Examine the chemistry lab kit.
//     [Minigame: figure out the code - colors on right indicate order to push buttons (530)]
// 29. Get the cell phone

progress_achievement("The Cell Phone", "Recover the second missing auction item", 2, room_chemistry_lab, 29, 30)

// 30. Go back to the hallway

// ----- Hallway A -----
// 32. [Minigame: Stop the light on the space labelled A]
//     Go to the AV Room.

// ----- AV Room -----
// 33. Talk to Kevin.
//     [Minigame: Press the appropriate button as the notes go through the circles]
// 34. (Complete the minigame)
// 35. Go to the art room.

// ----- Art Room -----
// 36. Talk to Tia.
// 37. Go back to the hallway.

// ----- Hallway A -----
//     Enter the Principal's Office.
// 38. Talk to Ms. Peters.
//     [Minigame: sort mail]
// 40. (Complete the minigame)
// 41. Examine the silver dresser next to the mailboxes.
// 42. Find the Walkie-Talkie Wristwatches.

progress_achievement("The Walkie-Talkie Wristwatches", 
                     "Recover the third missing auction item", 2, room_principals_office, 42, 43)

// 43. Look at the wristwatches.
// 44. [Minigame: Stop the light on the space labelled A]
//     Go to the Chemistry Lab.

// ----- Chemistry Lab -----
// 45. Talk to Courtney.
// 46. [Minigame: Stop the light on the space labelled A]
//     [Minigame: complete the words (SPEAKER)]
// 47. Go to the AV Room.

// ----- AV Room -----
// 48. Talk to Kevin.
// 49. Go to the Hallway

// ----- Hallway A -----
//     Go right into the Cafeteria

// ----- Cafeteria -----
//     Avoid the flying food and go right into Hallway B

// ----- Hallway B -----
//     Go all the way right into the Auditorium

// ----- Auditorium -----
// 50. Examine the Podium near the exit door.

progress_achievement("The Robopup", 
                     "Recover the fourth missing auction item", 2, room_auditorium, 50, 51)

// 51. Found the Robopup
// 52. Examine the Robopup
// 53. Go to the school store (middle door in Hallway B)

// ----- School Store -----
//     Talk to Charlie.
// 54. Take the book.
// 55. Examine the book.
// 56. Go to library (next door on the left in Hallway B)

// ----- Library -----
// 57. Examine the shelf behind the pile of books.

progress_achievement("The E-Saurus", 
                     "Recover the fifth missing auction item", 2, room_library, 58, 59)

// 58. Examine the E-saurus.
// 59. Find the message.
// 60. Return to the Auditorium.

// ----- Auditorium -----
//     Go out the exit door.

// ----- Soccer Field -----
//     Cross the soccer field and enter Hallway C.

// ----- Hallway C -----
//     Enter the Yearbook room.

// ----- Yearbook Room -----
// 61. Talk to Regen.
//     [Minigame: Press the appropriate button as the notes go through the circles]
// 62. (Complete the minigame)
// 63. Search the Cabinet near the posterboard.

progress_achievement("The Laptop", 
                     "Recover the sixth missing auction item", 2, room_yearbook, 63, 64)

// 64. Get the laptop.
// 65. Examine the laptop.
// 67. [Minigame: Descramble the picture of a drill]
// 68. Go to the shop room (exit to hallway, next door to left).

// ----- Shop Class ----
// 69. Talk to Todd.
// 70. Approach the giant metal cabinet.
// 71. Follow the trail back to Hallway B and head up to the roof.

// ----- School Roof -----
// 72. Get the drill.
// 74. Examine the vent.
// 75. Get the CD Player.

progress_achievement("The CD Player", 
                     "Recover the seventh missing auction item", 2, room_roof, 75, 78)

// 78. Examine the CD Player.
// 79. Go back to Shop Class.

// ----- Shop Class ----
// 80. Talk to Todd.
// 82. [Minigame: Stop the light on the space labelled A]
//     Go to the AV Room.

// ----- AV Room -----
// 83. Talk to Kevin.
//     [Minigame: Stop the light on the space labelled A]
//     [Minigame: complete the words (FOOTAGE)]
// 84. (Complete the minigame)
// 85. Open the big metal door and examine the toy car.
// 86. Take the toy car.

progress_achievement("The RC Spy Camera", 
                     "Recover the eighth missing auction item", 2, room_av_room, 86, 87)
   
// 87. Examine the toy car.
//     Exit the room.

// ----- Hallway A -----
// 88. [Minigame: Stop the light on the space labelled A]
//     [Minigame: complete the words (SAFE)]
// 89. (Complete the minigame)
//     Go back to the school store.

// ----- Hallway B -----
//     [Minigame: Stop the light on the space labelled A]
// 90. Continue to the school store.

// ----- School Store -----
// 91. Examine the store safe.
//     [Minigame: figure out the code - colors on right indicate order to push buttons (928)]
// 93. (Complete the minigame)

progress_achievement("The Digital Picture Frame", 
                     "Recover the ninth missing auction item", 2, room_school_store, 93, 94)

// 94. Leave the school store.

// ----- Hallway C -----
// 95. [Minigame: Stop the light on the space labelled A]
//     Go to the principal's office.

// ----- Principal's Office -----
// 96. Talk to Raquelle.
// 98. [Minigame: Stop the light on the space labelled A]
//     Talk to Raquelle again.
// 99. [Minigame: sort mail]
//     Search the file cabinet next to the window.
// 103. Get the concert tickets.

progress_achievement("The Concert Tickets", 
                     "Recover the tenth missing auction item", 2, room_principals_office, 103, 104)

// 104. Go to the Yearbook room.

// ----- Yearbook Room -----
// 105. Talk to Regen.
// 108. Examine package.
// 109. Head to the Teacher's Bathroom (it's all the way back in Hallway A at the far left end)

// ----- Hallway A -----
//      Talk to Mr. Bennet.

// ----- Teacher's Bathroom -----
// 110. Examine the mirror.
// 112. Read the mirror.
// 113. Examine the second stall.
// 114. Get the charm bracelet.

progress_achievement("The Charm Bracelet", 
                     "Recover the eleventh missing auction item", 2, room_teachers_bathroom, 114, 115)

// 115. Examine the charm bracelet.
// 116. [Minigame: Stop the light on the space labelled A]
//      Head to the AV Room.

// ----- Hallway A -----
//      Talk to Mr. Bennet.
// 117. Go to the AV Room.

// ----- AV Room -----
//      Talk to Kevin.
//      [Minigame: Press the appropriate button as the notes go through the circles]
// 118. (Complete the minigame)
// 119. Go to the Cafeteria.

// ----- Cafeteria -----
//      Follow the gravy trail. Examine the register.
// 123. Get the flip flops.

progress_achievement("The Flip Flops", 
                     "Recover the twelfth missing auction item", 2, room_cafeteria, 123, 125)

// 125. Examine the flip flops.
// 126. Go to the Gymnasium (far right end of Hallway C).

// ----- Gymnasium -----
// 129. [Minigame: make you way through the room]

// ----- Equipment Room -----
//      Examine the locker.
// 130. Find the Pogo Stick.
// 131. Get the Pogo Stick.

progress_achievement("The Pogo Stick", 
                     "Recover the thirteenth missing auction item", 2, room_equipment, 131, 132)

// 132. Examine the Pogo Stick.
// 133. [Minigame: Stop the light on the space labelled A]
//      Head to the Teacher's Lounge (back in Hallway A next to the Principal's Office)

// ----- Auditorium -----
//      Talk to Charlie.
// 135. Head to the Teacher's Lounge

// ----- Hallway B -----
//      [Minigame: Descramble the picture of a table]
// 136. (Complete the minigame)
// 137. Head to the Teacher's Lounge

// ----- Teacher's Lounge -----
//      Examine the table near the refridgerator.
// 138. Examine the Ping Pong table.
// 139. Get the Ping Pong Table.

progress_achievement("The Ping Pong Table", 
                     "Recover the fourteenth missing auction item", 2, room_teachers_lounge, 139, 140)

// 140. Examine the library card.
// 141. Go to the library.

// ----- Library -----
//      Examine the right-most computer.
// 143. Look at the red book on the rightmost table.
// 144. Get the Tote Bag.

progress_achievement("The Tote Bag", 
                     "Recover the fifteenth missing auction item", 2, room_library, 144, 145)

// 145. Examine the Tote Bag.
// 146. [Minigame: Stop the light on the space labelled A]
//      Go to the AV Room.

// ----- AV Room -----
//      Talk to Kevin.

// ----- Endgame -----
// 147. Talk to Mr. Bennet. 
//      He has access to the various rooms - admits, true
// 148. Talk to Mr. Bennet.
//      He is the head of the yearbook staff an substitute gym teacher - admits, true
// 149. Talk to Mr. Bennet.
//      He lost his library card - denies, false
// 150. Talk to Mr. Bennet.
//      He claims he left Moore High on good terms, false
// 157. Talk to Mr. Bennet.

achievement("It's Going to Be a Great Year", "Solve the mystery", 10, type="win_condition",
    trigger = current_room() == room_credits &&
              prev(current_room()) == room_ending
)

// --------------------

function minigame_completed() => dword(0x16e80) == 1
function selected_puzzle() => dword(0x1a648)
function incorrect_letters() => dword(tbyte(0x19e58) + 0x8054)

achievement("Picture Decoder", "Solve all five picture puzzles from the mini games menu", 5,
    trigger = measured(tally_of(range(0, 4), 5, i => once(selected_puzzle() == i))) &&
              unless(current_room() != room_minigame_image || !minigame_completed())
)

achievement("Word Filler", "Solve ten word puzzles from the mini games menu without incorrect guesses", 5,
    trigger = measured(repeated(10, minigame_completed() && !prev(minigame_completed()))) &&
              unless(current_room() != room_minigame_word || incorrect_letters() != 0)    
)
