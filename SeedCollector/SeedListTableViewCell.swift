//
//  SeedListTableViewCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class SeedListTableViewCell: UITableViewCell
{
    @IBOutlet weak var seedImageView: UIImageView!
    @IBOutlet weak var seedNameLabel: UILabel!
    @IBOutlet weak var seedVarietyLabel: UILabel!
    
    var seed: Seed?
    {
        didSet
        {
            updateViews()
        }
    }
    
    private func updateViews()
    {
        if let seed = seed
        {
            seedImageView.image = UIImage(named: "seedling")
            seedNameLabel.text = seed.seedName
            seedVarietyLabel.text = seed.seedVariety
        }
    }
}
