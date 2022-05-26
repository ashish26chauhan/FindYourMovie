//
//  MovieDetailModel.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import Foundation

struct MovieDetailModel: Codable {
    var title: String
    var year: String
    var rated: String
    var released: String
    var runTime: String
    var genre: String
    var director: String
    var writers: String
    var actors: String
    var plot: String
    var language: String
    var country: String
    var awards: String
    var image: String
    var ratings: [MovieRatings]
    var metaScore: String
    var imdbRatings: String
    var imdbVotes: String
    var imdbID: String
    var type: String
    var dvd: String
    var boxOffice: String
    var production: String
    var website: String
    var response: String
    
    enum RootKeys: String, CodingKey {
      case title = "Title"
      case year = "Year"
      case rated = "Rated"
      case released = "Released"
        case runTime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writers = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case image = "Poster"
        case ratings = "Ratings"
        case metaScore = "Metascore"
        case imdbRatings = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        year = try container.decodeIfPresent(String.self, forKey: .year) ?? ""
        rated = try container.decodeIfPresent(String.self, forKey: .rated) ?? ""
        released = try container.decodeIfPresent(String.self, forKey: .released) ?? ""
        runTime = try container.decodeIfPresent(String.self, forKey: .runTime) ?? ""
        genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? ""
        director = try container.decodeIfPresent(String.self, forKey: .director) ?? ""
        writers = try container.decodeIfPresent(String.self, forKey: .writers) ?? ""
        actors = try container.decodeIfPresent(String.self, forKey: .actors) ?? ""
        plot = try container.decodeIfPresent(String.self, forKey: .plot) ?? ""
        language = try container.decodeIfPresent(String.self, forKey: .language) ?? ""
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? ""
        awards = try container.decodeIfPresent(String.self, forKey: .awards) ?? ""
        image = try container.decodeIfPresent(String.self, forKey: .image) ?? ""
        ratings = try container.decodeIfPresent([MovieRatings].self, forKey: .ratings) ?? []
        metaScore = try container.decodeIfPresent(String.self, forKey: .metaScore) ?? ""
        imdbRatings = try container.decodeIfPresent(String.self, forKey: .imdbRatings) ?? ""
        imdbVotes = try container.decodeIfPresent(String.self, forKey: .imdbVotes) ?? ""
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        dvd = try container.decodeIfPresent(String.self, forKey: .dvd) ?? ""
        boxOffice = try container.decodeIfPresent(String.self, forKey: .boxOffice) ?? ""
        production = try container.decodeIfPresent(String.self, forKey: .production) ?? ""
        website = try container.decodeIfPresent(String.self, forKey: .website) ?? ""
        response = try container.decodeIfPresent(String.self, forKey: .response) ?? ""
    }
}

struct MovieRatings: Codable {
    var source: String
    var value: String
    
    enum RootKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        source = try container.decode(String.self, forKey: .source)
        value = try container.decode(String.self, forKey: .value) 
    }
}
