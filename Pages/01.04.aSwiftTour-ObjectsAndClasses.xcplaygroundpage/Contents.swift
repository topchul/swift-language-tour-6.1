//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Objects and Classes
//: ### Declaring a Class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

/*: - Experiment:
    Add a constant property with let, and add another method that takes an argument.
*/
Do.experiment {
    class Shape {
        let name: String = "Shape"
        
        var numberOfSides = 0
        func simpleDescription() -> String {
            return "A shape with \(numberOfSides) sides."
        }
        
        func sayHello(to person: String) -> String {
            return "Hello, \(person)!"
        }
    }
}

//: ### Creating an Instance and Using Dot Syntax
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//: ### Defining an Initializer
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
       self.name = name
    }

    func simpleDescription() -> String {
       return "A shape with \(numberOfSides) sides."
    }
}

//: ### Subclassing and Overriding Methods
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

/*: - Experiment
     Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.
*/
Do.experiment {
    class Circle: NamedShape {
        var radius: Double
        
        init(radius: Double, name: String) {
            self.radius = radius
            super.init(name: name)
            numberOfSides = 1
        }
        
        func area() -> Double {
            radius * radius * .pi
        }

        override func simpleDescription() -> String {
            "A Circle with radius \(radius)."
        }
    }
    let test = Circle(radius: 1, name: "my test circle")
    test.area()
    test.simpleDescription()
}

//: ### Using Getters and Setters
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
             return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }


    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"

//: ### Property Observers: willSet and didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"
print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"

//: ### Optional Chaining with Class Instances
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

//: [Next](@next)
