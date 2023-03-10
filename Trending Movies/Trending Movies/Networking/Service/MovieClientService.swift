//
//  MovieClientService.swift
//  Trending Movies
//

import Foundation

protocol MovieServiceProtocol {
    func getTrendingMovies(_ completion: @escaping (Result<MovieInfo>) -> ())
}

class MovieClientService: MovieServiceProtocol {

    let session : URLSession
    let serviceHelper : ClientServiceHelper

    init(urlSession: URLSession, serviceHelper: ClientServiceHelper) {
        self.session = urlSession
        self.serviceHelper = serviceHelper
    }

    func getTrendingMovies(_ completion: @escaping (Result<MovieInfo>) -> ()) {
        let parameters = serviceHelper.getTrendingMoviesParams()

        do {
            let request = try HTTPNetworkRequest.configureHTTPRequest(from: .trendingMovie, with: parameters, includes: nil, contains: nil, and: .get)

            session.dataTask(with: request) { (data, res, err) in

                guard err == nil else {
                    completion(.failure(HTTPError.dataTaskFailed))
                    return
                }

                guard let response = res as? HTTPURLResponse, let unwrappedData = data else {
                    completion(Result.failure(HTTPError.noData))
                    return
                }

                let result = HTTPNetworkResponse.handleNetworkResponse(for: response)
                switch result {

                case .success:
                    guard let movieInfo = try? JSONDecoder().decode(MovieInfo.self, from: unwrappedData) else {
                        Log.info("[Error] Movie info json decoding failed")
                        completion(.failure(HTTPError.decodingFailed))
                        return
                    }
                    Log.info("[Success] Movie list response count - \(movieInfo.results.count)")
                    completion(.success(movieInfo))

                case .failure (let cause):
                    Log.info("[Error] Network response failed - \(cause.localizedDescription)")
                    completion(.failure(cause))
                }
            }.resume()
        }
        catch (let ex) {
            Log.info("[Exception] Get movie info exception - \(ex.localizedDescription)")
            completion(.failure(HTTPError.badRequest))
        }
    }
}
