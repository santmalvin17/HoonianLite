//
//  ContactDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class ContactDetailViewController: UIViewController {
    enum ContactDetailCellList {
        case header
        case recommendedHeader
        case recommendedContent
        case purchaseHeader
        case purchaseContent
    }

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [ContactDetailCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }

    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ContactDetailHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactDetailHeaderTableViewCellID")
        tableView.register(UINib(nibName: "ContactDetailContentHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactDetailContentHeaderTableViewCellID")
        tableView.register(UINib(nibName: "ContactDetailRecommendedProjectTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactDetailRecommendedProjectTableViewCellID")
        tableView.register(UINib(nibName: "ContactDetailProjectPurchaseTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactDetailProjectPurchaseTableViewCellID")
    }

    func configSections() {
        sections.append(.header)
        sections.append(.recommendedHeader)
        sections.append(.recommendedContent)
        sections.append(.purchaseHeader)
        sections.append(.purchaseContent)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ContactDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .recommendedHeader:
            return 1
        case .recommendedContent:
            return ACData.CONTACTDETAILMODEL.clientData.project.count
        case .purchaseHeader:
            return 1
        case .purchaseContent:
            return ACData.CONTACTDETAILMODEL.clientData.purchasedProect.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactDetailHeaderTableViewCellID", for: indexPath) as? ContactDetailHeaderTableViewCell)!
            cell.delegate = self
            cell.detailObj = ACData.CONTACTDETAILMODEL
            return cell
        case .recommendedHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactDetailContentHeaderTableViewCellID", for: indexPath) as? ContactDetailContentHeaderTableViewCell)!
            cell.configRecommended()
            return cell
        case .recommendedContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactDetailRecommendedProjectTableViewCellID", for: indexPath) as? ContactDetailRecommendedProjectTableViewCell)!
            cell.position = 0
                        cell.detailObj = ACData.CONTACTDETAILMODEL
            return cell
        case .purchaseHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactDetailContentHeaderTableViewCellID", for: indexPath) as? ContactDetailContentHeaderTableViewCell)!
            cell.configPurchase()
            return cell
        case .purchaseContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactDetailProjectPurchaseTableViewCellID", for: indexPath) as? ContactDetailProjectPurchaseTableViewCell)!
            cell.position = 0
                        cell.detailObj = ACData.CONTACTDETAILMODEL
            return cell
        }
    }
    
    
}

extension ContactDetailViewController: ContactDetailHeaderTableViewCellDelegate {
    func editContactButtonPressed() {
        ACRequest.GET_EDITCONTACT_DETAIL(agentId:ACData.LOGINDATA.agent.id, contactId: ACData.CONTACTDETAILMODEL.clientData.id,successCompletion: { (getEditContact) in
            ACData.EDITCONTACTDETAIL = getEditContact
            SVProgressHUD.dismiss()
            let vc = EditContactViewController()
            vc.trigerNya = "Edit"
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        

    }
}
