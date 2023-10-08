//
//  MainUseCase.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MainUseCaseType {
    func getRepos() -> Observable<[GithubRepo]>
}

struct MainUseCase: MainUseCaseType {
    
    func getRepos() -> Observable<[GithubRepo]> {
        let request = GithubRepoRequest(page: 1, perPage: 20)
        let repository = GithubRepoRepository()
        return repository.getGithubRepos(input: request)
    }
}
