//
//  UserDetailsVC.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/12/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class OwnerDetailsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    private var isLoaded: Bool = false

    var viewModel: OwnerDetailViewModelContract? {
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
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            viewModel?.done()
        }
    }
}


extension OwnerDetailsVC: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        
        return 0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RightDetailCell", for: indexPath)
        let item = viewModel?.itemAtIndex(indexPath.row)
        cell.textLabel?.text = item?.name
        cell.detailTextLabel?.text = item?.language
        return cell
    }
}

extension OwnerDetailsVC: OwnerDetailViewModelViewDelegate {
    func detailDidChange(viewModel: OwnerDetailViewModelContract) {
        refreshDisplay()
    }
    func repositoriesLoaded(viewModel: OwnerDetailViewModelContract) {
        refreshDisplay()
    }
}
extension OwnerDetailsVC: RepoTableViewCellDelegate {
    func pressedImage(repo: CodeRepository) {
        // do nothing
    }
}
