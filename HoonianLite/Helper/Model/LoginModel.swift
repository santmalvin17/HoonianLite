//
//  LoginModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginModel:NSObject{
    var accessToken = ""
    var agent = AgentData()
    var homeData = HomeDataModel()
    var menuNavBar = [MenuNavBar]()
    var accessList = [AccessList]()
    
    func objectMapping(json :JSON){
        accessToken = json["data"]["access_token"].stringValue
        agent.objectMapping(json: json["data"]["agent"])
        homeData.objectMapping(json: json["data"]["home"])
        for data in json["data"]["menu_navbar"].arrayValue{
            let d = MenuNavBar()
            d.objectMapping(json: data)
            menuNavBar.append(d)
        }
        for data in json["data"]["access_list"].arrayValue{
            let d = AccessList()
            d.objectMapping(json: data)
            accessList.append(d)
        }
    }
    
    
}

class AgentData:NSObject{
    var id = ""
    var name = ""
    var phoneNumber = ""
    var userAgent = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        phoneNumber = json["phoneNumber"].stringValue
        userAgent = json["user_agent"].stringValue
    }
}

class MenuNavBar:NSObject{
    var mobileMenuId = 0
    var mobileMenuname = ""
    var sequenceNumber = 0
    
    func objectMapping(json:JSON){
        mobileMenuId = json["mobile_menu_id"].intValue
        mobileMenuname = json["mobile_menu_name"].stringValue
        sequenceNumber = json["sequence_number"].intValue
    }
}

class AccessList:NSObject{
    var group = ""
    var menus = [MoreMenu]()
    
    func objectMapping(json:JSON){
        group = json["group"].stringValue
        for data in json["menus"].arrayValue{
            let d = MoreMenu()
            d.objectMapping(json: data)
            menus.append(d)
        }
    }
}

class MoreMenu:NSObject{
    var mobileAccessNo = 0
    var mobileMenuId = 0
    var mobileMenuname = ""
    var sequenceNumber = 0
    var mobileMenuCategory = ""
    func objectMapping(json:JSON){
        mobileAccessNo = json["mobile_access_no"].intValue
        mobileMenuId = json["mobile_menu_id"].intValue
        mobileMenuname = json["mobile_menu_name"].stringValue
        sequenceNumber = json["sequence_number"].intValue
        mobileMenuCategory = json["mobile_menu_category"].stringValue
    }
}