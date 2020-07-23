//
//  AddReferredMarketingTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class AddReferredMarketingTableViewCell: UITableViewCell {

    @IBOutlet weak var marketingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketingImageView: UIImageView!
    @IBOutlet weak var changeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        marketingImageView.layer.masksToBounds = true
        marketingImageView.layer.cornerRadius = marketingImageView.frame.height / 2
        changeButton.layer.masksToBounds = true
        changeButton.layer.cornerRadius = 5
        changeButton.addTarget(self, action: #selector(changeButtonAction), for: .touchUpInside)
    }
    
    @objc func changeButtonAction() {
        print("change button pressed")
    }
    
}
