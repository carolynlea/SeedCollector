//
//  RecordsCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class RecordsCell: UITableViewCell
{
    @IBOutlet weak var cycleNameTextField: UILabel!
    @IBOutlet weak var sowedNumberLabel: UILabel!
    @IBOutlet weak var sproutedNumberLabel: UILabel!
    @IBOutlet weak var plantedNumberLabel: UILabel!
    @IBOutlet weak var harvestedNumberLabel: UILabel!
    
    @IBOutlet weak var sowedMonthLabel: UILabel!
    @IBOutlet weak var sproutedMonthLabel: UILabel!
    @IBOutlet weak var plantedMonthLabel: UILabel!
    @IBOutlet weak var harvestedMonthLabel: UILabel!

    @IBOutlet weak var chartCollectionView: UICollectionView!
}
