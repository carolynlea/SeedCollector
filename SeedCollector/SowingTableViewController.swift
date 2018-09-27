//
//  SowingTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/25/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class SowingTableViewController: UITableViewController, UITextFieldDelegate, UIPickerViewDelegate
{
    var seedsController: SeedsController?
    var seed: Seed?
    {
        get
        {
            return (self.tabBarController!.viewControllers![0] as! SeedDetailTableViewController).seed
        }
        set
        {
            (self.tabBarController!.viewControllers![0] as! SeedDetailTableViewController).seed = newValue
        }
    }
    var sowingController: SowingController?
    var sowingData: SowingData?
    let saveView = UIView()
    let titleView = UIView()
    var titleLabel = UILabel()
    let datePicker: UIDatePicker = UIDatePicker()
    var manyItemsCell = ManyItemsCell()
    var mediumItemsCell = MediumItemsCell()
    var smallItemsCell = SmallItemsCell()
    var fiveItemCell = FiveItemCell()
    var germinationNotesCell = GerminationNotesCell()
    
    let aDate = Calendar.current.date(byAdding: .day, value: 5, to: Date()/*datePicker.date*/)
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        print("seed = \(String(describing: seed?.seedName))")
        
        
        saveView.isHidden = false
        titleView.isHidden = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        sowingController?.loadFromPersistentStore()
        makeViews()
        
        if seed == nil
        {
            print("First create a seed")
        }
        var firstDate: Int = 7
        var daysfromNow: Date {
            return (Calendar.current as NSCalendar).date(byAdding: .day, value: firstDate, to: Date(), options: [])!
        }
        print(daysfromNow)
        
        let monthsToAdd = 2
        let daysToAdd = 1
        let yearsToAdd = 1
        let currentDate = getCurrentDate()
        
        var dateComponent = DateComponents()
        
        dateComponent.month = monthsToAdd
        dateComponent.day = daysToAdd
        dateComponent.year = yearsToAdd
        
        let futureDate = Calendar.current.date(byAdding: dateComponent, to: currentDate)
        
        print(currentDate)
        print(futureDate!)
//        print(aDate!)
        
        let weather = WeatherGetter()
        weather.getWeather(city: "Boise")
        //self.view.addSubview(datePicker)
    }
    
    @IBAction func getTemps(_ sender: Any)
    {
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        
        
        saveView.isHidden = true
        titleView.isHidden = true
    }
    
    func daysBetweenDates(startDate: Date, endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([Calendar.Component.day], from: startDate, to: endDate)
        return components.day!
    }
    
    func getCurrentDate()-> Date
    {
        var now = Date()
        var nowComponents = DateComponents()
        let calendar = Calendar.current
        nowComponents.year = Calendar.current.component(.year, from: now)
        nowComponents.month = Calendar.current.component(.month, from: now)
        nowComponents.day = Calendar.current.component(.day, from: now)
        nowComponents.hour = Calendar.current.component(.hour, from: now)
        nowComponents.minute = Calendar.current.component(.minute, from: now)
        nowComponents.second = Calendar.current.component(.second, from: now)
        nowComponents.timeZone = NSTimeZone.local
        now = calendar.date(from: nowComponents)!
        return now as Date
    }
    
    func makeViews()
    {
        saveView.frame = CGRect(x: view.bounds.size.width - 95, y: 48, width: 90, height: 91)
        
        let saveButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        saveButton.frame = CGRect(x: 0, y: 0, width: 80, height: 81)
        saveButton.setBackgroundImage(UIImage(named:"saveFlower"), for: .normal)
        saveButton.addTarget(self, action: #selector(saveInfo), for:.touchUpInside)
        
        saveView.addSubview(saveButton)
        self.navigationController?.view.addSubview(saveView)
        
        titleView.frame = CGRect(x: 0, y: 85, width: 250, height: 60)
        
        titleLabel = UILabel(frame: CGRect(x: 10, y: 0, width: 230, height: 50))
        titleLabel.font = UIFont(name: "Baskerville-Bold", size: 40)
        titleLabel.textColor = UIColor.white
        if seed?.seedName != nil
        {
            titleLabel.text = seed?.seedName
        }
        else
        {
            titleLabel.text = "Add New Seed"
        }
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleView.addSubview(titleLabel)
        
        self.navigationController?.view.addSubview(titleView)
    }
    @IBAction func calculateDate(_ sender: Any)
    {
        mediumItemsCell.getInt()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            manyItemsCell = tableView.dequeueReusableCell(withIdentifier: "ManyItemsCell", for: indexPath) as! ManyItemsCell
            
            manyItemsCell.sowingData = sowingData
            
            return manyItemsCell
        }
        if indexPath.row == 1
        {
            mediumItemsCell = tableView.dequeueReusableCell(withIdentifier: "MediumItemsCell", for: indexPath) as! MediumItemsCell
            return mediumItemsCell
        }
        if indexPath.row == 2
        {
            smallItemsCell = tableView.dequeueReusableCell(withIdentifier: "SmallItemsCell", for: indexPath) as! SmallItemsCell
            return smallItemsCell
        }
        if indexPath.row == 3
        {
            fiveItemCell = tableView.dequeueReusableCell(withIdentifier: "FiveItemCell", for: indexPath) as! FiveItemCell
            return fiveItemCell
        }
        else
        {
            germinationNotesCell = tableView.dequeueReusableCell(withIdentifier: "GerminationNotesCell", for: indexPath) as! GerminationNotesCell
            return germinationNotesCell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 201
        }
        if indexPath.row == 1
        {
            return 188
        }
        if indexPath.row == 2
        {
            return 51
        }
        if indexPath.row == 3
        {
            return 92
        }
        else 
        {
            return 227
        }
    }
    @IBAction func saveInfo(_ sender: Any)
    {
       
        print("sowing info saved")
    }
    
    func createDatePicker()
    {
        
//        datePicker.frame = CGRect(x:0, y: view.frame.height - view.frame.height + 200, width: self.view.frame.width, height: 200)
//        datePicker.datePickerMode = .date
//        datePicker.timeZone = NSTimeZone.local
//        datePicker.backgroundColor = UIColor.white
//        datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
//        self.view.addSubview(datePicker)
    }
    
    @objc func datePickerValueChanged(_ sender: UIDatePicker)
    {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm"
        let selectedDate: String = dateFormatter.string(from: sender.date)
        
        manyItemsCell.sowingDateTextField.text = selectedDate
        print("selected value \(selectedDate)")
    }
    
    // MARK: - Textfield delegates
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 254.0/255.0, green: 101.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
        manyItemsCell.sowingDateTextField.inputView = datePicker
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 186.0/255.0, green: 186.0/255.0, blue: 186.0/255.0, alpha: 0.6).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        
        manyItemsCell.sowingDateTextField.resignFirstResponder()
    }
}

extension Date {
    func asString(style: DateFormatter.Style) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: self)
        
//        let myDate = Date()
//        myDate.asString(style: .full)   // Wednesday, January 10, 2018
//        myDate.asString(style: .long)   // January 10, 2018
//        myDate.asString(style: .medium) // Jan 10, 2018
//        myDate.asString(style: .short)  // 1/10/18
    }
}
