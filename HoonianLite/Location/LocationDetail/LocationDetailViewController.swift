//
//  LocationDetailViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class LocationDetailViewController: UIViewController {

    @IBOutlet weak var apartmentImageView: UIImageView!
    @IBOutlet weak var landedImageView: UIImageView!
    @IBOutlet weak var warehouseImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var passedType: String = "Apartment"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
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
    }
    
    @objc func apartmentAction() {
        print("apartment pressed")
        passedType = "Apartment"
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    @objc func landedAction() {
        print("landed pressed")
        passedType = "Landed"
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }
    
    @objc func warehouseAction() {
        print("warehouse pressed")
        passedType = "Warehouse"
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
    }

}

extension LocationDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if passedType == "Apartment" {
            return 8
        }
        else if passedType == "Landed" {
            return 1
        }
        else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if passedType == "Apartment" {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "apartmentLocationDetailTableViewCell", for: indexPath) as? ApartmentLocationDetailTableViewCell)!
            
            return cell
        }
        else if passedType == "Landed" {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "landedLocationDetailTableViewCell", for: indexPath) as? LandedLocationDetailTableViewCell)!
            
            return cell
        }
        else {
            let cell = (tableView.dequeueReusableCell(withIdentifier: "warehouseLocationDetailTableViewCell", for: indexPath) as? WarehouseLocationDetailTableViewCell)!
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if passedType == "Apartment" {
            let vc = ApartmentDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if passedType == "Landed" {
            
        }
        else {
            
        }
    }
}
