//
//  Utils.swift
//  GithubBrowser
//
//  Created by khaledannajar on 1/14/19.
//  Copyright © 2019 khaledannajar. All rights reserved.
//

import UIKit

class Utils {
    static func showError(vc: UIViewController, title: String = "", message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) in
            // dismiss
        }
        alert.addAction(action)
        if vc.presentedViewController == nil {
            vc.present(alert, animated: true, completion: nil)
        } else{
            vc.dismiss(animated: false) { () -> Void in
                vc.present(alert, animated: true, completion: nil)
            }
        }
    }
}
