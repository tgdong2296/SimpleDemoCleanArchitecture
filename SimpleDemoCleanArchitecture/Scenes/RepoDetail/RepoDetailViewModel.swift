//
//  RepoDetailViewModel.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct RepoDetailViewModel {
    let navigator: RepoDetailNavigatorType
    let useCase: RepoDetailUseCaseType
    let repo: GithubRepo
}

extension RepoDetailViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let repoName: Driver<String>
        let repoImage: Driver<String>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: RepoDetailViewModel.Input, disposeBag: DisposeBag) -> RepoDetailViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let repoName = input.loadTrigger
            .map { _ in
                return self.repo.name
            }
        
        let repoImageUrl = input.loadTrigger
            .map { _ in
                return self.repo.owner.avatarURL
            }
        
        return Output(
            repoName: repoName,
            repoImage: repoImageUrl,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
