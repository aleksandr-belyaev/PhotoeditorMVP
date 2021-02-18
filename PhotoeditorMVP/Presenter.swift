//
//  Presenter.swift
//  PhotoeditorMVP
//
//  Created by Александр Беляев on 13.02.2021.
//

import Foundation

class Presenter {
    var viewController: ViewController
    var imageRedactor = ImageRedactor()
    var data: Model
    
    init(editorView: ViewController) {
        self.viewController = editorView
        let data = Model()
        self.data = data
        self.viewController.mainStackView.rotateImageButtonTapHandler = { [weak self] in
            self?.rotateImageButtonTapped()
        }
        self.viewController.mainStackView.bwImageButtonTapHandler = { [weak self] in
            self?.bwButtonTapped()
        }
        self.viewController.mainStackView.mirrorImageButtonTapHandler = { [weak self] in
            self?.mirrorImageButtonTapped()
        }
        self.viewController.mainStackView.showAlertHandler = { [weak self] in
            self?.showAlert()
        }
        self.viewController.mainStackView.clearImageHandler = { [weak self] in
            self?.clearImageButtonTapped()
        }
        self.viewController.mainStackView.setImageHandler = { [weak self] in
            self?.setImageButtonTapped()
        }
        self.viewController.mainStackView.saveImageHandler = { [weak self] in
            self?.saveImageButtonTapped()
        }
    }
    
    func rotateImageButtonTapped() {
        if let image = self.viewController.mainStackView.imageView.image {
            self.viewController.mainStackView.imageView.image = image.rotateImage(radians: .pi/2)
        }
    }
    
    func bwButtonTapped() {
        if let image = self.viewController.mainStackView.imageView.image {
            self.viewController.mainStackView.imageView.image = image.grayscaleImage()
        }
    }
    
    func mirrorImageButtonTapped() {
        if let image = self.viewController.mainStackView.imageView.image {
            self.viewController.mainStackView.imageView.image = imageRedactor.mirrorImage(image: image)
        }
    }
    
    func showAlert() {
        self.viewController.present(self.viewController.mainStackView.imageTapAlert, animated: true)
    }
    
    func clearImageButtonTapped() {
        self.viewController.mainStackView.imageView.image = nil
    }
    
    func setImageButtonTapped() {
        self.viewController.mainStackView.imageView.image = imageRedactor.setDefaultImage()
    }
    
    func saveImageButtonTapped() {
        if let image = self.viewController.mainStackView.imageView.image {
            data.savedImages.append(image)
            self.viewController.mainStackView.imageCollection.images = data.savedImages
            self.viewController.mainStackView.imageCollection.reloadData()
        }
    }
}
