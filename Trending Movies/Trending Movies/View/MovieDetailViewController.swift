//
//  MovieDetailViewController.swift
//  Trending Movies
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieDetailLabel: UILabel!
    @IBOutlet weak var contentViewHeightConstraint: NSLayoutConstraint!

    let movieData: MovieResult

    init?(coder: NSCoder, data: MovieResult) {
        self.movieData = data
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Failed to load detail view controller.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.topItem?.title = ""
        title = "Movie Details"

        if let imagerUrl = movieData.posterUrl {
            posterImageView.loadImage(fromUrl: imagerUrl)
        }
        movieTitleLabel.text = movieData.title
        releaseDateLabel.text = movieData.releaseYear
        movieDetailLabel.text = movieData.overview
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let detailLabelOriginY = movieDetailLabel.frame.origin.y
        let detailLabelHeight = movieDetailLabel.frame.size.height
        contentViewHeightConstraint.constant = detailLabelOriginY + detailLabelHeight
    }
}
