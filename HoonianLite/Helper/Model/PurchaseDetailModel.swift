//
//  PurchaseDetailModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class PurchaseDetailModel:NSObject{
   var  purchaseDetailData = ProjectPurchasedData()
    
    func objectMapping(json: JSON){
        purchaseDetailData.objectMapping(json: json["data"]["project_purchase"])
    }
}

class ProjectPurchasedData:NSObject{
    var id = ""
    var price = 0
    var projectData = UnitDataModel()

    func objectMapping(json: JSON){
        id = json["id"].stringValue
        price = json["price"].intValue
        projectData.objectMapping(json: json["project_unit"])
    }
}

class UnitDataModel:NSObject{
    var id = ""
    var name = ""
    var coordinate = ""
    var projectBlock = FloorPlanData()
    var projectStatusData = StatusDetailModel()
    var projectUnitType = ProjectClusterType()
    
    func objectMapping(json: JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        coordinate = json["coodinate"].stringValue
        projectBlock.objectMapping(json: json["project_block"])
        projectStatusData.objectMapping(json: json["project_unit_status"])
        projectUnitType.objectMapping(json: json["project_unit_types"])
    }
    
}

class StatusDetailModel:NSObject{
    var name = ""
    var colorCode = ""
    
    func objectMapping(json:JSON){
        name = json["status"].stringValue
        colorCode = json["color_code"].stringValue
    }
}

class FloorPlanData:NSObject{
    var imageFloorPlan = ""
    var imageSize = ""
    func objectMapping(json:JSON){
        imageFloorPlan = json["image_floor_plan"].stringValue
        imageSize = json["image_floor_plan_size"].stringValue
    }
}
