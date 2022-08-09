//
//  SecondViewPresenter.swift
//  Top Film
//
//  Created by Maks on 14.07.2022.
//

import Foundation
import UIKit

protocol SecondViewPresenterProtocol {
    func setupSVCDataPresenter()
    func configure() -> Result?
}

class SecondViewPresenter: SecondViewPresenterProtocol {
    
    private let view: SecondViewControllerProtocol
    private var currentFilms: Result?
    
    required init(view: SecondViewControllerProtocol, currentFilms1: Result?) {
        self.view = view
        self.currentFilms = currentFilms1
    }
    
    func configure() -> Result? {
        if currentFilms != nil {
            return currentFilms
        } else {
            print("error")
        }
        return currentFilms
    }
    
    func setupSVCDataPresenter() {
        let titleFilm = self.currentFilms?.originalTitle
        let overviewFilm = self.currentFilms?.overview
        let rateFilm = self.currentFilms?.voteAverageString
        let datePresentFilm = self.currentFilms?.releaseDate
        let inputImageData = self.currentFilms?.posterPath
        let imageFilm = view.imageOutlet()
        ImageDownloaderManager.loadImageFromDatabase(inputImageData: inputImageData ?? "",
                                                     outputImage: imageFilm!)
        
        self.view.setupSVCData(titleFilm: titleFilm,
                               overviewFilm: overviewFilm,
                               rateFilm: rateFilm,
                               datePresentFilm: datePresentFilm,
                               imageFilm1: imageFilm!)
        
    }
}
