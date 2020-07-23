//
//  ProfileButtonTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ProfileButtonTableViewCellDelegate {
    func changePasswordButtonPressed()
}

class ProfileButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    var delegate: ProfileButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        editProfileButton.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 50).isActive = true
        changePasswordButton.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 50).isActive = true
        
        editProfileButton.layer.masksToBounds = true
        editProfileButton.layer.cornerRadius = 5
        changePasswordButton.layer.masksToBounds = true
        changePasswordButton.layer.cornerRadius = 5
        
        editProfileButton.addTarget(self, action: #selector(editProfileButtonAction), for: .touchUpInside)
        changePasswordButton.addTarget(self, action: #selector(changePasswordButtonAction), for: .touchUpInside)
    }
    
    @objc func editProfileButtonAction() {
        print("edit profile pressed")
    }
    
    @objc func changePasswordButtonAction() {
        print("change password pressed")
        
        delegate?.changePasswordButtonPressed()
    }
    
}
