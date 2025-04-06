//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Generics
//: ### Creating a Generic Function or Type

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
         result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

//: ### Creating Generic Versions of Functions and Methods

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)

//: ### Using `where` Clauses with a Specific Superclass

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Element: Equatable, T.Element == U.Element
{
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
   return false
}
anyCommonElements([1, 2, 3], [3])

/*: - Experiment:
 Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.
 */
func anyCommonElements2
<T: Sequence, U: Sequence, Element> (
    _ lhs: T,
    _ rhs: U
) -> Array<Element>
where Element: Equatable,
      T.Element == Element,
      T.Element == U.Element
{
    return lhs.filter {
        Array(rhs).contains($0)
    }
}

Do.experiment {
    anyCommonElements2([1, 2, 3], [3])
}

//: [Next](@next)
