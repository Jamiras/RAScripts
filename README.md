# RAScripts
Script files for my contributions to [http://www.retroachievements.org](RetroAchievements)

### Syntax
#### Accessing Memory
* `byte(address)` - the 8-bit value at the specified address
* `word(address)` - the 16-bit value at the specified address
* `dword(address)` - the 32-bit value at the specified address
* `bit0(address)` - the least significant bit of the specified address
* `bit1(address)` - the second least significant bit of the specified address
* `bit2(address)` - the third least significant bit of the specified address
* `bit3(address)` - the fourth least significant bit of the specified address
* `bit4(address)` - the fifth least significant bit of the specified address
* `bit5(address)` - the sixth least significant bit of the specified address
* `bit6(address)` - the seventh least significant bit of the specified address
* `bit7(address)` - the most significant bit of the specified address
* `low4(address)` - the four least significant bits of the specified address
* `high4(address)` - the four most significant bits of the specified address
* `prev(accessor(address))` - the value of the specified address from the previous frame (_accessor_ is one of the above - i.e. `byte`)

#### Arithmetic Operations
* `left + right` - adds numerical values or concatenates string values
* `left - right` - subtracts the second value from the first value
* `left * right` - multiplies numerical values
* `left / right` - divides the first value by the second value, the remainder is discarded

#### Comparisons
* `left == right` - the two values are equal
* `left != right` - the two values are not equal
* `left > right` - the first value is greater than the second value
* `left >= right` - the first value is greater than or equal to the second value
* `left < right` - the first value is less than the second value
* `left <= right` - the first value is less than or equal to the second value

`left` must be a memory address or a function that evaluates to a memory address

`right` may be a memory address, a constant, or a function that evaluates to a memory address or constant

#### Logical Comparisons
* `left && right` - both conditions must be true
* `left || right` - either condition must be true
* `!left` - the condition must be false

`left` and `right` must be comparisons or functions that evaluate to comparisons

#### Order of Operations
Operators are evaluated in this order (within a level, operators are evaluated left to right as they're read from the expression):
* Parentheses
* Multiplication and division
* Addition and subtraction
* Comparisons
* Not
* And
* Or

The following statement:
`N + M * A < B && C > X || D / G * H > Y + Z`

Would be interpreted as:
`(((N + (M * A)) < B) && (C > X)) || (((D / G) * H) > (Y + Z))`

It is particularly important to understand how this affects the creation of alt groups:
`A == N && B == X || B == Y`
Because AND has higher precedence than OR, the interpreter sees:
`(A == N && B == X) || (B == Y)`
Which is two alt groups and no core group. An achievement must have a core group, so this will generate a parsing error.You can use parentheses to force a different order. What was intended was:
`A == N && (B == X || B == Y)`
Here, `A == N` becomes the core group and there are two alt groups: `B == X` and `B == Y`.

#### Variables
* `name = value`

`name` must start with a letter or underscore and may contain additional letters, numbers or underscores.

`value` may be a numerical constant, string constant, or expression. 
The expression will not be evaluated until the variable is used, which allows variables to be assigned to function calls, memory accessors, or logical comparisons to be evaluated later.

Variables allow storage of values for for later use. 
They may be assigned constant or calculated values. 
Variables within a function (including function parameters) are only accessible within the function. 
Variables outside a function may be used inside or outside of functions. 
Variables may not be referenced before they are defined.

##### Dictionaries
* `name = { key: value, key: value }`

A dictionary is a special type of variable that maps integer values to other values - typically string constants.
`key` may be a numerical constant or a variable that evaluates to a numerical constant.

Dictionaries can be accessed or modified using square brackets: `value = name[key]`. `name[key] = value`

#### Functions
* `function name(parameters) { code }`

A function is a reusable piece of code that may have slightly different behavior controlled by parameters that are passed to the function.

A function may return anything that can be assigned to a variable (numerical or string constants, or an expression to be evaluated later)

* `function name(parameters) => expression`

This shorthand defines a function that just returns the specified expression.

* `variable = name(parameter1, parameter2)`
* `variable = name(p1 = parameter1, p2 = parameter2)`

Functions are called by using the function name in an expression. Parameters may be passed by index or key.

#### Loops
* `for key in dictionary { code }`

Executes the specified code for each key in the provided dictionary.

#### If/Else
* `if (condition) { code }`
* `if (condition) { code } else { code }`

Allows arbitrary execution of code. Typically used inside functions or loops to change behavior based on parameter or loop index values.

#### Comments
* `// This is a comment`

Anytime the interpreter finds a double slash, the rest of the current line is ignored.

#### Defining Achievements
* `achievement(title, description, points, trigger)`

Defines a new achievement with the specified `title` (string), `description` (string), `points` (integer), and `trigger`.
`trigger` is an expression with one or more comparisons. 

```
function current_board() => byte(0x0088)
function current_player() => byte(0x008C)
function trigger_win_game() => current_board() == 0x8B && current_player() == 0
achievement(
    title = "Score!", description = "Win a game with at least 600 points", points = 25,
    trigger = trigger_win_game() && byte(0x0573) >= 0xF6 // 0x0573 is hundreds place of score
)
```
First, a couple of helper functions are defined to make the code easier to read. 
Because all functions are inlined and evaluated on use, this expands to:
```
trigger = byte(0x0088) == 0x8B && byte(0x008C) == 0 && byte(0x0573) >= 0xF6
```
Achievement triggers support three special helper functions:
* ```repeated(count, comparison)``` - adds a HitCount to the condition - the specified comparison must be true for `count` frames to trigger the achievement
* ```never(comparison)``` - this becomes a ResetIf - if the comparison is ever true, any hitcounts in the achievement are reset to 0
* ```unless(comparison)``` - this becomes a PauseIf - the achievement is not processed while this condition is true

#### Defining Rich Presence
* `rich_presence_display(format_string, parameters...)`

Defines the Rich Presence script. Only one string may be defined per script - if called multiple times, the last one will win.

`format_string` is a string with zero or more placeholders that will be evaluated by the emulator at runtime.
For each placeholder a parameter must be defined using the `rich_presence_` helper functions:
* `rich_presence_value(name, expression)`
* `rich_presence_lookup(name, expression, dictionary)`

`name` is the name to associate to the placeholder. 
`expression` is a memory accessor, arithmetic expression, or a function that evaluates to a memory access or arithmetic expression.
`dictionary` is the key to value map used to convert the result of `expression` into a string.

```
function lives() => byte(0x05D4) + 1
function stage() => byte(0x003A)
stages = { 1: "Downtown", 2: "Sewers" }
rich_presence_display("{0}, {1} lives",
    rich_presence_lookup("Stage", stage(), stages),
    rich_presence_value("Lives", lives())
)
```

#### Defining Leaderboards
* `leaderboard(title, description, start, cancel, submit, value)`

Defines a Leaderboard script. `title` and `description` must be strings.

`start`, `cancel`, and `submit` are trigger expressions similar to the `achievement`'s `trigger` parameter, except or conditions (`||`) are not supported.

`value` is a memory accessor, arithmetic expression, or a function that evaluates to a memory access or arithmetic expression.

### Runtime Achievement Processing
When checking to see if an achievement should trigger, the following three things happen in this order:
1) If any `PauseIf` condition is true, the achievement is ignored
2) If all standard conditions (non-`PauseIf`, non-`ResetIf`) are true, the achievement is triggered
3) If any `ResetIf` condition is true, all hitcounts are reset to 0.

If Alt groups are present (OR conditions), the Core group and one or more Alt groups must evaluate to true to trigger the achievement.
Note that `PauseIf`s in Alt groups only pause the Alt group. `ResetIf`s in Alt groups reset all `HitCount`s (Core and all Alt groups).

### Tricks
* A value changes to N X times: `repeated(X, byte(address) == N) && unless(prev(byte(address) == N))`
