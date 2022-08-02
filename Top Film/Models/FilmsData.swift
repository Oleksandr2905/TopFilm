//
//  FilmsData.swift
//  Top Film
//
//  Created by Maks on 12.06.2022.
//

import Foundation

struct FilmsData: Codable {
    let results: [Result]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct Result: Codable {
    let backdropPath: String
    let id: Int
    var idString: String {
        return "\(id)"
    }
    let originalTitle: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    var voteAverageString: String {
        return "\(voteAverage)"
    }

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}


