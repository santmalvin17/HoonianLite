//
//  ApartmentDetailCellLocationTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol ApartmentDetailCellLocationTableViewCellDelegate{
    func mapsClicked(lattitude:String,longtitude:String)
}

class ApartmentDetailCellLocationTableViewCell: UITableViewCell {
    
    var delegate:ApartmentDetailCellLocationTableViewCellDelegate?

    @IBOutlet weak var mapsImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var lattitude = ""
    var longtitude = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        mapsImageView.isUserInteractionEnabled = true
        mapsImageView.addGestureRecognizer(tapGestureRecognizer)
        mapsImageView.clipsToBounds = true
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        delegate?.mapsClicked(lattitude: lattitude, longtitude: longtitude)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var detailObj: ProjectDetailModel? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        addressLabel.text = obj.address
        let components = obj.latitude.components(separatedBy: ",")
        lattitude = components[0]
        longtitude = components[1]
    }
    
    

    
}
