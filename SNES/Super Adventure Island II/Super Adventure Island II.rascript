// Super Adventure Island II
// #ID = 1197

// $0010: Location? (Nope)
function location() => byte(0x000010)

function in_game() => byte(0x000100) == 1

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
island_waku_waku = 1
island_fuwa_fuwa = 5

islands = {
    island_poka_poka: "exploring Poka-Poka Isle",
    island_waku_waku: "exploring Waku-Waku Isle",
    island_fuwa_fuwa: "exploring Fuwa-Fuwa Isle",
}

rich_presence_conditional_display(!in_game(), "Titles")
rich_presence_display("Master Higgens is {0}", rich_presence_lookup("location", island(), islands))

// $011A: Current Health
function current_hp() => byte(0x00011A)

// $011A: Current Health
function current_health() => word(0x00011A)

// $011C: Current Magic
function current_mp() => byte(0x00011C)

// $044E: Silver Sword
function silver_sword() => byte(0x00044E)

// $044F: Fire Sword
function fire_sword() => byte(0x00044F)

// $0450: Ice Sword
function ice_sword() => byte(0x000450)

// $0451: Thunder Sword
function thunder_sword() => byte(0x000451)

// $0452: Crystal Sword
function crystal_sword() => byte(0x000452)

// $0453: Power Sword
function power_sword() => byte(0x000453)

// $0454: Light Sword
function light_sword() => byte(0x000454)

// $0455: Dagger
function dagger() => byte(0x000455)

// $0456: Fireballs
function fireballs() => byte(0x000456)

// $0457: Boomerang
function boomerang() => byte(0x000457)

// $0458: Ax
function ax() => byte(0x000458)

// $0459: Shovel
function shovel() => byte(0x000459)

// $045B: Fire Armor
function fire_armor() => byte(0x00045B)

// $045C: Ice Armor
function ice_armor() => byte(0x00045C)

// $045D: Aqua Armor
function aqua_armor() => byte(0x00045D)

// $045E: Light Armor
function light_armor() => byte(0x00045E)

// $0460: Fire Shield
function fire_shield() => byte(0x000460)

// $0461: Ice Shield
function ice_shield() => byte(0x000461)

// $0462: Aqua Shield
function aqua_shield() => byte(0x000462)

// $0463: Light Shield
function light_shield() => byte(0x000463)

// $0464: Wand
function wand() => byte(0x000464)

// $0466: Ice Bell
function ice_bell() => byte(0x000466)

// $0467: Sun Ring
function sun_ring() => byte(0x000467)

// $0468: Power Fan
function power_fan() => byte(0x000468)

// $0469: Elven Flute
function elven_flute() => byte(0x000469)

// $046A: Sky Bell
function sky_bell() => byte(0x00046A)

// $046B: Light Stone
function light_stone() => byte(0x00046B)

// $046C: Sun Stone
function sun_stone() => byte(0x00046C)

// $046D: Star Stone
function star_stone() => byte(0x00046D)

// $046E: Aqua Stone
function aqua_stone() => byte(0x00046E)

// $046F: Moon Stone.
function moon_stone() => byte(0x00046F)

// $0470: Light Spell
function light_spell() => byte(0x000470)

// $0471: Star Spell
function star_spell() => byte(0x000471)

// $0472: Sun Spell
function sun_spell() => byte(0x000472)

// $0473: Aqua Stone
function aqua_stone() => byte(0x000473)

// $0474: Moon Spell
function moon_spell() => byte(0x000474)

// $047D: Shove
function shove() => byte(0x00047D)

// $047E: Up Jab
function up_jab() => byte(0x00047E)

// $047F: Down Jab
function down_jab() => byte(0x00047F)

// $0531: Light Gate
function light_gate() => byte(0x000531)

// $0532: Sun Gate
function sun_gate() => byte(0x000532)

// $0533: Star Gate
function star_gate() => byte(0x000533)

// $0534: Aqua Gate
function aqua_gate() => byte(0x000534)

// $0535: Moon Gate
function moon_gate() => byte(0x000535)

achievement(
    title = "A Run for my Mummy", description = "Defeat the Mummy and obtain the Elven Flute.", points = 10,
    id = 37008, badge = "37786", published = "6/4/2016 6:58:02 AM", modified = "5/26/2020 12:14:55 AM",
    trigger = elven_flute() == 1
)

achievement(
    title = "Magic Bottle", description = "Obtain your first Magic Bottle.", points = 5,
    id = 36996, badge = "37722", published = "6/4/2016 6:57:42 AM", modified = "6/7/2016 3:00:50 AM",
    trigger = current_mp() >= 2 && current_mp() <= 14
)

achievement(
    title = "Boomerang", description = "Obtain the Boomerang from the Casino.", points = 5,
    id = 36997, badge = "37723", published = "6/4/2016 6:57:45 AM", modified = "6/4/2016 6:58:55 AM",
    trigger = boomerang() == 1
)

achievement(
    title = "Light Shield", description = "Obtain the Light Shield from the Casino.", points = 5,
    id = 36998, badge = "37723", published = "6/4/2016 6:57:46 AM", modified = "6/4/2016 6:58:56 AM",
    trigger = light_shield() == 1
)

achievement(
    title = "Light Armor", description = "Obtain the Light Armor from the Casino.", points = 5,
    id = 36999, badge = "37723", published = "6/4/2016 6:57:48 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = light_armor() == 1
)

achievement(
    title = "Light Sword", description = "Obtain the Light Sword from the Casino.", points = 5,
    id = 37000, badge = "37723", published = "6/4/2016 6:57:50 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = light_sword() == 1
)

achievement(
    title = "Aqua Armor", description = "Obtain the Aqua Armor.", points = 5,
    id = 37001, badge = "37739", published = "6/4/2016 6:57:51 AM", modified = "6/4/2016 6:59:03 AM",
    trigger = aqua_armor() == 1
)

achievement(
    title = "Thunder Sword", description = "Obtain the Thunder Sword.", points = 5,
    id = 37002, badge = "37740", published = "6/4/2016 6:57:53 AM", modified = "6/4/2016 6:59:05 AM",
    trigger = thunder_sword() == 1
)

achievement(
    title = "Bad Tentacle Day", description = "Defeat the Octopus and obtain the Moon Stone.", points = 10,
    id = 37003, badge = "37750", published = "6/4/2016 6:57:55 AM", modified = "9/29/2019 2:28:01 PM",
    trigger = moon_stone() == 1
)

achievement(
    title = "Moon Gate", description = "Use the Moon Stone on the Moon Gate.", points = 5,
    id = 37004, badge = "37764", published = "6/4/2016 6:57:56 AM", modified = "6/4/2016 6:59:07 AM",
    trigger = moon_gate() == 1
)

achievement(
    title = "Upward Thrust", description = "Learn the Up-Jab.", points = 5,
    id = 37005, badge = "37770", published = "6/4/2016 6:57:58 AM", modified = "6/4/2016 6:59:08 AM",
    trigger = up_jab() == 1
)

achievement(
    title = "Crystal Sword", description = "Obtain the Crystal Sword.", points = 5,
    id = 37006, badge = "37782", published = "6/4/2016 6:57:59 AM", modified = "6/4/2016 6:59:09 AM",
    trigger = crystal_sword() == 1
)

achievement(
    title = "Not the Main Weapon Here", description = "Obtain the Ax.", points = 5,
    id = 37007, badge = "37785", published = "6/4/2016 6:58:01 AM", modified = "5/26/2020 12:14:58 AM",
    trigger = ax() == 1
)

achievement(
    title = "Fireballs", description = "Obtain the Fireballs.", points = 5,
    id = 36995, badge = "37721", published = "6/4/2016 6:57:41 AM", modified = "6/4/2016 6:58:51 AM",
    trigger = fireballs() == 1
)

achievement(
    title = "Light Spell", description = "Obtain the Light Spell.", points = 5,
    id = 37009, badge = "37787", published = "6/4/2016 6:58:04 AM", modified = "5/26/2020 12:14:59 AM",
    trigger = light_spell() == 1
)

achievement(
    title = "Star Spell", description = "Obtain the Star Spell.", points = 5,
    id = 37010, badge = "37788", published = "6/4/2016 6:58:05 AM", modified = "5/26/2020 12:15:00 AM",
    trigger = star_spell() == 1
)

achievement(
    title = "Sun Spell", description = "Obtain the Sun Spell.", points = 5,
    id = 37011, badge = "37790", published = "6/4/2016 6:58:07 AM", modified = "5/26/2020 12:15:03 AM",
    trigger = sun_spell() == 1
)

achievement(
    title = "Aqua Spell", description = "Obtain the Aqua Spell.", points = 5,
    id = 37012, badge = "37805", published = "6/4/2016 6:58:08 AM", modified = "5/26/2020 12:15:04 AM",
    trigger = aqua_stone() == 1
)

achievement(
    title = "Moon Spell", description = "Obtain the Moon Spell.", points = 5,
    id = 37013, badge = "37806", published = "6/4/2016 6:58:10 AM", modified = "5/26/2020 12:15:05 AM",
    trigger = moon_spell() == 1
)

achievement(
    title = "Aqua Shield", description = "Obtain the Aqua Shield.", points = 5,
    id = 37014, badge = "37807", published = "6/4/2016 6:58:11 AM", modified = "6/4/2016 6:59:20 AM",
    trigger = aqua_shield() == 1
)

achievement(
    title = "Power Sword", description = "Obtain the Power Sword.", points = 5,
    id = 37015, badge = "37808", published = "6/4/2016 6:58:13 AM", modified = "5/26/2020 12:15:06 AM",
    trigger = power_sword() == 1
)

achievement(
    title = "Maximum Life", description = "Obtain all the Life Bottles.", points = 25,
    id = 37016, badge = "37809", published = "6/4/2016 6:58:14 AM", modified = "5/26/2020 12:15:08 AM",
    trigger = current_health() == 96
)

// Ticket 36592: Started up the game and was rewarded the achievement.
//               MD5: b4e732b3d742af1791605bcd7aa4a1c4
achievement(
    title = "Maximum Magic", description = "Obtain all the Magic Bottles.", points = 25,
    id = 37017, badge = "37810", published = "6/4/2016 6:58:15 AM", modified = "5/26/2020 12:15:09 AM",
    trigger = current_mp() == 14
)

achievement(
    title = "An Egg-citing Fight", description = "Defeat the Eagle and obtain the Sky Bell.", points = 10,
    id = 37018, badge = "37811", published = "6/4/2016 6:58:17 AM", modified = "5/26/2020 12:15:10 AM",
    trigger = sky_bell() == 1
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
    trigger = repeated(50, location() == 176) && never(location() != 176) && never(higgens_animation() != 16)
)

achievement(
    title = "Star Stone", description = "Defeat the Mammoth and obtain the Star Stone.", points = 10,
    id = 36983, badge = "37709", published = "6/4/2016 6:57:23 AM", modified = "6/4/2016 6:58:36 AM",
    trigger = star_stone() == 1
)

achievement(
    title = "Health Up!", description = "Find your first life bottle.", points = 5,
    id = 36972, badge = "37697", published = "6/4/2016 6:57:04 AM", modified = "6/7/2016 3:00:13 AM",
    trigger = current_hp() >= 24 && current_hp() <= 96
)

achievement(
    title = "Dagger", description = "Obtain the Dagger.", points = 5,
    id = 36973, badge = "37698", published = "6/4/2016 6:57:07 AM", modified = "5/26/2020 12:15:13 AM",
    trigger = dagger() == 1
)

achievement(
    title = "Light Stone in the Trees", description = "Defeat the Evil Tree and obtain the Light Stone.", points = 10,
    id = 36974, badge = "37699", published = "6/4/2016 6:57:09 AM", modified = "9/23/2019 1:59:01 PM",
    trigger = light_stone() == 1
)

achievement(
    title = "Light Gate", description = "Use the Light Stone to lower the barriers.", points = 5,
    id = 36975, badge = "37700", published = "6/4/2016 6:57:10 AM", modified = "6/4/2016 6:58:27 AM",
    trigger = light_gate() == 1
)

achievement(
    title = "Muscle Your Way Through", description = "Defeat the Muscle Lizard and obtain the Sun Stone.", points = 10,
    id = 36976, badge = "37701", published = "6/4/2016 6:57:12 AM", modified = "5/26/2020 12:15:15 AM",
    trigger = sun_stone() == 1
)

achievement(
    title = "Sun Gate", description = "Use the Sun Stone to lower more barriers.", points = 5,
    id = 36977, badge = "37702", published = "6/4/2016 6:57:13 AM", modified = "6/4/2016 6:58:29 AM",
    trigger = sun_gate() == 1
)

achievement(
    title = "Rock Shoving", description = "Learn the ability to shove rocks.", points = 5,
    id = 36978, badge = "37703", published = "6/4/2016 6:57:15 AM", modified = "6/4/2016 6:58:30 AM",
    trigger = shove() == 1
)

achievement(
    title = "Ice Bell", description = "Obtain the Ice Bell.", points = 5,
    id = 36979, badge = "37704", published = "6/4/2016 6:57:16 AM", modified = "6/4/2016 6:58:31 AM",
    trigger = ice_bell() == 1
)

achievement(
    title = "Fire Sword", description = "Obtain the Fire Sword.", points = 5,
    id = 36980, badge = "37706", published = "6/4/2016 6:57:18 AM", modified = "6/4/2016 6:58:32 AM",
    trigger = fire_sword() == 1
)

achievement(
    title = "Fire Armor", description = "Obtain the Fire Armor.", points = 5,
    id = 36981, badge = "37707", published = "6/4/2016 6:57:19 AM", modified = "5/26/2020 12:15:17 AM",
    trigger = fire_armor() == 1
)

achievement(
    title = "Fire Shield", description = "Obtain the Fire Shield.", points = 5,
    id = 36982, badge = "37708", published = "6/4/2016 6:57:21 AM", modified = "5/26/2020 12:15:18 AM",
    trigger = fire_shield() == 1
)

achievement(
    title = "Silver Sword", description = "Obtain the Silver Sword.", points = 5,
    id = 36971, badge = "37696", published = "6/4/2016 6:57:02 AM", modified = "6/4/2016 6:58:22 AM",
    trigger = silver_sword() == 1
)

achievement(
    title = "Star Gate", description = "Use the Star Stone to open the Star Gate.", points = 5,
    id = 36984, badge = "37710", published = "6/4/2016 6:57:24 AM", modified = "6/4/2016 6:58:37 AM",
    trigger = star_gate() == 1
)

achievement(
    title = "Sun Ring", description = "Obtain the Sun Ring.", points = 5,
    id = 36985, badge = "37711", published = "6/4/2016 6:57:27 AM", modified = "6/4/2016 6:58:39 AM",
    trigger = sun_ring() == 1
)

achievement(
    title = "Magic Wand", description = "Obtain the Wand.", points = 5,
    id = 36986, badge = "37712", published = "6/4/2016 6:57:28 AM", modified = "6/4/2016 6:58:40 AM",
    trigger = wand() == 1
)

achievement(
    title = "Ice Armor", description = "Obtain the Ice Armor.", points = 5,
    id = 36987, badge = "37713", published = "6/4/2016 6:57:29 AM", modified = "6/4/2016 6:58:41 AM",
    trigger = ice_armor() == 1
)

achievement(
    title = "Ice Sword", description = "Obtain the Ice Sword.", points = 5,
    id = 36988, badge = "37714", published = "6/4/2016 6:57:31 AM", modified = "6/4/2016 6:58:42 AM",
    trigger = ice_sword() == 1
)

achievement(
    title = "Ice Shield", description = "Obtain the Ice Shield.", points = 5,
    id = 36989, badge = "37715", published = "6/4/2016 6:57:32 AM", modified = "6/4/2016 6:58:43 AM",
    trigger = ice_shield() == 1
)

achievement(
    title = "Rocket Turtle", description = "Defeat the Turtle and obtain the Aqua Stone.", points = 10,
    id = 36990, badge = "37716", published = "6/4/2016 6:57:34 AM", modified = "6/4/2016 6:58:45 AM",
    trigger = aqua_stone() == 1
)

achievement(
    title = "Aqua Gate", description = "Use the Aqua Stone on the Aqua Gate.", points = 5,
    id = 36991, badge = "37717", published = "6/4/2016 6:57:35 AM", modified = "6/4/2016 6:58:47 AM",
    trigger = aqua_gate() == 1
)

achievement(
    title = "Power Fan", description = "Defeat Saber Tooth and obtain the Power Fan.", points = 10,
    id = 36992, badge = "37718", published = "6/4/2016 6:57:37 AM", modified = "5/26/2020 12:15:20 AM",
    trigger = power_fan() == 1
)

achievement(
    title = "Shovel", description = "Obtain the Shovel.", points = 5,
    id = 36993, badge = "37719", published = "6/4/2016 6:57:38 AM", modified = "5/26/2020 12:15:22 AM",
    trigger = shovel() == 1
)

achievement(
    title = "Downward Thrust", description = "Learn the Down Jab.", points = 5,
    id = 36994, badge = "37720", published = "6/4/2016 6:57:39 AM", modified = "10/11/2019 5:12:02 PM",
    trigger = down_jab() == 1
)
