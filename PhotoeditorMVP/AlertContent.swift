//
//  AlertContent.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 22.02.2021.
//

import UIKit

struct AlertContent {
    let action: UIAlertAction
    
    init(title: String, method: (() -> Void)?) {
        self.action = UIAlertAction(title: title, style: .default) {
            (_) in method
        }
    }
}
