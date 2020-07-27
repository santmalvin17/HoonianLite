//
//  LocationDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var landedImageView: UIImageView!
    @IBOutlet weak var warehouseImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var passedType: String = "Apartment"
    var position = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }
    
    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "\(ACData.LOGINDATA.homeData.cities[position].name)", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }

    func config() {
        apartmentImageView.layer.masksToBounds = true
        apartmentImageView.layer.cornerRadius = apartmentImageView.frame.height / 2
        landedImageView.layer.masksToBounds = true
        landedImageView.layer.cornerRadius = apartmentImageView.frame.height / 2
        warehouseImageView.layer.masksToBounds = true
        warehouseImageView.layer.cornerRadius = apartmentImageView.frame.height / 2
        
        let apartmentTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(apartmentAction))
        let landedTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(landedAction))
        let warehouseTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(warehouseAction))
        
        apartmentImageView.isUserInteractionEnabled = true
        apartmentImageView.addGestureRecognizer(apartmentTapGestureRecognizer)
        landedImageView.isUserInteractionEnabled = true
        landedImageView.addGestureRecognizer(landedTapGestureRecognizer)
        warehouseImageView.isUserInteractionEnabled = true
        warehouseImageView.addGestureRecognizer(warehouseTapGestureRecognizer)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ApartmentLocationDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "apartmentLocationDetailTableViewCell")
        tableView.register(UINib(nibName: "LandedLocationDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "landedLocationDetailTableViewCell")
        tableView.register(UINib(nibName: "WarehouseLocationDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "warehouseLocationDetailTableViewCell")
        tableView.register(UINib(nibName: "NoDataTableViewCell", bundle: nil), forCellReuseIdentifier: "NoDataTableViewCellID")
    }
    
    @objc func apartmentAction() {
        print("apartment pressed")
        passedType = "Apartment"
        ACRequest.GET_PROJECT_LIST(limitPage: "5", page: "1", selectCityId: ACData.LOGINDATA.homeData.cities[position].id, selectCategoryId: ACData.PROJECTLISTMODEL.projectCategory[0].id,  successCompletion: { (projectList) in
            ACData.PROJECTLISTMODEL = projectList
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }


    }
    
    @objc func landedAction() {
        print("landed pressed")
        passedType = "Landed"
        ACRequest.GET_PROJECT_LIST(limitPage: "5", page: "1", selectCityId: ACData.LOGINDATA.homeData.cities[position].id, selectCategoryId: ACData.PROJECTLISTMODEL.projectCategory[1].id,  successCompletion: { (projectList) in
            ACData.PROJECTLISTMODEL = projectList
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }


    }
    
    @objc func warehouseAction() {
        print("warehouse pressed")
        passedType = "Warehouse"
        ACRequest.GET_PROJECT_LIST(limitPage: "5", page: "1", selectCityId: ACData.LOGINDATA.homeData.cities[position].id, selectCategoryId: ACData.PROJECTLISTMODEL.projectCategory[2].id,  successCompletion: { (projectList) in
            ACData.PROJECTLISTMODEL = projectList
            SVProgressHUD.dismiss()
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }


    }

}

extension LocationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ACData.PROJECTLISTMODEL.projects.count == 0{
            return 1
        }else{
        if passedType == "Apartment" {
            print(ACData.PROJECTLISTMODEL.projects.count)
            return ACData.PROJECTLISTMODEL.projects.count
        }
        else if passedType == "Landed" {
            return ACData.PROJECTLISTMODEL.projects.count
        }
        else {
            return ACData.PROJECTLISTMODEL.projects.count
        }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ACData.PROJECTLISTMODEL.projects.count == 0 {
          let cell = (tableView.dequeueReusableCell(withIdentifier: "NoDataTableViewCellID", for: indexPath) as? NoDataTableViewCell)!
            return cell
        }else{
        if passedType == "Apartment" {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentLocationDetailTableViewCell", for: indexPath) as? ApartmentLocationDetailTableViewCell)!
            cell.detailObj = ACData.PROJECTLISTMODEL.projects[indexPath.row]
            return cell
        }
        else if passedType == "Landed" {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "landedLocationDetailTableViewCell", for: indexPath) as? LandedLocationDetailTableViewCell)!
            cell.detailObj = ACData.PROJECTLISTMODEL.projects[indexPath.row]
            return cell
        }
        else {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "warehouseLocationDetailTableViewCell", for: indexPath) as? WarehouseLocationDetailTableViewCell)!
            cell.detailObj = ACData.PROJECTLISTMODEL.projects[indexPath.row]
            return cell
        }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if passedType == "Apartment" {
            ACRequest.GET_PROJECT_DETAIL(id: ACData.PROJECTLISTMODEL.projects[indexPath.row].id,  successCompletion: { (projectDetail) in
                ACData.PROJECTDETAILMODEL = projectDetail
                SVProgressHUD.dismiss()
                let vc = ApartmentDetailViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }) { (message) in
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }

        }
        else if passedType == "Landed" {
            
        }
        else {
            
        }
    }
}
