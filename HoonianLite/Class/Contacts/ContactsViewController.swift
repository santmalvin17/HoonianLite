//
//  ContactsViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import ContactsUI

class ContactsViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {

        
        super.viewDidLoad()
        configTable()
      }
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }
    
    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "Contacts", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }



    func configTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactListTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactListTableViewCellID")
    }
    
    @IBAction func addContactClicked(_ sender: Any) {
        CNContactStore().requestAccess(for: .contacts) { (access, error) in
          print("Access: \(access)")
        }
        let contacVC = CNContactPickerViewController()
        contacVC.delegate = self
        self.present(contacVC , animated: true, completion: nil)
    }
    
    
}

extension ContactsViewController:CNContactPickerDelegate{
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
        let name = CNContactFormatter.string(from: contact, style: .fullName)
        let numbers = contact.phoneNumbers.first
        let vc = EditContactViewController()
        vc.nameText = name!
        vc.phoneText = (numbers?.value)?.stringValue ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
          
    }

    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension ContactsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ACData.CONTACTLISTMODEL.contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "ContactListTableViewCellID", for: indexPath) as? ContactListTableViewCell)!
        cell.position = indexPath.row
        cell.detailObj = ACData.CONTACTLISTMODEL
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ACRequest.GET_CONTACT_DETAIL(agentId: ACData.LOGINDATA.agent.id, id: ACData.CONTACTLISTMODEL.contacts[indexPath.row].id,successCompletion: { (getContactDetail) in
            ACData.CONTACTDETAILMODEL = getContactDetail
            SVProgressHUD.dismiss()
            let vc = ContactDetailViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
                       let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    
}
