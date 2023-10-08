//
//  AppViewModel.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AppViewModel {
    let navigator: AppNavigatorType
    let useCase: AppUseCaseType
}

extension AppViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        
    }
    
    func transform(_ input: AppViewModel.Input, disposeBag: DisposeBag) -> AppViewModel.Output {
        
        input.loadTrigger
            .do(onNext: { _ in
                self.navigator.toMain()
            })
            .drive()
            .disposed(by: disposeBag)
        
        return Output()
    }
}
