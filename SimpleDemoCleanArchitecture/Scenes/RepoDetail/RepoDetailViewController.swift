//
//  RepoDetailViewController.swift
//  SimpleDemoCleanArchitecture
//
//  Created by trinh.giang.dong on 2/22/19.
//  Copyright © 2019 trinh.giang.dong. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import RxCocoa
import Then
import NSObject_Rx
import MGArchitecture
import Reusable
import SDWebImage

class RepoDetailViewController: UIViewController, BindableType {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: RepoDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    private func configView() {
        title = "Gitgub Detail"
    }
    
    func bindViewModel() {
        let input = RepoDetailViewModel.Input(
            loadTrigger: Driver.just(())
        )
        let output = viewModel.transform(input)
        
        output.repoImage
            .drive(avatarBinding)
            .disposed(by: rx.disposeBag)
        
        output.repoName
            .drive(nameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
}

extension RepoDetailViewController {
    
    var avatarBinding: Binder<String> {
        return Binder(self) { viewController, imageUrl in
            let url = URL(string: imageUrl)
            viewController.avatarImageView.sd_setImage(with: url, completed: nil)
        }
    }
}

extension RepoDetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
