//
//  Log.swift
//  Trending Movies
//


struct Log {
    static func info(_ message: String) {
        print(message)
    }

    static func error(_ message: String) {
        print("Error" + message)
    }
}
