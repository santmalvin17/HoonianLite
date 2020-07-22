//
//  ContactDetailProjectPurchaseTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ContactDetailProjectPurchaseTableViewCell: UITableViewCell {

    @IBOutlet weak var purchaseImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    var position = 0
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
    }
    
    var detailObj: ContactDetailModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.purchaseImageView.sd_setImage(
            with: URL(string: (obj.clientData.purchasedProect[position].image)),
            placeholderImage: UIImage(named: "Project Purchased Image"),
            options: .refreshCached
        )
        nameLabel.text = obj.clientData.purchasedProect[position].name
        locationLabel.text = obj.clientData.purchasedProect[position].city
        statusLabel.text = obj.clientData.purchasedProect[position].purchaseStatus
        if statusLabel.text == "Booking Fee"{
            statusLabel.textColor = .red
        }else{
            statusLabel.textColor = .black
        }
    }
    
}
