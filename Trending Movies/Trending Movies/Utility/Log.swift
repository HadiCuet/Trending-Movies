//
//  Log.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//


struct Log {
    static func info(_ message: String) {
        print(message)
    }

    static func error(_ message: String) {
        print("Error" + message)
    }
}
