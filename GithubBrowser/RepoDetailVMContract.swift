//
//  RepoDetailViewModelContract.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

protocol DetailViewModelViewDelegate: class
{
    func detailDidChange(viewModel: RepoDetailViewModelContract)
}


protocol DetailViewModelCoordinatorDelegate: class
{
    func detailViewModelDidEnd(_ viewModel: RepoDetailViewModelContract)
    func showOwnerProfile(owner: UserProfile)
}

protocol RepoDetailViewModelContract
{
    var model: DetailModel? { get set }
    var viewDelegate: DetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: DetailViewModelCoordinatorDelegate? { get set}
    var detail: CodeRepository? { get }
    func done()
    func showOwnerProfile()
}
