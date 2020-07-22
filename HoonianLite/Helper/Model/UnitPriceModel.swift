//
//  UnitPriceModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import Foundation
import SwiftyJSON

class UnitPriceModel:NSObject{
    var projectClusterData = [ProjectClusterData]()
    func objectMapping(json: JSON){
        for data in json["data"]["project_clusters"].arrayValue{
            let d = ProjectClusterData()
            d.objectMapping(json: data)
            projectClusterData.append(d)
        }
    }
    
}

class ProjectClusterData:NSObject{
    var projectId = ""
    var name = ""
    var soldPercentage = ""
    var totalUnit = ""
    var image = ""
    var projectClusterType = [ProjectClusterType]()
    func objectMapping(json:JSON){
        projectId = json["project_id"].stringValue
        name = json["name"].stringValue
        soldPercentage = json["sold_percentage"].stringValue
        totalUnit = json["total_unit"].stringValue
        image = json["image"].stringValue
        for data in json["project_unit_types"].arrayValue{
            let d = ProjectClusterType()
            d.objectMapping(json: data)
            projectClusterType.append(d)
        }
    }
}



class PriceListModel:NSObject{
    var name = ""
    var file = ""
    
    func objectMapping(json: JSON){
        name = json["name"].stringValue
        file = json["file"].stringValue
        
    }
}
