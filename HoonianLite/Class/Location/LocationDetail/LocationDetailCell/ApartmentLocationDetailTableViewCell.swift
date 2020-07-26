//
//  ApartmentLocationDetailTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentLocationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var apartmentNameLabel: UILabel!
    @IBOutlet weak var apartmentLocationLabel: UILabel!
    @IBOutlet weak var locationIconImageView: UIImageView!
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
        self.apartmentImageView.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "Apartment Image"),
            options: .refreshCached
        )
        apartmentNameLabel.text = obj.name
        apartmentLocationLabel.text = obj.city.name
        availableLabel.text = "Available: \(obj.availUnit)"
        var text = "\(obj.startPrice)"
        priceLabel.text = "\(text.prefix(3))JT"
        
    }
    
}
