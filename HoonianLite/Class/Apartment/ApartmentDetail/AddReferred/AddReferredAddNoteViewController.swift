//
//  AddReferredAddNoteViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class AddReferredAddNoteViewController: UIViewController {
    
    
    @IBOutlet weak var addNoteView: UIView!
    @IBOutlet weak var addNoteLabel: UILabel!
    @IBOutlet weak var addNoteTextView: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    
    func config() {
        saveButton.layer.masksToBounds = true
        saveButton.layer.cornerRadius = 5
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 5
        addNoteTextView.layer.masksToBounds = true
        addNoteTextView.layer.cornerRadius = 5
        addNoteView.layer.masksToBounds = true
        addNoteView.layer.cornerRadius = 5
        
        addNoteTextView.layer.borderWidth = 0.5
        addNoteTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        addNoteView.layer.borderWidth = 0.5
        addNoteView.layer.borderColor = UIColor.lightGray.cgColor
        
        saveButton.widthAnchor.constraint(equalToConstant: addNoteView.frame.width / 2 - 40).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: addNoteView.frame.width / 2 - 40).isActive = true
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
    }
    
    @objc func saveButtonAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelButtonAction() {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
}
