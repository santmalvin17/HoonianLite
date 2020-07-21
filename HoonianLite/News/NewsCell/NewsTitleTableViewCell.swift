//
//  NewsTitleTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var newsTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.newsTitleLabel.text = "Proyek Apartemen Baru Puri Orchad Dibilangan Jakarta Barat"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
