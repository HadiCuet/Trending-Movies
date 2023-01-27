//
//  HomeViewModel.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import Foundation

protocol HomeViewModelProtocol {
    var movieList: Bindable<[MovieResult]> { get }
    func getTrendingMovies()
}

class MovieViewModel: NSObject, HomeViewModelProtocol {
    var movieList: Bindable<[MovieResult]> = Bindable([])
    private var clientService: MovieClientService

    override init() {
        self.clientService = MovieClientService()
        super.init()
    }

    func getTrendingMovies() {
        Log.info("Get trnding movie list from network.")
        self.clientService.getTrendingMovies { [weak self] movieList in
            guard let `self` = self else {
                Log.error("View model object not exist anymore. return.")
                return
            }
            switch movieList {
            case .success(let list):
                self.movieList.value = list.results.map({ (movie) -> MovieResult in
                    return movie
                })

            case .failure(let error):
                Log.error(error.localizedDescription)
            }
        }
    }
}
