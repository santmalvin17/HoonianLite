//
//  ProjectListModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProjectListModel:NSObject{
    var totalData = 0
    var totalDataDisplayed = 0
    var limitPerPage = 0
    var currentPage = 0
    var totalPage = 0
    var categoryId = ""
    var cityId = ""
    var projects = [ProjectListData]()
    var projectCategory = [ProjectListCategoryData]()
    
    func objectMapping(json:JSON){
        totalData = json["data"]["total_data"].intValue
        totalDataDisplayed = json["data"]["total_data_displayed"].intValue
        limitPerPage = json["data"]["limit_per_page"].intValue
        currentPage = json["data"]["current_page"].intValue
        totalPage = json["data"]["total_page"].intValue
        categoryId = json["data"]["select_category_id"].stringValue
        cityId = json["data"]["select_city_id"].stringValue
        for data in json["data"]["projects"].arrayValue{
            let d = ProjectListData()
            d.objectMapping(json: data)
            projects.append(d)
        }
        for data in json["data"]["project_categories"].arrayValue{
            let d = ProjectListCategoryData()
            d.objectMapping(json: data)
            projectCategory.append(d)
        }
    }
    
}

class ProjectListData:NSObject{
    var id = ""
    var name = ""
    var image = ""
    var city = ""
    var availUnit = 0
    var startPrice = 0
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        image = json["image"].stringValue
        city = json["city"].stringValue
        availUnit = json["available_unit"].intValue
        startPrice = json["start_from"].intValue
    }
}

class ProjectListCategoryData:NSObject{
    var id = ""
    var name = ""
    func objectMapping(json: JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
}
