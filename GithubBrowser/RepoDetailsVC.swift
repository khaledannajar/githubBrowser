//
//  RepoDetailsVC.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/12/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class RepoDetailsVC: UIViewController {
    
//    @IBOutlet weak var repoNameLabel: UILabel!
//    @IBOutlet weak var ownerUsernameLabel: UILabel!
//    @IBOutlet weak var avatarImageView: UIImageView!
//    @IBOutlet weak var emailLabel: UILabel!
//    @IBOutlet weak var forkCountLabel: UILabel!
//    @IBOutlet weak var languageLabel: UILabel!
//    @IBOutlet weak var defaultBranchLabel: UILabel!
    
    private var isLoaded: Bool = false
    
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
        isLoaded = true;
        refreshDisplay()
        configureImageView()
    }
    
    fileprivate func refreshDisplay() {
        guard isLoaded else { return }
//        repoNameLabel.text = viewModel?.detail?.name ?? ""
//        ownerUsernameLabel.text = viewModel?.detail?.userProfile?.name ?? ""
    }
    
    func configureImageView() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAvatarImageView(sender:)))
//        avatarImageView.isUserInteractionEnabled = true
//        avatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func didTapAvatarImageView(sender: Any) {
        viewModel?.showOwnerProfile()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            viewModel?.done()
        }
    }
}

extension RepoDetailsVC: DetailViewModelViewDelegate {
    func detailDidChange(viewModel: RepoDetailViewModelContract) {
        refreshDisplay()
    }
}

