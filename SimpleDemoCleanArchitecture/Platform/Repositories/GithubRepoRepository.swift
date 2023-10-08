//
//  GithubRepoRepository.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift

protocol GithubRepoRepositoryType {
    func getGithubRepos(input request: GithubRepoRequest) -> Observable<[GithubRepo]>
}

class GithubRepoRepository: GithubRepoRepositoryType {
    private let apiService: APIService = APIService.shared
    
    func getGithubRepos(input request: GithubRepoRequest) -> Observable<[GithubRepo]> {
        return apiService.request(.repositories(request: request))
            .map(GithubRepoResponse.self)
            .asObservable()
            .map {
                $0.githubRepos
            }
    }
}
