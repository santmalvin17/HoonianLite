//
//  ACUrl.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import Foundation

class ACUrl:NSObject{
    
    static let MAIN = "https://dev.api.hoonian.com"
    
    static let AGENT_LOGIN = MAIN + "/api/agent/login"
    static let CITY_LIST = MAIN + "/api/city"
    static let NEWS_DETAIL = MAIN + "/api/news/detail?id"
    static let PURCHASE_LIST = MAIN + "/api/agent/purchase?agent_id"
    
}
