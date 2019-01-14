//
//  RepoDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

class RepoDetailViewModel: RepoDetailViewModelContract
{
    weak var viewDelegate: DetailViewModelViewDelegate?
    weak var coordinatorDelegate: DetailViewModelCoordinatorDelegate?
    
    private(set) var detail: CodeRepository? {
        didSet {
            viewDelegate?.detailDidChange(viewModel: self)
        }
    }
    
    var model: DetailModel? {
        didSet {
            model?.detail({ (item) in
                self.detail = item
            })
        }
    }
    
    func done() {
        coordinatorDelegate?.detailViewModelDidEnd(self)
    }
    func showOwnerProfile() {
        if let owner = self.detail?.userProfile {
            //TODO: show user details view
//            coordinatorDelegate?.showOwnerProfile(owner)
        }
    }
}
