//
//  PurchaseViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class PurchaseViewController: UIViewController {
    enum PurchaseCellList {
        case notice
        case content
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = [PurchaseCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTable()
        configSections()
    }
    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "PurchaseNoticeTableViewCell", bundle: nil), forCellReuseIdentifier: "purchaseNoticeTableViewCell")
        tableView.register(UINib(nibName: "PurchaseItemTableViewCell", bundle: nil), forCellReuseIdentifier: "purchaseItemTableViewCell")
    }
    
    func configSections() {
        sections.append(.notice)
        sections.append(.content)
    }
    
}

extension PurchaseViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .notice:
            return 1
        case .content:
            return ACData.PURCHASELISTMODEL.projectPurchaseList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .notice:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "purchaseNoticeTableViewCell", for: indexPath) as? PurchaseNoticeTableViewCell)!
            
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "purchaseItemTableViewCell", for: indexPath) as? PurchaseItemTableViewCell)!
            cell.position = indexPath.row
            cell.delegate = self
            cell.detailObj = ACData.PURCHASELISTMODEL
            return cell
        }
    }
    
}
extension PurchaseViewController:PurchaseItemTableViewCellDelegate{
    func detailPurchase(indexKe: Int) {
        ACRequest.GET_PURCHASED_DETAIL(agentId: ACData.LOGINDATA.agent.id, purchaseId: ACData.PURCHASELISTMODEL.projectPurchaseList[indexKe].id,  successCompletion: { (purchaseDetail) in
            ACData.PURCHASEDETAILMODEL = purchaseDetail
            SVProgressHUD.dismiss()
            let vc = PurchaseDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
