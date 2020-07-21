//
//  ContactListTableViewCell.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ContactListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var initialLabel: UILabel!{
        didSet{
            initialLabel.layer.cornerRadius = 25
            initialLabel.clipsToBounds = true
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recommendNumber: UILabel!{
        didSet{
            recommendNumber.layer.cornerRadius = 10
            recommendNumber.clipsToBounds = true
        }
    }
    @IBOutlet weak var recommendLabel: UILabel!
    @IBOutlet weak var purchaseLabel: UILabel!
    @IBOutlet weak var purchaseNumber: UILabel!{
        didSet{
            purchaseNumber.layer.cornerRadius = 10
            purchaseNumber.clipsToBounds = true
        }
    }
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setView()
    }
    func setView(){
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var detailObj: ContactListModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
        guard let obj = detailObj else { return }
        initialLabel.text = "\(obj.contacts[position].name.prefix(1))"
        nameLabel.text = obj.contacts[position].name
        recommendNumber.text = "\(obj.contacts[position].referred)"
        purchaseNumber.text = "\(obj.contacts[position].purchased)"
        if obj.contacts[position].referred == 0{
            recommendLabel.isHidden = true
            recommendNumber.isHidden = true
        }else{
            recommendLabel.isHidden = false
            recommendNumber.isHidden = false
        }
        if obj.contacts[position].purchased == 0{
            purchaseLabel.isHidden = true
            purchaseNumber.isHidden = true
        }else{
            purchaseLabel.isHidden = false
            purchaseNumber.isHidden = false
        }
        
    }
    
    
}
