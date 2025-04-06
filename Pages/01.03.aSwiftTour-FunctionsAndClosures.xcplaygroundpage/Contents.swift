//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Functions and Closures

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

/*: - Experiment
     Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
 */
Do.experiment {
    func greet(person: String, launchSpecial: String) -> String {
        return "Hello \(person), today's lunch special is \(launchSpecial)."
    }
    greet(person: "Bob", launchSpecial: "Tuesday")
}

//: ### Use _ to omit argument labels
func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet("John", on: "Wednesday")

//: ### Returning Multiple Values with Tuples
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.2)
// Prints "120"

//: ### Nested Functions
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//: Functions as First-Class Types
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//: ### Passing Functions as Arguments
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

//: ### Using Anonymous Closures
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

/*: - Experiment
    Rewrite the closure to return zero for all odd numbers.
 */
Do.experiment {
    numbers.map({ (number: Int) -> Int in
        if number.isMultiple(of: 2) {
            return 3 * number
        } else {
            return 0
        }
    })
}

//: ### Shorthand Closure Syntax
let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)
// Prints "[60, 57, 21, 36]"

//: ### Even Shorter Closure Syntax
let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)
// Prints "[20, 19, 12, 7]"

//: [Next](@next)
