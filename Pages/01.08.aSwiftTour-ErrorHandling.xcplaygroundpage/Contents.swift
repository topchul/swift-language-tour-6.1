//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Error Handling
//: ### Defining an Error

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

//: ### Using `throw` and `throws`

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

//: ### Handling Errors with `do-catch`

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "Job sent"

/*: - Experiment:
     Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
 */
Do.experiment {
    do {
        let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
        print(printerResponse)
    } catch {
        print(error)
    }
    // Prints "noToner"
}

//: ### Using Multiple Catch Blocks

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}
// Prints "Job sent"

/*: - Experiment:
     Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?
*/
Do.experiment {
    do {
        throw PrinterError.onFire
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
    do {
        throw PrinterError.outOfPaper
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
    do {
        enum EHError: Error { case oops }
        throw EHError.oops
    } catch PrinterError.onFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printerError as PrinterError {
        print("Printer error: \(printerError).")
    } catch {
        print(error)
    }
}

//: ### Using `try?` for Optional Results

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

//: ### Cleaning Up with `defer`

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

@MainActor
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
if fridgeContains("banana") {
    print("Found a banana")
}
print(fridgeIsOpen)
// Prints "false"

//: [Next](@next)
