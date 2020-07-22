//
//  ApartmentMoreSearchTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentMoreSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var favoriteCheckBox: CheckBox!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var recommendedCheckBox: CheckBox!
    @IBOutlet weak var recommendedLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        searchView.layer.masksToBounds = true
        searchView.layer.cornerRadius = 5
        searchButton.layer.masksToBounds = true
        searchButton.layer.cornerRadius = 5
    }
    
}
