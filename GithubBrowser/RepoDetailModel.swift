//
//  RepoDetailViewModel.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import Foundation

protocol DetailModel {
    func detail(_ completionHandler: @escaping (_ item: CodeRepository?) -> Void)
}

class RepoDetailModel: DetailModel {
    
    fileprivate var item: CodeRepository?
    
    init(detailItem: CodeRepository) {
        self.item = detailItem
    }
    
    func detail(_ completionHandler: @escaping (_ item: CodeRepository?) -> Void) {
        // Simulate Aysnchronous data access
        DispatchQueue.global().async {
            completionHandler(self.item)
        }
    }
}
