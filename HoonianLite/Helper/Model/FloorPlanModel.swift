//
//  FloorPlanModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class FloorPlanModel:NSObject{
    var projectUnitType = [FloorPlanUnitTypeData]()
    var projectBlock = FloorPlanBlockData()
 
    func objectMapping(json:JSON){
        for data in json["data"]["project_unit_type"].arrayValue{
            let d = FloorPlanUnitTypeData()
            d.objectMapping(json: data)
            projectUnitType.append(d)
        }
        projectBlock.objectMapping(json: json["data"]["project_block"])
    }
}

class FloorPlanUnitTypeData:NSObject{
    var name = ""
    var totalUnit = 0
    var availUnit = 0
    var startPrice = 0
    
    func objectMapping(json: JSON){
        name = json["name"].stringValue
        totalUnit = json["total_unit"].intValue
        availUnit = json["available_unit"].intValue
        startPrice = json["start_price"].intValue
    }
}

class FloorPlanBlockData:NSObject{
    var name = 0
    var projectId = ""
    var clusterId = ""
    var image = ""
    var totalUnit = 0
    var availUnit = 0
    var soldUnit = 0
    var projectCoordinate = [ProjectUnitData]()
    var projectStatus = [StatusDetailModel]()
    
    func objectMapping(json:JSON){
        name = json["name"].intValue
        projectId = json["project_id"].stringValue
        clusterId = json["cluster_id"].stringValue
        image = json["image_floor_plan"].stringValue
        totalUnit = json["total_unit"].intValue
        availUnit = json["available_unit"].intValue
        soldUnit = json["sold_unit"].intValue
        for data in json["project_units"].arrayValue{
            let d = ProjectUnitData()
            d.objectMapping(json: data)
            projectCoordinate.append(d)
        }
        for data in json["project_unit_statuss"].arrayValue{
            let d = StatusDetailModel()
            d.objectMapping(json: data)
            projectStatus.append(d)
        }
        
    }
}
