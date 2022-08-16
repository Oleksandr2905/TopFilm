//
//  ViewPresenter.swift
//  Top Film
//
//  Created by Maks on 14.07.2022.
//

import Foundation

protocol MainPresenterProtocol {
    func getFilm(for index: Int) -> Film
    func getRowsCount() -> Int
    func filmsInfoDataView()
}

class MainPresenter: MainPresenterProtocol {
    private let view: MainViewControllerProtocol
    private var films = [Film]()
    private let filmsRequests = FilmsRequests()
    
    required init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func filmsInfoDataView() {
        filmsRequests.filmsInfo() { [weak self] data in
            self?.films = data ?? []
            self?.view.updateInterfaceWith()
        }
    }
    
    func getFilm(for index: Int) -> Film {
        return films[index]
    }
    
    func getRowsCount() -> Int {
        return films.count
    }
}
