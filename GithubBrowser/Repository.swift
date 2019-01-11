//
//  Repository.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

protocol Repository {
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void)
    func getProfile(user: String, completion: @escaping (UserProfile?, Error?) -> Void)
    func searchRepositories(params: SearchParams, completion: @escaping (SearchResults?, Error?) -> Void)
}
