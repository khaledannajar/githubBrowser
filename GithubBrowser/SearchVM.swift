//
//  SearchVM.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation


class MVVMCListViewModel: ListViewModel {
    
    let pageSize = 10
    var pageNo = 1
    var searchToken = ""
    var searchResults: SearchResults?
    
    /// The view itself: SearchVC
    weak var viewDelegate: ListViewModelViewDelegate? {
        willSet {
            
        }
    }
    weak var coordinatorDelegate: ListViewModelCoordinatorDelegate?
    
    fileprivate var items: [CodeRepository]? {
        didSet {
            viewDelegate?.itemsDidChange(viewModel: self)
        }
    }
    
    var model: Repository? {
        didSet {
            items = nil;
        }
    }
    
    
    var title: String {
        return "Search"
    }
    
    var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    
    func itemAtIndex(_ index: Int) -> CodeRepository?
    {
        if let items = items , items.count > index {
            return items[index]
        }
        return nil
    }
    
    func useItemAtIndex(_ index: Int)
    {
        if let items = items, let coordinatorDelegate = coordinatorDelegate  , index < items.count {
            coordinatorDelegate.listViewModelDidSelectRepo(self, data: items[index])
        }
    }
    
    func useOwnerProfile(owner: OwnerProfile) {
        coordinatorDelegate?.listViewModelDidSelectUser(self, data: owner)
    }
    
    func search(token: String) {
        self.searchToken = token
        pageNo = 1
        doSearch()
    }
    
    func getNext() {
        guard let repos = searchResults?.repos, let totalCount = searchResults?.totalCount, repos.count < totalCount else {
            return
        }
        // view.showLoadmoreIndicator()
        pageNo = pageNo + 1
        doSearch()
    }
    
    func doSearch() {
        guard searchToken.count > 0 else {
            debugPrint("Search token is empty")
            return
        }
        let pagable = Pageable(pageSize: pageSize, pageNo: pageNo)
        let params = SearchParams(searchToken: searchToken, pagable: pagable)
        model?.searchRepositories(params: params, completion: { [weak self] (searchResults, error) in
            if let searchResults = searchResults {
                let isFirstPage = self?.pageNo == 1
                if isFirstPage {
                    self?.searchResults = searchResults
                    self?.items = searchResults.repos
                } else {
                    if let oldResults = self?.searchResults, let _ = oldResults.repos, let newRepos = searchResults.repos {
                        self?.searchResults?.repos?.append(contentsOf: newRepos)
                        self?.items = self?.searchResults?.repos
                    }
                }
            } else if let error = error {
                self?.viewDelegate?.errorMessageDidChange(self!, message: error.localizedDescription)
            } else {
                // error not known
                debugPrint("Unknown error in searchRepositories")
            }
        })
    }
}
