//
//  HomeLocationCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeLocationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    func config() {
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 5
    }
    var detailObj: HomeDataModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        cityLabel.text = obj.cities[position].name
        self.imageView.sd_setImage(
            with: URL(string: (obj.cities[position].image)),
            placeholderImage: UIImage(named: "Location Logo"),
            options: .refreshCached
        )
    }


}
