//
//  ApartmentDetailGalleryTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentDetailGalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var galleryLabel: UILabel!
    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var detailObj: ProjectDetailModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.galleryImageView.sd_setImage(
            with: URL(string: (obj.gallery[0].link)),
            placeholderImage: UIImage(named: "Gallery Logo"),
            options: .refreshCached
        )
    }
    
}
