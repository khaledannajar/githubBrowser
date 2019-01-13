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
    var window: UIWindow
    
    init(window: UIWindow, dataItem: CodeRepository)
    {
        self.window = window
        self.dataItem = dataItem
    }
    
    func start()
    {
        let vc = Storyboards.Main.viewController(viewControllerClass: RepoDetailsVC.self)
        let viewModel =  RepoDetailViewModel()
        viewModel.model = RepoDetailModel(detailItem: dataItem)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        window.rootViewController = vc
        
    }
}

extension RepoDetailCoordinator: DetailViewModelCoordinatorDelegate
{
    
    func detailViewModelDidEnd(_ viewModel: RepoDetailViewModelContract)
    {
        delegate?.detailCoordinatorDidFinish(detailCoordinator: self)
    }
    func showOwnerProfile(owner: UserProfile) {
        //TODO: fix this
        let vc = Storyboards.Main.viewController(viewControllerClass: UserDetailsVC.self)
        window.rootViewController = vc
    }
}

