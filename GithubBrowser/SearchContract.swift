//
//  SearchContract.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

public protocol ListViewModelViewDelegate: class
{
    func itemsDidChange(viewModel: ListViewModel)
    func errorMessageDidChange(_ viewModel: ListViewModel)
}

public protocol ListViewModelCoordinatorDelegate: class
{
    func listViewModelDidSelectRepo(_ viewModel: ListViewModel, data: CodeRepository)
    func listViewModelDidSelectUser(_ viewModel: ListViewModel, data: OwnerProfile)
}

public protocol ListViewModel {
    var model: Repository? { get set }
    var viewDelegate: ListViewModelViewDelegate? { get set }
    var coordinatorDelegate: ListViewModelCoordinatorDelegate? { get set}
    
    var title: String { get }
    var errorMessage: String? { get }
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> CodeRepository?
    func useItemAtIndex(_ index: Int)
    func useOwnerProfile(owner: OwnerProfile)
    func search(token: String)
    func getNext()
}

public protocol ListModel
{
    func searchRepositories(params: SearchParams, completion: @escaping (SearchResults?, Error?) -> Void)
}

