//
//  ProfileData.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProfileData:NSObject{
    var agent = AgentData()
    
    func objectMapping(json:JSON){
        agent.objectMapping(json: json["data"]["agent"])
    }
}
