//
//  ViewableAttribute.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

public struct Pair {
    var title: String
    var value: String
    public init(title: String, value: String) {
        self.title = title
        self.value = value
    }
    
    struct Keys {
        static let name = "Name"
        static let avatar = "Avatar"
        static let ownerName = "Owner"
        static let email = "Email"
        static let forksCount = "Forks count"
        static let language = "Language"
        static let defaultBranch = "Default branch"
    }
}
