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
    
    static public func experiment(_ codes: () throws -> Void) rethrows {
        try codes()
    }
    static public func throwsError<E: Swift.Error>(
        _ e: E.Type,
        _ codes: () throws -> Void
    ) rethrows {
        
        do {
            try codes()
        } catch let caughtError as E {
            print("OK: Error caught – \(caughtError)")
        } catch {
            throw error
        }
        
        print("ERROR: No matching error found")
    }
    static public func ignoreError(_ codes: () throws -> Void) rethrows { }
}

public enum DoError: Error {
    case error
}
