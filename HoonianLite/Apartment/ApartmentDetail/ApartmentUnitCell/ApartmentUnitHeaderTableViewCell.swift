//
//  ApartmentUnitHeaderTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ApartmentUnitHeaderTableViewCellDelegate{
    func towerClicked(indexKe:Int,sectionKe:Int)
}

class ApartmentUnitHeaderTableViewCell: UITableViewCell {
    
    var delegate:ApartmentUnitHeaderTableViewCellDelegate?

    @IBOutlet weak var towerLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var soldLabel: UILabel!
    var position = 0
    var section = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
        towerLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(towerAction))
        towerLabel.addGestureRecognizer(gesture)
    }
    
    @objc func towerAction(){
        delegate?.towerClicked(indexKe:position, sectionKe: section)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        
    }
    var detailObj: ProjectClusterData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        towerLabel.text = obj.name
        totalLabel.text = "Total \(obj.totalUnit) Unit"
        var myIntValue:Int = Int(obj.soldPercentage*100)
        soldLabel.text = "Sold \(myIntValue)%"
    }
    
}


