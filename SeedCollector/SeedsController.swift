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
    
    func createSeed(seedName: String,
                    seedVariety: String,
                    seedDescription: String,
                    seedImage: Data,
                    sunRequirements: String,
                    plantType: String,
                    plantingDepth: String,
                    plantSpacing: String,
                    plantHeight: String,
                    plantWidth: String,
                    bestZones: String,
                    waterPreference: String,
                    climatePreference: String,
                    soilPreference: String,
                    seedBrand: String,
                    latinName: String,
                    purchasedFrom: String,
                    purchaseByDate: String,
                    purchaseDate: String,
                    numberOfPackages: String,
                    purchasePrice: String,
                    packageSize: String,
                    notes: String,
                    category: String,
//                    isASeed: Bool,
//                    isTuber: Bool,
//                    isHybrid: Bool,
//                    isSelfSeeding: Bool,
//                    isBulb: Bool,
//                    isRhizome: Bool,
//                    isDroughtTolerant: Bool,
//                    isHeirloom: Bool,
//                    isHeavyFeeder: Bool,
//                    isContainerFriendly: Bool,
                    context: NSManagedObjectContext)
    {
        let _ = Seed(seedName: seedName, seedVariety: seedVariety, seedDescription: seedDescription, seedImage: seedImage, sunRequirements: sunRequirements, plantType: plantType, plantingDepth: plantingDepth, plantSpacing: plantSpacing, plantHeight: plantHeight, plantWidth: plantWidth, bestZones: bestZones, waterPreference: waterPreference, climatePreference: climatePreference, soilPreference: soilPreference, seedBrand: seedBrand, latinName: latinName, purchasedFrom: purchasedFrom, purchaseByDate: purchaseByDate, purchaseDate: purchaseDate, numberOfPackages: numberOfPackages, purchasePrice: purchasePrice, packageSize: packageSize, notes: notes, category: category/*, isASeed: isASeed, isTuber: isTuber, isHybrid: isHybrid, isSelfSeeding: isSelfSeeding, isBulb: isBulb, isRhizome: isRhizome, isDroughtTolerant: isDroughtTolerant, isHeirloom: isHeirloom, isHeavyFeeder: isHeavyFeeder, isContainerFriendly: isContainerFriendly*/)
        
        saveToCoreData(context: context)
        
        if let seed = seed
        {
            print(seed)
        }
    }
    
    func updateSeed(seed: Seed, seedName: String, seedVariety: String, seedDescription: String, seedImage: Data, sunRequirements: String, plantType: String, plantingDepth: String, plantSpacing: String, plantHeight: String, plantWidth: String, bestZones: String, waterPreference: String, climatePreference: String, soilPreference: String, seedBrand: String, latinName: String, purchasedFrom: String, purchaseByDate: String, purchaseDate: String, numberOfPackages: String, purchasePrice: String, packageSize: String, notes: String, category: String,/*isASeed: Bool, isTuber: Bool, isHybrid: Bool, isSelfSeeding: Bool, isBulb: Bool, isRhizome: Bool, isDroughtTolerant: Bool, isHeirloom: Bool, isHeavyFeeder: Bool, isContainerFriendly: Bool,*/ timestamp: Date = Date(), context: NSManagedObjectContext)
    {
        let seed = seed
        seed.seedName = seedName
        seed.seedVariety = seedVariety
        seed.seedDescription = seedDescription
        seed.seedImage = seedImage
        seed.sunRequirements = sunRequirements
        seed.plantType = plantType
        seed.plantingDepth = plantingDepth
        seed.plantSpacing = plantSpacing
        seed.plantHeight = plantHeight
        seed.plantWidth = plantWidth
        seed.bestZones = bestZones
        seed.waterPreference = waterPreference
        seed.climatePreference = climatePreference
        seed.soilPreference = soilPreference
        seed.seedBrand = seedBrand
        seed.latinName = latinName
        seed.purchasedFrom = purchasedFrom
        seed.purchaseByDate = purchaseByDate
        seed.purchaseDate = purchaseDate
        seed.numberOfPackages = numberOfPackages
        seed.purchasePrice = purchasePrice
        seed.packageSize = packageSize
        seed.notes = notes
        seed.category = category
//        seed.isASeed = isASeed
//        seed.isTuber = isTuber
//        seed.isHybrid = isHybrid
//        seed.isSelfSeeding = isSelfSeeding
//        seed.isBulb = isBulb
//        seed.isRhizome = isRhizome
//        seed.isDroughtTolerant = isDroughtTolerant
//        seed.isHeirloom = isHeirloom
//        seed.isHeavyFeeder = isHeavyFeeder
//        seed.isContainerFriendly = isContainerFriendly
        seed.timestamp = timestamp
        saveToCoreData(context: context)
        print(seed)
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
    
    func updateIsASeed(for seed: Seed, context: NSManagedObjectContext)
    {
        if seed.isASeed
        {
            seed.isASeed = false
        }
        else
        {
            seed.isASeed = true
        }
        
        saveToCoreData(context: context)
    }
    
    func updateIsTuber(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isTuber = !seed.isTuber
        
        saveToCoreData(context: context)
    }
    
    func updateIsHybrid(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isHybrid = !seed.isHybrid
        
        saveToCoreData(context: context)
    }
    
    func updateIsSelfSeeding(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isSelfSeeding = !seed.isSelfSeeding
        
        saveToCoreData(context: context)
    }
    
    func updateIsBulb(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isBulb = !seed.isBulb
        
        saveToCoreData(context: context)
    }
    
    func updateIsRhizome(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isRhizome = !seed.isRhizome
        
        saveToCoreData(context: context)
    }
    
    func updateIsDroughtTolerant(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isDroughtTolerant = !seed.isDroughtTolerant
        
        saveToCoreData(context: context)
    }
    
    func updateIsHeirloom(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isHeirloom = !seed.isHeirloom
        
        saveToCoreData(context: context)
    }
    
    func updateHeavyFeeder(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isHeavyFeeder = !seed.isHeavyFeeder
        
        saveToCoreData(context: context)
    }
    
    func updateIsContainerFriendly(for seed: Seed, context: NSManagedObjectContext)
    {
        seed.isContainerFriendly = !seed.isContainerFriendly
        
        saveToCoreData(context: context)
    }
}
