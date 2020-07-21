//
//  ApartmentDetailFacilityContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentDetailFacilityContentTableViewCell: UITableViewCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var facilityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        numberLabel.layer.masksToBounds = true
        numberLabel.layer.cornerRadius = numberLabel.frame.width / 2
    }
    
}
