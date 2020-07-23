//
//  ProjectClusterDetailModel.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SwiftyJSON

class ProjectClusterDetailModel:NSObject{
    var projectClusterData = ProjectClusterData()
    
    func objectMapping(json: JSON){
        projectClusterData.objectMapping(json: json["data"]["project_cluster"])
    }
    
}
