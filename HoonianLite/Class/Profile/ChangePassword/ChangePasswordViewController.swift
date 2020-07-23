//
//  ChangePasswordViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 23/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UILabel!
    @IBOutlet weak var confirmNewPasswordTextField: UILabel!
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
        print("change password button pressed")
    }
    
}
