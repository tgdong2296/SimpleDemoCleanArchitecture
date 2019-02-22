//
//  GithubRepoRepository.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

protocol GithubRepoRepositoryType {
    func getGithubRepos(input: GithubRepoRequest) -> Observable<[GithubRepo]>
}

class GithubRepoRepository: GithubRepoRepositoryType {
    private let api: APIService = APIService.share
    
    func getGithubRepos(input: GithubRepoRequest) -> Observable<[GithubRepo]> {
        return api.request(input: input)
            .map { (response: GithubRepoResponse) -> [GithubRepo] in
                return response.githubRepos
            }
    }
}
