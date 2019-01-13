//
//  UIImageViewExtension.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/13/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImageOfUrlStr(str:String?, placeHolder:UIImage? = nil) {
        var phImg = UIImage.getImageWithColor(color: UIColor.cloudyBlue, size: frame.size)
        if let url = str {
            if let url = URL(string: url) {
                let resource = ImageResource(downloadURL: url)
                let placeHolder = placeHolder != nil ? placeHolder : phImg
                kf.setImage(with: resource, placeholder: placeHolder, options: [.transition(.fade(0.3))])
            }
        } else if let ph = placeHolder {
            phImg = ph
            self.image = phImg
        } else {
            self.image = phImg
        }
    }
}
