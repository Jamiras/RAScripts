// Warlocked
// #ID = 4922

// $A030: ChickenWiz
function chickenwiz() => byte(0x00A030)

// $A031: pigwiz
function pigwiz() => byte(0x00A031)

// $A032: elvenwiz
function elvenwiz() => byte(0x00A032)

// $A033: necromancer
function necromancer() => byte(0x00A033)

// $A034: icewiz
function icewiz() => word(0x00A034)

// $A036: sage
function sage() => byte(0x00A036)

// $A037: mysticwiz
function mysticwiz() => byte(0x00A037)

// $A038: sleepwiz
function sleepwiz() => word(0x00A038)

// $A03A: stormwiz
function stormwiz() => word(0x00A03A)

// $A03C: firewiz
function firewiz() => word(0x00A03C)

// $A03E: bombwiz
function bombwiz() => word(0x00A03E)

// $A040: goldwiz
function goldwiz() => word(0x00A040)

// $A042: poxwiz
function poxwiz() => word(0x00A042)

// $A044: quakewiz
function quakewiz() => word(0x00A044)

// $A046: telewiz
function telewiz() => word(0x00A046)

// $A048: toxicwiz
function toxicwiz() => word(0x00A048)

// $A04A: Queen Azarel
function queen_azarel() => byte(0x00A04A)

// $A04B: Chief Zog
function chief_zog() => byte(0x00A04B)

// $A04C: windwizx
function windwizx() => word(0x00A04C)

// $A04E: crowwiz
function crowwiz() => word(0x00A04E)

// $A050: smithwiz
function smithwiz() => word(0x00A050)

// $A052: stealthwiz
function stealthwiz() => word(0x00A052)

// $A054: sweatwiz
function sweatwiz() => word(0x00A054)

// $A056: fuelwiz
function fuelwiz() => word(0x00A056)

// $A058: mudwiz
function mudwiz() => word(0x00A058)

// $A05A: poisonwiz
function poisonwiz() => word(0x00A05A)

// $A05C: brickwiz
function brickwiz() => word(0x00A05C)

// $C602: 1 during briefing, 0 during stage
// $C603: 1 during stage, 0 after completing level
function level_complete() => word(0xC602) == 0 && byte(0xc61f) == 0xFF

// $C605: [8-bit] Screen ID?
//        0x02 = Power-On screen
//        0x07 = Title screen cutscene
//        0x03 = Title screen menu
//        0x08 = Armies screen
//        0x0a = Wizards data screen
//        0x09 = Wizard exchange screen
//        0x06 = Playing in the battlefield
function screen_id() => byte(0x00C605)

// $C607: active level progress
function active_level() => low4(0x00C607)

// $C608: beast level progress
function beast_level_progress() => byte(0x00C608)

// $C609: human level progress
function human_level_progress() => byte(0x00C609)

function collect_sage(sage, value) => 
        once(prev(screen_id()) == 3 && screen_id() == 6 && sage == 0) && // did not have sage at title screen
        sage == value && // has sage now
        level_complete() && 
        active_level() >= 2 && // no sages on first two levels
        never(screen_id() == 2) // reset when game reset

// Ticket 49758: Hello,
//               
//               I had unlocked a wizard but the achievement did not trigger. I will provide evidence on the Discord
//               that I do have the wizard, as well as another that did have the achievement trigger. Any help is
//               appreciated.
//               
//               Thank you.
//               RetroAchievements Hash: b5eb859e6ea60a0bd83100a10206d9c9
//               Emulator: RetroArch (mGBA (Set to GBA))
//               Emulator Version: 1.10.3
achievement(
    title = "Sage of the Cock", points = 5,
    description = "Recruit [ChickenWiz].",
    id = 13239, badge = "13089", published = "9/16/2014 6:24:45 AM", modified = "4/21/2022 5:49:42 PM",
    trigger = collect_sage(chickenwiz(), 1)
)

achievement(
    title = "Sage of the Swine", points = 5,
    description = "Recruit [PigWiz].",
    id = 13240, badge = "13090", published = "9/16/2014 6:24:47 AM", modified = "4/21/2022 5:47:17 PM",
    trigger = collect_sage(pigwiz(), 1)
)

achievement(
    title = "Sage of the Immortal", points = 5,
    description = "Recruit [ElvenWiz].",
    id = 13241, badge = "13091", published = "9/16/2014 6:24:48 AM", modified = "4/21/2022 5:48:09 PM",
    trigger = collect_sage(elvenwiz(), 1)
)

achievement(
    title = "Sage of the Undead", points = 5,
    description = "Recruit [Necromancer].",
    id = 13243, badge = "13093", published = "9/16/2014 6:24:51 AM", modified = "4/21/2022 5:46:44 PM",
    trigger = collect_sage(necromancer(), 1)
)

achievement(
    title = "Sage of the Glacier", points = 5,
    description = "Recruit [IceWiz].",
    id = 13242, badge = "13092", published = "9/16/2014 6:24:50 AM", modified = "4/7/2022 5:59:32 AM",
    trigger = collect_sage(icewiz(), 257)
)

achievement(
    title = "Sage of the Blaze", points = 5,
    description = "Recruit [FireWiz].",
    id = 13248, badge = "13098", published = "9/16/2014 6:24:58 AM", modified = "4/7/2022 6:03:37 AM",
    trigger = collect_sage(firewiz(), 257)
)

achievement(
    title = "Sage of the Storm", points = 5,
    description = "Recruit [StormWiz].",
    id = 13247, badge = "13097", published = "9/16/2014 6:24:56 AM", modified = "4/7/2022 6:02:13 AM",
    trigger = collect_sage(stormwiz(), 257)
)

achievement(
    title = "Sage of the Skies", points = 5,
    description = "Recruit [WindWiz].",
    id = 13254, badge = "13104", published = "9/16/2014 6:25:07 AM", modified = "4/7/2022 6:15:47 AM",
    trigger = collect_sage(windwizx(), 257)
)

achievement(
    title = "Sage of Dreams", points = 5,
    description = "Recruit [SleepWiz].",
    id = 13261, badge = "13112", published = "9/16/2014 6:25:18 AM", modified = "4/7/2022 6:23:36 AM",
    trigger = collect_sage(sleepwiz(), 257)
)

achievement(
    title = "Sage of Disease", points = 5,
    description = "Recruit [PoxWiz].",
    id = 13250, badge = "13100", published = "9/16/2014 6:25:01 AM", modified = "4/7/2022 6:06:59 AM",
    trigger = collect_sage(poxwiz(), 257)
)

achievement(
    title = "Sage of Pestilence", points = 5,
    description = "Recruit [ToxicWiz].",
    id = 13253, badge = "13103", published = "9/16/2014 6:25:06 AM", modified = "4/7/2022 6:14:30 AM",
    trigger = collect_sage(toxicwiz(), 257)
)

achievement(
    title = "Sage of Demolition", points = 5,
    description = "Recruit [QuzkeWiz].",
    id = 13251, badge = "13101", published = "9/16/2014 6:25:03 AM", modified = "4/7/2022 6:12:29 AM",
    trigger = collect_sage(quakewiz(), 257)
)

achievement(
    title = "Sage of the Powder", points = 5,
    description = "Recruit [BomberWiz].",
    id = 13249, badge = "13099", published = "9/16/2014 6:25:00 AM", modified = "4/7/2022 6:05:27 AM",
    trigger = collect_sage(bombwiz(), 257)
)

achievement(
    title = "Sage of Swamp", points = 5,
    description = "Recruit [MudWiz].",
    id = 13258, badge = "13109", published = "9/16/2014 6:25:13 AM", modified = "4/7/2022 6:20:31 AM",
    trigger = collect_sage(mudwiz(), 257)
)

achievement(
    title = "Sage of Greed", points = 5,
    description = "Recruit [GoldWiz].",
    id = 13244, badge = "13094", published = "9/16/2014 6:24:52 AM", modified = "4/7/2022 5:59:20 AM",
    trigger = collect_sage(goldwiz(), 257)
)

achievement(
    title = "Sage of the Ground", points = 5,
    description = "Recruit [FuelWiz].",
    id = 13255, badge = "13106", published = "9/16/2014 6:25:09 AM", modified = "4/7/2022 6:17:07 AM",
    trigger = collect_sage(fuelwiz(), 257)

)

achievement(
    title = "Sage of the Weapon", points = 5,
    description = "Recruit [PoisonWiz].",
    id = 13259, badge = "13110", published = "9/16/2014 6:25:15 AM", modified = "4/7/2022 6:21:21 AM",
    trigger = collect_sage(poisonwiz(), 257)

)

achievement(
    title = "Sage of Labor", points = 5,
    description = "Recruit [SweatWiz].",
    id = 13265, badge = "13114", published = "9/16/2014 6:25:25 AM", modified = "4/7/2022 6:26:03 AM",
    trigger = collect_sage(sweatwiz(), 257)

)

achievement(
    title = "Sage of the Forge", points = 5,
    description = "Recruit [SmithWiz].",
    id = 13256, badge = "13107", published = "9/16/2014 6:25:11 AM", modified = "4/7/2022 6:18:08 AM",
    trigger = collect_sage(smithwiz(), 257)
)

achievement(
    title = "Sage of the Masons", points = 5,
    description = "Recruit [BrickWiz].",
    id = 13257, badge = "13108", published = "9/16/2014 6:25:12 AM", modified = "4/7/2022 6:19:33 AM",
    trigger = collect_sage(brickwiz(), 257)
)

// Ticket 49064: I rescued CrowWiz on Beast campaign stage 2 via replay but this did not trigger. I found him,
//               controlled him, and brought him back to the temple before completing the mission. I also confirmed he
//               was on my roster on the next stage and summoned him during said stage. My guess is replaying the stage
//               instead of being in the normal campaign progression is causing the issue. This is also likely
//               affecting all the "recruit wizard X" achievements.
//               RetroAchievements Hash: b5eb859e6ea60a0bd83100a10206d9c9
//               Emulator: RetroArch (Gambatte)
//               Emulator Version: 1.10.1
achievement(
    title = "Sage of the All-Seeing", points = 5,
    description = "Recruit [CrowWiz].",
    id = 13260, badge = "13111", published = "9/16/2014 6:25:16 AM", modified = "4/7/2022 6:22:39 AM",
    trigger = collect_sage(crowwiz(), 257)
)

achievement(
    title = "Sage of Assassins", points = 5,
    description = "Recruit [StealthWiz].",
    id = 13262, badge = "13113", published = "9/16/2014 6:25:19 AM", modified = "4/7/2022 6:25:12 AM",
    trigger = collect_sage(stealthwiz(), 257)
)

achievement(
    title = "Sage of the Mystic", points = 5,
    description = "Recruit [TeleWiz].",
    id = 13252, badge = "13102", published = "9/16/2014 6:25:04 AM", modified = "4/7/2022 6:12:34 AM",
    trigger = collect_sage(telewiz(), 257)
)

achievement(
    title = "Sage of the Magi", points = 5,
    description = "Recruit [Sage].",
    id = 13245, badge = "13095", published = "9/16/2014 6:24:54 AM", modified = "4/7/2022 6:30:25 AM",
    trigger = collect_sage(sage(), 1)
)

achievement(
    title = "Sage of the Order", points = 5,
    description = "Recruit [MysticWiz].",
    id = 13246, badge = "13096", published = "9/16/2014 6:24:55 AM", modified = "4/7/2022 6:30:14 AM",
    trigger = collect_sage(mysticwiz(), 1)
)

function complete_human_level(index) => byte(0xc614) == 1 && never(active_level() != index) &&
                                        once(word(0xc602) == 0x101) && level_complete() &&
                                        never(screen_id() != 6)
function complete_beast_level(index) => byte(0xc614) == 2 && never(active_level() != index) &&
                                        once(word(0xc602) == 0x101) && level_complete() &&
                                        never(screen_id() != 6)

achievement(
    title = "Harvest", points = 10,
    description = "Complete Human Faction Level 1",
    id = 13268, badge = "13118", published = "9/16/2014 7:28:21 AM", modified = "7/6/2020 6:10:59 AM",
    trigger = complete_human_level(0)
)

achievement(
    title = "Army Training", points = 10,
    description = "Complete Human Faction Level 2",
    id = 13269, badge = "13118", published = "9/16/2014 7:28:23 AM", modified = "7/6/2020 6:11:01 AM",
    trigger = complete_human_level(1)
)

achievement(
    title = "Tree of Evil", points = 10,
    description = "Complete Human Faction Level 3",
    id = 13270, badge = "13118", published = "9/16/2014 7:28:24 AM", modified = "7/6/2020 6:11:05 AM",
    trigger = complete_human_level(2)
)

achievement(
    title = "Snow Forest", points = 10,
    description = "Complete Human Faction Level 4",
    id = 13271, badge = "13119", published = "9/16/2014 7:28:26 AM", modified = "9/16/2014 7:42:07 AM",
    trigger = complete_human_level(3)
)

achievement(
    title = "Rescue Azarel", points = 10,
    description = "Complete Human Faction Level 5",
    id = 13272, badge = "13118", published = "9/16/2014 7:28:28 AM", modified = "9/16/2014 7:42:09 AM",
    trigger = complete_human_level(4)
)

achievement(
    title = "Home Run", points = 10,
    description = "Complete Human Faction Level 6",
    id = 13273, badge = "13119", published = "9/16/2014 7:28:29 AM", modified = "9/16/2014 7:42:10 AM",
    trigger = complete_human_level(5)
)

achievement(
    title = "SleepWalking", points = 10,
    description = "Complete Human Faction Level 7",
    id = 13274, badge = "13120", published = "9/16/2014 7:28:31 AM", modified = "9/16/2014 7:42:13 AM",
    trigger = complete_human_level(6)
)

achievement(
    title = "Frozen Sea", points = 10,
    description = "Complete Human Faction Level 8",
    id = 13275, badge = "13119", published = "9/16/2014 7:28:32 AM", modified = "9/16/2014 7:42:15 AM",
    trigger = complete_human_level(7)
)

achievement(
    title = "Spider's Lair", points = 10,
    description = "Complete Human Faction Level 9",
    id = 13276, badge = "13121", published = "9/16/2014 7:28:33 AM", modified = "9/16/2014 7:42:16 AM",
    trigger = complete_human_level(8)
)

achievement(
    title = "Desert Thieves", points = 10,
    description = "Complete Human Faction Level 10",
    id = 13277, badge = "13121", published = "9/16/2014 7:28:35 AM", modified = "9/16/2014 7:42:18 AM",
    trigger = complete_human_level(9)
)

achievement(
    title = "Dragon's Horde", points = 10,
    description = "Complete Human Faction Level 11",
    id = 13278, badge = "13122", published = "9/16/2014 7:28:36 AM", modified = "9/16/2014 7:42:19 AM",
    trigger = complete_human_level(10)
)

achievement(
    title = "Mines of Gordo", points = 10,
    description = "Complete Human Faction Level 12",
    id = 13279, badge = "13123", published = "9/16/2014 7:28:38 AM", modified = "9/16/2014 7:42:21 AM",
    trigger = complete_human_level(11)
)

achievement(
    title = "Zog's Fortress", points = 25,
    description = "Complete Human Faction.",
    id = 13280, badge = "13124", published = "9/16/2014 7:28:39 AM", modified = "7/6/2020 6:10:41 AM",
    trigger = complete_human_level(12)
)

achievement(
    title = "Flesh Farms", points = 10,
    description = "Complete Beast Faction Level 1.",
    id = 13281, badge = "13117", published = "9/16/2014 7:59:57 AM", modified = "7/6/2020 6:10:37 AM",
    trigger = complete_beast_level(0)
)

achievement(
    title = "First Blood", points = 10,
    description = "Complete Beast Faction Level 2.",
    id = 13282, badge = "13117", published = "9/16/2014 7:59:58 AM", modified = "7/6/2020 6:10:34 AM",
    trigger = complete_beast_level(1)
)

achievement(
    title = "Search and Destroy", points = 10,
    description = "Complete Beast Faction Level 3.",
    id = 13283, badge = "13117", published = "9/16/2014 8:00:00 AM", modified = "7/6/2020 6:10:32 AM",
    trigger = complete_beast_level(2)
)

achievement(
    title = "Sand Canyons", points = 10,
    description = "Complete Beast Faction Level 4.",
    id = 13284, badge = "13125", published = "9/16/2014 8:00:05 AM", modified = "9/16/2014 8:07:50 AM",
    trigger = complete_beast_level(3)
)

achievement(
    title = "Burning Bridges", points = 10,
    description = "Complete Beast Faction Level 5.",
    id = 13285, badge = "13117", published = "9/16/2014 8:00:07 AM", modified = "9/16/2014 8:07:53 AM",
    trigger = complete_beast_level(4)
)

achievement(
    title = "Hidden Temple", points = 10,
    description = "Complete Beast Faction Level 6.",
    id = 13286, badge = "13126", published = "9/16/2014 8:00:08 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(5)
)

achievement(
    title = "Plague", points = 10,
    description = "Complete Beast Faction Level 7.",
    id = 13287, badge = "13127", published = "9/16/2014 8:00:10 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(6)
)

achievement(
    title = "Caverns of Jinzu", points = 10,
    description = "Complete Beast Faction Level 8.",
    id = 13288, badge = "13128", published = "9/16/2014 8:00:11 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(7)
)

achievement(
    title = "Elven Forest", points = 10,
    description = "Complete Beast Faction Level 9.",
    id = 13289, badge = "13127", published = "9/16/2014 8:00:13 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(8)
)

achievement(
    title = "Dark Tides", points = 10,
    description = "Complete Beast Faction Level 10.",
    id = 13290, badge = "13129", published = "9/16/2014 8:00:15 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(9)
)

achievement(
    title = "Dragon Tree Siege", points = 10,
    description = "Complete Beast Faction Level 11.",
    id = 13291, badge = "13127", published = "9/16/2014 8:00:16 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(10)
)

achievement(
    title = "SnowBound", points = 10,
    description = "Complete Beast Faction Level 12.",
    id = 13292, badge = "13130", published = "9/16/2014 8:00:18 AM", modified = "9/24/2019 10:02:01 AM",
    trigger = complete_beast_level(11)
)

achievement(
    title = "Azarel's Castle", points = 25,
    description = "Complete Beast Faction.",
    id = 13293, badge = "13131", published = "9/16/2014 8:00:20 AM", modified = "7/6/2020 6:10:27 AM",
    trigger = complete_beast_level(12)
)

achievement(
    title = "Lord of Peace", points = 10,
    description = "Recruit [Queen Azarel].",
    id = 13263, badge = "13115", published = "9/16/2014 6:25:21 AM", modified = "9/16/2014 7:06:47 AM",
    trigger = queen_azarel() >= 1 && queen_azarel() < 9
)

achievement(
    title = "Lord of Beasts", points = 10,
    description = "Recruit [Chief Zog].",
    id = 13264, badge = "13105", published = "9/16/2014 6:25:23 AM", modified = "9/16/2014 7:06:44 AM",
    trigger = chief_zog() >= 1 && chief_zog() < 9
)

achievement(
    title = "Warlocked", points = 10,
    description = "Complete Both Factions of Warlocked.",
    id = 13294, badge = "13137", published = "9/16/2014 8:31:46 AM", modified = "7/6/2020 6:12:28 AM",
    trigger = beast_level_progress() == 13 && human_level_progress() == 13 &&
              (prev(beast_level_progress()) == 12 || prev(human_level_progress()) == 12)
)

factions = {
    1: "Human",
    2: "Beast"
}

level_names = {
    0x10: "Harvest",
    0x11: "Army Training",
    0x12: "Tree of Evil",
    0x13: "Snow Forest",
    0x14: "Rescue Azarel",
    0x15: "Home Run",
    0x16: "Sleepwalking",
    0x17: "Frozen Sea",
    0x18: "Spider's Lair",
    0x19: "Desert Thieves",
    0x1A: "Dragon's Horde",
    0x1B: "Mines of Gordo",
    0x1C: "Zog's Fortress",
    0x20: "Flesh Farms",
    0x21: "First Blood",
    0x22: "Search and Destroy",
    0x23: "Sand Canyons",
    0x24: "Burning Bridges",
    0x25: "Hidden Temple",
    0x26: "Plague",
    0x27: "Caverns of Jinzu",
    0x28: "Elven Forest",
    0x29: "Dark Tides",
    0x2A: "Dragon Tree Siege",
    0x2B: "Snowbound",
    0x2C: "Azarel's Castle"
}

rich_presence_conditional_display(byte(0xc605) != 6, "Titles")

rich_presence_conditional_display(level_complete() && bit7(0xc607) == 1, "{0} {1}: {2} - {3} (complete)",
    rich_presence_lookup("Faction", byte(0xc614), factions),
    rich_presence_value("Level", low4(0xc607) + 1),
    rich_presence_lookup("Name", byte(0xc614) * 16 + low4(0xc607), level_names),
    rich_presence_value("Time", word(0xc628), format="SECS")
)

rich_presence_conditional_display(level_complete(), "{0} {1}: {2} - {3} (complete)",
    rich_presence_lookup("Faction", byte(0xc614), factions),
    rich_presence_value("Level", low4(0xc607)),
    rich_presence_lookup("Name", byte(0xc614) * 16 + low4(0xc607) - 1, level_names),
    rich_presence_value("Time", word(0xc628), format="SECS")
)

rich_presence_conditional_display(word(0xC602) == 0x0101, "{0} {1}: {2} - briefing",
    rich_presence_lookup("Faction", byte(0xc614), factions),
    rich_presence_value("Level", low4(0xc607) + 1),
    rich_presence_lookup("Name", byte(0xc614) * 16 + low4(0xc607), level_names),
    rich_presence_value("Time", word(0xc628), format="SECS")
)

rich_presence_display("{0} {1}: {2} - {3}",
    rich_presence_lookup("Faction", byte(0xc614), factions),
    rich_presence_value("Level", low4(0xc607) + 1),
    rich_presence_lookup("Name", byte(0xc614) * 16 + low4(0xc607), level_names),
    rich_presence_value("Time", word(0xc628), format="SECS")
)
