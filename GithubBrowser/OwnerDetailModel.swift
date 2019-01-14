//
//  UserDetailModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

public protocol OwnerModel {
    var detail: OwnerProfile? { get }
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void)
}

public class OwnerDetailModel: OwnerModel {
    
    public var detail: OwnerProfile?
    var repository: Repository
    public init(userProfile: OwnerProfile, repository: Repository) {
        detail = userProfile
        self.repository = repository
    }
    
    public func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void) {
        repository.getRepositories(user: user, completion: completion)
    }
    
}
