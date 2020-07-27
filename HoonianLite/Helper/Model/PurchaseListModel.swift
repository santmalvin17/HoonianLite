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
    var totalData = 0
    var totalDisplayed = 0
    var totalPage = 0
    var currentPage = 0
    var limitPerPage = 0
    var projectPurchaseList = [PurchaseListData]()
    
    func objectMapping(json:JSON){
        for data in json["data"]["project_purchase"].arrayValue{
            let d = PurchaseListData()
            d.objectMapping(json: data)
            projectPurchaseList.append(d)
        }
        totalData = json["data"]["total_data"].intValue
        totalDisplayed = json["data"]["total_data_displayed"].intValue
        totalPage = json["data"]["total_page"].intValue
        currentPage = json["data"]["current_page"].intValue
        limitPerPage = json["data"]["limit_per_page"].intValue
    }
    
}

class PurchaseListData:NSObject{
    var id = ""
    var price = ""
    var agentId = ""
    var clientId = ""
    var projectId = ""
    var status = StatusDetailModel()
    var project = ProjectData()
    var projectUnit = ProjectUnitData()
    var client = ClientData()
    var agent = AgentData()
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        price = json["price"].stringValue
        agentId = json["agent_id"].stringValue
        clientId = json["client_id"].stringValue
        projectId = json["project_id"].stringValue
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
    var unitTypeId = ""
    var unitCode = ""
    var projectUnitType = ProjectUnitTypesData()
    func objectMapping(json:JSON){
        unitTypeId = json["unit_type_id"].stringValue
        unitCode = json["unit_code"].stringValue
        projectUnitType.objectMapping(json: json["project_unit_type"])
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
