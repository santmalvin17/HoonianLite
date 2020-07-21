//
//  HomeContentCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeContentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    func config() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
    }
    
}
