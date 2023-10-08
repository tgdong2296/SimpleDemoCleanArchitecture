//
//  GithubRepoRequest.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import Alamofire

struct GithubRepoRequest {
    let page: Int
    let perPage: Int
    let language: String
    
    init(page: Int, perPage: Int = 10, language: String = "language:swift") {
        self.page = page
        self.perPage = perPage
        self.language = language
    }
}
