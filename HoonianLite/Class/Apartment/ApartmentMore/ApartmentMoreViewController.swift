//
//  ApartmentMoreViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class ApartmentMoreViewController: UIViewController {
    enum ApartmentMoreCellList {
        case header
        case content
    }
    
    @IBOutlet weak var tableView: UITableView!
    var favouriteStaus = [Bool]()
    var sections = [ApartmentMoreCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTable()
        configSections()
    }
    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ApartmentMoreSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentMoreSearchTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentMoreContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentMoreContentTableViewCellID")
    }
    
    func configSections() {
        sections.append(.header)
        sections.append(.content)
    }
    
}

extension ApartmentMoreViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .content:
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentMoreSearchTableViewCellID", for: indexPath) as? ApartmentMoreSearchTableViewCell)!
            
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentMoreContentTableViewCellID", for: indexPath) as? ApartmentMoreContentTableViewCell)!
            cell.position = indexPath.row
            cell.delegate = self
            cell.detailObj = ACData.PROJECTLISTMODEL.projects[indexPath.row]
            return cell
        }
    }
    
    
}

extension ApartmentMoreViewController:ApartmentMoreContentTableViewCellDelegate{
    func viewSelected(indexKe: Int) {
        ACRequest.GET_PROJECT_DETAIL(id: ACData.PROJECTLISTMODEL.projects[indexKe].id,  successCompletion: { (projectDetail) in
            ACData.PROJECTDETAILMODEL = projectDetail
            SVProgressHUD.dismiss()
            let vc = ApartmentDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func favoriteSelected(indexKe: Int) {
        let parameter: Parameters = [
            "project_id":ACData.PROJECTLISTMODEL.projects[indexKe].id,
            "agent_id":ACData.LOGINDATA.agent.id
        ]
        ACRequest.POST_FAVOURITE(parameters: parameter, successCompletion: { (result) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Favourite", message: "Property has been set to favourite", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }) { (message) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}
