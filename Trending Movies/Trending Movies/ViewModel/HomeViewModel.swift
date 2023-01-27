//
//  HomeViewModel.swift
//  Trending Movies
//

import Foundation

protocol HomeViewModelProtocol {
    var movieList: Bindable<[MovieResult]> { get }
    func getTrendingMovies()
}

class HomeViewModel: HomeViewModelProtocol {
    var movieList: Bindable<[MovieResult]>
    private let clientService: MovieServiceProtocol

    init(clientService: MovieServiceProtocol) {
        self.clientService = clientService
        self.movieList = Bindable([])
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
                self.movieList.value = list.results

            case .failure(let error):
                self.movieList.value = []
                Log.error(error.localizedDescription)
            }
        }
    }
}
