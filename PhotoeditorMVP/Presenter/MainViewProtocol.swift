//
//  MainViewProtocol.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 26.02.2021.
//

import UIKit

protocol MainViewProtocol {
    
    var rotateImageButtonTapHandler: (() -> Void)? { get set}
    var bwImageButtonTapHandler: (() -> Void)? { get set}
    var mirrorImageButtonTapHandler: (() -> Void)? { get set}
    var showAlertHandler: (() -> Void)? { get set}
    var imageTapAlert: UIAlertController! { get set}
    
    func setAlertContent(alert: UIAlertController)
    func setImage(newImage: UIImage?)
    func getImage() -> UIImage?
    func updateImageCollection(images: [UIImage])
}
