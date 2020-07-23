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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
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
            return 10
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
            
            return cell
        case .income:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileIncomeTableViewCellID", for: indexPath) as? ProfileIncomeTableViewCell)!
            
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileContentTableViewCellID", for: indexPath) as? ProfileContentTableViewCell)!
            
            return cell
        case .idCard:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ProfileIDCardTableViewCellID", for: indexPath) as? ProfileIDCardTableViewCell)!
            
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
    func changePasswordButtonPressed() {
        let vc = ChangePasswordViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
