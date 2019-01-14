//
//  OwnerDetailCoordinator.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

protocol OwnerDetailCoordinatorDelegate: class
{
    func detailCoordinatorDidFinish(detailCoordinator: OwnerDetailCoordinator)
}

class OwnerDetailCoordinator: Coordinator {
    weak var delegate: OwnerDetailCoordinatorDelegate?
    let dataItem: OwnerProfile
    let repository: Repository
    var navController: UINavigationController
    
    init(navController: UINavigationController, dataItem: OwnerProfile, repository: Repository)
    {
        self.navController = navController
        self.dataItem = dataItem
        self.repository = repository
    }
    
    func start() {
        let vc = Storyboards.Main.viewController(viewControllerClass: OwnerDetailsVC.self)
        let viewModel = OwnerDetailViewModel()
        viewModel.model = OwnerDetailModel(userProfile: dataItem, repository: repository)
        viewModel.coordinatorDelegate = self
        vc.viewModel = viewModel
        navController.pushViewController(vc, animated: true)
    }
}

extension OwnerDetailCoordinator: OwnerDetailViewModelCoordinatorDelegate {
    func detailViewModelDidEnd(_ viewModel: OwnerDetailViewModelContract) {
        delegate?.detailCoordinatorDidFinish(detailCoordinator: self)
    }
}
