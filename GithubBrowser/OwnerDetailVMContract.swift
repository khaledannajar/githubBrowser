//
//  UserDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

public protocol OwnerDetailViewModelViewDelegate: class
{
    func detailDidChange(viewModel: OwnerDetailViewModelContract)
    func repositoriesLoaded(viewModel: OwnerDetailViewModelContract)
    func errorMessageDidChange(_ viewModel: ListViewModel)
}


public protocol OwnerDetailViewModelCoordinatorDelegate: class
{
    func detailViewModelDidEnd(_ viewModel: OwnerDetailViewModelContract)
}

public protocol OwnerDetailViewModelContract
{
    var model: OwnerModel? { get set }
    var viewDelegate: OwnerDetailViewModelViewDelegate? { get set }
    var coordinatorDelegate: OwnerDetailViewModelCoordinatorDelegate? { get set}
    var errorMessage: String? { get }
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> CodeRepository?
    var title: String { get }
    var detail: OwnerProfile? { get }
    var avatarUrl: String? { get }
    func done()
}
