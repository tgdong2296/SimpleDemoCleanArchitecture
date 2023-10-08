//
//  GithubRepoResponse.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation

struct GithubRepoResponse: Codable {
    let githubRepos: [GithubRepo]
    
    enum CodingKeys: String, CodingKey {
        case githubRepos = "items"
    }
}
