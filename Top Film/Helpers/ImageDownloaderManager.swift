//
//  ImageDownloaderManager.swift
//  Top Film
//
//  Created by Maks on 07.07.2022.
//

import Foundation
import SDWebImage

class ImageDownloaderManager {
    static func loadImageFromDatabase(inputImageData: String, outputImage: UIImageView) -> Void {
        let constants = Constants()
        let imageOfFilmURL = constants.imageURL+inputImageData
        guard let url = URL(string: imageOfFilmURL) else { return }
        outputImage.sd_setImage(with: url, completed: nil)
    }
}
