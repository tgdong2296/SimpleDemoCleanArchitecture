//
//  MainViewModel.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import MGArchitecture

struct MainViewModel {
    let navigator: MainNavigatorType
    let useCase: MainUseCaseType
}

extension MainViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let repos: Driver<[GithubRepo]>
        let selected: Driver<Void>
        let error: Driver<Error>
        let indicator: Driver<Bool>
    }
    
    func transform(_ input: MainViewModel.Input) -> MainViewModel.Output {
        let indicator = ActivityIndicator()
        let error = ErrorTracker()
        
        let repos = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getRepos()
                    .trackActivity(indicator)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }
        
        let selected = input.selectTrigger
            .withLatestFrom(repos) { indexPath, repos in
                return repos[indexPath.row]
            }
            .do(onNext: { repo in
                self.navigator.toRepoDetail(githubRepo: repo)
            })
            .mapToVoid()
        
        return Output(
            repos: repos,
            selected: selected,
            error: error.asDriver(),
            indicator: indicator.asDriver()
        )
    }
}
