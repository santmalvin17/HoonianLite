//
//  ProfileLogoutButtonTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ProfileLogoutButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        logoutButton.layer.masksToBounds = true
        logoutButton.layer.cornerRadius = 5
        
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func logoutButtonAction() {
        print("logout button pressed")
    }
    
}
