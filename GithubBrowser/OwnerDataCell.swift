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
    @IBOutlet weak var ownerImageView: UIImageView!
    
    var item: OwnerProfile? {
        didSet {
            nameLabel.text = item?.name ?? "Unknown"
            emailLabel.text = item?.email ?? "Unknown"
            let avatarUrl = item?.avatarUrl
            let happyPlaceHolder = UIImage(named: "github4")
            ownerImageView.setImageOfUrlStr(str: avatarUrl, placeHolder: happyPlaceHolder)
        }
    }
}
