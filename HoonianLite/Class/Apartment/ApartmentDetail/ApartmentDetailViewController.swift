//
//  ApartmentDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import CallKit
import ContactsUI
import Alamofire

class ApartmentDetailViewController: UIViewController {
    enum ApartmentDetailCellList {
        case header
        case location
        case description
        case facility
        case facilityContent
        case gallery
        case video
    }
    
    enum ApartmentUnitCellList {
        case header
        case content
    }
    
    enum ApartmentReferredCellList {
        case search
        case content
    }
    
    enum ApartmentFloorPlanCellList{
        case header
        case content
    }
    
    enum AddReferredCellList {
        case header
        case content
        case marketing
        case button
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedView: UIView!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var unitButton: UIButton!
    @IBOutlet weak var referredButton: UIButton!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var unitView: UIView!
    @IBOutlet weak var referredView: UIView!
    @IBOutlet weak var addButton: UIButton!
    
    var sectionsDetail = [ApartmentDetailCellList]()
    var sectionsUnit = [ApartmentUnitCellList]()
    var sectionsReferred = [ApartmentReferredCellList]()
    var sectionsAdd = [AddReferredCellList]()
    var passedType: String = "Detail"
    var isAdd: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        configSections()
    }
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }
    
    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "Apartment", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }
    
    func config() {
        isAdd = false
        detailButtonAction()
        detailButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        unitButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        referredButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 3).isActive = true
        
        detailButton.addTarget(self, action: #selector(detailButtonAction), for: .touchUpInside)
        unitButton.addTarget(self, action: #selector(unitButtonAction), for: .touchUpInside)
        referredButton.addTarget(self, action: #selector(referredButtonAction), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
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
        
        //FLOORPLAN
        tableView.register(UINib(nibName: "FloorPlanHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "FloorPlanHeaderTableViewCellID")
        tableView.register(UINib(nibName: "FloorPlanContentTableViewCell", bundle: nil), forCellReuseIdentifier: "FloorPlanContentTableViewCellID")
        
        //ADD REFERRED
        tableView.register(UINib(nibName: "AddReferredHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredHeaderTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredContentTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredContentTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredMarketingTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredMarketingTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredButtonTableViewCellID")
        tableView.register(UINib(nibName: "AddReferredButtonTableViewCell", bundle: nil), forCellReuseIdentifier: "AddReferredButtonTableViewCellID")
    }
    
    func configSections() {
        if passedType == "Detail"{
            sectionsDetail.append(.header)
            sectionsDetail.append(.location)
            sectionsDetail.append(.description)
            sectionsDetail.append(.facility)
            sectionsDetail.append(.facilityContent)
            sectionsDetail.append(.gallery)
            sectionsDetail.append(.video)
        }
        if passedType == "Referred"{
            sectionsReferred.append(.search)
            sectionsReferred.append(.content)
        }
        
        if passedType == "Unit"{
            print(ACData.UNITLISTMODEL.projectClusterData.count)
            for i in 0..<ACData.UNITLISTMODEL.projectClusterData.count{
                sectionsUnit.append(.header)
                sectionsUnit.append(.content)
            }
        }
        
        sectionsAdd.append(.header)
        sectionsAdd.append(.content)
        sectionsAdd.append(.marketing)
        sectionsAdd.append(.button)
        
    }
    
    @objc func detailButtonAction() {
        detailButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        unitButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8470588235), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        referredButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        passedType = "Detail"
        isAdd = false
        addButton.isHidden = true
        addButton.isEnabled = false
        ACRequest.GET_PROJECT_DETAIL(id: ACData.PROJECTDETAILMODEL.projectData.id,  successCompletion: { (projectDetail) in
            ACData.PROJECTDETAILMODEL = projectDetail
            SVProgressHUD.dismiss()
            self.configSections()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @objc func unitButtonAction() {
        unitButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        detailButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        referredButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        passedType = "Unit"
        isAdd = false
        addButton.isHidden = true
        addButton.isEnabled = false
        ACRequest.GET_UNITPRICE_LIST(projectId: ACData.PROJECTDETAILMODEL.projectData.id, successCompletion: { (getUnitList) in
            ACData.UNITLISTMODEL = getUnitList
            SVProgressHUD.dismiss()
            self.configSections()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func referredButtonAction() {
        referredButton.setTitleColor(#colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1), for: .normal)
        referredView.backgroundColor = #colorLiteral(red: 0.5550585389, green: 0.7993348241, blue: 0.764461875, alpha: 1)
        detailButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        detailView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        unitButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        unitView.backgroundColor = #colorLiteral(red: 0.2275145948, green: 0.2660181522, blue: 0.5337877274, alpha: 1)
        self.passedType = "Referred"
        isAdd = false
        addButton.isHidden = false
        addButton.isEnabled = true
        ACRequest.GET_REFERRED_LIST(agentId: ACData.LOGINDATA.agent.id, projectId: ACData.PROJECTDETAILMODEL.projectData.id,successCompletion: { (getReferList) in
            ACData.REFERREDLISTMODEL = getReferList
            SVProgressHUD.dismiss()
            self.configSections()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func addButtonAction() {
        isAdd = true
        addButton.isHidden = true
        addButton.isEnabled = false
        ACRequest.GET_REFERRED_ADD_CONTACT(agentId: ACData.LOGINDATA.agent.id, projectId: ACData.PROJECTDETAILMODEL.projectData.id,successCompletion: { (getReferList) in
            ACData.CONTACTLISTMODEL = getReferList
            SVProgressHUD.dismiss()
            self.configSections()
            self.tableView.reloadData()
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}

extension ApartmentDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if !isAdd {
            if passedType == "Detail" {
                return 7
            }
            else if passedType == "Unit" {
                return ACData.UNITLISTMODEL.projectClusterData.count*2
            }else if passedType == "Referred"{
                return 2
            }else {
                return 1
            }
        }
        else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !isAdd {
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
                    return ACData.PROJECTDETAILMODEL.projectData.facilities.count
                    
                case .gallery:
                    if ACData.PROJECTDETAILMODEL.projectData.gallery.count == 0{
                        return 0
                    }else{
                      return 1
                    }
                case .video:
                    if ACData.PROJECTDETAILMODEL.projectData.videos.count == 0{
                        return 0
                    }else{
                      return 1
                    }
                }
            }
            else if passedType == "Unit" {
                switch sectionsUnit[section] {
                case .header:
                    return 1
                case .content:
                    return ACData.UNITLISTMODEL.projectClusterData[section/2].projectClusterType.count
                }
            }else if passedType == "FloorPlan"{
                return 1
            }
            else {
                switch sectionsReferred[section] {
                case .search:
                    return 1
                case .content:
                    return ACData.REFERREDLISTMODEL.referProjectList.count
                }
            }
        }
        else {
            switch sectionsAdd[section] {
            case .header:
                return 1
            case .content:
                return ACData.CONTACTLISTMODEL.contacts.count
            case .marketing:
                return 1
            case .button:
                return 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !isAdd {
            if passedType == "Detail" {
                switch sectionsDetail[indexPath.section] {
                case .header:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentLocationDetailTableViewCell", for: indexPath) as? ApartmentLocationDetailTableViewCell)!
                    cell.detailObj2 = ACData.PROJECTDETAILMODEL.projectData
                    print(ACData.PROJECTDETAILMODEL.projectData.image)
                    return cell
                case .location:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailCellLocationTableViewCell", for: indexPath) as? ApartmentDetailCellLocationTableViewCell)!
                    cell.delegate = self
                    cell.detailObj = ACData.PROJECTDETAILMODEL.projectData
                    return cell
                case .description:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailDescriptionTableViewCell", for: indexPath) as? ApartmentDetailDescriptionTableViewCell)!
                    cell.detailObj = ACData.PROJECTDETAILMODEL.projectData
                    return cell
                case .facility:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityTableViewCell", for: indexPath) as? ApartmentDetailFacilityTableViewCell)!
                    return cell
                case .facilityContent:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailFacilityContentTableViewCell", for: indexPath) as? ApartmentDetailFacilityContentTableViewCell)!
                    cell.position = indexPath.row
                    cell.numberLabel.text = "\(indexPath.row + 1)"
                    cell.detailObj = ACData.PROJECTDETAILMODEL.projectData.facilities[indexPath.row]
                    return cell
                case .gallery:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailGalleryTableViewCell", for: indexPath) as? ApartmentDetailGalleryTableViewCell)!
                    cell.detailObj = ACData.PROJECTDETAILMODEL.projectData.gallery[indexPath.row]
                    return cell
                case .video:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentDetailVideoTableViewCell", for: indexPath) as? ApartmentDetailVideoTableViewCell)!
                    cell.detailObj = ACData.PROJECTDETAILMODEL.projectData.videos[indexPath.row]
                    
                    return cell
                }
            }
            else if passedType == "Unit" {
                switch sectionsUnit[indexPath.section] {
                case .header:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentUnitHeaderTableViewCell", for: indexPath) as? ApartmentUnitHeaderTableViewCell)!
                    cell.delegate = self
                    cell.position = indexPath.row
                    cell.section = indexPath.section/2
                    cell.detailObj = ACData.UNITLISTMODEL.projectClusterData[indexPath.section/2]
                    return cell
                case .content:
                    let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentUnitContentTableViewCell", for: indexPath) as? ApartmentUnitContentTableViewCell)!
                    cell.position = indexPath.row
                    cell.section = indexPath.section/2
                    cell.delegate = self
                    cell.detailObj = ACData.UNITLISTMODEL.projectClusterData[indexPath.section/2].projectClusterType[indexPath.row]
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
                    cell.position = indexPath.row
                    cell.delegate = self
                    cell.detailObj = ACData.REFERREDLISTMODEL.referProjectList[indexPath.row]
                    return cell
                }
            }
        }
        else {
            switch sectionsAdd[indexPath.section] {
            case .header:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredHeaderTableViewCellID", for: indexPath) as? AddReferredHeaderTableViewCell)!
                
                return cell
            case .content:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredContentTableViewCellID", for: indexPath) as? AddReferredContentTableViewCell)!
                cell.delegate = self
                cell.detailObj = ACData.CONTACTLISTMODEL.contacts[indexPath.row]
                return cell
            case .marketing:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredMarketingTableViewCellID", for: indexPath) as? AddReferredMarketingTableViewCell)!
                cell.delegate = self
                
                return cell
            case .button:
                let cell = (tableView.dequeueReusableCell(withIdentifier: "AddReferredButtonTableViewCellID", for: indexPath) as? AddReferredButtonTableViewCell)!
                cell.delegate = self
                return cell
            }
        }
    }
    
    
    
    
}

extension ApartmentDetailViewController:ApartmentReferredContentTableViewCellDelegate,ApartmentUnitContentTableViewCellDelegate,ApartmentUnitHeaderTableViewCellDelegate{
    func unitClicked(indexKe: Int,sectionKe: Int) {
        ACRequest.GET_UNITPRICE_DETAIL(projectId: ACData.UNITLISTMODEL.projectClusterData[indexKe].projectId, unitTypeId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].id, clusterId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].clusterId,successCompletion: { (getUnitDetail) in
            ACData.UNITDETAILMODEL = getUnitDetail
            SVProgressHUD.dismiss()
            let vc = ApartmentUnitDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func towerClicked(indexKe: Int,sectionKe:Int) {
        ACRequest.GET_CLUSTERDETAIL(id: "cf4ba781-4ad6-4a66-89e2-2bd9bba49a78", successCompletion: { (getTower) in
            ACData.TOWERMODEL = getTower
            SVProgressHUD.dismiss()
//            ACRequest.GET_FLOORPLAN(projectId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].id, clusterId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].id, page: 1, successCompletion: { (getFloorPlan) in
//                ACData.FLOORPLANMODEL = getFloorPlan
//                SVProgressHUD.dismiss()
//                let vc = TowerViewController()
//                self.navigationController?.pushViewController(vc, animated: true)
//            }) { (message) in
//                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
                            let vc = TowerViewController()
                            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func floorPlanClicked(indexKe: Int,sectionKe:Int) {
        ACRequest.GET_FLOORPLAN(projectId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].id, clusterId: ACData.UNITLISTMODEL.projectClusterData[sectionKe].projectClusterType[indexKe].id, page: 1, successCompletion: { (getFloorPlan) in
            ACData.FLOORPLANMODEL = getFloorPlan
            SVProgressHUD.dismiss()
            self.passedType = "FloorPlan"
            self.configSections()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func callPhone(indexKe: Int) {
        guard let number = URL(string: "tel://" + ACData.REFERREDLISTMODEL.referProjectList[indexKe].contacts.phoneNumber) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
    }
    
    
}

extension ApartmentDetailViewController: AddReferredButtonTableViewCellDelegate, AddReferredContentTableViewCellDelegate, AddReferredMarketingTableViewCellDelegate ,ApartmentDetailCellLocationTableViewCellDelegate{
    func mapsClicked(lattitude:String,longtitude:String) {
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
                UIApplication.shared.open(URL(string:"comgooglemaps://?center=\(lattitude),\(longtitude)&zoom=14&views=traffic&q=\(lattitude),\(longtitude)")!, options: [:], completionHandler: nil)
            } else {
                print("Can't use comgooglemaps://")
            }
    }
    
    func addContactPressed() {
        CNContactStore().requestAccess(for: .contacts) { (access, error) in
            print("Access: \(access)")
        }
        let contacVC = CNContactPickerViewController()
        contacVC.delegate = self
        self.present(contacVC , animated: true, completion: nil)
    }
    
    func cancelButtonPressed() {
        let parameter: Parameters = [
            "agent_id":ACData.LOGINDATA.agent.id,
            "contact_id":"2c5ea4c0-1233-11e9-8bad-9b1deb4d3b7d",
            "project_id":ACData.PROJECTDETAILMODEL.projectData.id
        ]
        print(parameter)
        ACRequest.POST_REFERRED_PROJECT(parameters: parameter, successCompletion: { (result) in
            SVProgressHUD.dismiss()
            ACRequest.GET_REFERRED_LIST(agentId: ACData.LOGINDATA.agent.id, projectId: ACData.PROJECTDETAILMODEL.projectData.id,successCompletion: { (getReferList) in
                ACData.REFERREDLISTMODEL = getReferList
                SVProgressHUD.dismiss()
                self.isAdd = false
                self.tableView.reloadData()
                self.addButton.isHidden = false
                self.addButton.isEnabled = true
            }) { (message) in
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }) { (message) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func notesButtonPressed() {
        let vc = AddReferredAddNoteViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    func changeButtonPressed() {
        let vc = AddReferredChangeMarketingViewController()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
}

extension ApartmentDetailViewController:CNContactPickerDelegate{
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let name = CNContactFormatter.string(from: contact, style: .fullName)
        let numbers = contact.phoneNumbers.first
        let vc = EditContactViewController()
        vc.nameText = name!
        vc.phoneText = (numbers?.value)?.stringValue ?? ""
        vc.trigerNya = "Referred"
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}
