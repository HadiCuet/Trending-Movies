//
//  UIImageView+Extensions.swift
//  Trending Movies
//
//  Created by Abdullah Al Hadi on 27/1/23.
//

import UIKit

extension UIImageView {
    func loadImage(fromUrl url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
        }
    }
}
