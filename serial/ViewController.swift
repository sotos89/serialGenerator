//
//  ViewController.swift
//  serial
//
//  Created by giannis  on 08/02/2020.
//  Copyright © 2020 giannis . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ServerId: UITextField!
    
    let application = ["Βασική", "Εισαγωγική", "Επιχειρησιακή"]
    
    var selectedApplication: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createApplicatioPicker()
        createToobar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Picker selection
    func createApplicatioPicker(){
        let appPicker = UIPickerView()
        appPicker.delegate = self
        ServerId.inputView = appPicker
    }
    // Toolbar with "done" button on picker
    func createToobar(){
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style:.plain, target: self, action:#selector(ViewController.dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        ServerId.inputAccessoryView = toolBar
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return application.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return application[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedApplication = application[row]
        ServerId.text = selectedApplication
    }
}
