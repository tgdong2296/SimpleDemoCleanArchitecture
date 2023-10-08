//
//  GithubRepo.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import Then

struct GithubRepo: Codable {
    var id: Int
    var name: String
    var fullname: String
    var urlString: String
    var starCount: Int
    var folkCount: Int
    var owner: GithubOwner
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case fullname = "full_name"
        case urlString = "html_url"
        case starCount = "stargazers_count"
        case folkCount = "forks"
        case owner = "owner"
    }
}

extension GithubRepo: Then, Hashable {
    
}
