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
    var totalData = 0
    var totalPage = 0
    var currentPage = 0
    var limitPerPage = 0
    var projectUnitType = [FloorPlanUnitTypeData]()
    var projectBlock = FloorPlanBlockData()
 
    func objectMapping(json:JSON){
        totalData = json["total_data"].intValue
        totalPage = json["total_page"].intValue
        currentPage = json["current_page"].intValue
        limitPerPage = json["limit_per_page"].intValue
        for data in json["data"]["project_units"].arrayValue{
            let d = FloorPlanUnitTypeData()
            d.objectMapping(json: data)
            projectUnitType.append(d)
        }
        projectBlock.objectMapping(json: json["data"]["project_block"])
    }
}

class FloorPlanUnitTypeData:NSObject{
    var unitCode = ""
    var coordinate = ""
    var unitTypeId = ""
    var name = ""
    var colorCode = ""

    
    func objectMapping(json: JSON){
        unitCode = json["unit_code"].stringValue
        coordinate = json["coordinate"].stringValue
        unitTypeId = json["unit_type_id"].stringValue
        name = json["name"].stringValue
        colorCode = json["color_code"].stringValue
        
        
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
