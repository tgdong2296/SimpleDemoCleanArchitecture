//
//  URLs.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation

struct URLs {
    enum API {
        #if PRD
        static let baseUrl = "https://api.github.com"
        #else
        static let baseUrl = "https://api.github.com"
        #endif
    }
}
