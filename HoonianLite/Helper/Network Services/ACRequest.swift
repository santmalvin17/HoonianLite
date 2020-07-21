//
//  ACRequest.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class ACRequest:NSObject{
    
    static func POST_LOGIN(
        phoneNumber:String,
        password:String,
        successCompletion:@escaping (LoginModel) -> Void,
        failCompletion:@escaping (String) -> Void){
        let parameters:Parameters = [
            "phone_number":phoneNumber,
            "password":password,
        ]
        print(parameters)
        let headers:HTTPHeaders = ["Content-Type":"application/json"]
        ACAPI.POST(url: "\(ACUrl.AGENT_LOGIN)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let json = JSON(jsonData)
            print("loginjson: \(json)")
            if(json["status_desc"] == "Success") {
                let user = LoginModel()
                user.objectMapping(json: json)
                successCompletion(user)
            } else {
                failCompletion(json["message"].stringValue)
            }
        }
    }
}
