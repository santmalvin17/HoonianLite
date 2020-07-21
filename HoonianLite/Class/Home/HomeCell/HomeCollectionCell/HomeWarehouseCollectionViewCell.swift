//
//  HomeWarehouseCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeWarehouseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var propertyNameLabel: UILabel!
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
        propertyNameLabel.text = obj.wareHouse.projects[position].name
        cityLabel.text = obj.wareHouse.projects[position].city
           self.imageView.sd_setImage(
            with: URL(string: (obj.wareHouse.projects[position].image)),
               placeholderImage: UIImage(named: "WareHouse Logo"),
               options: .refreshCached
           )
    }


}
