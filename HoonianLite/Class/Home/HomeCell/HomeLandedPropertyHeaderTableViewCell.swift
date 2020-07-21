//
//  HomeLandedPropertyHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeLandedPropertyHeaderTableViewCellDelegate {
    func moreLandedPropertyPressed()
}

class HomeLandedPropertyHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var landedPropertyLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var delegate: HomeLandedPropertyHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        moreButton.addTarget(self, action: #selector(moreAction), for: .touchUpInside)
    }
    
    @objc func moreAction() {
        delegate?.moreLandedPropertyPressed()
    }
    
}
