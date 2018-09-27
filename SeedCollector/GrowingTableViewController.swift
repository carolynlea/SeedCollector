//
//  GrowingTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class GrowingTableViewController: UITableViewController
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
    var growingCalculationCell = GrowingCalculationCell()
    var singleRowCell = SingleRowCell()
    var hardeningRowCell = HardeningTableViewCell()
    var doubleRowCell = DoubleRowCell()
    var gardenLocationCell = GardenLocationCell()
    var harvestCell = HarvestTableViewCell()
    var growingNotesCell = GrowingNotesCell()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        makeViews()
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        print("seed = \(String(describing: seed?.seedName))")
        
        
        saveView.isHidden = false
        titleView.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        saveView.isHidden = true
        titleView.isHidden = true
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
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            growingCalculationCell = tableView.dequeueReusableCell(withIdentifier: "GrowingCalculationCell") as! GrowingCalculationCell
            
            growingCalculationCell.cycleNameLabel.text = seed?.seedName
            
            return growingCalculationCell
        }
        if indexPath.row == 1
        {
            singleRowCell = tableView.dequeueReusableCell(withIdentifier: "SingleRowCell") as! SingleRowCell
            return singleRowCell
        }
        if indexPath.row == 2
        {
            hardeningRowCell = tableView.dequeueReusableCell(withIdentifier: "HardeningRow") as! HardeningTableViewCell
            return hardeningRowCell
        }
        if indexPath.row == 3
        {
            doubleRowCell = tableView.dequeueReusableCell(withIdentifier: "DoubleRowCell") as! DoubleRowCell
            return doubleRowCell
        }
        if indexPath.row == 4
        {
            gardenLocationCell = tableView.dequeueReusableCell(withIdentifier: "GardenLocationCell") as! GardenLocationCell
            return gardenLocationCell
        }
        if indexPath.row == 5
        {
            harvestCell = tableView.dequeueReusableCell(withIdentifier: "HarvestCell") as! HarvestTableViewCell
            return harvestCell
        }
        else
        {
            growingNotesCell = tableView.dequeueReusableCell(withIdentifier: "GrowingNotesCell") as! GrowingNotesCell
            return growingNotesCell
        }
        
    }
    
    @IBAction func saveInfo(_ sender: Any)
    {
        print("growing info saved")
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
