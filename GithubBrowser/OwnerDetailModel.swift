//
//  UserDetailModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

protocol OwnerModel {
    var detail: OwnerProfile? { get }
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void)
}

class OwnerDetailModel: OwnerModel {
    
    var detail: OwnerProfile?
    var repository: Repository
    init(userProfile: OwnerProfile, repository: Repository) {
        detail = userProfile
        self.repository = repository
    }
    
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void) {
        repository.getRepositories(user: user, completion: completion)
    }
    
}
