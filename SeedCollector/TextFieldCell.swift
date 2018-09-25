//
//  TextFieldCell.swift
//  SavingSeeds
//
//  Created by Carolyn Lea on 9/14/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var inputTextField: UITextField!
    
    var needsPicker: Bool = false
    let textPicker = UIPickerView()
    var pickerData: [String] = []
    var typePickerData: [String] = ["", "Annual", "Perennial", "Biennial"]
    var sunPickerData: [String] = ["", "Full Sun", "Full Shade", "Full Sun/Light Shade", "Dappled Light"]
    
    
    // MARK: - PickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputTextField.text = pickerData[row]
    }
    
    //MARK: - TextField
    
    public func configure(text: String, placeholder: String, needsPicker: Bool)
    {
        if needsPicker
        {
            textPicker.delegate = self
            inputTextField.inputView = textPicker
        }
        
        inputTextField.text = text
        inputTextField.placeholder = placeholder
        
    }
}
