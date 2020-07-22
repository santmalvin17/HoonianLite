//
//  EditContactModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class EditContactModel:NSObject{
    var contactData = ClientData()
    var cities = [HomeData]()
    
    func objectMapping(json:JSON){
        contactData.objectMapping(json: json["data"]["contact"])
        for data in json["data"]["cities"].arrayValue{
            let d = HomeData()
            d.objectMapping(json: data)
            cities.append(d)
        }
    }
}
