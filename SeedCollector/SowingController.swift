//
//  SowingController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/27/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

class SowingController
{
    var datas = [SowingData]()
    
    func createData(cycleName: String, cycleDate: Date, sowingTemp: String, method: String, numberOfSeedsSown: String) -> SowingData
    {
        let sowingData = SowingData(cycleName: cycleName, cycleDate: cycleDate, sowingTemp: sowingTemp, method: method, numberOfSeedsSown: numberOfSeedsSown)
        datas.append(sowingData)
        return sowingData
    }
    
    func updateData(sowingData: SowingData, cycleName: String, cycleDate: Date, sowingTemp: String, method: String, numberOfSeedsSown: String)
    {
        if let index = datas.index(of: sowingData)
        {
            var temp = sowingData
            temp.cycleName = cycleName
            temp.cycleDate = cycleDate
            temp.sowingTemp = sowingTemp
            temp.method = method
            temp.numberOfSeedsSown = numberOfSeedsSown
            
            datas.remove(at:index)
            datas.insert(temp, at: index)
            
        }
    }
    
    private var persistentFileURL: URL?
    {
        let fileManager = FileManager.default
        guard let docDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {return nil}
        return docDir.appendingPathComponent("sowingData.plist")
    }
    
    func saveToPersistentStore()
    {
        guard let url = persistentFileURL else {return}
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(datas)
            try data.write(to: url)
            print("save to persistent store: \(url)")
        } catch {
            NSLog("Error saving memories data: \(error)")
        }
    }
    
    func loadFromPersistentStore()
    {
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            datas = try decoder.decode([SowingData].self, from: data)
            print("loaded from peristent store: \(datas)")
        } catch {
            NSLog("Error loading memories data: \(datas)")
        }
    }
}
