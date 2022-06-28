//
//  FilmModel.swift
//  Top Film
//
//  Created by Maks on 05.06.2022.


import Foundation
import UIKit

struct Film {
    var image: String
    var title: String
    var rate: String
    var overview: String
    var date: String
    var id: String
    var backdropPath: String

    init?(filmsData: Result) {
        image = filmsData.posterPath
        title = filmsData.originalTitle
        rate = filmsData.voteAverageString
        overview = filmsData.overview
        date = filmsData.releaseDate
        id = filmsData.idString
        backdropPath = filmsData.backdropPath
//
//    init?(filmsData: FilmsData) {
//        image = "Ремінісценція"
//        title = "Ремінісценція"
//        rate = "9"
//        overview = "У центрі сюжетної лінії виявляється  Пентагоні. Здаватися Коллінз не збирається. Наразі найкращим рішенням стає повернення додому. Плани зненацька зриваються. На базу вчинено напад. Якщо не спробувати дати ворогам відсіч, то ядерна зброя"
//        date = "23.09.2020"
//        id = "2324"
//        backdropPath = "Ремінісценція"
    }
}
//
    
//        let filmTitle = ["Ремінісценція",
//                         "Перехоплювач",
//                         "Загублене місто",
//                        "Бетмен"]
//
    
//
//    func getFilms() -> [Film] {
//
//        var films = [Film]()
//
//        for film in  {
//            films.append(Film(image: film, title: film, rate: "9", overview: film, date: film))
//        }
//
//        return films
//    }

//}
