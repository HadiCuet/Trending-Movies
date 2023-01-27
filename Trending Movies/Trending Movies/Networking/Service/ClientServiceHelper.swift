//
//  ClientServiceHelper.swift
//  Trending Movies
//

import Foundation

struct ClientServiceHelper {

    func getTrendingMoviesParams() -> [String: String] {
        var paramDict: [String: String] = [:]
        paramDict[kApiKeyParam] = kApiKeyValue
        return paramDict
    }
}
