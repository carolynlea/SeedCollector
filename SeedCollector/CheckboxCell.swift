//
//  CheckboxCell.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/26/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

protocol CheckboxCellDelegate: class
{
    func toggleSeedHasBeenChecked(for cell: CheckboxCell)
    func toggleTuberHasBeenChecked(for cell: CheckboxCell)
    func toggleHybridHasBeenChecked(for cell: CheckboxCell)
    func toggleSelfSeedingHasBeenChecked(for cell: CheckboxCell)
    func toggleBulbHasBeenChecked(for cell: CheckboxCell)
    func toggleRhizomeHasBeenChecked(for cell: CheckboxCell)
    func toggleDroughtTolerantHasBeenChecked(for cell: CheckboxCell)
    func toggleHeirloomHasBeenChecked(for cell: CheckboxCell)
    func toggleHeavyFeederHasBeenChecked(for cell: CheckboxCell)
    func toggleContainerHasBeenChecked(for cell: CheckboxCell)
}

class CheckboxCell: UITableViewCell
{
    weak var delegate: CheckboxCellDelegate?
    @IBOutlet weak var seedCheckboxButton: UIButton!
    @IBOutlet weak var tuberCheckboxButton: UIButton!
    @IBOutlet weak var hybridCheckboxButton: UIButton!
    @IBOutlet weak var selfSeedingCheckboxButton: UIButton!
    @IBOutlet weak var bulbCheckboxButton: UIButton!
    @IBOutlet weak var rhizomeCheckboxButton: UIButton!
    @IBOutlet weak var droughtTolerantCheckboxButton: UIButton!
    @IBOutlet weak var heirloomCheckboxButton: UIButton!
    @IBOutlet weak var heavyFeederCheckboxButton: UIButton!
    @IBOutlet weak var containerCheckboxButton: UIButton!
    
    var seed: Seed?
    {
        didSet
        {
            updateViews()
        }
    }
    
    
    @IBAction func toggleASeedCheckbox(_ sender: Any)
    {
        delegate?.toggleSeedHasBeenChecked(for: self)
    }
    
    @IBAction func toggleTuberCheckbox(_ sender: Any)
    {
        delegate?.toggleTuberHasBeenChecked(for: self)
    }
    
    @IBAction func toggleBulbCheckbox(_ sender: Any)
    {
        delegate?.toggleBulbHasBeenChecked(for: self)
    }
    
    @IBAction func toggleRhizomeCheckbox(_ sender: Any)
    {
        delegate?.toggleRhizomeHasBeenChecked(for: self)
    }
    
    @IBAction func toggleHybridCheckbox(_ sender: Any)
    {
        delegate?.toggleHybridHasBeenChecked(for: self)
    }
    
    @IBAction func toggleHeirloomCheckbox(_ sender: Any)
    {
        delegate?.toggleHeirloomHasBeenChecked(for: self)
    }
    
    @IBAction func toggleSelfSeedingCheckbox(_ sender: Any)
    {
        delegate?.toggleSelfSeedingHasBeenChecked(for: self)
    }
    
    @IBAction func toggleHeavyFeederCheckbox(_ sender: Any)
    {
        delegate?.toggleHeavyFeederHasBeenChecked(for: self)
    }
    
    @IBAction func toggleDroughtTolerantCheckbox(_ sender: Any)
    {
        delegate?.toggleDroughtTolerantHasBeenChecked(for: self)
    }
    
    @IBAction func toggleContainerFriendlyCheckbox(_ sender: Any)
    {
        delegate?.toggleContainerHasBeenChecked(for: self)
    }
    
    func updateViews()
    {
        guard let seed = seed else {return}
        
        guard let checkedSeedCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedSeedCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedTuberCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedTuberCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedHybridCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedHybridCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedSelfSeedingCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedSelfSeedingCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedBulbCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedBulbCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedRhizomeCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedRhizomeCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedDroughtTolerantCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedDroughtTolerantCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedHeirloomCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedHeirloomCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedHeavyFeederCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedHeavyFeederCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout"),
            let checkedContainerCheckboxButtonImage: UIImage = UIImage(named: "checkedStout"),
            let uncheckedContainerCheckboxButtonImage: UIImage = UIImage(named: "uncheckedStout") else {return}
        
        if seed.isASeed
        {
            seedCheckboxButton.setImage(checkedSeedCheckboxButtonImage, for: .normal)
        }
        else
        {
            seedCheckboxButton.setImage(uncheckedSeedCheckboxButtonImage, for: .normal)
        }
        
        if seed.isTuber
        {
            tuberCheckboxButton.setImage(checkedTuberCheckboxButtonImage, for: .normal)
        }
        else
        {
            tuberCheckboxButton.setImage(uncheckedTuberCheckboxButtonImage, for: .normal)
        }
        
        if seed.isHybrid
        {
            hybridCheckboxButton.setImage(checkedHybridCheckboxButtonImage, for: .normal)
        }
        else
        {
            hybridCheckboxButton.setImage(uncheckedHybridCheckboxButtonImage, for: .normal)
        }
        
        if seed.isSelfSeeding
        {
            selfSeedingCheckboxButton.setImage(checkedSelfSeedingCheckboxButtonImage, for: .normal)
        }
        else
        {
            selfSeedingCheckboxButton.setImage(uncheckedSelfSeedingCheckboxButtonImage, for: .normal)
        }
        
        if seed.isBulb
        {
            bulbCheckboxButton.setImage(checkedBulbCheckboxButtonImage, for: .normal)
        }
        else
        {
            bulbCheckboxButton.setImage(uncheckedBulbCheckboxButtonImage, for: .normal)
        }
        
        if seed.isRhizome
        {
            rhizomeCheckboxButton.setImage(checkedRhizomeCheckboxButtonImage, for: .normal)
        }
        else
        {
            rhizomeCheckboxButton.setImage(uncheckedRhizomeCheckboxButtonImage, for: .normal)
        }
        
        if seed.isDroughtTolerant
        {
            droughtTolerantCheckboxButton.setImage(checkedDroughtTolerantCheckboxButtonImage, for: .normal)
        }
        else
        {
            droughtTolerantCheckboxButton.setImage(uncheckedDroughtTolerantCheckboxButtonImage, for: .normal)
        }
        
        if seed.isHeirloom
        {
            heirloomCheckboxButton.setImage(checkedHeirloomCheckboxButtonImage, for: .normal)
        }
        else
        {
            heirloomCheckboxButton.setImage(uncheckedHeirloomCheckboxButtonImage, for: .normal)
        }
        
        if seed.isHeavyFeeder
        {
            heavyFeederCheckboxButton.setImage(checkedHeavyFeederCheckboxButtonImage, for: .normal)
        }
        else
        {
            heavyFeederCheckboxButton.setImage(uncheckedHeavyFeederCheckboxButtonImage, for: .normal)
        }
        
        if seed.isContainerFriendly
        {
            containerCheckboxButton.setImage(checkedContainerCheckboxButtonImage, for: .normal)
        }
        else
        {
            containerCheckboxButton.setImage(uncheckedContainerCheckboxButtonImage, for: .normal)
        }
    }
}
