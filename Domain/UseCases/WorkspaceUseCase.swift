//
//  WorkspaceUseCase.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

public protocol WorkspaceUseCase
{
    func getWorkspaceList(_ completionHandler: @escaping WorkspaceUseCaseHandlers.List)
    func createWorkspace(with name: String, applications: [String], completionHandler: @escaping WorkspaceUseCaseHandlers.Single)
    func replace(workspace: Workspace, for newWorkspace: Workspace, completionHandler: @escaping WorkspaceUseCaseHandlers.SuccessError)
    func delete(workspace: Workspace, completionHandler: @escaping WorkspaceUseCaseHandlers.SuccessError)
}

public struct WorkspaceUseCaseHandlers
{
    public typealias SuccessError = (Bool,Error?) -> Void
    public typealias List = ([Workspace]) -> Void
    public typealias Single = (Workspace) -> Void
}
