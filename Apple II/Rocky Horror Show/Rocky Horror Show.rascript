// The Rocky Horror Show
// #ID = 32089

// MD5: 9893862a9a93f438f68884e3970ccc50  The Rocky Horror Show.woz

// MANUAL: https://archive.org/details/activision-the-rocky-horror-show-a2-ph/components/the%20rocky%20horror%20show%20manual/
// * 99 in game time is about 25 minutes real time.
// * Riff-Raff: butler with laser gun
// * Magenta: bride of frankenstein hairdo
// * Columbia: female groupie
// * Dr. Frank N. Furter: mad scientist in bathrobe
// * Rocky Horror: doctor's creation - basically harmless
// * Eddie: failed experiment - kept on ice - rides motorcycle

// $076C: Number of pieces returned
function pieces_returned() => byte(0x076C)

// $0833: b6: in underwear
function in_underwear() => bit6(0x0833) == 1

// $083B: b3: janet
function character() => bit3(0x083b)
character_brad = 0
character_janet = 1

// $27FE: room id
function room_id() => byte(0x0027FE)
room_entrance_left = 0x00
room_entrance_right = 0x04
room_theatre_left = 0x08
room_theatre_center = 0x0C
room_theatre_right = 0x10
room_suit_of_armor = 0x14
room_laboratory_right = 0x18
room_laboratory_center = 0x1C
room_laboratory_left = 0x20
room_freezer = 0x24
room_dining_room = 0x28
room_bedroom_left = 0x2C
room_bedroom_right = 0x30
room_warp_zone = 0x34

locations = {
    room_entrance_left: "in the entrance",
    room_entrance_right: "in the entrance",
    room_theatre_left: "in the theatre",
    room_theatre_center: "in the theatre",
    room_theatre_right: "in the theatre",
    room_suit_of_armor: "at the suit of armor",
    room_laboratory_left: "in the laboratory",
    room_laboratory_center: "in the laboratory",
    room_laboratory_right: "in the laboratory",
    room_freezer: "in the freezer",
    room_dining_room: "in the dining room",
    room_bedroom_left: "in a bedroom",
    room_bedroom_right: "in a bedroom",
    room_warp_zone: "seeing things",
}


// $287D: 1=holding piece
function holding_piece() => byte(0x00287D)

// $287E: 0=not in game
function in_game() => byte(0x237D) == 1

// $29FE: Temperature level (pixels)
//        Starts at 0x98  (approximately -51 on the thermometer)
//        Eddie unfreezes at 0x3B (approximately -1 on the thermometer)
//        Stops at 0x1E (approximately 15 on the thermometer)
function thermometer_level() => byte(0x29FE)

// $F72F: timer X0 (1D=0,1B=1,19=2,17=3,15=4,13=5,11=6,0f=7,0d=8,0b=9)
function timer_tens() => byte(0x00F72F)

// $F74A: timer 0X (1D=0,1B=1,19=2,17=3,15=4,13=5,11=6,0f=7,0d=8,0b=9)
function timer_ones() => byte(0x00F74A)

timer_characters = {
    0x1D: "0",
    0x1B: "1",
    0x19: "2",
    0x17: "3",
    0x15: "4",
    0x13: "5",
    0x11: "6",
    0x0F: "7",
    0x0D: "8",
    0x0B: "9",
}

characters = {
    character_brad: "Brad",
    character_janet: "Janet",
}

rich_presence_conditional_display(!in_game(), "Titles")

rich_presence_display("{0} is {1} | {2} pieces returned | {3}{4} time remaining",
    rich_presence_lookup("Character", character(), characters),
    rich_presence_lookup("Location", room_id(), locations),
    rich_presence_value("Pieces", pieces_returned()),
    rich_presence_lookup("TimerChar", timer_tens(), timer_characters),
    rich_presence_lookup("TimerChar", timer_ones(), timer_characters)
)

function return_pieces(count) => room_id() == room_theatre_center && 
                                 pieces_returned() == count && 
                                 prev(pieces_returned()) == count - 1

function without_losing_clothing() => once(!in_game()) && never(in_underwear())

achievement("I Would Like, If I May... To Take You... On a Strange Journey", // narrator
            "Return the first piece of the De-Medusa machine", 1, type="progression",
            trigger = return_pieces(1)
)

achievement("Even Smiling Makes My Face Ache", // frank-n-furter
            "Return six pieces of the De-Medusa machine", 2, type="progression",
            trigger = return_pieces(6)
)

achievement("Don't Dream It, Be It", // frank-n-furter
            "Return six pieces of the De-Medusa machine without losing your clothing", 3,
            trigger = return_pieces(6) && without_losing_clothing()
)

achievement("Give Yourself Over to Absolute Pleasure", // frank-n-furter
            "Return nine pieces of the De-Medusa machine", 4, type="progression",
            trigger = return_pieces(9)
)

achievement("I'm a Wild and an Untamed Thing", // frank-n-furter
            "Return nine pieces of the De-Medusa machine without losing your clothing", 5,
            trigger = return_pieces(9) && without_losing_clothing()
)

achievement("The Transducer Will Seduce Ya",  // frank-n-furter
            "Return twelve pieces of the De-Medusa machine", 5, type="progression",
            trigger = return_pieces(12)
)

achievement("It's Probably Some Kind of Hunting Lodge for Rich Weirdos", // brad
            "Return twelve pieces of the De-Medusa machine without losing your clothing", 5,
            trigger = return_pieces(12) && without_losing_clothing()
)

achievement("And You Shall Receive It, In Abundance", // frank-n-furter
            "Return all fifteen pieces of the De-Medusa machine", 5, type="progression",
            trigger = return_pieces(15)
)

achievement("If Only We Were Amongst Friends... Or Sane Persons!", // janet
            "Return all fifteen pieces of the De-Medusa machine without losing your clothing", 10,
            trigger = return_pieces(15) && without_losing_clothing()
)

function eddie_returning() => byte(0x25FD)
achievement("Hot Patootie, Bless My Soul", // eddie
            "Send Eddie back to the freezer", 5,
            trigger = in_game() && eddie_returning() == 0 && prev(eddie_returning()) == 1           
)

function escape() => byte(0x2377) == 0xC1

achievement("Please, Lets Get Out of Here", // janet
            "Escape from the mansion with your sweetheart", 10, type="win_condition",
            trigger = escape()
)

achievement("It's Astounding. Time is Fleeting", // riff raff
            "Escape from the mansion with your sweetheart having 10 or more time remaining", 10,
            trigger = escape() && timer_tens() != 0x1D
)

// I wanted an achievement for resetting the thermometer before Eddit thawed, and another for keeping him thawed
// for the entirety of the game, but you can't reset the thermometer until he thaws :(
// Instead, I opted for refreezing him (he thaws at -1) and keeping the thermometer below 10.
// It takes about 10 temperature to get from the theatre to the freezer44862444248zzx2486248624
achievement("Society Must Be Protected", // dr. scott 
            "Escape from the mansion with your sweetheart without ever letting the temperature reach 10", 10,
            trigger = trigger_when(escape()) && 
                      once(!in_game()) && 
                      once(pieces_returned() == 0) && // !in_game() is true when escape() is true
                      never(thermometer_level() == 0x28)
)
