//
//  Result.swift
//  Trending Movies
//


enum Result<T> {
    case success(T)
    case failure(Error)
}
