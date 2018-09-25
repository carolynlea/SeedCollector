//
//  SeedDetailTableViewController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/23/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit
import CoreData
import Photos

class SeedDetailTableViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIViewControllerPreviewingDelegate, UITextViewDelegate
{
    var seedsController: SeedsController?
    var seed: Seed?
    
    let saveView = UIView()
    let titleView = UIView()
    var titleLabel = UILabel()
    
    var imageCell = ImageCell()
    var textFieldCell = TextFieldCell()
    var textViewCell = TextViewCell()
    var multiTextFieldCell = MultiTextFieldCell()
    
    var nameTextField: UITextField!
    var varietyTextField: UITextField!
    var descriptionTextView: UITextView!
    var typeTextField: UITextField!
    var sunTextField: UITextField!
    var depthTextField: UITextField!
    var spacingTextField: UITextField!
    var heightTextField: UITextField!
    var widthTextField: UITextField!
    var zoneTextField: UITextField!
    var waterTextField: UITextField!
    var soilTextField: UITextField!
    var climateTextField: UITextField!
    
    var imageData: Data?
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        print("seed = \(String(describing: seed?.seedName))")
        print("seed = \(String(describing: seed?.plantingDepth))")
        
        saveView.isHidden = false
        titleView.isHidden = false 
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        makeViews()
        
//        tableView.estimatedRowHeight = 103
//        tableView.rowHeight = UITableView.automaticDimension
//        descriptionTextView?.translatesAutoresizingMaskIntoConstraints = true
//        descriptionTextView?.delegate = self
        guard traitCollection.forceTouchCapability == .available else { return }
        registerForPreviewing(with: self, sourceView: tableView)
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
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            imageCell = (tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageCell)
            
            if imageData != nil
            {
                imageCell.seedImageView.image = UIImage(data: imageData!)
            }
            else
            {
                imageCell.seedImageView.image = UIImage(named: "placeholder")
            }
            
            return imageCell
        }
        if indexPath.row == 1
        {
            textViewCell = tableView.dequeueReusableCell(withIdentifier: "TextViewCell", for: indexPath) as! TextViewCell
            descriptionTextView = textViewCell.inputTextView
            textViewCell.textViewLabel.text = "Description:"
            
            if let seed = seed
            {
               textViewCell.inputTextView.text = seed.seedDescription
            }
            else
            {
                textViewCell.inputTextView.text = ""
            }
            
            return textViewCell
        }
        if indexPath.row == 2
        {
            multiTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "MultiTextFieldCell", for: indexPath) as! MultiTextFieldCell
            
            multiTextFieldCell.textFieldOne.delegate = self
            multiTextFieldCell.textFieldTwo.delegate = self
            multiTextFieldCell.textFieldThree.delegate = self
            multiTextFieldCell.textFieldFour.delegate = self
            
            depthTextField = multiTextFieldCell.textFieldOne
            spacingTextField = multiTextFieldCell.textFieldTwo
            heightTextField = multiTextFieldCell.textFieldThree
            widthTextField = multiTextFieldCell.textFieldFour
            
            if let seed = seed
            {
                multiTextFieldCell.configureOne(text: seed.plantingDepth ?? "", placeholder: "", labelText: "Depth")
                
                multiTextFieldCell.configureTwo(text: seed.plantSpacing ?? "", placeholder: "", labelText: "Spacing")
                
                multiTextFieldCell.configureThree(text: seed.plantHeight ?? "", placeholder: "", labelText: "Height")
                
                multiTextFieldCell.configureFour(text: seed.plantWidth ?? "", placeholder: "", labelText: "Width")
            }
            else
            {
                multiTextFieldCell.configureOne(text: "", placeholder: "Depth", labelText: "Depth")
                
                multiTextFieldCell.configureTwo(text: "", placeholder: "Spacing", labelText: "Spacing")
                
                multiTextFieldCell.configureThree(text: "", placeholder: "Height", labelText: "Height")
                
                multiTextFieldCell.configureFour(text: "", placeholder: "Width", labelText: "Width")
            }
            
            return multiTextFieldCell
        }
        if indexPath.row == 3
        {
            multiTextFieldCell = tableView.dequeueReusableCell(withIdentifier: "MultiTextFieldCell", for: indexPath) as! MultiTextFieldCell
            
            multiTextFieldCell.textFieldOne.delegate = self
            multiTextFieldCell.textFieldTwo.delegate = self
            multiTextFieldCell.textFieldThree.delegate = self
            multiTextFieldCell.textFieldFour.delegate = self
            
            zoneTextField = multiTextFieldCell.textFieldOne
            climateTextField = multiTextFieldCell.textFieldTwo
            soilTextField = multiTextFieldCell.textFieldThree
            waterTextField = multiTextFieldCell.textFieldFour
            
            if let seed = seed
            {
                multiTextFieldCell.configureOne(text: seed.bestZones ?? "", placeholder: "", labelText: "Zones:")
                
                multiTextFieldCell.configureTwo(text: seed.climatePreference ?? "", placeholder: "", labelText: "Climate:")
                
                multiTextFieldCell.configureThree(text: seed.soilPreference ?? "", placeholder: "", labelText: "Soil:")
                
                multiTextFieldCell.configureFour(text: seed.waterPreference ?? "", placeholder: "", labelText: "Water:")
            }
            else
            {
                multiTextFieldCell.configureOne(text: "", placeholder: "Zones", labelText: "Zones:")
                
                multiTextFieldCell.configureTwo(text: "", placeholder: "Warm/Cool", labelText: "Climate:")
                
                multiTextFieldCell.configureThree(text: "", placeholder: "Soil Type", labelText: "Soil:")
                
                multiTextFieldCell.configureFour(text: "", placeholder: "Amount", labelText: "Water:")
            }
            
            return multiTextFieldCell
        }
        
        textFieldCell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldCell
        
        textFieldCell.inputTextField.delegate = self

        if indexPath.row == 4
        {
            nameTextField = textFieldCell.inputTextField
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.seedName ?? "", placeholder: "", needsPicker: false, labelText: "Name:")
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Seed Name", needsPicker: false, labelText: "Name:")
            }
        }
        if indexPath.row == 5
        {
            varietyTextField = textFieldCell.inputTextField
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.seedVariety ?? "", placeholder: "", needsPicker: false, labelText: "Variety:")
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Seed Variety", needsPicker: false, labelText: "Variety:")
            }
        }
        
        if indexPath.row == 6
        {
            typeTextField = textFieldCell.inputTextField
            textFieldCell.pickerData = textFieldCell.typePickerData
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.plantType ?? "", placeholder: "", needsPicker: true, labelText: "Plant Type:")
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Plant Type", needsPicker: true, labelText: "Plant Type:")
            }
        }
        if indexPath.row == 7
        {
            sunTextField = textFieldCell.inputTextField
            textFieldCell.pickerData = textFieldCell.sunPickerData
            
            if let seed = seed
            {
                textFieldCell.configure(text: seed.sunRequirements ?? "", placeholder: "", needsPicker: true, labelText: "Sun Requirements:")
            }
            else
            {
                textFieldCell.configure(text: "", placeholder: "Sun Requirements", needsPicker: true, labelText: "Sun Requirements:")
            }
        }
        
        return textFieldCell
    }
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 103
//    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 128
        }
        else if indexPath.row == 1
        {
            return 103
        }
        else
        {
            return 81
        }
        
    }
    
    @IBAction func save(_ sender: Any)
    {
        guard let name = nameTextField.text,
            let variety = varietyTextField.text,
            let description = descriptionTextView.text,
            let image = imageData,
            let sun = sunTextField.text,
            let type = typeTextField.text,
            let depth = depthTextField.text,
            let spacing = spacingTextField.text,
            let height = heightTextField.text,
            let width = widthTextField.text,
            let zone = zoneTextField.text,
            let climate = climateTextField.text,
            let soil = soilTextField.text,
            let water = soilTextField.text else {return}
        
        
        let backgroundMoc = CoreDataStack.shared.container.newBackgroundContext()
        
        if seed == nil
        {
            seedsController?.createSeed(seedName: name, seedVariety: variety, seedDescription: description, seedImage: image, sunRequirements: sun, plantType: type, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zone, waterPreference: water, climatePreference: climate, soilPreference: soil, context: backgroundMoc)
        }
        else
        {
            seedsController?.updateSeed(seed: seed!, seedName: name, seedVariety: variety, seedDescription: description, seedImage: image, sunRequirements: sun, plantType: type, plantingDepth: depth, plantSpacing: spacing, plantHeight: height, plantWidth: width, bestZones: zone, waterPreference: water, climatePreference: climate, soilPreference: soil, context: backgroundMoc)
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
        typeTextField.text = textFieldCell.typePickerData[0]
        sunTextField.text = textFieldCell.sunPickerData[0]
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        textField.layer.borderColor = UIColor(red: 186.0/255.0, green: 186.0/255.0, blue: 186.0/255.0, alpha: 0.6).cgColor
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
    }
    
    // MARK: - ImagePicker

    func checkPhotoPermission()
    {
        PHPhotoLibrary.requestAuthorization { (status) in
            
            let status = PHPhotoLibrary.authorizationStatus()
            switch status {
            case .authorized:
                print("authorized")
            case .notDetermined:
                PHPhotoLibrary.requestAuthorization() { status in
                    if status == .authorized {
                        DispatchQueue.main.async {
                            self.presentImagePickerController()
                        }
                    }
                }
            case .restricted:
                // do nothing
                break
            case .denied:
                // do nothing, or beg the user to authorize us in Settings
                break
            }
        }
    }
    
    func showImageAlert()
    {
        let alert = UIAlertController(title: "Add a Picture", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { action in
            self.presentCameraImagePickerController()
        }))
        alert.addAction(UIAlertAction(title: "PhotoLibrary", style: .default, handler: { action in
            self.presentPhotoLibraryImagePickerController()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    private func presentImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
        else if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func addImage(_ sender: Any)
    {
        checkPhotoPermission()
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {
                NSLog("go to settings to allow acces")
                return
            }
            print("photo acces authorized")
            DispatchQueue.main.async {
                self.showImageAlert()
                //self.presentImagePickerController()
            }
        }
    }
    
    private func presentPhotoLibraryImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    private func presentCameraImagePickerController()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true, completion: nil)
        
        guard let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {return}
        
        imageCell.seedImageView.contentMode = .scaleAspectFit
        imageCell.seedImageView.image = chosenImage
        
        if let data = chosenImage.jpegData(compressionQuality: 0.8)
        {
            imageData = data
            print("data = \(imageData!)")
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Peek and Pop

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController?
    {
        guard let indexPath = tableView?.indexPathForRow(at: location) else { return nil }
        guard let cell = tableView.cellForRow(at: indexPath) else { return nil }
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popView") as? PopViewController else { return nil }

        let peekImage = UIImage(data: imageData!)
        popVC.popImage = peekImage!

        //Set your Peek height
        popVC.preferredContentSize = CGSize(width: view.bounds.size.width, height: view.bounds.size.height)
        previewingContext.sourceRect = cell.frame
        return popVC
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController)
    {
        // Present or push the view controller
        show(viewControllerToCommit, sender: self)
    }

    // MARK: - TextView
    
    func textViewDidChange(_ textView: UITextView)
    {
//        let fixedWidth = textView.frame.size.width
//
//        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//
//        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
//
//        var newFrame = textView.frame
//
//        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
//
//        textView.frame = newFrame
    }
    
}
