//
//  MovieDetailViewController.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
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
        fatalError("")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let imagerUrl = movieData.posterUrl {
            posterImageView.loadImage(fromUrl: imagerUrl)
        }
        movieTitleLabel.text = movieData.title
        releaseDateLabel.text = movieData.release_date
        movieDetailLabel.text = movieData.overview
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        let detailLabelOriginY = movieDetailLabel.frame.origin.y
        let detailLabelHeight = movieDetailLabel.frame.size.height
        contentViewHeightConstraint.constant = detailLabelOriginY + detailLabelHeight
    }
}
