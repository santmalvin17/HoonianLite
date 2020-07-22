//
//  PurchaseListModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class PurchaseListModel:NSObject{
    var projectPurchaseList = [PurchaseListData]()
    
    func objectMapping(json:JSON){
        for data in json["data"]["project_purchase"].arrayValue{
            let d = PurchaseListData()
            d.objectMapping(json: data)
            projectPurchaseList.append(d)
        }
    }
    
}

class PurchaseListData:NSObject{
    var id = ""
    var price = ""
    var status = StatusDetailModel()
    var project = ProjectData()
    var projectUnit = ProjectUnitData()
    var client = ClientData()
    var agent = AgentData()
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        price = json["price"].stringValue
        status.objectMapping(json: json["purchase_status"])
        project.objectMapping(json: json["project"])
        projectUnit.objectMapping(json: json["project_unit"])
        client.objectMapping(json: json["client"])
        agent.objectMapping(json: json["agent"])
    }
}

class ProjectData:NSObject{
    var id = ""
    var name = ""
    var image = ""
    var commisionRate: Float = 0.0
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        image = json["image"].stringValue
        commisionRate = json["commision_rate"].floatValue
    }
    
}

class ProjectUnitData:NSObject{
    var id = ""
    var name = ""
    var projectUnitTypes = ProjectUnitTypesData()
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        projectUnitTypes.objectMapping(json: json["project_unit_types"])
    }
}

class ProjectUnitTypesData:NSObject{
    var id = ""
    var name = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
    }
}

class ClientData:NSObject{
    var id = ""
    var name = ""
    var phoneNumber = ""
    var idCardNumber = ""
    var city = ""
    var occupation = ""
    var relation = ""
    var referred = 0
    var purchased = 0
    var project = [ProjectListData]()
    var purchasedProect = [PurchasedProjectClientData]()
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        phoneNumber = json["phone_number"].stringValue
        idCardNumber = json["id_card_number"].stringValue
        city = json["city"].stringValue
        occupation = json["occupation"].stringValue
        relation = json["relation"].stringValue
        referred = json["referred"].intValue
        purchased = json["purchase"].intValue
        for data in json["referred_project"].arrayValue{
            let d = ProjectListData()
            d.objectMapping(json: data)
            project.append(d)
        }
        for data in json["purchased_project"].arrayValue{
            let d = PurchasedProjectClientData()
            d.objectMapping(json: data)
            purchasedProect.append(d)
        }
    }
}
