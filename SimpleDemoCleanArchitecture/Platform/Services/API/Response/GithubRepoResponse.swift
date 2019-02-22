//
//  GithubRepoResponse.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import ObjectMapper

final class GithubRepoResponse : Mappable {
    var githubRepos = [GithubRepo]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        githubRepos <- map["items"]
    }
}
