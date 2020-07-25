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
}

class AddReferredContentTableViewCell: UITableViewCell {

    @IBOutlet weak var contactCheckbox: CheckBox!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var notesButton: UIButton!
    
    var delegate: AddReferredContentTableViewCellDelegate?
    
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
    }
    
    @objc func notesButtonAction() {
        delegate?.notesButtonPressed()
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
