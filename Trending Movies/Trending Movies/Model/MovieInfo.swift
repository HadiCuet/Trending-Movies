//
//  MovieInfo.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

struct MovieInfo: Decodable {
    let results: [MovieResult]
}

struct MovieResult: Decodable {
    let poster_path: String?
    var posterUrl: URL? {
        if let posterPath = poster_path {
            return URL(string: baseImageUrl + MovieRoute.posterImage.rawValue + posterPath)
        }
        return nil
    }
    let title: String
    let overview: String
    let release_date: String?
}
