//
//  AlertContent.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 22.02.2021.
//

import UIKit

struct Actions {
    let action: UIAlertAction
    
    init(title: String, method: (() -> Void)?) {
        let action = UIAlertAction(title: title, style: .default) { (_) in
            method!()
        }
        self.action = action
    }
}

class Alert {
    var alertController: UIAlertController
    
    init(title: String, actions: [Actions]) {
        let imageTapAlert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        for alert in actions {
            imageTapAlert.addAction(alert.action)
        }
        self.alertController = imageTapAlert
    }
}
