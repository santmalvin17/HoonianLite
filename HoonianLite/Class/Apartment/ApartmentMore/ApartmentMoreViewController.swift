//
//  ApartmentMoreViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentMoreViewController: UIViewController {
    enum ApartmentMoreCellList {
        case header
        case content
    }

    @IBOutlet weak var tableView: UITableView!
    
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
            
            return cell
        }
    }
    
    
}
