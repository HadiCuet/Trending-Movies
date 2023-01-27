//
//  HomeViewController.swift
//  Trending Movies
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var noItemLabel: UILabel!
    
    private let viewModel: HomeViewModel
    private let tableViewCellName = "MovieTableViewCell"
    private let vcTitle = "Top Trending Movies"
    private let defaultImageName = "defaultPosterImage"
    private let detailVCId = "MovieDetailViewController"
    private var movieList = [MovieResult]()
    private var spinner = UIActivityIndicatorView()

    init?(coder: NSCoder, homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Failed to load view controller.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUpTableView()
        self.bindViewModelData()
        self.viewModel.getTrendingMovies()
        self.showLoader()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.title = vcTitle
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
                    Log.error("Home view controller doesn't exist any more. return")
                    return
                }
                self.showTableView(flag: list.count > 0)
                self.movieList = list
                self.movieTableView.reloadData()
                self.dismissLoader()
            }
        }
    }

    private func showTableView(flag: Bool) {
        movieTableView.isHidden = !flag
        noItemLabel.isHidden = flag
    }

    private func showLoader() {
        let viewSize = view.frame.size
        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height))
        spinner.backgroundColor = .black.withAlphaComponent(0.5)
        spinner.layer.cornerRadius = 5.0
        spinner.clipsToBounds = true
        spinner.hidesWhenStopped = true
        spinner.style = .large
        spinner.color = .white
        spinner.center = view.center
        view.addSubview(spinner)
        spinner.startAnimating()
        view.isUserInteractionEnabled = false
    }

    private func dismissLoader() {
        spinner.stopAnimating()
        view.isUserInteractionEnabled = true
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
        cell.releaseYearLabel.text = movie.releaseYear
        cell.posterImageView.image = UIImage(named: defaultImageName)
        if let posterUrl = movie.posterUrl {
            cell.posterImageView.loadImage(fromUrl: posterUrl)
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: mainStoryboard, bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: detailVCId, creator: { coder in
            return MovieDetailViewController(coder: coder, data: self.movieList[indexPath.row])
        })
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

