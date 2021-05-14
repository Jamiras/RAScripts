// Incredible Hulk, The
// #ID = 336

// $00B8: dificuldade
function current_difficulty() => byte(0x0000B8)

achievement(
    title = "Tubing", description = "Reach Level 2 - Tubing", points = 5,
    id = 791, badge = "01054", published = "5/12/2013 6:55:52 PM", modified = "1/31/2020 9:34:21 AM",
    trigger = byte(0x000354) == 0 && byte(0x000356) == 0 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              unless(once(byte(0x0003C2) == 12))
)

achievement(
    title = "Lev-1", description = "Reach Level 3 - Lev-1", points = 5,
    id = 792, badge = "01053", published = "5/12/2013 6:56:09 PM", modified = "1/31/2020 9:34:19 AM",
    trigger = byte(0x000354) == 32 && byte(0x000356) == 32 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              unless(once(byte(0x0003C2) == 12))
)

achievement(
    title = "Brain", description = "Reach Level 4 - Brain", points = 5,
    id = 793, badge = "01055", published = "5/12/2013 6:56:26 PM", modified = "1/31/2020 9:34:18 AM",
    trigger = byte(0x000354) == 64 && byte(0x000356) == 64 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              unless(once(byte(0x0003C2) == 12))
)

achievement(
    title = "Unit 3", description = "Reach Level 5 - Unit 3", points = 5,
    id = 794, badge = "01056", published = "5/12/2013 6:56:46 PM", modified = "1/31/2020 9:34:16 AM",
    trigger = byte(0x000354) == 128 && byte(0x000356) == 128 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              unless(once(byte(0x0003C2) == 12))
)

// Ticket 36170: I finished The incredible Hulk (Snes) on hard, and neither trophies "In the Presence of Leader (10)"
//               and "In the Presence of Leader II (25)" triggered. This v&iacute;deo contains the entire gameplay and
//               show that I chose Hard mode and was playing on Hardcore
//               mode.https://www.youtube.com/watch?v=_9YmnFWt69Y&amp;feature=youtu.be
//               MD5: 37d27c5b88e4a25d079c0e02635bb438
// Ticket 34967: This and the In The Presence Of Leader II achievements don't trigger at all, I beat the game twice and
//               the cheevo didn't activate or register
//               MD5: 557a08391bccdc111ddda81d3f950cb7
//               Emulator: RetroArch (Nintendo - SNES / SFC (Snes9X - Current))
achievement(
    title = "In the Presence of Leader", description = "Finish the Game", points = 10,
    id = 795, badge = "01057", published = "5/12/2013 6:57:09 PM", modified = "1/31/2020 9:34:15 AM",
    trigger = byte(0x000354) == 160 && byte(0x000356) == 128 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              unless(once(byte(0x0003C2) == 12))
)

// Ticket 36171: I finished The incredible Hulk (Snes) on hard, and neither trophies "In the Presence of Leader (10)"
//               and "In the Presence of Leader II (25)" triggered. This v&iacute;deo contains the entire gameplay and
//               show that I chose Hard mode and was playing on Hardcore
//               mode.https://www.youtube.com/watch?v=_9YmnFWt69Y&amp;feature=youtu.be
//               MD5: 37d27c5b88e4a25d079c0e02635bb438
// Ticket 35503: 
//               friend conquer this bug I will play the game and I didn't win the conquest ... I could find out, thank
//               you very much
//               MD5: Unknown
//               Emulator: RetroArch ()
// Ticket 34193: This and the In The Presence Of Leader achievements don't trigger at all, I beat the game and it
//               didn't register. I'll try to re-earn it later on another date.
//               MD5: 37d27c5b88e4a25d079c0e02635bb438
//               Emulator: RetroArch (Nintendo - SNES / SFC (Snes9X - Current))
achievement(
    title = "In the Presence of Leader II", description = "Finish the Game on Hard Mode", points = 25,
    id = 796, badge = "01057", published = "5/12/2013 6:57:43 PM", modified = "1/31/2020 9:34:14 AM",
    trigger = byte(0x000354) == 160 && byte(0x000356) == 128 && byte(0x000383) == 32 && byte(0x000382) == 1 && 
              current_difficulty() == 4 && unless(once(byte(0x0003C2) == 12))
)
