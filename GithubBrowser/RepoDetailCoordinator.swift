//
//  DetailCoordinator.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

protocol DetailCoordinatorDelegate: class
{
    func detailCoordinatorDidFinish(detailCoordinator: RepoDetailCoordinator)
}

class RepoDetailCoordinator: Coordinator
{
    weak var delegate: DetailCoordinatorDelegate?
    let dataItem: CodeRepository
    let repository: Repository
    var window: UIWindow
    var repoDetailVC: RepoDetailsVC?
    
    init(window: UIWindow, dataItem: CodeRepository,  repository: Repository)
    {
        self.window = window
        self.dataItem = dataItem
        self.repository = repository
    }
    
    func start()
    {
        repoDetailVC = Storyboards.Main.viewController(viewControllerClass: RepoDetailsVC.self)
        let viewModel =  RepoDetailViewModel()
        viewModel.model = RepoDetailModel(detailItem: dataItem)
        viewModel.coordinatorDelegate = self
        repoDetailVC?.viewModel = viewModel
        window.rootViewController = repoDetailVC
        
    }
}

extension RepoDetailCoordinator: DetailViewModelCoordinatorDelegate
{
    
    func detailViewModelDidEnd(_ viewModel: RepoDetailViewModelContract)
    {
        delegate?.detailCoordinatorDidFinish(detailCoordinator: self)
    }
    func showOwnerProfile(owner: OwnerProfile) {
        //TODO: fix this
        let ownerDetailCoordinator = OwnerDetailCoordinator(window: window, dataItem: owner, repository: repository)
        ownerDetailCoordinator.delegate = self
        ownerDetailCoordinator.start()
    }
}


extension RepoDetailCoordinator: OwnerDetailCoordinatorDelegate {
    func detailCoordinatorDidFinish(detailCoordinator: OwnerDetailCoordinator) {
        window.rootViewController = repoDetailVC
    }
}
