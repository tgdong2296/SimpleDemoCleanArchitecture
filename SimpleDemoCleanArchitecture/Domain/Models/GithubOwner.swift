//
//  GithubOwner.swift
//  SimpleDemoCleanArchitecture
//
//  Created by Giang Dong Trinh on 08/10/2023.
//  Copyright © 2023 trinh.giang.dong. All rights reserved.
//

import Foundation
import Then

struct GithubOwner: Codable {
    let id: Int
    let avatarURL: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case avatarURL = "avatar_url"
        case url = "url"
    }
}

extension GithubOwner: Then, Hashable {
    
}
