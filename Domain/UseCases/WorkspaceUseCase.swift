//
//  WorkspaceUseCase.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation
import RxSwift

public protocol WorkspaceUseCase
{
    func getWorkspaceList() -> Observable<[Workspace]>
    func createWorkspace(with name: String, applications: [String]) -> Observable<Workspace>
    func replace(workspace: Workspace, for newWorkspace: Workspace) -> Observable<Void>
    func delete(workspace: Workspace) -> Observable<Void>
}
