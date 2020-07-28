//
//  ChangePasswordViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextField: UITextField!

    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }
    
    func config() {
        changePasswordButton.layer.masksToBounds = true
        changePasswordButton.layer.cornerRadius = 5
        
        changePasswordButton.addTarget(self, action: #selector(changePasswordButtonAction), for: .touchUpInside)
    }
    
    @objc func changePasswordButtonAction() {
        let parameter: Parameters = [
            "id":ACData.LOGINDATA.agent.id,
            "old_password":oldPasswordTextField.text!,
            "new_password":newPassword.text!,
            "confirm_password":confirmPassword.text!
        ]
        print(parameter)
        ACRequest.PUT_CHANGE_PASSWORD(parameters: parameter, successCompletion: { (result) in
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
    
}
