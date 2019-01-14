//
//  GithubBrowserTests.swift
//  GithubBrowserTests
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import XCTest
import GithubBrowser

class SearchViewModelTests: XCTestCase {
    
    var vm: SearchViewModel!
    var currentExpectaion: XCTestExpectation?
    let testMessageForUseItemAtZeroIndex = "test Use One Item At Zero Index"
    
    override func setUp() {
        vm = SearchViewModel()
    }
    override func tearDown() {
        vm = nil
    }
    
    func testInitialState() {
        XCTAssertEqual(0,vm.numberOfItems)
        XCTAssertEqual("Search", vm.title)
        XCTAssertNil(vm.viewDelegate)
        XCTAssertNil(vm.model)
        XCTAssertNil(vm.coordinatorDelegate)
    }

    func testNumberOfItemsZeroOnEmptyResult() {
        let dummyModel = DummySearchModel()
        vm.model = dummyModel
        dummyModel.searchResults = nil
        vm.search(token: "forced empty list")
        XCTAssertEqual(0,vm.numberOfItems)
    }
    func testNumberOfItemsOne() {
        let dummyModel = DummySearchModel()
        vm.model = dummyModel
        let searchResult = SearchResults()
        searchResult.repos = [CodeRepository()]
        dummyModel.searchResults = searchResult
        vm.search(token: "forced one item list")
        XCTAssertEqual(1,vm.numberOfItems)
    }
    func testErrorMessageIsSet() {
        let dummyModel = DummySearchModel()
        let message = "dummy error message"
        let error = NSError(domain: "domain", code: 11123, userInfo: [NSLocalizedDescriptionKey: message])
        dummyModel.error = error
        vm.model = dummyModel
        vm.search(token: "forced error token")
        XCTAssertEqual(message, vm.errorMessage)
    }
    
    func testOneItemAtZeroIndex() {
        let dummyModel = DummySearchModel()
        vm.model = dummyModel
        let name = "First repo test"
        dummyModel.searchResults = createSearchResultWithOneItem(name: name)
        vm.search(token: "forced one item list")
        let item = vm.itemAtIndex(0)
        XCTAssertEqual(item?.name, name)
    }
    
    func testUseOneItemAtZeroIndex() {
        let dummyModel = DummySearchModel()
        vm.model = dummyModel
        let name = testMessageForUseItemAtZeroIndex
        dummyModel.searchResults = createSearchResultWithOneItem(name: name)
        vm.search(token: "forced one item list")
        vm.coordinatorDelegate = self
        currentExpectaion =  expectation(description: name)
        vm.useItemAtIndex(0)
        waitForExpectations(timeout: 1) { (error) in
            self.vm.coordinatorDelegate = nil
        }
    }
}

extension SearchViewModelTests: ListViewModelCoordinatorDelegate {
    func listViewModelDidSelectRepo(_ viewModel: ListViewModel, data: CodeRepository) {
        XCTAssertEqual(testMessageForUseItemAtZeroIndex, data.name)
        currentExpectaion?.fulfill()
    }
    
    func listViewModelDidSelectUser(_ viewModel: ListViewModel, data: OwnerProfile) {
        
    }
}

// Helper
extension SearchViewModelTests {
    func createSearchResultWithOneItem(name: String) -> SearchResults {
        let searchResult = SearchResults()
        let repo = CodeRepository()
        repo.name = name
        searchResult.repos = [repo]
        return searchResult
    }
}

private class DummySearchModel: Repository {
    var searchResults: SearchResults?
    var error: Error?
    func searchRepositories(params: SearchParams, completion: @escaping (SearchResults?, Error?) -> Void) {
        completion(searchResults, error)
    }
    
    func getRepositories(user: String, completion: @escaping ([CodeRepository]?, Error?) -> Void) {}
    func getProfile(user: String, completion: @escaping (OwnerProfile?, Error?) -> Void) {}
}
