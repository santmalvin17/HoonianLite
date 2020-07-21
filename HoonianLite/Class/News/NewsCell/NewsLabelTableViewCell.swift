//
//  NewsLabelTableViewCell.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsLabelTableViewCell: UITableViewCell {

    @IBOutlet weak var newsLabel: UILabel!
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var detailObj: NewsDataModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
        guard let obj = detailObj else { return }
        newsLabel.text = obj.content[position].body
    }
    
    
}
