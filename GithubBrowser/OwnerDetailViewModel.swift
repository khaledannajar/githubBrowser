//
//  UserDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

enum OwnerDetailCellType {
    case userCell, repoCell
}

class OwnerDetailViewModel: OwnerDetailViewModelContract {
 
    weak var viewDelegate: OwnerDetailViewModelViewDelegate?
    weak var coordinatorDelegate: OwnerDetailViewModelCoordinatorDelegate?
    var repos: [CodeRepository]?
    
    var model: OwnerModel? {
        didSet {
            viewDelegate?.detailDidChange(viewModel: self)
            if let name = model?.detail?.login {
               self.getRepositories(name: name)
            }
        }
    }
    func getRepositories(name: String) {
        model?.getRepositories(user: name, completion: { [weak self] (repos, error) in
            self?.repos = repos
            self?.viewDelegate?.repositoriesLoaded(viewModel: self!)
        })
    }
    var detail: OwnerProfile? { return model?.detail }
    var avatarUrl: String? { return detail?.avatarUrl }
    
    func done() {
        coordinatorDelegate?.detailViewModelDidEnd(self)
    }
    
    var numberOfItems: Int {
        if let items = repos {
            return items.count
        }
        return 0
    }
    
    func itemAtIndex(_ index: Int) -> CodeRepository? {
        if let items = repos , items.count > index {
            return items[index]
        }
        return nil
    }
    var title: String {
        return model?.detail?.name ?? "Owner details"
    }
    
    
    func getViewType(indexPath: IndexPath) -> OwnerDetailCellType {
        if indexPath.section == 0 {
            return .userCell
        }
        return .repoCell
    }
}
