// Ranma 1/2: Byakuran Aika - らんま 白蘭愛歌 (White Orchid Sera)
// #ID=33146

// Main menu:
// * From the Beginning   * Continue

// Common menus:
// * 見る - look
//   * まわり - around
// * 話し - talk
// * 考える - think
// * 移動 - move/go
// * 蹴る - kick

// Fighting (https://ranma.fandom.com/ja/wiki/%E3%82%89%E3%82%93%E3%81%BE1/2_%E7%99%BD%E8%98%AD%E6%84%9B%E6%AD%8C):
// * 突 - strike 
// * 蹴 - kick
// * 必 - special move
// * 闘 - fighting spirit
//
// Opponent's selection is briefly visible before its covered.
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)
//   - so, if your opponent picks strike, kick them
// When damage is received, the fighting spirit meter fills up. At 5 dots or higher, Fighting Spirit can be used.


// People:
// * 乱馬 - Ranma
// * あかね - Akane
// * 早雲 - Soun (Akane's father)
// * 九能 - Kunou
// * 右京 - Ukyou
// * シャンプー - Shampoo
// * 良牙 - Ryoga
// * 二重博士 - Dr. Futatsu (lit. double doctor)

// Places:
// * 天道家 - Tendo house
// * お茶の間 - Tea room

// $E19C: 3=verb menu, 5=target menu, 6=script playback (text, animation, battle, other)
function game_state() => byte(0xE19C)
game_state_select_verb = 3
game_state_select_target = 5
game_state_other = 6

// $E1A2: [16-bit] script location
// $E1A6: characters to write
// $E6E6: kunou battle selected attack (0=punch, 1=kick, 2=defend)

function root_node_pointer() => word(0xd796)

function root_node_type() => word(root_node_pointer() + 0x0A)
node_type_wait = 0x0eb0 // with possible animations
node_type_after_battle = 0x12a0 // ?? after battle, after animation
node_type_update_image = 0x1316
node_type_fade = 0x152c
node_type_output_text = 0x17e0
node_type_animation = 0x197a // ??
node_type_select_player_battle_action = 0x2102
node_type_select_opponent_battle_action = 0x2598
node_type_unknown2 = 0x4016 // ?? after battle, after animation
node_type_verb_select = 0x4202
node_type_target_select = 0x44d4

// https://gamefaqs.gamespot.com/segacd/567183-ranma-1-2-byakuran-aika/cheats
// Passwords are entered LEFT, TOP, RIGHT, BOTTOM
// Scene 2 (Kunou fight): 1 5 0 3
// Scene 3 (meet Ukyou): 0 0 1 2
// Scene 4 (research laboratory): 3 7 6 3
// Scene 5 (jungle): 5 0 4 5
// Scene 6 (Ryoga fight): 0 5 0 5
// Scene 7 (Blob fight): 1 1 3 4
// Scene 8 (Mousse fight): 7 0 7 7
// Scene 9 (Ryoga rematch): 0 1 0 7
// Scene 10: 2 2 0 1
// Scene 11: 2 3 2 3
// Scene 12: 7 2 2 7 => 44
// Scene 13: 1 0 5 2 => 52
// Scene 14: 3 3 5 0 => 56
// Scene 15: 5 2 4 6 => 57
// Scene 16: 3 1 5 2 => 60

function current_scene() => word(0xf972)
scenes = {
    0: "Walking home with Akane",
    1: "In the Tendo house",
    2: "In the Tendo house",
    3: "Fighting Kuno",
    4: "Defeated Kuno",
    5: "Defeated Kuno",
    6: "Outside Akane's room",
    7: "Looking for Nabiki",
    8: "Talking with Ukyo",
    9: "Walking with Ukyo",
    10: "At the cat cafe",
    11: "At the cat cafe",
    12: "At the research laboratory",
    13: "At the research laboratory",
    14: "At the research laboratory",
    15: "At the research laboratory",
    16: "At the research laboratory",
    17: "In a field of flowers",
    18: "In a jungle",
    19: "Fighting Ryoga",
    20: "Defeated Ryoga",
    21: "Fighting Squishy",
    22: "Defeated Squishy",
    23: "At the jungle hot spring",
    24: "At the jungle hot spring",
    25: "At a river",
    26: "Fighting Mousse",
    27: "Defeated Mousse",
    28: "Talking with Genma",
    29: "Talking with Genma",
    30: "Outside the research laboratory",
    31: "Outside the research laboratory",
    32: "Ukyou's Flashback",
    33: "Outside the research laboratory",
    34: "Fighting Ryoga again",
    35: "Defeated Ryoga again",
    36: "Searching for an exit",
    37: "Searching for an exit",
    38: "Searching for an exit",
    39: "Upstairs lobby",
    40: "Upstairs lobby",
    41: "Upstairs lobby",
    42: "Fighting Biohazard No. 1",
    43: "Fighting Biohazard No. 1",
    44: "Fighting Biohazard No. 1",
    45: "Defeated Biohazard No. 1",
    46: "Where's Akane?",
    47: "Climbing the Tower",
    48: "Climbing the Tower",
    49: "Climbing the Tower",
    50: "Climbing the Tower",
    51: "Climbing the Tower",
    52: "Climbing the Tower",
    53: "Climbing the Tower",
    54: "Climbing the Tower",
    55: "Climbing the Tower",
    56: "Rescuing Akane",
    57: "Rescuing Akane",
    58: "Rescuing Akane",
    59: "Rescuing Akane",
    60: "Talking with Arisa",
    61: "Talking with Arisa",
    62: "Talking with Arisa",
    63: "Going home",

}

rich_presence_conditional_display(game_state() < 2, "Titles")
rich_presence_display("{0}",
    rich_presence_lookup("Scene", current_scene(), scenes)
)

function root_node_message_id() => word(root_node_pointer() + 0x12)

function complete_scene(scene_id) => current_scene() == scene_id + 1 && prev(current_scene()) == scene_id

// capture transition from displaying the requested text to whatever comes next to ensure
// the whole message is on the screen
function message_trigger(scene, message_id) => 
    current_scene() == scene &&
    prev(root_node_type() == node_type_output_text) && 
    prev(root_node_message_id() == message_id) &&
    root_node_type() != node_type_output_text

function message_trigger_fade(scene, message_id) => 
    current_scene() == scene &&
    once(root_node_message_id() == message_id) &&
    root_node_type() != node_type_output_text &&
    root_node_type() != node_type_fade &&
    never(root_node_type() == node_type_verb_select)

// Story outline: https://w.atwiki.jp/storyteller/pages/1819.html

// ============================================================
// == Scene 0: Walking home with Akane
// ============================================================
// * Look around (<)
//   - Ranma: It's Saturday and I'm on my way home from school.
// * Think Akane (>)
//   - Ranma: Akane is the third daughter of the Kendo clan, where I am staying.
//   - Ranma: For now, we are engaged.
// * Look Akane (>)
//   - Akane: I haven't seen P-chan lately.
//   - Ranma: Isn't he wandering around Hokkaido again?
//   - Akane: No, that's Ryoga.
// * Think P-Chan (<)
//   - Ranma: Ryoga lost his way again.
// * Look Akane (>)
//   - Akane: Let's go home early. I could eat (the whole thing) for lunch.
// * Go Tendo House (>)
//   - Ranma: Okay, let's run!
//   - Akane: Ah, wait Ranma

// ============================================================
// == Scene 1: Tendo house
// ============================================================
//   - Ranma: I'm home
//   - Akane: I'm home
//   - Soun: Hey! Akane, Ranma, wait a second
// * Think (<)
//   - About what?
// * Go Tea Room (>)
//   - Akane: What, dad? What's wrong?
//   - Ranma: I have something to do. Please hurry.
//   - Soun: Go on a date!
//   - Akane: What are you suddenly saying?
// * Talk Soun (>)
//   - Ranma is speechless
// * Look Soun (>)
//   - Well, actually, I've got a really nice gift. Look.
// * Look Soun (<)
//   - Soun is smiling and holding a pamphlet
// * Look brochure (>)
//   - Ranma: Let's see
//   - Ranma: Exciting and thrilling date center?
//   - Akane: I'll make your date a thrilling one.... Wait, dad!
//   - Akane: What the hell is this?
// * Think (<)
//   - Ranma: What is this?
// * Look Soun (>)
//   - Soun: Well, isn't that a wonderful idea?

// ============================================================
// == Scene 2: Tendo house
// ============================================================
//   - Ranma: What were you thinking, uncle?
//   - Soun: I've already booked everything so you don't have to worry about anything.
// * Talk Soun (>)
//   - Ranma: What does a reservation have to do with it!
//   - Kunou: Anyway, I...
//   - Kunou: Did you hear that, Akane Tendo?
//   - Kunou: Father himself has approved of our relationship!
// * Look Kunou (<)
//   - Konou is an upperclassman and a big pervert
// * Kick Kunou (>)
//   - Ranma: Where the hell did you come from?
//   - Kunou: Damn you, Ranma Saotome. Are you trying to get in the way of our relationship?
//   - Ranma: Don't make things more complicated!

// ============================================================
// == Scene 3: Fight with Kuno
// == -- Password: 1 5 0 3
// ============================================================
// Opponent's selection is briefly visible before its covered.
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)
//   - so, if your opponent picks strike, kick them
// When damage is received, the fighting spirit meter fills up. At 5 dots or higher, Fighting Spirit can be used.

// ============================================================
// == Scene 4: Tendo house
// ============================================================
//   - Soun: Look, Akane! Ranma is keeping his date plans!
//   - Ranma: No! Who would date such an unattractive woman!
//   - Akane: Not sexy? Sorry for being so unattractive!
//   - Ranma: Ow! Faa!
//   - Ranma: What are you doing, Akane!
//   - Kunou: Oh, I've been looking forward to meeting you, pig-tailed girl!
// * Look Kunou (<)
//   - Ranma: This perverted bastard...
// * Hit Kunou (>)
//   - Ranma: Get away!

achievement("The Blue Thunder of Furinkan High", "Defeat Kuno and make him leave", 4, type="progression",
    trigger = message_trigger_fade(4, 0x0ec2)
)

// ============================================================
// == Scene 5: Tendo house
// ============================================================
//   - Ranma: Phew
// * Look Soun (<)
//   - He's finally gone
// * Look Akane (>)
//   - Akane isn't here...
// * Look around (>)
// * Talk Soun (>)
//   - Ranma: Uncle, where's Akane?
//   - Soun: Huh? Hey, Akane!
//   - Soun: She's not here. Maybe she went back to her room.
//   - Ranma: Her room...
// * Go Akane's room (>)
//   - Ranma: First, let's go back to being a man.

// ============================================================
// == Scene 6: Akane's room
// ============================================================
//   - Ranma: Maybe I was too good earlier
// * Think Akane (<)
//   - Isn't that theusual
// * Look (<)
//   - This is the entrance to Akane's room
// * Hit Door (>)
//   - Ranma: Akane...?
//   - Akane: What is it? What do you want?
// * Look Akane(>)
//   - She's still angry
// * Talk Akane(>)
//   - Ranma: I mean, I don't really need it or anything
//   - Akane: Then what?
// * Think (>)
//   - Ranma: I went out of my way to be humble
// * Talk Akane(>)
//   - Ranma: No, no, about what I just said...
//   - Akane: If you want to go, why don't you take Shampoo?
//   - Ranma: So cute!
//   - Nabiki: Hey, are you fighting again?
// * Look Nabiki (>)
//   - This is Akane's older sister, Nabiki
//   - Akane: Leave me alone, sis!
//   - Nabiki: Anyway, Ranma. I have a great story to tell you. Do you want to hear it?
// * Think (>)
//   - She's up to something again
// * Talk Nabiki (>)
//   - Ranma: What's the great story?
//   - Nabiki: About Ranma's body
//   - Ranma: My body?
//   - Nabiki: You want to fix that, right? You have a weird condition.
// * Think (>)
//   - Ranma: Is there a way to heal my body!?
// * Talk Nabiki (>)
//   - Ranma: Hey! Did you find out something?
//   - Akane: Don't be so stingy. Just tell us.
// * Talk Nabiki (>)
//   - Ranma: Nabiki, tell us!
// * Talk Nabiki (>)
//   - Ranma: What's with the hand?
//   - Nabiki: It's a bargain, 3000yen.
// * Talk Nabiki (>)
//   - Ranma: Will it really make me a man?
//   - Nabiki: 3000yen
//   - Akane: Sister!
// * Look Nabiki (<)
//   - Nabiki looks at me suspiciously
// * Think (>)
//   - Ranma: For just 3000yen, I can be a man again!
// * Talk Akane (>)
//   - Ranma: Hey, Akane, do you have 3000yen?
//   - Akane: I have it, but...
// * Think (<)
//   - Ranma: If I don't decide soon, she'll disappear.
// * Look Akane (>)
//   - Ranma: I can only get money from Akane
// * Look Nabiki (>)
//   - Nabiki: It's okay. There's no rush. Come find me when you're ready.
// * Look Akane (<)
//   - Ranma: Will she let me borrow it?
// * Look Nabiki (<)
//   - Nabiki is gone
// * Think (>)
//   - Ranma: I have no choice but to ask for her help
// * Talk Akane (>)
//   - Ranma: Please, Akane, give me 3000yen.
//   - Akane: But it's my sister.
//   - Akane: Maybe she's up to something.
//   - Ranma: That may be true, but I need the 3000yen!
// * Look Akane (>)
//   - Akane: If there's no other way, then you owe me
//   - Ranma: Thank you, Akane. Now I can be a man again!
// * Go Nabiki's room (>)

// ============================================================
// == Scene 7: Nabiki's room
// ============================================================
//   - Akane: Sis, we're coming in
//   - Ranma: Hey, where's Nabiki?
//   - Ranma: Seriously, where'd she go?
// * Think (<)
//   - Ranma: Where did Nabiki go?
// * Look room (>)
//   - Ranma: She must be rich
//   - Akane: Strange, this wasn't here before.
// * Look stuffed toy (<)
//   - It's a stuffed panda. What bad taste.
// * Think (>)
//   - Ranma: I borrowed the money, but there's no point without Nabiki.
// * Talk Akane (>)
//   - Akane: I wonder if she's in the tea room...
// * Go Tea room (>)
// * Think (<)
//   - Nabiki isn't even here
// * Look Soun (<)
//   - He's reading a newspaper. 
// * Look tea room (>)
//   - Uncle and his eldest daughter, Kasumi, are here
//   - Nabiki isn't here either.
// * Look Kasumi (>)
//   - Akane: Kasumi, do you know where Nabiki is?
//   - Kasumi: Oh, Nabiki just left.
//   - Kasumi: More importantly - Ranma, do you know where Genma is?
//   - Ranma: I don't know where the idiot is.
// * Think Soun (>)
//   - Ranma: He's being suspiciously quiet
// * Talk Soun (>)
//   - Soun: I see, Ranma. You're interested in going?
//   - Ranma: I didn't say that.
//   - Soun: I'm counting on you, Akane. Ranma, take this with you.
// * Think Nabiki (<)
//   - Ranma: She couldn't have gone that far.
// * Think Date (>)
//   - Ranma: I forgot that, but it's okay.
// * Look Akane (>)
//   - Akane: Let's go find my sister quickly.
// * Go Entrance (>)
//   - Akane: I wonder where she went...
// * Think Nabiki (<)
//   - Ranma: She couldn't have gone that far.
// * Look around (>)
//   - Ranma: What's the car?

achievement("The Missing Sister", "See a car drive off, presumably with Nabiki in it", 1, type="progression",
    trigger = message_trigger(7, 0x13e4)
)

//   - Ukyou: Ranma, going somewhere?
// * Look back (>)
//   - Ranma: Oh, Ukyou

// ============================================================
// == Scene 8: Ukyou
// == -- Password: 0 0 1 2
// ============================================================
// * Look Ukyou (<)
//   - Ranma: This is Ukyou, my childhood friend that runs an okonomoyaki restaurant.
//   - Ranma: She's my other fiancee
// * Look Password (*)
//   - 0 0 1 2 (start chapter 3)
// * Think Ukyou (>)
//   - Ranma: Maybe she saw Nabiki
// * Talk Ukyou (>)
//   - Ranma: U-chan, have you seen Nabiki?
//   - Ukyou: Yes, I saw her.
//   - Ukyou: She was in that car that just left.
//   - Ranma: Tsk. We were just a little late.
// * Look Car (<)
//   - It's too far away to see
// * Think Car (<)
//   - Even if I run, I won't be able to catch it.
// * Think Ukyou (>)
//   - Why is she even here?
// * Talk Ukyou (>)
//   - Ranma: By the way, U-chan, did you need something?
//   - Ukyou: I've got a story to tell you, Ran-chan.
//   - Ranma: A story?
// * Talk Ukyou (>)
//   - Ukyou: Ran-chan's body can be healed
//   - Akane: Oh, really, U-chan
//   - Akane: That's exactly what Nabiki said!
// * Talk Ukyou (>)
//   - Ranma: Tell me, U-chan!
//   - Ranma: How can I fix this rediculous affliction!
//   - Ukyou: I'll teach you, but it's hard
//   - Ukyou: I found a research lab in Jusenkyou
//   - Ranma: The Jusenkyou Research Institute?
//   - Ukyou: It seems they're really putting a lot of effort into their work
// * Talk Ukyou (>)
//   - Ranma: If I go there, my body will...
//   - Ukyou: You should be able to get it fixed
// * Think (>)
//   - If U-chan knows, I don't need to find Nabiki
// * Talk Ukyou (>)
//   - Ranma: Show me the way, U-chan!
//   - Ukyou: OK for you, but not Akane
// * Look Akane (>)
//   - Akane: What!
//   - Ukyou: You don't matter. Ranma needs healing, and I'm only taking her
// * Think (<)
//   - There really isn't any reason for Akane to come along
// * Go Research Institute (>)
//   - Ranma: Akane, please watch the house
//   - Akane: But, Ranma!

// ============================================================
// == Scene 9: Shopping district
// ============================================================
// * Talk Ukyou (>)
//   - Ranma: It's amazing that you found a research lab in Jusenkyou
//   - Ukyou: I searched had for my important fiance
//   - Ranma: So where is the laboratory?
//   - Ukyou: This way
// * Think (<)
//   - How did she find out? Who cares? I get to be a man again.
// * Look around (<)
//   - This is a shopping district
// * Look shopping street (>)
//   - Are we going through this crowded place?
// * Go shopping street (>)
//   - Ranma: Oh, a cat cafe
//   - Ukyou: When you say "cat cafe", you mean where Shampoo works!
//   - Ukyou: Ran-chan, change direction
// * Think (>)
//   - That was sudden
// * Talk Ukyou (>)
//   - Ranma: Isn't the research lab over here?
//   - Ukyou: Well, yes...
// * Go Cat cafe (>)
//   - Ranma: Then, there's no problem
//   - Ukyou: Ah, wait, Ran-chan!

// ============================================================
// == Scene 10: Cat cafe
// ============================================================
// * Look Cat cafe (>)
//   - Shampoo is in front of the store
// * Look Shampoo (>)
//   - Shampoo hasn't noticed us
// * Go front of store (>)
//   - Ukyou: Ah, Ranma, that's wrong! That's Shampoo!
//   - Ranma: What's wrong with Shampoo, U-chan?
// * Talk Ukyou (>)
//   - Ukyou: There's nothing wrong with her...
//   - Ukyou: It's okay! Shampoo's my...
//   - Shampoo: What about me?
//   - Ukyou: Wha
// * Look Ukyou (<)
//   - Why is she in such a hurry?
// * Look Shampoo (<)
//   - This is the female amazonian, Shampoo. When she gets splashed with water, she becomes a cat.
//   - She's always nagging me to marry her.
// * Talk Shampoo (>)
//   - Ranma: Hey, Shampoo
//   - Shampoo: Nihao, where are you going with Ukyou?
//   - Shampoo: Oh yeah, will Shampoo come too? To Jusenkyou...
//   - Ukyou: Wha Wha Wha Wha Wha!!
//   - Shampoo: Okay, I will come with you.
// * Look Shampoo (<)
//   - I don't get this girl
// * Think (<)
//   - I shouldn't have spoken to her
// * Talk Shampoo (>)
//   - Ranma: Do you understand now?
//   - Shampoo: I'll go anywhere with Ranma.
// * Think (<)
//   - I think it's about time to go.
// * Go Research Institute (>)

// ============================================================
// == Scene 11: Cat cafe
// ============================================================
//   - Shampoo: Ranma, wait a minute.
//   - Shampoo: Great-grandmother, I'm going out for a bit.
// * Look Cologne (>)
//   - It's Shampoo's great-grandmother, Cologne.
// * Talk Cologne (>)
//   - Ranma: Yo, Cologne.
//   - Cologne: Ah, son-in-law
//   - Cologne: Wasn't Moose going to son-in-law's house?
// * Think (<)
//   - Come to think of it, I haven't seen him lately.
// * Talk Cologne (>)
//   - Ranma: Moose? I don't know.
//   - Cologne: Oh, dear. And he left without washing the dishes.
//   - Cologne: Shampoo, can you please look for him while you're there?
//   - Shampoo: Understood.

achievement("The Chinese Amazon", "Shampoo joins the party", 1, type="progression",
    trigger = message_trigger(11, 0x09aa)
)

// * Go Research Institue (>)

// ============================================================
// == Scene 12: Research Laboratory
// == -- Password: 3 7 6 3
// ============================================================
//   - Ranma: Wow, that's huge
//   - Shampoo: Is this the lab Ukyou was talking about?
//   - Ukyou: Yes, it is.
// * Look around (<)
//   - It's already evening
// * Look gate (>)
//   - Ranma: How do I open this?
//   - Ranma: There's a doorbell here.
// * Look password (<)
//   - 3 7 6 3
// * Think (<)
//   - Press this
// * Look nameplate (>)
//   - It says Nanjo
// * Press doorbell (>)
//   - Ranma: Nanjo.. I feel like I've heard that name before
//   - Ukyou: Ranma, push it quickly
//   - Ranma: I know
//   - Statue: Please come in
// * Go (>)
// * Look around (>)
//   - Ranma: Hmm, did something just move now?
//   - Ukyou: It was your imagination
// * Go (>)

// ============================================================
// == Scene 13: Research Laboratory
// ============================================================
// * Think (<)
//   - Is this really the Jusenkyou research lab?
//   - It doesn't feel like a research lab
// * Look around (>)
//   - It's a huge lobby. There's someone there.
// * Look figure (>)
//   - I can't see him well from here. Let's get closer.
// * Go (>)
// * Talk (>)
//   - Man: I've ben waiting for you.
//   - Man: Ranma Saotome, reserved by Soun Tendo.
//   - Man: Umm... Which one is Akane Tendo?
//   - Ukyou: Akane Tendo?
//   - Shampoo: What is he saying?
// * Think (>)
//   - Nanjo.. That's right. I remember what Soun gave me
//   - The pamphlet said Nanjo
//   - Ranma: Is this what you mean, sir?
//   - Man: I am the director of the Nanjo date facility. My name is Nijuukaku Hito.
// * Talk Dr. Futatsu (>)
//   - Ranma: Wait a minute. Isn't this the Jusenkyo research lab?
//   - Ukyou: That's what I heard. That's why I brought Ranma here.
//   - Nijuukaku: We can take care of your needs as well
//   - Nijuukaku: What are we doing here? Let's go inside.
// * Look around (<)
//   - He seems suspicious
// * Think (>)
//   - I've come this far. I can't go home yet
// * Go (>)

// ============================================================
// == Scene 14: Research Laboratory
// ============================================================
//   - Nijuukaku: Please come in
// * Think (<)
//   - Will this place heal me?
// * Look around (>)
//   - Someone is standing near the window. I can't see them from here.
// * Look shadow (>)
//   - When I look closely, it appears to be a woman.
// * Go into room (>)
//   - Nijuukaku: Milady, I have brought Ranma Saotome with me.
// * Think (<)
//   - Who is this girl?
// * Look (>)
//   - Girl: Welcome, Ranma. I am Arisa Nanjo
// * Talk Arisa (>)
//   - Ranma: No need to say hello, just get my body back to normal quickly
//   - Ranma: Waa, what have you done!?
// * Look Dr. Futatsu (>)
//   - Dr. Futatsu: As you can see, milady
//   - Arisa: Well, you're just the man I've been looking for
//   - Ranma: Waa, what's going on?
// * Think (<)
//   - Why is this woman hugging me?
// * Look Arisa (>)
//   - Ranma: She's hugging me, and with all her might
// * Look Nijuukaku (>)
//   - Niijuukaku: Please wait, milady. Ranma has a fiancee.

// ============================================================
// == Scene 15: Research Laboratory
// ============================================================
//   - Ukyou: Yea, Ranma is my fiance!
//   - Shampoo: I will marry him!
//   - Dr. Futatsu: He has multiple fiancees, so please give up
//   - Ranma: Ukyou! Shampoo!
//   - Arisa: Now they're gone
// * Look Arisa (<)
//   - What does she think she's doing?
// * Talk Arisa (>)

// ============================================================
// == Scene 16: Research Laboratory
// ============================================================
//   - Ranma: Where did you put Ukyou and Shampoo?
//   - Arisa: Director, get Ranma changed.
//   - Arisa: Then show her around the house until dinner time.
//   - Dr. Futatsu: Yes
//   - Ranma: Hey, did you hear what I said?
//   - Arisa: Well then, Ranma. See you later.
// * Talk Arisa (>)
//   - Ranma: Oh, wait!
//   - Ranma: Dammit, open up!
// * Think (<)
//   - What the hell is going on?
// * Look Arisa (<)
//   - Arisa is no longer here
// * Look Door (<)
//   - It doesn't seem to open, no matter how much I push or pull it.
// * Look Dr. Futatsu (>)
// * Talk Dr. Futatsu (>)
//   - Ranma: What on earth were you guys thinking!
//   - Dr. Futatsu: It seems like the young lady has taken a liking to you.
// * Look Dr. Futatsu (<)
//   - There's something strange about him.
// * Think (>)
//   - I have no idea what this is about at this point...!
// * Talk Dr. Futatsu (>)
//   - Ranma: Don't say things that don't make sense!
//   - Ranma: If you really don't want to talk...
//   - Ranma: Argh!
// * Look (>)
//   - Akane: Ranma!
//   - Ranma: A..kane...
//   - Narrator: And so, Ranma and the others set out for the Jusenkyo research lab...
//               Where did they end up? A dating center?
//               Just who are the man in the white coat and the mysterious girl who appeared there?
//               And where have Shampoo and Ukyou gone?
//               Before he can solve this mystery, Ranma is hit by a mysterious monster and loses
//               consciousness. And Akane too...!
//               What on earth is going to happen? We'll find out soon.

achievement("The Research Laboratory", "Meet Arisa and get more than you bargained for", 2, type="progression",
    trigger = message_trigger(16, 0x169a)
)

// ============================================================
// == Scene 17: Field of flowers
// == -- Password: 5 0 4 5
// ============================================================
//    - Ranma: Uh, umm....
//    - Ranma: Ah, is that Akane?
// * Look Akane (<)
//    - She's unconcious...
// * Think (>)
//    - Why is Akane here?
// * Talk Akane (>)
//    - Ranma: Hey, wake up, Akane!
//    - Akane: Huh, Ranma?
// * Look Akane (<)
//    - She doesn't appear to be injured
// * Talk Akane (>)
//    - Ranma: Are you okay, Akane?
//    - Akane: Uh huh. What happened to us?
//    - Ranma: (I want to hear it)??
// * Think (>)
//    - The blow knocked me unconcious, and now I'm with Akane?
//    - Ranma: Akane, why are you here? [where is your...?]
//    - Akane: Eh? It's fine.
// * Look Akane (<)
//    - Are you panicking, Akane?
// * Think Akane (>)
//    - Maybe she was following me
// * Talk Akane (>)
//    - Ranma: That's not good. Maybe you were wearing it?
// * Talk Akane (>)
//    - Akane: There's no way I'd wear it after you!
//    - Ranma: Then why...
// * Look around (>)
//    - There's jungle everywhere... Why am I here?
// * Look flower (<)
//    - Cattleya flowers are blooming in a place like this
// * Think (<)
//    - We must have been brought here while we were unconcious
// * Talk Akane (>)
//    - Ranma: Where are we?
//    - Ranma: I've never seen this place before. How did we get here?
// * Look Akane (<)
//    - There don't appear to be an injuries. Why does she look worried?
// * Think (<)
//    - I don't know where we are, or what to do.
// * Talk Akane (>)
//    - Ranma: There's no point just sitting here. Let's look around.
//    - Akane: Sounds good
// * Go (>)

// ============================================================
// == Scene 18 - Ryoga appears
// ============================================================
//    - Ranma: Ryoga!
//    - Ryoga: R-Ranma!
// * Look Ryoga (>)
//    - Ryoga: I've finally found you, Ranma
//    - Ranma: What are you doing!
//    - Ryoga: Just shut up and follow me
//    - Ranma: You can't tell me what to do
// * Look Ryoga (<)
//    - This guy is simple, insensitive, directionally challenge, and basically my rival, Ryoga
//    - When splashed with water he turns into a black piglet
// * Fight (>)
//    - Ryoga: I'll drag you by force!
//    - Ranma: Go ahead and try if you can!
//    - Akane: Hey, Ranma!

// ============================================================
// == Scene 19 - Ryoga fight
// == -- Password: 0 5 0 5
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)

achievement("You Can't Tell Me What to Do", "Defeat Ryoga", 5, type="progression",
    trigger = complete_scene(19)
)

// ============================================================
// == Scene 20 - after Ryoga fight
// ============================================================
// * Look Ryoga (>)
//   - Still the same crazy guy
//   - But that's strange...
//   - There's something here
// * Talk Ryoga (>)
//   - Ranma: What's with this guy?
//   - Akane: Eh, Ryoga's unconcious
//   - Ranma: Ignore him, let's go.
// * Go (>)
//   - Akane: Ranma, do you hear something?
//   - Ranma: Over there.
// * Go (>)
//   - Akane: It's Shampoo!
//   - Akane: What? A monster!
// * Look Shampoo (<)
//   - Shampoo is fighting a strange monster
// * Look Monster (<)
//   - It's a disgusting, squishy thing
// * Talk Shampoo (>)
//   - Shampoo: Great joy! Ranma has come to the rescue!
//   - Ranma: Shampoo, what the hell is that?
//   - Shampoo: I don't know, but it's strong. Don't just stand there, help me!
// * Fight (>)
//   - Ranma: Okay, Shampoo, leave it to me!

// ============================================================
// == Scene 21 - Buyobuyo (Squishy) fight
// == -- Password: 1 1 3 4
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)

achievement("A Digusting, Squishy Thing", "Defeat Buyobuyo", 5, type="progression",
    trigger = complete_scene(21)
)

// ============================================================
// == Scene 22 - after Buyobuyo fight
// ============================================================
//   - Ranma: Ha ha, what a pain
// * Look Monster (<)
//   - This guy was pretty strong
// * Think (<)
//   - Why do we need Shampoo (?)
// * Talk Shampoo (>)
//   - Ranma: Why are you here?
//   - Shampoo: What you mean? You saw me fall
// * Think (<)
//   - hmm.....
// * Talk Shampoo (>)
//   - Ranma: What? Well then, here is...
//   - Shampoo: In the basement of the mansion
// * Look around (>)
// * Think (<)
//   - In the basement of the mansion... Then there must be a way up!
// * Talk Akane (>)
//   - Ranma: What's that Dr. Futatsu doing?
//   - Akane: Let's go?
//   - Akane: With a monster like that, we can't just go home
// * Think (<)
//   - I wonder what Shampoo knows
// * Talk Shampoo (>)
//   - Ranma: Shampoo, is there a way up somewhere?
//   - Shampoo: If there was, I'd be up by now. All I found was a hot spring
//   - Akane: A hot spring? You can go back to being a man again, Ranma
// * Think (<)
//   - It would be best to go back to being a man in case another monster appears
// * Go hot spring (>)
//   - Ranma: Show me the way, Shampoo!
//   - Shampoo: Of course. It's over there

// ============================================================
// == Scene 23 - Jungle hot spring
// ============================================================
//   - Shampoo: We made it, Ranma
// * Look hot spring (<)
//   - It's more like a bath than a hot spring
// * Think (>)
//   - I have no idea what to do now
//   - Should I take a bath and think about it?
// * Go (>)
//   - Ranma: Ok, now I can go back to being a man
//   - Shampoo: Let's go together, Ranma
//   - Ranma: You idiot, you have to go into the women's bath!
//   - Akane: Seriously, Ranma...
// * Look hot spring (<)
//   - Phew, I can finally rest
// * Think (>)
//   - Who is that Dr. Futatsu with Arisa?
// * Talk Akane (>)
//   - Ranma: Akane, who do you think that Dr. Futatsu is?
//   - Akane: The guy in the white coat? He looked like a scientist.
//   - Shampoo: Who is that girl, Arisa?
// * Talk Shampoo (>)
//   - Shampoo: That girl was trying to make Ranma her own
//   - Shampoo: Ranma, have you gained another fiancee?
//   - Ranma: No! I don't want a woman like that!
// * Look Shampoo (<)
//   - She seems skeptical
// * Think Shampoo (>)
//   - Any good ways to divert the conversation?
// * Think Akane (>)
//   - Akane has been quiet for a while, but I can sense her anger
// * Think Ukyou (>)
//   - That's right! Ukyou fell into the whole with Shampoo
// * Talk Shampoo (>)
//   - Ranma: Hey Shampoo, what happened to U-chan?
//   - Shampoo: Before I even realized, she was gone
//   - Ranma: Gone? Where'd she go?
// * Think Shampoo (<)
//   - I finally managed to change the subject
// * Think Ukyou (>)
//   - U-chan said this mansion was a Jusenkyo research facility
// * Talk Shampoo (>)
//   - Ranma: Shampoo, did you know about this research facility?
//   - Shampoo: This is new to me
//   - Shampoo: There wasn't a Jusenkyo research facility in China either
//   - Ranma: Alright
// * Think (>)
//   - I remember him saying he was the directory of the Nanjo date center
// * Talk Akane (>)

// ============================================================
// == Scene 24 - Jungle hot spring
// ============================================================
//   - Ranma: Hey, Akane
//   - Akane: What!
//   - Ranma: Remember when your old man gave me that pamphlet?
//   - Akane: What about it?
//   - Ranma: There was something written on it
//   - Shampoo: By the way, someone asked me if I was Akane Tendo
// * Talk Akane (>)
//   - Akane: But this is the Jusenkyo research lab, isn't it?
//   - Ranma: Apparently, it's both
//   - Akane: Why is the reserach lab and the dating center at the same place?
//   - Ranma: How should I know?
// * Think (>)
//   - Akane's right. It's too much of a coincidence.
// * Look Shampoo (>)
//   - Shampoo: Akane and Ranma on a date? I'll never allow that!
//   - Shampoo: Ranma, go on a date with me
//   - Ranma: Whoa, idiot, get away!
//   - Akane: Enough already...
// * Talk Akane (>)
//   - Akane: What? It's your fault
//   - Ranma: Well, I guess we should get going
// * Go (>)

// ============================================================
// == Scene 25 - Jungle river
// ============================================================
//   - Akane: What a beautiful river
//   - Ranma: Don't fall, Shampoo
//   - Shampoo: You do care about me
//   - Ranma: I just don't want you to become a cat
// * Look river (<)
//   - It's a beautiful, but cold river
// * Talk Shampoo (>)
//   - Shampoo: If it were a hot spring, we could go in together Ranma
//   - Ranma: Stop being nice like that
// * Think (>)
//   - Seriously, if Moose were here, it would be horrifying
// * Look around (>)
//   - What?
// * Look Mousse (>)
//   - It's Mousse, who followed Shampoo from China
//   - He's nearsighted, but a master of hidden weapons. When splashed with water, he becomes a duck
// * Think (<)
//   - I was upset, but why is Mousse here?
// * Talk Mousse (>)
//   - Ranma: Hey, Mousse
//   - Mousse: Ranma, is what you said true?
//   - Ranma: Huh? What do you mean?
// * Talk Mousse (>)
//   - Mousse: I'm asking if you went into a hot spring with Shampoo!
//   - Ranma: Hot spring? No, that's not it!
//   - Shampoo: That's wrong. Ranma, you hugged me in the hot water
// * Talk Shampoo (>)
//   - Ranma: You were the one clinging on!
//   - Mousse: Ranma, I'll kill you!

achievement("What Happened at the Hot Springs", "Have a misunderstanding with Mousse", 1, type="progression",
    trigger = message_trigger(25, 0x145e)
)

// * Fight

// ============================================================
// == Scene 26 - Mousse fight
// == -- Password: 7 0 7 7
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)

achievement("Master of Hidden Weapons", "Defeat Mousse", 5, type="progression",
    trigger = complete_scene(26)
)

// ============================================================
// == Scene 27 - After Mousse fight
// ============================================================

// * Look Mousse (<)
//   - He's exhausted after being beaten by me
// * Think (<)
//   - Should I take him back to the hot springs?
// * Talk Akane (>)
//   - Akane: I wonder if Mousse knows anything about this place
//   - Ranma: If he knew, he wouldn't be here
// * Talk Shampoo (>)
//   - Ranma: What should we do with him?
//   - Shampoo: Take him with or leave him behind. He'll just get in the way.
// * Talk Mousse (>)
//   - Ranma: Hey Mousse, did you hear what Shampoo said?
//   - Mousse: Gaa~~
// * Go (>)
//   - Ranma: Okay, let's go. Bye, Mousse
//   - Shampoo: Mousse, great-grandmother is looking for you, so return as soon as you can.
//   - Mousse: Gaa~~

// ============================================================
// == Scene 28 - Genma appears
// ============================================================

//   - Akane: Huh? What's that?
//   - Akane: I thought I saw something move over there
// * Look shadow (>)
//   - Shampoo: Careful, Ranma. It might be a monster
// * Look panda (>)
//   - Ranma: Old man, is that you? It's you isn't it
//   - Genma: No, I'm just a panda
//   - Ranma: It's definitely my dad!
// * Think (<)
//   - Why is my dad here too?
// * Talk panda (>)

// ============================================================
// == Scene 29 - Talking to Genma
// ============================================================

//   - Ranma: Dad, why are you here?
//   - Genma: I can explain...
//   - Ranma: How annoying. Is there no warm water around here?
//   - Genma: I don't know
// * Look panda (<)
//   - I can't have a proper conversation with him in this state
// * Think (>)
//   - If there's no hot water, I guess I'll just have to guess what he has to say
// * Talk panda (>)
//   - Ranma: So, you were tricked into coming here too
// * Talk panda (>)
//   - Ranma: And you don't know the way out
// * Talk panda (>)
//   - Ranma: You don't know anything about Arisa or the Dr. Futatsu
//   - Ranma: Damn, you're hiding something!
// * Talk panda (>)
//   - Ranma: Tell me, old man. What do they want?
//   - Akane: Hey, Ranma
// * Talk Akane (>)
//   - Ranma: What? Don't interrupt
//   - Akane: It's important. Look. Smell
//   - Ranma: Smell?
//   - Shampoo: It is the smell of okonomiyaki
// * Think smell (<)
//   - The smell of okonomiyaki might mean Ukyou is nearby
// * Think Ukyou (>)
//   - It would be easier to talk to U-chan than my dad
// * Go (>)
//   - Ranma: Dad, I'll hear the whole story later.

// ============================================================
// == Scene 30 - Outside laboratory
// ============================================================

//   - Ukyou: Come get your delicious okonomiyaki!
// * Think (<)
//   - She looks okay
// * Look Ukyou (>)
//   - Ukyou: Ah, Ranma, I've been waiting
// * Talk Ukyou (>)
//   - Ukyou: Ranma, you're late. I'm tired of waiting
//   - Ranma: Late? What are you doing, U-chan?
//   - Ukyou: As you can see, business
//   - Ukyou: There's so many people here, why not take advantage of it?
// * Think (<)
//   - Why are there so many people here
// * Look customers (>)
//   - Ukyou: Ah. These customers are staff at the Jusenkyou research center.
//   - Ranma :The Jusenkyou research center? Really?
// * Look Ukyou (<)
//   - She looks okay
// * Look customers (<)
//   - They look like people dedicated to research
// * Think (>)
//   - I've finally found the Jusenkyou research center
// * Talk scientist (>)
//   - Scientist: We are indeed doing research into Jusenkyou here
//   - Akane: Can it be true?
//   - Ranma: So you can fix my body?
//   - Scientist: Eh?
// * Think (<)
//   - Huh? What do you mean, "huh?"
// * Talk scientist (>)
//   - Ranma: You can break Jusenkyou curses here, right?
//   - Scientist: Yea, well, I guess
//   - Ranma: You guess?
//   - Scientist: Instead, you turn into a monster
//   - Ranma: Wh, what?
// * Think (<)
//   - That's not what U-chan said
// * Talk Ukyou (>)

// ============================================================
// == Scene 31 - Outside laboratory
// ============================================================

//   - Ranma: U-chan, that's not what you said
//   - Ukyou: I didn't know either
//   - Ukyou: I was just told that if I brought you here, you could be healed
//   - Ranma: Wait a minute
//   - Ranma: Ukyou, you didn't find this yourself?
// * Think (<)
//   - Something's wrong with U-chan
// * Talk Ukyou (>)
//   - Ranma: U-chan
//   - Ukyou: I'll tell you, just don't get mad.
//   - Ukyou: Actually...

// ============================================================
// == Scene 32 - Ukyou's flashback
// ============================================================

//   - Ukyou: I don't trust you
//   - Nabiki: Oh, why?
//   - Ukyou: You're Akane's sister, so why are you helping me?
//   - Nabiki: I'm not choosing sides. I'm here to make money.
//   - Ukyou: Shouldn't you tell Akane?
//   - Nabiki: Of course I'll tell her
//   - Nabiki: But she's skeptical, so she won't be willing to pay
//   - Ukyou: What? You're even taking money from your sister?
//   - Nabiki: It's just business
//   - Ukyou: And I can have Ranma to myself?
//   - Nabiki: That's right
//   - Nabiki: The deal is closed

// ============================================================
// == Scene 33 - The elevator
// ============================================================

//   - Ranma: Tch, Nabiki
//   - Akane: Big sis, I definitely won't forgive you this time
// * Talk everyone (>)
//   - Ranma: We don't need to be here anymore. Let's go.
// * Look scientists (<)
//   - Oh, that elevator must go all the way up
// * Go elevator (>)
//   - Ranma: I can't help it
// * Look elevator (>)
//   - It's late
//   - Man: Sorry, this is for employees only. We can't let you on
// * Think (<)
//   - Maybe he'll talk if I cause him some pain
// * Look Dr. Futatsu (>)
//   - At last, he appeared
//   - I have no choice but to hear what he has to say
// * Kick Dr. Futatsu (>)
//   - Dr. Futatsu: Ow!
//   - Ranma: Come on, let's go
//   - Duplicator: Wait....
// * Look Ryoga (<)
//   - Ryoga... When'd he get here?
// * Talk Ryoga (>)
//   - Ranma: Hey, Ryoga. You've come a long ways
//   - Ryoga: Shut up!
//   - Ryoga: Let's do this
//   - Ranma: Ah!
//   - Ranma: He got away
// * Look Ryoga (<)
//   - Ryoga: What were you thinking?
// * Think (<)
//   - After our warm up, I'll beat you again
// * Talk Ryoga (>)
//   - Ranma: Do you realize what you've done at this important time?
//   - Ryoga: Enough questions. Let's go, Ranma!
// * Fight (>)
//   - Ranma: Sounds interesting. I'll fight you

// ============================================================
// == Scene 34 - Ryoga rematch
// == -- Password: 0 1 0 7
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)

achievement("Bad Timing", "Defeat Ryoga again", 5, type="progression",
    trigger = complete_scene(34)
)

// ============================================================
// == Scene 35 - Ryoga defeated again
// ============================================================

// * Look elevator (>)
//   - Akane?: No, Ranma, you've completeld broken it
//   - Akane?: We can't call the elevator like this
// * Talk Ryoga (>)
//   - Ranma: Ryoga, what were you thinking? You've destroyed our only exit
//   - Ryoga: Exit?
//   - Akane?: We're underground, Ryoga
//   - Ryoga: Underground? Here?
// * Look Ryoga (<)
//   - This guy doesn't understand anything at all
// * Think (>)
//   - You're directionally challenged. You just make everything more complicated.
// * Talk Ryoga (>)
//   - Ranma: What are we supposed to do now? We can't get out
//   - Ryoga: It's not just my fault!
//   - Ryoga: If you hadn't been so kind back then...
//   - Ukyou: We can't do anything about this
//   - Shampoo: Nothing at all
//   - Narrator: Thus, Ranma and the others met Ryoga, Mousse, and Genma one by one
//               in the basement of the Nanjo residence and talked to each of them,
//               but nothing came of it. And according to what the Jusenkyo scientist
//               said, it seems that Ranma cannot return to being a man here...
//   - Narrator: Furthermore, the elevator leading to the ground floor was destroyed
//               by Ryoga. And how are the Dr. Futatsu, Arisa, and Nabiki involved?
//   - Narrator: The mystery only deepens as we approach our climax

// ============================================================
// == Scene 36 - Splitting up
// == -- Password: 2 2 0 1
// ============================================================

//   - Akane: Stop messing around!
//   - Ranma: We have no choice but to split up to look for another exit
//   - Ryoga: Ah...
// * Talk Shampoo (>)
//   - Ranma: Is that okay with you guys too?
//   - Shampoo: We have no choice
//   - Ukyou: We also agree
// * Talk Ryoga (>)
//   - Ranma: You're coming with me, right?
//   - Ryoga: Of course. I won't let you get away this time.
//   - Ranma: Okay. Let's split up. Ryoga and I will look over there
//   - Akane: We'll look around here
//   - Akane: Ukyou, don't hesitate
//   - Ukyou: Wait a minute
//   - Ryoga: Now there will be no more interference
// * Think (>)
//   - Ryoga: Where on Earth are you taking me?
// * Talk Ryoga (>)
//   - Ranma: Tell me what to do. Where should I go?
//   - Ryoga: To the people who need you  (???)
//   - Ranma: Maybe Arisa is a woman?

// ============================================================
// == Scene 37 - The exit
// ============================================================

//   - Ryoga: You don't know? Let's get this straight. Be her support, Ranma
// * Look Ryoga (<)
//   - What's wrong with him? He's getting worked up
// * Think (>)
//   - Why is he getting so worked up? It's suspicious
// * Talk Ryoga (>)
//   - Ranma: You. Are you up to something?
//   - Ryoga: N-nothing. I just...
// * Look Ryoga (<)
//   - More and more suspicious...
// * Think (>)
//   - But since it's Ryoga, he probably won't say anything more even if I press him further
// * Talk Ryoga (>)
//   - Ranma: Either way, no.
//   - Ranma: Let's find the exit quickly
//   - Ryoga: The exit is right in front of you
//   - Ranma: Huh?
// * Look around (>)
//   - Ranma: Where is it?
//   - Ryoga: Don't you understand, dumbass? Where is the exit?
//   - Ryoga: That's it!
// * Look elevator (>)
//   - The exit... Isn't that the elevator?
// * Talk Ryoga (>)
//   - Ranma: You're the one who broke it
//   - Ryoga: That's why I called you dumb. Think about it.
// * Think Ryoga (<)
//   - What's with this guy, acting all high and mighty?
// * Think elevator (>)
//   - Is there a way to get up top using a broken elevator...
// * Think how to climb (>)
//   - Ranma: ...I see! Just climb the cable inside!
//   - Ryoga: Looks like you finally understand
// * Look elevator (>)

// ============================================================
// == Scene 38 - Going up
// ============================================================

//   - Ranma: First we need to break down the door
//   - Ryoga: That's a piece of cake
// * Kick elevator (>)
//   - Ranma: Ryoga, let's go!
//   - Ryoga: (grunt?)
// * Look elevator (>)
//   - There's a cable we can climb to the top
// * Go up (>)
//     [Ranma and Ryoga are fighting each other as they climb]
//   - ??? (no captions)

achievement("The Way Out", "Escape the jungle", 2, type="progression",
    trigger = complete_scene(38)
)

// ============================================================
// == Scene 39 - Top of the elevator
// == -- Password: 2 3 2 3
// ============================================================

//   - Ranma: It's open
//   - Ryoga: Now we can get to her place
//   - Ranma: I told you no.
// * Think Ryoga (<)
//   - Ryoga is so persistant
// * Go outside (>)
//   - Ryoga: I'll drag you along and tie you up
//   - Ranma: More importantly, where's the exit?
//   - Ryoga: You think I know!
// * Think Ryoga (<)
//   - This isn't outside either
// * Look around (>)
//   - Ukyou: Huh? Ran-chan and others. How'd they get up here?
// * Talk [either] (>)
//   - Ranma: Oh, how'd you guys get here
//   - Shampoo: What are you saying? We used the emergency stairs
//   - Ryoga: E-emergency stairs....
//   - Ranma: Why'd we take the hard way...
// * Look two people (>)
//   - Neither of them is even sweating...? Neither?
// * Talk [either] (>)

// ============================================================
// == Scene 40 - Top of the elevator
// ============================================================

//   - Ranma: Eh? Where's Akane?
//   - Shampoo: She's not behind me...
//   - Ukyou: That's strange, she was there a minute ago
// * Think (>)
//   - No way, that bastard!
// * Look door (>)
//   - The door is closed! Bad!
// * Open door (>)
//   - Ranma: Damn. It won't open!
//   - Dr. Futatsu: I'm surprised you managed to get out of the underground garden
//   - Dr. Futatsu: But that's it!
// * Look Dr. Futatsu (<)
//   - Dammit! That bastard, but where's Akane...?
// * Talk Dr. Futatsu (>)
//   - Ranma: Hey, give me back Akane!
//   - Dr. Futatsu: Akane? What do you mean
//   - Ranma: Don't pretend that you don't understand
//   - Dr. Futatsu: What a baseless accusation... But hey, Biohazard No.1, defeat Ranma Saotome!
// * Fight (>)

// ============================================================
// == Scene 41 - Before Biohazard No. 1 fight
// ============================================================

//   - Ryoga: For Akane's sake, I will help you!
//   - Shampoo: I won't forgive you if you lay a hand on Ranma!
//   - Ukyou: Ran-chan's enemy is our enemy!
//   - Ranma: Alright, everyone, let's go!
//   - Dr. Futatsu: Ha, ha, ha. You can't fight very well in that state
//   - Ranma: Even a woman can defeat that monster!
//   - Dr. Futatsu: Now is the time to keep talking

// ============================================================
// == Scene 42 - Biohazard No. 1 fight
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)

//   [you cannot win this fight]

// ============================================================
// == Scene 43 - after Biohazard No. 1 fight
// ============================================================

//   - Ukyou: Ran-chan, I'll save you!
// * Look Ukyou (>)
//   - Ranma: No, she's unconcious
//   - Ranma: Damn you, I won't forgive you!
//   - Ranma: (grunt)
//   - Ranma: Eh? This pipe is warm
// * Think (>)
//   - Warm water pipes... What does it mean?
// * Look pipe (>)
//   - Ranma: No doubt about it, hot water is flowing
// * Hit pipe (>)
//   - Ranma: Okay
//   - Dr. Futatsu: She's gone!
//   - Ranma: If I go back to being a man, I've got this! Let's go!
// * Fight (>)

// ============================================================
// == Scene 44 - Biohazard No. 1 fight
// == -- Password: 7 2 2 7
// ============================================================
// * Strike (突) > Special (必) > Kick (蹴) > Strike (突)
//    - Just use special over and over. It'll usually land, or get blocked. 
//      He only seems to use strike when he's discharging his power meter. Then use kick.

achievement("The Cold Water Menace", "Defeat Biohazard No. 1", 5, type="progression",
    trigger = complete_scene(44)
)

// ============================================================
// == Scene 45 - after Biohazard No. 1 fight
// ============================================================

//   - Ranma: Oops!
// * Think (>)
//   - Ranma: I'm a man again, but I can't get close like this. I need some way to repel the water
// * Look Ukyou (>)
//   - She's still unconcious... Aha!
// * Look trowel (>)
//   - That's it!
// * Think (<)
//   - This will repel water!
// * Use trowel (>)
//   - I'm going to borrow this, U-chan!
//   - Ranma: Get away from me, monster!
//   - Ranma: Take this, deadly water backflow!
//   - Ranma: Next up: Deadly giant fly swat!
//   - Ranma: Hey?
//   - Ranma: What's this?
//   - Dr. Futatsu: Bio No.1!
// * Look Dr. Futatsu (>)
//   - Now it's time to ask him where Akane is
// * Talk Dr. Futatsu (>)

// ============================================================
// == Scene 46 - Where's Akane?
// ============================================================

//   - Ranma: Give up, old man
//   - Dr. Futatsu: I won't hand my daughter over to the likes of you
//   - Ranma: I don't want the young lady. Give me back Akane instead!
//   - Dr. Futatsu: I don't know anything about that
// * Think (<)
//   - He's pretending not to know
// * Talk Dr. Futatsu (>)
//   - Ranma: I'll force you to talk
//   - Dr. Futatsu: I don't know!
// * Think Dr. Futatsu (>)
//   - Is he stubborn, or does he really not know?
// * Think about Akane (>)
//   - Either way, Akane must be in this mansion!
// * Talk Dr. Futatsu (>)
//   - Ranma: Hey! What's up on this floor?
//   - Ranma: Say something
//   - Dr. Futatsu: This is the Cattleya tower in the center of the Nanjo mansion
//   - Ranma: Cattleya tower...
// * Think Dr. Futatsu (>)
//   - The Cattleya tower... Akane must be there
// * Talk Dr. Futatsu (>)
//   - Ranma: Well, show me around
//   - Dr. Futatsu: I refuse!
//   - Ranma: We're going there, even if I have to drag you
//   - Dr. Futatsu: Do whatever you want!
// * Go Cattleya tower (>)
//   - Dr. Futatsu: Oh, hey... What are you doing?
//   - Ranma: Let's go!
//   - Dr. Futatsu: Idiot! Don't pull! It's dangerous!

// ============================================================
// == Scene 47 - The tower
// ============================================================

// * Look stairs (<)
//   - The spiral staircase continues to the top. Is this Cattleya tower?
// * Talk Dr. Futatsu (>)
//   - Ranma: Are you going to talk now?
//   - Dr. Futatsu: If I say I don't know, then I don't know
//   - Ranma: Who else besides you would kidnap Akane?
//   - Dr. Futatsu: I told you! I really don't know!
// * Look door (>)
//   - There's a door over there
// * Go front of door (>)
//   - Ranma: Akane~!
// * Look room (<)
//   - There's no signs of life, and it seems like no one is around.
// * Think (>)
//   - The stairs keep going
// * Go top (>)
// * Talk Dr. Futatsu (>)

// ============================================================
// == Scene 48 - The tower
// ============================================================

//   - Ranma: Anyway, why are you targeting us?
//   - Dr. Futatsu: I guess I shouldn't have brought you here after all
//   - Ranma: What? What does that mean?
// * Talk Dr. Futatsu (>)
//   - Ranma: Please explain properly what's going on
//   - Dr. Futatsu: It's...
// * Think (>)
//   - Speaking of...
//   - Arisa: You're just the man I was looking for
//   - Ryoga: Stand up for her, Ranma

// ============================================================
// == Scene 49 - The tower
// ============================================================

// * Think (>)
//   - But why me with that woman?
// * Talk Dr. Futatsu (>)
//   - Ranma: Arisa Nanjo... was it?
//   - Ranma: What are you trying to accomplish by pairing me with that woman?
//   - Dupicitor: It's what the young lady wanted, and I follow her wishes
//   - Ranma: We first met because of her selfishness
// * Look door (>)
//   - There's a door over there
// * Go front of door (>)
//   - Ranma: Akane~!
// * Look room (<)
//   - There's no signs of life, and it seems like no one is around.
// * Think (>)
//   - The stairs keep going
// * Go top (>)
//   - Obeying the young lady, huh?
//   - Ranma: Wait, then you don't need to attack me
//   - Dr. Futatsu: It's....
// * Look Dr. Futatsu (>)
//   - He suddenly turned red
// * Think (<)
//   - So, that woman...
// * Talk Dr. Futatsu (>)
//   - Ranma: Hey, you. Perhaps Arisa is....
//   - Dr. Futatsu: Shut up! I won't hear any more of that!
//   - Ranma: I see, I see
//   - Dr. Futatsu: Come on, don't say that!

// ============================================================
// == Scene 50 - The tower
// ============================================================

// * Look Dr. Futatsu (<)
//   - His face is read
// * Think (>)
//   - He needs to confess to Arisa
// * Talk Dr. Futatsu (>)
//   - Ranma: Why can't you say "I love you"?
//   - Dr. Futatsu: Um...
//   - Ranma: You're stubborn, but timid
//   - Dr. Futatsu: I can't heal her wound
// * Talk Dr. Futatsu (>)
//   - Ranma: The young lady's wound? What do you mean?
//   - Dr. Futatsu: Rather than worry about other people, how about you?
//   - Ranma: What are you going on about?
//   - Dr. Futatsu: Have you ever told your fiance you love her?
// * Talk Dr. Futatsu (>)
//   - Ranma: Ah, Akane. She's only my fiancee because my parents decided so
//   - Dr. Futatsu: So why are you searching so desperately for her?
//   - Ranma: Well, that's because...
// * Think (>)

// ============================================================
// == Scene 51 - The tower
// ============================================================

//   - What he said was outrageous
//   - I have to divert the conversation somehow...
//   - Shit, I have no ideas!
//   - Dr. Futatsu: What are you mumbling
//   - Ranma: Shut up! I don't need your guidance
//   - Ranma: I will search for Akane alone!
// * Go (>)
//   - The reason I'm looking for Akane is...

achievement("Ranma's Resolve", "Take a moment to consider your motivation", 2, type="progression",
    trigger = message_trigger(51, 0x0758)
)

// * Look door (>)
//   - That door is next!
// * Go door (>)
//   - Ranma: Akane~!
// * Look room (<)
//   - Shit. She's not here
// * Think (>)
//   - At this point, we'll have to go all the way to the top
// * Go top (>)
// * Go top (>)
//   - I still don't understand. Why did Arisa choose me?
//   - Besides, Arisa's scars...
// * Look door (>)
//   - Okay, this time!
// * Go door (>)

// ============================================================
// == Scene 52 - The tower
// == -- Password: 1 0 5 2
// ============================================================

//   - Ranma: Akane~!
// * Look room (>)
//   - Huh? Is that... a shoe?
// * Look shoe (>)
//   - This is Akane's shoe!
// * Look room (>)
//   - Dammit, she's gone...
// * Look picture (>)
//   - Ranma: Arisa Nanjo
//   - Dr. Futatsu: It was painted before the young lady's trip to China
//   - Ranma: China?
// * Think (<)
//   - Did he say China?
// * Talk Dr. Futatsu (>)
//   - Dr. Futatsu: She was very cheerful back then...
//   - Ranma: You said China. No way!
//   - Dr. Futatsu: That was a few months ago...

// ============================================================
// == Scene 53 - Flashback
// ============================================================

//   - Guide: People like you are rare
//   - Guide: This is the legendary cursed training grounds. Most people who come here are marial artists.
//   - Dr. Futatsu: It's what the young lady wanted.
//   - Dr. Futatsu: It doesn't look that dangerous here...
//   - Guide: It's not good to judge by appearance alone
//   - Guide: There are over one hundred springs here, and each one...
//   - Guide: Oh, no, miss, it's dangerous there!
//   - Arisa: Eh?
//   - Arisa: (missed it)
//   - Dr. Futatsu: Young lady!
//   - Arisa: Aiyaa~!

// ============================================================
// == Scene 54 - The tower
// ============================================================

//   - Ranma: Jusenkyo?
// * Talk Dr. Futatsu (>)
//   - Dr. Futatsu: Since then, I have studied Jusenkyo, but...
//   - Ranma: It can't be cured
//   - Dr. Futatsu: Yes...
//   - Dr. Futatsu: And the young lady has ordered me to gather all of you together...
// * Talk Dr. Futatsu (>)
//   - Ranma: Why?
//   - Dr. Futatsu: She thought she'd never be able to date a normal guy again
//   - Ranma: I won't date her. Is that why you gathered all the men who fell into Jusenkyo springs?
//   - Dr. Futatsu: Yes, using Biohazard no. 1
// * Think Genma (<)
//   - There's no way a young girl would like the old man
// * Think Mousse (<)
//   - Mousse's perverted behavior won't do...
// * Think Ryoga (>)
//   - Come to think of it, Ryoga was brought along too
// * Talk Dr. Futatsu (>)
//   - Ranma: Wasn't Ryoga here? Isn't he good enough?
//   - Dr. Futatsu: The young lady doesn't like pigs.
//   - Ranma: Oh my, what a selfish young lady
// * Think Arisa (<)
//   - So I... well, of course
// * Think Akane (>)
//   - Wait a minute, then Akane...
//   - Ranma: You thought you couldn't convince me, so you took Akane...
//   - Dr. Futatsu: No, not me!
// * Talk Dr. Futatsu (>)
//   - Ranma: Stop playing dumb! Look, these shoes are proof!
//   - Dr. Futatsu: I'm not lying. I really don't know!
// * Think Dr. Futatsu (>)
//   - Does this guy really not know? If so...
// * Think Akane (>)
//   - Nothing will happen if I just stay here
// * Go (>)

// ============================================================
// == Scene 55 - The tower
// ============================================================

//   - Dr. Futatsu: Hey, where are you going?
//   - Ranma: Where else? To look for Akane.
//   - Dr. Futatsu: Wait a minute...
//   - Dr. Futatsu: Wait, don't go! Up ahead is...
//   - Ranma: Akane~!
//   - Akane: Ranma?
//   - Akane: What do you mean?
//   - Ranma: Damn, how long does this go on for?
// * Look door (<)
//   - Okay, this is the last door!
// * Go front of door (>)

// ============================================================
// == Scene 56 - Rescuing Akane
// == -- Password: 3 3 5 0
// ============================================================

//   - Ranma: Akane!
//   - Arisa: Well, Ranma!
//   - Ranma: A-Arisa!
//   - Arisa: Where have you been? Arisa was so worried
// * Look Arisa (>)
//   - Instead of Akane, I've found this ridiculous person
//   - Arisa: Come on in, your meal is ready
//   - Ranma: Isn't Akane here? Is the food good?
//   - Arisa: Come now, don't hesitate
//   - Ranma: Listen to people!
//   - Dr. Futatsu: Damn, I'm too late
// * Think (<)
//   - I have to do something about Arisa
// * Talk Dr. Futatsu (>)
//   - Ranma: Hey, do something about this
//   - Dr. Futatsu: That's why I told you not to go
//   - Ranma: Isn't Akane here?
//   - Dr. Futatsu: So persistant, I don't know!
//   - Nabiki: Akane is here
//   - Nabiki: I knew you'd come, Ranma
// * Look Nabiki (>)
//   - Ranma: What are you imitating, Nabiki?
//   - Nabiki: If you don't want Akane to get hurt, become Arisa's lover
//   - Akane: Big sister...
// * Talk Nabiki (>)
//   - Ranma: What the hell are you thinking?
//   - Shampoo: Ranma!
//   - Ryoga: Ah, Akane?
//   - Ukyou: Ah, Nabiki Tendo!
// * Look Ryoga (>)
//   - Ryoga: Hey, explain why Akane looks like that!
//   - Ranma: Shut up! I want to hear this!
//   - Nabiki: How 'bout it, Ranma? Will you do as you're told?
// * Look Nabiki (>)
//   - Why is Nabiki doing this?
// * Talk Nabiki (>)
//   - Ranma: What on Earth are you up to?
//   - Arisa: I asked for this
//   - Arisa: Lady!
// * Talk Arisa (>)

// ============================================================
// == Scene 57 - Rescuing Akane
// == -- Password: 5 2 4 6
// ============================================================

//   - Ranma: Y-You...
//   - Dr. Futatsu: Really, my lady!
//   - Arisa: It's because Kakujin is relunctant to take Ranma with him [Kakujin=Kakuto=Dr. Futatsu]
//   - Arisa: Arisa, I'm getting anxious...
//   - Dr. Futatsu: Lady...
//   - Nabiki: So, Ranma. Is your answer yes or no?

// --- You have to answer Yes/No twice here. If you go Yes/Yes or No/No, you'll see both sets of messages
//     If you go Yes/No or No/Yes, you'll see both of the first messages. Any combination works.  

// -------- [first Yes] -----
// * Think Yes (>)
//   - Ranma: I agree. Let Akane go.
//   - Shampoo: Ranma! Don't listen to them!
//   - Ukyou: Nabiki wouldn't hurt Akane!
//   - Nabiki: But I am serious, Ranma-kun
// --------------------------

// -------- [first No] -----
// * Think No (>)
//   - Ranma: No. Why would I trade my life for such an unattractive woman?
//   - Akane: What did you say?
//   - Nabiki: Haha, you think I'm not serious
//   - Ryoga: Ranma, Akane is in danger!
//   - Ranma: But if I get together with Arisa, Akane won't have a fiancee anymore
//   - Ryoga: Idiot, that's not right
// -------------------------

// * Think (>)
//   - Is Nabiki serious? I don't think so...
//   - Nabiki: Have your thoughts together? I'll ask again: What's your answer?

// -------- [second Yes] -----
// * Think Yes (>)
//   - Ranma: I said it was okay!
//   - Akane: Ranma...
//   - Ryoga: Alright, good job Ranma
//   - Ryoga: Don't worry, I'll take care of Akane
//   - Ranma: Damn, that was your plan all along!
//   - Ryoga: Hahahahaha, say whatever you want
// ---------------------------

// -------- [second No] -----
// * Think No (>)
//   - Ranma: No matter how many times you ask me, the answer is the same!
//   - Shampoo: That's right! I'm more important to Ranma than Akane!
//   - Ranma: Well, that's not true...
//   - Ukyou: Even if Akane isn't here, I'm still his fiancee!
// --------------------------

// ============================================================
// == Scene 58 - Rescuing Akane
// ============================================================

//   - Akane: Ranma, are you serious?
//   - Ranma: Uh....
//   - Nabiki: What are you going to do Ranma? Make it clear
//   - Akane: Stop it sis
//   - Akane: There's no way Ranma would do something like that!
//   - Nabiki: Oh really? I don't know
//   - Akane: Ranma doesn't think of anyone but me
//   - Nabiki: This is his chance to prove that
//   - Nabiki: Just ask Ranma-kun to help you
//   - Akane: Big sister...
//   - Akane: Ranma...
// * Think (>)
//   - Damn, I don't know what to do anymore
// * Think about Akane (>)
//   - Can I even break a rope like that?
// * Look Akane (>)
//   - Ranma: Akane...
// * Talk Nabiki (>)

// ============================================================
// == Scene 59 - Rescuing Akane
// ============================================================

//   - Ranma: Okay. Even though it pains me, I'll do what you say
//   - Shampoo: Ranma!
//   - Ukyou: Ran-chan!
//   - Nabiki: It looks like you've finally made up your mind. I'll let Akane go
//   - Akane: Ranma!
//   - Arisa: I'm so happy Ranma, you chose me!
// * Look Arisa (>)
//   - Arisa: Ah, even someone like me has found a wonderful lover!

achievement("Arisa's Secret", "Find out what Arisa was hiding", 2, type="progression",
    trigger = message_trigger(59, 0x0d7e)
)

//   - Arisa: Mew?
//   - Ranma: Gya~! Cat!
//   - Dr. Futatsu: Lady!
// * Talk Akane (>)
//   - Akane: Ranma! That's no way to treat a girl!
//   - Ranma: I said that...
// * Think (>)
//   - I never asked which spring Arisa fell into
//   - Why a cat of all things?
// * Look Ryoga (>)

// ============================================================
// == Scene 60 - Epilogue
// == -- Password: 3 1 5 2
// ============================================================

//   - Ranma: Damn you! Were you trying to force a cat on me!
//   - Ryoga: How'd you know
// * Look Nabiki (>)
//   - Nabiki: Ranma, you have to change Arisa back quickly
//   - Ranma: W-why me?
//   - Nabiki: You're her important lover, aren't you?
//   - Ranma: Get your act together!
// * Think (>)
//   - Just thinking about getting close to a cat makes me faint
// * Talk Akane (>)
//   - Ranma: Akane, bring her back
//   - Akane: You should do that yourself, you precious lover
//   - Ranma: What are you saying?
//   - Ranma: Hey, are you jealous?
//   - Akane: It's not like that!
// * Look Akane (>)
//   - Huh? Is she really jealous...?
// * Think (>)
//   - Well, I guess I'll have to take advantage of Akane's personality here
// * Talk Akane (>)
//   - Ranma: Oh, I see
//   - Akane: I told you it's not true! ...Oh, I get it now
//   - Dr. Futatsu: Lady...?
//   - Arisa: Ranma!
// * Look Arisa (<)
//   - Eh! She's still here
// * Think (>)
//   - Damn, I don't want to date a cat
//   - Okay, I'll give her a good scolding
// * Talk Arisa (>)

// ============================================================
// == Scene 61 - Epilogue
// ============================================================

//   - Ranma: Arisa, stop messing around already
//   - Arisa: What is it, Ranma?
//   - Ranma: Can't you find someone better than me?
//   - Arisa: Has anyone else fell into the cursed spring village yet?
//   - Ranma: Not really...
// * Look Arisa (<)
//   - She doesn't understand anything
// * Talk Arisa (>)
//   - Ranma: You don't have to stick to Jusenkyo people
//   - Arisa: There's no way I could date a normal guy
//   - Arisa: Now, Ranma is the only one...
//   - Akane: That's not true!
//   - Akane: There's nothing wrong with transforming
//   - Akane: If you worry about things like that, you'll never be happy
//   - Arisa: You don't know my pain
// * Look Akane (>)
//   - Well done, Akane. You nailed it!
// * Talk Arisa (>)
//   - Ranma: Even I...
//   - Shampoo: I don't understand your pain either
//   - Shampoo: Why are you so obsessed with this?
//   - Arisa: But..
// * Look Shampoo (>)
//   - Damn, Shampoo stole my line
// * Think (>)
//   - Okay, next time I'll say it clearly
// * Talk Arisa (>)
//   - Ranma: But...
//   - Ukyou: Don't do it! Ran-chan
//   - Ukyou: I don't care about you transforming at all
//   - Arisa: Ah...
// * Look Ukyou (>)
//   - Even U-chan said my lines
// * Think (>)
//   - Well, it's okay. Arisa seems to understand
// * Talk Arisa (>)
//   - Ranma: Do you understand, Arisa?
//   - Arisa: Yes... but
//   - Ranma: You still don't get it
//   - Ranma: Look closely at the person next to you
//   - Arisa: Eh?
//   - Arisa: Kakuto doesn't know anything about me
//   - Ranma: Have you asked him? You could say something too
// * Look Dr. Futatsu (<)
//   - Is this guy still being stubborn?
// * Talk Dr. Futatsu (>)
//   - Ranma: If only you were more clear-sighted, we would...
//   - Akane: Ranma!
// * Talk Akane (>)
//   - Ranma: What is it, Akane?
//   - Akane: Yelling at him won't help
//   - Ranma: Because...

// ============================================================
// == Scene 62 - Epilogue
// ============================================================

//   - Akane: Here
// * Look Akane (<)
//   - Why did Akane give him flowers?
// * Talk Akane (>)
//   - Ranma: (missed it)
//   - Akane: Shh, stay quiet
//   - Ryoga: Hey Ranma, what's going on?
//   - Ranma: There's no point explaining it to a dumbass like you
//   - Ryoga: What!
//   - Nabiki: What a boring result
// * Look Nabiki (<)
//   - I forgot she was here
// * Think (>)
//   - If only she hadn't brought up such a strange story...
// * Talk Nabiki (>)
//   - Ranma: Nabiki, you bastard!
//   - Nabiki: Akane, please say thank you to Ranma
//   - Nabiki: Because he came to help you
//   - Akane: Eh?
//   - Nabiki: Well, I'll go home first
//   - Ranma: Oh, hey, wait
// * Talk Akane (>)
//   - Ranma: What was she thinking...
// * Look Arisa (>)
//   - Ranma: Should we go home too?
//   - Akane: Yeah

// ============================================================
// == Scene 63 - Epilogue
// ============================================================

// Description of final scene from https://w.atwiki.jp/storyteller/pages/1819.html
// * Akane asks Ranma why he came to help, and Ranma asks her why she was there to cover it up.
// * Akane says it's not relevant now, and Ranma says it was because she was there that things got 
//    complicated. They start arguing.
// * Akane gets angry and prepares to leave, while Ranma looks at the Nanjo mansion.
// * The mansion seen from above, with the tower in the middle and the circular wall lit up, was beautiful.
//   - "I wonder if those two are okay?"
//   - "I don't know~"
//   - "Well then, let's go home, our fathers are probably worried about us."
//   - "Yeah!"

//    [no subtitles]
//   - Akane: Ranma~
//   - Ranma: Huh?
//   - Akane: Do you think (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??), Akane
//   - Akane: What?
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)
//   - Akane: (??)
//   - Ranma: (??)

achievement("Will They Be Okay?", "Head home after helping Arisa with her problem", 10, type="win_condition",
    trigger = current_scene() == 63 &&
        root_node_type() == 0x14b2 && 
        root_node_message_id() == 0x1224
)

//    [credits]

