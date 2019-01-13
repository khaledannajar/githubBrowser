//
//  Pageable.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

struct Pageable {
    let pageSize: Int
    let pageNo: Int
    init(pageSize: Int, pageNo: Int) {
        self.pageSize = pageSize
        self.pageNo = pageNo
    }
}
