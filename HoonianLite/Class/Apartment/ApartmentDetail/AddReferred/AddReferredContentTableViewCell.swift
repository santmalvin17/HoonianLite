//
//  AddReferredContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol AddReferredContentTableViewCellDelegate {
    func notesButtonPressed()
    func contactId(contactKe:Int)
}

class AddReferredContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contactCheckbox: CheckBox!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notesButton: UIButton!
    
    var delegate: AddReferredContentTableViewCellDelegate?
    var position = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        notesButton.addTarget(self, action: #selector(notesButtonAction), for: .touchUpInside)
        contactCheckbox.addTarget(self, action: #selector(contactButtonChecked), for: .touchUpInside)
    }
    
    @objc func notesButtonAction() {
        delegate?.notesButtonPressed()
    }
    
    @objc func contactButtonChecked(){
        if contactCheckbox.isChecked == false{
            delegate?.contactId(contactKe: position)
        }else{
            
        }
    }
    
    var detailObj: ClientData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
        guard let obj = detailObj else { return }
        nameLabel.text = obj.name
    }
}
