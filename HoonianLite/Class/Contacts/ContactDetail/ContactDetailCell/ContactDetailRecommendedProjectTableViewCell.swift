//
//  ContactDetailRecommendedProjectTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ContactDetailRecommendedProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var recommendedImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        recommendedImageView.layer.masksToBounds = true
        recommendedImageView.layer.cornerRadius = 5
    }
    
}
