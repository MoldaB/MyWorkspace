//
//  WSInstalledApplication.swift
//  Domain
//
//  Created by Molda Beta on 23/06/2018.
//  Copyright © 2018 Molda. All rights reserved.
//

import Foundation

struct WSInstalledApplication: WSApplication
{
    typealias PathType = String
    var path: String
    
    var icon: NSImage?
    
    init(path: String) {
        self.path = path
    }
}
