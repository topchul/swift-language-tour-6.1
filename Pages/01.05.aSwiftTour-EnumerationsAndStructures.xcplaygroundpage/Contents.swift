//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Enumerations and Structures
//: ### Defining Enumerations

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

/*: - Experiment:
     Write a function that compares two Rank values by comparing their raw values.
 */
Do.experiment {
    func compareRanks(_ rank1: Rank, _ rank2: Rank) -> Bool {
        return rank1.rawValue < rank2.rawValue
    }
}

//: ### Initializing Enumerations with rawValue
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//: ### Enumerations Without rawValue
enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

/*: - Experiment:
     Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
*/
Do.experiment {
    enum Suit {
        case spades, hearts, diamonds, clubs
        
        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .clubs:
                return "clubs"
            }
        }
        
        func color() -> String {
            switch self {
            case .spades, .clubs:
                return "black"
            case .hearts, .diamonds:
                return "red"
            }
        }
    }
    let hearts = Suit.hearts
    let heartsDescription = hearts.color()
}

//: ### Associated Values vs. Raw Values
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
}
// Prints "Sunrise is at 6:00 am and sunset is at 8:09 pm."

/*: - Experiment:
     Add a third case to ServerResponse and to the switch.
 */
Do.experiment {
    enum ServerResponse {
        case result(String, String)
        case failure(String)
        case invalidURL(String)
    }
    let success = ServerResponse.result("6:00 am", "8:09 pm")
    let failure = ServerResponse.failure("Out of cheese.")
    let invalidURL = ServerResponse.invalidURL("https://colinkhub.cagr48.com")

    switch invalidURL {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure...  \(message)")
    case .invalidURL(let invalidURL):
        print("not a valid URL...  \(invalidURL)")
    }
}

//: ### Defining Structures
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

/*: - Experiment:
     Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.
*/
Do.experiment {
    let fullDeck = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
        .map { suit in
            [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five,
             Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten,
             Rank.jack, Rank.queen, Rank.king]
                .map { Card(rank: $0, suit: suit) }
        }
        .flatMap { $0 }
    print(fullDeck.map({ $0.simpleDescription() }).joined(separator: "\n"))
}

//: [Next](@next)
