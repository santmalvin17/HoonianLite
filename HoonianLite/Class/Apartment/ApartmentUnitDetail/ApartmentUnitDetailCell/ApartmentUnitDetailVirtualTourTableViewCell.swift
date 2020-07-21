//
//  ApartmentUnitDetailVirtualTourTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitDetailVirtualTourTableViewCell: UITableViewCell {

    @IBOutlet weak var virtualTourLabel: UILabel!
    @IBOutlet weak var virtualTourImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        virtualTourImageView.layer.masksToBounds = true
        virtualTourImageView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
