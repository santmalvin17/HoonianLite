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
      let videoURL = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
       let player = AVPlayer(url: videoURL!)
       let playerLayer = AVPlayerLayer(player: player)
       playerLayer.frame = self.videoView.bounds
       self.videoView.layer.addSublayer(playerLayer)
       player.play()
    }
    
}
