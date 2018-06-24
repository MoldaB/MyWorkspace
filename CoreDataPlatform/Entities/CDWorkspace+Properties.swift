//
//  CDWorkspace+Properties.swift
//  CoreDataPlatform
//
//  Created by Molda Beta on 24/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation
import CoreData

extension CDWorkspace
{
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWorkspace> {
        return NSFetchRequest<CDWorkspace>(entityName: "Workspace")
    }
    
    @NSManaged public var name: String
    @NSManaged public var lastUseDate: Date
    @NSManaged public var applications: [String]
}
