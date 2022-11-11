// Bushi Seiryuuden - Futari no Yuusha
// #ID = 2714
// MD5: 672d15e2200a5ca176233fcb10139e92 (J)
//      426aa798ebae52cde625ca533698949c (T+Eng2.0_TomDDS)

// maps: https://vgmaps.com/Atlas/SuperNES/index.htm#B

// NOTE: all encounters can be earned at the end of the game. Just use Woku to engage instead of the sword

function current_world() => byte(0x00F4E2)
function current_area() => byte(0x00F4E4)
function current_subarea() => byte(0x00F4E6)
function current_teardrops() => byte(0x00F4EC)
function current_magatama() => word(0x00F4EE)
function tower_magatama() => word(0xF4F0)
function current_life() => word(0x00F4F2)
function max_life() => word(0x00F4F4)
function current_power() => byte(0x00F4F6)
function current_level() => byte(0x00F4F8)
function current_experience() => word(0x00F4FA)
function time_hours() => byte(0x00F4FE)
function time_minutes() => byte(0x00F500)
function time_seconds() => byte(0x00F502)
function current_gems() => word(0x00F514)
function current_soul() => word(0x00F544)
function max_soul() => word(0x00F546)
function armband_strength() => byte(0x00F548)
function current_chapter() => byte(0x00F554)
function current_mode() => byte(0x015F05)
function battle_turns() => word(0x01CB2B)
function battle_magatama() => byte(0x01CB31)

function total_magatama() => current_magatama() + tower_magatama()

mode_publishercard = 0x00
mode_text_cutscene = 0x04
mode_platforming = 0x07
mode_loading_game = 0x08
mode_transitioning = 0x09
mode_overworld = 0x0A
mode_gameover = 0x12
mode_firstperson = 0x14 // people closeups, also save screen
mode_game_select = 0x1A
mode_enter_name = 0x20
mode_settings = 0x27
mode_battle_loading = 0x29
mode_intro_flyover = 0x2B
mode_intro_magatama = 0x2D
mode_intro_banner = 0x32
mode_chapter_titlecard = 0x35
mode_titlescreen = 0x3B
mode_battle_titlecard = 0x48
mode_tower_cutscene = 0x4A
mode_status = 0x54
mode_battle_records = 0x56

function in_game() => current_chapter() != 0 && current_mode() != mode_loading_game

function trigger_overworld() => current_mode() == mode_overworld
function trigger_platforming() => current_mode() == mode_platforming 
function trigger_first_person(world, area) => current_mode() == mode_firstperson && 
                                                current_world() == world &&
                                                current_area() == area

function trigger_changed(memory, value) => memory == value && prev(memory) != value

areas = {
    1: {                                        // Gotou Island
        1: {"Name": "Gotou Island",             //  Mamoshima
            "Fights": {}},
        2: {"Name": "Village of the Gods",      //  Kamimura
            "Fights": {}},
        3: {"Name": "Footsteps Fields",         //  Acid Fields
            "Fights": {
                1: {"Address": 0xf68a, "Par":  8, "Name": "Monsters Are Here!"},
                2: {"Address": 0xf68b, "Par":  8, "Name": "Armband Blocking"},
                3: {"Address": 0xf68c, "Par": 21, "Name": "Two Types of Foes"},
                4: {"Address": 0xf68d, "Par": 11, "Name": "Fight in the Air!"},
                5: {"Address": 0xf68e, "Par":  7, "Name": "Field of Headhunters"},
            }},
        4: {"Name": "Village of the Moon",      //  Tsukimura
            "Fights": {
                1: {"Address": 0xf690, "Par": 23, "Name": "On Another Level"},
                2: {"Address": 0xf691, "Par": 13, "Name": "Don't Get Poisoned!"},
                3: {"Address": 0xf692, "Par": 21, "Name": "A New Color Appears!"},
                4: {"Address": 0xf693, "Par": 18, "Name": "Snake and Bee Hill"},
                5: {"Address": 0xf694, "Par": 18, "Name": "Dragonflies Above"},
            }},
        5: {"Name": "By the Brooklet",          //  Mizusawa Vicinities
            "Fights": {
                1: {"Address": 0xf695, "Par": 13, "Name": "Hill of Snakes"},
                2: {"Address": 0xf696, "Par": 13, "Name": "Rotten Shroom Line"},
                3: {"Address": 0xf697, "Par": 13, "Name": "Headhunter Cliff"},
                4: {"Address": 0xf698, "Par": 16, "Name": "The Green Monsters"},
                5: {"Address": 0xf699, "Par": 21, "Name": "Land and Air Assault"},
                6: {"Address": 0xf69a, "Par": 13, "Name": "Yellow Rotten Shrooms"},
                7: {"Address": 0xf69b, "Par": 30, "Name": "Web Blocking"},
            }},
        6: {"Name": "Overlook Village",         //  Mikoshimura
            "Fights": {
                1: {"Address": 0xf69c, "Par":  8, "Name": "Three Ogre Children"},
                2: {"Address": 0xf69d, "Par": 21, "Name": "Triple Attack"},
                3: {"Address": 0xf69e, "Par":  8, "Name": "Foes Too Fast For You"},
                4: {"Address": 0xf69f, "Par": 27, "Name": "Ogre Shroom Battle"},
                5: {"Address": 0xf6a0, "Par":  8, "Name": "Ogrish Triple Combo"},
                6: {"Address": 0xf6a1, "Par": 17, "Name": "Time Freeze"},
                7: {"Address": 0xf6a2, "Par": 21, "Name": "Blue Bloodlust"},
            }},
        7: {"Name": "Mt. Crown Area",           //  Midake's Island
            "Fights": {
                1: {"Address": 0xf6a4, "Par": 25, "Name": "Lance Striking Pals!"},
                2: {"Address": 0xf6a5, "Par": 30, "Name": "Red and Blue"},
                3: {"Address": 0xf6a6, "Par": 25, "Name": "Earthquake!"},
            }},
    },
    2: {                                        // Motoshima Island
        1: {"Name": "First Village",            //  Hatsumura
            "Fights": {
                1: {"Address": 0xf6a7, "Par": 19, "Name": "Tough Shells"},
                2: {"Address": 0xf6a8, "Par": 14, "Name": "It's Raining Monsters!"},
                3: {"Address": 0xf6a9, "Par": 21, "Name": "Think of the Order!"},
                4: {"Address": 0xf6aa, "Par": 30, "Name": "Ooogre Shroooms"},
                5: {"Address": 0xf6ab, "Par": 36, "Name": "Grave of the Fireflies"},
            }},
        2: {"Name": "The Binding Area",         //  Musubu Vicinities
            "Fights": {
                1: {"Address": 0xf6ac, "Par": 33, "Name": "Wild Dragon Forest"},
                2: {"Address": 0xf6ad, "Par": 16, "Name": "A Swooping Attack"},
                3: {"Address": 0xf6ae, "Par": 24, "Name": "Land of the Greens"},
                4: {"Address": 0xf6af, "Par": 25, "Name": "Cardinal Attacks"},
                5: {"Address": 0xf6b0, "Par": 12, "Name": "Slash 'n Dash Scheme"},
                6: {"Address": 0xf6b1, "Par": 26, "Name": "Man Cutters"},
                7: {"Address": 0xf6b2, "Par": 31, "Name": "Lord of the Flies"},
            }},
        3: {"Name": "Village of Winter",        //  Fuyumura
            "Fights": {
                1: {"Address": 0xf6b3, "Par": 22, "Name": "March of the Sickles"},
                2: {"Address": 0xf6b4, "Par": 19, "Name": "Field of Pagan Buds"},
                3: {"Address": 0xf6b5, "Par": 27, "Name": "The Day of Revival"},
                4: {"Address": 0xf6b6, "Par": 35, "Name": "Monsters, Assemble!"},
            }},
        4: {"Name": "Chronicle Altar",          //  Manai
            "Fights": {
                1: {"Address": 0xf6b7, "Par": 23, "Name": "You Only Got One Shot!"},
                2: {"Address": 0xf6b8, "Par": 10, "Name": "A Trio of Foes"},
                3: {"Address": 0xf6b9, "Par": 29, "Name": "Top to Bottom Foes"},
                4: {"Address": 0xf6ba, "Par": 41, "Name": "Earth Shakedown"},
                5: {"Address": 0xf6bb, "Par": 19, "Name": "Magical Dragonflies"},
                6: {"Address": 0xf6bc, "Par": 19, "Name": "Gleaming Eyes"},
                7: {"Address": 0xf6bd, "Par": 23, "Name": "Yellow Sickles"},
            }},
        5: {"Name": "Boundary Cape",            //  Mt. Amano Vicinities
            "Fights": {
                1: {"Address": 0xf6be, "Par": 18, "Name": "Look Out Below!"},
                2: {"Address": 0xf6bf, "Par": 22, "Name": "Pagan Apparitions"},
                3: {"Address": 0xf6c0, "Par": 24, "Name": "Field of Shelled Bugs"},
                4: {"Address": 0xf6c1, "Par": 36, "Name": "Dodge Bullets!"},
                5: {"Address": 0xf6c2, "Par": 41, "Name": "Dirty Green"},
            }},
        6: {"Name": "Mt. Celestial Area",       //  Misaki
            "Fights": {
                1: {"Address": 0xf6c3, "Par": 11, "Name": "Vertically Small"},
                2: {"Address": 0xf6c4, "Par": 23, "Name": "Into Your Pocket"},
                3: {"Address": 0xf6c5, "Par": 22, "Name": "Wild Dragon Valley"},
                4: {"Address": 0xf6c6, "Par": 22, "Name": "Echoing Thunder"},
                5: {"Address": 0xf6c7, "Par": 15, "Name": "Aerial Onslaught"},
                6: {"Address": 0xf6c8, "Par": 15, "Name": "Don't Let Them Heal!"},
                7: {"Address": 0xf6c9, "Par": 20, "Name": "Floating Apparitions"},
            }},
        7: {"Name": "Southern Gates",           //  South Gate Vicinities
            "Fights": {
                1: {"Address": 0xf6ca, "Par": 15, "Name": "Use Your Mind's Eye!"},
                2: {"Address": 0xf6cb, "Par": 32, "Name": "Earth Shall Tremble"},
                3: {"Address": 0xf6cc, "Par": 18, "Name": "Fearsome Fields"},
                4: {"Address": 0xf6cd, "Par": 14, "Name": "Stray Clouds"},
                5: {"Address": 0xf6ce, "Par": 39, "Name": "Dark Cutting Monsters"},
                6: {"Address": 0xf6cf, "Par": 27, "Name": "Poisonous Snake Hill"},
                7: {"Address": 0xf6d0, "Par": 21, "Name": "Watch Your Step!"},
            }},
        8: {"Name": "Inner Sun Palace",           //  Sun Palace: Inside the Gates
            "Fights": {
                1: {"Address": 0xf6d1, "Par": 34, "Name": "Paralyzing Bullets"},
                2: {"Address": 0xf6d2, "Par": 22, "Name": "Wild Dragon Plains"},
            }},
    },
    3: {                                        // Eastern Land
        1: {"Name": "Region of the Den",        //  Susa
            "Fights": {
                1: {"Address": 0xf6d3, "Par": 15, "Name": "Thunder and Lighting"},
                2: {"Address": 0xf6d4, "Par":  7, "Name": "Scissor Attack"},
                3: {"Address": 0xf6d5, "Par": 11, "Name": "Brutal Claw Strikes"},
            }},
        2: {"Name": "Village of the Den",       //  Susamura
            "Fights": {
                1: {"Address": 0xf6d7, "Par":  7, "Name": "A Monster Duo"},
                2: {"Address": 0xf6d8, "Par": 12, "Name": "Earth and a Sword"},
                3: {"Address": 0xf6d9, "Par": 19, "Name": "Cliffs of the Pagans"},
            }},
        3: {"Name": "Boulder Field",            //  Iwahara
            "Fights": {
                1: {"Address": 0xf6da, "Par":  7, "Name": "Kaboom!"},
                2: {"Address": 0xf6db, "Par": 37, "Name": "Right or Left!?"},
                3: {"Address": 0xf6dc, "Par": 15, "Name": "Hunter of Darkness"},
                4: {"Address": 0xf6dd, "Par": 43, "Name": "Cliffs of the Moles"},
                5: {"Address": 0xf6de, "Par": 16, "Name": "Pleased to Beat You!"},
            }},
        4: {"Name": "Mount Fireblood",          //  Majiri
            "Fights": {
                1: {"Address": 0xf6e1, "Par": 31, "Name": "Hit from a Distance"},
                2: {"Address": 0xf6e2, "Par": 33, "Name": "Look Out, Twice!"},
                3: {"Address": 0xf6e3, "Par": 25, "Name": "In the Dark"},
                4: {"Address": 0xf6e4, "Par": 29, "Name": "Earth Shakedown"},
                5: {"Address": 0xf6e5, "Par": 27, "Name": "Magical Dragonflies"},
                6: {"Address": 0xf6e6, "Par": 30, "Name": "Gleaming Eyes"},
                7: {"Address": 0xf6e7, "Par": 34, "Name": "Yellow Sickles"},
            }},
        5: {"Name": "Mountain Shore",          //  Torai Island
            "Fights": {
                1: {"Address": 0xf6e8, "Par": 20, "Name": "Life-shaving Monsters"},
                2: {"Address": 0xf6e9, "Par": 42, "Name": "Crimson Eyes Gleam"},
                3: {"Address": 0xf6ea, "Par": 37, "Name": "Black n' Blue Fireflies"},
                4: {"Address": 0xf6eb, "Par": 29, "Name": "Evil Dragonflies Strike!"},
                5: {"Address": 0xf6ec, "Par": 24, "Name": "Ogre Bud Cliffs"},
                6: {"Address": 0xf6ed, "Par": 26, "Name": "Hidden Curses"},
                7: {"Address": 0xf6ee, "Par": 16, "Name": "Long Live the Turtle?"},
            }},
        6: {"Name": "The Crossroads",          //  Kusakamura
            "Fights": {
                1: {"Address": 0xf6ef, "Par": 28, "Name": "Dragons These Days"},
                2: {"Address": 0xf6f0, "Par": 32, "Name": "Aerial Monsters"},
                3: {"Address": 0xf6f1, "Par": 13, "Name": "Dark Cutter Valley"},
            }},
        7: {"Name": "Village of the Loft",     //  Minamo
            "Fights": {
                1: {"Address": 0xf6f4, "Par": 12, "Name": "Chain of Explosions"},
                2: {"Address": 0xf6f5, "Par": 12, "Name": "Godhunters of Flame"},
                3: {"Address": 0xf6f6, "Par": 13, "Name": "Slaphappy"},
                4: {"Address": 0xf6f7, "Par": 20, "Name": "Before They Blow Up"},
                5: {"Address": 0xf6f8, "Par": 30, "Name": "No Hurdling Turtles!"},
                6: {"Address": 0xf6f9, "Par": 26, "Name": "One for the Blade"},
            }},
        8: {"Name": "Toraijima Island",        //  Yamabemura
            "Fights": {
                1: {"Address": 0xf6fa, "Par": 22, "Name": "A Storm is Coming"},
                2: {"Address": 0xf6fb, "Par": 16, "Name": "Unseen Foes"},
                3: {"Address": 0xf6fc, "Par": 28, "Name": "Blue and Outta Place"},
            }},
        9: {"Name": "Lake Essence",            //  Nagahima Vicinities
            "Fights": {
                1: {"Address": 0xf700, "Par": 16, "Name": "Under Spoiled Soil"},
                2: {"Address": 0xf701, "Par": 45, "Name": "Explosions Aplenty"},
                3: {"Address": 0xf702, "Par": 31, "Name": "My Spot Got Eaten!"},
                4: {"Address": 0xf703, "Par": 46, "Name": "Humongous Hideout"},
                5: {"Address": 0xf704, "Par": 37, "Name": "Where Do I Begin?"},
                6: {"Address": 0xf705, "Par": 38, "Name": "Yellow Bugs Rock"},
                7: {"Address": 0xf706, "Par": 36, "Name": "Earth Eater Hill"},
            }},
        10: {"Name": "Hillshore Village",      //  Hinomoto
            "Fights": {
                1: {"Address": 0xf707, "Par": 24, "Name": "From the Sky"},
                2: {"Address": 0xf708, "Par": 67, "Name": "Buds and the Bees"},
                3: {"Address": 0xf709, "Par": 37, "Name": "Do Me a Solid!"},
                4: {"Address": 0xf70a, "Par": 25, "Name": "Cliffs of Evil Assembly"},
                5: {"Address": 0xf70b, "Par": 18, "Name": "Hold Your Breath!"},
            }},
    },
    4: {                                        // Sakaki Island
        1: {"Name": "Sakaki Island",            //  Sakaki
            "Fights": {
                1: {"Address": 0xf70d, "Par": 19, "Name": "Glaring Monsters"},
                2: {"Address": 0xf70e, "Par": 21, "Name": "Upward Thrust"},
                3: {"Address": 0xf70f, "Par": 37, "Name": "Hidden Green Creeps"},
                4: {"Address": 0xf710, "Par": 23, "Name": "Don't Let Them Shine!"},
                5: {"Address": 0xf711, "Par": 40, "Name": "Boulder Dropper Valley"},
            }},
        2: {"Name": "Man-eating Swamp",         //  Cannibal's Pond
            "Fights": {
                1: {"Address": 0xf712, "Par": 20, "Name": "Nothing Unnecessary"},
                2: {"Address": 0xf713, "Par": 12, "Name": "Kill the Head!"},
                3: {"Address": 0xf714, "Par": 26, "Name": "Don't Let Them Escape"},
                4: {"Address": 0xf715, "Par": 35, "Name": "False Face"},
                5: {"Address": 0xf716, "Par": 13, "Name": "The Magic Bud Cometh"},
                6: {"Address": 0xf717, "Par": 52, "Name": "Lost Monsters"},
                7: {"Address": 0xf718, "Par": 32, "Name": "Crimson Lancers"},
            }},
        3: {"Name": "Snake Boulder Area",       //  Snake Rock Vicinities
            "Fights": {
                1: {"Address": 0xf719, "Par": 18, "Name": "Crimson Fields"},
                2: {"Address": 0xf71a, "Par": 19, "Name": "Spin, Spin!"},
                3: {"Address": 0xf71b, "Par": 51, "Name": "Unmover Wasteland"},
                4: {"Address": 0xf71c, "Par": 17, "Name": "Poison Trickle"},
                5: {"Address": 0xf71d, "Par": 38, "Name": "Seek Out Monsters!"},
                6: {"Address": 0xf71e, "Par": 39, "Name": "The Pale Valley"},
            }},
        4: {"Name": "Outer Village",            //  Sotomura
            "Fights": {
                1: {"Address": 0xf720, "Par": 21, "Name": "Labyrinth of Curses"},
                2: {"Address": 0xf721, "Par": 33, "Name": "Lost in a Wasteland"},
                3: {"Address": 0xf722, "Par": 18, "Name": "Flaming Grudge Poison"},
                4: {"Address": 0xf723, "Par": 39, "Name": "Push Up!"},
                5: {"Address": 0xf724, "Par": 26, "Name": "God-felling Sickles"},
            }},
        5: {"Name": "Border Slope",             //  ?
            "Fights": {
                1: {"Address": 0xf726, "Par": 31, "Name": "Yonder Monster Valley"},
                2: {"Address": 0xf727, "Par": 41, "Name": "On a Whim"},
                3: {"Address": 0xf728, "Par": 36, "Name": "Red Valley Showdown"},
                4: {"Address": 0xf729, "Par": 40, "Name": "Red Turtle Hill"},
                5: {"Address": 0xf72a, "Par": 38, "Name": "Bright Red Scheme"},
                6: {"Address": 0xf72b, "Par": 26, "Name": "Record of Discharge"},
                7: {"Address": 0xf72c, "Par": 24, "Name": "Beat Spinning Heads"},
            }},
        6: {"Name": "Guiding Fields",           //  ?
            "Fights": {
                1: {"Address": 0xf72d, "Par": 24, "Name": "Too Close for Comfort!"},
                2: {"Address": 0xf72e, "Par": 26, "Name": "Flaming Grudge Hill"},
                3: {"Address": 0xf72f, "Par": 19, "Name": "Stop the Detonator!"},
                4: {"Address": 0xf730, "Par": 21, "Name": "Cut the Red Face!"},
                5: {"Address": 0xf731, "Par": 24, "Name": "Swords and Electricity"},
                6: {"Address": 0xf732, "Par": 48, "Name": "Red Earth Monsters"},
            }},
    },
    5: {                                        // Underworld
        1: {"Name": "The Slopes",               //  Susa Ossary
            "Fights": {
                1: {"Address": 0xf733, "Par": 23, "Name": "Underground Garden"},
                2: {"Address": 0xf734, "Par": 41, "Name": "Fires of Wrath"},
                3: {"Address": 0xf735, "Par": 35, "Name": "Eyes on the Soul"},
                4: {"Address": 0xf736, "Par": 36, "Name": "Doll Haters"},
                5: {"Address": 0xf737, "Par": 30, "Name": "Reviving Apparition"},
                6: {"Address": 0xf738, "Par": 27, "Name": "Helmet Legs Slam"},
            }},
        2: {"Name": "Shrine of the Den",        //  Sand Stream South Side
            "Fights": {
            }},
        3: {"Name": "Northern Sandflows",       //  Within Hades
            "Fights": {
                1: {"Address": 0xf73a, "Par": 55, "Name": "Don't Let it Explode"},
                2: {"Address": 0xf73b, "Par": 20, "Name": "Monsters Descend"},
                3: {"Address": 0xf73c, "Par": 15, "Name": "Double Faces Rock"},
                4: {"Address": 0xf73d, "Par": 25, "Name": "Ogrish Poems"},
                5: {"Address": 0xf73e, "Par": 20, "Name": "An Unseen Location"},
                6: {"Address": 0xf73f, "Par": 54, "Name": "Total Chaos"},
                7: {"Address": 0xf740, "Par": 34, "Name": "The Armband is Key"},
            }},
        4: {"Name": "Remains of the Den",       //  Susa Ossary
            "Fights": {
                1: {"Address": 0xf741, "Par": 34, "Name": "Down in One Hit"},
                2: {"Address": 0xf742, "Par": 13, "Name": "Underworld's Faces"},
                3: {"Address": 0xf743, "Par": 34, "Name": "Look Underground!"},
                4: {"Address": 0xf744, "Par": 21, "Name": "Airborne Monsters"},
                5: {"Address": 0xf745, "Par": 11, "Name": "Trio of Hills"},
                6: {"Address": 0xf746, "Par": 19, "Name": "Red Bloodlust"},
            }},
        5: {"Name": "Southern Sandflows",       //  Sand Stream - South Side
            "Fights": {
                1: {"Address": 0xf748, "Par": 40, "Name": "Find the Monsters!"},
                2: {"Address": 0xf749, "Par": 19, "Name": "Furtive Magic Earth"},
                3: {"Address": 0xf74a, "Par": 15, "Name": "Cut the Double Faces"},
                4: {"Address": 0xf74b, "Par": 25, "Name": "That's What I Call Fast"},
                5: {"Address": 0xf74c, "Par": 45, "Name": "Think Before You Act"},
            }},
        6: {"Name": "Underworld",               //  ?
            "Fights": {
                1: {"Address": 0xf74f, "Par": 11, "Name": "It's a Toss Up"},
                2: {"Address": 0xf750, "Par": 30, "Name": "They're Under You"},
                3: {"Address": 0xf751, "Par": 55, "Name": "Clump of Dust Cliffs"},
                4: {"Address": 0xf752, "Par": 45, "Name": "Snaking Path"},
                5: {"Address": 0xf753, "Par": 25, "Name": "Big Lance Explosions"},
                6: {"Address": 0xf754, "Par": 28, "Name": "Bumpy Hill Monsters"},
                7: {"Address": 0xf755, "Par": 35, "Name": "Life-suckers"},
            }},
    },
}

function current_location() => current_world() * 100 + current_area()
locations = {
    100: "Mikajima Island",
    200: "Mikajima Island",
    300: "Mikajima Island",
    400: "Mikajima Island",
    500: "Mikajima Island",
    602: "Heavenly Realm",
    600: "Epilogue",
    616: "Epilogue",
    618: "Epilogue",
}

area_names = {
    1: "Gotou Island",
    2: "Motoshima Island",
    3: "Eastern Land",
    4: "Sakaki Island",
    5: "Underworld",
    6: "Heavenly Realm"
}

for chapter in areas {
    chapter_data = areas[chapter]
    for area in chapter_data {
        locations[chapter * 100 + area] = area_names[chapter] + ": " + chapter_data[area]["Name"]
    }
}

rich_presence_conditional_display(current_chapter() == 0, "Titles")

rich_presence_conditional_display(current_world() > 6, "Epilogue | Lv{1} | {2} Gems | {3} Total Magatama | Ch{4} | {5}",
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Level", current_level()),
    rich_presence_value("Gems", current_gems()),
    rich_presence_value("Magatama", total_magatama()),
    rich_presence_value("Chapter", current_chapter()),
    rich_presence_value("Time", bcd(time_hours()) * 60 + bcd(time_minutes()), format="MINUTES")
)

rich_presence_display("{0} | Lv{1} | {2} Gems | {3} Total Magatama | Ch{4} | {5}",
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Level", current_level()),
    rich_presence_value("Gems", current_gems()),
    rich_presence_value("Magatama", total_magatama()),
    rich_presence_value("Chapter", current_chapter()),
    rich_presence_value("Time", bcd(time_hours()) * 60 + bcd(time_minutes()), format="MINUTES")
)

// ==========================

function get_counter_addresses(chapter)
{
    addresses = []
    for area in areas[chapter]
    {
        fights = areas[chapter][area]["Fights"]
        for fight in fights
            array_push(addresses, fights[fight]["Address"])
    }
    
    return addresses
}

chapter_counter_addresses = {}
for chapter in areas
    chapter_counter_addresses[chapter] = get_counter_addresses(chapter)

// F53E:01 - enter Village of the Gods
// F556:0A - approach forest in 1-2
// F556:0B - see house on fire
// F556:0C - wake up after house fire
// F556:0D - fight the battle between the gate guards
// F556:0E - talk to Wadachi about the tower
// F556:0F => 12 - path to chapter two open after defeating shroom
// F558:05 => 06 - complete the whack-a-mole game
// F558:07 - collect Chronicle Mirror
// F558:08 - return Chronicle Mirror to island
// F558:09 - ?
// F558:09 => 0B -> destroy Sun Palace
// F558:0C - Sun Palace destroyed 
// F55A:05 - number of steps taken after leaving the Village of the Den 
// F55A:08 - talk to Kai (Hilltop Village)
// F55A:09 - Woku rqeuests you return to Village of the Loft.
// F55A:15 - deliver brain to Karabito
// F55C:0D - play flute
// F55C:0E - arrive in underworld
// F55C:0F - destroy first pole
// F55C:10 - first ghost appears
// F55C:11 - destroy second pole
// F55C:12 - second ghost appears
// F55C:13 - destroy third pole
// F55C:14 - third ghost appears
// F55C:15 - destroy fourth pole
// F55C:16 - fourth ghost appears
// F55C:17 - talk to Seiryuu
// F55C:18 - engage Ocean God
// F55C:19 - defeat Ocean God
// F55C:1D - defeat first dragon
// F55C:1E - first dragon statue destroyed
// F55C:1F - defeat second dragon
// F55C:20 - second dragon statue destroyed
// F55C:21 - defeat third dragon
// F55C:22 - third dragon statue destroyed
// F55C:23 - defeat fourth dragon
// F55C:24 - fourth dragon statue destroyed
// F55C:25 - defeat eighth dragon
// F55C:26 - defeat eighth dragon
// F55C:27 - collect eye of the dragon

// F592:01 - talk to Miko about Fire Bag
// F592:02 - retrieve Fire Bag
// F592:03 - use Fire Bag to destroy mushrooms
// F592:04 - rescue and name Woku
// F592:05 - collect the Armband
// F592:06 - start Armband training
// F592:07 - West Gate Guard moves out of way
// F592:08 - fight battle
// F592:09 - East Gate Guard moves out of way
// F592:10 - talk to Father about using Fire against Mushrooms
// F592:11 - talk to Miko about using Fire against Mushrooms
// F592:12 - collect the Fire God from Mt. Crown
// F592:13 - use Fire God near Overlook Village
// F592:14 - defeat Demon Shroom
// F592:15 - ???
// F592:16 - talk to Ido about the four warriors
// F594:01 - talk to Wadachi about the tower
// F596:01 - Woku tells how to get past mushrooms
// F598:01 - talk to Okami ??
// F598:02 - talk to Okami about Nami
// F598:04 - talk to Wakoto about magatama (Village of the Moon west house)
// F598:05 - talk to Wakoto near gate to Mikajima Island
// F59C:01 - interact with first bronze bell
// F59C:02 - learn to use Wind God
// F59E:01 - collect the ointment from the old man's house in 1-1
// F59E:02 - talk to mayor (Villiage of the Moon north house)
// F5A0:01 - Let Woku get in the red lake
// F5A0:02 - Don't let Woku get in the red lake
// F5A2:01 - get healed in Village of the Gods
// F5A4:01 - talk to woman about wall of ice
// F5A4:02 - read sign
// F5A4:03 - get revival orb
// F5A6:02 - talk to mayor about Chronicle Mirror
// F5A8:01 - complete first training
// F5AC:01 - talk to man in first village about sun
// F5AE:02 - talk to man near ice wall
// F5B0:01 - able to fly with Woku
// F5B2:01 - collect the Memento Sword
// F5B2:02 - collect the Hermit's Sword
// F5B2:03 - collect the Yatsuka Blade
// F5B4:02 - learn Upward Thrust
// F5B4:03 - learn Downward Thrust
// F5B6:01 - talk to old man in southwestern hut (Village of Winter)
// F5B6:02 - talk to man in southeastern hut (Village of Winter)
// F5B6:03 - collect liquor (Village of Winter)
// F5B6:04 - give liquor to hermit (Mt. Celestial Area)
// F5B6:06 - talk to old lady (Village of Winter)
// F5B6:07 - find hermit's sword (Boundary Cape second cave)
// F5B6:08 - defeat bird (just before meeting sister goddess)
// F5B6:09 - destroy Sun Palace
// F5B8:02 - liquor available (Village of Winter)
// F5BA:01 - collect the Fire God (Mt. Crown)
// F5BC:01 - talk to man in westmost hut (Village of Winter)
// F5BE:01 - return mirror to island (Chronicle Altar)
// F5C0:01 - talk to woman in southern hut (Southern Gates)
// F5C4:01 - talk to man in northwestern hut (Southern Gates)
// F5C6:01 - deliver the hermit's Sword (Mt. Celestial Area)
// F5CC:01 - collect Chronicle Mirror (Binding Area hole)
// F5D2:01 - agree to rescue sister, agree not to tell on guard (seems to remember last Yes[1]/No[0])
// F5D6:03 - talk to old woman in northwest hut (Village of the Den)
// F5D4:01 - fall into hole (Village of the Den)
// F5D4:02 - talk to Karabito (Torajima Island)
// F5D4:04 - heal Woku
// F5D4:05 - talk to Musaku (Village of the Loft)
// F5D4:06 - talk to Kai (Lake Essence)
// F5D4:07 - talk to Kai (Hilltop Village)
// F5D4:08 - wake up to scream (Hilltop Village)
// F5D4:0A - learn Upward Thrust
// F5D4:0B - collect jar
// F5D4:0C - defeat Phantom
// F5D4:0D - deliver brain to Karabito
// F5D4:10 - give medicine to Aki
// F5D4:11 - get boat
// F5D6:01 - say you're not going to rescue sister
// F5D8:01 - find Large Ointment (Village of the Den)
// F5DA:01 - talk to Miko (Mikajima Island)
// F5DA:04 - talk to Miko (Mikajima Island)
// F5E0:NN - number of times spoke to the upperleft residents of Hilltop Village
// F5E2:NN - number of times spoke to the upperright residents of Hilltop Village
// F5E4:NN - number of times spoke to the lowerleft residents of Hilltop Village
// F5E6:01 - find dead body in tower outside Sun Palace
// F5E8:01 - talk to man about Binding hole
// F5E8:03 - put brain in jar
// F5F2:01 - get firewood bag from Watari
// F5F2:02 - get 10x firewood from Watari
// F5F2:03 - learn Upward Thrust
// F5F4:1000 0000 - defeat Gloom Dragon
// F5F4:0100 0000 - defeat Evil Dragon
// F5F4:0010 0000 - defeat Army Dragon
// F5F4:0001 0000 - defeat Elder Dragon
// F5F4:0000 1000 - defeat Killer Dragon
// F5F4:0000 0100 - defeat Aquatic Dragon
// F5F4:0000 0010 - defeat Yellow Dragon
// F5F4:0000 0001 - defeat Green Dragon
// F5F5:0000 1000 - destroy fourth pole (Slopes cave)
// F5F5:0000 0100 - destroy third pole (Slopes cave)
// F5F5:0000 0010 - destroy second pole (Slopes cave)
// F5F5:0000 0001 - destroy first pole (Slopes cave)
// F5F6:01 - enter Mikajima Island
// F5F8:01 - talk to prophet in southeast hut (Outer Village)
// F5FC:05 - talk to prophet in right northeast hut (Outer Village)
// F5FC:06 - agree to talk to Maya's parents
// F5FE:01 - talk to girl in left northeast hut (Outer Village)
// F600:01 - agree to talk to Maya's parents
// F600:03 - talk to Maya's mother (Underworld)
// F600:05 - tell Maya about mother
// F606:01 - talk to Suzaku (Slopes)
// F608:01 - talk to King Goza's ghost (Shrine of the Den)
// F608:02 - King Goza's ghost leaves
// F60A:01 - talk to Byakku (Slopes)
// F60C:01 - talk to Genbu (Slopes)
// F60E:01 - talk to Seiryuu (Slopes)
// F610:1000 0000 - get firewood from Watari
// F610:0100 0000 - attempt to destroy green mushrooms that regrow
// F610:0010 0000 - complete three circles trial (Underworld)
// F610:0001 0000 - enter Mt. Crown cave
// F610:0000 1000 - enter Mikajima Island
// F610:0000 0100 - learn to stop falling
// F611:01 - get to castle in the sky
// F612:02 - get medicine from Karabito
// F614:01 - rescue and name Woku
// F618:01 - Woku swims in red lake
// F618:02 - Woku swims in green lake
// F618:03 - Woku swims in yellow lake
// F618:04 - Woku swims in blue lake
// F61A:01 - talk to Old Woman (Village of the Moon south house)
// F61C:02 - get revival orb from girl (Village of the Loft elder's house)
// F61E:02 - talk to Matagi (man with dog 1-4)
// F620:01 - Let Woku get in the green lake
// F620:02 - Don't let Woku get in the green lake
// F622:01 - Let Woku get in the yellow lake
// F624:01 - Let Woku get in the blue lake
// F626:01 - talk to man guarding cave, find out about man who went inside (Crossroads)
// F626:01 - talk to boy in southwest hut (Outer Village)
// F626:02 - talk to man in southwest hut (Outer Village)
// F628:01 - talk to Miko (Mikajima Island)
// F62A:01 - stay the night in empty hut (Region of the Den)
// F62A:02 - rescue guy trapped by weeds [could not afford kimono] (Snake Boulder Area)
// F62A:03 - rescue guy trapped by weeds [chose not to buy kimono] (Snake Boulder Area)
// F62A:04 - rescue guy trapped by weeds [buy kimono] (Snake Boulder Area)
// F62A:06 - woku wants to see mirror (Region of the Den)
// F62A:07 - Woku sees her human self in mirror (Region of the Den)
// F62E:XX - level?
// F630:02 - get to sky castle
// F632:01 - defeat Green Dragon
// F634:01 - defeat Yellow Dragon
// F636:01 - defeat Aquatic Dragon
// F638:01 - defeat Killer Dragon
// F63A:01 - defeat Elder Dragon
// F63C:01 - defeat Army Dragon
// F63E:01 - defeat Evil Dragon
// F640:01 - defeat Gloom Dragon
// F644:01 - talk to northwest ghost (Shrine of the Den)
// F646:01 - talk to old lady in Mountain Short hut
// F648:01 - collect Goddess Crystal
// F64A:01 - talk to Maya's mother (Underworld)
// F64E:01 - buy kimono

// F650:01 - talk to Wakoto about magatama (Village of the Moon west house)

// F652:1000 0000 - collect thirtysixth teardrop (Mt. Celestial Area cave 2 - lower right)
// F652:0100 0000 - collect thirtyninth teardrop (Mt. Celestial Area cave 2 - lower mid)
// F652:0010 0000 - collect thirtyseventh teardrop (Mt. Celestial Area cave 2 - upper left)
// F652:0001 0000 - collect twentysixth teardrop (Village of the Moon cave 3 east - top middle)
// F652:0000 1000 - collect twentyseventh teardrop (Village of the Moon cave 3 east - middle left)
// F652:0000 0100 - collect twentyfourth teardrop (Village of the Moon cave 3 west - top middle)
// F652:0000 0010 - collect twentyfifth teardrop (Village of the Moon cave 3 west - middle right)
// F652:0000 0001 - collect twentythird teardrop (Village of the Moon cave 3 - bottom middle)
// F653:1000 0000 - collect fortyseventh teardrop (Mount Fireblood island cave east - upper right)
// F653:0100 0000 - collect fortyeighth teardrop (Mount Fireblood island cave east - upper right)
// F653:0001 0000 - collect fortyninth teardrop (Mount Fireblood island cave east - middle left)
// F653:0000 1000 - collect twentysecond teardrop (Outer Village cave - lower left)
// F653:0000 0100 - collect fourtysixth teardrop (Mount Fireblood island cave - lower right)
// F653:0000 0010 - collect fortyfirst teardrop (Mt. Celestial Area cave 2 west - upper left)
// F653:0000 0001 - collect thirtyeighth teardrop (Mt. Celestial Area cave 2 - lower/mid left)
// F654:1000 0000 - collect tenth teardrop (Boundary Cape second cave - top middle)
// F654:0100 0000 - collect thirtyfifth teardrop (Boundary Cape third cave - lower left)
// F654:0010 0000 - collect seventh teardrop (Boundary Cape cave - middle left)
// F654:0001 0000 - collect thirteenth teardrop (Inner Sun Palace - battle scene)
// F654:0000 1000 - collect fourteenth teardrop (Region of the Den crossing - lower left)
// F654:0000 0100 - collect fourtythird teardrop (Chronicle Altar path 2 - upper right)
// F654:0000 0010 - collect fortysecond teardrop (Chronical Altar path - middle right)
// F654:0000 0001 - collect twentyninth teardrop (First Village under house - top middle)
// F655:1000 0000 - collect fortyfifth teardrop (Crossroads cave - lower right)
// F655:0100 0000 - collect seventeenth teardrop (Crossroads cave - middle top)
// F655:0010 0000 - collect sixth teardrop (Mt. Crown cliffs - upper left)
// F655:0001 0000 - collect fourth teardrop (Mt. Crown case - upper left)
// F655:0000 1000 - collect second teardrop (Mt. Crown cave - breakable ledge)
// F655:0000 0100 - collect twentyfirst teardrop (Mount Fireblood third area - top left)
// F655:0000 0010 - collect nineteenth teardrop (Mount Fireblood second area - top right)
// F655:0000 0001 - collect twentieth teardrop (Mount Fireblood second area - top left)
// F656:1000 0000 - collect fourtieth teardrop (Mt. Celestial Area cave 2 west - top right)
// F656:0100 0000 - collect fourtyfourth teardrop (Chronicle Altar path 2 - upper right)
// F656:0010 0000 - collect thirtieth teardrop (Village of Winter cave - middle left)
// F656:0001 0000 - collect thirtyfirst teardrop (Village of Winder cave - middle)
// F656:0000 1000 - collect thirtysecond teardrop (Village of Winder cave - middle)
// F656:0000 0100 - collect thirtythird teardrop (Village of Winder cave - middle)
// F656:0000 0010 - collect eighteenth teardrop (Crossroads second cave - middle)
// F656:0000 0001 - collect sixteenth teardrop (Crossroads cave - middle left)
// F657:1000 0000 - collect twentyeighth teardrop (First Village under house - top middle)
// F657:0100 0000 - collect first teardrop (1-4 first stairs)
// F657:0010 0000 - collect twelfth teardrop (Chronicle Altar - lake path)
// F657:0001 0000 - collect eleventh teardrop (Binding Area hole - lower right)
// F657:0000 1000 - collect ninth teardrop (Boundary Cave second cave - middle)
// F657:0000 0100 - collect thirtythird teardrop (Boundary Cape third cave - bottom left)
// F657:0000 0010 - collect eighth teardrop (Boundary Cave cave - upper left)
// F657:0000 0001 - collect fifth teardrop (Mt. Crown cliffs - middle right)
// F658:0000 0001 - collect third teardrop (Mt. Crown cave - middle)
// F65A:0010 0000 - collect small ointment (Mt. Crown cave - breakable ledge)
// F65A:0001 0000 - collect small ointment (Boundary Cape cave - middle right)
// F65A:0000 1000 - collect small ointment (Boundary Cape cave - upper left)
// F65A:0000 0100 - collect small ointment (1-3 fall catch training)
// F65A:0000 0010 - collect small ointment (Mt. Crown cliffs - middle)
// F65A:0000 0001 - collect small ointment (Mt. Crown cave - middle right)
// F65B:0000 1000 - collect small ointment (Village of the Den hole - upper right)
// F65B:0000 0100 - collect small ointment (Man-eating Swamp cave - middle left)
// F65B:0000 0010 - collect small ointment (Binding Area hole - bottom left)
// F65B:0000 0001 - collect small ointment (Binding Area hole - upper left)

// F65E:1000 0000 - collect large ointment (Castle in the Sky 2 - middle left)
// F65E:0100 0000 - colelct large ointment (Castle in the Sky 2 - upper right)
// F65E:0010 0000 - collect large ointment (Castle in the Sky 1 - upper left)
// F65E:0000 1000 - collect large ointment (Crossroads second cave - middle right)
// F65E:0000 0010 - collect large ointment (Boundary Cape cave - upper left)

// F65F:0000 1000 - collect large ointment (Mt. Celestial area cave 2 west - middle left)
// F65F:0000 0100 - collect large ointment (Mt. Celestial area cave 2 west - upper left)
// F65F:0000 0001 - collect large ointment (Border Slope cave - middle)

// F662:1000 0000 - collect Fire God (Crossroads second cave - upper right)
// F662:0010 0000 - collect Fire God (Village of the Den hole - middle left)
// F662:0000 1000 - collect Fire God (Sun Palace - lower left)
// F662:0000 0100 - collect Fire God (Snake Boulder Area cave 2 - upper right)
// F662:0000 0010 - collect Fire God (Binding Area hole - middle left)

// F663:0000 0010 - collect Fire God (Underword Cave - upper middle)

// F666:1000 0000 - collect Wind God (Village of the Den hole - middle left)
// F666:0100 0000 - collect Wind God (Sun Palace second area - upper left)
// F666:0001 0000 - collect Wind God (Boundary Cape cave - upper right)
// F666:0000 1000 - collect Wind God (Outer Village cave - upper right)
// F666:0000 0100 - collect Wind God (Mt. Crown Cave - near second teardrop)
// F666:0000 0010 - collect Wind God (Mt. Crown cave - bottom right)
// F666:0000 0001 - collect Wind God (Mt. Crown cave - entrance)

// F667:0000 0100 - collect Wind God (Outer Village cave - bottom right)

// F66A:0100 0000 - collect Bolt God (Mount Fireblood island cave - middle right)
// F66A:0000 1000 - collect Bolt God (Binding Area hole - bottom left)
// F66A:0000 0100 - collect Bolt God (Snake Boulder Area cave - top middle)
// F66A:0000 0010 - collect Bolt God (Boundary Cape cave - lower left)
// F66A:0000 0001 - collect Bolt God (Boundary Cape cave - upper left)

// F66B:0100 0000 - collect Bolt God (Castle in the Sky 1 - upper right)
// F66B:0001 0000 - collect Bolt God (Southern Sandflows Cave 2 - middle right)
// F66B:0000 0100 - collect Bolt God (Underworld Cave 2 - upper right)
// F66B:0000 0001 - collect Bolt God (Mount Fireblood - lower left)

// F66C:0000 0001 - collect Bolt God (Mt. Celestial Area cave 2 - middle left)

// F66D:1000 0000 - collect Bolt God (Slopes Cave - behind second pillar)

// F66E:0100 0000 - collect Falcon Wing (Mount Fireblood - upper right)
// F66E:0001 0000 - collect Falcon Wing (Crossroads cave - upper right)
// F66E:0000 0010 - collect Falcon Wing (Binding Area hole - middle left)

// F676:0001 0000 - collect Time God (Mount Fireblood second area - bottom right)
// F676:0000 0100 - collect Time God (Village of the Den hole second area - bottom right)
// F676:0000 0010 - collect Time God (Chronicle Altar path - middle)

// F67A:1000 0000 - collect antidote (Crossroads cave - lower left)
// F67A:0100 0000 - collect antidote (Crossroads cave - lower left)
// F67A:0000 0100 - collect antidote (Boundary Cape second cave - middle right)

// F67B:0000 0001 - collect antidote (Snake Boulder area forest - bottom middle)

// F67E:1000 0000 - collect small spirit pill (Crossroads cave - upper right)
// F67E:0100 0000 - collect small spirit pill (First Village under house - bottom left)
// F67E:0010 0000 - collect small spirit pill (Sun Palace second area - upper left)
// F67E:0001 0000 - collect small spirit pill (Sun Palace - middle)
// F67E:0000 0100 - collect small spirit pill (Binding Area hole - lower right)
// F67E:0000 0010 - collect small spirit pill (Binding Area hole - lower right)
// F67E:0000 0001 - collect small spirit pill (Boundary Cape second cave - low middle)

// F682:1000 0000 - collect large spirit pill (Castle in the Sky 2 - lower right)
// F682:0010 0000 - collect large spirit pill (Village of the Moon Cave 3 west - middle right)
// F682:0001 0000 - collect large spirit pill (Underworld Cave 2 - lower left)
// F682:0000 1000 - collect large spirit pill (Underworld Cave 2 - upper middle)
// F682:0000 0100 - collect large spirit pill (Mount Fireblood third area - bottom right)
// F682:0000 0010 - collect large spirit pill (Mount Fireblood - top middle)
// F682:0000 0001 - collect large spirit pill (Chronicle Altar path - middle left)

// F683:0000 0100 - collect large spirit pill (Outer Village Cave - top middle)
// F683:0000 0001 - collect large spirit pill (Castle in the Sky 3 - left)


// [[NEW GAME]]
// Enter hut, talk to Nami
// Enter SE hut, talk to Okami
// Talk to Ido at the beach, complete training
// Return home, look right twice, and take the Memento Sword
achievement("Hierloom", "Collect the Memento Sword", 2,
    trigger = trigger_first_person(1, 1) && trigger_changed(byte(0xf5b2), 1)
)
// Return to SE Hut, talk to Okami
// Head north, chop the grass, talk to the Bell to save
// Head north into new area

// [[Village of the Gods]]
// Head west and north up the hill
// Kill the shrooms, name Woku, learn to fly and leave
// Head north to the Village of the Gods
// Immediately leave and return to Gotou Island (leave to the south)

// [[Gotou Island]]
// Skip through the cutscene and agree to rescue your sister
// Go into the northeastern hut, look right twice, and search to find Ointment
// Go north to the bridge and complete the armband training
// Go north into the next area

// [[Village of the Gods]]
// Proceed east to the next area

// [[Footsteps Fields]]
// Talk to the West Gate Guard
// Complete the battle
// Talk to the East Gate Guard
achievement("Beyond the Gates", "Make it past both guards", 3,
    trigger = trigger_first_person(1, 3) && trigger_changed(byte(0xF592), 9)
)
// Go up the hill just to the right of the gate and step on the circle
// Walk off the cliff and learn how to stop falling, work way through level to the right
// Walk north into the next section

// [[Village of the Moon]]
// Talk to the guy with the dog
// Jump north off the cliff and walk through the fence
// Talk to Wakoto in the western house
// Leave the town to the southeast and enter the first stairs behind the northern bushes
// Collect [TEARDROP 1]
// Kill the remaining enemies (heal at the bell - doing so also cures poison), then head east

// [[By the Brooklet]]
// Walk all the way to the right and speak to the man at the tower
// Walk up to the left and talk to Wakoto again
// Step into the ring of stones

// [[Mikajima Island]]
// Talk to Miko
// ((SAVE 1 - Lv5 0:59))
// Step in the upper left stone circle to go back

// [[By the Brooklet]]
// Go north

// [[Overlook Village]] (Lv5)
// Go west to the red lake
achievement("A Change of Color", "Take Woku to the red lake", 3,
    trigger = trigger_first_person(1, 6) && trigger_changed(byte(0xF5A0), 1)
)
// Go all the way east, then north to the village. (There's a bell just west of the village)
// Enter the right hut, pan right, and talk to the man.
// Return all the way back to Mikajima Island (south, then into the stone circle).

// [[Mikajima Island]]
// Talk to Miko
// Return back to Overlook Village
// Spend some time levelling up near the bell - get to at least level 8

// [[Mt. Crown Area]] (Lv8)
// Go west and into the cave
// Learn how to use the Wind God item
// Head right, up, then left to the skeleton
// Crawl into the left hole. As you fall, have Woku grab you. Keep doing that as you go to the right to collect a Wind God
// Go back to the skeleton and continue up the left side
// Stand on the first step and face left. Use shots to break the ledge so you can collect the Small Ointment
// Stand on the second step. High jump and go left one space so you can shoot the second ledge
// Collect [TEARDROP 2]
// Climb up the steps and drop into the first hole after the tallest step
// Crouch and walk right to collect the [TEARDROP 3] and a Wind God
// Drop down, walk left past the skeleton, up the left side and over all the steps to the right
// Drop into the final hole, crouch, walk right, and go up
// Just above the two mushrooms, crouch and then fly into the gap
// Break the wall and head left
// Break the next wall and kill the mushroom. DO NOT kill the other mushrom
// Instead, jump on it's head, then high fly up to the left ledge.
// Jump across, drop into the hole, and use Woku to kill the mushroom
// Crouch to the right to get [TEARDROP 4]
// Crouch fly out of the hole, kill the last mushroom, then head back to the right
// Jump up the ledges and go right into the next area
// Follow the path until you can see the next teardrop
// From the tall ledge to the left, crouch fly into the hole to collect [TEARDROP 5]
// Continue left and drop into the hole
// Go right and follow the path around.
// As you're climbing up the left side, crouch and walk into the tunnel behind the second Evilbringer
// Collect [TEARDROP 6]
// Continue up the cliff and right to return to the overworld
// Step on the circle, look right, and search to find the Fire God
// Leave the area and return to the east

// [[Overlook Village]] (Lv9)
// ((SAVE 2 - Lv9 1:50 | Lv10 1:29))
// Return to the village (upper right area of map) and head north
// Use the Fire God on the mushrooms
// Fly up the cliff and jump into the boss battle
// You can only hurt it when it's eyes are open, so defend until then
// If it backs you too close to the edge, high jump over it
achievement("Fungal Deflection", "Defeat the Demon Shroom", 5,
    trigger = trigger_platforming() && current_area() == 6 &&
              byte(0xF592) == 0x14 && prev(byte(0xF592)) == 0x13
)
// Head north into the next area

// [[First Village]]
// Walk north around the trees and east to the village
// Enter the northwest house and talk to the mayor about the Chronicle Mirror
// Enter the northernmost house and talk to the woman on the right about the Wall of Ice
// Continue east to the next area

// [[The Binding Area]]
// There's a save bell in the southeast
// Talk to the man about the Binding hole
// Follow the path to the next area(north)

// [[Chronicle Altar]]
// Talk to the man near the ice wall
// Work your way west to the next area

// [[Village of Winter]]
// Head west to the village
// Enter the leftmost hut and talk to the man
// Enter the southwest hut and talk to the old man
// Enter the southeast hut and talk to the man
// Enter the northern hut and talk to the woman on the right
// Pay 30 jewels for some liquor, then pan left twice to take it
// Go back east to the Chronicle Alter, then north to Mt. Celestial Area

// [[Mt. Celestial Area]]
// Go north to the green lake (nearest save is west)
// ((SAVE 3 - Lv14 2:56 | Lv13 2:23)) - go east to Mt. Celestial Area [Navin save does not have liquor]
achievement("It Ain't Easy Being Green", "Take Woku to the green lake", 3,
    trigger = trigger_first_person(2, 6) && trigger_changed(byte(0xF620), 1)
)
// Enter the cave east of the house (Celestial Rock)
// Look left twice and give the liquor to the hermit
// Go west to the next area

// [[Boundary Cape]]
// Head all the way west, then south along the coast (cutting through the bushes) and back 
// east until you can leave the area to the south

// [[Village of Winter]]
// Climb up the ladder and cut through the bushes so you can enter the hut
// Talk to Kutsue
// Leave and return north to Boundary Cape

// [[Boundary Cape]]
// Backtrack through the forest to the two rocks and step between them
// Slash the mole and watch the next two moles appear
// Slash them in order and three will appear
// Slash them in order and four will appear
// Slash them in order and five will appear
// Slash them in order and six will appear
// Slash them in order and one will appear by the water
// Slash it and a cave will appear
achievement("Whack-a-mole", "Convince the messengers of the earth to reveal the underground path", 2,
    trigger_overworld() && byte(0xF558) == 6 && prev(byte(0xF558)) == 5
)
// Enter the cave
// Walk down the steps until you're standing next to the long blue pillar
// Fire two shield shots straight up and a teardrop will fall [TEARDROP 7]
// Crouch left behind the circle blocks for a Bolt God
// Work your way right across the floor. To kill the moles, wait until they're under you, then
//   step to the side so they pop up.
// Jump up the cliffs and grab the small ointment, then head left
// Go behind the waterfalls to collect [TEARDROP 8]
// Continue to the right, watching out for the underground enemies and the trick floors (you can't
//   stand on the squares with the circle inlays)
// Once you reach the top right, head right to leave the cave
// Follow the path to the next cave
// Go right. Woku will find a berry and spend several turns eating it. Just advance time since you can't jump out
// Keep going right to the next area
// Drop to the lowest floor and go all the way right
// Climb up the blue squares and float left
// Crouch and go left to find an antidote
// Climb up and use a crouching jump to go right
// Jump up two blue squares and head left, drop once, then fly across the small gap
// Kill the two snakes and collect [TEARDROP 9]
// Walk left, fall, then go a bit right to collect the small spirit pill
// Go all the way back to the right and up as high as you can to collect a Wind God behind a circle square
// Fly left, releasing and grabbing Woku to make it to the middle platform where you'll find [TEARDROP 10]
// Work your way up and left to find a large ointment
// Work your way back to the right wall and up to the first blue block (just past where you had to squat-jump)
// Stand on the lowermost blue block and break the walls. Head right into the next area
// Walk right and find the hermit's sword. You'll automatically get kicked out of the cave
// Go back to the first cave
// Head all the way left to find another small ointment
// Jump down to the left and use Woku to land in the alcove for a Bolt God
// Drop down and leave left
// ((SAVE 4 - Lv18 4:26 | Lv17 3:15))
// Work your way east into the next area

// [[Mt. Celestial Area]]
// Enter the hermit's cave, look left twice, and talk to him.
achievement("It's Your Sword Now", "Return the hermit's sword to him", 3,
    trigger = trigger_first_person(2, 6) && trigger_changed(byte(0xF5C6), 1)
)
// Learn the Falling Leaf Slice
// Go south to Chronicle Altar, then south again to The Binding Area

// [[The Binding Area]]
// Chop through the stumps and approach the man at the campfire
// Talk to the man to learn how to make campfires
// Walk west and north and chop through the trees to the big hole and jump in
// Walk left off the cliff, floating into the left cavity to get a Fire God
// Step right and fall to the ledge, then left and fall to the Mirror
// Break the right wall and fall again, floating to the left
// Break the left wall twice to collect a Bolt God
// Float off the ledge to the right and work your way right for two small spirit pills
// Jump over the left ledge and crouch into the tunnel for [TEARDROP 11]
// Use woku to kill the second bouldering from a distance. She'll recover at the raspberry while you kill the first
// Use woku to kill the third bouldering in a similar manner.
// Work your way up the left side of the cave, grabbing the Small Ointment on the way up and using woku to kill the plants
// When you get to the point where you have to break the wall to climb, stop and fire the shield up to get a Falcon Wing
// Collect the small ointment at the top and head left into the next area.
// Float over the spikes and continue left to return to the overworld.
// Proceed north into Chronicle Altar

// [[Chronicle Altar]]
// Chop through the stumps and step on the circle
// Use woku to kill the flying enemy, then step on the other enemy so you can get up to [TEARDROP 12]
// Continue through the area to return to the overworld
// Place the mirror on the altar
achievement("End of Winter", "Return the Chronicle Mirror to its altar", 3,
    trigger = trigger_overworld() && trigger_changed(byte(0xF5BE), 1)
)
// Go back across the water, then east to the next area

// [[Southern Gates]]
// Talk to the woman in the southern hut
// Continue north and talk to the man in the second hut
// Work your way around the forest until you reach the next area

// [[Inner Sun Palace]]
// Step on the circle to enter a platforming section
// Collect [TEARDROP 13] near the end of the stage
// ((SAVE 5 - Lv 20 5:07 | Lv19 4:06))
// Proceed up the hill and explore the tower to find a dead body
// Enter the palace
// Use the enemy to jump up to the first ledge and collect the Fire God
// Squat fly over the yellow bouncer and the red bouncer
// Use the second yellow bouncer and go left to collect the small spirit pill
// Squat jump over the ledge and use the next yellow bouncer
// Continue left to the green bouncer
// Go right, flying over the first green bouncer and using the second
// Use a Fire God or Wind God to take out the row of boulderings below you
// Continue right into the next area
// Work your way up the platforms and to the left side at the top
//  Tall jump between the shooters and one will kill the other
//  Then cast shield before tall jumping. The shield will absorb the attack, then approach and strike
// Climb up the left wall and squat float to the right for a small spirit pill
// Fall down and go across the large gap using a normal float/catch/float
// Go right, then up, and all the way left for a Wind God
// Go all the way right to the next area
// Boss fight! Hit the beak when it attacks the center of the first targeted area
achievement("Beak Smacker", "Defeat the giant bird", 5,
    trigger = trigger_platforming() && current_life() > 0 &&
              current_area() == 8 && current_subarea() == 5 &&
              prev(byte(0x04E3)) > 0 && prev(byte(0x04E4)) == 0 && // from positive value (less than 256)
              (word(0x04E3) == 0 || byte(0x04E4) == 0xFF)          // to 0 or negative value
)
// Get [TEARDROP 14] from sister goddess
// Go down the hill to the right and east into the next area

// [[Region of the Den]]
// Wander south and enter hut. Pan right once and Check. Woku will make you stay overnight.
// Walk north and step on the circle to enter a platforming section.
// At the bottom of the hill, turn around and dig through to find [TEARDROP 15]
// Continue right to leave the platforming section
// There's a save bell to the north
// Head east into the next area

// [[Village of the Den]]
// Enter the northern hut, look left, and Check to find a Large Ointment
// Leave the village to the southeast and walk until you fall into a hole
// Break the walls on the left and drop down
// Kill the three enemies then drop down to the right
// Walk right and bound up to get a Small Ointment
// Drop down, kill the enemies, step under the first blue block and fire a shield blast up to break a piece of floor
// Go left and use the blue bouncer to go back up
// Go right, then left to the next blue bouncer for a Wind God and a Fire God
// Drop down, head right to fall twice. Go left and left more to fall to the bottom
// Go right to the next area
// Go right and fall. Break the wall on the left and use the red bouncer, then the green bouncer
// Go all the way right, breaking through the ledge, and drop
// Zig zag left and right to get to the bottom. Shoot a shield up under the left side of the ledge
// Then use the blue bouncer and fall to get a Time God
// Drop left again, squat left, and use the blue bouncer
// Fall left and use the green bouncer
// Fall left and walk right to use the blue bouncer
// Walk right to the yellow bouncer
// Walk right and fall. Squat right and squat left, then walk right to the red bouncer
// Take the next red bouncer to return to the overworld
// Walk up to Woku
// Walk up the cliff and jump back into the village
// Talk to the old woman in the northernmost hut twice
// Exit the village and head east into the next area (avoid fights as Woku is injured)

// [[Boulder Field]]
// Move around the water and south into the next area

// [[The Crossroads]]
// (There's a save bell on the right)
// Keep moving south past the guard and the hut into the next area

// [[Torajima Island]]
// Work your way around to the shrine, then go across the bridge to the hut
// Talk to the man, then try to leave twice
// ((Save 6 - Lv22 5:58 | Lv21 4:45))
// Head to the yellow lake and send Woku in
achievement("Song of Life Siphon", "Take Woku to the yellow lake", 3,
    trigger = trigger_first_person(3, 8) && trigger_changed(byte(0xF622), 1)
)
// Go north back to the Crossroads

// [[The Crossroads]]
// Talk to the man guarding the cave
// Walk east to the circle to enter a platforming section
// Just work your way through it to the right
// Continue east into the next area

// [[Village of the Loft]]
// Quickly go north to the portal

// [[Mikajima Island]]
// Take the northwest portal back to Gotou Island

// [[By the Brooklet]]
// Chop through the bushes and trees so you can leave to the west

// [[Village of the Moon]]
// Go south into the Footstep Fields

// [[Footstep Fields]]
// Go west to the Village of the Gods

// [[Village of the Gods]]
// Walk to the west side of the map and enter the cave to receive the Goddess Crystal
// Go south to Gotou Island

// [[Gotou Island]]
// Enter the southeast house and talk to Ido on the left
// Return all the way back to the Village of the Loft through Mikajima Island
//  North, east, north, portal, northeast portal

// [[Village of the Loft]]
// Work your way into the village.
// Talk to Musaku in the northern most hut
// Leave the hut and go south to the next area

// [[Lake Essence]]
// Work your way to the bottom edge of the map, then head east
// Talk to the man on the island
// Go back to the bottom left portion of the map and head south into the next area

// [[Hillshore Village]]
// Walk around to the village
// Talk to everybody in the northwest, northeast, and southwest huts
// Talk to Kai in the southeast hut. If he doesn't let you spend the night, you didn't talk to everybody else
// Return north to Lake Essence

// [[Lake Essence]]
// Continue north to Village of the Loft

// [[Village of the Loft]]
// Continue west to the Crossroads

// [[The Crossroads]]
// Step on the circle and work your way through the platforming section
// The guard will be collapsed in front of the cave. Enter it.
// Go all the way left
// Squat behind the circle block for an antidote
// Jump up on the first ledge and squat behind the next circle block for another antidote
// Continue up to the grey ledge and go right across the middle of the level 
// Do a big jump and a crouching jump right
// Make a couple more jumps up - try to kill the annoying green bug before it drops from the ceiling.
// Traverse the top of the level to the left
// When you reach the crouching tunnel, drop off to the left (and float left more) for [TEARDROP 16]
// Drop down again, then jump up the ledges as far as you can
// Do a crouching walk all the way to the right for [TEARDROP 17]
// Go back to the upper left exit jumping up through the hollow ledges
// Move to the next cave on the overworld
// Climb up the ledges, then across the top
// Drop down and work your way to the right
// Float aross the gap (and make sure to crouch/float through the waterfall too) for a Fire God
// Jump into the waterfall and immediately float left for a Large Ointment
// At the bottom of the waterfall, go left for [TEARDROP 18]
// Go right to get back to the entrance, then go all the way up and left again
// Drop down and work your way to the right
// Drop down again, kill the two enemies, then crouch left
// Drop down the waterfall and go left until you return to the overworld
// Continue west to the next area

// [[Mountain Shore]]
// Work your way to the hut. Talk to the old lady
// Continue west into the next area

// [[Mount Fireblood]]
// ((Save 7 - Lv27 7:28 | Lv27 6:26))
// Go south and talk to Watari
achievement("Upward Thrust", "Learn the upward thrust", 5,
    trigger = trigger_first_person(3, 4) && trigger_changed(byte(0xF5F2), 3)
)
// Walk right back into Mountain Shore

// [[Mountain Shore]]
// Work your way right to the circle and enter the platforming section
// Walk right to the wall, and use the upward thrust to break through
// Walk right to the next wall, and destroy both breakable blocks
// Continue onward until you're under the jar and break the blocks so it falls onto you
// Go back to the entrance of the platforming section and return to the overworld
// Continue west back to Mount Fireblood

// [[Mount Fireblood]]
// Work your way up the mountain and step on the circle to enter another platforming section
// Use the blue bouncer and float left
// Use the next blue bouncer to collect a Bolt God
// Use the blue bouncer again and float right
// Use the next blue bouncer
// Work your way right and drop down to another blue bouncer
// Use it to collect a Falcon Wing
// Shoot a shield left to destroy the sunburst
// Jump and float left onto the ledge where the sunburst was 
// Jump up the ledges and collect the Large Spirit Pill
// Drop back down to the right twice, then big jump left and take the red bouncer to the next area
// Jump across the gap, then walk all the way right (through the lava falls) to collect a Time God
// Jump up the ledges along the right wall and use the blue bouncer to float left to [TEARDROP 19]
// Work your way to the bottom left
// Use the blue bouncer, then jump up the ledges to get [TEARDROP 20]
// Float to the middle area (or jump up there if you miss) and take the red bouncer to the next area
// Walk all the way right for a large spirit pill
// Climb up the right side and float to the left
// Use the yellow bouncers to get [TEARDROP 21] in the upper left area
// Float right and use the yellow bouncer to return to the overworld
// ((Save 8 - Lv28 7:51 | Lv28 6:47))
// Approach the man by the hole
// After he turns you into a monster, press B to break the spell
// You can only hit him (with the sword) when he's casting a spell
// If you're not close enough to hit him, dodge the spell (wind=his row, thunder=his column, fire=targetted)
achievement("Power is Power", "Defeat the phantom", 5,
    trigger = trigger_platforming() && 
              current_area() == 4 && current_subarea() == 4 &&
              byte(0xF5D4) == 0x0C && prev(byte(0xF5D4)) == 0x0B
)
// Pick up the head
// Jump down the hill and head east back to Mountain Shore via the southern exit (near Watari)

// [[Mountain Shore]]
// Climb up on the hillside near the circle and jump down
// Work your way around to the east and return to the Crossroads

// [[The Crossroads]]
// Enter the cave
// Jump up the platforms and float right
// Work your way through the cave to the right and back to the overworld
// Enter the second cave
// Walk all the way right, collecting the small spirit pill
// Kill the jumping bug, then stand on the blue shell to high jump to the Falcon Wing
// Drop down and exit to the right. You'll come out on top of the hill
// Read the sign, then jump down to the bottom and walk south to the hut
// Talk to the woman to receive the Revival Orb
// Go south into the next area

// [[Torajima Island]]
// Walk around to Karabito's hut
// Give him the brain. After some exposition, Woku will suggest you return to the Village of the Loft. Do so
// North to Crossroads

// [[The Crossroads]]
// Step on the circle, do the platforming, then head east into the next area

// [[Village of the Loft]]
// Enter the elder's house and give the medicine to the boy
// On the way out, talk to the girl for a Revival Orb
// Go south to the next area

// [[Lake Essence]]
// Continue south to the next area

// [[Hillshore Village]]
// Talk to Kai on the pier

// [[Sakaki Island]]
// ((Save 9 - Lv29 8:33 | Lv30 7:32))
// Go south to the next area

// [[Outer Village]]
// Approach the blue lake
achievement("How Fetching", "Take Woku to the blue lake", 3,
    trigger = trigger_first_person(4, 4) && trigger_changed(byte(0xF624), 1)
)
// Enter the village
// Talk to the prophet in the southeast hut
// Talk to the exorcist in right northeast hut
// Talk to the girl in left northeast hut
// Go down the stairs behind the northeast huts
// Squat jump across the gap and whack the green monster
// Send blue woku to collect the bag below you (Large Spirit Pill)
// Walk right and crawl through the tunnel. Hit the green monster at the bottom
// Crawl through the tunnel and drop again. Hit the green monster
// Jump over it and hit it again. Go to the far right for a Wind God
// Go back and hit the green monster, jump over it, and hit it again
// High jump onto the left ledge. High jump onto the pale ledge.
// High jump up to the next ledge and hit the green monster.
// Squat jump over it and hit it again.
// Drop left, then drop right and hit the last green monster.
// Kill the yellow shellbug and hit the green monster again.
// Crawl under the ledge, then high jump onto it to collect [TEARDROP 22]
// Step off the ledge and get teleported back to the entrance. Then leave.
// Return north to the previous area

// [[Sakaki Island]]
// Head east into the next area

// [[Man-eating Swamp]]
// Follow the path back into Sakaki Island and back again into the Man-eating Swamp
// Keep going until you reach the island
// Agree to talk to Maya's parents
// Work your way all the way back to the Outer Village, and head west into the next area.

// [[Snake Boulder Area]]
// Talk to the man in the overgrown grass
// Enter the stone circle to return to Mikajima

// [[Mikajima Island]]
// Go to the southwest Stone Circle to teleport back to the second island

// [[Inner Sun Palace]]
// Go south to the next area

// [[Southern Gate]]
// Go west to the next area

// [[Chronicle Altar]]
// Continue south to the next area

// [[The Binding Area]]
// ((Save 10 - Lv31 9:15 | Lv31 8:09))
// Jump in the big hole
// Fall all the way down to the bottom
// Jump up on the left ledge and walk over the gate
achievement("Going Down", "Enter the underworld", 5,
    trigger = current_world() == 5 && current_area() == 4 && 
              trigger_changed(byte(0xF55C), 0x0D)
)

// [[Remains of the Den]]
// Work your way around the islands and head north

// [[Shrine of the Den]]
// Work your way to the upper right corner, avoiding the lost spirits
// Talk to the ghostly man
// Work your way to the upper left and talk to the ghost there
// Go back south

// [[Remains of the Den]]
// Go south to the next area

// [[Underworld]]
// Go around to the area with the three circles
// Defeat the three enemies such that their corpses lie on the circles
// Enter the cave
// Shoot the bomb from below, then climb up where it was
// Continue to climb and move left to kill the boulder dropper
// Jump above where it was to collect the Fire Dragon God
// Go right and drop into the gap, float/falling left. Kill all the boulderlings
// Go left across the bottom, then up the left side. Enter the next screen
// Climb up the right side (shooting the green thing as you pass) and go across the top for a Bolt God
// Drop into the pit on the left and shoot the next green thing
// Use blue Woku to collect a large spirit pill
// Go back to the right and drop down. Drop down again and go all the way left for a Large Spirit Pill
// Go back to the entrance and hop across the gaps in the middle
// Push the block with your sword and magic up to kill the boulderling
// Continue in to the next screen
// This is a very annoying screen. Jump fight (or run) your way through
// Talk to the woman
// Go west into the next area

// [[Southern Sandflows]]
// Talk to the ghost man to save/heal
// Use the sandflows to reach the upper right cave
//  You have to get below the middle skull and go to the left side, then up to
//  the long horizontal stream and up hrough the smaller ones
//  NOTE: walk against the flow to go one step, or with the flow to move twice
// Enter the cave
// Climb the left side and go to the right
// Drop all the way and go right to return to the overworld
// Walk around to the next cave, talking to the ghostly woman on the way
// Work your way through the cave, shooting the blue furball as you pass
// When you get to the upper right, float right on the way down for a Bolt God
// Drop the rest of the way and head right to leave the cave
// Move north into the next area

// [[Northern Sandflows]]
// Work your way through the sandflows, then talk to the ghost woman
// Go north into the next area

// [[The Slopes]]
// The ghost man provides save/restore functions
// ((Save 11 - Lv35 10:29 | Lv35 9:13))
// Walk around the four pillars and enter the cave
// Drop down to the right, then left, then right again, then jump up to the right
// Keep climbing to the ceiling and destroy the pole
// Drop just a bit and go right and up to destroy the second pole
// Look behind the second pole for a Bolt God
// Go back to the branch between the two poles and drop once
// Go through the right tunnel, across the first gap and drop into the second gap
// As you're falling through the next drop, have Woku catch you, then swing your sword to dislodge the block
// Go all the way left. When you get to the point where you have to squat, turn around and float right as you fall
// Go all the way right, and climb up to the third pillar (killing the green furball on the way)
// Work your way back to the left where you had to squat and float right
// Do it again, floating into the second hallway
// Go all the way right. Jump up the purple platforms, and keep climbing to reach the fourth pole
// Destroy it, then drop all the way down
// Grab the Time God as you work your way all the way left
// Climb the purple platforms, then fly across the gap to the squat point again
// Go through, then climb up in a leftwardly manner to reach the entrance, and leave
// Step up to the northern stone and talk to the ghosts
achievement("Downward Thrust", "Learn the downward thrust", 5,
    trigger = trigger_first_person(5, 1) && trigger_changed(byte(0xF5B4), 3)
)
// Immediately get thrown into a boss fight
// Defeat the four spirits (use shield blast when they line up), then attack the boss. Repeat five times
//  If you don't defeat the spirits fast enough, the boss will charge you
achievement("It's Not Over Yet", "Defeat Brother God of the Sea", 5,
    trigger = current_world() == 5 && current_area() == 1 &&
              byte(0xF55C) == 0x19 && prev(byte(0xF55C)) == 0x18
)
// Go south to the previous area

// [[Northern Sandflows]]
// Walk left, break the stones, and head north

// [[The Slopes]]
// Cross the bridge and enter the stone circle

// [[Mikajima Island]]
// Take the northwest stone circle back to the first island

// [[By the Brooklet]]
// Go south through the stumps and bushes, then west to the next area

// [[Village of the Moon]]
// Cut up through the bushes and rocks and enter the northernmost stairs
// You have to kill all the enemies on the way down to get the teardrop
//  Float down to the right and chop the enemy in the crevice
//  Float down to the left and chop the enemy in the crevice and the next enemy in the left crevice
//  Then start floating again and chop the enemy in the crevice on the right
//  Float back to one step from the left side and chop through the bug as you fall
//  Float down a couple more rows. When you see the other bug, kill it
//  Float to the center and fall onto [TEARDROP 23]
// Walk left into the next screen
// Fly over the red block
// Stand one space left of the lower fan block and jump
// Squat jump and move onto the lower fan block
// Jump to the next platform, and the next platform above it
// Kill enemy, then jump onto the white block
// Step off the left side of the white block, turning right and hitting it with your sword as you fall
// Push it right twice more, then use it to get up to the next white block
// Push it right once and high jump to the fan
// Continue jumping until you're on the platform below the tear
// Stand in the gap and do a high jump. The fan will push you onto the small ledge
// Do a normal jump and float right past the teardrop. Fall and be blown onto [TEARDROP 24]
// Drop down to the right of the last fan (below you) and break through the wall
// Make sure to let the fan blow you onto [TEARDROP 25]. If you step onto it, the fan will blow you past it
// Drop right and use the red jumper to reach the Large Spirit Pill
// Jump up to the top and head right to leave the cave
// Go back to the northern staircase, drop all the way down (have to float right at least once)
// Walk right into the next screen
// Continue right into the next screen
// Jump over the yellow block and climb the right side (kill everything on the way)
// Get [TEARDROP 26] at the very top, then drop down the right side
// As you start to go left (and can see the yellow bouncer), float left more for [TEARDROP 27]
//  (must kill all enemies to collect this)
// Drop down and use the red block, then the yellow block and exit to the left
// Go east back into the previous area

// [[By the Brooklet]]
// Cut up through the stumps and bushes and continue north into the next area

// [[Overlook Village]]
// Continue north to the next area

// [[First Village]]
// Work your way around to the village and enter the southwestern house
// Scan left and look to find a hole in the ground
// Collect the small spirit pill and jump onto the enemy to kill it
// Use a Time Dragon God and quickly climb to the top
//  (is there some other way to defeat these? Fire God doesn't work)
// Fall all the way down
// Squat jump two away from the ledge and float to the ledge then jump so you land on the enemy to kill it
// Get to the right of the ledge above you and use another Time Dragon God to kill the remaining two enemies
// Collect [TEARDROP 28] and [TEARDROP 29]
// Go all the way right to leave the cave
// Head to the northwest corner of the section and north into the next area

// [[Village of Winter]]
// ((Save 12 -  | Lv37 9:56))
// Go around the village and break the stones in front of the cave and enter it
// Start with a crouched jump to the first green monster and hit it
// High jump and move left to the next monster and hit it
// Jump over the monster and hit it
// Shield blast upwards four times (make sure to hit the monster whenever the candle gets low)
// Watch for a "you broke the wall" message to confirm success
// Jump over the monster, hit it, and move right back to the first monster
// Hit it, then high jump right, normal jump/float right, and hit the next monster
// High jump climb the next three ledges and hit the next monster
// Jump over the monster and hit it again
// Move left, jump over the hole and monster, and hit it
// Do a crouched jump and move three spaces left, release and grab Woku, and continue left to the ledge. Hit the monster
// Jump over the monster and hit it again
// Go left and fall to collect [TEARDROP 30]
// Let the time run out to be ported back to the entrance
// Do a crouched jump to the first green monster and hit it
// Move up and right to the second monster and up and right to the third monster
// Jump over the monster, hit it, and walk left off the platform
// Squat right and move over the monster. Turn and hit it
// Walk right and fall as far as you can
// Walk left and fall some more. Hit the monster at the bottom
// Move right to the next monster and hit it
// Shield blast through the monster to break a block. Jump over the monster and hit it again
// High jump up to the next monster and hit it
// Squat jump over the monster and hit it again
// Jump and float three squares left. Release and grab Woku and move one more left
// Slash the block, fall, and hit the monster on the way down.
// Move right to the next monster and hit it
// Jump over it and hit it again
// High jump up to the next monster and hit it
// Squat jump over the monster and hit it again
// Jump and float three square left. Release and grab Woku and float to the next platform. Hit the monster
// Jump over the monster and hit it again
// Jump and float left over the next monster. Turn and hit it
// Shield blast left to destroy a wall offscreen.
// Hit the monster again. Squat jump onto it and step right once
// Squat jump, move three spaces right and do a falling slash to hit the previous monster
// Walk left and fall into the hole, doing a downward stab as you fall
// Jump up and hit the monster again
// Walk left and fall into the hole, doing a downward stab as you fall (this should break the block)
// Squat and step right, catching Woku as you fall. Float right and slash to hit the monster as you fall
// Turn around, high jump and hang there. Do two shield blasts, then fall and hit the monster again
// Repeat again. You should destroy two blocks of wall
// Jump over the monster and hit it again. 
// Move right to the next monster and hit it
// Jump over it and hit it again
// High jump up to the next monster and hit it
// Squat jump over the monster and hit it again
// Jump and float three squares left. Release and grab Woku and float to the next platform. Hit the monster
// Jump over the monster and hit it again
// Walk left and fall to the ground
// Walk left to the next monster and hit it
// Squat jump over the monster and hit it again
// Walk left and high jump onto the first blue block
// Squat jump and float right. Hit the monster and immediately grab Woku again and float back to the blue block
// High jump five times and hit the monster
// Jump over it. Turn and high jump to hit it again
// Move right, high jump and move right to hit the last monster
// Jump over it and hit it again
// High jump twice and collect [TEARDROP 31], [TEARDROP 32], and [TEARDROP 33]
achievement("Tears of Winter", "Collect the three teardrops from the cave near the Village of Winter", 5,
    trigger = current_world() == 2 && current_area() == 3 &&
              bit4(0xF656) == 1 && bit3(0xF656) == 1 && bit2(0xF656) == 1 &&
              (prev(bit4(0xF656)) == 0 || prev(bit3(0xF656)) == 0 || prev(bit2(0xF656)) == 1)
)
// Time will run out and you'll get teleported back to the entrance
// Leave the cave and move north up the hill past the hut into the next area

// [[Boundary Cape]]
// Work your way through the forest, then go down the stairs by the water
// Work your way through the cave. Just remember to jump over the gap hidden behind the circle squares
// Enter the next cave
// After defeating the second pair of enemies, look for some breakable blocks in the floor
// Use drop attacks to break through them
// Go left to collect [TEARDROP 34] and [TEARDROP 35]
// Go back to the main island and east to the next area

// [[Mt. Celestial Area]]
// Work your way around to the cluster of stumps
// Chop through them and go around to the rocks
// Chop through them, jump down, and enter the cave
// Squat jump across the first gap
// Drop into the next gap stabbing down to kill the flowers
// Drop again landing on the shield enemy, then go left to kill the three poison flowers
// Drop left and go right
// Drop down, high jump right and squat jump into the gap
// Drop down. Continue dropping down and right for [TEARDROP 36]
// Climb all the way up the right side back to the entrance.
// Squat jump over the gap, then squat jump/float left to [TEARDROP 37]
// Drop twice, head right, then drop left
// Jump left, then walk behind the circle block for a Bolt God
// Jump back over the gap and squat walk through a series of circle blocks, landing right next to [TEARDROP 38]
// Squat jump from the right block to land on the shield enemy
// Climb back up to the circle blocks you crawled through
// High jump over them, squat right through the tunnel and drop. Float left as you fall
// You should land on a ledge. Step off it to the left, stabbing down into a flower
// Squat step left and fall to [TEARDROP 39]
// Climb the little wall to the left, and work your way left to the next screen
// Go left across the bottom and jump up to the first ledge
// Use blue Woku to collect the large ointment
// Jump onto the blue flashing square, then up and left to the platform
// Jump and float over to the green square (you'll have to release and catch Woku)
// High jump and float over to the right wall (you'll have to release and catch Woku)
// High jump to the yellow square
// Jump to the next safe platform
// High jump to the green square
// High jump and float right (you'll have to release and catch Woku) for [TEARDROP 40]
// Float back to the green block
// High jump and float left (you'll have to release and catch Woku) for [TEARDROP 41]
// Send blue woku to collect the large ointment
// Drop all the way down the left side and go back right into the previous screen
// Work your way up the left side to the long circle drop
// Jump up over the circles and squat through the tunnel
// Drop, then jump over the gap and go up the right side
// Exit to the right
// Jump off the hill and go south into the next area

// [[Chronicle Altar]]
// Enter the platforming section going to the altar island
// At the lowest point just into the level, use a downward thrust to break through the floor twice
// Step right and break the ceiling for a Time God
// Go all the way left and collect the large spirit pill
// Stab up into the ceiling so you can jump and stab down into the ground
// Go right and break through the wall
// Jump up and break the ceiling for [TEARDROP 42]
// Go a little bit back to the left and squat through the dark blue blocks. Proceed to the next screen
// Jump across the gap and kill the two enemies
// Jump across to the three white blocks
// Push the lower block right twice
// Push the middle block right until it falls off the ledge
// Push the top block right until it's at the end of the ledge (but not off it)
// High jump onto the separate block on the left
// Drop left and float onto the next white block
// Squat behind the white block and hit it right
// Sqaut drop left, then right, hitting the white blocko n the way down
// With the two blocks on top of each other, work your way around so you can stand on them
// Squat jump into the tunnel and push the next white block to the right so it drops and blocks the fan
// Drop left, jump up to the right and push the block all the way against the fan
// High jump to the right and squat jump onto the first white block
// High jump to the right again and squat jump left onto the last white block
// High jump to the right for [TEARDROP 43] and [TEARDROP 44]
// Return to the previous screen
// Jump up the blue blocks to return to the top, and leave via the left exit
// Go east to the next area

// [[Southern Gates]]
// Go north to the next area

// [[Inner Sun Palace]]
// Go through the platforming section
// ((Save 13 - Lv37 12:35 | Lv39 11:03))
// Then around the temple and east into the next area

// [[Region of the Den]]
// Enter the southwest hut
// Buy the Kimono (150gems)
achievement("It's the Thought That Counts", "Buy the Kimono", 5,
    trigger = (trigger_first_person(3, 1) ||  // in Snake Boulder Area (just after save 9)
               trigger_first_person(4, 3)) && // at his house in Region of the Den
               trigger_changed(byte(0xF64E), 1)
)
// Enter the backroom to use the mirror
// Head east into the next area

// [[Village of the Den]]
// Continue east to the next area

// [[Boulder Field]]
// Continue south to the next area

// [[The Crossroads]]
// Enter the cave
// Go all the way left and up to the middle level
// Go all the way right and break down through the floor for [TEARDROP 45]
// Climb up the right side and go all the way left to leave
// Enter the next cave
// Work your way all the way up, all the way left, then down and left to leave
// Proceed west to the next area

// [[Mountain Shore]]
// Continue west to the next area

// [[Mount Fireblood]]
// ((Save 14 - Lv38 12:58 | Lv41 11:38))
// Head to the southwest area and break the rocks
// Wind your way through the watery maze to the island and enter the stairs
// Work your way right. When you get to a point where you have to crawl, start climbing up
// Squat jump to the left to collect a Bolt God
// Drop down to the lower right to collect [TEARDROP 46]
// Go all the way back to the entrance and cross the tops of the cave - floating while releasing/grabbing Woku
// Squat jump over the last gap and leave to the right via the upper exit
// Work your way to the next screen
// Shoot the enemy and jump across the top gaps to collect [TEARDROP 47]
// Drop/float to the collect [TEARDROP 48]
// Drop and thrust to kill the boulderling, then climb and go all the way left
// Drop left, then right. Prepare a shield
// Drop left, immediately grabbing Woku, drop so you're hovering the the space above the enemy on the right
// Shoot the enemy to the right, then quickly release and grab Woku again and float to where it was
// High jump twice and kill the bouldering, then squat jump from where it was to the right
// Climb up and left for [TEARDROP 49]
// Jump right, drop down and down again for [TEARDROP 50]
// Drop down right, then left to the bottommost level
// Go right and climb up to where teardrop 48 was
// Go all the way left, drop, and leave to the left
// Continue left to the next screen
// And left all the way to return to the overworld
// Work your way back through the maze and go east to the next area
//
//  With max shield and max sword, now's the time to start working on collecting Megatama by
//   fight everything you can as you work your way around the map, unlocking every encounter and
//   setting as many records as you can. The shield hits three rows (the row you're in as well as
//   the one above you and below you). Similarly, it hits three columns when fired upwards. Use
//   it to dispatch enemies that are far away from you or lined up near each other.
//   Also note that you can use Woku (Y button) to engage a battle and not have to worry about
//   accidentally auto-killing the enemy.

// [[Mountain Shore]]
// Go east to the next area

// [[The Crossroads]]
// Enter the cave
// Go right all the way, up a bit and out
// Enter the next cave
// Go right all the way and out
// Jump down the hill and enter the circle for the river crossing
// Exit to the right
// Go east to the next area

// [[Village of the Loft]]
// Enter the Stone Circle

// [[Mikajima Island]]
// Enter the southeast Stone Circle

// [[Snake Boulder Area]]
// ((Save 15 - Lv39 13:26 | Lv50 15:52))
// Cut through the bushes, then the rocks to enter the forest
// Go right and jump up the wall
// Traverse the branches left, then right
// Float right, releasing and grabbing Woku to stay on the branches
// (There is an antidote on the ground if you fall)
// Float right again, releasing and grabbing Woku
// Go right to the next screen
// Defeat the dragon (five hits)
// Head east to the next area

// [[Outer Village]]
// Chop through the rocks and enter the cave
// Use a shield attack to break the nearby blocks, then float across to where they were
// Work your way all the way right, then downthrust to break a block and land on an enemy
// Send blue Woku to get the Wind God
// Break the right wall with a wavy shield
// Drop down and leave to the right
// Defeat the dragon (five hits)
// Work around the hill and move north into the next area

// [[Sakaki Island]]
// Cut the rock and enter the cave
// Just follow the path. When you get to the lower left part of the map, break the floor and fall into the next screen
// Defeat the dragon (five hits)
// Return south to the previous area

// [[Outer Village]]
// Go north again, on the eastern part of the map

// [[Sakaki Island]]
// Move east into the next area

// [[Man-eating Swamp]]
// Follow the path back around west

// [[Sakaki Island]]
// Continue east

// [[Man-eating Swamp]]
// Talk to Maya in the little island
// Go around the right side of the island and through the bushes and up the hill
// Go to the left side and jump down. Break the rock and enter the cave
// Work your way to the bottom right, letting the monsters break through the rocks
// In the next room, jump over the red block to the left, then go all the way left
// Go right through the wall over the lava and go left past the lava for a Small Ointment
// Go all the way right, dropping three times
// Go left past the lava, then right again
// Go left, squat jump over the red square, and drop into the gap
// Go right, fall onto the lava, then left and fall into the next screen
// Defeat the dragon (five hits). Don't stand in the same row as it or it will breathe fire at you
//
//   Return back to the Snake Boulder Area (west, east, west, south, west)

// [[Snake Boulder Area]]
// Go to the southwest part of the map, chop the stone, and enter the stairs
// Drop down the left side. Use the blue block to bounce up to the platform
// Float right and use the yellow block
// Squat into the left tunnel for a Bolt God
// Walk right. As you fall off the ledge, grab Woku and shield blast the two red enemies
// Float right and drop down near where they were
// Go all the way left and drop into the hole
// Walk past the skeleton and read the letter
// As you fall float right and land in the gap
// Send blue Woku after the Fire God in the upper right
// Continue falling to the next screen
// Defeat the dragon (five hits)
// Head south into the next area

// [[Guiding Fields]]
// Work your way around the water, break the stones, and enter the cave
// Approach the green monster and hit it
// Jump over and hit it again
// Advance to the next green monster and hit it
// Shield blast the blue enemy and hit the green monster again
// Advance to the next green monster and hit it
// Jump over and hit it again
// Advance to the next green monster and hit it
// Shield blast the blue enemy and hit the green monster again
// Jump over it and advance to the next green monster and hit it
// Squat jump over it and hit it again
// Walk forward, turn and high jump attack the next green monster
// Advance to the next green monster and hit it, and the next one
// Squat jump into the waterfall, high jump and hit the next green monster
// Jump over and hit it again
// Climb up the stairs and jump in the hole to hit the next green monster
// Continue left and hit another green monster
// Jump over and hit it again
// Climb behind the waterfall and hit the left green monster
// Squat jump to the right and high jump for the next green monster
// High jump again and step left (ignore the blue monsters on the right)
// Continue left out of the cave
// Enter the stairs in the island
// Defeat the dragon (six hits). Don't stand in the same row as it or it will breathe fire at you
// Jump down and head west into the next area

// [[Border Slope]]
// Jump down, chop a stump, then head north up the ramps
// Chop another tree and head up more ramps
// Jump down again and enter the stairs
// Just follow the path. Halfway through use blue Woku to get a Large Ointment
// Defeat the dragon
// Go south and save
// ((Save 16 - Lv43 15:14 | Lv50 17:52))
// Continue towards the northwest corner of the island
// Defeat the dragon 
achievement("Dragon Slayer", "Collect the Eye of the Dragon", 10,
    trigger = trigger_overworld() && 
              measured(bitcount(0xf5f4) == 8) &&
              byte(0xf55c) == 0x27 && prev(byte(0xf55c)) == 0x26
)
// Now you need to save up 800 Magatama (1300 for true ending). Work on completing your battle records
// Remember that engaging the enemy with Woku (Y button) is not an instant win, no matter how weak they are

// [[Mikajima Island]]
// ((Save 17 - | Lv50 18:15)) [FYI: I had 1445 magatama on my final run]
// Deploy all of the Magatama that you've collected
// Follow the path to the temple
// Kill all the enemies on the screen, then hop left onto the yellow platform
// High jump left twice
// Squat jump right, kill more enemies, then high jump left again
// High jump, then climb right, killing the enemies as you go
// Drop back down, squat jump right and fall
// Climb up the left side of the yellow platforms, then shield blast up when Woku gets taken
// Climb up the right side for a large ointment (not tracked by the game)
// Drop back down to the yellow platforms and squat jump to the left
// High jump twice and shield blast up when Woku gets taken
// High jump left, squat jump right, high jump right twice
// Climb up and left until you get to the next yellow platform, killing enemies on the way
// Collect the large ointment on the platform, then squat jump to the right
// Drop right, jump right and high jump right for a Bolt God
// Go back the yellow platform that had the large ointment
// Squat jump right, then high jump to the next screen
// Kill the enemies as you walk right, then squat jump right
// High jump left twice, squat jump right, high jump left, squat jump left
// Kill some enemies (and rescue Woku)
// Climb right for a Large Spirit Pill
// Do a series of float/release/grabs to the left side of the level
// Climb up with a series of high jumps + squat jumps to the yellow platforms
// Jump across to the right side, killing stuff as you go
// High jump, jump left, high jump, high jump left
// Jump left and fall
// Jump left, rescue Woku, then drop left for a Large Ointment
// Use a series of high jumps to get up the left side
// When you get to the double yellow platforms, jump all the way right for another Large Ointment
// Go back to the double yellow platforms and up to the next screen
// Jump left for a Large Spirit Pill
// Work your way right, killing as you go
// Defeat the Ocean God
// - use high jump followed by up thrust to hit him
// - stand under the platforms to avoid the wave damage
// - the light on the platform shows which direction it will move when you move
achievement("Rematch", "Defeat Brother God of the Sea again", 10,
    trigger = current_world() == 6 && current_area() == 2 && current_subarea() == 4 &&
              trigger_platforming() && current_life() > 0 &&
              word(0x0543) == 0 && prev(word(0xF543)) > 0
)
// Defeat the Ocean God's true form (need 1300 magatama to even face him)
// - can only hit him when he's human
// - when he stops wobbling, he's about to shoot a beam that sweeps the ground. jump to avoid it (if Woku is awake)
// - this is the last fight, so use as many ointments as you need
achievement("The Battle is Over", "Defeat the true form of Brother God of the Sea", 25,
    trigger = current_world() == 6 && current_area() == 2 && current_subarea() == 5 &&
              trigger_platforming() && current_life() > 0 &&
              word(0x0543) == 0 && prev(word(0xF543)) > 0
) 

function chapter_encounter_achievement(chapter, name, points)
{
    addresses = chapter_counter_addresses[chapter]
    target = length(addresses)

    achievement(name + " Encounters", 
        "Unlock the battle record entry for all " + target + " encounters in " + name, points,
        trigger = in_game() &&
                  measured(sum_of(addresses, a => bit7(a)) >= target) &&
                  sum_of(addresses, a => prev(bit7(a))) == target - 1
    )
}

function chapter_record_achievement(world, name, target, points)
{
    addresses = chapter_counter_addresses[world]

    achievement(name + " Records", 
        "Set a record for " + target + " encounters in " + name, points,
        trigger = in_game() &&
                  measured(sum_of(addresses, a => byte(a) / 0x81) >= target) &&
                  sum_of(addresses, a => prev(byte(a)) / 0x81) < target
    )
}


function chapter_magatama_achievement(chapter, name, target, points)
{
    collected_magatama = []
    counters = []
    for area in areas[chapter]
    {
        fights = areas[chapter][area]["Fights"]
        for fight in fights
        {
            counter = byte(fights[fight]["Address"])
            array_push(counters, counter)
            
            par = fights[fight]["Par"]
            for i in range(1, par - 2)
                array_push(collected_magatama, once(counter > 0x80 && counter <= 0x80 + par - i))
            array_push(collected_magatama, once(counter == 0x81))
        }
    }   

    // this feels very hack-ish. for each counter: 0x00 = unseen, 0x80 = par or worse, and
    // 0x80+n = n moves taken. you get par-n magatama for beating par, so what we want is
    // "measured(sum_of(counters, par - (counter - 0x80)) > target)", but only for counters > 0x80
    // as there's no clean way to filter out the counters that are <= 0x80, we have to get creative
    // with AndNext
    //
    //   AndNext   counter > 0x80     // better than par
    //   AddHits   counter <= 0x82 (1)
    //   AddHits   counter = 0x81 (1)
    //
    // if the player did one better than par, counter would be 0x82, and the first two lines would
    // capture a hit, thus making the total 1.
    // if the player did two better than par, counter would be 0x81, and both hits would be captured
    // to total 2. this gets messy with double-digit pars, but it's the best I could come up with.
    //
    // this would be easier with variables, where MeasuredIf would nullify individual values less 
    // than 0x81 in each variable, and the variables could be summed to reach the target:
    //
    //   $magatama1 = measured(par1 - (counter1 - 0x80), when = counter1 > 0x80)
    //   $magatama2 = measured(par2 - (counter2 - 0x80), when = counter2 > 0x80)
    //   ...
    //   trigger = measured($magatama1 + $magatama2 + ... >= 100)
    //
    achievement(name + " Magatama", "Collect at least " + target + " magatama from battle record fights in " + name, points,
        trigger = in_game() && 
                  measured(tally_of(collected_magatama, target, a => a)) &&
                  any_of(counters, a => a != prev(a))
    )
}

function magatama_achievement(rank, needed, points)
{
    achievement("Magatama Collector " + rank, "Collect at least " + needed + " total magatama", points,
        trigger = in_game() && total_magatama() >= needed && prev(total_magatama()) < needed
    )    
}

magatama_achievement("I",     100, 5)
magatama_achievement("II",    200, 5)
magatama_achievement("III",   300, 5)
magatama_achievement("IV",    400, 5)
magatama_achievement("V",     500, 5)
magatama_achievement("VI",    600, 5)
magatama_achievement("VII",   800, 10)
magatama_achievement("VIII", 1000, 10)
magatama_achievement("IX",   1200, 10)

achievement("Armband II", "Obtain five teardrops and upgrade your armband", 5,
    trigger = trigger_platforming() && armband_strength() > prev(armband_strength()) &&
              current_teardrops() == 5 && prev(current_teardrops()) == 4
)

achievement("Armband III", "Obtain fifteen teardrops and upgrade your armband", 10,
    trigger = trigger_platforming() && armband_strength() > prev(armband_strength()) &&
              current_teardrops() == 15 && prev(current_teardrops()) == 14
)

achievement("Armband IV", "Obtain twenty five teardrops and upgrade your armband", 10,
    trigger = trigger_platforming() && armband_strength() > prev(armband_strength()) &&
              current_teardrops() == 25 && prev(current_teardrops()) == 24
)

achievement("Armband V", "Obtain fifty teardrops and upgrade your armband", 25,
    trigger = trigger_platforming() && armband_strength() > prev(armband_strength()) &&
              current_teardrops() == 50 && prev(current_teardrops()) == 49
)

achievement("All There Is To Know", "Reach level 50", 10,
    trigger = in_game() && current_level() == 50 && prev(current_level()) == 49
)

chapter_encounter_achievement(1, "Gotou Island", 10)
chapter_record_achievement(1, "Gotou Island", 15, 10) // 15/27
chapter_magatama_achievement(1, "Gotou Island", 100, 10) // does not count megatama from forced battle between guards

chapter_encounter_achievement(2, "Motoshima Island", 10)
chapter_record_achievement(2, "Motoshima Island", 25, 10) // 25/44
chapter_magatama_achievement(2, "Motoshima Island", 100, 10)

chapter_encounter_achievement(3, "Eastern Land", 10)
chapter_record_achievement(3, "Eastern Land", 25, 10) // 25/49
chapter_magatama_achievement(3, "Eastern Land", 100, 10)

chapter_encounter_achievement(4, "Sakaki Island", 10)
chapter_record_achievement(4, "Sakaki Island", 20, 10) // 20/37
chapter_magatama_achievement(4, "Sakaki Island", 100, 10)

chapter_encounter_achievement(5, "Underworld", 10)
chapter_record_achievement(5, "Underworld", 15, 10) // 15/31
chapter_magatama_achievement(5, "Underworld", 50, 10)

