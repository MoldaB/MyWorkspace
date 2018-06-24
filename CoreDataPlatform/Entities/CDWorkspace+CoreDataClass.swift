//
//  Workspace+NSManagedObject.swift
//  CoreDataPlatform
//
//  Created by Molda Beta on 24/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation
import Domain
import CoreData
import QueryKit
import RxSwift

final class CDWorkspace: NSManagedObject
{}

extension CDWorkspace {
    
    
}

extension CDWorkspace {
    static var name: Attribute<String> { return Attribute("name")}
    static var creationDate: Attribute<Date> { return Attribute("creationDate")}
    static var applications: Attribute<[String]> { return Attribute("applications")}
}


extension CDWorkspace: Persistable
{
    func asDomain() -> Workspace {
        return Workspace(name: name,
                                creationDate: creationDate,
                                applications: applications)
    }
    
    static var entityName: String {
        return "Workspace"
    }
}

extension CDWorkspace: CoreDataRepresentable {
    internal var uid: String {
        return ""
    }
    
    typealias CoreDataType = CDWorkspace
    
    func update(entity: CDWorkspace) {
        entity.name = name
        entity.applications = applications
        entity.creationDate = creationDate
    }
}
