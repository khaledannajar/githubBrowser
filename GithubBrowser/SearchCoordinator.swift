//
//  ListCoordinator.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

protocol SearchCoordinatorDelegate: class
{
    func listCoordinatorDidFinish(listCoordinator: SearchCoordinator)
}

class SearchCoordinator: Coordinator
{
    weak var delegate: SearchCoordinatorDelegate?
    var detailCoordinator: RepoDetailCoordinator?
    var window: UIWindow
    var repository: Repository
    var searchVC: SearchVC?
    
    init(window: UIWindow, repository: Repository)
    {
        self.window = window
        self.repository = repository
    }
    func start() {
        searchVC = Storyboards.Main.viewController(viewControllerClass: SearchVC.self)
        let viewModel =  MVVMCListViewModel()
        viewModel.model = repository
        viewModel.coordinatorDelegate = self
        searchVC?.viewModel = viewModel
        window.rootViewController = searchVC
    }
}

extension SearchCoordinator: ListViewModelCoordinatorDelegate {
    func listViewModelDidSelectRepo(_ viewModel: ListViewModel, data: CodeRepository) {
        detailCoordinator = RepoDetailCoordinator(window: window, dataItem: data)
        detailCoordinator?.delegate = self
        detailCoordinator?.start()
    }
    
    func listViewModelDidSelectUser(_ viewModel: ListViewModel, data: UserProfile) {
//        TODO:open user profile coordinator
    }
    
    
}

extension SearchCoordinator: DetailCoordinatorDelegate
{
    func detailCoordinatorDidFinish(detailCoordinator: RepoDetailCoordinator)
    {
        self.detailCoordinator = nil
        window.rootViewController = searchVC
    }
}
