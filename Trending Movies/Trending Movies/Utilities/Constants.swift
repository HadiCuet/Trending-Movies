//
//  Constants.swift
//  Trending Movies
//

import UIKit

//MARK: URLs
let baseURL: String = "https://api.themoviedb.org/"
let baseImageUrl: String = "https://image.tmdb.org/"

//MARK: API Key/Value
let kApiKeyParam = "api_key"
let kApiKeyValue = "c9856d0cb57c3f14bf75bdc6c063b8f3"
let kQueryParam = "query"
let timeOutInterval: TimeInterval = 20.0

//MARK: View Constants
let mainStoryboard = "Main"

//MARK: Others
let imageCache = NSCache<NSString, UIImage>()
