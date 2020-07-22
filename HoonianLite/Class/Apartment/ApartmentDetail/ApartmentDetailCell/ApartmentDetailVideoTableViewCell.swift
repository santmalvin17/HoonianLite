//
//  ApartmentDetailVideoTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ApartmentDetailVideoTableViewCell: UITableViewCell {

    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var videoView: UIView!
    
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

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
        let url = URL(string:"https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        player = AVPlayer(url: url!)
        avpController.player = player
        avpController.view.frame.size.height = videoView.frame.size.height
        avpController.view.frame.size.width = videoView.frame.size.width
        self.videoView.addSubview(avpController.view)
        avpController.player = player
        avpController.player!.play()
    }

    
}
