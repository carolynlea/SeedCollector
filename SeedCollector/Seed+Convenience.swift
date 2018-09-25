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
    convenience init(seedName: String, seedVariety: String, seedDescription: String, seedImage: Data, sunRequirements: String, plantType: String, plantingDepth: String, plantSpacing: String, plantHeight: String, plantWidth: String, bestZones: String, waterPreference: String, climatePreference: String, soilPreference: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext)
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
        self.timestamp = timestamp
    }
}
