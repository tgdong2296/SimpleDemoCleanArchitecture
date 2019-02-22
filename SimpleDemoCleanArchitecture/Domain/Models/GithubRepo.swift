//
//  GithubRepo.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import ObjectMapper
import Then

struct GithubRepo {
    var id = 0
    var name: String
    var fullname: String
    var urlString: String
    var starCount: Int
    var folkCount: Int
    var avatarURLString: String
}

extension GithubRepo {
    init() {
        self.init(
            id: 0,
            name: "",
            fullname: "",
            urlString: "",
            starCount: 0,
            folkCount: 0,
            avatarURLString: ""
        )
    }
}

extension GithubRepo: Then, Hashable {
    
}

extension GithubRepo: BaseModel {
    
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        fullname <- map["full_name"]
        urlString <- map["html_url"]
        starCount <- map["stargazers_count"]
        folkCount <- map["forks"]
        avatarURLString <- map["owner.avatar_url"]
    }
}
