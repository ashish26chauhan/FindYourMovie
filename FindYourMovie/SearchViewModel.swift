//
//  SearchViewModel.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import Foundation

class SearchViewModel {
    
    var itemList: [SearchListItemModel] = []
    
    func fetchMovies(for key: String, completion: @escaping (SearchListModel?, Bool)  -> ()) {
        NetworkManager.executeAPI(with: key) { [weak self] (data, error) in
            if error == nil {
                if let list = data?.search {
                    self?.itemList = list
                }
                completion(data, true)
            }else {
                completion(nil, false)
            }
        }
    }
    
    func fetchImage(urlStr: String, completion: @escaping (Data?, Bool) -> ()) {
        NetworkManager.fetchImage(urlStr: urlStr) { (imgData, success) in
            if success {
                completion(imgData, true)
            }
        }
    }
}
