//
//  AppCoordinator.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator
{
    fileprivate let LIST_KEY: String  = "List"
    
    var rootControler: UINavigationController
    var coordinators = [String:Coordinator]()
    let repository: Repository = Remote()
    
    init(navController: UINavigationController) {
        self.rootControler = navController
    }
    
    func start() {
        showList()
    }
}

extension AppCoordinator: SearchCoordinatorDelegate
{
    func showList()
    {
        let listCoordinator = SearchCoordinator(navController: rootControler, repository: repository)
        coordinators[LIST_KEY] = listCoordinator
        listCoordinator.delegate = self
        listCoordinator.start()
    }
    
    func listCoordinatorDidFinish(listCoordinator: SearchCoordinator)
    {
        coordinators[LIST_KEY] = nil
    }
}
