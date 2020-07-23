//
//  ACAPI.swift
//  AYO CLEAN
//
//  Created by Zein Rezky Chandra on 23/05/18.
//  Copyright © 2019 PT. Absolute Connection. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ACAPI: NSObject {
    static func GET(url:String,
                    header:HTTPHeaders,
                    showHUD:Bool,
                    completion:@escaping (Any) -> Void) {
        if(showHUD) {
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .get,
            parameters: nil,
            encoding : JSONEncoding.default,
            headers: header
        ).responseJSON{ (response) in
            
            if response.result.isSuccess {
                completion(response.result.value!)
            } else {
                SVProgressHUD.dismiss()
                print("Your internet connection have a problem")
            }
        }
    }
    
    static func POST(url:String, parameter:Parameters, header:HTTPHeaders , showHUD:Bool, completion:@escaping (Any) -> Void) {
        if(showHUD) {
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .post,
            parameters: parameter,
            encoding: JSONEncoding.default,
            headers: header).responseJSON { (response) in
                if response.result.isSuccess {
                    completion(response.result.value!)
                    print(response)
                } else {
                    
                }
        }
    }
    
    static func PUT(url:String, parameter:Parameters, header:HTTPHeaders , showHUD:Bool, completion:@escaping (Any) -> Void) {
        if(showHUD) {
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .put,
            parameters: parameter,
            encoding: JSONEncoding.default,
            headers: header).responseJSON { (response) in
                if response.result.isSuccess {
                    completion(response.result.value!)
                    print(response)
                } else {
                    
                }
        }
    }
    
    static func DELETE(url:String, parameter:Parameters, header:HTTPHeaders , showHUD:Bool, completion:@escaping (Any) -> Void) {
        if(showHUD) {
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        Alamofire.request(
            URL(string: url)!,
            method: .delete,
            parameters: parameter,
            encoding: JSONEncoding.default,
            headers: header).responseJSON { (response) in
                if response.result.isSuccess {
                    completion(response.result.value!)
                    print(response)
                } else {
                    
                }
        }
    }
    
    
    static func POST_WITH_IMAGE(
        url:String,
        parameter:Parameters,
        imageFile:UIImage,
        imageFileName:String,
        imageParameter:String,
        showHUD:Bool,
        header: HTTPHeaders,
        completion:@escaping (Any) -> Void){
        if(showHUD){
            SVProgressHUD.show(withStatus: "Please wait...")
        }
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageFile.jpegData(compressionQuality: 0.5)!, withName: imageParameter, fileName: imageFileName, mimeType: "image/jpeg")
            for (key, value) in parameter {
                multipartFormData.append((value as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
            }
        }, to:url, headers: header){ (result) in
            switch result {
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    completion(response.result.value!)
                }
            case .failure( _):
                SVProgressHUD.dismiss()
                ACAlert.show(message: "Your internet connection have a problem")
            }
        }
    }
}
