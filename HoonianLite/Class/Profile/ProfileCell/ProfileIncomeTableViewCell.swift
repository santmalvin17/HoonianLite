//
//  ProfileIncomeTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ProfileIncomeTableViewCell: UITableViewCell {

    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var incomeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        incomeView.layer.masksToBounds = true
        incomeView.layer.cornerRadius = 5
        incomeView.layer.borderWidth = 0.5
        incomeView.layer.borderColor = #colorLiteral(red: 0.5474331975, green: 0.7959615588, blue: 0.7610880733, alpha: 1)
    }
    var detailObj: ProfileData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        incomeLabel.text = obj.agent.totalPaid
        
    }
    
}
