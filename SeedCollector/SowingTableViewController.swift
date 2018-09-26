//
//  SowingTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/25/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class SowingTableViewController: UITableViewController, UITextFieldDelegate
{
    var seedsController: SeedsController?
    var seed: Seed?
    {
        get {
            return (self.tabBarController!.viewControllers![0] as! SeedDetailTableViewController).seed
        }
        set {
            (self.tabBarController!.viewControllers![0] as! SeedDetailTableViewController).seed = newValue
        }
    }
    
    let saveView = UIView()
    let titleView = UIView()
    var titleLabel = UILabel()
    
    
    
    
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
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        
        saveView.isHidden = true
        titleView.isHidden = true
    }
    
    func makeViews()
    {
        saveView.frame = CGRect(x: view.bounds.size.width - 95, y: 48, width: 90, height: 91)
        
        let saveButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        saveButton.frame = CGRect(x: 0, y: 0, width: 80, height: 81)
        saveButton.setBackgroundImage(UIImage(named:"sunLike"), for: .normal)
        saveButton.addTarget(self, action: #selector(addSowingInfo), for:.touchUpInside)
        
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = ""//seed?.seedName
        cell.detailTextLabel?.text = aDate?.asString(style: .full)
        return cell
    }
    
    @IBAction func addSowingInfo(_ sender: Any)
    {
        print("info saved")
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
