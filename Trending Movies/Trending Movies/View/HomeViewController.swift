//
//  HomeViewController.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!

    private let viewModel: HomeViewModel
    private let tableViewCellName = "MovieTableViewCell"
    private let vcTitle = "Top Trending Movies"
    let defaultImageName = "defaultPosterImage"
    private var movieList = [MovieResult]()

    init?(coder: NSCoder, homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Failed to load view controller.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = vcTitle

        self.setUpTableView()
        self.bindViewModelData()
        self.viewModel.getTrendingMovies()
    }

    private func setUpTableView() {
        movieTableView.delegate = self
        movieTableView.dataSource = self
        let tableCellNib = UINib(nibName: tableViewCellName, bundle: nil)
        movieTableView.register(tableCellNib, forCellReuseIdentifier: tableViewCellName)
    }

    private func bindViewModelData() {
        viewModel.movieList.bind { [weak self] list in
            DispatchQueue.main.async {
                guard let `self` = self else {
                    return
                }
                self.movieList = list
                self.movieTableView.reloadData()
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieList.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellObject = tableView.dequeueReusableCell(withIdentifier: tableViewCellName, for: indexPath)
        guard let cell = cellObject as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let movie = self.movieList[indexPath.row]
        cell.movieTitleLabel.text = movie.title
        cell.releaseYearLabel.text = movie.release_date
        cell.posterImageView.image = UIImage(named: defaultImageName)
        if let posterUrl = movie.posterUrl {
            cell.posterImageView.loadImage(fromUrl: posterUrl)
        }
        cell.selectionStyle = .none
        return cell
    }
}

