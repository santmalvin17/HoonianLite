//
//  HomeDataModel.swift
//  dummyBentaran
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class GetHomeDataModel:NSObject{
    var homeData = HomeDataModel()
    
    func objectMapping(json:JSON){
        homeData.objectMapping(json: json["data"])
    }
}

class HomeDataModel:NSObject{
    var news = [HomeData]()
    var cities = [HomeData]()
    var apartment = [HomeData]()
    var landedProperty = [HomeData]()
    var wareHouse = [HomeData]()
    
    func objectMapping(json: JSON){
        for data in json["news"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            news.append(d)
        }
        for data in json["cities"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            cities.append(d)
        }
        for data in json["apartment"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            apartment.append(d)
        }
        for data in json["landed_property"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            landedProperty.append(d)
        }
        for data in json["warehouse"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            wareHouse.append(d)
        }
    }
}

class HomeData:NSObject{
    var id = ""
    var title = ""
    var name = ""
    var city = ""
    var image = ""
    
    func objectMapping(json: JSON){
        id = json["id"].stringValue
        title = json["title"].stringValue
        image = json["image"].stringValue
        name = json["name"].stringValue
        city = json["city"].stringValue
    }
    
}
