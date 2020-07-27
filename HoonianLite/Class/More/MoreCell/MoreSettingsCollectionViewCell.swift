//
//  MoreSettingsCollectionViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 27/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class MoreSettingsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var featuredLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        featuredImage.layer.masksToBounds = true
        featuredImage.layer.cornerRadius = featuredImage.frame.width / 2
    }
    
    func configCell(indexPath: Int) {
        let menu = ACData.LOGINDATA.accessList[0].menus[indexPath].mobileMenuId
        
        featuredLabel.text = ACData.LOGINDATA.accessList[0].menus[indexPath].mobileMenuname
    }

}
