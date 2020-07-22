//
//  ApartmentUnitContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitContentTableViewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unitImageView: UIImageView!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var floorPlanView: UIView!
    @IBOutlet weak var priceListView: UIView!
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
         config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        let floorPlanGesture = UITapGestureRecognizer(target: self, action: #selector(floorPlanViewAction))
        floorPlanView.addGestureRecognizer(floorPlanGesture)
        
        let priceListGesture = UITapGestureRecognizer(target: self, action: #selector(priceListViewAction))
        priceListView.addGestureRecognizer(priceListGesture)
        
        floorPlanView.widthAnchor.constraint(equalToConstant: mainView.frame.width / 2).isActive = true
        priceListView.widthAnchor.constraint(equalToConstant: mainView.frame.width / 2).isActive = true
        
        mainView.layer.masksToBounds = true
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        
        unitImageView.layer.masksToBounds = true
        unitImageView.layer.cornerRadius = 5
    }
    
    @objc func floorPlanViewAction() {
        print("Floor plan pressed")
    }
    
    @objc func priceListViewAction() {
        print("Price list pressed")
    }
    var detailObj: ProjectClusterType? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
//        self.unitImageView.sd_setImage(
//            with: URL(string: (obj.)),
//            placeholderImage: UIImage(named: "Cluster Image"),
//            options: .refreshCached
//        )
        titleLabel.text = obj.name
        availableLabel.text = "Available \(obj.availUnit)"
        priceLabel.text = "Price: Rp \(obj.startPrice)"
    }
}
