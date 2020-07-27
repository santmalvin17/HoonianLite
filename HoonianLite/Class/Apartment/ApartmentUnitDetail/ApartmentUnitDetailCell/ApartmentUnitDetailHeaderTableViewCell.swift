//
//  ApartmentUnitDetailHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var unitNameLabel: UILabel!
    @IBOutlet weak var unitImageView: UIImageView!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var totalUnitLabel: UILabel!
    @IBOutlet weak var availableUnitLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var detailObj: UnitTypeDetailModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        unitNameLabel.text = obj.projectTypeDetail.name
        
        self.unitImageView.sd_setImage(
            with: URL(string: (obj.projectTypeDetail.image)),
            placeholderImage: UIImage(named: "Unit Image"),
            options: .refreshCached
        )
        sizeLabel.text = ": \(obj.projectTypeDetail.size)"
        priceLabel.text = "Rp \(obj.projectTypeDetail.startPrice.formattedWithSeparator)"
        totalUnitLabel.text = ": \(obj.projectTypeDetail.totalUnit) Unit"
        availableUnitLabel.text = ": \(obj.projectTypeDetail.availUnit) Unit"
    }
    
}
