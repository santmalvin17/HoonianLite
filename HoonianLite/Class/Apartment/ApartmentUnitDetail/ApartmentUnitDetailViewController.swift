//
//  ApartmentUnitDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitDetailViewController: UIViewController {
    enum ApartmentUnitDetailCellList {
        case header
        case gallery
        case virtualTour
        case video
    }

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [ApartmentUnitDetailCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }
    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ApartmentUnitDetailHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentUnitDetailHeaderTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentUnitDetailGalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentUnitDetailGalleryTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentUnitDetailVirtualTourTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentUnitDetailVirtualTourTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentUnitDetailVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentUnitDetailVideoTableViewCellID")
    }

    func configSections() {
        sections.append(.header)
        sections.append(.gallery)
        sections.append(.virtualTour)
        sections.append(.video)
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

extension ApartmentUnitDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .header:
            return 1
        case .gallery:
            return 1
        case .virtualTour:
            return 1
        case .video:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .header:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentUnitDetailHeaderTableViewCellID", for: indexPath) as? ApartmentUnitDetailHeaderTableViewCell)!
            
            return cell
        case .gallery:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentUnitDetailGalleryTableViewCellID", for: indexPath) as? ApartmentUnitDetailGalleryTableViewCell)!
            
            return cell
        case .virtualTour:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentUnitDetailVirtualTourTableViewCellID", for: indexPath) as? ApartmentUnitDetailVirtualTourTableViewCell)!
            
            return cell
        case .video:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentUnitDetailVideoTableViewCellID", for: indexPath) as? ApartmentUnitDetailVideoTableViewCell)!
            
            return cell
        }
    }
    
}


