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
    var ownerDetailCoordinator: OwnerDetailCoordinator?
    var repository: Repository
    var searchVC: SearchVC?
    var navController: UINavigationController
    
    init(navController: UINavigationController, repository: Repository)
    {
        self.navController = navController
        self.repository = repository
    }
    func start() {
        searchVC = Storyboards.Main.viewController(viewControllerClass: SearchVC.self)
        let viewModel =  SearchViewModel()
        viewModel.model = repository
        viewModel.coordinatorDelegate = self
        searchVC?.viewModel = viewModel
        navController.viewControllers = [searchVC!]
    }
}

extension SearchCoordinator: ListViewModelCoordinatorDelegate {
    func listViewModelDidSelectRepo(_ viewModel: ListViewModel, data: CodeRepository) {
        detailCoordinator = RepoDetailCoordinator(navController: navController, dataItem: data, repository: repository)
        detailCoordinator?.delegate = self
        detailCoordinator?.start()
    }
    
    func listViewModelDidSelectUser(_ viewModel: ListViewModel, data: OwnerProfile) {
        ownerDetailCoordinator = OwnerDetailCoordinator(navController: navController, dataItem: data, repository: repository)
        ownerDetailCoordinator?.delegate = self
        ownerDetailCoordinator?.start()
    }
    
}

extension SearchCoordinator: DetailCoordinatorDelegate
{
    func detailCoordinatorDidFinish(detailCoordinator: RepoDetailCoordinator)
    {
        self.detailCoordinator = nil
    }
}
extension SearchCoordinator: OwnerDetailCoordinatorDelegate {
    func detailCoordinatorDidFinish(detailCoordinator: OwnerDetailCoordinator) {
        self.ownerDetailCoordinator = nil
    }
}
