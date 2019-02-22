//
//  MainViewController.swift
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

class MainViewController: UIViewController, BindableType {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    
    private func configView() {
        title = "Gitgub"
        tableView.do {
            $0.register(cellType: GithubRepoCell.self)
            $0.rowHeight = 80
        }
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrigger: tableView.rx.itemSelected.asDriver()
        )
        let output = viewModel.transform(input)
        
        output.repos
            .drive(tableView.rx.items) { tableView, index, repo in
                let indexPath = IndexPath(item: index, section: 0)
                let cell: GithubRepoCell = tableView.dequeueReusableCell(for: indexPath)
                cell.setContentForCell(repo)
                return cell
            }
            .disposed(by: rx.disposeBag)
        
        output.selected
            .drive()
            .disposed(by: rx.disposeBag)
        
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
    }
}

extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = StoryBoards.main
}
