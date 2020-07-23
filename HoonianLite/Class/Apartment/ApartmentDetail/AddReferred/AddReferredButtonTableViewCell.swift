//
//  AddReferredButtonTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol AddReferredButtonTableViewCellDelegate {
    func cancelButtonPressed()
}

class AddReferredButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var addFromContactButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var delegate: AddReferredButtonTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        addFromContactButton.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 50).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: self.contentView.frame.width / 2 - 50).isActive = true
        
        addFromContactButton.layer.masksToBounds = true
        addFromContactButton.layer.cornerRadius = 5
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 5
        
        addFromContactButton.addTarget(self, action: #selector(addFromContactButtonAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    @objc func addFromContactButtonAction() {
        print("add from contact button pressed")
    }
    
    @objc func cancelButtonAction() {
        print("cancel button pressed")
        
        delegate?.cancelButtonPressed()
    }
    
}
