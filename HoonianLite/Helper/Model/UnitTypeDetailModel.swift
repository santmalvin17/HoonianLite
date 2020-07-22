//
//  UnitTypeDetailModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import Foundation
import SwiftyJSON

class UnitTypeDetailModel:NSObject{
    var projectTypeDetail = ProjectClusterType()
    
    func objectMapping(json:JSON){
        projectTypeDetail.objectMapping(json: json["data"]["project_unit_type"])
    }
}

class ProjectClusterType:NSObject{
    var id = ""
    var name = ""
    var startPrice = 0
    var size = ""
    var image = ""
    var projectUnit = TotalUnitModel()
    var gallery = [GalleryData]()
    var augmentedReality = [GalleryData]()
    var videos = [GalleryData]()
    var virtualTour = [GalleryData]()
    var priceList = PriceListModel()
    var availUnit = 0
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        startPrice = json["start_price"].intValue
        size = json["size"].stringValue
        projectUnit.objectMapping(json: json["project_unit"])
        image = json["image"].stringValue
        
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
        
        for data in json["augmented_reality"].arrayValue{
            let d = GalleryData()
            d.objectMapping(json: data)
            augmentedReality.append(d)
        }
        
        for data in json["virtual_tour"].arrayValue{
            let d = GalleryData()
            d.objectMapping(json: data)
            virtualTour.append(d)
        }
        
        priceList.objectMapping(json: json["price_list"])
        availUnit = json["available_unit"].intValue
    }
}

class TotalUnitModel:NSObject{
    var totalUnit = ""
    var availableUnit = ""
    
    func objectMapping(json:JSON){
        totalUnit = json["total_unit"].stringValue
        availableUnit = json["available_unit"].stringValue
    }
}

