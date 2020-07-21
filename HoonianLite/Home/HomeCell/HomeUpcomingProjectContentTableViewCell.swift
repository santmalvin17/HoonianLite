//
//  HomeUpcomingProjectContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeUpcomingProjectContentTableViewCellDelegate {
    func imageViewPressed()
}

class HomeUpcomingProjectContentTableViewCell: UITableViewCell {

    @IBOutlet weak var upcomingProjectImageView: UIImageView!
    
    var delegate: HomeUpcomingProjectContentTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewAction))
        upcomingProjectImageView.isUserInteractionEnabled = true
        upcomingProjectImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func imageViewAction(tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.imageViewPressed()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
