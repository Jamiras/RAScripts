// Rockin' Kats
// #ID=1921
// md5: d90de2e0ec62f16bf1bf7db8a4802fe2

// HP reset: pause, A+B+Down+Start

function screen() => byte(0x005C)
function boss_hp() => byte(0x04B9)
function bgm() => byte(0x060A)
function from_password() => byte(0x0008)
function buttons_down() => byte(0x0044)
function hp_cheat() => buttons_down() == 212 // 212 = A+B+Down+Start 

// 0x80 - 1 mini-boss
// 0x40 - 1 boss
// 0x20 - 2 mini-boos
// 0x10 - 2 boss
// 0x08 - 3 mini-boss
// 0x04 - 3 boss
// 0x02 - 4 mini-boss
// 0x01 - 4 boss
function levels_completed() => byte(0x0102) 

achievement(
    title = "Perfectionist",
    description = "Win the game without losing a life",
    points = 50,
    trigger = screen() == 68 &&                // rematch with final boss
              boss_hp() == 0 &&                // final boss dead
              bgm() == 165 &&                  // end credits music
              unless(from_password() != 0) &&  // disable if player used password
              unless(hp_cheat()) &&            // disable if using HP cheat (should be never?)
              once(levels_completed() == 0) && // from start of game
              never(byte(0x0425) == 18)        // player died
) 
