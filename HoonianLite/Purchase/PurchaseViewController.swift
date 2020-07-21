//
//  PurchaseViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

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
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .notice:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "purchaseNoticeTableViewCell", for: indexPath) as? PurchaseNoticeTableViewCell)!
            
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "purchaseItemTableViewCell", for: indexPath) as? PurchaseItemTableViewCell)!
            
            return cell
        }
    }
    
}
