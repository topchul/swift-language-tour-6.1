//: [Previous](@previous)

/*:
 # A Swift Tour
 
 Explore the features and syntax of Swift.
 */

//: ## Concurrency
//: ### Defining Asynchronous Functions

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

//: ### Calling Async Functions with `await`

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}

//: ### Running Async Tasks in Parallel with `async let`

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)
    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}

//: ### Calling Async Code from Sync Context

Task {
    await connectUser(to: "primary")
}
// Prints "Hello Guest, user ID 97"

//: ### Organizing Concurrency with `withTaskGroup`

Task {
    let userIDs = await withTaskGroup(of: Int.self) { group in
        for server in ["primary", "secondary", "development"] {
            group.addTask {
                return await fetchUserID(from: server)
            }
        }
        
        var results: [Int] = []
        for await result in group {
            results.append(result)
        }
        return results
    }
}
//: > Note: TaskGroup does not guarantee execution order

//: ### Using Actors for Safe Concurrency

actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []
    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}

//: ### Interacting with Actors Using `await`

let server = ServerConnection()
Task {
    let userID = await server.connect()
}

//: [Next](@next)
