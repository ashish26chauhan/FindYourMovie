//
//  ViewController.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: "SearchListTableCell", bundle: .main), forCellReuseIdentifier: "SearchListTableCell")
        }
    }
    
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "Search your movie"
        activityIndicator.isHidden = true
    }
    
    private func fetchMovieDataFor(query: String) {
        viewModel.fetchMovies(for: query) { [weak self] (data, success) in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = true
                self?.activityIndicator.stopAnimating()
                if success {
                    self?.tableView.reloadData()
                }else {
                    print("error")
                }
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTableCell") as? SearchListTableCell {
            cell.setUpData(data: viewModel.itemList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBar.searchTextField.resignFirstResponder()
        let vm = MovieDetailVM(imdbID: viewModel.itemList[indexPath.row].imdbID)
        let vc = MovieDetailVC.newInstance(viewModel: vm)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let query = searchBar.searchTextField.text {
            fetchMovieDataFor(query: query)
            searchBar.searchTextField.resignFirstResponder()
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            viewModel.itemList.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
}
