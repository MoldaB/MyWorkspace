//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

protocol UseCaseProvider
{
    func provideWorkspaceUseCase() -> WorkspaceUseCase
}
