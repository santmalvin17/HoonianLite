//
//  WarehouseLocationDetailTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class WarehouseLocationDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var warehouseImageView: UIImageView!
    @IBOutlet weak var warehouseNameLabel: UILabel!
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
    
}
