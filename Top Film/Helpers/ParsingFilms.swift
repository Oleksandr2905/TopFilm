//
//  Parsing.swift
//  Top Film
//
//  Created by Maks on 12.06.2022.
//

import Foundation

class ParsingFilms {
    
    func parseJSON(withData data: Data) -> [Result]? {
        let decoder = JSONDecoder()
        do {
            let filmsData = try decoder.decode(FilmsData.self, from: data)
            return filmsData.results
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
