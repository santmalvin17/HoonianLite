//
//  ForgotPassswordViewController.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ForgotPassswordViewController: UIViewController {
    
    @IBOutlet weak var buttonLabel: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    var validate = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
        doneButton()
        // Do any additional setup after loading the view.
    }
    
    func doneButton(){
        let datePickerToolbar = UIToolbar()
        datePickerToolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        doneButton.tag = passwordTextField.tag
        doneButton.tag = confirmTextField.tag
        datePickerToolbar.setItems([doneButton], animated: false)
        datePickerToolbar.isUserInteractionEnabled = true
        passwordTextField.inputAccessoryView = datePickerToolbar
        confirmTextField.inputAccessoryView = datePickerToolbar
        
    }
    
    func config() {
        let colors = Colors()
        
        self.view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        
        if validate == "verify"{
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            passwordTextField.isSecureTextEntry = false
            confirmTextField.attributedPlaceholder = NSAttributedString(string: "Phone Number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            confirmTextField.keyboardType = .numberPad
            confirmTextField.isSecureTextEntry = false
        }else{
            passwordTextField.attributedPlaceholder = NSAttributedString(string: "New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            passwordTextField.isSecureTextEntry = true
            confirmTextField.attributedPlaceholder = NSAttributedString(string: "Confirm New Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            confirmTextField.isSecureTextEntry = true
        }
        
        buttonLabel.layer.masksToBounds = true
        buttonLabel.layer.cornerRadius = 5
        
        
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        if passwordTextField.text == "" || confirmTextField.text == ""{
            let alert = UIAlertController(title: "Error", message: "Data still empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
        if validate == "verify"{
        let vc = ForgotPassswordViewController()
        vc.validate = ""
        self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = LoginViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        }
    }
    
    @objc func dismissKeyboard(on: UIButton){
        view.endEditing(true)
    }
    
    
}
