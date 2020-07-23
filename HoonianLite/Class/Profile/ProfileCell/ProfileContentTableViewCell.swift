//
//  ProfileContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ProfileContentTableViewCell: UITableViewCell {

    @IBOutlet weak var namanyaCui: UILabel!
    @IBOutlet weak var labelCui: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var detailObj: ProfileData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
    }
    
}
