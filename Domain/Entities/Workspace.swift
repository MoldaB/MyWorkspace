//
//  Workspace.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

public struct Workspace
{
    public let name: String
    public let creationDate: Date
    public let applications: [String]
    
    public init(name: String, creationDate: Date = Date(), applications: [String] = []) {
        self.name = name
        self.creationDate = creationDate
        self.applications = applications
    }
}
