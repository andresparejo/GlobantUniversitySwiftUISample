//
//  Movie.swift
//  Movie
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/21/21.
//

import Foundation

struct ShowResponse: Decodable, Equatable {
    let page: Int
    let results: [Show]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

protocol DisplayableShow {
    var originalTitle: String? { get }
    var posterPath: String? { get }
}

struct Show: Decodable, Equatable, DisplayableShow, Identifiable {
    let originalTitle: String?
    let posterPath: String?
    let video: Bool?
    let voteAverage: Double
    let overview: String
    let releaseDate: String?
    let iden: Int
    let adult: Bool?
    let backdropPath: String
    let voteCount: Int
    let genreIDS: [Int]
    let title: String?
    let originalLanguage: String
    let popularity: Double
    let mediaType: MediaType?
    let originalName: String?
    let originCountry: [String]?
    let name, firstAirDate: String?

    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case video
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
        case iden = "id"
        case adult
        case backdropPath = "backdrop_path"
        case voteCount = "vote_count"
        case genreIDS = "genre_ids"
        case title
        case originalLanguage = "original_language"
        case popularity
        case mediaType = "media_type"
        case originalName = "original_name"
        case originCountry = "origin_country"
        case name
        case firstAirDate = "first_air_date"
    }
    
    var id: UUID {
        return UUID(uuidString: "\(iden)") ?? UUID()
    }
    
    var picture: String {
        return "https://image.tmdb.org/t/p/w500\(posterPath ?? "")"
    }
}
