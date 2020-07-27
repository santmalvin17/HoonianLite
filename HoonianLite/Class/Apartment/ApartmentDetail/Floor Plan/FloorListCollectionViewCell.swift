//
//  FloorListCollectionViewCell.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import Hex

class FloorListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var soldNumber: UILabel!
    @IBOutlet weak var availableNumber: UILabel!
    @IBOutlet weak var totalNumber: UILabel!
    @IBOutlet weak var header3: UILabel!
    @IBOutlet weak var header2: UILabel!
    @IBOutlet weak var header1: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var floorLabel: UILabel!
    @IBOutlet weak var imageFloor: UIImageView!
    var position = 0
    var xy = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var detailObj: FloorPlanBlockData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
        guard let obj = detailObj else { return }
        self.imageFloor.sd_setImage(
            with: URL(string: (obj.image)),
            placeholderImage: UIImage(named: "FloorPlan Logo"),
            options: .refreshCached
        )
        floorLabel.text = "Floor \(obj.name)"
        totalLabel.text = "Total \(obj.totalUnit) Unit"
        soldNumber.text = "\(obj.soldUnit)"
        availableNumber.text = "\(obj.availUnit)"
        totalNumber.text = "\(obj.totalUnit)"
        soldNumber.layer.borderWidth = 0.5
        soldNumber.layer.borderColor = UIColor.black.cgColor
        availableNumber.layer.borderWidth = 0.5
        availableNumber.layer.borderColor = UIColor.black.cgColor
        totalNumber.layer.borderWidth = 0.5
        totalNumber.layer.borderColor = UIColor.black.cgColor
        header1.layer.borderWidth = 0.5
        header1.layer.borderColor = UIColor.black.cgColor
        header2.layer.borderWidth = 0.5
        header2.layer.borderColor = UIColor.black.cgColor
        header3.layer.borderWidth = 0.5
        header3.layer.borderColor = UIColor.black.cgColor
        
        let component = ACData.FLOORPLANMODEL.projectUnitType[position].coordinate.components(separatedBy: "|")
        
        print("Ini = \(component)")
        
        for data in 0..<component.count{
            xy.append(contentsOf: component[data].components(separatedBy: "."))
        }
        
        print(xy)
        
    }
    
    let pointArrX = [100, 100, 300, 300]
    let pointArrY = [100, 300, 300, 100]
    
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
        shapeLayer.fillColor = UIColor(hex: "\(ACData.FLOORPLANMODEL.projectUnitType[position].colorCode)").cgColor
        shapeLayer.lineWidth = 1
        imageFloor.layer.addSublayer(shapeLayer)
    }
}
