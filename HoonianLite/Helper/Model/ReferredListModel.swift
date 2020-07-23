//
//  ReferredListModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class ReferredListModel:NSObject{
    var referProjectList = [ReferredListData]()
    
    func objectMapping(json:JSON){
        for data in json["data"]["referred_project"].arrayValue{
            let d = ReferredListData()
            d.objectMapping(json: data)
            referProjectList.append(d)
        }
    }
}

class ReferredListData:NSObject{
    var agent = ReferredData()
    var contacts = ReferredData()
    var project = ReferredData()
    var note = ""
    var referStatus = ReferredData()
    
    func objectMapping(json:JSON){
        agent.objectMapping(json: json["agents"])
        contacts.objectMapping(json: json["contacts"])
        project.objectMapping(json: json["projects"])
        note = json["note"].stringValue
        referStatus.objectMapping(json: json["referred_status"])
    }
}

class ReferredData:NSObject{
    var id = ""
    var name = ""
    var phoneNumber = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        phoneNumber = json["phone_number"].stringValue
    }
    
}
