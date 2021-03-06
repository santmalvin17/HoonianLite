//
//  LandedPropertyDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class LandedPropertyDetailViewController: UIViewController {
    enum LandedPropertyDetailCellList {
        case header
        case location
        case description
        case facility
        case facilityContent
        case gallery
        case video
    }
    
    enum LandedPropertyUnitCellList {
        case header
        case content
    }
    
    enum LandedPropertyReferredCellList {
        case search
        case content
    }

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var unitButton: UIButton!
    @IBOutlet weak var referredButton: UIButton!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var unitView: UIView!
    @IBOutlet weak var referredView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var sectionsDetail = [LandedPropertyDetailCellList]()
    var sectionsUnit = [LandedPropertyUnitCellList]()
    var sectionsReferred = [LandedPropertyReferredCellList]()
    
    var passedType: String = "Detail"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
        config()
    }
    
    func config() {
        detailButtonAction()
        detailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        unitButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        referredButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        
        detailButton.addTarget(self, action: #selector(detailButtonAction), for: .touchUpInside)
        unitButton.addTarget(self, action: #selector(unitButtonAction), for: .touchUpInside)
        referredButton.addTarget(self, action: #selector(referredButtonAction), for: .touchUpInside)
    }
    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        //DETAIL
        tableView.register(UINib(nibName: "ApartmentLocationDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentLocationDetailTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailCellLocationTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailCellLocationTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailDescriptionTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailFacilityTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailFacilityTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailFacilityContentTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailFacilityContentTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailGalleryTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailGalleryTableViewCell")
        tableView.register(UINib(nibName: "ApartmentDetailVideoTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentDetailVideoTableViewCell")
        
        //UNIT & PRICE
        tableView.register(UINib(nibName: "ApartmentUnitHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentUnitHeaderTableViewCell")
        tableView.register(UINib(nibName: "ApartmentUnitContentTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentUnitContentTableViewCell")
        
        //REFERRED
        tableView.register(UINib(nibName: "ApartmentReferredSearchTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentReferredSearchTableViewCellID")
        tableView.register(UINib(nibName: "ApartmentReferredContentTableViewCell", bundle: nil), forCellReuseIdentifier: "ApartmentReferredContentTableViewCellID")
    }
    
    func configSections() {
        //DETAIL
        sectionsDetail.append(.header)
        sectionsDetail.append(.location)
        sectionsDetail.append(.description)
        sectionsDetail.append(.facility)
        sectionsDetail.append(.facilityContent)
        sectionsDetail.append(.gallery)
        sectionsDetail.append(.video)
        
        //UNIT
        sectionsReferred.append(.search)
        sectionsReferred.append(.content)
        
        //REFERRED
        sectionsUnit.append(.header)
        sectionsUnit.append(.content)
    }
    
    @objc func detailButtonAction() {
        detailButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        unitButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        referredButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        passedType = "Detail"
        tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    @objc func unitButtonAction() {
        unitButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        detailButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        referredButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        passedType = "Unit"
        tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    @objc func referredButtonAction() {
        referredButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        detailButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        unitButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        self.passedType = "Referred"
        tableView.reloadData()
        self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }

}

extension LandedPropertyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if passedType == "Detail" {
            return sectionsDetail.count
        }
        else if passedType == "Unit" {
            return sectionsUnit.count
        }
        else {
            return sectionsReferred.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if passedType == "Detail" {
            switch sectionsDetail[section] {
            case .header:
                return 1
            case .location:
                return 1
            case .description:
                return 1
            case .facility:
                return 1
            case .facilityContent:
                return 10
            case .gallery:
                return 1
            case .video:
                return 1
            }
        }
        else if passedType == "Unit" {
            switch sectionsUnit[section] {
            case .header:
                return 1
            case .content:
                return 1
            }
        }
        else {
            switch sectionsReferred[section] {
            case .search:
                return 1
            case .content:
                return 10
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if passedType == "Detail" {
            switch sectionsDetail[indexPath.section] {
            case .header:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentLocationDetailTableViewCell", for: indexPath) as? ApartmentLocationDetailTableViewCell)!
                
                return cell
            case .location:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailCellLocationTableViewCell", for: indexPath) as? ApartmentDetailCellLocationTableViewCell)!
                
                return cell
            case .description:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailDescriptionTableViewCell", for: indexPath) as? ApartmentDetailDescriptionTableViewCell)!
                
                return cell
            case .facility:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityTableViewCell", for: indexPath) as? ApartmentDetailFacilityTableViewCell)!
                
                return cell
            case .facilityContent:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityContentTableViewCell", for: indexPath) as? ApartmentDetailFacilityContentTableViewCell)!
                
                return cell
            case .gallery:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailGalleryTableViewCell", for: indexPath) as? ApartmentDetailGalleryTableViewCell)!
                
                return cell
            case .video:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailVideoTableViewCell", for: indexPath) as? ApartmentDetailVideoTableViewCell)!
                
                
                return cell
            }
        }
        else if passedType == "Unit" {
            switch sectionsUnit[indexPath.section] {
            case .header:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentUnitHeaderTableViewCell", for: indexPath) as? ApartmentUnitHeaderTableViewCell)!
                
                return cell
            case .content:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentUnitContentTableViewCell", for: indexPath) as? ApartmentUnitContentTableViewCell)!
                
                return cell
            }
        }else if passedType == "FloorPlan"{
                let cell = (tableView.dequeueReusableCell(withIdentifier: "FloorPlanContentTableViewCellID", for: indexPath) as? FloorPlanContentTableViewCell)!
            
                return cell
        }else {
            switch sectionsReferred[indexPath.section]{
            case .search:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentReferredSearchTableViewCellID", for: indexPath) as? ApartmentReferredSearchTableViewCell)!
                
                return cell
            case .content:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "ApartmentReferredContentTableViewCellID", for: indexPath) as? ApartmentReferredContentTableViewCell)!
                
                return cell
            }
        }
    }
}
