//
//  SearchParams.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

struct SearchParams {
    let searchToken: String
    let pagable: Pageable
    init(searchToken: String, pagable: Pageable) {
        self.searchToken = searchToken
        self.pagable = pagable
    }
}
