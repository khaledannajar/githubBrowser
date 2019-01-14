//
//  ViewController.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/11/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var isLoaded: Bool = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var viewModel: ListViewModel? {
        willSet {
            viewModel?.viewDelegate = nil
        }
        didSet {
            viewModel?.viewDelegate = self
            refreshDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.contentInset = UIEdgeInsets.init(top: 20, left: 0, bottom: 0, right: 0)
        hideLoadingView()
        isLoaded = true
        refreshDisplay();
    }

    func refreshDisplay() {
        title = viewModel?.title ?? ""
        if isLoaded && viewModel != nil {
            self.tableView.reloadData()
        }
    }
    
    func hideLoadingView() {
        loadingView.isHidden = true
        loadingView.stopAnimating()
    }
    func showLoadingView() {
        loadingView.isHidden = false
        loadingView.startAnimating()
    }
    
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell", for: indexPath) as! RepoTableViewCell
        cell.item = viewModel?.itemAtIndex(indexPath.row)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.useItemAtIndex((indexPath as NSIndexPath).row)
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastElement = viewModel!.numberOfItems - 1
        if indexPath.row == lastElement {
            viewModel?.getNext()
        }
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchToken = searchBar.text {
            viewModel?.search(token: searchToken)
            searchBar.resignFirstResponder()
            showLoadingView()
        }
    }
}

extension SearchVC: ListViewModelViewDelegate {
    func itemsDidChange(viewModel: ListViewModel) {
        tableView.reloadData()
        hideLoadingView()
    }
    func errorMessageDidChange(_ viewModel: ListViewModel) {
        
        //TODO: show error message
        debugPrint(viewModel.errorMessage)
        hideLoadingView()
    }
}

extension SearchVC: RepoTableViewCellDelegate {
    func pressedImage(repo: CodeRepository) {
        if let owner = repo.userProfile {
            viewModel?.useOwnerProfile(owner: owner)
        }
    }
}

