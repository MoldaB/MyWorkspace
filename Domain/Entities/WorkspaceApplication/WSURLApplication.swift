//
//  WPURLApplication.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

struct WSURLApplication: WSApplication
{
    typealias PathType = URL
    var path: URL
    
    init(path: PathType, using browserName: String) throws {
        self.path = path
    }
}
