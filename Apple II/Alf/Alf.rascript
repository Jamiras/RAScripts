// Alf: The First Adventure
// #ID = 32138

// Basic Strategy:
// * Avoid Willie at all costs. If he catches you, you have to completely start the level over. If he
//   catches you on the first level, press Ctrl+R to restart the game entirely (to reset the timer).
// * You can get caught by the dogcatcher twice on each level. The Pound count resets to 3 on each level.
// * You can run through Willie and the dogcatcher, as long as you and the enemy aren't fully in the same
//   square at the same time.
// * The easiest way to escape Willie or the dogcatcher is to move to an adjacent screen. They'll chase
//   you relentlessly on the same screen, but there's a bit of a delay switching screens, which you can
//   use to put some distance betweem you.
// * It's easiest to catch cats by trapping them in dead ends. They'll move back and forth between the last
//   space and second to last space. When you step into the second to last space, start pressing your capture
//   button or the cat may run by.
// * The capture button is kind of finicky. You can't just hold it down, but you can't turbo-tap it either.
//   I find it works best if you press it down and hold it briefly as you enter a space where you want to
//   grab something. Even then, the cats typically sneak by you if they're not cornered.
// * City 2 is the hardest because it doesn't form a loop. To get from the fourth screen back to the start,
//   you have to pass through all of the other screens, and there's quite a few places where Willie or the
//   dogcatcher can block your path.
// * City 4 is only difficult because there's only one (or sometimes two) pizzas, and there are very few
//   places where you can trap a cat in a dead end.

// Ctrl+R to restart
// escape to pause
// 24 hours to complete game

// $00D7=pound count (lives remaining)
function lives_remaining() => byte(0x00D7)

// $00DA=puzzle pieces collected
function parts_collected() => byte(0x00DA)

// $00DB=holding (0=nothing,1=cat,2=cat,3=cat,4=cat,56=key,60=parts)
function holding() => byte(0x00DB)

// $00DC=pizza timer (0=none, 8=full)
function pizza_timer() => byte(0x00DC)

// $00E5=1-stunned

// $00FC=level-1
function current_level() => byte(0x00FC)+1

// $00F4=timer 00:0X
// $00F5=timer 00:X0
// $00F6=timer 0X:00
// $00F7=timer X0:00
function hours() => byte(0x00F7) * 10 + byte(0x00F6)
function minutes() => byte(0x00F5) * 10 + byte(0x00F4)

function screen() => byte(0x01ff)
screen_willie_capture = 0x1a
screen_dogcatcher = 0x1b
screen_scoreboard = 0x20

// $0DB9=cats remaining
function cats_remaining() => byte(0x0DB9)

// $2263=0c=cat1 delivered
// $2267=0c=cat2 delivered
// $226b=0c=cat3 delivered
// $226f=0c=cat4 delivered

rich_presence_conditional_display(pizza_timer() == 0xFF, "Titles")
rich_presence_conditional_display(current_level() > 5, "Submitting Score") // entering name on Skleen Club
rich_presence_conditional_display(current_level() == 5, "Victorious in {0}{1}:{2}{3}",
    rich_presence_value("TimePart", byte(0x00F7)),
    rich_presence_value("TimePart", byte(0x00F6)),
    rich_presence_value("TimePart", byte(0x00F5)),
    rich_presence_value("TimePart", byte(0x00F4))
)

rich_presence_display("City {0}, {1}/4 cats captured | {2}/16 parts collected in {3}{4}:{5}{6}",
    rich_presence_value("Level", current_level()),
    rich_presence_value("Cats", 4-cats_remaining()),
    rich_presence_value("Parts", parts_collected()),
    rich_presence_value("TimePart", byte(0x00F7)),
    rich_presence_value("TimePart", byte(0x00F6)),
    rich_presence_value("TimePart", byte(0x00F5)),
    rich_presence_value("TimePart", byte(0x00F4))
)

achievement("You... Are No Longer a Cat. You Are a Bagel.", "Bring your first cat back to the garage", 2,
    current_level() == 1 &&
    cats_remaining() == 3 &&
    prev(cats_remaining()) == 4
)

achievement("More Than One Way to Skin a Cat", "Capture all four cats on the first level", 3,
    current_level() == 1 &&
    cats_remaining() == 0 &&
    prev(cats_remaining()) == 1    
)

achievement("I'll Still Be in the House", "Complete the first level", 5, type="progression",
    trigger = current_level() == 2 &&
              prev(current_level()) == 1
)

achievement("While We're Gone, I Trust You Won't Be Getting Into Any Mischief",
            "Complete the first level without being caught by Willie or the dogcatcher", 5,
    trigger = once(dword(0x00F4) == 0) && // 00:00 on timer
              prev(current_level() == 1) &&
              trigger_when(current_level() == 2) &&
              never(screen() == screen_willie_capture) &&
              never(screen() == screen_dogcatcher)
)

achievement("He's Quick. I'll Give Him That.", "Complete the first level in under 2:00", 10,
    trigger = current_level() == 2 &&
              prev(current_level()) == 1 &&
              hours() < 2
)

achievement("Hide in the Kitchen, ALF", "Complete the second level", 5, type="progression",
    trigger = current_level() == 3 &&
              prev(current_level()) == 2
)

achievement("You're Comparing Me to a Cockroach?",
            "Complete the second level without being caught by Willie or the dogcatcher", 10,
    trigger = once(current_level() == 1) &&
              prev(current_level() == 2) &&
              trigger_when(current_level() == 3) &&
              never(screen() == screen_willie_capture) &&
              never(screen() == screen_dogcatcher)
)

achievement("We're Having a Family Meeting", "Complete the third level", 5, type="progression",
    trigger = current_level() == 4 &&
              prev(current_level()) == 3
)

achievement("Isn't There Anyone Else You Can Bother?",
            "Complete the third level without being caught by Willie or the dogcatcher", 10,
    trigger = once(current_level() == 2) &&
              prev(current_level() == 3) &&
              trigger_when(current_level() == 4) &&
              never(screen() == screen_willie_capture) &&
              never(screen() == screen_dogcatcher)
)

achievement("I Vote We Go Home", "Complete the fourth level", 10, type="progression",
    trigger = current_level() == 5 &&
              prev(current_level()) == 4
)

achievement("No Problem!",
            "Complete the fourth level without being caught by Willie or the dogcatcher", 10,
    trigger = once(current_level() == 3) &&
              prev(current_level() == 4) &&
              trigger_when(current_level() == 5) &&
              never(screen() == screen_willie_capture) &&
              never(screen() == screen_dogcatcher)
)

achievement("Let's Throw a Cat on the Barbie",
            "Complete the game with less than 15:00 on the clock", 10,
    trigger = once(current_level() == 3) &&
              prev(current_level() == 4) &&
              trigger_when(current_level() == 5) &&
              hours() < 15
)

achievement("The Only Good Cat is a Stir Fried Cat", "Capture a second cat before a single pizza wears off", 5,
    trigger = tally(2, [
                  once(holding() == 1),
                  once(holding() == 2),
                  once(holding() == 3),
                  once(holding() == 4)
              ]) &&
              never(pizza_timer() == 0)
)

leaderboard("The Race to Melmac", "Complete the game with the lowest elapsed time",
    start = current_level() == 5 && prev(current_level() == 4),
    submit = always_true(),
    cancel = always_false(),
    value = hours() * 60 + minutes(),
    format = "SECS"
)

// Glad I Could Help
// Ha! I Kill Me!
// The Cat Won't Fit in the Toaster
// We Have Ten Major Organs. Eight of Which are Stomachs
// Ochmonek? Sounds Like a Typo
// Willie, It Was an Accident!
// You're Supposed to Put It Together.
// Let's Throw a Cat on the Barbie
// I Couldn't Ask For More. Where Are the Presents?


