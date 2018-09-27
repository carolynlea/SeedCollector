//
//  ThreeTextFieldCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ThreeTextFieldCell: UITableViewCell
{
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    
    public func configureOne(text: String, placeholder: String, labelText: String)
    {
        textFieldOne.text = text
        textFieldOne.placeholder = placeholder
        labelOne.text = labelText
    }
    
    public func configureTwo(text: String, placeholder: String, labelText: String)
    {
        textFieldTwo.text = text
        textFieldTwo.placeholder = placeholder
        labelTwo.text = labelText
    }
    
    public func configureThree(text: String, placeholder: String, labelText: String)
    {
        textFieldThree.text = text
        textFieldThree.placeholder = placeholder
        labelThree.text = labelText
    }

}
