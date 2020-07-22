//
//  ApartmentMoreContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ApartmentMoreContentTableViewCellDelegate{
    func favoriteSelected(indexKe: Int)
    func viewSelected(indexKe:Int)
}

class ApartmentMoreContentTableViewCell: UITableViewCell {

    var delegate:ApartmentMoreContentTableViewCellDelegate?
    
    @IBOutlet weak var viewList: UIView!
    @IBOutlet weak var apartmentView: UIView!
    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var apartmentLabel: UILabel!
    @IBOutlet weak var locationIconImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var availableIconImageView: UIImageView!
    @IBOutlet weak var availableLabel: UILabel!
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var startFromLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var position = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        config()
                favoriteButton.addTarget(self, action: #selector(favouriteClicked), for: .touchUpInside)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(viewClicked))
        viewList.addGestureRecognizer(gesture)

    }
    @objc func viewClicked(){
        delegate?.viewSelected(indexKe: position)
        
    }
    @objc func favouriteClicked(){
        delegate?.favoriteSelected(indexKe: position)
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        apartmentView.layer.masksToBounds = true
        apartmentView.layer.cornerRadius = 5
        apartmentLabel.layer.masksToBounds = true
        apartmentLabel.layer.cornerRadius = 5
        priceView.layer.masksToBounds = true
        priceView.layer.cornerRadius = 5
        apartmentView.layer.borderWidth = 0.5
        apartmentView.layer.borderColor = UIColor.lightGray.cgColor
        favoriteButton.layer.masksToBounds = true
        favoriteButton.layer.cornerRadius = 5
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonAction), for: .touchUpInside)
    }
    
    @objc func favoriteButtonAction() {
        print("favorite pressed")
    }
    var detailObj: ProjectListData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        self.apartmentImageView.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "Apartment Image"),
            options: .refreshCached
        )
        apartmentLabel.text = obj.name
        locationLabel.text = obj.city
        availableLabel.text = "Available : \(obj.availUnit)"
        let price = obj.startPrice/1000000
        priceLabel.text = "\(price) JT"
    }

    
}
