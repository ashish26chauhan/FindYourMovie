//
//  MovieDetailVC.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 27/05/22.
//

import UIKit

class MovieDetailVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var lblIMDB: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblActors: UILabel!
    @IBOutlet weak var movieCertification: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblMoviePlot: UILabel!
    
    private var viewModel: MovieDetailVM?
    
    class func newInstance(viewModel: MovieDetailVM) -> MovieDetailVC {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MovieDetailVC") as! MovieDetailVC
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        viewModel?.fetchMovieDetails(completion: { [weak self] (data, success) in
            DispatchQueue.main.async {
                if success {
                    self?.setUpData(data: data)
                }
            }
        })
    }
    
    private func setUpData(data: MovieDetailModel?) {
        if let details = data {
            lblTitle.text = details.title
            lblIMDB.text = "IMDB: \(details.imdbRatings)"
            lblActors.text = "Actor(s): \(details.actors)"
            lblDirector.text = "Director: \(details.director)"
            lblMoviePlot.text = details.plot
            lblReleaseDate.text = "Released: \(details.released)"
            movieCertification.text = "Rated: \(details.rated)"
            
            NetworkManager.fetchImage(urlStr: details.image) { [weak self] (data, success) in
                DispatchQueue.main.async {
                    if let imgData = data {
                        self?.movieImage.image = UIImage.init(data: imgData)
                    }
                }
            }
        }
    }
    
    @IBAction func btnGoBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
