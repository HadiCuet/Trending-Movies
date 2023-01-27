//
//  UIImageView+Extensions.swift
//  Trending Movies
//

import UIKit

extension UIImageView {
    func loadImage(fromUrl url: URL) {
        let imagePathString = url.lastPathComponent as NSString
        if let cachedImage = imageCache.object(forKey: imagePathString) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let imageData = try? Data(contentsOf: url), let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: imagePathString)
                    self?.image = image
                }
            }
        }
    }
}
