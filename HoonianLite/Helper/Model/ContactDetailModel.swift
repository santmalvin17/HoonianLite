//
//  ContactDetailModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class ContactDetailModel:NSObject{
    var clientData = ClientData()
    
    func objectMapping(json: JSON){
        clientData.objectMapping(json: json["data"]["contact"])
    }
}

class PurchasedProjectClientData:NSObject{
    var id = ""
    var name = ""
    var image = ""
    var city = ""
    var purchaseStatus = ""
    var projectUnitId = ""
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        image = json["image"].stringValue
        city = json["city"].stringValue
        purchaseStatus = json["purchase_status"].stringValue
        projectUnitId = json["project_unit_id"].stringValue
    }
}
