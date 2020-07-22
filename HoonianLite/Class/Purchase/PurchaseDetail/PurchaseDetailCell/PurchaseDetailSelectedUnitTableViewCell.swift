//
//  PurchaseDetailSelectedUnitTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseDetailSelectedUnitTableViewCell: UITableViewCell {

    @IBOutlet weak var unitTypeView: UIView!
    @IBOutlet weak var unitTypeLabel: UILabel!
    @IBOutlet weak var unitTypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var detailObj: ProjectPurchasedData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        unitTypeLabel.text = "Unit \(obj.projectData.name)"
        self.unitTypeImageView.sd_setImage(
            with: URL(string: (obj.projectData.projectBlock.imageFloorPlan)),
            placeholderImage: UIImage(named: "School Logo"),
            options: .refreshCached
        )

    }
    
}
