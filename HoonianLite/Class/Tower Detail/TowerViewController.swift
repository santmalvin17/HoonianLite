//
//  TowerViewController.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class TowerViewController: UIViewController {
    
    enum TowerDetailCellList{
        case header
        case image
        case facilityHeader
        case facility
        case gallery
        case video
        case floorPlan
    }
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        tableView.delegate = self
        tableView.dataSource = self
        configSections()
    }
    private var sectionTower = [TowerDetailCellList]()
    
    func configTable(){
        tableView.register(UINib(nibName: "ApartmentUnitHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentUnitHeaderTableViewCell")
        tableView.register(UINib(nibName: "HeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentDetailFacilityContentTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailFacilityContentTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailGalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailGalleryTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailFacilityTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailFacilityTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailVideoTableViewCell")
        tableView.register(UINib(nibName: "FloorPlanContentTableViewCell", bundle: nil), forCellReuseIdentifier: "FloorPlanContentTableViewCellID")
    }
    func configSections(){
        sectionTower.append(.header)
        sectionTower.append(.image)
        sectionTower.append(.facilityHeader)
        sectionTower.append(.facility)
        sectionTower.append(.gallery)
        sectionTower.append(.video)
        sectionTower.append(.floorPlan)
    }
    
}

extension TowerViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sectionTower[section] {
        case .header:
            return 1
        case .image:
            return 1
        case .facilityHeader:
            return 1
        case .facility:
            return ACData.TOWERMODEL.projectClusterData.facilities.count
        case .gallery:
            return 1
        case .video:
            return 1
        case .floorPlan:
            return 1
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sectionTower[indexPath.section]{
        case .header:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentUnitHeaderTableViewCell", for: indexPath) as? ApartmentUnitHeaderTableViewCell)!
            cell.detailObj = ACData.TOWERMODEL.projectClusterData
            cell.infoImageView.isHidden = true
            return cell
        case .image:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCellID", for: indexPath) as? HeaderTableViewCell)!
            cell.detailObj = ACData.TOWERMODEL.projectClusterData
            return cell
        case .facility:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityContentTableViewCell", for: indexPath) as? ApartmentDetailFacilityContentTableViewCell)!
            cell.detailObj = ACData.TOWERMODEL.projectClusterData.facilities[indexPath.row]
            cell.numberLabel.text = "\(indexPath.row+1)"
            return cell
        case .gallery:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailGalleryTableViewCell", for: indexPath) as? ApartmentDetailGalleryTableViewCell)!
            cell.detailObj = ACData.TOWERMODEL.projectClusterData.gallery[0]
            return cell
        case .video:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailVideoTableViewCell", for: indexPath) as? ApartmentDetailVideoTableViewCell)!
            cell.detailObj = ACData.TOWERMODEL.projectClusterData.videos[0]
            return cell
        case .floorPlan:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "FloorPlanContentTableViewCellID", for: indexPath) as? FloorPlanContentTableViewCell)!
            return cell
        case .facilityHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityTableViewCell", for: indexPath) as? ApartmentDetailFacilityTableViewCell)!
            return cell
        }
    }
    
    
}
