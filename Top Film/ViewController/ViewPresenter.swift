//
//  ViewPresenter.swift
//  Top Film
//
//  Created by Maks on 14.07.2022.
//

import Foundation

protocol ViewPresenterProtocol {
    func configure() -> ([Result])
    func getRowsCountAt() -> Int
    func filmsInfoDataView()
}

class ViewPresenter: ViewPresenterProtocol {
    private let view: ViewControllerProtocol
    private var film = [Result]()
    private let filmsInfo = FilmsRequests()
    
    required init(view: ViewControllerProtocol) {
        self.view = view
        filmsInfoDataView()
    }
    
    func filmsInfoDataView() {
        filmsInfo.filmsInfo() { [weak self] data in
            self?.film = data ?? []
            self?.view.updateInterfaceWith()
        }
    }
    
    func configure() -> ([Result]){
        let film = film
        return film
    }
    
    func getRowsCountAt() -> Int {
        return film.count
    }
}
