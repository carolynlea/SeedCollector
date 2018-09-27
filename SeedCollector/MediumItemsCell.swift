//
//  MediumItemsCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class MediumItemsCell: UITableViewCell
{
    @IBOutlet weak var daysToGerminationTextField: UITextField!
    @IBOutlet weak var secondDayTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultsLabel: UILabel!
    
    func getInt()
    {
        let convertedNumber:Int? = Int(daysToGerminationTextField.text ?? "")
        let secondNumber:Int? = Int(secondDayTextField.text ?? "")

        var firstDayfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .day, value: convertedNumber ?? 0, to: Date(), options: [])!
        }
        
        var secondDayfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .day, value: secondNumber ?? 0, to: Date(), options: [])!
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let firstDateString = dateFormatter.string(from: firstDayfromNow)
        let secondDateString = dateFormatter.string(from: secondDayfromNow)
        
        print(firstDayfromNow)
        print(secondDayfromNow)
        
        resultsLabel.text = "Based on the days given, begin looking for seedlings to emerge on \(firstDateString) and \(secondDateString)"
    }
}
