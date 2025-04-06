//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

print("Hello, world!")
// Prints "Hello, world!"
 
//: ## Simple Values

//: ### Declaring Constants and Variables
var myVariable = 42
myVariable = 50
let myConstant = 42

//: ### Type Inference and Explicit Types
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
/*: - Experiment:
 Create a constant with an explicit type of Float and a value of 4.
 */
Do.experiment {
    let explicitFloat: Float = 4
}

//: ### Type Conversion
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

/*: - Experiment:
 Try removing the conversion to String from the last line. What error do you get?
*/
Do.ignoreError {
    // error: binary operator '+' cannot be applied to operands of type 'String' and 'Int'
//     let widthLabel = label + width
}

//: ### String Interpolation using \\\(...\)
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
/*:
 - Experiment
    Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
*/
Do.experiment {
    let bsp_2x2 = "2 x 2 = \(2 * 2)"
    let bsp_someoneName = "John"
    let bsp_greeting = "Hello, \(bsp_someoneName)! How are you?"
}

//: ### Multiline Strings
let quotation = """
        Even though there's whitespace to the left,
        the actual lines aren't indented.
            Except for this line.
        Double quotes (") can appear without being escaped.

        I still have \(apples + oranges) pieces of fruit.
        """
//: ### Arrays and Dictionaries
var fruits = ["strawberries", "limes", "tangerines"]
fruits[1] = "grapes"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
 ]
occupations["Jayne"] = "Public Relations"
//: ### Adding Elements
fruits.append("blueberries")
print(fruits)
// Prints "["strawberries", "grapes", "tangerines", "blueberries"]"
//: ### Creating Empty Collections
fruits = []
occupations = [:]
//: Explicitly Typed Arrays and Dictionaries
let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]

//: [Next](@next)
