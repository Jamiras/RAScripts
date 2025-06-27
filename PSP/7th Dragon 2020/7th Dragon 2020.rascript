// 7th Dragon 2020
// #ID = 16452

// Quest notes: https://docs.google.com/spreadsheets/d/1uxwcI8qQwrHxzTJCysNPkoo4oPf_ZvO98ynlNf_LnVE/edit?gid=8#gid=8

function current_playtime_frames() => dword(0xa9b5f0)

function character_base(index) => 0xa9b628 + index * (0xa9c32c - 0xa9b628)
function character_class(index) => byte(character_base(index) + 0x00)
function character_level(index) => word(character_base(index) + 0x0c)

class_samurai = 0
class_trickster = 1
class_destroyer = 2
class_psychic = 3
class_hacker = 4

classes = {
    class_samurai: "Samurai",
    class_trickster: "Trickster",
    class_destroyer: "Destroyer",
    class_psychic: "Psychic",
    class_hacker: "Hacker",
}

function current_location() => dword(0x1098844)
location_tokyo_city_hall_plaza = 0xAD
location_tokyo_city_hall_entrance = 0xA2
location_tokyo_city_hall_2F = 0xA3
location_tokyo_city_hall_3F = 0xA4
location_tokyo_city_hall_4F = 0xA5
location_tokyo_city_hall_10F = 0xA6
location_tokyo_city_hall_roof = 0xA7
location_tokyo_city_hall_cutscene = 0x14
location_white_house_cutscene = 0x0C
location_shinjuku_shelter_hospital = 0xAA
location_shinjuku_shelter = 0x0B
location_shinjuku_shelter_factory = 0xA9
location_shinjuku_shelter_headquarters = 0xA8
location_city_map = 0x01
location_tokyo_hall_inverted_plaza = 0x22
location_tokyo_hall_inverted_entrance = 0x1A
location_tokyo_hall_inverted_2F = 0x1B
location_tokyo_hall_inverted_3F = 0x1C
location_tokyo_hall_inverted_4F = 0x1D
location_tokyo_hall_inverted_floating_reef = 0x20
location_tokyo_hall_inverted_11F = 0x1E
location_tokyo_hall_inverted_12F = 0x1F
location_tokyo_hall_inverted_roof = 0x21
location_murakumo_dorm_4f_unit_13_room = 0xBC
location_murakumo_dorm_4f = 0xBA
location_murakumo_dorm_4f_unit_10_room = 0xBB
location_meeting_room_7f = 0xAF
location_meeting_room_7f_meeting_room = 0xB0
location_city_hall_entrance_1f = 0xAE
location_shibuya_flowersea_station_crossing = 0x27
location_shibuya_flowersea_dogenzaka = 0x29
location_shibuya_flowersea_upper_dogenzaka = 0x2D
location_shibuya_flowersea_lower_dogenzaka = 0x2E
location_murakumo_hq_5f = 0xB1
location_murakumo_hq_5f_control_room = 0xB2
location_murakumo_hq_5f_personnel_room = 0xB3
location_laboratory_6f = 0xBD
location_laboratory_6f_room = 0xBE

locations = {
    location_tokyo_city_hall_plaza: "City Hall",
    location_tokyo_city_hall_entrance: "City Hall",
    location_tokyo_city_hall_2F: "City Hall",
    location_tokyo_city_hall_3F: "City Hall",
    location_tokyo_city_hall_4F: "City Hall",
    location_tokyo_city_hall_10F: "City Hall",
    location_tokyo_city_hall_roof: "City Hall",
    location_tokyo_city_hall_cutscene: "City Hall",
    location_white_house_cutscene: "City Hall",
    location_shinjuku_shelter_hospital: "Shinjuku Shelter",
    location_shinjuku_shelter: "Shinjuku Shelter",
    location_shinjuku_shelter_factory: "Shinjuku Shelter",
    location_shinjuku_shelter_headquarters: "Shinjuku Shelter",
    location_city_map: "City Map",
    location_tokyo_hall_inverted_plaza: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_entrance: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_2F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_3F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_4F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_floating_reef: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_11F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_12F: "Tokyo Hall Inverted",
    location_tokyo_hall_inverted_roof: "Tokyo Hall Inverted",
    location_murakumo_dorm_4f_unit_13_room: "City Hall",
    location_murakumo_dorm_4f: "City Hall",
    location_murakumo_dorm_4f_unit_10_room: "City Hall",
    location_meeting_room_7f: "City Hall",
    location_meeting_room_7f_meeting_room: "City Hall",
    location_city_hall_entrance_1f: "City Hall",
    location_shibuya_flowersea_station_crossing: "Shibuya Flowersea",
    location_shibuya_flowersea_dogenzaka: "Shibuya Flowersea",
    location_shibuya_flowersea_upper_dogenzaka: "Shibuya Flowersea",
    location_shibuya_flowersea_lower_dogenzaka: "Shibuya Flowersea",
    location_murakumo_hq_5f: "City Hall",
    location_murakumo_hq_5f_control_room: "City Hall",
    location_murakumo_hq_5f_personnel_room: "City Hall",
    location_laboratory_6f: "City Hall",
    location_laboratory_6f_room: "City Hall",
}

entity_type_rabi = 2
entity_type_bluegrass_nymph = 4

rich_presence_conditional_display(character_class(0) == 0xFF, "Titles")

rich_presence_conditional_display(character_class(1) == 0xFF, "Lv{0} {1} | {2} | {3}",
    rich_presence_value("Level", character_level(0)),
    rich_presence_lookup("Class", character_class(0), classes),
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="SECS") // 30fps
)

rich_presence_conditional_display(character_class(2) == 0xFF, "Lv{0} {1} and Lv{2} {3} | {4} | {5}",
    rich_presence_value("Level", character_level(0)),
    rich_presence_lookup("Class", character_class(0), classes),
    rich_presence_value("Level", character_level(1)),
    rich_presence_lookup("Class", character_class(1), classes),
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="SECS")
)

rich_presence_display("Lv{0} {1}, Lv{2} {3}, and Lv{4} {5} | {6} | {7}",
    rich_presence_value("Level", character_level(0)),
    rich_presence_lookup("Class", character_class(0), classes),
    rich_presence_value("Level", character_level(1)),
    rich_presence_lookup("Class", character_class(1), classes),
    rich_presence_value("Level", character_level(2)),
    rich_presence_lookup("Class", character_class(2), classes),
    rich_presence_lookup("Location", current_location(), locations),
    rich_presence_value("Time", current_playtime_frames() / (30*60), format="SECS")
)

function story_achievement(title, description, points, location, bit)
{
    achievement(title, description, points, type="progression",
        trigger = current_location() == location && bit == 1 && prev(bit) == 0
    )
}

function quest_achievement(title, points, location, bit)
{
    achievement("Quest: " + title, "Complete the " + title + " quest", points,
        trigger = current_location() == location && bit == 1 && prev(bit) == 0
    ) 
}



// ===== Chapter 0 =====
// ----- City Hall Plaza -----
// * Select a portrait and class for your character
//   - Samurai - All around. 
//               Good attack skills, has self heal, self buffs, and gets a pretty useful party buff later on.
//   - Hacker - Buffer/Debuffer.
//              Buffs are fairly useful but it depends on your playstyle.
//              Hacking is somewhat useless because it takes up 2 turns (and sometimes misses).
//   - Psychic - Healer/Mage type. 
//               Targets elemental weaknesses and heals/revives your team.
//               Pretty much a requirement in every party unless you want to use up your items.
//   - Trickster - Debuffer/Anti-air.
//                 Dagger skills inflict Status effects on enemies.
//                 Gun skills are effective on flying enemies.
//                 EX Skill is probably the most broken in the game.
//   - Destroyer - Attacker/Defender.
//                 Good damage output but is also an effective defender due to Counter Stance.
// * After being told about your mission, walk up to the terminal and add two more party members (Log in > Entry).
//   - A "common" party is Destroyer/Trickster/Psychic
//   - An alternate suggestion is Samurai/Hacker/Psychic
// * They'll automatically be assigned to your party.
// * Head north and talk to the man standing in front of the building.

// ----- City Hall 1F -----
// * After more dialog and a demo fight, save at the green ball, then head up the stairs.

// ----- City Hall 2F -----
// * Being level 1 makes this difficult. Don't be afraid to use healing items. 
//   Once you hit level 2, it's easier to kill the enemies, and by level 4 you can just use Auto.
// * Head west (lower left of screen), then south (lower right), then east (upper right) to a door.
//   Just keep moving forward until you're in the room just east of where you entered the floor.
// * Open the chest for Medicine x5 [bit2(0xa98790)], then head up the stairs.

// ----- City Hall 3F -----
// * Loop around to the southern hallway and enter the doorway to get to the center of the floor.
// * Open the chest for Mana Water x3 [bit3(0xa98790)], then go back out.
// * Head west down the hallway (passing the next doorway).
// * Keep going until you encounter Gatou, who will teach you First Aid (S).

// ----- City Hall 4F -----
// * Follow the hallway around to the save point and save.
// * A bit farther and you'll encounter Gatou and Nagare talking.
// * Keep going down the hallway and around the corner where you'll find a chest with Heal Aro I x2 [bit5(0xa98790)].
// * Go back and talk to Gatou. Let him know you're ready, and you'll get to fight the first boss.
//   - You should be level 4.
//   - D1 has 250 LF. Just have everyone use their Skill and it should be dead in three turns.
// * Exit through the northeast door and get another speech from Gatou.
// * Head around the hallway to the east and then south for a chest containing Medicine x3 [bit4(0xa98790)].
// * Go back and enter the elevator

// ----- City Hall 10F -----
// * Head down the west hallway and keep going until you get to the elevators. Take one to the roof.

// ----- City Hall Roof -----
// * You'll immediately be thrown into battle with D2.
//   - You'll probably still be level 4.
//   - D2 has 300 LF. 
//   - Just like the first dragon have everyone use their skills and use Medicine if someone drops below half.

story_achievement("Training Interrupted", "Defeat the dragon on the roof of City Hall", 5, 
                  location_tokyo_city_hall_cutscene, bit1(0xa98758))

// * After a brief cutscene, you'll immediately be thrown back into battle with Warcry.
//   - Warcry has 80000 LF. You can't defeat it now. After a couple rounds, he'll wipe your party.
// * There's another cutscene, then the game title video plays. Then you wake up in a hospital.

// ===== Chapter 1 =====
// ----- Shijuku Shelter -----
// * Save, and then step out of the room for another brief cutscene.
// * Leave the room again, and head east. Behind the first door is a shop where you can buy supplies if you need any.
//   - Suggest buying as many Heal Aeros as you can afford. You won't be coming back.
// * Keep moving down the hallway and you'll run into Natsume. When asked to join Murakumo, say yes.
// * Agree to help take back City Hall.
// * Go back to the hospital to meet Nav 3.6 and Nav 3.7, and complete your checkup.
// * Save, and the leave the shelter.

// ----- Tokyo Hall Inverted -----
// * Go into the building and jump into the hole

// ----- Tokyo Hall Inverted 2F -----
// * In the first large room, head west to a check containing 30Az [bit5(0xa98796)].
// * Head back through the first room and north from the next room for a chest containing Escape Kit x3 [bit4(0xa98796)].
// * Go all the way south and navigation through the rubble in the next big room.
// * Continue south and jump into the hole

// ----- Tokyo Hall Inverted 3F -----
// * Head east into the next room and through the rubble. 
//   - A chest in the northeast corner has Mana Water x2 [bit7(0xa98796)]
// * Go back to the center of the room, then head north. At the fork, head west.
//   - You should have enough SP now to level up skills - I went level 2 for the already known skill and LIFE bonus.
// * After saving, try leaving north and you'll encounter a boss.
//   - Hammerhead has 400 LF. You'll probably be Lv. 6.
//   - All three characters start the battle with a full Exhaust meter. Exhaust and Skill everyone for the first turn.
//     Continue to Skill and use Medicines on anyone below 25 LF.
// * Follow the hallway to the next room. After going around the rubble, you'll see a green crystal. This serves as
//   a checkpoint. Interact with it to open a portal between the 3F and the entrance.
// * You can't go down the west hall yet, so head east instead. Keep following the hallway north.
// * In the next room, head west, then fight stuff until you reach level 7. 
//   - If you've already reached level 7, make sure your LF is full and your MN is at least half.
// * Head south to fight another Hammerhead.
//   - You won't have an Exhaust meter this time, but otherwise the strategy is the same.
// * Open the chest for Nano Aid x2 [bit6(0xa98796)].
// * Go back to the last room and west to fight another Hammerhead.

achievement("Head-banging", "Defeat the three Hammerheads on the third floor of Tokyo Tower Inverted", 
    points = 5, type="progression",
    trigger = current_location() == location_tokyo_hall_inverted_3F && 
              bit7(0xa98758) == 1 && bit6(0xa98758) == 1 &&
              (prev(bit7(0xa98758)) == 0 || prev(bit6(0xa98758)) == 0)
)
    
// * Return to the exit point and leave the tower. Then return to Shinjuku Shelter.

// ----- Shinjuku Shelter -----
// * Go into the hospital (first door) and Rest at the bed. This restores your LF and MN, but also replenishes any 
//   limited use skills you may have used.
// * Leave the hospital and enter the next door to the right. Watch a cutscene and learn the Revive Technique.
// * Talk to the girl at the back of the room for a Medicine. Upgrade your weapons and restock your Medicine.
// * Go back to Tokyo Hall Inverted 3F

// ----- Tokyo Hall Inverted 3F -----
// * Head west down the hallway that you couldn't go down earlier and jump into the hole.

// ----- Tokyo Hall Inverted 4F -----
// * Go south, then east through the next room.
//   - Now, you can see the dragons patrolling. Sneak up behind it and attack!
// * Head north and around to a chest containing Heal Aero I x2 [bit2(0xa98797)]
// * Go back to the main room, then south. Gatou will call you.
// * Move south through the next room and follow the hallway to a chest containing 150 Az [bit0(0xa98797)].
// * Return to the last large room and head west, where you'll encounter another patrolling dragon.
// * Go west down the hallway for a chest containing Ozonol x4 [bit1(0xa98797)].
// * Go back to the last room and then south. Nav 3.7 will call you.
// * Step through the glowing door.

// ----- Tokyo Hall Inverted Floating Reef -----
// * Walk to the lower left, then Jump across the abyss. 
//   - Keep progressing and jumping until you reach the big island with the guard.
// * Jump right, then right again for a chest containing Heal Aero II x1 [bit7(0xa98797)].
// * Jump back to the last platform, then north. across several more platforms until you can get back into the building.

// ----- Tokyo Hall Inverted 11F -----
// * Head north to the intersection.
// * At the end of the west hall is a Paras Guard [bit4(0xa98797)].
// * Go back to the intersection, then east to deliver the gear to the guards.
// * Behind the guards is the exit point. Learn it.
// * Keep heading east to encounter a new dragon. Salamander has 280 LF.
// * Grab the chest beyond where he was for an SP Up 100 [bit6(0xa98797)].
// * Go west and then north back to the main room. Keep going north.
// * At the intersection, head west and kill another Salamander.
// * Behind it is a chest containing Heal Aero II x2 [bit3(0xa98797)].
// * Return east through the intersection and kill another Salamander.
// * Go north, then around to the north side of the room for a chest containing Guard Ring x1 [bit5(0xa98797)].
// * Go back through the center of the room and west down the long hallway.
// * Jump into the hole at the end.

// ----- Tokyo Hall Inverted 12F -----
// * Head south into the main room. A guard will tell you Gatou is on the roof.
// * Keep heading south to the save point. Upgrade your skills and save. Then jump into the hole.

// ----- Tokyo Hall Inverted Roof -----
// * Gatou doesn't want any help, but we're going to help anyway.
//   - Wounded Warcry has 1200 LF. You should be level 10.
//   - Hopefully your Exhaust meters are full again. Feel free to use them!
//   - If you have Decoy Mirror, keep it active.

achievement("Rescue Mission", "Save Gatou and Nagare from Wounded Warcry", points = 5, type="progression",
    trigger = (current_location() == location_tokyo_hall_inverted_11F || current_location() == location_city_map) && 
              bit2(0xa98758) == 1 && prev(bit2(0xa98758)) == 0
)

// ===== Chapter 1.5 =====
// ----- City Hall 4F Murakumo Dorm -----
// * Step out into the hallway.
// * Press R and select 7F Meeting Room.

// ----- City Hall 7F Meeting Room -----
// * After the briefing, leave the room, then go to 1F Entrance.

// ----- City Hall 1F Entrance -----
// * Go to the center part of the room and talk to Miya.
// * Go to the west side and upgrade your armor. Also upgrade your weapons if you can afford it.
//   Feel free to sell any weapons/armor you're not using.
// * Spend your remaining money on a couple Escape Kits and Mana Water
// * Remember to upgrade your skills too. If you bought a gun for your trickster, make sure he has Aimed Shot.
// * Use the Tokyo Map to go to Shibuya Flowersea

// ----- Shibuya Flowersea - Station Crossing -----
// * Kill the two Salamanders out front, then walk up the west path

// ----- Shibuya Flowersea - Dogenzaka -----
// * Kill the two Salamanders and the Chemical Dragon, then walk up the tree branch and open the chest containing 
//   Posionol x6 [bit6(0xa9879c)].
// * Go under the branch and see a man facing a dragon. Turns out it's just a group of monsters who are easy to kill.
// * Continue along the path to the next area.

// ----- Shibuya Flowersea - Upper Dogenzaka -----
// * Kill the Chemical Dragon. Continue down the hall and kill two more Chemical Dragons.
// * Proceed north and around the corner to a save point.
// * In the northwest corner of the room with the save point is a chest containing 80Az [bit1(0xa9879d)].
// * Head south and save Yuki from a Salamander.
// * At the end of the southern hallway is a chest containing Mana Water x3 [bit0(0xa9879d)].
// * Go back to where you saved Yuki and head east into the next area.

// ----- Shibuya Flowersea - Dogenzaka -----
// * Approach two more survivors (Ino and Guchi), then kick their butt.
// * Open the nearby chest for Heal Aero II x2 [bit7(0xa9879c)], then head west into the next area.

// ----- Shibuya Flowersea - Lower Dogenzaka -----
// * Kill the Sumo Dragon and keep heading west until Nav tells you to examine the trash can. Do so.
// * Head west a bit and kill another Sumo Dragon.
// * At the end of the path is a chest containing Venom Guard x1 [bit2(0xa9879d)]. Equip it!
// * Go back to the trash can, then north, and east to another save point. Keep going east to the next area.

// ----- Shibuya Flowersea - Dogenzaka -----
// * After a short cutscene, you'll have to face another Sumo Dragon.
// * Key trigger [New People] is now unlocked.

story_achievement("Worth a Hundred Ordinary Troops", "Save Nami and Aoi at Shibuya Flowersea", 5,
                  location_shibuya_flowersea_dogenzaka, bit1(0xa9878a)
)

// * Use an Escape Kit and return to City Hall.

// ----- City Hall 1F Entrance -----
// * Go to the center part of the room and talk to Miya.
// * Repair the Murakuma HQ and Laboratory. Meet Sharon.
// * Go back to the entrance and talk to Sharon. Accept both quests.
// * Head to the left side and buy two Guard Rings and two Attack Rings.
// * Go to the 6th floor.

// ----- City Hall 6F Laboratory -----
// * Talk to Shibuki in the southeast room. She'll request you rescue 15 survivors.
//   If you talk to her again, she should tell you that you've rescued 4 so far.
// * Proceed into the right lower door and Natsume will ask you to seek out SKY members.
// * Go to the 5th floor.

// ----- City Hall 5F Murakuma HQ -----
// * Enter the right lower door and talk to Masaki. You'll get 300SP each, and get new skills to unlock.
// * Leave City Hall and head to the Shinjuku Shelter.

// ----- Shinjuku Shelter -----
// * Walk up the hall to the northeast. Examine the glowing dot.
// * Return to City Hall.

// ----- City Hall 1F Entrance -----
// * Talk to the woman near the save point to complete the "Look for Medicine" quest.

quest_achievement("Look for Medicine", 2, location_city_hall_entrance_1f, bit6(0xa986e8))


