//
//  MovieTableViewCell.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.posterImageView.image = nil
    }
}
