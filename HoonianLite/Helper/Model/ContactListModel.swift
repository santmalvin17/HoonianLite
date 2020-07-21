//
//  ContactListModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON


class ContactListModel:NSObject{
    var totalData = 0
    var totalDataDisplayed = 0
    var limitPerPage = 0
    var currentPage = 0
    var totalPage = 0
    var contacts = [ClientData]()
    
    func objectMapping(json: JSON){
        totalData = json["data"]["total_data"].intValue
        totalDataDisplayed = json["data"]["total_data_displayed"].intValue
        limitPerPage = json["data"]["limit_per_page"].intValue
        currentPage = json["data"]["current_page"].intValue
        totalPage = json["data"]["total_page"].intValue
        for data in json["data"]["contacts"].arrayValue{
            let d = ClientData()
            d.objectMapping(json: data)
            contacts.append(d)
        }
    }
}
