//
//  BankListModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 26/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import Foundation
import SwiftyJSON

class BankListModel:NSObject{
    var bankData = [BankData]()
    func objectMapping(json:JSON){
        for data in json["data"]["banks"].arrayValue{
        let d = BankData()
        d.objectMapping(json: data)
        bankData.append(d)
        }
    }
}

class BankData:NSObject{
    var id = ""
    var name = ""
    var code = ""
    
    func objectMapping(json:JSON){
        id = json["id"].stringValue
        name = json["name"].stringValue
        code = json["code"].stringValue
    }
}


