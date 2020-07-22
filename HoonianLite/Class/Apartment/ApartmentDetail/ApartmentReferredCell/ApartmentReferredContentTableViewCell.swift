//
//  ApartmentReferredContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentReferredContentTableViewCell: UITableViewCell {

    @IBOutlet weak var referredView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var agentNameLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var callAgentView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var commisionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        referredView.layer.masksToBounds = true
        referredView.layer.cornerRadius = 5
        referredView.layer.borderWidth = 0.5
        referredView.layer.borderColor = UIColor.lightGray.cgColor
        unitLabel.layer.masksToBounds = true
        unitLabel.layer.cornerRadius = 5
        unitLabel.widthAnchor.constraint(equalToConstant: unitLabel.frame.width + 10).isActive = true
        unitLabel.heightAnchor.constraint(equalToConstant: unitLabel.frame.height + 4).isActive = true
        callAgentView.layer.masksToBounds = true
        callAgentView.layer.cornerRadius = 5
        callAgentView.layer.borderWidth = 0.5
        callAgentView.layer.borderColor = UIColor.lightGray.cgColor
        statusView.layer.masksToBounds = true
        statusView.layer.cornerRadius = 5
        
        let callAgentGesture = UITapGestureRecognizer(target: self, action: #selector(callAgentAction))
    }
    
    @objc func callAgentAction() {
        print("call agent pressed")
    }
    
}
