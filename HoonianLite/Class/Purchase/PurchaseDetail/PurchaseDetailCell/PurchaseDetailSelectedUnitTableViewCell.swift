//
//  PurchaseDetailSelectedUnitTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseDetailSelectedUnitTableViewCell: UITableViewCell {

    @IBOutlet weak var unitTypeView: UIView!
    @IBOutlet weak var unitTypeLabel: UILabel!
    @IBOutlet weak var unitTypeImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var detailObj: ProjectPurchasedData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        unitTypeLabel.text = "Unit \(obj.projectData.name)"
        self.unitTypeImageView.sd_setImage(
            with: URL(string: (obj.projectData.projectBlock.imageFloorPlan)),
            placeholderImage: UIImage(named: "School Logo"),
            options: .refreshCached
        )

    }
    
    let pointArrX = [0, 200, 200, 0]
    let pointArrY = [0, 0, 200, 200]
    
    func drawPolygon() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: pointArrX[0], y: pointArrY[0]))
        
        for index in 1 ..< pointArrX.count {
            path.addLine(to: CGPoint(x: pointArrX[index], y: pointArrY[index]))
        }
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 3
        
        unitTypeView.layer.addSublayer(shapeLayer)
    }
}
