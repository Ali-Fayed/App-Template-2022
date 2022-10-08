//
//  UIVC+Ext.swift
//  App Template
//
//  Created by AliFayed on 08/10/2022.
//

import UIKit
extension UIViewController {
    func presentAlert(title: String, message: String, btnTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: btnTitle, style: .default)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
