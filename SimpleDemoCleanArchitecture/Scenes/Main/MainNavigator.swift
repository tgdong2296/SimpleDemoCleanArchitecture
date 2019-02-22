//
//  MainNavigator.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol MainNavigatorType {
    func toRepoDetail(githubRepo: GithubRepo)
}

struct MainNavigator: MainNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toRepoDetail(githubRepo: GithubRepo) {
        let viewController = RepoDetailViewController.instantiate()
        let useCase = RepoDetailUseCase()
        let navigator = RepoDetailNavigator(navigationController: navigationController)
        let viewModel = RepoDetailViewModel(navigator: navigator,
                                            useCase: useCase,
                                            repo: githubRepo)
        viewController.bindViewModel(to: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
