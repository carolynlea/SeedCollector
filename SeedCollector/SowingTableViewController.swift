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
    
    var multiTextFieldCell = MultiTextFieldSowingCell()
    var depthTextField: UITextField!
    var spacingTextField: UITextField!
    var heightTextField: UITextField!
    var widthTextField: UITextField!
    
    
    
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
        saveButton.addTarget(self, action: #selector(saveSowingInfo), for:.touchUpInside)
        
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
        cell.textLabel?.text = seed?.seedName
        return cell
    }
    
    @IBAction func saveSowingInfo(_ sender: Any)
    {
        print("info saved")
    }
}
