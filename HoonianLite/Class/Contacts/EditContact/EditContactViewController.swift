//
//  EditContactViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class EditContactViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var idNumberTextField: UITextField!
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var relationTextField: UITextField!
    var trigerNya:String = ""
    var nameText:String = ""
    var phoneText:String = ""
    var thePicker = UIPickerView()
    var myPickerData = [String]()
    var pickerViewSelect = ""
    var getCityId = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if trigerNya == "Edit"{
            editContactView()
        }else{
            addContactView()
        }
        doneButton()
        
    }
    
    func editContactView(){
        nameTextField.text = ACData.EDITCONTACTDETAIL.contactData.name
        phoneNumberTextField.text = ACData.EDITCONTACTDETAIL.contactData.phoneNumber
        idNumberTextField.text = ACData.EDITCONTACTDETAIL.contactData.idCardNumber
        cityTextField.text = ACData.EDITCONTACTDETAIL.contactData.city
        self.thePicker.delegate = self
        self.thePicker.dataSource = self
        self.myPickerData.append("Select City")
        for data in 0..<ACData.EDITCONTACTDETAIL.cities.count{
            self.myPickerData.append(ACData.EDITCONTACTDETAIL.cities[data].name)
            
            if cityTextField.text == ACData.EDITCONTACTDETAIL.cities[data].name{
                getCityId = data+1
                thePicker.selectRow(getCityId, inComponent: 0, animated: true)
            }
        }
        
        workTextField.text = ACData.EDITCONTACTDETAIL.contactData.occupation
        relationTextField.text = ACData.EDITCONTACTDETAIL.contactData.relation
        cityTextField.inputView = thePicker
    }
    
    func addContactView(){
        ACRequest.GET_CITY_LIST(successCompletion: { (getHomeData) in
            ACData.HOMEDATAMODEL = getHomeData
            SVProgressHUD.dismiss()
            self.myPickerData.append("Select City")
            for data in 0..<ACData.HOMEDATAMODEL.homeData.cities.count{
                self.myPickerData.append(ACData.HOMEDATAMODEL.homeData.cities[data].name)
                self.thePicker.delegate = self
                self.thePicker.dataSource = self
            }
        }) { (message) in
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        nameTextField.text = nameText
        phoneNumberTextField.text = phoneText
        cityTextField.inputView = thePicker
        
    }
    
    func doneButton(){
        let datePickerToolbar = UIToolbar()
        datePickerToolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        doneButton.tag = cityTextField.tag
        datePickerToolbar.setItems([doneButton], animated: false)
        datePickerToolbar.isUserInteractionEnabled = true
        nameTextField.inputAccessoryView = datePickerToolbar
        phoneNumberTextField.inputAccessoryView = datePickerToolbar
        idNumberTextField.inputAccessoryView = datePickerToolbar
        workTextField.inputAccessoryView = datePickerToolbar
        relationTextField.inputAccessoryView = datePickerToolbar
        cityTextField.inputAccessoryView = datePickerToolbar
    }
    @objc func dismissKeyboard(on: UIButton){
        view.endEditing(true)
        if pickerViewSelect == ""{
            cityTextField.text = myPickerData[getCityId]
        }else{
        cityTextField.text = pickerViewSelect
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    @IBAction func saveAction(_ sender: Any) {
        if cityTextField.text == "" || getCityId == 0{
            let alert = UIAlertController(title: "Alert", message: "City Cant be Empty", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
        if trigerNya == "Edit"{
            let parameter: Parameters = [
                "name":nameTextField.text!,
                "phone_number":phoneNumberTextField.text!,
                "id_card_no":idNumberTextField.text!,
                "occupation":workTextField.text!,
                "city_id":ACData.EDITCONTACTDETAIL.cities[getCityId-1].id,
                "relation":relationTextField.text!,
                "note":"",
                "agent_id":ACData.LOGINDATA.agent.id,
                "contact_id":ACData.CONTACTDETAILMODEL.clientData.id,
            ]
            ACRequest.PUT_UPDATE_CONTACT(parameters: parameter, successCompletion: { (result) in
                SVProgressHUD.dismiss()
                self.navigationController?.popToRootViewController(animated: true)
                self.trigerNya = ""
            }) { (message) in
                SVProgressHUD.dismiss()
                ACAlert.show(message: message)
            }
        }else{
        let parameter: Parameters = [
            "agent_id":ACData.LOGINDATA.agent.id,
            "name":nameTextField.text!,
            "phone_number":phoneNumberTextField.text!,
            "id_card_no":idNumberTextField.text!,
            "occupation":workTextField.text!,
            "city_id":ACData.HOMEDATAMODEL.homeData.cities[getCityId-1].id,
            "relation":relationTextField.text!,
            "note":"",
        ]
        ACRequest.POST_ADD_NEW_CONTACT(parameters: parameter, successCompletion: { (result) in
            SVProgressHUD.dismiss()
            self.navigationController?.popToRootViewController(animated: true)
            self.trigerNya = ""
        }) { (message) in
            SVProgressHUD.dismiss()
            ACAlert.show(message: message)
        }
        }
        }
    }
    
    
    
}

extension EditContactViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getCityId = row
        return pickerViewSelect = myPickerData[row]
        
    }
    
}
