//
//  MovieDetailVM.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 27/05/22.
//

import Foundation

class MovieDetailVM {
    var imdbID: String
    
    init(imdbID: String) {
        self.imdbID = imdbID
    }
    
    func fetchMovieDetails(completion: @escaping (MovieDetailModel?, Bool)  -> ()) {
        NetworkManager.fetchDetailsOfAMovie(imdbId: imdbID) { data, error in
            if error == nil {
                completion(data, true)
            }
        }
    }
}
