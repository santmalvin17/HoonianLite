//
//  EditProfileViewController.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class EditProfileViewController: UIViewController {
    
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var profile = false
    var imageNya = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        configTable()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageProfile.isUserInteractionEnabled = true
        imageProfile.addGestureRecognizer(tapGestureRecognizer)
        imageProfile.layer.cornerRadius = 50
        imageProfile.clipsToBounds = true
    }
    
    func configTable(){
        tableView.register(UINib(nibName: "EditTableViewCell", bundle: nil), forCellReuseIdentifier: "EditTableViewCellID")
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    
    
}

extension EditProfileViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "EditTableViewCellID", for: indexPath) as? EditTableViewCell)!
        cell.delegate = self
        if profile{
            cell.idPhoto.image = imageNya
            profile = false
        }
        return cell
    }
    
    
}

extension EditProfileViewController:EditTableViewCellDelegate{
    func saveClicked(name:String,phone:String,id:String,bank:String,account:String,email:String,address:String,company:String,position:String,birth:String,birthPlace:String) {
        let parameter: Parameters = [
            "id":ACData.LOGINDATA.agent.id,
            "name":name,
            "phone_number":phone,
            "email":email,
            "id_card_number":id,
            "account_bank":bank,
            "account_number":account,
            "birth_date":birth,
            "birth_place":birthPlace,
            "address":address,
            "position":position
        ]
        print(parameter)
        ACRequest.PUT_UPDATE_PROFILE(parameters: parameter, successCompletion: { (result) in
            SVProgressHUD.dismiss()
            ACRequest.GET_PROFILE( agentId: ACData.LOGINDATA.agent.id, successCompletion: { (profileData) in
                ACData.PROFILEMODEL = profileData
                SVProgressHUD.dismiss()
                ACRequest.GET_PROFILE( agentId: ACData.LOGINDATA.agent.id, successCompletion: { (profileData) in
                    ACData.PROFILEMODEL = profileData
                    SVProgressHUD.dismiss()
                    self.navigationController?.popToRootViewController(animated: true)
                }) { (message) in
                }

            }) { (message) in
            }

        }) { (message) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func idPhotoClicked(idcard:Bool) {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        profile = idcard
    }
    
    
}

extension EditProfileViewController:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        dismiss(animated: true)
        if profile{
            imageNya = image
            tableView.reloadData()
        }else{
            imageProfile.image = image
        }
        
        
    }
}
