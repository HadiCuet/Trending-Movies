//
//  URLEncoder.swift
//  Trending Movies
//

import Foundation

public struct URLEncoder {

    /// Encode and set the parameters of a url request
    static func encodeParameters(for urlRequest: inout URLRequest, with parameters: HTTPParameters) throws {
        guard let unwrappedParameters = parameters else {
            Log.info("No parameters to encode")
            return
        }
        guard let url = urlRequest.url else {
            throw HTTPError.missingURL
        }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !unwrappedParameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()

            for (key,value) in unwrappedParameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")

                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }

    }

    /// Set the addition http headers of the request
    static func setHeaders(for urlRequest: inout URLRequest, with headers: HTTPHeaders) throws {
        guard let unwrappedHeaders = headers else {
            Log.info("No headers to encode")
            return
        }
        for (key, value) in unwrappedHeaders{
            urlRequest.setValue(value as? String, forHTTPHeaderField: key)
        }
    }
}
