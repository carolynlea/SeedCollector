//
//  SeedDetailTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit
import CoreData

class SeedDetailTableViewController: UITableViewController, UITextFieldDelegate
{
    var seedsController: SeedsController?
    var seed: Seed?
    let saveView = UIView()
    let titleView = UIView()
    var titleLabel = UILabel()
    var textFieldCell = TextFieldCell()
    var nameTextField: UITextField!
    var varietyTextField: UITextField!
    var descriptionTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
        print("seed = \(String(describing: seed?.seedName))")
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        saveView.frame = CGRect(x: view.bounds.size.width - 95, y: 48, width: 90, height: 91)
        
        let saveButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        saveButton.frame = CGRect(x: 0, y: 0, width: 80, height: 81)
        saveButton.setBackgroundImage(UIImage(named:"saveFlower"), for: .normal)
        saveButton.addTarget(self, action: #selector(save), for:.touchUpInside)
        
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
            titleLabel.text = "Welcome!"
        }
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleView.addSubview(titleLabel)
        
        self.navigationController?.view.addSubview(titleView)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewDidAppear(true)
        saveView.isHidden = true
        titleView.isHidden = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
        
        textFieldCell.inputTextField.delegate = self

        if indexPath.row == 0
        {
            nameTextField = textFieldCell.inputTextField
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.seedName ?? "", placeholder: "", needsPicker: false)
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Seed Name", needsPicker: false)
            }
        }
        if indexPath.row == 1
        {
            varietyTextField = textFieldCell.inputTextField
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.seedVariety ?? "", placeholder: "", needsPicker: false)
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Seed Variety", needsPicker: false)
            }
        }
        if indexPath.row == 2
        {
            descriptionTextField = textFieldCell.inputTextField
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.seedDescription ?? "", placeholder: "", needsPicker: false)
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Seed Description", needsPicker: false)
            }
        }

        return textFieldCell
    }
    
    @IBAction func save(_ sender: Any)
    {
        guard let name = nameTextField.text,
            let variety = varietyTextField.text,
            let description = descriptionTextField.text else {return}
        let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
        
        if seed == nil
        {
            seedsController?.createSeed(seedName: name, seedVariety: variety, seedDescription: description, context: backgroundMoc)
        }
        else
        {
            seedsController?.updateSeed(seed: seed!, seedName: name, seedVariety: variety, seedDescription: description, context: backgroundMoc)
        }
        print("button tapped")
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Textfield delegates
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 254.0/255.0, green: 101.0/255.0, blue: 129.0/255.0, alpha: 1.0).cgColor
        textField.layer.cornerRadius = 5
        textField.borderStyle = .roundedRect
        textField.layer.borderWidth = 1.0
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 186.0/255.0, green: 186.0/255.0, blue: 186.0/255.0, alpha: 0.6).cgColor
        textField.layer.cornerRadius = 5
        //textField.borderStyle = .none
        textField.layer.borderWidth = 0.5
    }
    
 

    @IBAction func addImage(_ sender: Any)
    {
        
    }
    
}
