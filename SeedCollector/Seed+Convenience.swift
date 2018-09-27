//
//  Seed+Convenience.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/24/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation
import CoreData 

extension Seed
{
    convenience init(seedName: String, seedVariety: String, seedDescription: String, seedImage: Data, sunRequirements: String, plantType: String, plantingDepth: String, plantSpacing: String, plantHeight: String, plantWidth: String, bestZones: String, waterPreference: String, climatePreference: String, soilPreference: String, seedBrand: String, latinName: String, purchasedFrom: String, purchaseByDate: String, purchaseDate: String, numberOfPackages: String, purchasePrice: String, packageSize: String, notes: String, category: String, isASeed: Bool = false, isTuber: Bool = false, isHybrid: Bool = false, isSelfSeeding: Bool = false, isBulb: Bool = false, isRhizome: Bool = false, isDroughtTolerant: Bool = false, isHeirloom: Bool = false, isHeavyFeeder: Bool = false, isContainerFriendly: Bool = false, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext)
    {
        self.init(context: context)
        self.seedName = seedName
        self.seedVariety = seedVariety
        self.seedDescription = seedDescription
        self.seedImage = seedImage
        self.sunRequirements = sunRequirements
        self.plantType = plantType
        self.plantingDepth = plantingDepth
        self.plantSpacing = plantSpacing
        self.plantHeight = plantHeight
        self.plantWidth = plantWidth
        self.bestZones = bestZones
        self.waterPreference = waterPreference
        self.climatePreference = climatePreference
        self.soilPreference = soilPreference
        self.seedBrand = seedBrand
        self.latinName = latinName
        self.purchasedFrom = purchasedFrom
        self.purchaseByDate = purchaseByDate
        self.purchaseDate = purchaseDate
        self.numberOfPackages = numberOfPackages
        self.purchasePrice = purchasePrice
        self.packageSize = packageSize
        self.notes = notes
        self.category = category
        self.isASeed = isASeed
        self.isTuber = isTuber
        self.isHybrid = isHybrid
        self.isSelfSeeding = isSelfSeeding
        self.isBulb = isBulb
        self.isRhizome = isRhizome
        self.isDroughtTolerant = isDroughtTolerant
        self.isHeirloom = isHeirloom
        self.isHeavyFeeder = isHeavyFeeder
        self.isContainerFriendly = isContainerFriendly
        self.timestamp = timestamp
    }
}
