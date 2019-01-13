//
//  RepoTableViewCell.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

protocol RepoTableViewCellDelegate: class {
    func pressedImage(repo: CodeRepository)
}

class RepoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repoNameLabel: UILabel!
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    
    weak var delegate: RepoTableViewCellDelegate?
    
    var item: CodeRepository? {
        didSet {
            repoNameLabel.text = item?.name ?? "Unknown"
            ownerNameLabel.text = item?.userProfile?.name ?? "Unknown"
            let avatarUrl = item?.userProfile?.avatarUrl
            let happyPlaceHolder = UIImage(named: "happy")
            ownerAvatarImageView.setImageOfUrlStr(str: avatarUrl, placeHolder: happyPlaceHolder)
        }
    }
    func configureImageView() {
        ownerAvatarImageView.isUserInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAvatarImageView(sender:)))
                ownerAvatarImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc func didTapAvatarImageView(sender: Any) {
        if let item = item {
            delegate?.pressedImage(repo: item)
        }
    }
}

