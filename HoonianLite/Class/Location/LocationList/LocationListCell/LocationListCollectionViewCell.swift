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
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        locationImageView.layer.masksToBounds = true
        locationImageView.layer.cornerRadius = 10
    }
    var detailObj: HomeDataModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        locationLabel.text = obj.cities[position].name
        self.locationImageView.sd_setImage(
            with: URL(string: (obj.cities[position].image)),
            placeholderImage: UIImage(named: "City Logo"),
            options: .refreshCached
        )
    }

}
