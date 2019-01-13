//
//  UserDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

protocol UserDetailViewModelViewDelegate: class
{
    func detailDidChange(viewModel: RepoDetailViewModelContract)
}


protocol UserDetailViewModelCoordinatorDelegate: class
{
    func detailViewModelDidEnd(_ viewModel: RepoDetailViewModelContract)
    func showOwnerProfile(owner: UserProfile)
}

protocol UserDetailViewModel
{
    var model: DetailModel? { get set }
    var viewDelegate: UserDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: UserDetailViewModelCoordinatorDelegate? { get set}
    var detail: UserProfile? { get }
    func done()
    func showOwnerProfile()
}
