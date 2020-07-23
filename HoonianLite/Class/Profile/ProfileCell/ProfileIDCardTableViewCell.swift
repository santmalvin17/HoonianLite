//
//  ProfileIDCardTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ProfileIDCardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var idCardLabel: UILabel!
    @IBOutlet weak var idCardImageView: UIImageView!
    
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
        self.idCardImageView.sd_setImage(
            with: URL(string: (obj.agent.idCardPhoto)),
            placeholderImage: UIImage(named: "id card photo"),
            options: .refreshCached
        )

    }
    
}
