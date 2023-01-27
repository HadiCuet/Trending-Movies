//
//  Result.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//


enum Result<T> {
    case success(T)
    case failure(Error)
}
