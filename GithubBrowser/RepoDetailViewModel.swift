//
//  RepoDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

class RepoDetailViewModel: RepoDetailViewModelContract {
    weak var viewDelegate: DetailViewModelViewDelegate?
    weak var coordinatorDelegate: DetailViewModelCoordinatorDelegate?
    
    var repoAttributes = [Pair]()
    private(set) var detail: CodeRepository? {
        didSet {
            repoAttributes = calculateAttributes(detail: detail)
            viewDelegate?.detailDidChange(viewModel: self)
        }
    }
    
    func calculateAttributes(detail: CodeRepository?) -> [Pair] {
        var attributes = [Pair]()
        
        if let avatarUrl = detail?.userProfile?.avatarUrl {
            attributes.append(Pair(title: Pair.Keys.avatar, value: avatarUrl))
        }
        if let ownerName = detail?.userProfile?.name {
            attributes.append(Pair(title: Pair.Keys.ownerName, value: ownerName))
        }
        if let email = detail?.userProfile?.email {
            attributes.append(Pair(title: Pair.Keys.email, value: email))
        }
        if let forksCount = detail?.forks {
            attributes.append(Pair(title: Pair.Keys.forksCount, value: "\(forksCount)"))
        }
        if let language = detail?.language {
            attributes.append(Pair(title: Pair.Keys.language, value: language))
        }
        
        if let defaultBranch = detail?.defaultBranch {
            attributes.append(Pair(title: Pair.Keys.defaultBranch, value: defaultBranch))
        }
        return attributes
    }
    
    var model: DetailModel? {
        didSet {
            model?.detail({ (item) in
                self.detail = item
            })
        }
    }
    
    var title: String {
        return detail?.name ?? "Repository details"
    }
    
    var numberOfItems: Int {
        return repoAttributes.count
    }
    
    func useItemAt(index: Int) {
        if repoAttributes.count > index {
           let item = repoAttributes[index]
            if item.title == Pair.Keys.avatar && detail?.userProfile != nil {
                coordinatorDelegate?.showOwnerProfile(owner: detail!.userProfile!)
            }
        }
    }
    
    func itemAtIndex(_ index: Int) -> Pair? {
        if repoAttributes.count > index {
            return repoAttributes[index]
        }
        return nil
    }
    
    func done() {
        coordinatorDelegate?.detailViewModelDidEnd(self)
    }
    
    func showOwnerProfile() {
        if let owner = self.detail?.userProfile {
            coordinatorDelegate?.showOwnerProfile(owner: owner)
        }
    }
}
