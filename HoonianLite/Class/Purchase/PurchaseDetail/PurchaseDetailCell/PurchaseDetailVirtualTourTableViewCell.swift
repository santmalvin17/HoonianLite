//
//  PurchaseDetailVirtualTourTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseDetailVirtualTourTableViewCell: UITableViewCell {

    @IBOutlet weak var virtualTourLabel: UILabel!
    @IBOutlet weak var virtualTourImageView: UIImageView!
    
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
                self.virtualTourImageView.sd_setImage(
                    with: URL(string: (obj.projectData.projectUnitType.virtualTour[0].link)),
            placeholderImage: UIImage(named: "Virtual Image Logo"),
            options: .refreshCached
        )

    }
    
}
