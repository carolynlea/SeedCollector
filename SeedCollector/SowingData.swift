//
//  SowingData.swift
//  SeedCollector
//
//  Created by Carolyn Lea on 9/27/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import Foundation

struct SowingData: Equatable, Codable
{
    var cycleName:String
    var cycleDate: Date = Date()
    var sowingTemp: String
    var method: String
    var numberOfSeedsSown: String
    
    init(cycleName: String, cycleDate: Date = Date(), sowingTemp: String, method: String, numberOfSeedsSown: String)
    {
        self.cycleName = cycleName
        self.cycleDate = cycleDate
        self.sowingTemp = sowingTemp
        self.method = method
        self.numberOfSeedsSown = numberOfSeedsSown
    }
}
