//
//  PListModel.swift
//  SwiftUIExample
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/28/21.
//

import Foundation

struct URLPListModel: Decodable {
    let general: String
    let search: String
}

struct PathPListModel: Decodable {
    let trending: String
    let popular: String
    let movieDetail: String
    let tvShowDetail: String
    let seachByWord: String
    
    enum CodingKeys: String, CodingKey {
        case trending
        case popular
        case movieDetail = "movie_detail"
        case tvShowDetail = "tv_show_detail"
        case seachByWord = "search_by_word"
    }
}

