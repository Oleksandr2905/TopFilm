//
//  SecondViewPresenter.swift
//  Top Film
//
//  Created by Maks on 14.07.2022.
//

import Foundation
import UIKit

protocol DetailsPresenterProtocol {
    func setupDataPresenter()
    func configure() -> Film?
}

class DetailsPresenter: DetailsPresenterProtocol {
    
    private let view: DetailsViewControllerProtocol
    private var currentFilms: Film?
    
    required init(view: DetailsViewControllerProtocol, currentFilms1: Film?) {
        self.view = view
        self.currentFilms = currentFilms1
    }
    
    func configure() -> Film? {
        if currentFilms != nil {
            return currentFilms
        } else {
            print("error")
        }
        return currentFilms
    }
    
    func setupDataPresenter() {
        let titleFilm = self.currentFilms?.originalTitle
        let overviewFilm = self.currentFilms?.overview
        let rateFilm = self.currentFilms?.voteAverageString
        let datePresentFilm = self.currentFilms?.releaseDate
        let inputImageData = self.currentFilms?.posterPath
        let imageFilm = view.imageOutlet()
        ImageDownloaderManager.loadImageFromDatabase(inputImageData: inputImageData ?? "",
                                                     outputImage: imageFilm!)
        
        self.view.setupData(titleFilm: titleFilm,
                               overviewFilm: overviewFilm,
                               rateFilm: rateFilm,
                               datePresentFilm: datePresentFilm,
                               imageFilm1: imageFilm!)
        
    }
}
