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
    var apartment = CategoryData()
    var landedProperty = CategoryData()
    var wareHouse = CategoryData()
    
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
        apartment.objectMapping(json: json["apartment"])
        landedProperty.objectMapping(json: json["landed_property"])
        wareHouse.objectMapping(json: json["warehouse"])
    }
}

class CategoryData:NSObject{
    var categoryId = ""
    var projects = [HomeData]()
    func objectMapping(json: JSON){
        categoryId = json["project_category_id"].stringValue
        for data in json["projects"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            projects.append(d)
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
