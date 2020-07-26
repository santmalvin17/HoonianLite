//
//  HomeApartmentCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeApartmentCollectionViewCell: UICollectionViewCell {

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
        propertyNameLabel.text = obj.apartment.projects[position].name
        self.imageView.sd_setImage(
            with: URL(string: (obj.apartment.projects[position].image)),
            placeholderImage: UIImage(named: "Apartment Logo"),
            options: .refreshCached
        )
        cityLabel.text = obj.apartment.projects[position].city.name
    }


}
