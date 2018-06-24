//
//  CDWorkspace+Ext.swift
//  CoreDataPlatform
//
//  Created by Molda Beta on 24/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation
import QueryKit
import Domain
import RxSwift

extension CDWorkspace
{
    static var name: Attribute<String> { return Attribute("name")}
    static var lastUseDate: Attribute<Date> { return Attribute("lastUseDate")}
    static var applications: Attribute<[String]> { return Attribute("applications")}
}


extension CDWorkspace: Persistable
{
    static var entityName: String {
        return "CDWorkspace"
    }
    
    static func synced(address: CDWorkspace) -> CDWorkspace {
        return address
    }
}

extension CDWorkspace: DomainConvertibleType
{
    func asDomain() -> Workspace {
        return Workspace(name: name,
                         lastUseDate: lastUseDate,
                         applications: applications)
    }
}

extension Workspace: CoreDataRepresentable
{
    internal var uid: String {
        return ""
    }
    
    typealias CoreDataType = CDWorkspace
    
    func sync(in context: NSManagedObjectContext) -> Observable<CDWorkspace> {
        let syncSelf = context.rx.sync(entity: self, update: update)
        return syncSelf.map { CDWorkspace.synced(address: $0) }
    }
    
    func update(entity: CDWorkspace) {
        entity.name = name
        entity.applications = applications
        entity.lastUseDate = lastUseDate
    }
}
