//
//  RegisterViewController.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class RegisterViewController: UIViewController {

 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var idNoTextField: UITextField!
    @IBOutlet weak var bankTextField: UITextField!
    @IBOutlet weak var accountNoTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    var thePicker = UIPickerView()
    var myPickerData = [String]()
    var pickerViewSelect = ""
    var selectKe = 0
    override func viewDidLoad() {
         super.viewDidLoad()
         self.thePicker.delegate = self
         self.thePicker.dataSource = self
         config()
        doneButton()
     }
    
    

    
    func doneButton(){
        let datePickerToolbar = UIToolbar()
        datePickerToolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        doneButton.tag = bankTextField.tag
        doneButton.tag = nameTextField.tag
        doneButton.tag = phoneNumberTextField.tag
        doneButton.tag = passwordTextField.tag
        doneButton.tag = idNoTextField.tag
        doneButton.tag = accountNoTextField.tag
        datePickerToolbar.setItems([doneButton], animated: false)
        datePickerToolbar.isUserInteractionEnabled = true
        nameTextField.inputAccessoryView = datePickerToolbar
        phoneNumberTextField.inputAccessoryView = datePickerToolbar
        passwordTextField.inputAccessoryView = datePickerToolbar
        idNoTextField.inputAccessoryView = datePickerToolbar
        accountNoTextField.inputAccessoryView = datePickerToolbar
        bankTextField.inputAccessoryView = datePickerToolbar
    }
    @objc func dismissKeyboard(on: UIButton){
        view.endEditing(true)
    }
     
     func config() {
         let colors = Colors()
         
         self.view.backgroundColor = UIColor.clear
         let backgroundLayer = colors.gl
         backgroundLayer!.frame = view.frame
         view.layer.insertSublayer(backgroundLayer!, at: 0)
         self.navigationController?.isNavigationBarHidden = true
         
         nameTextField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
         
         passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        idNoTextField.attributedPlaceholder = NSAttributedString(string: "Id Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        bankTextField.attributedPlaceholder = NSAttributedString(string: "Bank", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        accountNoTextField.attributedPlaceholder = NSAttributedString(string: "Account Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 5
        bankTextField.inputView = thePicker
        myPickerData.append("Select Bank")
        for data in 0..<ACData.BANKMODEL.bankData.count{
            myPickerData.append(ACData.BANKMODEL.bankData[data].name)
        }
         
     }
    @IBAction func registerAction(_ sender: Any) {
        let parameter: Parameters = [
            "name":nameTextField.text!,
            "password":passwordTextField.text!,
            "country_code":"+62",
            "phone_number":phoneNumberTextField.text!,
            "id_card_number":idNoTextField.text!,
            "bank_id":ACData.BANKMODEL.bankData[selectKe-1].id,
            "account_number":accountNoTextField.text!,
        ]
        print(parameter)
        ACRequest.POST_REGISTER(parameters: parameter, successCompletion: { (result) in
            SVProgressHUD.dismiss()
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }) { (message) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
     
     

}

extension RegisterViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bankTextField.text = myPickerData[row]
        return myPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectKe = row
        return pickerViewSelect = myPickerData[row]
        
    }
    
    
}
