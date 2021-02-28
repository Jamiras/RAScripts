// Super Adventure Island II
// #ID = 1197

// $0010: Location? (Nope)
function location() => byte(0x000010)

function screen() => byte(0x00D3)
screen_hudson = 0
screen_map = 1
screen_poka_poka_island = 2
screen_hiya_hiya_island = 3
screen_boss_fight = 4 // tree, turtle, mummy, phantom, also used in intro??
screen_boss_fight2 = 5 // mammoth, octopus, eagle
screen_phantom_fight2 = 6
screen_boa_boa_island = 7
screen_puka_puka_island = 8
screen_sala_sala_island = 9
screen_casino = 11
screen_title_menu = 12
screen_cutscene2 = 13 // after eagle boxx
screen_credits = 14
screen_cave_chest = 15
screen_flash_and_crash = 16 // also after boss-fight rewards (tree, mammoth)
screen_run_for_doe = 18
screen_hermit = 19
screen_waku_waku_island = 20
screen_game_over = 21
screen_gate = 23 // light stone, star stone
screen_moneymaker = 24
screen_cutscene = 26 // after each boss
screen_intro = 27
screen_intro2 = 28
screen_intro3 = 29
screen_waku_waku_island2 = 30
screen_title = 31
screen_fuwa_fuwa_island_lock = 33

screens = {
    screen_map: "at sea",
    screen_waku_waku_island: "exploring Waku-Waku island",
    screen_waku_waku_island2: "exploring Waku-Waku island",
    screen_poka_poka_island: "exploring Poka-Poka island",
    screen_gate: "in a cave",
    screen_boa_boa_island: "exploring Boa-Boa Island",
    screen_hiya_hiya_island: "exploring Hiya-Hiya Island",
    screen_puka_puka_island: "exploring Puka-Puka Island",
    screen_sala_sala_island: "exploring Sala-Sala Island",
    screen_fuwa_fuwa_island_lock: "exploring Fuwa-Fuwa Island",
    screen_cave_chest: "in a cave",
    screen_casino: "at the casino",
    screen_flash_and_crash: "at the casino",
    screen_run_for_doe: "at the casino",
    screen_moneymaker: "at the casino",
    screen_hermit: "visiting the hermit",
    screen_boss_fight: "fighting a boss",
    screen_boss_fight2: "fighting a boss",
    screen_cutscene: "having a vision",
    screen_cutscene2: "rescuing Tina",
    screen_phantom_fight2: "fighting a boss",
    screen_credits: "victorious",
    screen_game_over: "defeated",
}

function current_stage() => byte(0x000100)

// byte(0x0005EF) goes to 1 when the menu is open, and also when loading, so we use it for save protection
// the current_stage() check is for demo protection
function trigger_in_game() => current_stage() >= 1 && byte(0x0005EF) == 0

function trigger_event_flag(address) => trigger_in_game() && byte(address) == 1 && prev(byte(address)) == 0

// $0102: Higgin's Animations?
function higgens_animation() => byte(0x000102)
animation_standing = 0
animation_ducking = 1
animation_jumping = 2
animation_falling = 4

animation_punching = 0x10 // OR'd to base animation

// $010C: equipped weapon
function weapon() => byte(0x00010C)
weapon_fist = 0
weapon_silver_sword = 5


// $0110: Location
function island() => byte(0x000110)
island_poka_poka = 0
island_hiya_hiya = 1
island_boa_boa = 2
island_puka_puka = 3
island_sala_sala = 4
island_fuwa_fuwa = 5
island_gate = 12 // light gate, sun gate, hiya-hiya cave, northernmost cave
island_boa_boa_cave = 13
island_ocean = 14

islands = {
    island_poka_poka: "exploring Poka-Poka Island",
    island_boa_boa: "exploring Boa-Boa Island",
    island_boa_boa_cave: "exploring Boa-Boa Island",
    island_hiya_hiya: "exploring Hiya-Hiya Island",
    island_puka_puka: "exploring Puka-Puka Island",
    island_sala_sala: "exploring Sala-Sala Island",
    island_fuwa_fuwa: "exploring Fuwa-Fuwa Island",
    island_gate: "in a cave",
    island_ocean: "at sea"
}

half_hearts = {
    0: "",
    1: "½"
}

function is_title() => screen() == screen_hudson ||
                       screen() == screen_title ||
                       screen() == screen_title_menu ||
                       (screen() >= screen_intro && screen() <= screen_intro3)

rich_presence_conditional_display(is_title(), "Titles")
rich_presence_conditional_display(byte(0x0003F5) == 1, "Watching the demo")
rich_presence_display("Master Higgins is {0} with {1}{2} hearts", 
    rich_presence_lookup("Location", screen(), screens),
    rich_presence_value("Hearts", high4(0x11E)),
    rich_presence_lookup("HalfHearts", bit3(0x11E), half_hearts)
)

// $011A: Current Health
function current_hp() => byte(0x00011A)

// $011A: Current Health
function current_health() => word(0x00011A)

// $011C: Current Magic
function current_mp() => byte(0x00011C)

function max_hp() => byte(0x00011E)

// $044E: Silver Sword
// $044F: Fire Sword
// $0450: Ice Sword
// $0451: Thunder Sword
// $0452: Crystal Sword
// $0453: Power Sword
// $0454: Light Sword
// $0455: Dagger
// $0456: Fireballs
// $0457: Boomerang
// $0458: Ax
// $0459: Shovel
// $045B: Fire Armor
// $045C: Ice Armor
// $045D: Aqua Armor
// $045E: Light Armor
// $0460: Fire Shield
// $0461: Ice Shield
// $0462: Aqua Shield
// $0463: Light Shield
// $0464: Wand
// $0466: Ice Bell
// $0467: Sun Ring
// $0468: Power Fan
// $0469: Elven Flute
// $046A: Sky Bell
// $046B: Light Stone
// $046C: Sun Stone
// $046D: Star Stone
// $046E: Aqua Stone
// $046F: Moon Stone.
// $0470: Light Spell
// $0471: Star Spell
// $0472: Sun Spell
// $0473: Aqua Stone
// $0474: Moon Spell
// $047D: Shove
// $047E: Up Jab
// $047F: Down Jab
// $0531: Light Gate
// $0532: Sun Gate
// $0533: Star Gate
// $0534: Aqua Gate
// $0535: Moon Gate

// =============================== Poka-Poka Island ===============================

achievement(
    title = "Silver Sword", description = "Obtain the Silver Sword.", points = 5,
    id = 36971, badge = "37696", published = "6/4/2016 6:57:02 AM", modified = "6/4/2016 6:58:22 AM",
    trigger = trigger_event_flag(0x00044E)
)

achievement(
    title = "Health Up!", description = "Find your first life bottle.", points = 5,
    id = 36972, badge = "37697", published = "6/4/2016 6:57:04 AM", modified = "6/7/2016 3:00:13 AM",
    trigger = trigger_in_game() && max_hp() > prev(max_hp()) && max_hp() >= 24 && max_hp() <= 96
)

achievement(
    title = "Dagger", description = "Obtain the Dagger.", points = 5,
    id = 36973, badge = "37698", published = "6/4/2016 6:57:07 AM", modified = "5/26/2020 12:15:13 AM",
    trigger = trigger_event_flag(0x000455)
)

achievement(
    title = "Light Stone in the Trees", description = "Defeat the Evil Tree and obtain the Light Stone.", points = 10,
    id = 36974, badge = "37699", published = "6/4/2016 6:57:09 AM", modified = "9/23/2019 1:59:01 PM",
    trigger = trigger_event_flag(0x00046B)
)

achievement(
    title = "Light Gate", description = "Use the Light Stone to lower the barriers.", points = 5,
    id = 36975, badge = "37700", published = "6/4/2016 6:57:10 AM", modified = "6/4/2016 6:58:27 AM",
    trigger = trigger_event_flag(0x000531)
)

// =============================== Boa-Boa Island ===============================

achievement(
    title = "Muscle Your Way Through", description = "Defeat the Muscle Lizard and obtain the Sun Stone.", points = 10,
    id = 36976, badge = "37701", published = "6/4/2016 6:57:12 AM", modified = "5/26/2020 12:15:15 AM",
    trigger = trigger_event_flag(0x00046C)
)

achievement(
    title = "Sun Gate", description = "Use the Sun Stone to lower more barriers.", points = 5,
    id = 36977, badge = "37702", published = "6/4/2016 6:57:13 AM", modified = "6/4/2016 6:58:29 AM",
    trigger = trigger_event_flag(0x000532)
)

// =============================== Hiya-Hiya Island ===============================

achievement(
    title = "Rock Shoving", description = "Learn the ability to shove rocks.", points = 5,
    id = 36978, badge = "37703", published = "6/4/2016 6:57:15 AM", modified = "6/4/2016 6:58:30 AM",
    trigger = trigger_event_flag(0x00047D)
)

achievement(
    title = "Ice Bell", description = "Obtain the Ice Bell.", points = 5,
    id = 36979, badge = "37704", published = "6/4/2016 6:57:16 AM", modified = "6/4/2016 6:58:31 AM",
    trigger = trigger_event_flag(0x000466)
)

achievement(
    title = "Fire Sword", description = "Obtain the Fire Sword.", points = 5,
    id = 36980, badge = "37706", published = "6/4/2016 6:57:18 AM", modified = "6/4/2016 6:58:32 AM",
    trigger = trigger_event_flag(0x00044F)
)

achievement(
    title = "Fire Armor", description = "Obtain the Fire Armor.", points = 5,
    id = 36981, badge = "37707", published = "6/4/2016 6:57:19 AM", modified = "5/26/2020 12:15:17 AM",
    trigger = trigger_event_flag(0x00045B)
)

achievement(
    title = "Fire Shield", description = "Obtain the Fire Shield.", points = 5,
    id = 36982, badge = "37708", published = "6/4/2016 6:57:21 AM", modified = "5/26/2020 12:15:18 AM",
    trigger = trigger_event_flag(0x000460)
)

achievement(
    title = "Star Stone", description = "Defeat the Mammoth and obtain the Star Stone.", points = 10,
    id = 36983, badge = "37709", published = "6/4/2016 6:57:23 AM", modified = "6/4/2016 6:58:36 AM",
    trigger = trigger_event_flag(0x00046D)
)

// A.sram
// =============================== Boa-Boa Island ===============================

achievement(
    title = "Star Gate", description = "Use the Star Stone to open the Star Gate.", points = 5,
    id = 36984, badge = "37710", published = "6/4/2016 6:57:24 AM", modified = "6/4/2016 6:58:37 AM",
    trigger = trigger_event_flag(0x000533)
)

achievement(
    title = "Magic Wand", description = "Obtain the Wand.", points = 5,
    id = 36986, badge = "37712", published = "6/4/2016 6:57:28 AM", modified = "6/4/2016 6:58:40 AM",
    trigger = trigger_event_flag(0x000464)
)

achievement(
    title = "Sun Ring", description = "Obtain the Sun Ring.", points = 5,
    id = 36985, badge = "37711", published = "6/4/2016 6:57:27 AM", modified = "6/4/2016 6:58:39 AM",
    trigger = trigger_event_flag(0x000467)
)

achievement(
    title = "Ice Armor", description = "Obtain the Ice Armor.", points = 5,
    id = 36987, badge = "37713", published = "6/4/2016 6:57:29 AM", modified = "6/4/2016 6:58:41 AM",
    trigger = trigger_event_flag(0x00045C)
)

achievement(
    title = "Ice Sword", description = "Obtain the Ice Sword.", points = 5,
    id = 36988, badge = "37714", published = "6/4/2016 6:57:31 AM", modified = "6/4/2016 6:58:42 AM",
    trigger = trigger_event_flag(0x000450)
)

achievement(
    title = "Ice Shield", description = "Obtain the Ice Shield.", points = 5,
    id = 36989, badge = "37715", published = "6/4/2016 6:57:32 AM", modified = "6/4/2016 6:58:43 AM",
    trigger = trigger_event_flag(0x000461)
)

achievement(
    title = "Magic Bottle", description = "Obtain your first Magic Bottle.", points = 5,
    id = 36996, badge = "37722", published = "6/4/2016 6:57:42 AM", modified = "6/7/2016 3:00:50 AM",
    trigger = trigger_in_game() && current_mp() > prev(current_mp()) && current_mp() >= 2 && current_mp() <= 14
)

achievement(
    title = "Rocket Turtle", description = "Defeat the Turtle and obtain the Aqua Stone.", points = 10,
    id = 36990, badge = "37716", published = "6/4/2016 6:57:34 AM", modified = "6/4/2016 6:58:45 AM",
    trigger = trigger_event_flag(0x00046E)
)

// B.sram
// =============================== Puka-Puka Island ===============================

achievement(
    title = "Aqua Gate", description = "Use the Aqua Stone on the Aqua Gate.", points = 5,
    id = 36991, badge = "37717", published = "6/4/2016 6:57:35 AM", modified = "6/4/2016 6:58:47 AM",
    trigger = trigger_event_flag(0x000534)
)

achievement(
    title = "Power Fan", description = "Defeat Saber Tooth and obtain the Power Fan.", points = 10,
    id = 36992, badge = "37718", published = "6/4/2016 6:57:37 AM", modified = "5/26/2020 12:15:20 AM",
    trigger = trigger_event_flag(0x000468)
)

achievement(
    title = "Shovel", description = "Obtain the Shovel.", points = 5,
    id = 36993, badge = "37719", published = "6/4/2016 6:57:38 AM", modified = "5/26/2020 12:15:22 AM",
    trigger = trigger_event_flag(0x000459)
)

achievement(
    title = "Downward Thrust", description = "Learn the Down Jab.", points = 5,
    id = 36994, badge = "37720", published = "6/4/2016 6:57:39 AM", modified = "10/11/2019 5:12:02 PM",
    trigger = trigger_event_flag(0x00047F)
)

achievement(
    title = "Aqua Armor", description = "Obtain the Aqua Armor.", points = 5,
    id = 37001, badge = "37739", published = "6/4/2016 6:57:51 AM", modified = "6/4/2016 6:59:03 AM",
    trigger = trigger_event_flag(0x00045D)
)

achievement(
    title = "Thunder Sword", description = "Obtain the Thunder Sword.", points = 5,
    id = 37002, badge = "37740", published = "6/4/2016 6:57:53 AM", modified = "6/4/2016 6:59:05 AM",
    trigger = trigger_event_flag(0x000451)
)

achievement(
    title = "Bad Tentacle Day", description = "Defeat the Octopus and obtain the Moon Stone.", points = 10,
    id = 37003, badge = "37750", published = "6/4/2016 6:57:55 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = trigger_event_flag(0x00046F)
)

// C.sram
// =============================== Sala-Sala Island ===============================

achievement(
    title = "Moon Gate", description = "Use the Moon Stone on the Moon Gate.", points = 5,
    id = 37004, badge = "37764", published = "6/4/2016 6:57:56 AM", modified = "6/4/2016 6:59:07 AM",
    trigger = trigger_event_flag(0x000535)
)

achievement(
    title = "Upward Thrust", description = "Learn the Up-Jab.", points = 5,
    id = 37005, badge = "37770", published = "6/4/2016 6:57:58 AM", modified = "6/4/2016 6:59:08 AM",
    trigger = trigger_event_flag(0x00047E)
)

achievement(
    title = "Crystal Sword", description = "Obtain the Crystal Sword.", points = 5,
    id = 37006, badge = "37782", published = "6/4/2016 6:57:59 AM", modified = "6/4/2016 6:59:09 AM",
    trigger = trigger_event_flag(0x000452)
)

achievement(
    title = "Not the Main Weapon Here", description = "Obtain the Ax.", points = 5,
    id = 37007, badge = "37785", published = "6/4/2016 6:58:01 AM", modified = "5/26/2020 12:14:58 AM",
    trigger = trigger_event_flag(0x000458)
)

achievement(
    title = "A Run for my Mummy", description = "Defeat the Mummy and obtain the Elven Flute.", points = 10,
    id = 37008, badge = "37786", published = "6/4/2016 6:58:02 AM", modified = "5/26/2020 12:14:55 AM",
    trigger = trigger_event_flag(0x000469)
)

// D.sram
// =============================== Playing the Flute ===============================

achievement(
    title = "Fireballs", description = "Obtain the Fireballs.", points = 5,
    id = 36995, badge = "37721", published = "6/4/2016 6:57:41 AM", modified = "6/4/2016 6:58:51 AM",
    trigger = trigger_event_flag(0x000456)
)

achievement(
    title = "Light Spell", description = "Obtain the Light Spell.", points = 5,
    id = 37009, badge = "37787", published = "6/4/2016 6:58:04 AM", modified = "5/26/2020 12:14:59 AM",
    trigger = trigger_event_flag(0x000470)
)

achievement(
    title = "Star Spell", description = "Obtain the Star Spell.", points = 5,
    id = 37010, badge = "37788", published = "6/4/2016 6:58:05 AM", modified = "5/26/2020 12:15:00 AM",
    trigger = trigger_event_flag(0x000471)
)

achievement(
    title = "Sun Spell", description = "Obtain the Sun Spell.", points = 5,
    id = 37011, badge = "37790", published = "6/4/2016 6:58:07 AM", modified = "5/26/2020 12:15:03 AM",
    trigger = trigger_event_flag(0x000472)
)

achievement(
    title = "Aqua Spell", description = "Obtain the Aqua Spell.", points = 5,
    id = 37012, badge = "37805", published = "6/4/2016 6:58:08 AM", modified = "5/26/2020 12:15:04 AM",
    trigger = trigger_event_flag(0x000473)
)

// E.sram
// =============================== The Casino ===============================

achievement(
    title = "Boomerang", description = "Obtain the Boomerang from the Casino.", points = 5,
    id = 36997, badge = "37723", published = "6/4/2016 6:57:45 AM", modified = "6/4/2016 6:58:55 AM",
    trigger = trigger_event_flag(0x000457)
)

achievement(
    title = "Light Shield", description = "Obtain the Light Shield from the Casino.", points = 5,
    id = 36998, badge = "37723", published = "6/4/2016 6:57:46 AM", modified = "6/4/2016 6:58:56 AM",
    trigger = trigger_event_flag(0x000463)
)

achievement(
    title = "Light Armor", description = "Obtain the Light Armor from the Casino.", points = 5,
    id = 36999, badge = "37723", published = "6/4/2016 6:57:48 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = trigger_event_flag(0x00045E)
)

achievement(
    title = "Light Sword", description = "Obtain the Light Sword from the Casino.", points = 5,
    id = 37000, badge = "37723", published = "6/4/2016 6:57:50 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = trigger_event_flag(0x000454)
)

// F.sram
// =============================== More Playing the Flute ===============================

achievement(
    title = "Aqua Shield", description = "Obtain the Aqua Shield.", points = 5,
    id = 37014, badge = "37807", published = "6/4/2016 6:58:11 AM", modified = "6/4/2016 6:59:20 AM",
    trigger = trigger_event_flag(0x000462)
)

achievement(
    title = "Moon Spell", description = "Obtain the Moon Spell.", points = 5,
    id = 37013, badge = "37806", published = "6/4/2016 6:58:10 AM", modified = "5/26/2020 12:15:05 AM",
    trigger = trigger_event_flag(0x000474)
)

achievement(
    title = "Power Sword", description = "Obtain the Power Sword.", points = 5,
    id = 37015, badge = "37808", published = "6/4/2016 6:58:13 AM", modified = "5/26/2020 12:15:06 AM",
    trigger = trigger_event_flag(0x000453)
)

achievement(
    title = "An Egg-citing Fight", description = "Defeat the Eagle and obtain the Sky Bell.", points = 10,
    id = 37018, badge = "37811", published = "6/4/2016 6:58:17 AM", modified = "5/26/2020 12:15:10 AM",
    trigger = trigger_event_flag(0x00046A)
)

// G.sram
// =============================== Fuwa-Fuwa ===============================
// last HP and last two MP containers are all in Fuwa-Fuwa
// https://gamefaqs.gamespot.com/snes/588708-super-adventure-island-ii/map/1966-level-6-map
// * go all the way right, then up on the clouds and all the way left - through the blocks to get the heart container
// * in the second leaf/vegetable room, the magic container is in the upper right corner behind a block (use power sword)
// * in the bridge room after the bubble room, drop down about halfway across and dig for the last magic container

achievement(
    title = "Maximum Life", description = "Obtain all the Life Bottles.", points = 25,
    id = 37016, badge = "37809", published = "6/4/2016 6:58:14 AM", modified = "5/26/2020 12:15:08 AM",
    trigger = trigger_in_game() && current_health() == 96 && prev(current_health()) < 96
)

// Ticket 36592: Started up the game and was rewarded the achievement.
//               MD5: b4e732b3d742af1791605bcd7aa4a1c4
achievement(
    title = "Maximum Magic", description = "Obtain all the Magic Bottles.", points = 25,
    id = 37017, badge = "37810", published = "6/4/2016 6:58:15 AM", modified = "5/26/2020 12:15:09 AM",
    trigger = trigger_in_game() && current_mp() == 14 && prev(current_mp()) < 14
)

// Ticket 34072: I played the entire game normaly, all trophies worked just fine, but when I Defeated the final boss,
//               the last trophy didn't trigger. I played in hardcore mode, as shown at 8:10 in the video of proof
//               https://www.youtube.com/watch?v=m-dy7uItEKM
//               MD5: b4e732b3d742af1791605bcd7aa4a1c4
// Ticket 28302: Achievement won't trigger despite having completed the requirements
//               MD5: Unknown
//               Emulator: RetroArch (Snes9x)
// Ticket 27491: Hello, I am in need of some assistance. I am currently playing Super Adventure Island II (USA) for the
//               SNES ( CRC32: 52FE16FD) (Checksum:b4e732b3d742af1791605bcd7aa4a1c4)  via RASnes9x, in Hardcore Mode
//               and the RA "Save the Girl!" will not pop. The RA says "Defeat the final boss and save Tina and the
//               King!". I have refought the final boss 4 times so far and watch all the way through the credits until
//               it get to the "THE END" screen where you can only proceed via Reset. The other 48 RAs have all popped
//               with no problem but the final one just won't. I have also tried to earn the RA using Retroarch with
//               the SNES9x core (Retroarch, the SNES9x Core and RASnes9x are all up to date) and to no avail.
//               MD5: b4e732b3d742af1791605bcd7aa4a1c4
achievement(
    title = "Save the Girl!", description = "Defeat the final boss and save Tina and the King!", points = 25,
    id = 37019, badge = "37812", published = "6/4/2016 6:58:19 AM", modified = "5/26/2020 12:15:12 AM",
//    trigger = repeated(50, location() == 176) && never(location() != 176) && never(higgens_animation() != 16)
    trigger = once(screen() == screen_phantom_fight2) &&           // was fighting phantom
              never(screen() == screen_map) &&                     // without return to world map
              screen() == screen_hiya_hiya_island &&               // falling scene
              repeated(50, location() == 176)                      // higgins is falling
)






