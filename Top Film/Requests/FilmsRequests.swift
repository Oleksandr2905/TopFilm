//
//  FilmsInfo.swift
//  Top Film
//
//  Created by Maks on 10.07.2022.
//

import Foundation
class FilmsRequests {
    
    private let parsingFilms = ParsingFilms()
    private let constants = Constants()
    
    func filmsInfo(onCompletion: @escaping ([Result]?)->()) {
        let urlString = constants.parsingUrlString + "\(constants.apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                if let film = self.parsingFilms.parseJSON(withData: data) {
                    onCompletion(film)
                } else {
                    onCompletion(nil)
                }
            }
        }
        task.resume()
    }
}
