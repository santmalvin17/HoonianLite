//
//  ProjectDetailModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class GetProjectDetailModel:NSObject{
    var projectData = ProjectDetailModel()
    func objectMapping(json:JSON){
        projectData.objectMapping(json: json["data"]["project"])
    }
    
}

class ProjectDetailModel:NSObject{
    var id = ""
    var name = ""
    var image = ""
    var deskripsi = ""
    var  city  = ""
    var category = ""
    var availableUnit = 0
    var startPrice = 0
    var latitude = ""
    var address = ""
    var facilities = [FacilityData]()
    var gallery = [GalleryData]()
    var videos = [GalleryData]()
    var warehouseOpenHours = ""
    var warehouseSize = ""
    var warehouseMinimRent = ""
    var warehouseType = ""
    var warehousepriceMeter = ""
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        image = json["image"].stringValue
        deskripsi = json["description"].stringValue
        city = json["city"].stringValue
        category = json["category"].stringValue
        availableUnit = json["available_unit"].intValue
        startPrice = json["start_from"].intValue
        latitude = json["latlng"].stringValue
        address = json["address"].stringValue
        for data in json["facilities"].arrayValue{
            let d = FacilityData()
            d.objectMapping(json: data)
            facilities.append(d)
        }
        for data in json["gallery"].arrayValue{
            let d = GalleryData()
            d.objectMapping(json: data)
            gallery.append(d)
        }
        for data in json["videos"].arrayValue{
            let d = GalleryData()
            d.objectMapping(json: data)
            videos.append(d)
        }
        warehouseOpenHours = json["warehouse_operation_hours"].stringValue
        warehouseSize = json["warehouse_size"].stringValue
        warehouseMinimRent = json["warehouse_minimum_rent"].stringValue
        warehouseType = json["warehouse_type"].stringValue
        warehousepriceMeter = json["warehouse_price_meter"].stringValue
    }
}

class FacilityData:NSObject{
    var id = ""
    var name = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
}

class GalleryData:NSObject{
    var id = ""
    var link = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        link = json["link"].stringValue
    }
}
