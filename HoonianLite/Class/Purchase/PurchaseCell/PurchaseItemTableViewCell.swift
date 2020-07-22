//
//  PurchaseItemTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import Hex

protocol PurchaseItemTableViewCellDelegate{
    func detailPurchase(indexKe:Int)
}

class PurchaseItemTableViewCell: UITableViewCell {

    var delegate:PurchaseItemTableViewCellDelegate?
    @IBOutlet weak var purchaseImageView: UIImageView!
    @IBOutlet weak var viewDetailButton: UIButton!
    @IBOutlet weak var purchaseName: UILabel!
    @IBOutlet weak var unitTypeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyerLabel: UILabel!
    @IBOutlet weak var agentLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var comissionLabel: UILabel!
    var position = 0
    var comission:Float = 0.0
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
        
        viewDetailButton.addTarget(self, action: #selector(detailButtonClicked), for: .touchUpInside)
    }
    
    @objc func detailButtonClicked(){
        delegate?.detailPurchase(indexKe: position)
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        purchaseImageView.layer.masksToBounds = true
        purchaseImageView.layer.cornerRadius = 5
        viewDetailButton.layer.masksToBounds = true
        viewDetailButton.layer.cornerRadius = 5
    }
    
    var detailObj: PurchaseListModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.purchaseImageView.sd_setImage(
            with: URL(string: (obj.projectPurchaseList[position].project.image)),
            placeholderImage: UIImage(named: "Purchased Image"),
            options: .refreshCached
        )
        purchaseName.text = obj.projectPurchaseList[position].project.name
        unitTypeLabel.text = ": \(obj.projectPurchaseList[position].projectUnit.name)"
        priceLabel.text = ": \(obj.projectPurchaseList[position].price)"
        buyerLabel.text = ": \(obj.projectPurchaseList[position].client.name)"
        agentLabel.text = ": \(obj.projectPurchaseList[position].agent.name)"
        statusLabel.textColor = UIColor(hex: "\(obj.projectPurchaseList[position].status.colorCode)")
        statusLabel.text = ": \(obj.projectPurchaseList[position].status.name)"
        comission = 750000000 * obj.projectPurchaseList[position].project.commisionRate
        comissionLabel.text = ": Rp. \(Int(comission))"
    }
    
}


