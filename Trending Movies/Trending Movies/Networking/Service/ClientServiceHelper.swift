//
//  ClientServiceHelper.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import Foundation

struct ClientServiceHelper {

    func getTrendingMoviesParams() -> [String: String] {
        var paramDict: [String: String] = [:]
        paramDict[kApiKeyParam] = kApiKeyValue
        return paramDict
    }
}
