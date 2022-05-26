//
//  SearchListModel.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import Foundation
/*
 {
         "Title": "Becoming Bond",
         "Year": "2017",
         "imdbID": "tt6110504",
         "Type": "movie",
         "Poster": "https://m.media-amazon.com/images/M/MV5BZDRiNGIzYWEtYzY3Zi00MTcwLWFkOWItZjEyYjg0OGMxMGQ5XkEyXkFqcGdeQXVyMjM4NjQxMDA@._V1_SX300.jpg"
     }
 */

struct SearchListModel: Codable {
    var search: [SearchListItemModel]
    
    enum RootKeys: String, CodingKey {
        case search = "Search"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        search = try container.decodeIfPresent([SearchListItemModel].self, forKey: .search) ?? []
    }
}

struct SearchListItemModel: Codable {
    var title: String
    var year: String
    var imdbID: String
    var type: String
    var image: String
    
    enum RootKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case image = "Poster"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
    }
}
