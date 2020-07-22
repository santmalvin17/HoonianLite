//
//  ApartmentUnitDetailGalleryCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitDetailGalleryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var galleryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var detailObj: GalleryData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.galleryImage.sd_setImage(
            with: URL(string: (obj.link)),
            placeholderImage: UIImage(named: "Gallery Image"),
            options: .refreshCached
        )
    }


}
