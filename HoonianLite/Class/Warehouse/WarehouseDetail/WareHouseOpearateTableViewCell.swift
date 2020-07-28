//
//  WareHouseOpearateTableViewCell.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class WareHouseOpearateTableViewCell: UITableViewCell {

    @IBOutlet weak var operateHours: UILabel!
    @IBOutlet weak var warehouseSize: UILabel!
    @IBOutlet weak var minimumRent: UILabel!
    @IBOutlet weak var pricePerMeter: UILabel!
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
        operateHours.text = ": \(obj.warehouseOpenHours)"
        warehouseSize.text = ": \(obj.warehouseSize)"
        minimumRent.text = ": \(obj.warehouseMinimRent)"
        pricePerMeter.text = ": \(obj.warehousepriceMeter)"
    }
    
}
