//
//  TwoTextFieldCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class TwoTextFieldCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource
{
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    var needsPicker: Bool = false
    let textPicker = UIPickerView()
    var pickerData: [String] = []
    var typePickerData: [String] = ["Annual", "Perennial", "Biennial"]
    var sunPickerData: [String] = ["Full Sun", "Full Shade", "Full Sun/Part Shade", "Dappled Light", "Add New"]
    
    public func configureOne(text: String, placeholder: String, labelText: String, needsPicker: Bool)
    {
        textFieldOne.text = text
        textFieldOne.placeholder = placeholder
        labelOne.text = labelText
    }
    
    public func configureTwo(text: String, placeholder: String, labelText: String, needsPicker: Bool)
    {
        textFieldTwo.text = text
        textFieldTwo.placeholder = placeholder
        labelTwo.text = labelText
    }
    
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
        textFieldOne.text = pickerData[row]
        textFieldTwo.text = pickerData[row]
    }
    
}
