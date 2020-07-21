//
//  LocationListCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class LocationListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        locationImageView.layer.masksToBounds = true
        locationImageView.layer.cornerRadius = 10
    }

}
