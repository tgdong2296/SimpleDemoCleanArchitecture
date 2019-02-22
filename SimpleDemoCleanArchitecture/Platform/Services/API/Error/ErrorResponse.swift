//
//  ErrorResponse.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import ObjectMapper

class ErrorResponse: Mappable {
    var documentationUrl: String?
    var message: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        documentationUrl <- map["documentation_url"]
        message <- map["message"]
    }
}
