//
//  AlertContent.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 22.02.2021.
//

import UIKit

struct Action {
    let action: UIAlertAction
    
    init(title: String, method: @escaping () -> Void) {
        let action = UIAlertAction(title: title, style: .default) { (_) in
            method()
        }
        self.action = action
    }
}
