//
//  Remote.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation
import Alamofire
class Remote: RemoteContext {
    
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void) {
        let requestConverter = Router.User(user).getUserRepositories(params: "", httpHeaders: httpHeaders())
        doRequest(request: requestConverter) { (model:[CodeRepository]?, error) in
            completion(model, error)
        }
    }
    
    func getProfile(user: String, completion: @escaping (UserProfile?, Error?) -> Void) {
        let requestConverter = Router.User.get(params: user, queryItems: nil)
        doRequest(request: requestConverter) { (model:UserProfile?, error) in
            completion(model, error)
        }
    }
    
    func searchRepositories(params: SearchParams, completion: @escaping (SearchResults?, Error?) -> Void) {
        let pageSize = params.pagable.pageSize
        let pageNo = params.pagable.pageNo
        let queryItems = [ URLQueryItem(name: "q", value: params.searchToken), URLQueryItem(name: "per_page", value: "\(pageSize)"),  URLQueryItem(name: "page", value: "\(pageNo)") ]
        let requestConverter = Router.SearchRepositories.get(params: "", queryItems: queryItems)
        doRequest(request: requestConverter) { (model:SearchResults?, error) in
            completion(model, error)
        }
    }
}
