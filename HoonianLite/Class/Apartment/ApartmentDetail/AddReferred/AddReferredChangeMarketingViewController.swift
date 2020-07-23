//
//  AddReferredChangeMarketingViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class AddReferredChangeMarketingViewController: UIViewController {
    enum AddReferredChangeMarketingCellList {
        case header
        case content
        case button
    }
    
    var sections = [AddReferredChangeMarketingCellList]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }


    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "AddReferredChangeMarketinHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredChangeMarketinHeaderTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredChangeMarketingContentTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredChangeMarketingContentTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredChangeMarketingButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredChangeMarketingButtonTableViewCellID")
    }
    
    func configSections() {
        sections.append(.header)
        sections.append(.content)
        sections.append(.button)
    }

}

extension AddReferredChangeMarketingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .content:
            return 4
        case .button:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredChangeMarketinHeaderTableViewCellID", for: indexPath) as? AddReferredChangeMarketinHeaderTableViewCell)!
            
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredChangeMarketingContentTableViewCellID", for: indexPath) as? AddReferredChangeMarketingContentTableViewCell)!
            
            return cell
        case .button:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredChangeMarketingButtonTableViewCellID", for: indexPath) as? AddReferredChangeMarketingButtonTableViewCell)!
            cell.delegate = self
            
            return cell
        }
    }
    
}

extension AddReferredChangeMarketingViewController: AddReferredChangeMarketingButtonTableViewCellDelegate {
    func changeButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
