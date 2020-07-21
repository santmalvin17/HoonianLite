//
//  HomeHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configLocation() {
        titleLabel.text = "LOCATIONS"
    }
    
    func configApartment() {
        titleLabel.text = "APARTMENT"
    }
    
    func configLandedProperty() {
        titleLabel.text = "LANDED PROPERTY"
    }
    
    func configWarehouse() {
        titleLabel.text = "WAREHOUSE"
    }
    
}
