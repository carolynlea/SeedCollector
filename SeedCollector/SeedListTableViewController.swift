//
//  SeedListTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class SeedListTableViewController: UITableViewController
{
    var seedsController = SeedsController()
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return seedsController.seeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! SeedListTableViewCell
        
        let seed = seedsController.seeds[indexPath.row]
        cell.seed = seed
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
            let seed = seedsController.seeds[indexPath.row]
            seedsController.deleteSeed(seed: seed, context: backgroundMoc)
            tableView.reloadData()
        }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let tabbarController = segue.destination as! UITabBarController
        let detailView = tabbarController.viewControllers?.first as! SeedDetailTableViewController
        
        detailView.seedsController = seedsController
        detailView.tabBarItem.title = "Detail"
        
        if segue.identifier == "ShowAddView"
        {
            detailView.titleLabel.text = "Add New Seed"
            
        }
        else if segue.identifier == "ShowEditView"
        {
            if let indexPath = tableView.indexPathForSelectedRow
            {
                detailView.seed = seedsController.seeds[indexPath.row]
                detailView.titleLabel.text = seedsController.seeds[indexPath.row].seedName
                detailView.imageData = seedsController.seeds[indexPath.row].seedImage
            }
        }
        else if segue.identifier == "ShowTrackView"
        {
            
        }
    }
    

}



/*
 *****Code repository. Remove in final version****
 
     let navController = tabbarController.viewControllers?.first as? UINavigationController
     let detailView = navController?.viewControllers.first as? SeedDetailTableViewController
     let detailView = segue.destination as! SeedDetailTableViewController
 https://www.thespruce.com/corms-different-from-bulbs-tubers-and-rhizomes-2131032
 */
