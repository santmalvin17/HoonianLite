//
//  LandedLocationDetailTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class LandedLocationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var landedImageView: UIImageView!
    @IBOutlet weak var landedNameLabel: UILabel!
    @IBOutlet weak var locationIconImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var availableIconImageView: UIImageView!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        priceView.layer.masksToBounds = true
        priceView.layer.cornerRadius = 5
    }
    
    var detailObj: ProjectListData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.landedImageView.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "Landed Image"),
            options: .refreshCached
        )
        landedNameLabel.text = obj.name
        locationLabel.text = obj.city.name
        availableLabel.text = "Available: \(obj.availUnit)"
        var text = "\(obj.startPrice)"
        priceLabel.text = "\(text.prefix(3))JT"
        
    }
    
}
