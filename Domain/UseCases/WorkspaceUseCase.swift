//
//  WorkspaceUseCase.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

protocol WorkspaceUseCase
{
    func getWorkspaceList() -> [Workspace]
    func createWorkspace(with name: String, applications: [String]) -> Workspace
    func replace(workspace: Workspace, for newWorkspace: Workspace) -> Bool
    func delete(workspace: Workspace) -> Bool
}

/*
 Use in CoreDataPlatform
 
 struct Handlers
 {
 typealias successError = (Bool,Error) -> (Void)
 typealias list = () -> (Void)
 typealias single = () -> (Void)
 }
 */
