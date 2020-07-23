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
    
    static func GET_CITY_LIST(
        successCompletion:@escaping (GetHomeDataModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.CITY_LIST)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get city list: \(json)")
            if(json["status_desc"] == "Success") {
                let home = GetHomeDataModel()
                home.objectMapping(json: json)
                successCompletion(home)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_PURCHASED_LIST(
        agentId:String,
        successCompletion:@escaping (PurchaseListModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.PURCHASE_LIST)=\(agentId)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get purchase list: \(json)")
            if(json["status_desc"] == "Success") {
                let purchase = PurchaseListModel()
                purchase.objectMapping(json: json)
                successCompletion(purchase)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_PURCHASED_DETAIL(
         agentId:String,
         purchaseId:String,
         successCompletion:@escaping (PurchaseDetailModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
         ACAPI.GET(url: "\(ACUrl.PURCHASE_DETAIL)=\(agentId)&purchase_id=\(purchaseId)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get purchase detail: \(json)")
             if(json["status_desc"] == "Success") {
                 let purchase = PurchaseDetailModel()
                 purchase.objectMapping(json: json)
                 successCompletion(purchase)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    
    static func GET_NEWS_DETAIL(
        newsId:String,
        successCompletion:@escaping (NewsDataModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.NEWS_DETAIL)=\(newsId)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get news detail: \(json)")
            if(json["status_desc"] == "Success") {
                let newsDetail = NewsDataModel()
                newsDetail.objectMapping(json: json)
                successCompletion(newsDetail)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_CONTACT_LIST(
        agentId:String,
        successCompletion:@escaping (ContactListModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.CONTACT_LIST)=\(agentId)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get contact list: \(json)")
            if(json["status_desc"] == "Success") {
                let contactList = ContactListModel()
                contactList.objectMapping(json: json)
                successCompletion(contactList)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_PROJECT_LIST(
        limitPage:String,
        page:String,
        selectCityId:String,
        selectCategoryId:String,
        successCompletion:@escaping (ProjectListModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.PROJECT_LIST)limit_per_page=\(limitPage)&page=\(page)&selected_city_id=\(selectCityId)&selected_category_id=\(selectCategoryId)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get project list: \(json)")
            if(json["status_desc"] == "Success") {
                let projectList = ProjectListModel()
                projectList.objectMapping(json: json)
                successCompletion(projectList)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    static func GET_PROJECT_DETAIL(
        id:String,
        successCompletion:@escaping (GetProjectDetailModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.PROJECT_DETAIL)=\(id)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get project detail: \(json)")
            if(json["status_desc"] == "Success") {
                let projectDetail = GetProjectDetailModel()
                projectDetail.objectMapping(json: json)
                successCompletion(projectDetail)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_CONTACT_DETAIL(
        id:String,
        successCompletion:@escaping (ContactDetailModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.CONTACT_DETAIL)=\(id)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get contact detail: \(json)")
            if(json["status_desc"] == "Success") {
                let contactDetail = ContactDetailModel()
                contactDetail.objectMapping(json: json)
                successCompletion(contactDetail)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_UNITPRICE_LIST(
        projectId:String,
        successCompletion:@escaping (UnitPriceModel) -> Void,
        failCompletion:@escaping (String) -> Void) {
        let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.UNIT_PRICE_LIST)=\(projectId)", header: headers, showHUD: true, completion: { (jsonData) in
            let json = JSON(jsonData)
            print("get unit price list: \(json)")
            if(json["status_desc"] == "Success") {
                let unitpricelist = UnitPriceModel()
                unitpricelist.objectMapping(json: json)
                successCompletion(unitpricelist)
            } else {
                failCompletion(json["status"].stringValue)
            }
        })
    }
    
    static func GET_UNITPRICE_DETAIL(
         projectId:String,
         unitTypeId:String,
         successCompletion:@escaping (UnitTypeDetailModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
         ACAPI.GET(url: "\(ACUrl.UNIT_PRICE_TYPE_DETAIL)=\(projectId)&unit_type_id=\(unitTypeId)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get unit price detail: \(json)")
             if(json["status_desc"] == "Success") {
                 let unitpricedetail = UnitTypeDetailModel()
                 unitpricedetail.objectMapping(json: json)
                 successCompletion(unitpricedetail)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    
    static func POST_ADD_NEW_CONTACT(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [
                                   "Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.POST(url: "\(ACUrl.ADD_NEW_CONTACT)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Created") {
                successCompletion("Success add new contact.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    static func GET_EDITCONTACT_DETAIL(
         agentId:String,
         contactId:String,
         successCompletion:@escaping (EditContactModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
         ACAPI.GET(url: "\(ACUrl.EDIT_CONTACT_DETAIL)=\(agentId)&contact_id=\(contactId)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get unit price detail: \(json)")
             if(json["status_desc"] == "Success") {
                 let editContact = EditContactModel()
                 editContact.objectMapping(json: json)
                 successCompletion(editContact)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    
    static func PUT_UPDATE_CONTACT(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [
                                   "Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.PUT(url: "\(ACUrl.UPDATE_EDITED_CONTACT)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Success") {
                successCompletion("Success edit contact.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    
    static func POST_FAVOURITE(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [
                                   "Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.POST(url: "\(ACUrl.FAVOURITE_CLICKED)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Created") {
                successCompletion("Success add new contact.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    
    static func POST_REGISTER(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [:]
        ACAPI.POST(url: "\(ACUrl.REGISTER)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Created") {
                successCompletion("Success add new contact.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    
    
    static func POST_FORGOT_PASSWORD_VERIFY(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [:]
        ACAPI.POST(url: "\(ACUrl.EMAIL_FORGOT_PASSWORD)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Success") {
                successCompletion("Success verify password.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    static func PUT_UPDATE_FORGOT_PASSWORD(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [:]
        ACAPI.PUT(url: "\(ACUrl.PASSWORD_UPDATE)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Success") {
                successCompletion("Success forgot password.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    
    static func PUT_UPDATE_PROFILE(
        parameters: Parameters,
        successCompletion: @escaping (String) -> Void,
        failCompletion: @escaping (String) -> Void) {
        let headers:HTTPHeaders = [:]
        ACAPI.PUT(url: "\(ACUrl.PASSWORD_UPDATE)", parameter: parameters, header: headers, showHUD: true) { (jsonData) in
            let jsonValue = JSON(jsonData)
            print(jsonValue)
            if(jsonValue["status_desc"] == "Success") {
                successCompletion("Success update profile.")
            } else {
                failCompletion(jsonValue["status"].stringValue)
            }
        }
    }
    
    static func GET_REFERRED_LIST(
         agentId:String,
         projectId:String,
         successCompletion:@escaping (ReferredListModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.REFERRED_LIST)=\(agentId)&project_id=\(projectId)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get referred list: \(json)")
             if(json["status_desc"] == "Success") {
                 let referModel = ReferredListModel()
                 referModel.objectMapping(json: json)
                 successCompletion(referModel)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    static func GET_FLOORPLAN(
         projectId:String,
         clusterId:String,
         page:Int,
         successCompletion:@escaping (FloorPlanModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.FLOORPLAN)=\(projectId)&cluster_id=\(clusterId)&page=\(page)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get floorplan data: \(json)")
             if(json["status_desc"] == "Success") {
                 let floorplan = FloorPlanModel()
                 floorplan.objectMapping(json: json)
                 successCompletion(floorplan)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    
    static func GET_CLUSTERDETAIL(
         id:String,
         successCompletion:@escaping (ProjectClusterDetailModel) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "\(ACUrl.TOWERDETAIL)=\(id)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get cluster data: \(json)")
             if(json["status_desc"] == "Success") {
                 let cluster = ProjectClusterDetailModel()
                 cluster.objectMapping(json: json)
                 successCompletion(cluster)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    static func GET_PROFILE(
        agentId:String,
         successCompletion:@escaping (ProfileData) -> Void,
         failCompletion:@escaping (String) -> Void) {
         let headers:HTTPHeaders = ["Content-Type":"application/json","Authorization":"Bearer \(ACData.LOGINDATA.accessToken)"]
        ACAPI.GET(url: "https://dev.api.hoonian.com/api/agent/profile?id=\(agentId)", header: headers, showHUD: true, completion: { (jsonData) in
             let json = JSON(jsonData)
             print("get profile list: \(json)")
             if(json["status_desc"] == "Success") {
                 let profile = ProfileData()
                 profile.objectMapping(json: json)
                 successCompletion(profile)
             } else {
                 failCompletion(json["status"].stringValue)
             }
         })
     }
    
}
