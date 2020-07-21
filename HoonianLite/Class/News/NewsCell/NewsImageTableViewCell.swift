//
//  NewsImageTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsImageTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.cornerRadius = 5
    }
    
    var detailObj: NewsDataModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.newsImageView.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "News Image"),
            options: .refreshCached
        )
    }
}
