//
//  doFunctions.swift
//
//
//  Created by 노재현 on 4/6/25.
//
public struct Do {
    enum Error: Swift.Error {
        case error
    }
    
    static public func experiment<T>(_ codes: () throws -> T) rethrows -> T {
        try codes()
    }
    static public func throwsError<T, E: Swift.Error>(
        _ e: E.Type,
        _ codes: () throws -> T
    ) rethrows {
        
        do {
            let result = try codes()
            print("ERROR: No matching error found")
        } catch let caughtError as E {
            print("OK: Error caught – \(caughtError)")
        } catch {
            throw error
        }
    }
    static public func ignoreError<T>(_ codes: () throws -> T) rethrows { }
}

public enum DoError: Error {
    case error
}
