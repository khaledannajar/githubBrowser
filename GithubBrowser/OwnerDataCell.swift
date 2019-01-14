//
//  UserDataCell.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class OwnerDataCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var ownerAvatarImageView: UIImageView!
    
    var item: OwnerProfile? {
        didSet {
            nameLabel.text = item?.name ?? "Unknown"
            emailLabel.text = item?.email ?? "Unknown"
            configureImageView()
        }
    }
    
    func configureImageView() {
        let avatarUrl = item?.avatarUrl
        let happyPlaceHolder = UIImage(named: "happy")
        ownerAvatarImageView.setImageOfUrlStr(str: avatarUrl, placeHolder: happyPlaceHolder)
    }
}
