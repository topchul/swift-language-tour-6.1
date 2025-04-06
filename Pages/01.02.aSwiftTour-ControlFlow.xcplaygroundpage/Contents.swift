//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Control Flow
//: ### Loops
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
// Prints "11"

//: ### Conditional Value Using if
let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration)
// Prints "Score: 11 🎉"

//: ### Using if-let to Unwrap Optionals
var optionalString: String? = "Hello"
print(optionalString == nil)
// Prints "false"

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print(greeting)
// Prints "Hello, John Appleseed"

/*: - Experiment:
     Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.
*/
Do.experiment {
    var optionalName: String? = nil
    var greeting = "Hello!"
    if let name = optionalName {
        greeting = "Hello, \(name)"
    }
    print(greeting)
    // Prints just "Hello!"
}

//: ### Default Value Operator `??`
let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

//: ### Optional Binding Shorthand
if let nickname {
    print("Hey, \(nickname)")
}
// Doesn't print anything, because nickname is nil.

//: ### switch Statement
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
// Prints "Is it a spicy red pepper?"

/*: - Experiment:
    Try removing the default case. What error do you get?
*/
Do.ignoreError{
//    let vegetable = "red pepper"
//    // Error: Switch must be exhaustive
//    switch vegetable {
//    case "celery":
//        print("Add some raisins and make ants on a log.")
//    case "cucumber", "watercress":
//        print("That would make a good tea sandwich.")
//    case let x where x.hasSuffix("pepper"):
//        print("Is it a spicy \(x)?")
//    }
}

//: ### for-in Loops
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)
// Prints "25"

/*: - Experiment:
     Replace the _ with a variable name, and keep track of which kind of number was the largest.
*/
Do.experiment {
    let interestingNumbers = [
        "Prime": [2, 3, 5, 7, 11, 13],
        "Fibonacci": [1, 1, 2, 3, 5, 8],
        "Square": [1, 4, 9, 16, 25],
    ]
    var largest = 0, largestNumberKind: String? = nil
    for (numberKind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largestNumberKind = numberKind
                largest = number
            }
        }
    }
    print(largest, largestNumberKind ?? "Unknown")
    // Prints "25 Square"
}

//: ### while and repeat-while Loops
var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"


var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"

/*: - Experiment:
    Change the condition from m < 100 to m < 0 to see how while and repeat-while behave differently when the loop condition is already false.
 */

Do.experiment {
    var n = 2
    while n < 0 {
        n *= 2
    }
    print(n)
    // Prints "2"
    
    var m = 2
    repeat {
        m *= 2
    } while m < 0
    print(m)
    // Prints "4"
}

//: ### Looping through Ranges of Indices
var total = 0
for i in 0..<4 {
    total += i
}
print(total)
// Prints "6"

//: [Next](@next)
