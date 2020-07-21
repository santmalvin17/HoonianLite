//
//  HomeApartmentHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeApartmentHeaderTableViewCellDelegate {
    func moreApartmentPressed()
}

class HomeApartmentHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var apartmentLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    
    var delegate: HomeApartmentHeaderTableViewCellDelegate?
    
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
        delegate?.moreApartmentPressed()
    }
    
}
