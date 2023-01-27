//
//  NetworkResponse.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import Foundation

struct HTTPNetworkResponse {

    static func handleNetworkResponse(for response: HTTPURLResponse?) -> Result<String> {

        guard let res = response else {
            Log.info("[Error] response unwrapping error")
            return Result.failure(HTTPError.UnwrappingError)
        }

        Log.info("Network response status code - \(res.statusCode)")
        switch res.statusCode {
        case 200...299: return Result.success(HTTPError.success.rawValue)
        case 401:       return Result.failure(HTTPError.authenticationError)
        case 400...499: return Result.failure(HTTPError.badRequest)
        case 500...599: return Result.failure(HTTPError.serverSideError)
        default:        return Result.failure(HTTPError.failed)
        }
    }
}
