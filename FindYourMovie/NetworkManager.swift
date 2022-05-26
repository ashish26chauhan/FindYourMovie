//
//  NetworkManager.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import Foundation

typealias MovieResultHandler = (SearchListModel?, Error?) -> ()
typealias MovieDeatilHandler = (MovieDetailModel?, Error?) -> ()

class NetworkManager {
    
    class func executeAPI(with key: String, completion: @escaping MovieResultHandler) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=9f3cf5e0&s=\(key)&page=1") else {
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, response, error in
            if (error == nil) {
                if let response = data {
                    do {
                        let searchList = try JSONDecoder().decode(SearchListModel.self, from: response)
                        completion(searchList, error)
                    }catch {
                        completion(nil, error)
                    }
                }else {
                    completion(nil, error)
                }
            }else {
                completion(nil, error)
            }
        }.resume()
        
    }
    
    class func fetchImage(urlStr: String, completion: @escaping (Data?, Bool) -> ()) {
        guard let url = URL(string: urlStr) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, resp, error in
            if error == nil {
                if let imgData = data {
                    completion(imgData, true)
                }else {
                    completion(nil, false)
                }
            }else {
                completion(nil, false)
            }
        }.resume()
    }
    
    class func fetchDetailsOfAMovie(imdbId: String, completion: @escaping MovieDeatilHandler) {
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=9f3cf5e0") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            if error == nil {
                if let resp = data {
                    do {
                        let details = try JSONDecoder().decode(MovieDetailModel.self, from: resp)
                        completion(details, error)
                    } catch {
                        completion(nil, error)
                    }
                }else {
                    completion(nil, error)
                }
            }else {
                completion(nil, error)
            }
        }.resume()
        
    }
    
}
