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
    static let REGISTER = MAIN + "/api/agent/register"
    static let CITY_LIST = MAIN + "/api/city"
    static let NEWS_DETAIL = MAIN + "/api/news/detail?id"
    static let PURCHASE_LIST = MAIN + "/api/agent/purchase?agent_id"
    static let CONTACT_LIST = MAIN + "/api/agent/contact/?agent_id"
    static let PROJECT_LIST = MAIN + "/api/project?"
    static let PROJECT_DETAIL = MAIN + "/api/project/detail?id"
    static let CONTACT_DETAIL = MAIN + "/api/agent/contact/detail?contact_id"
    static let UNIT_PRICE_LIST = MAIN + "/api/project/detail/cluster?project_id"
    static let UNIT_PRICE_TYPE_DETAIL = MAIN + "/api/project/detail/unit-type/detail?project_id"
    static let ADD_NEW_CONTACT = MAIN + "/api/agent/contact/"
    static let EDIT_CONTACT_DETAIL = MAIN + "/api/agent/contact/detail/edit?agent_id"
    static let UPDATE_EDITED_CONTACT = MAIN + "/api/agent/contact/detail"
    static let PURCHASE_DETAIL = MAIN + "/api/agent/purchase/detail?agent_id"
    static let FAVOURITE_CLICKED = MAIN + "/api/agent/favorite"
    static let REFERRED_LIST = MAIN + "/api/agent/referred?agent_id"
    static let FLOORPLAN = MAIN + "/api/project/detail/cluster/floorplan?project_id"
    static let TOWERDETAIL = MAIN + "/api/project/detail/cluster/detail?id"
    static let CHANGE_PASSWORD = MAIN + "/api/agent/password"
    static let EMAIL_FORGOT_PASSWORD = MAIN + "/api/agent/password/forgot"
    static let PASSWORD_UPDATE = MAIN + "/api/agent/password/forgot"
    static let UPDATE_PROFILE = MAIN + "/api/agent/profile/update"
    static let PROFILE_DATA = MAIN + "api/agent/profile?id"
}
