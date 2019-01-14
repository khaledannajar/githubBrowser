//
//  RepoDetailsVC.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/12/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class RepoDetailsVC: UIViewController {
    
    private var isLoaded: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RepoDetailViewModelContract? {
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
        
        isLoaded = true;
        refreshDisplay()
    }
    
    fileprivate func refreshDisplay() {
        guard isLoaded else { return }
        title = viewModel?.title ?? ""
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            viewModel?.done()
        }
    }
}

extension RepoDetailsVC: UITableViewDelegate, UITableViewDataSource
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
        let item = viewModel?.itemAtIndex(indexPath.row)
        if Pair.Keys.avatar == item?.title {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RepoDetailsOwnerCell", for: indexPath) as! RepoDetailsOwnerCell
            let placeHolder = UIImage(named: "github4")
            cell.avatarImage.setImageOfUrlStr(str: item?.value, placeHolder: placeHolder)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoDetailsCell", for: indexPath) as! RepoDetailsCell
        cell.attributeNameLabel.text = item?.title
        cell.attribureValueLabel.text = item?.value
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.useItemAt(index: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension RepoDetailsVC: DetailViewModelViewDelegate {
    func detailDidChange(viewModel: RepoDetailViewModelContract) {
        refreshDisplay()
    }
}

