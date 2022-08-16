//
//  CustomTableViewCell.swift
//  Top Film
//
//  Created by Maks on 06.06.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet private weak var imageOfFilm: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
        
    override func prepareForReuse() {
        super.prepareForReuse()
        resetCTVC()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageOfFilm.layer.cornerRadius = 10
        imageOfFilm.clipsToBounds = true
    }
    
    private func resetCTVC() {
        imageOfFilm.image = nil
        titleLabel.text = nil
        overviewLabel.text = nil
        dateLabel.text = nil
    }
    
    func updateInterface(film: Film) {
        titleLabel.text = film.originalTitle
        overviewLabel.text = film.overview
        dateLabel.text = "Release: " + film.releaseDate
   
        ImageDownloaderManager.loadImageFromDatabase(inputImageData: film.posterPath, outputImage: imageOfFilm)
    }
}

