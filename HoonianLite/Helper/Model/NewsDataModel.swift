//
//  NewsDataModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsDataModel:NSObject{
    var id = ""
    var title = ""
    var image = ""
    var content = [NewsContentData]()
    var media = [MediaData]()
    
    func objectMapping(json:JSON){
        id = json["data"]["news"]["id"].stringValue
        title = json["data"]["news"]["title"].stringValue
        image = json["data"]["news"]["image"].stringValue
        for data in json["data"]["news"]["content"].arrayValue{
            let d = NewsContentData()
            d.objectMapping(json: data)
            content.append(d)
        }
        for data in json["data"]["news"]["media"].arrayValue{
            let d = MediaData()
            d.objectMapping(json: data)
            media.append(d)
        }
    }
    
}

class NewsContentData:NSObject{
    var sequenceNumber = 0
    var body = ""
    
    func objectMapping(json:JSON){
        sequenceNumber = json["sequence_number"].intValue
        body = json["body"].stringValue
    }
}

class MediaData:NSObject{
    var images:[String] = []
    var videos:[String] = []
    func objectMapping(json:JSON){
        for data in json["images"].arrayValue{
            images.append(data.stringValue)
        }
        for data in json["videos"].arrayValue{
            videos.append(data.stringValue)
        }
    }
}
