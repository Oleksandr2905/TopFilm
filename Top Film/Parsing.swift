//
//  Parsing.swift
//  Top Film
//
//  Created by Maks on 12.06.2022.
//

import Foundation

class ParsingFilms {
    
//    var onCompletion: ((Film) -> (Void))?
    func filmsInfo(onCompletion: @escaping (Film)->()) {
//    func filmsInfo(forFilmId filmId: Int) {
        let urlString =
    "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
//                let dataString = String(data: data, encoding: .utf8)
//                print(dataString!)
                if let film = self.parseJSON(withData: data) {
                    onCompletion(film)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Film? {
       let decoder = JSONDecoder()
        do {
            let filmsData = try decoder.decode(Result.self, from: data)
            guard let film = Film(filmsData: filmsData) else {
                return nil
            }
            return film
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}


