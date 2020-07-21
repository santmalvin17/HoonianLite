//
//  HomeLocationHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeLocationHeaderTableViewCellDelegate {
    func moreLocationPressed()
}

class HomeLocationHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var delegate: HomeLocationHeaderTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        moreButton.addTarget(self, action: #selector(moreLocationAction), for: .touchUpInside)
    }
    
    @objc func moreLocationAction() {
        delegate?.moreLocationPressed()
    }
    
}
