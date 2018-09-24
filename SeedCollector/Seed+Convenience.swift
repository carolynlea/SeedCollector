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
    convenience init(seedName: String, seedVariety: String, seedDescription: String, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext)
    {
        self.init(context: context)
        self.seedName = seedName
        self.seedVariety = seedVariety
        self.seedDescription = seedDescription
        self.timestamp = timestamp
    }
}
