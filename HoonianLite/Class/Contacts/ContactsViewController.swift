//
//  ContactsViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTable()
    }
    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactListTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactListTableViewCellID")
    }
    
    
    
}

extension ContactsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ACData.CONTACTLISTMODEL.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactListTableViewCellID", for: indexPath) as? ContactListTableViewCell)!
        cell.position = 0
        cell.detailObj = ACData.CONTACTLISTMODEL
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ContactDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
