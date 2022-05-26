//
//  SeaechListTableCell.swift
//  FindYourMovie
//
//  Created by Ashish Chauhan on 26/05/22.
//

import UIKit


class SearchListTableCell: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpData(data: SearchListItemModel) {
        lblTitle.text = data.title
    }
}
