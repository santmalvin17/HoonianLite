//
//  PurchaseItemTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseItemTableViewCell: UITableViewCell {

    @IBOutlet weak var purchaseImageView: UIImageView!
    @IBOutlet weak var viewDetailButton: UIButton!
    @IBOutlet weak var purchaseName: UILabel!
    @IBOutlet weak var unitTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyerLabel: UILabel!
    @IBOutlet weak var agentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var comissionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        purchaseImageView.layer.masksToBounds = true
        purchaseImageView.layer.cornerRadius = 5
        viewDetailButton.layer.masksToBounds = true
        viewDetailButton.layer.cornerRadius = 5
    }
    
}
