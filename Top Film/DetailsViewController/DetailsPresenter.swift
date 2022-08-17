//
//  SecondViewPresenter.swift
//  Top Film
//
//  Created by Maks on 14.07.2022.
//

import Foundation
import UIKit

protocol DetailsPresenterProtocol {
    var film: Film { get }
}

class DetailsPresenter: DetailsPresenterProtocol {
    
    private let view: DetailsViewControllerProtocol
    let film: Film
    
    required init(view: DetailsViewControllerProtocol, film: Film) {
        self.view = view
        self.film = film
    }
}
