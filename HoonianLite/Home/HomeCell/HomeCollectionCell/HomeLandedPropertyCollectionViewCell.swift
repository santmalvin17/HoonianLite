//
//  HomeLandedPropertyCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeLandedPropertyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    func config() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
    }


}
