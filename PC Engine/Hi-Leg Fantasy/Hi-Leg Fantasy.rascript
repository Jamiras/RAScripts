// ~Unlicensed~ Hi-Leg Fantasy
// #ID = 18644

// CD BIOS must be set to Game Express
// walkthrough (jp): // https://www.nicovideo.jp/watch/sm8150197

// menu: 
// * job
// * ability
// * items
// * magic
// * equipment
// * status
// * save

// battle menu:
// * attack
// [next two items are job skills. the first is innate to the selected job, the second 
//  can be chosen from any completed jobs]
// * kaifuku (recovery) [doctor]
//   - FU-MIN     (2MP)  [+50HP]
//   - IJIMAAIN   (10MP) [+100HP]
//   - MUYUZUMIN  (25MP) [+9999HP]
//   - NA-SU IDEN        [protective shield? - absorbs one attack?]
//   - NAMIKOSHIN
// * masastu [metal boy]
//   - FINGAA     (5MP)  [fire damage]
//   - VIBRA      (15MP) [fire damage]
//   - PISOTONA   (15MP) [fire damage]
// * NANPA [gigolo] - flirts with enemy
// * kanchou A [gigolo?] - 
// [end of job skills]
// * items
// * run
// * defend

// https://www.wordhippo.com/what-is/dynamic-translation/8062d511b39569b48e2c59bd4869e10135f7d283.html
function job(index) => byte(0x0dd0 + index)
job_amateur = 0     // shirouto    - amatuer
job_gigolo = 1      // JIGORO      - gigolo
                    //   NANPA       - flirt              - distracts enemy
                    //   homeru      - compliment         - trips enemy
job_doctor = 2      // DAKUTA      - doctor
                    //   kaifuku     - recovery           - healing
job_metal_boy = 3   // METARUkozou - metal kid (lit. metal boy)
                    //   masatsu     - rubbing            - attack
                    //   kanchou A   - enema              - failed
                    //   ROUSOKU     - candle             - crit
job_masseuse = 4    // shiatsushi  - shiatsu 
                    //   yubiBAIBU   - finger vibe        - 6x small hits
                    //   udePISUTON  - arm piston         - 3x medium hits
                    //   tsubotsuki  - exploit weakness (lit. "with a key point") - crit
                    //   KAUNTA-     - counter            - counterattack
                    //   7nengorushi - 7 years of killing - win in seven turns
job_esper = 5       // ESUPA-      - esper
                    //   CHANERUNGU  - channelling        - decrease channelling
                    //   minuku      - see through        - examine
job_swindler = 6    // PONbiki     - confidence man/swindler
                    //   bougyo      - defence            - shield skills
                    //   nigeashi    - flee               - run away
job_oyaji = 7       // oyaji       - father/old man/boss (skill = torture[itaburu])
                    //   itaguri     - gathering          - ?
                    //   denkianma   - electric massage   - 7x small hits
                    //   kanchou B   - enema              - crit
job_animal = 8      // ANIMARU     - animal
                    //   tosshin     - rush
                    //   zetsurin    - extraordinary
job_fat_warrior = 9 // DEBU senshi - fat warrior
                    //   naku        - cry
                    //   MAZO        - machochist
job_yakusha = 10    // yakusha     - actor
                    //   nikujyuban  - carnal/meat undergarment
                    //   DOSAmawari  - around/round trip
                    //   hojo        - assist

jobs = {
    job_amateur: "Amateur",
    job_gigolo: "Gigolo",
    job_doctor: "Doctor",
    job_metal_boy: "Metal Boy",
    job_masseuse: "Masseuse",
    job_esper: "Esper",
    job_swindler: "Swindler",
    job_oyaji: "Boss",
    job_animal: "Animal",
    job_fat_warrior: "Fat Warrior",
    job_yakusha: "Actor",
}

function level(index) => byte(0x0dbb + index * 2)

function gil() => word(0x0d86)

// NOTE: ignores title screen and in-game menu
function in_game() => byte(0x06d1) > 0x20

function town() => byte(0x0f40)
town_biran = 1 // BIRAN
town_cooper = 2 // KU-PA-
town_kanjita = 3 // KANJITA
town_trikomonas = 4 // TORIKOMONASU
town_triponema = 5 // TOREPONE-MA
town_bartholin = 6 // BARUTORIN
town_chlamydia = 7 // KURAMIJIA
town_wasserman = 8 // WASSERUMAN
town_kanjita_cave = 0x11
town_mountain_tower = 0x12
town_davis_castle = 0x13
town_davis_castle2 = 0x23
town_davis_castle3 = 0x24
town_davis_castle4 = 0x14
town_davis_castle5 = 0x15
town_davis_castle6 = 0x16
town_davis_castle7 = 0x25

towns = {
    town_biran: "Biran",
    town_cooper: "Cooper",
    town_kanjita: "Kanjita",
    town_trikomonas: "Trikomonas",
    town_kanjita_cave: "Kanjita Cave",
    town_triponema: "Triponema",
    town_bartholin: "Bartholin",
    town_chlamydia: "Chlamydia",
    town_mountain_tower: "Mountain Tower",
    town_wasserman: "Wasserman",
    town_davis_castle: "Davis Castle",
    town_davis_castle2: "Davis Castle",
    town_davis_castle3: "Davis Castle",
    town_davis_castle4: "Davis Castle",
    town_davis_castle5: "Davis Castle",
    town_davis_castle6: "Davis Castle",
    town_davis_castle7: "Davis Castle",
}

function location() => byte(0x0f49)
location_biran = 0
location_Cooper = 1
location_kanjita = 2
location_trikomonas = 3
location_wandering_outside = 4
location_wandering_outside2 = 6
location_biran_cave = 8
location_kanjita_cave = 9
location_mountain_tower = 10
location_davis_castle = 11

locations = {
    location_biran: towns[town_biran],
    location_Cooper: towns[town_cooper],
    location_kanjita: towns[town_kanjita],
    location_trikomonas: towns[town_trikomonas],
    location_biran_cave: "Biran Cave",
    location_kanjita_cave: "Kanjita Cave",
    location_mountain_tower: "Mountain Tower",
    location_davis_castle: "Davis Castle",
}

function map() => word(0x06d3)
map_overworld = 0x00cd
map_biran = 0x011f
map_biran_weapons = 0x031e
map_biran_witch_house = 0x040f
map_biran_witch_fight = 0x1009
map_grass_fight = 0x0605
map_cave = 0x0403
map_cave_boss_fight = 0x1009
map_cave_crystal = 0x046e
map_cooper = 0x0144
map_cooper_weapons = 0x031e
map_cooper_items = 0x034a
map_cooper_house1 = 0x0257
map_cooper_house2 = 0x0706 // ostrich house
map_cooper_house3 = 0x04f7 // gorora
map_cooper_magic = 0x034a
map_cooper_house4 = 0x0257
map_cooper_inn = 0x31e
map_menu = 0x05f2
map_cave_green_crystal = 0x0559
map_triponema_hospital = 0x05b2
map_bartholin_airship = 0x0be9
map_cave_blue_crystal = 0x0c45
map_epilogue = 0x0908

function in_battle() => bit4(0x0f40) == 1
function in_town() => byte(0x0f40) == 0x01
function enemy_hp() => byte(0x32e7e)
function enemy_type() => byte(0x32e81)
function enemy_state() => byte(0x32e84)
function active_battle_participant() => byte(0x32006)
function active_battle_participant_is_player() => active_battle_participant() >= 0x0a &&
                                                  active_battle_participant() <= 0x0c

function defeat_enemy() => enemy_hp() == 0 && enemy_state() == 2

// $2aa66 = 0 when enemy dies. $2aa67=1 is hero alive, $2aa68=1 is ririn alive, $2aa69=1 is kororu alive
function all_party_alive_in_battle() => tbyte(0x2aa67) == 0x010101
function all_party_alive_after_battle() => dword(0x2aa66) == 0x01010100

enemy_type_witch = 0x08           //  30 HP |  60GIL |   2EXP | MAJO no teshita (witch's minion)
enemy_type_fairy = 0x10           //  35 HP |  10GIL |   3EXP | yousei
enemy_type_imp = 0x14             // 110 HP |  90GIL |  15EXP | koakuma (small devil)
enemy_type_elf = 0x14             //  40 HP |  30GIL |   5EXP | ERUFU
enemy_type_harpy = 0x19           //  60 HP |  40GIL |   8EXP | HA-PI-
enemy_type_thief = 0x1e           //  90 HP |  70GIL |  10EXP | touzoku (thief)
enemy_type_nun = 0x2d             // 140 HP | 100GIL |  20EXP | onna souryo (female monk)
enemy_type_village_girl = 0x37    // 220 HP | 130GIL |  50EXP | mura musume
enemy_type_catgirl = 0x3c         // 180 HP | 120GIL |  30EXP | neko musume
enemy_type_lady = 0x46            // 280 HP | 150GIL |  80EXP | ojyousama (Lady)
enemy_type_dancer = 0x50          // 400 HP | 180GIL | 110EXP | odoriko (dancer)
enemy_type_dominatrix = 0x55      // 350 HP | 160GIL | 100EXP | S no jyouou
enemy_type_mermaid = 0x5a         // 350 HP | 190GIL | 140EXP | ningyo
enemy_type_pixie = 0x15a          // 660 HP | 310GIL | 250EXP | PIKUSHI-
enemy_type_siren = 0x64           // 550 HP | 220GIL | 160EXP | SEIRE-N
enemy_type_wizard = 0x164         // 750 HP | 330GIL | 260EXP | mahoutsukai
enemy_type_pirate = 0x6e          // 500 HP | 210GIL | 150EXP | kaizoku
enemy_type_batwoman = 0x78        // 350 HP | 240GIL | 190EXP | KOUMORI onna
enemy_type_succubus = 0x16e       // 700 HP | 300GIL | 220EXP | SAKYUBASU
enemy_type_demon_girl = 0x18c     // 600 HP | 250GIL | 200EXP | onimusume
enemy_type_amazoness = 0x96       // 650 HP | 280GIL | 210EXP | AMAZONESU
enemy_type_devil = 0x196          // 850 HP | 340GIL | 270EXP | akuma
enemy_type_lilith = 0xee          // 1500HP | 220GIL | 350EXP | RIRITSU
enemy_type_angel = 0x0e           // 1500HP | 360GIL | 300EXP | ENJERU
enemy_type_medusa = 0xc2          // 800 HP | 370GIL | 310EXP | MEDU-SA
enemy_type_venus = 0x00           // 800 HP | 180GIL | 330EXP | BI-NASU
enemy_type_berserker = 0x58       // 1000HP | 190GIL | 340EXP | BA-SE-KA-
enemy_type_great_magic = 0x82     // 900 HP |        | 320EXP | daimadou
enemy_type_oshlina = 0x84         // 2764HP | 150GIL | 850EXP | OSHIRI-NA


rich_presence_conditional_display(byte(0x06d1) == 0x0E, "Titles")
rich_presence_conditional_display(byte(0x0f5d) == 5, // world map
    "Lv{0} {1}, Lv{2} {3}, Lv{4} {5} | {6}0gil",
    rich_presence_value("Level", level(0)),
    rich_presence_lookup("Job", job(0), jobs),
    rich_presence_value("Level", level(1)),
    rich_presence_lookup("Job", job(1), jobs),
    rich_presence_value("Level", level(2)),
    rich_presence_lookup("Job", job(2), jobs),
    rich_presence_value("Money", gil())    
)
rich_presence_conditional_display(map() == 0, "Titles") // BIOS
rich_presence_conditional_display(map() == map_epilogue,
    "Lv{0} {1}, Lv{2} {3}, Lv{4} {5} were victorious | {6}0gil",
    rich_presence_value("Level", level(0)),
    rich_presence_lookup("Job", job(0), jobs),
    rich_presence_value("Level", level(1)),
    rich_presence_lookup("Job", job(1), jobs),
    rich_presence_value("Level", level(2)),
    rich_presence_lookup("Job", job(2), jobs),
    rich_presence_value("Money", gil())    
)
rich_presence_conditional_display(town() == 0,
    "Lv{0} {1}, Lv{2} {3}, Lv{4} {5} in {6} | {7}0gil",
    rich_presence_value("Level", level(0)),
    rich_presence_lookup("Job", job(0), jobs),
    rich_presence_value("Level", level(1)),
    rich_presence_lookup("Job", job(1), jobs),
    rich_presence_value("Level", level(2)),
    rich_presence_lookup("Job", job(2), jobs),
    rich_presence_lookup("Location", location(), locations),
    rich_presence_value("Money", gil())    
)
rich_presence_display("Lv{0} {1}, Lv{2} {3}, Lv{4} {5} in {6} | {7}0gil",
    rich_presence_value("Level", level(0)),
    rich_presence_lookup("Job", job(0), jobs),
    rich_presence_value("Level", level(1)),
    rich_presence_lookup("Job", job(1), jobs),
    rich_presence_value("Level", level(2)),
    rich_presence_lookup("Job", job(2), jobs),
    rich_presence_lookup("Town", town(), towns),
    rich_presence_value("Money", gil())
)

// ==== New Game ====

// * When you finally get control of your character, enter the town (BIRAN) and stay at the inn.
// * Go to the weapon shop and buy 3x "ai no MUJI" (first item) and 3x "nuno no PANTSU" (last item).
// * Go to the northwest house and talk to the old man.
// * Leave town and equip your stuff "soubi" (fifth menu item).
//   - The "ai no MUJI" goes in the "buki" (first slot), and the "nuno no PANTS" goes in the 
//     "ashi" (fourth slot)
//   - Repeat for each character
// * Grind to level 6
//   - Return to town and sleep at the inn to heal
//   - Once you have 90GIL, buy 3x "PISOKU no boushi" (third item) and 3x "hakui" (fourth item) 
//     from the weapon shop.
//     - Remember to equip them in the "atama" (second) and "dou" (third) slots next time you 
//       leave town.

// -- SAVE A --
// * Enter Biran and go to the southwest house and talk to the man.
// * When he leaves, go inside and get the key, and you'll be attacked by the witch.
achievement("Key to the Ruins", "Defeat the witch in Biran", 5,
    trigger = in_game() && map() == map_biran_witch_fight &&
              in_town() && defeat_enemy()
)

// -- SAVE B --
// * Enter the cave
//   - Return to town when you need to rest
//   - Go right to chest (ERO-SHON)
//   - Back and then north, north to another chest (200GIL)
//   - Back and then east, then north. 
//   - The boss will attack at the doorway ("muramusume" [village girl]). You should be ~Lv8
    
achievement("Lost in the Cave [m]", "Defeat the village girl in the cave west of Biran without anyone dying", 5,
    trigger = in_game() && map() == map_cave_boss_fight &&
              location() == location_biran_cave &&
              in_battle() && trigger_when(defeat_enemy()) &&
              all_party_alive_in_battle()
)

// * Enter the next room, and press up against the wall about three quarters of the way
//   to the right side of the screen to find a hidden room.

achievement("I've Got a Job for You", "Find the Red Crystal and unlock the job system", 5,
    trigger = in_game() && map() == map_cave_crystal &&
              byte(0x0d85) == 1 && prev(byte(0x0d85)) == 0
)

// * When you leave the cave, assign jobs to everyone
//   - I recommend a Metal Boy (third option), Doctor (second option), and Masseuse (fourth option)
//   - You'll want every character to master Metal Boy and Doctor before the end of the game.

// ==== KU-PA- ====
// * From the cave, go north.
// * In the southwest building a girl talks about a medicine that can cure any disease.
// * Buy the two magic spells from the magic shop.
//   - FU-MIN    [+50HP]
//   - FINGARA   
// * Go into the northeast building get the man to free his ostrich.

// * Leave town and head west along the coast. You'll find the ostrich in the river.
// * Interact with the ostrich to cross the river.

achievement("Bird Bath", "Cross the river ...on an ostrich", 2,
    trigger = in_game() && map() == map_overworld &&
              byte(0x0f74) == 1 && prev(byte(0x0f74)) == 0
)

// * Head north to the next town

// ==== KANJITA Castle ====
// * The first building on the right is a bar (the inn is upstairs).
//   - There's a flying ship at TORIKOMONASU port
// * In the left building, a woman says Davis lives on Natadekoko island.
// * Middle left building says Hokora is northwest
// * The man in the middle right building says his father was killed by a
//   dragon and wants you to slay it.
// * The weapon shop sells all kinds of upgrades:
//   - ancient vibe (kodai's vibe) - weapon - 42 attack
//   - temptation whip (yuuwaku whip) - weapon - 52 attack
//   - wart cane (IBOIBO no TSUE) - weapon - 40 attack
//   - hell needle (jigoku no HARI) - 37 attack
//   * save your money - we'll buy better stuff at the next town
// * Magic shop [1100g for all five new spells - recommend at least getting IJIMAAIN]:
//   - FU-MIN    [+50HP]
//   - IJIMAAIN  [+100HP]
//   - VIBRA
//   - LIGHT
//   - KIKKOU
//   - MOKKO
// * Proceed north into the castle proper and work your way north and upstairs.
// * Talk to the king (all the way east, then north).
//   - He'll talk about placing a transmitter on the dragon in the northwest.
// * Leave town (equip your new weapons)

// ==== TORIKOMONASU port ====
// * Head east from Kanjita
// * In the first house, a woman talks about Triponema to the east, and the man says Davis lives
//   up in the sky on Nata de Coco island.
// * A man in the third house says Tsukesi sits atop the southern mountains.
// * A man in the house near the weapon shop says a famous scientist, Shisido, lives in
//   Baltolin port, on the other continent.
// * The weapon shop sells all kinds of upgrades:
//   - kurunuri no vibe (kurunuri's vibe) - 54 > 49 attack
//   - jet black whip (shikkoku no MUCHI) - 54 > 69 attack
//   - pirate's rotor (kaizoku no RO-TA-) - 54 > 44 attack +5 agility
//   - filthy nails (fuketsuna TSUME) - 54 > 69 attack
//   - rubber cow (GOMU no baushi) - 28 > 31 defense
//   - leather suit (kawa no SU-TSU) - 28 > 31 defense
//   - love pants (ai no PANTSU) - 34 > 36 defense
//   - angel ring (tenshi no yubiwa) - ?
//   * Buy three rubber cows (120), three leather suits (180), and three love pants (240)
//     If you still have money left, also buy as many jet black whips as you can afford.
// * Magic shop (10/21):
//   - IJIMAAIN  [+100HP]
//   - ZETSURINGA (unequaled love)
//   - NA-SU IDEN (nurse genetics?)
//   - NAMIKOSHIN

// * Leave town, equip your new weapons, and grind to level 18 or so.
// * Return to both towns and buy all the unknown magic spells (10/21) and
//   jet black whips for everyone.
// - You'll probably master at least one of your first jobs. Don't worry about it
//   just yet. We'll swap after getting new jobs soon.
// - Make sure to equip your secondary job skills too. (second menu option is abilities)
//   - The masseuse automatically equips KAUNTA- (counter), udePISUTON (3x med hits) or 
//     yubiBAIBU (6x small hits) are good secondary skills.
//   - The doctor's only skill is kaifuku (recovery).
//   - Metalboy gets masatsu (fire attack). ROUSOKU (crit) is a good secondary.

// ==== Kanjita Cave ====
// * Head northwest to the cave.
// -- SAVE C --
// * Inside, head left for an ERO-TION, and all the way right for 100GIL.
// * At the next intersection, head left for a RIKIHORUMONO
// * Head right and attempt to enter the cave for a boss fight.
//   - ROUSOKU (metalboy) does big damage (~135)
//   - udePISUTON (masseuse) does moderate damage (~115)
//   - Amazoness has 650 HP (2x ROUSOKU + udePISUTON = 500, need another 150 from third character)

achievement("A Quickie with an Amazon [m]", 
            "Defeat the Amazoness in the Kanjita cave in 6 actions or less", 5,
    trigger = in_game() && map() == map_cave_boss_fight &&
              never(location() != location_kanjita_cave) &&
              never(!in_battle()) &&
              once(enemy_type() != 0x96) && // battle flag will get set before enemy type updates
              enemy_type() == 0x96 &&
              trigger_when(enemy_state() == 3) &&
              // count to 7 because count increments before action
              never(repeated(7, active_battle_participant() != prev(active_battle_participant()) &&
                                active_battle_participant_is_player()))
)

// * After the boss, enter the cave. Talk to the dragon and give him the transmitter.
// * You'll automatically proceed to the hidden room and earn three more jobs

achievement("The Dragon's Plight", "Find the Green Crystal and unlock more jobs", 5,
    trigger = in_game() && map() == map_cave_green_crystal &&
              byte(0x0d85) == 2 && prev(byte(0x0d85)) == 1
)

// * Leave the cave and assign new jobs. Remember to select secondary actions from your first job!
//   - esper is a support class with minuku (examine)
//   - PONbiki (swindler) is a support class with bougyu (shields) and nigeashi (flee)
//   - oyaji is another damage dealing class

// * Return to Kanjita castle and talk with the king. He'll offer you the royal boat at the port.
// * Before leaving, grab the two chests on the first floor for 500g and a RIKIHORUMONO.
// * Go to Trikomonas and talk to the man at the northern dock. He has medicine for the girl in Cooper.

// -- SAVE D -- (forgot)

// * Return to Cooper. Talk to the ailing family in the southeast house.
// * Their daughter will give you a RIKIHORUMONO and a "special very deep lightning kiss".

achievement("Special Thanks", "Help the bed-ridden woman in Cooper", 5,
    trigger = in_game() && map() == map_cooper_house3 &&
              byte(0x0f71) == 1 && prev(byte(0x0f71)) == 0
)

// * Return to the Trikomonas and talk to the man at the northern dock again and he'll thank you
//   then move out of the way so you can get on the boat.

// ==== Triponema ====
// * The weapon shop sells all kinds of upgrades:
//   - kurunuri no vibe (kurunuri's vibe) - 54 > 49 attack
//   - jet black whip (shikkoku no MUCHI) - 54 > 69 attack
//   - staff of happiness (shiawase no tsue) - 74 > 29 attack, 41 > 61 defense
//   - heaven's needle (tengoku no HARI) - 74 > 64 attack
//   - skin head (SUKIN HEDDO) - 41 > 43 defense
//   - requested clothes (yousei no fuku) - 41 > 44 defense
//   - requested pants (yousei no pantsu) - 41 > 43 defense
//   - star ring (hoshi no yubiwa) - 74 > 79 attack, 41 > 48 defense
//   * buy three of each of the last four items [2880gil]. Leave town to equip them.
// * The item shop sells pheromones (FEROMON) for 400g each and hormones (HORUMON) for 1000g each.
// * Magic shop (11/21):
//   - VIBRA
//   - MEGUSURIN (eyedrops)
// * Lady in lower right building says the doctor at the hospital is skilled.
// * You can't enter the large northern building for now.
// * The man outside the inn says they're booked and to come back later.
// * Enter the left side of the inn to find out about something being sold that we can't
//   afford right now.
// * Now you can enter the inn!

// -- SAVE E --
// * Stay the night at the inn. Kororu will wake up in the middle of the night and return to the shop.
//   The shopkeeper will reveal themselves and attack Kororu. The others will arrive and take
//   him to the hospital.
// * The doctor will tell the surgery was successful, and the nurse will take half your
//   money.

achievement("The Price of Desire", 
            "Purchase a naughty book in Triponema and get more than you bargained for", 3,
    trigger = in_game() && map() == map_triponema_hospital &&
              byte(0x0f75) == 3 && prev(byte(0x0f75)) == 2
)

// * Leave town and automatically sail to Bartholin

// ==== Bartholin ====
// * The weapon shop sells all kinds of upgrades, but you probably won't have much money because of 
//   the previous ambush. There's better stuff in the next town anyway.
//   - earth's tool (daichi no BAIGU) - 81 > 91 attack
//   - slumber plain (madoromi no MUJI) - 81 > 101 attack
//   - forked cane (futamata no tsue) - 81 > 91 attack
//   - request rotor (yousei no RO-TA) - 81 > 71 attack, +10agility
//   - stocking (SUTOKKINGU) - 57 > 59 defence
//   - requested clothes (yousei no fuku) - have
//   - requested pants (yousei no pantsu) - have
//   - dream fingers (yume no yubira) - 81 > 83 attack
// * Magic shop (13/21):
//   - ZETSURINGA
//   - NUKAZUNGA
//   - FINGARA
//   - VIBRA
//   - LIGHT
//   - KIKKOU
//   - MOKKO
//   - RIBA-SU
// * The man in the southeast building says no one can climb the mountain on foot.
// * The man in the southwest building says even he's never ridden on an airship
// * Upstairs, Chikarai, daughter of Shishido, wants an escort to Chlamydia villiage. You'll
//   automatically do so.

// ==== Chlamydia ====
// * The weapon shop sells all kinds of upgrades:
//   - two pronged tool (futamata no BAIGU) - 82 > 112 attack
//   - cane of happiness (shiawase no tsue) - 82 > 37 attack, 58 > 78 defense
//   - dancer's rotor (odoriko no RO-TA-) - 82 > 102 attack, 23 > 43 agility
//   - magic-sealing needle (mafuuji no HARI) - 82 > 92 attack
//   - shadow blue suit (inchin no SU-TSU) - 58 > 64 defense, 23 > 25 agility
//   - shadow blue pants (inchin no PANTSU) - 58 > 60 defense
//   - fingers of light (hikari no yubira) - 82 >87 attack
// * Magic shop (17/21):
//   - IJIMAAIN
//   - MUYUZUMIN
//   - NA-SUIDEN
//   - NAMIKOSHIN
//   - POSUTONGA
//   - KONDO-MU
//   - GURAINGA
// * The villagers talk about a man on top of the mountain.

// * Leave town and grind up to level 30 or so.
//   - buy 3x odoriko no RO-TA- [1800g], 3x inchin no SU-TSU [450g], and
//     3x inchin no PANTSU [600g] from Chlamydia, and make sure to equip them.
//   - also buy all the skills you don't yet know from both towns.

// -- SAVE F --
// * Return to Bartholin and enter the large unlabelled building in the middle left.
// * Talk to the man and choose the first option.

achievement("Premature Evacuation", "Take a ride on the airship", 5,
    trigger = in_game() && map() == map_bartholin_airship &&
              byte(0x0f78) == 1 && prev(byte(0x0f78)) == 0
)

// * Head north and enter the tower

// ==== Mountain Tower ====
// * From the entrance, go west, south a bit, west more, then north for a Pheromone.
// * Backtrack toward the entrance and head north up the long hallway.
// * Just north and east of the intersection is a pot. Examine it for a full HP/mana restore.
// * Go around the cave to the north, east, then south, east, and then north for an empty chest.
// * Return to the pot and grind to level 35 (using the pot to heal).

// -- SAVE G --
// * Head north and west from the pot and attempt to enter the cave and fight Lilith (1500HP).
// * For the challenge:
//   - equip secondary kills like masatsu (metalboy), kaifuku (doctor), denkianma (boss)
//   - amatuer actually gets to pick two per character.

achievement("Unemployed [m]", "Defeat the Lilith in the tower while everyone has the Amateur job equipped", 5,
    trigger = in_game() && map() == map_cave_boss_fight &&
              location() == location_mountain_tower &&
              in_battle() && trigger_when(defeat_enemy()) &&
              job(0) == job_amateur &&
              job(1) == job_amateur &&
              job(2) == job_amateur
)

// * Enter the cave.

achievement("Unwavering Commitment", "Find the Blue Crystal and unlock more jobs", 5,
    trigger = in_game() && map() == map_cave_blue_crystal &&
              byte(0x0d85) == 3 && prev(byte(0x0d85)) == 2
)

// * After unlocking the final jobs, you'll automatically return to Chlamydia
//   - Equip new jobs on everyone
// * Head back to Bartholin and talk to the airship man to travel to Nata de Coco island.
// * Head northwest to Wasserman

// ==== Wasserman ====
// * Weapon Shop:
//   - tsuranuki no BAIDO  weapon      106 > 136 attack
//   - nyoibau             weapon      106 > 126 attack
//   - eikou no TSUME      weapon      106 > 131 attack
//   - zetsurin SU-TSU     shirt       70 > 79 def, 30 > 32 agi
//   - AMITAITSU           pants       70 > 72 def
//   - HIMENUITSU          accessory   136 > 151 att, 73 > 76 def
//   * Buy 3x tsuranuki no BAIDO (2100g), 3x zetsurin SU-TSU (900g),
//     3x AMITAITSU (900g), and as many HIMENUITSU as you can afford (up to 6000g)
// * Magic Shop (21/21):
//   - FU-MIN
//   - MUYUZUMIN
//   - TANEUMUNGA *
//   - PISUTONA *
//   - MEGUSURIN
//   - RIBA-SU (reverse)
//   - TSUWATSUWABO-SHI *
//   * If you buy nothing else, get PISUTONA, you'll need it soon.
// * A woman in the southern house tells how Davis used to be a light wizard but became
//   frustrated when she couldn't be satisfied and turned into a dark wizard.
// * Enter the southwestern-most house. A lady will trick you and take the crystals for Davis.
//   - You can't enter Davis's castle unless you do this.
// * A friend from the past will come by and give you a pep talk.

// * Grind to 40 or so, then stock up on RIKIHORUMON and IREKUTA- from the item shop
//   - RIKIHORUMON restores 200 mana in battle
//   - IREKUTA- restores everyone's HP and mana, but can only be used at a save point.
//   - there's no other way to get mana back during the final dungeon.
//   - make sure to have at least two characters master the Metal Boy job.

// * Head east to the castle.

// ==== Davis Castle ====
// * Enter the carpeted area on the right and head north.
// * Proceed north into the next carpeted area.
// * Head up through the middle of the room, then west to an empty chest.
//   - The chest on the other side of the wall is also empty.
//   - The blue square at the right end of the hallway lets you access the menu
//     without having to go outside.
// -- SAVE H --
//   - select the masatsu skill as a secondary skill on as many characters as you can.
//   - alternately, select the Metal Boy job with good secondary skills
//     - I like MetalBoy + kanchouB (boss) x2 and MetalBoy + kaifuku (doctor)
// * Go up the rightmost hallway to fight Oshlina (2764HP).
//   - have all three characters use PISUTONA on her (under masatsu [metal boy])
//   - metal boy skills (FINGARA, BAIBURA, PISUTONA) seem to be the only things that don't miss

achievement("Some Like It Hot", "Defeat Oshlina", 10,
    trigger = in_game() && town() == town_davis_castle &&
              enemy_type() == 0x84 &&
              enemy_state() == 3
)

// * Go up the stairs.
// * Enter the first room to the south. Head west, then south again.
// * When you reach the southern wall, turn east and follow the path north.
// * Take the first south and reach another blue tile and save.
//   - You could change jobs now, but keep PISUTONA handy.
//   - Remember to use IREKUTA- to keep your HP/MP full.
// -- SAVE I --
// * Go back to the north and follow the eastern path to the next set of stairs where you'll have
//   to fight Oshlina again.

achievement("Asking for More", "Defeat Oshlina again", 5,
    trigger = in_game() && town() == town_davis_castle4 &&
              enemy_type() == 0x84 &&
              enemy_state() == 3
)

// * Go up the stairs.
// * Head all the way south. The first doorway leads to an empty chest.
// * The easternmost hallway also leads to an empty chest.
// * Go north through the third doorway. There's a blue tile in the northernmost room.
// * Grind to level 45. The extra HP and MP will be useful against Davis.
// -- SAVE J --
//   - switch everyone to metalboy/doctor combinations so everyone has masatsu (PISTONA) 
//     and kaifuku (IJIMAAIN)
// * Then head west through the gap in the wall and face Oshlina again.

achievement("Through Playing Around", "Defeat Oshlina a third time", 5,
    trigger = in_game() && town() == town_davis_castle5 &&
              enemy_type() == 0x84 &&
              enemy_state() == 3
)

// * Return to the save point and use a IREKUTA- to top off HP and MP.
//   - Keep all characters as metalboy/doctor with masatsu and kaifuku
// -- SAVE K --
// * Go back to where you fought Oshlina and take a few more steps forward to face Davis herself.
//   - Davis has about 8086 HP. Each form has around 2000HP.
//   - The strategy is simply to cast MUYUZUMIN (25MP) on anyone with less than 1500 HP,
//     otherwise use PISTONA (45MP). You should have at least three RIKIHORUMONs. They restore
//     200MP each. When you get to her fourth form, use one per character.

achievement("Happy Endings", "Defeat Davis", 25,
    trigger = in_game() && prev(town()) == town_davis_castle6 &&
              map() == map_epilogue
)

// ========================

job_ranks = {
    job_gigolo: 2,
    job_doctor: 6,
    job_metal_boy: 5,
    job_masseuse: 5,
    job_esper: 5,
    job_swindler: 4,
    job_oyaji: 5,
    job_animal: 2,
    job_fat_warrior: 3,
    job_yakusha: 5,
}

// these are actually one byte prior to the start so the addition ends up at the end of each job
hero_addr = 0x0e7b
ririn_addr = 0x0ea5
kororu_addr = 0x0ecf

for job in job_ranks
{
    hero_addr = hero_addr + job_ranks[job]
    ririn_addr = ririn_addr + job_ranks[job]
    kororu_addr = kororu_addr + job_ranks[job]

    achievement("Master " + jobs[job],
                "Master the " + jobs[job] + " job", 5,
                trigger = in_game() &&
                          ((byte(hero_addr) == 0 && prev(byte(hero_addr)) != 0) ||
                           (byte(ririn_addr) == 0 && prev(byte(ririn_addr)) != 0) ||
                           (byte(kororu_addr) == 0 && prev(byte(kororu_addr)) != 0))
    )
}

// NOTE: is YARINIGEN ($0e35) actually available anywhere?
achievement("Book Smart", "Purchase all the skills available from magic shops", 5,
    trigger = byte(0x06d1) == 0x0c && // in "buy" menu
              measured(sum_of(range(0x0e24, 0x0e39), a => byte(a)) == 21) &&
              sum_of(range(0x0e24, 0x0e39), a => prev(byte(a))) == 20
)