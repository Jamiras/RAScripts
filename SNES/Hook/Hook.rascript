// Hook
// #ID=940
//
// USA:       1a0a3a079db7a848ee019161cbdb1788
// Europe:    7693f2ac4ba870378bbd26935f24afe2
// Japan:     979397f68cda4b78defb6ae1319724d9

// (U) 29252: ee6cd276fe102308e5acd10a396b2753 (beta version, see https://superfamicom.org/info/hook, score in different position in memory)
// Spanish:   77742b53c27ac1db25af2ea8ace3d63f (https://www.romhacking.net/translations/3246/ ; ips patch applied to 29252)

function lives() => byte(0x1F00)
function has_magic_sword() => byte(0x1F01) == 1
function full_health() => byte(0x1F04) == 5
function current_health() => byte(0xF7C1)
function current_stage() => byte(0x1F02)
function tink_power() => byte(0x1F07)

rich_presence_display("Level {0}, {1} Lives", 
    rich_presence_value("Level", current_stage()+1),
    rich_presence_value("Lives", lives()-1)
)

// health > 0 ensures we're in the game. health < 8 prevents accidental triggering when starting the game
// and all memory is 0x55.
function trigger_in_game() => current_health() > 0 && current_health() < 8

function trigger_score(score) {
    hundred_thousands = score / 100000
    ten_thousands = (score - hundred_thousands * 100000) / 10000
    
    // convert decimal to BCD
    millions = score / 1000000
    if (millions > 0)
        hundred_thousands = (hundred_thousands - (millions * 10)) + (millions * 16)
    
    if (ten_thousands == 0)
        return trigger_in_game() && (byte(0x1f1c) >= hundred_thousands)
    
    return trigger_in_game() &&
           (byte(0x1f1c) > hundred_thousands ||
            (byte(0x1f1c) == hundred_thousands && high4(0x1f1b) >= ten_thousands))
}

achievement(
    title = "Normal Score", description = "Score 250000 points", points = 5,
    id = 14906, published = "10/9/2014 4:11:59 AM", modified = "10/9/2014 4:13:32 AM",
    trigger =  trigger_score(250000) 
           // byte(0x001F1C) == 2 && byte(0x001F1B) >= 80
)

achievement(
    title = "Super Score", description = "Score 500000 points", points = 10,
    id = 14907, published = "10/9/2014 4:12:40 AM", modified = "10/9/2014 4:13:40 AM",
    trigger = trigger_score(500000) 
           // byte(0x001F1C) == 5 && byte(0x001F1B) >= 0
)

achievement(
    title = "Ultra Score", description = "Score 750000 points", points = 10,
    id = 14908, published = "10/9/2014 4:12:58 AM", modified = "10/9/2014 4:13:46 AM",
    trigger = trigger_score(750000)
           // byte(0x001F1C) == 7 && byte(0x001F1B) >= 80
)

achievement(
    title = "Ultimate Score", description = "Score 1000000 points", points = 15,
    id = 14909, published = "10/9/2014 4:13:21 AM", modified = "10/9/2014 4:13:51 AM",
    trigger = trigger_score(1000000)
           // byte(0x001F1C) == 16 && byte(0x001F1B) >= 0
)

