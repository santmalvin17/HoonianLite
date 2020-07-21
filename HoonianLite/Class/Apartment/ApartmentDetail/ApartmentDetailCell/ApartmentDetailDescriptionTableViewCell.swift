//
//  ApartmentDetailDescriptionTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentDetailDescriptionTableViewCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func config() {
        descriptionLabel.text = """
        Grand Sagara berlokasi di Surabaya Timur, tepatnya di kaki Jembatan Nasional Suramadu. Yang merupakan Jembatan terpanjang di Indonesia.

        Sangat dekat menuju Fasilitas-fasilitas pendukung seperti Mall, Pendidikan, RS, dan Bandara.

        Nikmati setiap hari spectacular view Jembatan Suramadu dan suasana Sunrise dan Sunset di Apartemen Grand Sagara.
        """
    }
}
