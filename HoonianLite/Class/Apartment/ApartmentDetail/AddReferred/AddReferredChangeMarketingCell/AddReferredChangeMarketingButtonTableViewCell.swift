//
//  AddReferredChangeMarketingButtonTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol AddReferredChangeMarketingButtonTableViewCellDelegate {
    func changeButtonPressed()
}

class AddReferredChangeMarketingButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var changeButton: UIButton!
    
    var delegate: AddReferredChangeMarketingButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        changeButton.layer.masksToBounds = true
        changeButton.layer.cornerRadius = 5
        
        changeButton.addTarget(self, action: #selector(changeButtonAction), for: .touchUpInside)
    }
    
    @objc func changeButtonAction() {
        delegate?.changeButtonPressed()
    }
    
}
