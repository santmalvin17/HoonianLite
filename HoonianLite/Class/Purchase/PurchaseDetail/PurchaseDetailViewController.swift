//
//  PurchaseDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseDetailViewController: UIViewController {
    enum PurchaseDetailCellList {
        case unitImage
        case selectedUnit
        case augmentedReality
        case virtualTour
    }

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [PurchaseDetailCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }

    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "PurchaseDetailUnitImageTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseDetailUnitImageTableViewCellID")
        tableView.register(UINib(nibName: "PurchaseDetailSelectedUnitTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseDetailSelectedUnitTableViewCellID")
        tableView.register(UINib(nibName: "PurchaseDetailARTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseDetailARTableViewCellID")
        tableView.register(UINib(nibName: "PurchaseDetailVirtualTourTableViewCell", bundle: nil), forCellReuseIdentifier: "PurchaseDetailVirtualTourTableViewCellID")
    }
    
    func configSections() {
        sections.append(.unitImage)
        sections.append(.selectedUnit)
        sections.append(.augmentedReality)
        sections.append(.virtualTour)
    }

}

extension PurchaseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .unitImage:
            return 1
        case .selectedUnit:
            return 1
        case .augmentedReality:
            return 1
        case .virtualTour:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .unitImage:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "PurchaseDetailUnitImageTableViewCellID", for: indexPath) as? PurchaseDetailUnitImageTableViewCell)!
            
            return cell
        case .selectedUnit:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "PurchaseDetailSelectedUnitTableViewCellID", for: indexPath) as? PurchaseDetailSelectedUnitTableViewCell)!
            
            return cell
        case .augmentedReality:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "PurchaseDetailARTableViewCellID", for: indexPath) as? PurchaseDetailARTableViewCell)!
            
            return cell
        case .virtualTour:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "PurchaseDetailVirtualTourTableViewCellID", for: indexPath) as? PurchaseDetailVirtualTourTableViewCell)!
            
            return cell
        }
    }
    
    
}
