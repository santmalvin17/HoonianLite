//
//  HomeViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class HomeViewController: UIViewController {
    enum HomeCellList {
        case upcomingProjectHeader
        case upcomingProjectContent
        case locationHeader
        case locationContent
        case apartmentHeader
        case apartmentContent
        case landedPropertyHeader
        case landedPropertyContent
        case warehouseHeader
        case warehouseContent
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private var sections = [HomeCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTable()
        configSections()

    }
    @objc func callMethod(){
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }

    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "Home", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }
    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "HomeUpcomingProjectHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "homeUpcomingProjectHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeUpcomingProjectContentTableViewCell", bundle: nil), forCellReuseIdentifier: "homeUpcomingProjectContentTableViewCell")
        tableView.register(UINib(nibName: "HomeLocationHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "homeLocationHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeLocationContentTableViewCell", bundle: nil), forCellReuseIdentifier: "homeLocationContentTableViewCell")
        tableView.register(UINib(nibName: "HomeApartmentHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "homeApartmentHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeApartmentContentTableViewCell", bundle: nil), forCellReuseIdentifier: "homeApartmentContentTableViewCell")
        tableView.register(UINib(nibName: "HomeLandedPropertyHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "homeLandedPropertyHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeLandedPropertyContentTableViewCell", bundle: nil), forCellReuseIdentifier: "homeLandedPropertyContentTableViewCell")
        tableView.register(UINib(nibName: "HomeWarehouseHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "homeWarehouseHeaderTableViewCell")
        tableView.register(UINib(nibName: "HomeWarehouseContentTableViewCell", bundle: nil), forCellReuseIdentifier: "homeWarehouseContentTableViewCell")
    }
    
    func configSections() {
        sections.append(.upcomingProjectHeader)
        sections.append(.upcomingProjectContent)
        sections.append(.locationHeader)
        sections.append(.locationContent)
        sections.append(.apartmentHeader)
        sections.append(.apartmentContent)
        sections.append(.landedPropertyHeader)
        sections.append(.landedPropertyContent)
        sections.append(.warehouseHeader)
        sections.append(.warehouseContent)
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

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .upcomingProjectHeader:
            return 1
        case .upcomingProjectContent:
            return 1
        case .locationHeader:
            return 1
        case .locationContent:
            return 1
        case .apartmentHeader:
            return 1
        case .apartmentContent:
            return 1
        case .landedPropertyHeader:
            return 1
        case .landedPropertyContent:
            return 1
        case .warehouseHeader:
            return 1
        case .warehouseContent:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .upcomingProjectHeader :
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeUpcomingProjectHeaderTableViewCell", for: indexPath) as? HomeUpcomingProjectHeaderTableViewCell)!
            
            return cell
        case .upcomingProjectContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeUpcomingProjectContentTableViewCell", for: indexPath) as? HomeUpcomingProjectContentTableViewCell)!
            //            cell.detailObj = ACData.LOGINDATA.homeData
            cell.delegate = self
            
            return cell
        case .locationHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeLocationHeaderTableViewCell", for: indexPath) as? HomeLocationHeaderTableViewCell)!
            cell.delegate = self
            
            return cell
        case .locationContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeLocationContentTableViewCell", for: indexPath) as? HomeLocationContentTableViewCell)!
            cell.delegate = self
            return cell
        case .apartmentHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeApartmentHeaderTableViewCell", for: indexPath) as? HomeApartmentHeaderTableViewCell)!
            cell.delegate = self
            
            return cell
        case .apartmentContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeApartmentContentTableViewCell", for: indexPath) as? HomeApartmentContentTableViewCell)!
            cell.delegate = self
            
            return cell
        case .landedPropertyHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeLandedPropertyHeaderTableViewCell", for: indexPath) as? HomeLandedPropertyHeaderTableViewCell)!
            cell.delegate = self
            
            return cell
        case .landedPropertyContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeLandedPropertyContentTableViewCell", for: indexPath) as? HomeLandedPropertyContentTableViewCell)!
            cell.delegate = self
            
            return cell
        case .warehouseHeader:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeWarehouseHeaderTableViewCell", for: indexPath) as? HomeWarehouseHeaderTableViewCell)!
            cell.delegate = self
            
            return cell
        case .warehouseContent:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "homeWarehouseContentTableViewCell", for: indexPath) as? HomeWarehouseContentTableViewCell)!
            cell.delegate = self
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch sections [indexPath.section]{
        case.upcomingProjectHeader:
            return 44
        case .upcomingProjectContent:
            return 232
        case .locationHeader:
            return 44
        case .locationContent:
            return 120
        case .apartmentHeader:
            return 44
        case .apartmentContent:
            return 140
        case .landedPropertyHeader:
            return 44
        case .landedPropertyContent:
            return 140
        case .warehouseHeader:
            return 44
        case .warehouseContent:
            return 140
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .upcomingProjectHeader:
            print("Upcoming Project Header")
        case .upcomingProjectContent:
            print("Upcoming Project Content")
        case .locationHeader:
            print("location header")
        case .locationContent:
            print("location content")
        case .apartmentHeader:
            print("apartment header")
        case .apartmentContent:
            print("apartment content")
        case .landedPropertyHeader:
            print("landed property header")
        case .landedPropertyContent:
            print("landed property content")
        case .warehouseHeader:
            print("warehouse header")
        case .warehouseContent:
            print("warehouse content")
        }
    }
    
}

extension HomeViewController: HomeUpcomingProjectContentTableViewCellDelegate {
    
    func imageViewPressed(indexKe:Int) {
        ACRequest.GET_NEWS_DETAIL(newsId: ACData.LOGINDATA.homeData.news[indexKe].id, successCompletion: { (getNewsDetail) in
            ACData.NEWSDETAILMODEL = getNewsDetail
            SVProgressHUD.dismiss()
            let vc = NewsViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
}

extension HomeViewController: HomeLocationContentTableViewCellDelegate, HomeApartmentContentTableViewCellDelegate, HomeLandedPropertyContentTableViewCellDelegate, HomeWarehouseContentTableViewCellDelegate {
    func homeLocationSelected(indexKe: Int) {
        
        ACRequest.GET_PROJECT_LIST(limitPage: "5", page: "1", selectCityId: ACData.LOGINDATA.homeData.cities[indexKe].id, selectCategoryId: ACData.LOGINDATA.homeData.apartment.categoryId,  successCompletion: { (projectList) in
            ACData.PROJECTLISTMODEL = projectList
            SVProgressHUD.dismiss()
            let vc = LocationDetailViewController()
            print("Nilai \(ACData.LOGINDATA.homeData.apartment.categoryId)")
            vc.position = indexKe
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func homeApartmentSelected(indexKe:Int) {
        ACRequest.GET_PROJECT_DETAIL(id: ACData.LOGINDATA.homeData.apartment.projects[indexKe].id,  successCompletion: { (projectDetail) in
            ACData.PROJECTDETAILMODEL = projectDetail
            SVProgressHUD.dismiss()
            let vc = ApartmentDetailViewController()
            vc.passedType = "Detail"
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func homeLandedPropertySelected() {
        print("Landed property selected")
        
        let vc = LandedPropertyDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func homeWarehouseSelected(indexKe:Int) {
        print("Warehouse selected")
        ACRequest.GET_PROJECT_DETAIL(id: ACData.LOGINDATA.homeData.wareHouse.projects[indexKe].id,  successCompletion: { (projectDetail) in
            ACData.PROJECTDETAILMODEL = projectDetail
            SVProgressHUD.dismiss()
            let vc = WarehouseDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
}

extension HomeViewController: HomeLocationHeaderTableViewCellDelegate, HomeApartmentHeaderTableViewCellDelegate, HomeLandedPropertyHeaderTableViewCellDelegate, HomeWarehouseHeaderTableViewCellDelegate {
    func moreLocationPressed() {
        ACRequest.GET_CITY_LIST(successCompletion: { (getHomeData) in
            ACData.HOMEDATAMODEL = getHomeData
            SVProgressHUD.dismiss()
            let vc = LocationListViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func moreApartmentPressed() {
        ACRequest.GET_PROJECT_LIST(limitPage: "5", page: "1", selectCityId: ACData.LOGINDATA.homeData.apartment.categoryId, selectCategoryId: ACData.LOGINDATA.homeData.apartment.categoryId,  successCompletion: { (projectList) in
            ACData.PROJECTLISTMODEL = projectList
            SVProgressHUD.dismiss()
                    let vc = ApartmentMoreViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
    func moreLandedPropertyPressed() {
        print("more landed property pressed")
        
        let vc = LandedPropertyMoreViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func moreWarehousePressed() {
        print("warehouse pressed")
        
        let vc = WarehouseMoreViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
