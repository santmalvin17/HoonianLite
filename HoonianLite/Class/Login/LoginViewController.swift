//
//  LoginViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func config() {
        let colors = Colors()
        
        self.view.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        backgroundLayer!.frame = view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
        self.navigationController?.isNavigationBarHidden = true
        
        phoneNumberTextField.attributedPlaceholder = NSAttributedString(string: "Phone number", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 5
        
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonAction), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(createAccountButtonAction), for: .touchUpInside)
    }
    
    @objc func loginButtonAction() {
        ACRequest.POST_LOGIN(phoneNumber: phoneNumberTextField.text!, password: passwordTextField.text!,successCompletion: { (loginData) in
            ACData.LOGINDATA = loginData
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            appDelegate?.goToHome()
        }) { (message) in
            SVProgressHUD.dismiss()
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    @objc func forgotPasswordButtonAction() {
        let vc = ForgotPassswordViewController()
        vc.validate = "verify"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func createAccountButtonAction() {
        let vc = RegisterViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
