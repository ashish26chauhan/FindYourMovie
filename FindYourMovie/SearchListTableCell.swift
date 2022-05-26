//
//  SeaechListTableCell.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import UIKit


class SearchListTableCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView! {
        didSet {
            imageV.layer.cornerRadius = imageV.frame.size.width / 2
        }
    }
    @IBOutlet weak var lblTitle: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    func setUpData(data: SearchListItemModel) {
        lblTitle.text = data.title
        NetworkManager.fetchImage(urlStr: data.image) { [weak self] (imgData, success) in
            if success {
                DispatchQueue.main.async {
                    if let img = imgData {
                        self?.imageV.image = UIImage.init(data: img)
                    }
                }
            }
        }
        
    }
}
