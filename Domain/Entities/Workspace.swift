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
    public let lastUseDate: Date
    public let applications: [String]
    
    public init(name: String, lastUseDate: Date = Date(), applications: [String] = []) {
        self.name = name
        self.lastUseDate = lastUseDate
        self.applications = applications
    }
}

extension Workspace: Equatable
{
    public static func == (lhs: Workspace, rhs: Workspace) -> Bool {
        return lhs.name == rhs.name
    }
}
