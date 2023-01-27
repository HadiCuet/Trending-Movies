//
//  HomeViewController.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

class HomeViewController: UIViewController {

    let viewModel: HomeViewModel

    init?(coder: NSCoder, homeViewModel: HomeViewModel) {
        self.viewModel = homeViewModel
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("Failed to load view controller.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

