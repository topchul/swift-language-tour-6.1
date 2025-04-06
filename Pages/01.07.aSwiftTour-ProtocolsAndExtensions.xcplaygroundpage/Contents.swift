//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Protocols and Extensions
//: ### Defining Protocols

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

//: ### Conforming to Protocols

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

/*: - Experiment:
     Add another requirement to ExampleProtocol. What changes do you need to make to SimpleClass and SimpleStructure so that they still conform to the protocol?
 */
// Implement more requirements in Implementations or in new Implements with extensions

//: ### Adding Functionality with Extensions

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
// Prints "The number 7"

/*: - Experiment:
     Write an extension for the Double type that adds an absoluteValue property.
 */
extension Double {
    var absoluteValue: Double {
        if self < 0 {
            return -self
        }
        return self
    }
}
print(-3.0.absoluteValue)

//: ### Using Protocols as Types

let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class.  Now 100% adjusted."
// print(protocolValue.anotherProperty)  // Uncomment to see the error

//: [Next](@next)
