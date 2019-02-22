//
//  GithubRepoRequest.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire

final class GithubRepoRequest: BaseRequest {
    
    required init(page: Int, perPage: Int = 10) {
        let body: [String: Any]  = [
            "q": "language:swift",
            "per_page": perPage,
            "page": page
        ]
        super.init(url: URLs.githubRepo, requestType: .get, body: body)
    }
}
