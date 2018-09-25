//
//  SeedsController.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/24/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation
import CoreData

class SeedsController
{
    var seed: Seed?
    var seeds: [Seed]
    {
        return loadFromCoreData()
    }
    
    func saveToCoreData(context: NSManagedObjectContext)
    {
        context.performAndWait {
            
            let moc = CoreDataStack.shared.mainContext
            
            do
            {
                try moc.save()
                
            }
            catch
            {
                NSLog("There was an error while saving managed object context: \(error)")
            }
                
        }
    }
    
    func loadFromCoreData() -> [Seed]
    {
        let fetchRequest: NSFetchRequest<Seed> = Seed.fetchRequest()
        let moc = CoreDataStack.shared.mainContext
        
        do
        {
            return try moc.fetch(fetchRequest)
        }
        catch
        {
            NSLog("There was an error while fetching Calories: \(error)")
            return []
        }
    }
    
    func createSeed(seedName: String, seedVariety: String, seedDescription: String, seedImage: Data, context: NSManagedObjectContext)
    {
        let _ = Seed(seedName: seedName, seedVariety: seedVariety, seedDescription: seedDescription, seedImage: seedImage)
        saveToCoreData(context: context)
    }
    
    func updateSeed(seed: Seed, seedName: String, seedVariety: String, seedDescription: String, seedImage: Data, timestamp: Date = Date(), context: NSManagedObjectContext)
    {
        let seed = seed
        seed.seedName = seedName
        seed.seedVariety = seedVariety
        seed.seedDescription = seedDescription
        seed.seedImage = seedImage
        seed.timestamp = timestamp
        saveToCoreData(context: context)
    }
    
    func deleteSeed(seed: Seed, context: NSManagedObjectContext)
    {
        context.performAndWait {
            let moc = CoreDataStack.shared.mainContext
            moc.delete(seed)
            
            do
            {
                try moc.save()
            }
            catch
            {
                 moc.reset()
                 NSLog("There was an error while saving managed object context: \(error)")
            }
        }
    }
}
