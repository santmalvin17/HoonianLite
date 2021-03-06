//
//  ApartmentUnitContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ApartmentUnitContentTableViewCellDelegate{
    func floorPlanClicked(indexKe:Int,sectionKe:Int)
    func unitClicked(indexKe:Int,sectionKe:Int)
}

class ApartmentUnitContentTableViewCell: UITableViewCell {
    
    var delegate:ApartmentUnitContentTableViewCellDelegate?

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var unitImageView: UIImageView!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var floorPlanView: UIView!
    @IBOutlet weak var priceListView: UIView!
    var position = 0
    var section = 0
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
        
        unitImageView.isUserInteractionEnabled = true
        let unitGesture = UITapGestureRecognizer(target: self, action: #selector(unitAction))
        unitImageView.addGestureRecognizer(unitGesture)
        
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
        delegate?.floorPlanClicked(indexKe: position, sectionKe: section)
    }
    
    @objc func unitAction(){
        delegate?.unitClicked(indexKe: position, sectionKe: section)
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
        self.unitImageView.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "Cluster Image"),
            options: .refreshCached
        )
        titleLabel.text = obj.name
        availableLabel.text = "Available \(obj.availUnit)"
        priceLabel.text = "Price: Rp \(obj.startPrice.formattedWithSeparator)"
    }
}
