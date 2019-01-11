//
//  Router.swift
//  jirah
//
//  Created by khaledannajar on 3/8/18.
//
// Source of this file
// https://github.com/chaione/RoutableApp
// https://chaione.com/blog/routers-swift-protocol-oriented-1/
// https://chaione.com/blog/routers-swift-protocol-oriented-programming-pt-2/

import Foundation

struct Router: URLRouter {
    static var basePath: String {
        return "https://api.github.com/"
    }
    
    struct User: Readable {
        var urlParams: String!
        var route: String = "users"
    }
    struct Repositories: Readable {
        var urlParams: String!
        var route: String = "repos"
    }
    struct SearchRepositories: Readable {
        var urlParams: String!
        var route: String = "search/repositories"
    }
    
}

extension Router.User {
    func getUserRepositories(params: String, httpHeaders: [String : String]?) -> RequestConverterProtocol {
        let child = Router.Repositories.get(params:params, httpHeaders:httpHeaders, queryItems: nil)
        let route = nestedRoute(args: urlParams, child: child)
        return route
    }
}
