//
//  ContactDetailHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ContactDetailHeaderTableViewCellDelegate {
    func editContactButtonPressed()
}

class ContactDetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var relationLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    
    var delegate: ContactDetailHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        editButton.layer.masksToBounds = true
        editButton.layer.cornerRadius = 5
        
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
    }
    
    @objc func editButtonAction() {
        print("edit button pressed")
        delegate?.editContactButtonPressed()
    }
    
    var detailObj: ContactDetailModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        nameLabel.text = obj.clientData.name
        phoneLabel.text = obj.clientData.phoneNumber
        idLabel.text = obj.clientData.id
        workLabel.text = obj.clientData.occupation
        relationLabel.text = obj.clientData.relation
    }
    
}
