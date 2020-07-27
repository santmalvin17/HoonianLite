//
//  ProfileViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    enum ProfileCellList {
        case picture
        case income
        case content
        case idCard
        case button
        case logout
    }

    @IBOutlet weak var tableView: UITableView!
    private var sections = [ProfileCellList]()
    var comissionTitle = ["Total Comission","Pending","On Hold","Pending"]
    var comissionIsi = [String]()
    var dataIsi = [String]()
    var dataTitle = ["Full Name","Phone No","Id No","Bank Name","Account Number","Email","Address","Company","Position","Birth Date","Birth Place"]
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }

    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "Profile", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }

    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ProfilePictureTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfilePictureTableViewCellID")
        tableView.register(UINib(nibName: "ProfileIncomeTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileIncomeTableViewCellID")
        tableView.register(UINib(nibName: "ProfileContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileContentTableViewCellID")
        tableView.register(UINib(nibName: "ProfileIDCardTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileIDCardTableViewCellID")
        tableView.register(UINib(nibName: "ProfileButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileButtonTableViewCellID")
        tableView.register(UINib(nibName: "ProfileLogoutButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileLogoutButtonTableViewCellID")
        dataIsi.append(ACData.PROFILEMODEL.agent.name)
        dataIsi.append(ACData.PROFILEMODEL.agent.phoneNumber)
        dataIsi.append(ACData.PROFILEMODEL.agent.idCardNo)
        dataIsi.append(ACData.PROFILEMODEL.agent.accountBank)
        dataIsi.append(ACData.PROFILEMODEL.agent.accountNumber)
        dataIsi.append(ACData.PROFILEMODEL.agent.email)
        dataIsi.append(ACData.PROFILEMODEL.agent.address)
        dataIsi.append("WEKIDDO")
        dataIsi.append(ACData.PROFILEMODEL.agent.position)
        dataIsi.append(ACData.PROFILEMODEL.agent.birthDate)
        dataIsi.append(ACData.PROFILEMODEL.agent.birthPlace)
        comissionIsi.append(ACData.PROFILEMODEL.agent.totalComission)
        comissionIsi.append(ACData.PROFILEMODEL.agent.totalPaid)
        comissionIsi.append(ACData.PROFILEMODEL.agent.totalOnHold)
        comissionIsi.append(ACData.PROFILEMODEL.agent.totalPending)
        
    }
    
    func configSections() {
        sections.append(.picture)
        sections.append(.income)
        sections.append(.content)
        sections.append(.idCard)
        sections.append(.button)
        sections.append(.logout)
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .picture:
            return 1
        case .income:
            return 4
        case .content:
            return 11
        case .idCard:
            return 1
        case .button:
            return 1
        case .logout:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .picture:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfilePictureTableViewCellID", for: indexPath) as? ProfilePictureTableViewCell)!
            cell.detailObj = ACData.PROFILEMODEL
            return cell
        case .income:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileIncomeTableViewCellID", for: indexPath) as? ProfileIncomeTableViewCell)!
            cell.titleLabel.text = comissionTitle[indexPath.row]
            cell.incomeLabel.text = comissionIsi[indexPath.row]
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileContentTableViewCellID", for: indexPath) as? ProfileContentTableViewCell)!
            cell.labelCui.text = dataIsi[indexPath.row]
            cell.namanyaCui.text = dataTitle[indexPath.row]
            return cell
        case .idCard:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileIDCardTableViewCellID", for: indexPath) as? ProfileIDCardTableViewCell)!
            cell.detailObj = ACData.PROFILEMODEL
            return cell
        case .button:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileButtonTableViewCellID", for: indexPath) as? ProfileButtonTableViewCell)!
            cell.delegate = self
            
            return cell
        case .logout:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileLogoutButtonTableViewCellID", for: indexPath) as? ProfileLogoutButtonTableViewCell)!
            
            return cell
        }
    }
    
    
}

extension ProfileViewController: ProfileButtonTableViewCellDelegate {
    func editProfileClicked() {
        
        let vc = EditProfileViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func changePasswordButtonPressed() {
        let vc = ChangePasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
