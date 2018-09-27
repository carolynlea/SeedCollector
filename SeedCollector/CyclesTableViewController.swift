//
//  CyclesTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class CyclesTableViewController: UITableViewController
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
    
    let saveView = UIView()
    let titleView = UIView()
    var titleLabel = UILabel()
    
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
        let addButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        addButton.frame = CGRect(x: 0, y: 0, width: 80, height: 81)
        addButton.setBackgroundImage(UIImage(named:"plusFlower"), for: .normal)
        addButton.addTarget(self, action: #selector(add), for:.touchUpInside)
        
        saveView.addSubview(addButton)
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GerminationCycleCell", for: indexPath)

        cell.textLabel?.text = seed?.seedName

        return cell
    }

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    
    // MARK: - Navigation

    @IBAction func add(_ sender: Any)
    {
        performSegue(withIdentifier: "ShowAddSowingView", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let sowingView = segue.destination as! SowingTableViewController
        
        if segue.identifier == "ShowAddSowingView"
        {
           sowingView.seedsController = seedsController
        }
        else if segue.identifier == "ShowEditSowingView"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                sowingView.seedsController = seedsController
                sowingView.seed = seedsController?.seeds[indexPath.row]
            }
        }
        
    }
    

}
