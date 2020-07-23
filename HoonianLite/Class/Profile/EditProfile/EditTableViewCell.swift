//
//  EditTableViewCell.swift
//  HoonianLite
//
//  Created by Malvin Santoso on 24/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol EditTableViewCellDelegate{
    func idPhotoClicked(idcard:Bool)
    func saveClicked(name:String,phone:String,id:String,bank:String,account:String,email:String,address:String,company:String,position:String,birth:String,birthPlace:String)
}

class EditTableViewCell: UITableViewCell {
    
    var delegate:EditTableViewCellDelegate?
    
    @IBOutlet weak var nameFied: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var bankField: UITextField!
    @IBOutlet weak var accountField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var companyField: UITextField!
    @IBOutlet weak var positionField: UITextField!
    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var birthPlaceField: UITextField!
    @IBOutlet weak var idPhoto: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    var thePicker = UIPickerView()
    var idcard = true
    var myPickerData = ["SELECT BANK","BCA","MANDIRI","BRI","BNI"]
    var pickerViewSelect = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        thePicker.delegate = self
        thePicker.dataSource = self
        configProfile()
        self.addGestureRecognizer(tap)
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        idPhoto.isUserInteractionEnabled = true
        idPhoto.addGestureRecognizer(tapGestureRecognizer)
        
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)

    }
    
    @objc func saveButtonClicked(){
        delegate?.saveClicked(name: nameFied.text!, phone: phoneField.text!, id: idField.text!, bank: bankField.text!, account: accountField.text!, email: emailField.text!, address: addressField.text!, company: companyField.text!, position: positionField.text!, birth: birthField.text!, birthPlace: birthPlaceField.text!)
       }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        delegate?.idPhotoClicked(idcard: true)
    }
    
    
    func configProfile(){
        nameFied.text = ACData.PROFILEMODEL.agent.name
        phoneField.text = ACData.PROFILEMODEL.agent.phoneNumber
        idField.text = ACData.PROFILEMODEL.agent.idCardNo
        bankField.text = "BCA"
        accountField.text = ACData.PROFILEMODEL.agent.accountNumber
        emailField.text = ACData.PROFILEMODEL.agent.email
        addressField.text = ACData.PROFILEMODEL.agent.address
        companyField.text = "WEKIDDO"
        positionField.text = ACData.PROFILEMODEL.agent.position
        birthField.text = ACData.PROFILEMODEL.agent.birthDate
        birthPlaceField.text = ACData.PROFILEMODEL.agent.birthPlace
        let datePickerToolbar = UIToolbar()
        datePickerToolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        doneButton.tag = bankField.tag
        datePickerToolbar.setItems([doneButton], animated: false)
        datePickerToolbar.isUserInteractionEnabled = true
        bankField.inputAccessoryView = datePickerToolbar
        bankField.inputView = thePicker
        if let index = myPickerData.index(where: { $0 == bankField.text }) {
            thePicker.selectRow(index, inComponent: 0, animated: false)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @objc func dismissKeyboard(){
        self.endEditing(true)
    }
    
}

extension EditTableViewCell:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        bankField.text = myPickerData[row]
        return myPickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return pickerViewSelect = myPickerData[row]
        
    }
    
    
}

