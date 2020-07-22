//
//  ApartmentMoreContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentMoreContentTableViewCell: UITableViewCell {

    @IBOutlet weak var apartmentView: UIView!
    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var apartmentLabel: UILabel!
    @IBOutlet weak var locationIconImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var availableIconImageView: UIImageView!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        apartmentView.layer.masksToBounds = true
        apartmentView.layer.cornerRadius = 5
        apartmentLabel.layer.masksToBounds = true
        apartmentLabel.layer.cornerRadius = 5
        priceView.layer.masksToBounds = true
        priceView.layer.cornerRadius = 5
        apartmentView.layer.borderWidth = 0.5
        apartmentView.layer.borderColor = UIColor.lightGray.cgColor
        favoriteButton.layer.masksToBounds = true
        favoriteButton.layer.cornerRadius = 5
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    @objc func favoriteButtonAction() {
        print("favorite pressed")
    }
    
}
